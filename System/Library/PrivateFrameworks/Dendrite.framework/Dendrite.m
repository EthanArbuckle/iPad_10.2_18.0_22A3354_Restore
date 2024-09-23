uint64_t sub_23A332A9C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DarwinNotificationPublisher()
{
  return objc_opt_self();
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
  sub_23A33338C(a1, &qword_25696BE60);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A332AF0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A332B10(uint64_t result, int a2, int a3)
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
  sub_23A33338C(a1, &qword_25696BE68);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_23A332B60(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[24])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_23A332BB4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for data_frame_header_t(uint64_t a1)
{
  sub_23A33338C(a1, &qword_25696BE70);
}

void type metadata accessor for WireTypes(uint64_t a1)
{
  sub_23A33338C(a1, (unint64_t *)&unk_25696BE78);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_23A33338C(a1, &qword_2542D0120);
}

uint64_t initializeBufferWithCopyOfBuffer for DataFrameStreamSegment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_23A332C70(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[32])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_23A332CC4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for data_frame_stream_segment_header_t(uint64_t a1)
{
  sub_23A33338C(a1, (unint64_t *)&unk_25696BE88);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_23A33338C(a1, &qword_2542D1150);
}

uint64_t sub_23A332D30(uint64_t a1, uint64_t a2)
{
  return sub_23A33328C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

BOOL sub_23A332D48(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_23A332D5C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23A332D6C(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23A332D80(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23A362BB0();
  *a2 = 0;
  return result;
}

uint64_t sub_23A332DF4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23A362BBC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23A332E70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23A362BC8();
  v2 = sub_23A362BA4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A332EB0(uint64_t a1, uint64_t a2)
{
  return sub_23A33328C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23A332EC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23A362BC8();
  v2 = v1;
  if (v0 == sub_23A362BC8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A362EE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23A332F4C()
{
  sub_23A33319C(&qword_25696BEC8, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_23A363B4C);
  sub_23A33319C(&qword_25696BED0, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_23A363AEC);
  return sub_23A362E98();
}

uint64_t sub_23A332FD0()
{
  sub_23A33319C(&qword_25696BF08, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363D20);
  sub_23A33319C((unint64_t *)&unk_25696BF10, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363C74);
  return sub_23A362E98();
}

uint64_t sub_23A333054@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23A362BA4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A333098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A362BC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A3330C0()
{
  sub_23A33319C(&qword_25696BED8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A363994);
  sub_23A33319C(&qword_25696BEE0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A363934);
  return sub_23A362E98();
}

uint64_t sub_23A333144()
{
  return sub_23A33319C(&qword_25696BE98, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A3638F8);
}

uint64_t sub_23A333170()
{
  return sub_23A33319C(&qword_25696BEA0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A3638CC);
}

uint64_t sub_23A33319C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B849AC0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A3331DC()
{
  return sub_23A33319C(&qword_25696BEA8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A363968);
}

uint64_t sub_23A333208()
{
  return sub_23A33319C(&qword_25696BEB0, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_23A363AB0);
}

uint64_t sub_23A333234()
{
  return sub_23A33319C(&qword_25696BEB8, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_23A363A84);
}

uint64_t sub_23A333260()
{
  return sub_23A33319C(&qword_25696BEC0, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_23A363B20);
}

uint64_t sub_23A33328C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23A362BC8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A3332C8()
{
  sub_23A362BC8();
  sub_23A362C34();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A333308()
{
  uint64_t v0;

  sub_23A362BC8();
  sub_23A362F34();
  sub_23A362C34();
  v0 = sub_23A362F64();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_23A33338C(a1, &qword_25696BEE8);
}

void sub_23A33338C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A3333D0()
{
  return sub_23A33319C(&qword_25696BEF0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363C38);
}

uint64_t sub_23A3333FC()
{
  return sub_23A33319C(&qword_25696BEF8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363C0C);
}

uint64_t sub_23A333428()
{
  return sub_23A33319C(&qword_25696BF00, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363CA8);
}

uint64_t StagingEntry.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t StagingEntry.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23A333494(v1, *(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t sub_23A333494(uint64_t a1, unint64_t a2)
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

uint64_t StagingEntry.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23A33350C(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_23A33350C(uint64_t a1, unint64_t a2)
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

uint64_t (*StagingEntry.payload.modify())()
{
  return nullsub_1;
}

uint64_t StagingEntry.init(id:payload:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t static DEStagingEntry.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall DEStagingEntry.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  v4 = (void *)sub_23A362BA4();
  -[objc_class encodeInt64:forKey:](with.super.isa, sel_encodeInt64_forKey_, v3, v4);

  v5 = (void *)sub_23A362A84();
  v6 = (id)sub_23A362BA4();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

}

id DEStagingEntry.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DEStagingEntry.init(coder:)(a1);
}

id DEStagingEntry.init(coder:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_23A336370(0, &qword_25696BF90);
  v4 = v1;
  v5 = sub_23A362D9C();
  if (v5)
  {
    v6 = (void *)v5;
    sub_23A336370(0, &qword_25696BF98);
    v7 = (void *)sub_23A362D9C();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, sel_longLongValue);
      *(_QWORD *)&v4[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = v9;
      v10 = v6;
      v11 = sub_23A362A90();
      v13 = v12;

      v14 = (uint64_t *)&v4[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
      *v14 = v11;
      v14[1] = v13;

      v18.receiver = v4;
      v18.super_class = ObjectType;
      v15 = objc_msgSendSuper2(&v18, sel_init);

      return v15;
    }

  }
  if (qword_25696BD00 != -1)
    swift_once();
  v16 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v16, (uint64_t)qword_25696E8A0);
  sub_23A33E2E0(0xD00000000000001DLL, 0x800000023A365500, 0xD000000000000054, 0x800000023A365520, 0x646F632874696E69, 0xEC000000293A7265);

  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t DEStagingEntry.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
}

uint64_t DEStagingEntry.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  sub_23A333494(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload + 8));
  return v1;
}

id DEStagingEntry.__allocating_init(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = a1;
  v8 = &v7[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id DEStagingEntry.init(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v3[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = a1;
  v8 = &v3[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v10.receiver = v3;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id DEStagingEntry.__allocating_init(_:)(uint64_t *a1)
{
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  objc_super v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id] = v2;
  v6 = &v5[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  *(_QWORD *)v6 = v3;
  *((_QWORD *)v6 + 1) = v4;
  v8.receiver = v5;
  v8.super_class = v1;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t DEStagingEntry.toSwift.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  a1[1] = v2;
  a1[2] = v3;
  return sub_23A333494(v2, v3);
}

id DEStagingEntry.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DEStagingEntry.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DEStagingEntry.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A333CD4@<X0>(uint64_t a1@<X8>)
{
  return sub_23A333D20(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 6583651, 0xE300000000000000, a1);
}

uint64_t sub_23A333CEC@<X0>(uint64_t a1@<X8>)
{
  return sub_23A333D20(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1702259052, 0xE400000000000000, a1);
}

uint64_t sub_23A333D04@<X0>(uint64_t a1@<X8>)
{
  return sub_23A333D20(&OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir, 0x6D75636563, 0xE500000000000000, a1);
}

uint64_t sub_23A333D20@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v21 = a2;
  v22 = a3;
  v7 = sub_23A3629C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - v15;
  v17 = v4 + *a1;
  swift_beginAccess();
  sub_23A3379B0(v17, (uint64_t)v16);
  v18 = sub_23A362A3C();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v16, v18);
  sub_23A336CFC((uint64_t)v16);
  v23 = v21;
  v24 = v22;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCD7A0], v7);
  sub_23A336470();
  sub_23A362A30();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v14, a4, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v14, 0, 1, v18);
  swift_beginAccess();
  sub_23A3379F8((uint64_t)v14, v17);
  return swift_endAccess();
}

BOOL sub_23A333F2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A333F40()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t sub_23A333F84()
{
  return sub_23A362F40();
}

uint64_t sub_23A333FAC()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t PersistentStorage.__allocating_init(internal:)(char *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  PersistentStorage.init(internal:)(a1);
  return v2;
}

uint64_t PersistentStorage.init(internal:)(char *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  void *v25;
  _QWORD *v26;
  uint64_t result;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;

  v2 = v1;
  v4 = sub_23A3629C4();
  v31 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A362A3C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v32 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v33 = (char *)&v28 - v11;
  v12 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 120) = 0;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 1, 1, v7);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1, 1, v7);
  v15(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir, 1, 1, v7);
  if (qword_25696BCF8 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v12, (uint64_t)qword_25696E888);
  sub_23A3363A8(v16, (uint64_t)v14);
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v34 = 0xD000000000000011;
  v35 = 0x800000023A3655A0;
  sub_23A3363EC();
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v34, v35, 0xD000000000000054, 0x800000023A365520, 0x746E692874696E69, 0xEF293A6C616E7265);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v14);
  v30 = v2;
  v17 = v8;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url, a1, v7);
  v34 = 1702259052;
  v35 = 0xE400000000000000;
  v18 = *MEMORY[0x24BDCD7A0];
  v29 = a1;
  v19 = v31;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 104);
  v20(v6, v18, v4);
  sub_23A336470();
  v21 = v32;
  sub_23A362A30();
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v6, v4);
  swift_bridgeObjectRelease();
  v34 = 0x65746972646E6564;
  v35 = 0xEB0000000062642ELL;
  v20(v6, v18, v4);
  v23 = (uint64_t)v33;
  sub_23A362A30();
  v22(v6, v4);
  swift_bridgeObjectRelease();
  v24 = *(void (**)(char *, uint64_t))(v17 + 8);
  v24(v21, v7);
  v25 = (void *)*MEMORY[0x24BDD0CE0];
  type metadata accessor for SQLiteStorage();
  swift_allocObject();
  v26 = sub_23A356310(v23, (uint64_t)v25);
  v24(v29, v7);
  result = v30;
  *(_QWORD *)(v30 + 112) = v26;
  return result;
}

uint64_t PersistentStorage.__allocating_init(ingestion:)(char *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  PersistentStorage.init(ingestion:)(a1);
  return v2;
}

uint64_t PersistentStorage.init(ingestion:)(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v2 = v1;
  v40 = sub_23A3629C4();
  v37 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A362A3C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)&v33 - v10;
  v11 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 120) = 0;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v14(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir, 1, 1, v6);
  v14(v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir, 1, 1, v6);
  v15 = v2;
  v16 = v2 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir;
  v17 = v6;
  v14(v16, 1, 1, v6);
  if (qword_25696BCF8 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v11, (uint64_t)qword_25696E888);
  sub_23A3363A8(v18, (uint64_t)v13);
  v41 = 0;
  v42 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v41 = 0xD000000000000012;
  v42 = 0x800000023A3655C0;
  sub_23A3363EC();
  v19 = a1;
  sub_23A362EC8();
  v35 = v17;
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v41, v42, 0xD000000000000054, 0x800000023A365520, 0xD000000000000010, 0x800000023A3655E0);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v13);
  v36 = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v15 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url, a1, v17);
  v41 = 6583651;
  v42 = 0xE300000000000000;
  v20 = *MEMORY[0x24BDCD7A0];
  v34 = v7;
  v21 = v37;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 104);
  v23 = v40;
  v22(v5, v20, v40);
  sub_23A336470();
  v24 = v38;
  sub_23A362A30();
  v25 = *(void (**)(char *, uint64_t))(v21 + 8);
  v25(v5, v23);
  swift_bridgeObjectRelease();
  v41 = 0x65746972646E6564;
  v42 = 0xEB0000000062642ELL;
  v22(v5, v20, v23);
  v26 = (uint64_t)v39;
  sub_23A362A30();
  v25(v5, v23);
  swift_bridgeObjectRelease();
  v27 = *(void (**)(char *, uint64_t))(v34 + 8);
  v28 = v24;
  v29 = v35;
  v27(v28, v35);
  v30 = (void *)*MEMORY[0x24BDD0CE0];
  type metadata accessor for SQLiteStorage();
  swift_allocObject();
  v31 = sub_23A356310(v26, (uint64_t)v30);
  v27(v19, v29);
  result = v36;
  *(_QWORD *)(v36 + 112) = v31;
  return result;
}

uint64_t sub_23A334848(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[48];
  uint64_t v13;
  unint64_t v14;

  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_25696BCF8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v4, (uint64_t)qword_25696E888);
  sub_23A3363A8(v7, (uint64_t)v6);
  v13 = 0x20657461657243;
  v14 = 0xE700000000000000;
  sub_23A362A6C();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v13, v14, 0xD000000000000054, 0x800000023A365520, 0x5F28657461657263, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696BFD0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A363D70;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_retain();
  sub_23A333494(a1, a2);
  sub_23A3364F4(inited);
  v10 = v9;
  swift_release();
  swift_setDeallocating();
  swift_arrayDestroy();
  return v10;
}

uint64_t sub_23A334A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23A334A34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_25696BCF8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v3, (uint64_t)qword_25696E888);
  sub_23A33E2D4(0x7320657461657243, 0xEF65636E65757165, 0xD000000000000054, 0x800000023A365520, 0x5F28657461657263, 0xEA0000000000293ALL);
  swift_retain();
  sub_23A3570A0(v2, v1);
  v5 = v4;
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t sub_23A334B4C(sqlite3_int64 a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v7[2];
  uint64_t v8;
  unint64_t v9;

  v2 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_25696E888);
  sub_23A3363A8(v5, (uint64_t)v4);
  v8 = 0x206574656C6544;
  v9 = 0xE700000000000000;
  v7[1] = a1;
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v8, v9, 0xD000000000000054, 0x800000023A365520, 0x69286574656C6564, 0xEB00000000293A64);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v4);
  swift_retain();
  sub_23A358830(a1);
  return swift_release();
}

uint64_t sub_23A334CC4(sqlite3_int64 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  unint64_t v13;

  v6 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v6, (uint64_t)qword_25696E888);
  sub_23A3363A8(v9, (uint64_t)v8);
  v12 = 0x20657461647055;
  v13 = 0xE700000000000000;
  v11[1] = a1;
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  sub_23A362A6C();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v12, v13, 0xD000000000000054, 0x800000023A365520, 0xD000000000000013, 0x800000023A365600);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v8);
  swift_retain();
  sub_23A35796C(a1, a2, a3);
  return swift_release();
}

uint64_t sub_23A334E7C@<X0>(sqlite3_int64 a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  sqlite3_int64 v20;

  v5 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v5, (uint64_t)qword_25696E888);
  sub_23A3363A8(v8, (uint64_t)v7);
  v18 = 0x206863746546;
  v19 = 0xE600000000000000;
  v20 = a1;
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v18, v19, 0xD000000000000054, 0x800000023A365520, 0x6469286863746566, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v7);
  swift_retain();
  v9 = sub_23A357E1C(a1);
  v11 = v10;
  v13 = v12;
  result = swift_release();
  if (!v2)
  {
    if (v13 >> 60 == 15)
      v15 = 0;
    else
      v15 = v9;
    if (v13 >> 60 == 15)
      v16 = 0;
    else
      v16 = v11;
    v17 = 0xF000000000000000;
    if (v13 >> 60 != 15)
      v17 = v13;
    *a2 = v15;
    a2[1] = v16;
    a2[2] = v17;
  }
  return result;
}

uint64_t sub_23A33502C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 64) = a3;
  *(_QWORD *)(v5 + 72) = v4;
  *(_BYTE *)(v5 + 26) = a4;
  *(_BYTE *)(v5 + 25) = a2;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 80) = type metadata accessor for InternalLogger();
  *(_QWORD *)(v5 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A335094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  char v10;
  sqlite3_int64 v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_25696BCF8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_BYTE *)(v0 + 26);
  v4 = *(_BYTE *)(v0 + 25);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = __swift_project_value_buffer(*(_QWORD *)(v0 + 80), (uint64_t)qword_25696E888);
  sub_23A3363A8(v6, v1);
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = v5;
  *(_BYTE *)(v0 + 24) = v4 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696BFE8);
  sub_23A362C04();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  *(_QWORD *)(v0 + 32) = v2;
  *(_BYTE *)(v0 + 40) = v3 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696BFF0);
  sub_23A362C04();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(0x205D5B6863746546, 0xEB00000000207461, 0xD000000000000054, 0x800000023A365520, 0xD000000000000010, 0x800000023A365620);
  swift_bridgeObjectRelease();
  result = sub_23A336434(v1);
  v8 = 0;
  if ((v3 & 1) != 0)
    goto LABEL_7;
  v9 = *(_QWORD *)(v0 + 64);
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    v8 = *(_QWORD *)(v0 + 64);
LABEL_7:
    v10 = *(_BYTE *)(v0 + 26);
    v11 = *(_QWORD *)(v0 + 56);
    v12 = *(_BYTE *)(v0 + 25) & 1;
    swift_retain();
    sub_23A35802C(v11, v12, v8 | ((unint64_t)(v10 & 1) << 32));
    v14 = v13;
    swift_release();
    v15 = sub_23A335344(v14);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A335344(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_23A353EC8(0, v1, 0);
    v2 = v12;
    v4 = (unint64_t *)(a1 + 48);
    do
    {
      v6 = *(v4 - 2);
      v5 = *(v4 - 1);
      v7 = *v4;
      sub_23A333494(v5, *v4);
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_23A353EC8(v8 > 1, v9 + 1, 1);
      v4 += 3;
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = (_QWORD *)(v12 + 24 * v9);
      v10[4] = v6;
      v10[5] = v5;
      v10[6] = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_23A335430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id result;
  void *v18;
  id v19[2];

  v1 = v0;
  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_23A362A3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v6 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v6, (uint64_t)qword_25696E888);
  sub_23A33E2EC(0xD000000000000012, 0x800000023A365640, 0xD000000000000054, 0x800000023A365520, 0xD000000000000012, 0x800000023A365660);
  if (*(_BYTE *)(v0 + 120) == 1)
  {
    sub_23A336CB8();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000019;
    *(_QWORD *)(v7 + 8) = 0x800000023A365680;
    *(_BYTE *)(v7 + 16) = 0;
  }
  else
  {
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_defaultManager);
    sub_23A333CD4((uint64_t)v5);
    sub_23A362A24();
    v10 = *(void (**)(char *, uint64_t))(v3 + 8);
    v10(v5, v2);
    v11 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_fileExistsAtPath_, v11);

    if (v12)
      *(_BYTE *)(v1 + 120) = 1;
    swift_retain();
    sub_23A358A24();
    swift_release();
    v13 = objc_msgSend(v8, sel_defaultManager);
    sub_23A333CEC((uint64_t)v5);
    v14 = (void *)sub_23A362A00();
    v10(v5, v2);
    sub_23A333CD4((uint64_t)v5);
    v15 = (void *)sub_23A362A00();
    v10(v5, v2);
    v19[0] = 0;
    v16 = objc_msgSend(v13, sel_moveItemAtURL_toURL_error_, v14, v15, v19);

    result = v19[0];
    if ((v16 & 1) != 0)
    {
      *(_BYTE *)(v1 + 120) = 1;
      return result;
    }
    v18 = result;
    sub_23A3629B8();

  }
  return (id)swift_willThrow();
}

id sub_23A335738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  id result;
  id v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void (*v25)(char *, uint64_t);
  id v26;
  unint64_t v27;
  uint64_t v28;

  v1 = v0;
  v28 = *MEMORY[0x24BDAC8D0];
  v2 = sub_23A362A3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v6 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v6, (uint64_t)qword_25696E888);
  sub_23A33E2EC(0xD000000000000017, 0x800000023A3656A0, 0xD000000000000054, 0x800000023A365520, 0xD000000000000017, 0x800000023A3656C0);
  if (*(_BYTE *)(v0 + 120) != 1)
  {
    sub_23A336CB8();
    swift_allocError();
    *(_QWORD *)v14 = 0xD000000000000019;
    *(_QWORD *)(v14 + 8) = 0x800000023A3656E0;
    *(_BYTE *)(v14 + 16) = 0;
    return (id)swift_willThrow();
  }
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_defaultManager);
  sub_23A333CD4((uint64_t)v5);
  sub_23A362A24();
  v25 = *(void (**)(char *, uint64_t))(v3 + 8);
  v25(v5, v2);
  v9 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_fileExistsAtPath_, v9);

  if ((v10 & 1) == 0)
  {
    v26 = 0;
    v27 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v26 = (id)0xD00000000000001FLL;
    v27 = 0x800000023A365700;
    sub_23A333CD4((uint64_t)v5);
    goto LABEL_9;
  }
  v11 = objc_msgSend(v7, sel_defaultManager);
  sub_23A333D04((uint64_t)v5);
  sub_23A362A24();
  v25(v5, v2);
  v12 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_fileExistsAtPath_, v12);

  if (v13)
  {
    v26 = 0;
    v27 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v26 = (id)0xD000000000000028;
    v27 = 0x800000023A365720;
    sub_23A333D04((uint64_t)v5);
LABEL_9:
    sub_23A3363EC();
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    v25(v5, v2);
    v15 = v26;
    v16 = v27;
    sub_23A336CB8();
    swift_allocError();
    *(_QWORD *)v17 = v15;
    *(_QWORD *)(v17 + 8) = v16;
    *(_BYTE *)(v17 + 16) = 1;
    return (id)swift_willThrow();
  }
  v19 = objc_msgSend(v7, sel_defaultManager);
  sub_23A333CD4((uint64_t)v5);
  v20 = (void *)sub_23A362A00();
  v21 = v25;
  v25(v5, v2);
  sub_23A333D04((uint64_t)v5);
  v22 = (void *)sub_23A362A00();
  v21(v5, v2);
  v26 = 0;
  v23 = objc_msgSend(v19, sel_moveItemAtURL_toURL_error_, v20, v22, &v26);

  result = v26;
  if ((v23 & 1) == 0)
  {
    v24 = result;
    sub_23A3629B8();

    return (id)swift_willThrow();
  }
  *(_BYTE *)(v1 + 120) = 2;
  return result;
}

id sub_23A335BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(char *, uint64_t);
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id result;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;

  v1 = v0;
  v24 = *MEMORY[0x24BDAC8D0];
  v2 = sub_23A362A3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF8 != -1)
    swift_once();
  v6 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v6, (uint64_t)qword_25696E888);
  sub_23A33E2EC(0xD000000000000010, 0x800000023A365750, 0xD000000000000054, 0x800000023A365520, 0xD000000000000011, 0x800000023A365770);
  if (*(_BYTE *)(v0 + 120) == 2)
  {
    v7 = (void *)objc_opt_self();
    v8 = objc_msgSend(v7, sel_defaultManager);
    sub_23A333D04((uint64_t)v5);
    sub_23A362A24();
    v9 = *(void (**)(char *, uint64_t))(v3 + 8);
    v9(v5, v2);
    v10 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v8, sel_fileExistsAtPath_, v10);

    if ((v11 & 1) != 0)
    {
      v12 = objc_msgSend(v7, sel_defaultManager);
      sub_23A333CD4((uint64_t)v5);
      v13 = (void *)sub_23A362A00();
      v9(v5, v2);
      v22 = 0;
      v14 = objc_msgSend(v12, sel_removeItemAtURL_error_, v13, &v22);

      result = v22;
      if ((v14 & 1) != 0)
      {
        *(_BYTE *)(v1 + 120) = 0;
        return result;
      }
      v20 = result;
      sub_23A3629B8();

    }
    else
    {
      v22 = 0;
      v23 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v22 = (id)0xD000000000000021;
      v23 = 0x800000023A3657B0;
      sub_23A333D04((uint64_t)v5);
      sub_23A3363EC();
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      v9(v5, v2);
      v17 = v22;
      v18 = v23;
      sub_23A336CB8();
      swift_allocError();
      *(_QWORD *)v19 = v17;
      *(_QWORD *)(v19 + 8) = v18;
      *(_BYTE *)(v19 + 16) = 1;
    }
  }
  else
  {
    sub_23A336CB8();
    swift_allocError();
    *(_QWORD *)v16 = 0xD00000000000001BLL;
    *(_QWORD *)(v16 + 8) = 0x800000023A365790;
    *(_BYTE *)(v16 + 16) = 0;
  }
  return (id)swift_willThrow();
}

uint64_t PersistentStorage.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  swift_retain();
  sub_23A358A24();
  swift_release();
  swift_release();
  v2 = v0 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url;
  v3 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir);
  swift_defaultActor_destroy();
  return v1;
}

uint64_t PersistentStorage.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  swift_retain();
  sub_23A358A24();
  swift_release();
  swift_release();
  v2 = v0 + OBJC_IVAR____TtC8Dendrite17PersistentStorage_url;
  v3 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___ingestionDir);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___liveDir);
  sub_23A336CFC(v1 + OBJC_IVAR____TtC8Dendrite17PersistentStorage____lazy_storage___syndicationDir);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t PersistentStorage.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A336060()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A33606C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_23A336088()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23A334848(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A3360D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A337A44;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23A336150(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_23A336168()
{
  uint64_t v0;

  sub_23A334B4C(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3361B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a2;
  v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_23A3361D0()
{
  uint64_t v0;

  sub_23A334CC4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A336220(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_23A33623C()
{
  uint64_t v0;

  sub_23A334E7C(*(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A33628C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  char v7;
  char v8;
  _QWORD *v9;

  v7 = a2 & 1;
  v8 = a4 & 1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A336304;
  return sub_23A33502C(a1, v7, a3, v8);
}

uint64_t sub_23A336304(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A336370(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A3363A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A3363EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D0138;
  if (!qword_2542D0138)
  {
    v1 = sub_23A362A3C();
    result = MEMORY[0x23B849AC0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2542D0138);
  }
  return result;
}

uint64_t sub_23A336434(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A336470()
{
  unint64_t result;

  result = qword_25696BFC8;
  if (!qword_25696BFC8)
  {
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25696BFC8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B849AA8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23A3364F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  sqlite3 **v5;
  sqlite3 *v6;
  unsigned int v7;
  sqlite3 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  sqlite3 **v16;
  sqlite3_stmt *ppStmt[5];

  v3 = v1;
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v5 = (sqlite3 **)(v1 + 16);
  swift_beginAccess();
  v6 = *(sqlite3 **)(v1 + 16);
  if (!v6)
  {
    sub_23A356510();
    if (v2)
      return;
    v6 = *v5;
  }
  v7 = sqlite3_exec(v6, "BEGIN;", 0, 0, 0);
  sub_23A356DC0(v7, 0x657475636578655FLL, 0xEE00293A6C717328);
  if (v2)
    return;
  ppStmt[0] = 0;
  v16 = (sqlite3 **)(v1 + 16);
  v8 = *v5;
  if (qword_25696BD60 != -1)
    swift_once();
  v9 = sub_23A362C40();
  v10 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v10 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v10 > 0x7FFFFFFF)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x23A336C84);
  }
  v11 = sub_23A362C10();
  v12 = sqlite3_prepare_v2(v8, (const char *)(v11 + 32), v10, ppStmt, 0);
  swift_release();
  sub_23A356DC0(v12, 0xD000000000000011, 0x800000023A365950);
  if (*(_QWORD *)(a1 + 16))
  {
    v13 = (char *)&loc_23A33679C + *((int *)qword_23A336CA8 + (*(_QWORD *)(swift_bridgeObjectRetain() + 40) >> 62));
    __asm { BR              X9 }
  }
  v14 = sqlite3_exec(*(sqlite3 **)(v3 + 16), "COMMIT;", 0, 0, 0);
  sub_23A356DC0(v14, 0x657475636578655FLL, 0xEE00293A6C717328);
  v15 = sqlite3_finalize(ppStmt[0]);
  sub_23A356DC0(v15, 0xD000000000000011, 0x800000023A365950);
  sqlite3_last_insert_rowid(*v16);
}

unint64_t sub_23A336CB8()
{
  unint64_t result;

  result = qword_25696BFF8;
  if (!qword_25696BFF8)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for PersistentStorageError, &type metadata for PersistentStorageError);
    atomic_store(result, (unint64_t *)&qword_25696BFF8);
  }
  return result;
}

uint64_t sub_23A336CFC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for StagingEntry(uint64_t a1)
{
  return sub_23A33350C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

_QWORD *_s8Dendrite12StagingEntryVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  v4 = a2[2];
  sub_23A333494(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

_QWORD *assignWithCopy for StagingEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  sub_23A333494(v3, v4);
  v5 = a1[1];
  v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_23A33350C(v5, v6);
  return a1;
}

uint64_t assignWithTake for StagingEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  sub_23A33350C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for StagingEntry(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for StagingEntry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StagingEntry()
{
  return &type metadata for StagingEntry;
}

uint64_t type metadata accessor for DEStagingEntry()
{
  return objc_opt_self();
}

uint64_t method lookup function for DEStagingEntry()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DEStagingEntry.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DEStagingEntry.__allocating_init(id:payload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of StagingStorage.create(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A337A48;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of StagingStorage.create<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23A337A48;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of StagingStorage.delete(id:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 24) + *(_QWORD *)(a3 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A337A40;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StagingStorage.update(id:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23A337A40;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of StagingStorage.fetch(id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A3371B0;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23A3371B0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of StagingStorage.fetch(at:limit:)(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = a2 & 1;
  v12 = a4 & 1;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 48)
                                                                                     + *(_QWORD *)(a6 + 48));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23A337294;
  return v15(a1, v11, a3, v12, a5, a6);
}

uint64_t sub_23A337294(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23A3372E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for PersistentStorageError()
{
  return sub_23A337300();
}

uint64_t sub_23A337300()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8Dendrite22PersistentStorageErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23A3372E8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PersistentStorageError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23A3372E8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A337300();
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

uint64_t assignWithTake for PersistentStorageError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A337300();
  return a1;
}

uint64_t getEnumTagSinglePayload for PersistentStorageError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PersistentStorageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A337488(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23A337490(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentStorageError()
{
  return &type metadata for PersistentStorageError;
}

uint64_t sub_23A3374AC()
{
  return type metadata accessor for PersistentStorage();
}

uint64_t type metadata accessor for PersistentStorage()
{
  uint64_t result;

  result = qword_25696C0D8;
  if (!qword_25696C0D8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A3374F0()
{
  unint64_t v0;
  unint64_t v1;

  sub_23A362A3C();
  if (v0 <= 0x3F)
  {
    sub_23A33779C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PersistentStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PersistentStorage.__allocating_init(internal:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of PersistentStorage.__allocating_init(ingestion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of PersistentStorage.create(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of PersistentStorage.create<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 312)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 312));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23A337A48;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of PersistentStorage.delete(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of PersistentStorage.update(id:payload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of PersistentStorage.fetch(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of PersistentStorage.fetch(at:limit:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v8 = a2 & 1;
  v9 = a4 & 1;
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 344)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 344));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A337A48;
  return v12(a1, v8, a3, v9);
}

uint64_t dispatch thunk of PersistentStorage.prepareForIngest()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of PersistentStorage.prepareForSyndication()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of PersistentStorage.syndicationDone()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

void sub_23A33779C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25696C0F8)
  {
    sub_23A362A3C();
    v0 = sub_23A362DC0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25696C0F8);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PersistentStorage.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PersistentStorage.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A3378D8 + 4 * byte_23A363D85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A33790C + 4 * byte_23A363D80[v4]))();
}

uint64_t sub_23A33790C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A337914(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A33791CLL);
  return result;
}

uint64_t sub_23A337928(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A337930);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A337934(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A33793C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A337948(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A337950(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PersistentStorage.State()
{
  return &type metadata for PersistentStorage.State;
}

unint64_t sub_23A33796C()
{
  unint64_t result;

  result = qword_25696C100;
  if (!qword_25696C100)
  {
    result = MEMORY[0x23B849AC0](&unk_23A363F68, &type metadata for PersistentStorage.State);
    atomic_store(result, (unint64_t *)&qword_25696C100);
  }
  return result;
}

uint64_t sub_23A3379B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3379F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of DataFrameStreamWriter.append(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of DataFrameStreamWriter.prune(each:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataFrameStreamWriter.vacuum()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DataFrameStreamReader.iterate(reversed:each:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of DataFrameStreamReader.frameData(forIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t Set<>.difference(protoData:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_23A337AE0(a1, a2, a3, 0);
}

uint64_t Set<>.intersection(protoData:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_23A337AE0(a1, a2, a3, 1);
}

uint64_t sub_23A337AE0(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  v7 = a4;
  result = sub_23A33A008((uint64_t)&v7, a3, a1, a2);
  if (v4)
    return v6;
  return result;
}

unint64_t WireTypes.description.getter(int a1)
{
  unint64_t result;

  result = 0x544E49524156;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x34364445584946;
      break;
    case 2:
      result = 0xD000000000000010;
      break;
    case 3:
      result = 0x52475F5452415453;
      break;
    case 4:
      result = 0x554F52475F444E45;
      break;
    case 5:
      result = 0x32334445584946;
      break;
    case 6:
      result = 0x544E554F43;
      break;
    default:
      result = 0x4E574F4E4B4E55;
      break;
  }
  return result;
}

unint64_t sub_23A337C14()
{
  int *v0;

  return WireTypes.description.getter(*v0);
}

void sub_23A337C1C(unsigned __int8 *a1, uint64_t a2, void *a3, char **a4, uint64_t a5, uint64_t (*a6)(_QWORD, _QWORD), uint64_t a7)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  unint64_t v26;
  uint64_t v27;
  char v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  int v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  __int128 v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  int v58;
  uint64_t (*v59)(_QWORD, _QWORD);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;

  v9 = v8;
  v10 = v7;
  v51 = a5;
  v52 = a7;
  v61 = a2;
  v68 = *MEMORY[0x24BDAC8D0];
  v57 = type metadata accessor for InternalLogger();
  v15 = MEMORY[0x24BDAC7A8](v57);
  v53 = (uint64_t)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v62 = (uint64_t)v45 - v17;
  v58 = *a1;
  v56 = *a4;
  if (!objc_msgSend(v10, sel_hasMoreData))
    return;
  v50 = (unint64_t)"LENGTH_DELIMITED";
  v48 = a3;
  v49 = (unint64_t)"Swift/Integers.swift";
  v54 = 0x800000023A365B80;
  v55 = 0x800000023A3659A0;
  v47 = xmmword_23A363D70;
  v45[2] = 0x800000023A365BD0;
  v45[1] = ")";
  v59 = a6;
  while (1)
  {
    v22 = (char *)objc_msgSend(v10, sel_position);
    LODWORD(v66) = 0;
    LOBYTE(v64) = 0;
    objc_msgSend(v10, sel_readTag_type_, &v66, &v64);
    if (objc_msgSend(v10, sel_hasError))
    {
      if (qword_2542D0118 != -1)
        swift_once();
      __swift_project_value_buffer(v57, (uint64_t)qword_2542D12A8);
      sub_23A33E2E0(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, v50 | 0x8000000000000000, 0xD000000000000016, 0x800000023A365AA0);
      goto LABEL_40;
    }
    v23 = v64;
    v24 = v66;
    if (qword_2542D0118 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v57, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v25, v62);
    LODWORD(v64) = v24;
    v66 = sub_23A362EC8();
    v67 = v26;
    sub_23A362C58();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    v64 = v22;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    v60 = 0xD000000000000040;
    v27 = v62;
    sub_23A33E2D4(v66, v67, 0xD000000000000060, v55, 0xD000000000000040, v54);
    swift_bridgeObjectRelease();
    sub_23A336434(v27);
    if (a6)
    {
      swift_retain();
      v28 = a6(v24, v23);
      sub_23A33A5CC((uint64_t)a6);
      if ((v28 & 1) != 0)
        return;
    }
    v29 = v56;
    if (v56)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v29 = sub_23A35F3F8(0, *((_QWORD *)v56 + 2) + 1, 1, v56);
      v31 = *((_QWORD *)v29 + 2);
      v30 = *((_QWORD *)v29 + 3);
      if (v31 >= v30 >> 1)
        v29 = sub_23A35F3F8((char *)(v30 > 1), v31 + 1, 1, v29);
      *((_QWORD *)v29 + 2) = v31 + 1;
      v32 = &v29[4 * v31 + 32];
      a6 = v59;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D1068);
      v29 = (char *)swift_allocObject();
      *((_OWORD *)v29 + 1) = v47;
      v32 = v29 + 32;
    }
    *(_DWORD *)v32 = v24;
    if ((sub_23A339158((uint64_t)v29, v61) & 1) == 0)
    {
      if (!v58)
        goto LABEL_21;
LABEL_3:
      v18 = v9;
      v19 = v53;
      sub_23A3363A8(v25, v53);
      v66 = 0x3A676E696E757250;
      v67 = 0xE900000000000020;
      v64 = v29;
      ProtoTagPath.description.getter();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = v60;
      sub_23A33E2D4(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v60, v49 | 0x8000000000000000);
      a6 = v59;
      swift_bridgeObjectRelease();
      v21 = v19;
      v9 = v18;
      sub_23A336434(v21);
      if ((objc_msgSend(v10, sel_skipValueWithTag_type_, v24, v23) & 1) != 0)
        goto LABEL_4;
      sub_23A3363A8(v25, v53);
      v66 = 0;
      v67 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v66 = 0x6F6E20646C756F43;
      v67 = 0xEF2070696B732074;
      LODWORD(v64) = v24;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      v43 = v53;
      sub_23A33E2E0(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v20, v49 | 0x8000000000000000);
      swift_bridgeObjectRelease();
      sub_23A336434(v43);
LABEL_40:
      sub_23A33A230();
      swift_allocError();
      *(_DWORD *)v44 = 0;
      *(_BYTE *)(v44 + 4) = 1;
      swift_willThrow();
      return;
    }
    swift_bridgeObjectRetain();
    sub_23A345A24(&v66, (uint64_t)v29);
    swift_bridgeObjectRelease();
    if ((v58 & 1) == 0)
      goto LABEL_3;
LABEL_21:
    if ((_DWORD)v23 == 3)
    {
      v33 = 0;
    }
    else
    {
      if ((_DWORD)v23 != 2)
        goto LABEL_29;
      v33 = 1;
    }
    swift_bridgeObjectRetain();
    v34 = sub_23A339E8C(v61, (uint64_t)v29);
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
    {
LABEL_29:
      swift_bridgeObjectRelease();
      v41 = v48;
      goto LABEL_30;
    }
    v46 = v9;
    v35 = v53;
    sub_23A3363A8(v25, v53);
    v66 = 0;
    v67 = 0xE000000000000000;
    sub_23A362E2C();
    v64 = v29;
    v36 = ProtoTagPath.description.getter();
    v38 = v37;
    swift_bridgeObjectRelease();
    v66 = v36;
    v67 = v38;
    sub_23A362C58();
    sub_23A33E2D4(v66, v67, 0xD000000000000060, v50 | 0x8000000000000000, v60, v49 | 0x8000000000000000);
    swift_bridgeObjectRelease();
    sub_23A336434(v35);
    if (!v33)
      break;
    v66 = 0;
    v67 = 0;
    objc_msgSend(v10, sel_mark_, &v66);
    v64 = 0;
    v39 = v48;
    PBDataWriterPlaceMark();
    v63 = v58;
    v65 = v29;
    v40 = v46;
    sub_23A337C1C(&v63, v61, v39, &v65, v51, 0, 0);
    v9 = v40;
    a6 = v59;
    if (v40)
      goto LABEL_43;
    swift_bridgeObjectRelease();
    PBDataWriterRecallMark();
    objc_msgSend(v10, sel_recall_, &v66);
LABEL_4:
    if ((objc_msgSend(v10, sel_hasMoreData) & 1) == 0)
      return;
  }
  v9 = v46;
  a6 = v59;
  v41 = v48;
  if ((_DWORD)v23 != 3)
  {
LABEL_35:
    swift_bridgeObjectRelease();
LABEL_30:
    sub_23A3392C0(v24, v23, v23, v41);
    if (v9)
      return;
    goto LABEL_4;
  }
  LOBYTE(v64) = v58;
  v66 = (uint64_t)v29;
  v42 = swift_allocObject();
  *(_DWORD *)(v42 + 16) = v24;
  sub_23A337C1C(&v64, v61, v41, &v66, v51, sub_23A33A64C, v42);
  if (!v9)
  {
    swift_release();
    goto LABEL_35;
  }
  swift_release();
LABEL_43:
  swift_bridgeObjectRelease();
}

void static PBDataReader.pluck(tagPath:data:)(uint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *a1;
  v8 = objc_allocWithZone(MEMORY[0x24BE7AEF8]);
  sub_23A333494(a2, a3);
  v9 = (void *)sub_23A362A84();
  sub_23A33350C(a2, a3);
  v10 = objc_msgSend(v8, sel_initWithData_, v9);

  if (v10)
  {
    v13 = v7;
    v12 = 0;
    sub_23A3387B8(&v13, &v12, 0, 0, a4);

  }
  else
  {
    sub_23A33A230();
    swift_allocError();
    *(_DWORD *)v11 = 0;
    *(_BYTE *)(v11 + 4) = 1;
    swift_willThrow();
  }
}

void sub_23A3387B8(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  void *v5;
  void *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _OWORD *v40;
  unint64_t v41;
  char *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD v54[2];

  v40 = a5;
  v6 = v5;
  v44 = a4;
  v54[1] = *MEMORY[0x24BDAC8D0];
  v50 = type metadata accessor for InternalLogger();
  v10 = MEMORY[0x24BDAC7A8](v50);
  v38 = (uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - v12;
  v14 = *a1;
  v15 = *a2;
  v41 = (unint64_t)"LENGTH_DELIMITED";
  v39 = (unint64_t)"otoTagTree.swift";
  v48 = 0x800000023A365A10;
  v49 = 0x800000023A3659A0;
  v43 = xmmword_23A363D70;
  v42 = ")";
  v47 = v14;
  while (1)
  {
    if (!objc_msgSend(v6, sel_hasMoreData))
    {
LABEL_19:
      v26 = v40;
      *v40 = xmmword_23A3640E0;
      *((_BYTE *)v26 + 16) = 1;
      return;
    }
    v16 = objc_msgSend(v6, sel_position);
    LODWORD(v51) = 0;
    LOBYTE(v54[0]) = 0;
    objc_msgSend(v6, sel_readTag_type_, &v51, v54);
    if (objc_msgSend(v6, sel_hasError))
    {
      if (qword_2542D0118 != -1)
        swift_once();
      __swift_project_value_buffer(v50, (uint64_t)qword_2542D12A8);
      sub_23A33E2E0(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, v41 | 0x8000000000000000, 0xD000000000000016, 0x800000023A365AA0);
      goto LABEL_33;
    }
    v17 = LOBYTE(v54[0]);
    v18 = v51;
    if (qword_2542D0118 != -1)
      swift_once();
    v45 = __swift_project_value_buffer(v50, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v45, (uint64_t)v13);
    LODWORD(v54[0]) = v18;
    v51 = sub_23A362EC8();
    v52 = v19;
    sub_23A362C58();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    v54[0] = v16;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    v46 = 0xD000000000000027;
    sub_23A33E2D4(v51, v52, 0xD000000000000060, v49, 0xD000000000000027, v48);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v13);
    if (a3)
    {
      swift_retain();
      v20 = a3(v18, v17);
      sub_23A33A5CC((uint64_t)a3);
      if ((v20 & 1) != 0)
        goto LABEL_19;
    }
    if (v15)
    {
      swift_bridgeObjectRetain();
      v21 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v21 = (uint64_t)sub_23A35F3F8(0, *(_QWORD *)(v15 + 16) + 1, 1, (char *)v15);
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
        v21 = (uint64_t)sub_23A35F3F8((char *)(v22 > 1), v23 + 1, 1, (char *)v21);
      *(_QWORD *)(v21 + 16) = v23 + 1;
      v24 = (_DWORD *)(v21 + 4 * v23 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D1068);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = v43;
      v24 = (_DWORD *)(v21 + 32);
    }
    v25 = v47;
    *v24 = v18;
    if (sub_23A35D5E8(v25, v21))
    {
      swift_bridgeObjectRelease();
      sub_23A339970(v18, v17, (uint64_t)v40);
      return;
    }
    if ((sub_23A35F08C(v21, v25) & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v6, sel_skipValueWithTag_type_, v18, v17) & 1) == 0)
    {
      v31 = v38;
      sub_23A3363A8(v45, v38);
      v51 = 0;
      v52 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v51 = 0x6F6E20646C756F43;
      v52 = 0xEF2070696B732074;
      LODWORD(v54[0]) = v18;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
      swift_bridgeObjectRelease();
      v36 = v31;
LABEL_32:
      sub_23A336434(v36);
      goto LABEL_33;
    }
  }
  v27 = v38;
  sub_23A3363A8(v45, v38);
  v51 = 0;
  v52 = 0xE000000000000000;
  sub_23A362E2C();
  v54[0] = v21;
  v28 = ProtoTagPath.description.getter();
  v30 = v29;
  swift_bridgeObjectRelease();
  v51 = v28;
  v52 = v30;
  sub_23A362C58();
  sub_23A33E2D4(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
  swift_bridgeObjectRelease();
  sub_23A336434(v27);
  if ((_DWORD)v17 == 3)
  {
    v51 = v25;
    v54[0] = v21;
    v32 = swift_allocObject();
    *(_DWORD *)(v32 + 16) = v18;
    sub_23A3387B8(&v51, v54, sub_23A33A5B8, v32);
    swift_release();
    goto LABEL_29;
  }
  if ((_DWORD)v17 != 2)
  {
    sub_23A3363A8(v45, v27);
    v51 = 0;
    v52 = 0xE000000000000000;
    sub_23A362E2C();
    v54[0] = v21;
    v33 = ProtoTagPath.description.getter();
    v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v51 = v33;
    v52 = v35;
    sub_23A362C58();
    LODWORD(v54[0]) = v18;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v51, v52, 0xD000000000000060, v41 | 0x8000000000000000, v46, v39 | 0x8000000000000000);
    swift_bridgeObjectRelease();
    v36 = v27;
    goto LABEL_32;
  }
  v51 = 0;
  v52 = 0;
  if ((objc_msgSend(v6, sel_mark_, &v51) & 1) != 0)
  {
    v53 = v21;
    v54[0] = v25;
    sub_23A3387B8(v54, &v53, 0, 0);
LABEL_29:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
LABEL_33:
  sub_23A33A230();
  swift_allocError();
  *(_DWORD *)v37 = 0;
  *(_BYTE *)(v37 + 4) = 1;
  swift_willThrow();
}

uint64_t sub_23A339158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  unsigned int *v13;
  uint64_t v14;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_23A362F34();
  v4 = *(_QWORD *)(a1 + 16);
  sub_23A362F40();
  if (v4)
  {
    v5 = a1 + 32;
    v6 = v4;
    do
    {
      v5 += 4;
      sub_23A362F58();
      --v6;
    }
    while (v6);
  }
  result = sub_23A362F64();
  v8 = -1 << *(_BYTE *)(a2 + 32);
  v9 = result & ~v8;
  if (((*(_QWORD *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    return 0;
  v10 = ~v8;
  while (1)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v9);
    if (*(_QWORD *)(v11 + 16) == v4)
    {
      if (!v4 || v11 == a1)
        return 1;
      if (*(_DWORD *)(v11 + 32) == *(_DWORD *)(a1 + 32))
      {
        if (v4 == 1)
          return 1;
        if (*(_DWORD *)(v11 + 36) == *(_DWORD *)(a1 + 36))
          break;
      }
    }
LABEL_7:
    v9 = (v9 + 1) & v10;
    if (((*(_QWORD *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      return 0;
  }
  if (v4 == 2)
    return 1;
  v12 = (_DWORD *)(v11 + 40);
  v13 = (unsigned int *)(a1 + 40);
  v14 = v4 - 2;
  while (v14)
  {
    result = *v13;
    if (*v12 != (_DWORD)result)
      goto LABEL_7;
    ++v12;
    ++v13;
    if (!--v14)
      return 1;
  }
  __break(1u);
  return result;
}

void sub_23A3392C0(uint64_t a1, int a2, unsigned __int8 a3, void *a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  objc_class *v20;
  char *v21;
  uint64_t (**v22)();
  id v23;
  id v24;
  char *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  uint64_t v32;
  unint64_t v33;

  v9 = type metadata accessor for InternalLogger();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2)
  {
    case 0:
      objc_msgSend(a4, sel_writeTag_andType_, a1, a3);
      v13 = (unint64_t)objc_msgSend(v4, sel_readVarInt);
      if ((v13 & 0x8000000000000000) != 0)
        goto LABEL_19;
      objc_msgSend(a4, sel_writeBareVarint_, v13);
      break;
    case 1:
      objc_msgSend(a4, sel_writeFixed64_forTag_, objc_msgSend(v4, sel_readFixed64), a1);
      return;
    case 2:
      v15 = objc_msgSend(v4, sel_readBytes_, objc_msgSend(v4, sel_readUint32));
      if (v15)
      {
        v16 = sub_23A362A90();
        v18 = v17;

        sub_23A333494(v16, v18);
        v15 = (id)sub_23A362A84();
        sub_23A33350C(v16, v18);
      }
      else
      {
        v16 = 0;
        v18 = 0xF000000000000000;
      }
      objc_msgSend(a4, sel_writeData_forTag_, v15, a1);

      sub_23A33A628(v16, v18);
      return;
    case 3:
      v19 = swift_allocObject();
      *(_QWORD *)(v19 + 16) = v4;
      *(_DWORD *)(v19 + 24) = a1;
      *(_QWORD *)(v19 + 32) = a4;
      v20 = (objc_class *)type metadata accessor for BlockShimForPBCodable();
      v21 = (char *)objc_allocWithZone(v20);
      *(_QWORD *)&v21[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error] = 0;
      v22 = (uint64_t (**)())&v21[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block];
      *v22 = sub_23A33A608;
      v22[1] = (uint64_t (*)())v19;
      v31.receiver = v21;
      v31.super_class = v20;
      v23 = v4;
      v24 = a4;
      swift_retain();
      v25 = (char *)objc_msgSendSuper2(&v31, sel_init);
      if (!v25)
      {
        __break(1u);
LABEL_19:
        sub_23A362E5C();
        __break(1u);
        JUMPOUT(0x23A339778);
      }
      v26 = v25;
      PBDataWriterWriteSubgroup();
      v27 = *(void **)&v26[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error];
      if (v27)
      {
        v28 = v27;
        swift_willThrow();
        swift_release();

      }
      else
      {
        swift_release();

      }
      break;
    case 5:
      objc_msgSend(a4, sel_writeFixed32_forTag_, objc_msgSend(v4, sel_readFixed32), a1);
      return;
    default:
      if (qword_2542D0118 != -1)
      {
        v30 = v10;
        swift_once();
        v10 = v30;
      }
      v14 = __swift_project_value_buffer(v10, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v14, (uint64_t)v12);
      v32 = 0;
      v33 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v32 = 0xD000000000000012;
      v33 = 0x800000023A365AC0;
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v32, v33, 0xD000000000000060, 0x800000023A3659A0, 0xD000000000000021, 0x800000023A365B00);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v12);
      sub_23A33A230();
      swift_allocError();
      *(_DWORD *)v29 = a2;
      *(_BYTE *)(v29 + 4) = 0;
      swift_willThrow();
      return;
  }
}

uint64_t sub_23A3397AC(id a1, int a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    result = (uint64_t)objc_msgSend(a1, sel_hasMoreData);
    if (!(_DWORD)result)
      break;
    v9 = 0;
    v8 = 0;
    objc_msgSend(a1, sel_readTag_type_, &v9, &v8);
    if (objc_msgSend(a1, sel_hasError))
    {
      if (qword_2542D0118 != -1)
        swift_once();
      v6 = type metadata accessor for InternalLogger();
      __swift_project_value_buffer(v6, (uint64_t)qword_2542D12A8);
      sub_23A33E2E0(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, 0x800000023A3659A0, 0xD000000000000016, 0x800000023A365AA0);
      sub_23A33A230();
      swift_allocError();
      *(_DWORD *)v7 = 0;
      *(_BYTE *)(v7 + 4) = 1;
      return swift_willThrow();
    }
    result = v9;
    if (v9 != a2 || v8 != 4)
    {
      result = sub_23A3392C0();
      if (!v2)
        continue;
    }
    return result;
  }
  return result;
}

void sub_23A339970(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2)
  {
    case 0:
      v11 = (uint64_t)objc_msgSend(v3, sel_readVarInt);
      v12 = 0;
      v13 = 0;
      goto LABEL_20;
    case 1:
      v11 = (uint64_t)objc_msgSend(v3, sel_readFixed64);
      v13 = 0;
      v12 = 0x2000000000000000;
      goto LABEL_20;
    case 2:
      v14 = objc_msgSend(v3, sel_readBytes_, objc_msgSend(v3, sel_readUint32));
      if (!v14)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        JUMPOUT(0x23A339E58);
      }
      v15 = v14;
      v11 = sub_23A362A90();
      v17 = v16;

      v13 = 0;
      v12 = v17 | 0x3000000000000000;
      goto LABEL_20;
    case 3:
      v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7AF00]), sel_init);
      if (!v19)
        goto LABEL_27;
      v20 = v19;
      break;
    case 5:
      v24 = objc_msgSend(v3, sel_readFixed32);
      v13 = 0;
      v11 = v24;
      goto LABEL_19;
    default:
      if (qword_2542D0118 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v18, (uint64_t)v10);
      v28 = 0;
      v29 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v28 = 0xD000000000000012;
      v29 = 0x800000023A365AC0;
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v28, v29, 0xD000000000000060, 0x800000023A3659A0, 0xD00000000000001FLL, 0x800000023A365AE0);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v10);
      sub_23A33A230();
      swift_allocError();
      *(_DWORD *)v26 = a2;
      *(_BYTE *)(v26 + 4) = 0;
      swift_willThrow();
      return;
  }
  while (objc_msgSend(v3, sel_hasMoreData))
  {
    LODWORD(v28) = 0;
    HIBYTE(v27) = 0;
    objc_msgSend(v3, sel_readTag_type_, &v28, (char *)&v27 + 7);
    if (objc_msgSend(v3, sel_hasError))
    {
      if (qword_2542D0118 != -1)
        swift_once();
      __swift_project_value_buffer(v8, (uint64_t)qword_2542D12A8);
      sub_23A33E2E0(0x2064616572206270, 0xEE002E726F727265, 0xD000000000000060, 0x800000023A3659A0, 0xD000000000000016, 0x800000023A365AA0);
      sub_23A33A230();
      swift_allocError();
      *(_DWORD *)v25 = 0;
      *(_BYTE *)(v25 + 4) = 1;
      swift_willThrow();
LABEL_24:

      return;
    }
    if ((_DWORD)v28 == a1 && HIBYTE(v27) == 4)
      break;
    sub_23A3392C0(v28, HIBYTE(v27), HIBYTE(v27), v20);
    if (v4)
      goto LABEL_24;
  }
  v21 = objc_msgSend(v20, sel_immutableData);
  if (v21)
  {
    v22 = v21;
    v11 = sub_23A362A90();
    v12 = v23;

    v13 = 1;
  }
  else
  {

    v11 = 0;
    v13 = 1;
LABEL_19:
    v12 = 0x1000000000000000;
  }
LABEL_20:
  *(_QWORD *)a3 = v11;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13;
}

uint64_t sub_23A339E8C(uint64_t result, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int *v16;
  unint64_t v17;
  unint64_t v18;
  int *v19;
  int v20;
  int v21;
  int v22;

  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
LABEL_4:
  while (v6)
  {
    v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v9 = v8 | (v2 << 6);
LABEL_22:
    v13 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v9);
    v14 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(a2 + 16);
    if (v14)
    {
      if (!v15)
        return 1;
      if (*(_DWORD *)(v13 + 32) == *(_DWORD *)(a2 + 32))
      {
        v16 = (int *)(v13 + 36);
        v17 = v15 - 1;
        v18 = v14 - 1;
        v19 = (int *)(a2 + 36);
        while (v18)
        {
          if (!v17)
            return 1;
          v21 = *v16++;
          v20 = v21;
          v22 = *v19++;
          --v17;
          --v18;
          if (v20 != v22)
            goto LABEL_4;
        }
        goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      if (v14 == v15)
        return 1;
      if (v14 >= v15)
      {
        __break(1u);
        return 1;
      }
    }
  }
  v10 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v10 >= v7)
    return 0;
  v11 = *(_QWORD *)(v3 + 8 * v10);
  ++v2;
  if (v11)
    goto LABEL_21;
  v2 = v10 + 1;
  if (v10 + 1 >= v7)
    return 0;
  v11 = *(_QWORD *)(v3 + 8 * v2);
  if (v11)
    goto LABEL_21;
  v2 = v10 + 2;
  if (v10 + 2 >= v7)
    return 0;
  v11 = *(_QWORD *)(v3 + 8 * v2);
  if (v11)
    goto LABEL_21;
  v2 = v10 + 3;
  if (v10 + 3 >= v7)
    return 0;
  v11 = *(_QWORD *)(v3 + 8 * v2);
  if (v11)
  {
LABEL_21:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
    goto LABEL_22;
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return 0;
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_21;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return 0;
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_21;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23A33A008(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v7 = objc_allocWithZone(MEMORY[0x24BE7AEF8]);
  sub_23A333494(a3, a4);
  v8 = (void *)sub_23A362A84();
  sub_23A33350C(a3, a4);
  v9 = objc_msgSend(v7, sel_initWithData_, v8);

  if (v9)
    __asm { BR              X10 }
  sub_23A33A230();
  swift_allocError();
  *(_DWORD *)v10 = 0;
  *(_BYTE *)(v10 + 4) = 1;
  swift_willThrow();
  return a2;
}

unint64_t sub_23A33A230()
{
  unint64_t result;

  result = qword_25696C170;
  if (!qword_25696C170)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagTreeOperationError, &type metadata for ProtoTagTreeOperationError);
    atomic_store(result, (unint64_t *)&qword_25696C170);
  }
  return result;
}

uint64_t destroy for WireValue(uint64_t a1)
{
  return sub_23A33A2A0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), sub_23A33350C);
}

uint64_t sub_23A33A2A0(uint64_t result, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  int v4;
  int v5;

  if ((a3 & 1) != 0)
    v4 = 4;
  else
    v4 = 0;
  v5 = (a2 >> 60) & 3 | v4;
  if (v5 != 4)
  {
    if (v5 != 3)
      return result;
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return a4(result, a2);
}

uint64_t _s8Dendrite9WireValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A33A2A0(*(_QWORD *)a2, v4, v5, sub_23A333494);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WireValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A33A2A0(*(_QWORD *)a2, v4, v5, sub_23A333494);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A33A2A0(v6, v7, v8, sub_23A33350C);
  return a1;
}

uint64_t assignWithTake for WireValue(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A33A2A0(v4, v5, v6, sub_23A33350C);
  return a1;
}

uint64_t getEnumTagSinglePayload for WireValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3FB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1019);
  v3 = ((*(_QWORD *)(a1 + 8) >> 60) & 3 | (4 * *(unsigned __int8 *)(a1 + 16))) ^ 0x3FF;
  if (v3 >= 0x3FA)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for WireValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 1019;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3FB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3FB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (-a2 & 3) << 60;
      *(_BYTE *)(result + 16) = -a2 >> 2;
    }
  }
  return result;
}

uint64_t sub_23A33A474(uint64_t a1)
{
  int v1;
  unsigned int v2;

  if (*(_BYTE *)(a1 + 16))
    v1 = 4;
  else
    v1 = 0;
  v2 = (*(_QWORD *)(a1 + 8) >> 60) & 3 | v1;
  if (v2 <= 4)
    return v2;
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_23A33A4A4(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_23A33A4B4(uint64_t result, unsigned int a2)
{
  if (a2 < 5)
  {
    *(_QWORD *)(result + 8) = *(_QWORD *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 60);
    *(_BYTE *)(result + 16) = (a2 & 4) != 0;
  }
  else
  {
    *(_QWORD *)result = a2 - 5;
    *(_QWORD *)(result + 8) = 0x1000000000000000;
    *(_BYTE *)(result + 16) = 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WireValue()
{
  return &type metadata for WireValue;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProtoTagTreeOperationError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ProtoTagTreeOperationError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_23A33A55C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A33A578(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagTreeOperationError()
{
  return &type metadata for ProtoTagTreeOperationError;
}

uint64_t sub_23A33A5A8()
{
  return swift_deallocObject();
}

BOOL sub_23A33A5B8(int a1, int a2)
{
  uint64_t v2;

  return a2 == 4 && *(_DWORD *)(v2 + 16) == a1;
}

uint64_t sub_23A33A5CC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A33A5DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A33A608()
{
  uint64_t v0;

  return sub_23A3397AC(*(id *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t sub_23A33A628(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A33350C(a1, a2);
  return a1;
}

uint64_t sub_23A33A63C()
{
  return swift_deallocObject();
}

_QWORD *sub_23A33A650(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v2[5] = a2;
  v3 = a2 + 24;
  if (__OFADD__(a2, 24))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v3 < a2)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v4 = result;
  v5 = result[4];
  v6 = result[3] > a2 || v5 < a2;
  if (v6 || v5 < v3)
    goto LABEL_8;
  v7 = result[2] + a2;
  v2[2] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C178);
  result = (_QWORD *)swift_allocObject();
  result[2] = v7;
  v2[4] = result;
  v8 = *(unsigned int *)(v7 + 4);
  v9 = __OFADD__(v3, v8);
  v10 = v3 + v8;
  if (v9)
    goto LABEL_17;
  if (v10 >= v3)
  {
    if (v5 >= v10)
    {
      v11 = v4[2];
      swift_release();
      v2[3] = v11 + v3;
      return v2;
    }
    swift_release();
LABEL_8:
    swift_release();
    type metadata accessor for DataFrameReader();
    swift_deallocPartialClassInstance();
    return 0;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23A33A750()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DataFrameReader()
{
  return objc_opt_self();
}

uint64_t sub_23A33A794(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  BOOL v12;
  char v13;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 16);
  v11 = (unsigned __int8 *)(v10 + 8);
  swift_retain();
  v12 = 0;
  v13 = 0;
  while ((v13 & 1) == 0)
  {
    while (!__ldxr(v11))
    {
      v13 = 1;
      if (!__stxr(1u, v11))
        goto LABEL_3;
    }
    v13 = 0;
    __clrex();
LABEL_3:
    v12 = *(_BYTE *)(v10 + 9) == 0;
  }
  if (!v12)
  {
    v13 = 1;
    goto LABEL_3;
  }
  *v11 = 2;
  v15 = sub_23A34FCA8(*(_BYTE **)(a1 + 24), *(unsigned int *)(*(_QWORD *)(v9 + 16) + 4));
  v17 = v16;
  swift_retain();
  sub_23A34EEA8(v15, v17, a2);
  sub_23A33350C(v15, v17);
  *v11 = 0;
  swift_release();
  sub_23A33A9FC(a6);
  swift_release();
  return 1;
}

uint64_t sub_23A33A8E0(uint64_t a1, uint64_t (*a2)(void))
{
  BOOL v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = 0;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 16);
  v7 = (unsigned __int8 *)(v6 + 8);
  while ((v4 & 1) == 0)
  {
    while (!__ldxr(v7))
    {
      v4 = 1;
      if (!__stxr(1u, v7))
        goto LABEL_3;
    }
    v4 = 0;
    __clrex();
LABEL_3:
    v3 = *(_BYTE *)(v6 + 9) == 0;
  }
  if (!v3)
  {
    v4 = 1;
    goto LABEL_3;
  }
  *v7 = 2;
  v9 = sub_23A34FCA8(*(_BYTE **)(a1 + 24), *(unsigned int *)(*(_QWORD *)(v5 + 16) + 4));
  v11 = v10;
  sub_23A34F530(v9, v10, a2);
  sub_23A33350C(v9, v11);
  *v7 = 0;
  return 1;
}

uint64_t sub_23A33A9FC(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

void **sub_23A33AA48(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  id v19;

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
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23A362A3C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = *(int *)(type metadata accessor for StorageContainer() + 20);
    v15 = *(void **)&v10[v14];
    *(_QWORD *)&v9[v14] = v15;
    v16 = *(int *)(a3 + 24);
    v17 = (char *)v7 + v16;
    v18 = (char *)a2 + v16;
    v17[4] = v18[4];
    *(_DWORD *)v17 = *(_DWORD *)v18;
    v19 = v15;
  }
  return v7;
}

void sub_23A33AB20(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23A362A3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

void **sub_23A33AB7C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A362A3C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v6;
  v11(v8, v9, v10);
  v13 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v14 = *(void **)&v9[v13];
  *(_QWORD *)&v8[v13] = v14;
  v15 = *(int *)(a3 + 24);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v16[4] = v17[4];
  *(_DWORD *)v16 = *(_DWORD *)v17;
  v18 = v14;
  return a1;
}

void **sub_23A33AC2C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  int v20;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23A362A3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v14 = *(void **)&v11[v13];
  v15 = *(void **)&v10[v13];
  *(_QWORD *)&v10[v13] = v14;
  v16 = v14;

  v17 = *(int *)(a3 + 24);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_DWORD *)v19;
  v18[4] = v19[4];
  *(_DWORD *)v18 = v20;
  return a1;
}

_QWORD *sub_23A33ACE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A362A3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = type metadata accessor for StorageContainer();
  *(_QWORD *)&v7[*(int *)(v10 + 20)] = *(_QWORD *)&v8[*(int *)(v10 + 20)];
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v12[4] = v13[4];
  *(_DWORD *)v12 = *(_DWORD *)v13;
  return a1;
}

void **sub_23A33AD7C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A362A3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v12 = *(void **)&v8[v11];
  *(_QWORD *)&v8[v11] = *(_QWORD *)&v9[v11];

  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  return a1;
}

uint64_t sub_23A33AE28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A33AE34(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for StorageContainer();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_23A33AEB0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23A33AEBC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for StorageContainer();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for DataFrameStreamContainer()
{
  uint64_t result;

  result = qword_2542D1160;
  if (!qword_2542D1160)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A33AF6C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for StorageContainer();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A33AFEC()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  char *v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _BYTE *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v1 = sub_23A3629C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A362A3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v43 - v10;
  v12 = *(int *)(type metadata accessor for DataFrameStreamContainer() + 24);
  v13 = *(unsigned int *)(v0 + v12);
  v14 = v13 | ((uint64_t)*(char *)(v0 + v12 + 4) << 32);
  if ((v14 & 0x8000000000000000) == 0)
    return v13;
  v44 = v12;
  v45 = v0;
  v47 = v11;
  v48 = v13;
  v46 = v5;
  type metadata accessor for StorageContainer();
  if (_s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0())
  {
    v50[0] = 0x6769666E6F63;
    v50[1] = 0xE600000000000000;
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD7A0], v1);
    sub_23A336470();
    sub_23A362A30();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    v15 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    LOBYTE(v50[0]) = 0;
    sub_23A362A24();
    v16 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v15, sel_fileExistsAtPath_isDirectory_, v16, v50);

    if (v17)
    {
      LODWORD(v18) = v48;
      if ((v50[0] & 1) == 0)
      {
        v19 = v49;
        v20 = sub_23A362A48();
        if (v19)
        {
          v49 = v19;
          (*(void (**)(char *, uint64_t))(v6 + 8))(v47, v46);
          return v13;
        }
        v34 = v20;
        v35 = v21;
        sub_23A36291C();
        swift_allocObject();
        sub_23A362910();
        sub_23A33D874();
        sub_23A362904();
        v49 = 0;
        swift_release();
        sub_23A33350C(v34, v35);
        if ((v14 & 0x100000000) != 0 || LODWORD(v50[0]) == (_DWORD)v48)
        {
          v25 = *(void (**)(char *, uint64_t))(v6 + 8);
          v48 = LODWORD(v50[0]);
          v23 = v47;
          goto LABEL_28;
        }
        v23 = v47;
        sub_23A362A18();
        v36 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
        v25 = *(void (**)(char *, uint64_t))(v6 + 8);
        v26 = v46;
        v25(v9, v46);
        if ((v36 & 1) != 0)
        {
          sub_23A362940();
          swift_allocObject();
          sub_23A362934();
          LODWORD(v50[0]) = v48;
          sub_23A33D830();
          v37 = v49;
          v38 = sub_23A362928();
          if (!v37)
          {
            v30 = v38;
            v31 = v39;
            goto LABEL_18;
          }
LABEL_16:
          swift_release();
          v32 = v23;
          v33 = v46;
LABEL_25:
          v25(v32, v33);
          return v13;
        }
        goto LABEL_24;
      }
    }
    else
    {
      LODWORD(v18) = v48;
    }
    if ((v14 & 0x100000000) != 0)
      v18 = 0x100000;
    else
      v18 = v18;
    v23 = v47;
    sub_23A362A18();
    v24 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
    v25 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26 = v46;
    v25(v9, v46);
    if ((v24 & 1) != 0)
    {
      sub_23A362940();
      swift_allocObject();
      sub_23A362934();
      LODWORD(v50[0]) = v18;
      sub_23A33D830();
      v27 = v49;
      v28 = sub_23A362928();
      if (!v27)
      {
        v30 = v28;
        v31 = v29;
        v48 = v18;
LABEL_18:
        swift_release();
        sub_23A362A9C();
        v49 = 0;
        sub_23A33350C(v30, v31);
LABEL_28:
        v25(v23, v46);
        v42 = v45 + v44;
        *(_BYTE *)(v42 + 4) = 0;
        v13 = v48;
        *(_DWORD *)v42 = v48;
        return v13;
      }
      goto LABEL_16;
    }
LABEL_24:
    sub_23A33D7EC();
    swift_allocError();
    *v40 = 0;
    swift_willThrow();
    v32 = v23;
    v33 = v26;
    goto LABEL_25;
  }
  v13 = v48;
  if ((v14 & 0x100000000) != 0)
  {
    sub_23A33D7EC();
    swift_allocError();
    *v22 = 1;
    swift_willThrow();
  }
  return v13;
}

void sub_23A33B520(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v3 = sub_23A3629C4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataFrameStreamContainer();
  v9[0] = 47;
  v9[1] = 0xE100000000000000;
  sub_23A362C58();
  sub_23A362C58();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD7A0], v3);
  sub_23A336470();
  sub_23A362A30();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  static Storage.ensureFileExists(fileURL:)((unsigned __int8 *)v9);
  if (v1)
    goto LABEL_5;
  if (LOBYTE(v9[0]) != 2 && (v9[0] & 1) == 0)
  {
    sub_23A33D8BC();
    swift_allocError();
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0;
    *(_BYTE *)(v7 + 16) = 2;
    swift_willThrow();
LABEL_5:
    v8 = sub_23A362A3C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  }
}

char *sub_23A33B6C8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23A362A3C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  type metadata accessor for DataFrameStreamContainer();
  sub_23A35511C();
  v12 = v10;
  if (!v10)
    return 0;
  v24 = 0;
  v30 = (char *)MEMORY[0x24BEE4AF8];
  v27 = *(_QWORD *)(v10 + 16);
  if (v27)
  {
    v28 = v7;
    v29 = v9;
    v13 = 0;
    v25 = v2;
    v26 = v10;
    while (1)
    {
      if (v13 >= *(_QWORD *)(v12 + 16))
      {
        __break(1u);
        goto LABEL_24;
      }
      v14 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v15 = *(_QWORD *)(v4 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v2, v12 + v14 + v15 * v13, v3);
      v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      v16(v2, 0, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
        goto LABEL_21;
      v17 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
      v17(v9, v2, v3);
      if (sub_23A3629D0() == 0x746E656D676573 && v18 == 0xE700000000000000)
        break;
      v19 = sub_23A362EE0();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_14;
      v9 = v29;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v29, v3);
      v12 = v26;
LABEL_7:
      if (v27 == ++v13)
        goto LABEL_20;
    }
    swift_bridgeObjectRelease();
LABEL_14:
    v17(v28, v29, v3);
    v20 = v30;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_23A353EE4(0, *((_QWORD *)v20 + 2) + 1, 1);
      v20 = v30;
    }
    v22 = *((_QWORD *)v20 + 2);
    v21 = *((_QWORD *)v20 + 3);
    if (v22 >= v21 >> 1)
    {
      sub_23A353EE4(v21 > 1, v22 + 1, 1);
      v20 = v30;
    }
    *((_QWORD *)v20 + 2) = v22 + 1;
    v17(&v20[v14 + v22 * v15], v28, v3);
    v30 = v20;
    v2 = v25;
    v12 = v26;
    v9 = v29;
    goto LABEL_7;
  }
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
LABEL_20:
  v16(v2, 1, 1, v3);
LABEL_21:
  swift_bridgeObjectRelease();
  sub_23A336CFC((uint64_t)v2);
  swift_retain();
  v23 = v24;
  sub_23A33C048((_QWORD **)&v30);
  if (v23)
  {
LABEL_24:
    result = (char *)swift_release();
    __break(1u);
  }
  else
  {
    swift_release();
    return v30;
  }
  return result;
}

_QWORD *sub_23A33B9F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;

  v0 = sub_23A362A3C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v29 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)v24 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A33B6C8();
  if (!v8)
    return 0;
  v9 = *((_QWORD *)v8 + 2);
  if (v9)
  {
    v10 = &v8[(*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)];
    v11 = *(_QWORD *)(v1 + 72);
    v24[1] = v8;
    v25 = v11;
    v27 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v26 = v1;
    v13 = v28;
    while (1)
    {
      v27(v7, v10, v0);
      v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
      v14(v7, 0, 1, v0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v7, 1, v0) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v13, v7, v0);
      v15 = v29;
      sub_23A362A0C();
      v16 = sub_23A3629F4();
      v30 = v17;
      v18 = *(void (**)(char *, uint64_t))(v1 + 8);
      v18(v15, v0);
      v18(v13, v0);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_23A35F504(0, v12[2] + 1, 1, v12);
      v20 = v12[2];
      v19 = v12[3];
      if (v20 >= v19 >> 1)
        v12 = sub_23A35F504((_QWORD *)(v19 > 1), v20 + 1, 1, v12);
      v12[2] = v20 + 1;
      v21 = &v12[2 * v20];
      v22 = v30;
      v21[4] = v16;
      v21[5] = v22;
      v1 = v26;
      v10 += v25;
      if (!--v9)
      {
        v14(v7, 1, 1, v0);
        break;
      }
    }
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v7, 1, 1, v0);
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_23A33BC68()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t *v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v1 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A3629C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23A362A3C();
  v8 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataFrameStreamContainer();
  v25 = 1801678700;
  v26 = 0xE400000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCD7A0], v4);
  sub_23A336470();
  sub_23A362A30();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  v11 = *v0;
  sub_23A362A24();
  v12 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_fileExistsAtPath_, v12);

  if ((v13 & 1) == 0)
  {
    sub_23A362A24();
    v14 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v11, sel_createFileAtPath_contents_attributes_, v14, 0, 0);

    if ((v15 & 1) == 0)
    {
      if (qword_2542D0118 != -1)
        swift_once();
      v19 = __swift_project_value_buffer(v1, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v19, (uint64_t)v3);
      v25 = 0;
      v26 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v25 = 0xD00000000000001FLL;
      v26 = 0x800000023A365D20;
      sub_23A362A24();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v25, v26, 0xD00000000000006BLL, 0x800000023A365D40, 0xD000000000000015, 0x800000023A365DB0);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v3);
      v20 = sub_23A362A24();
      v5 = v21;
      sub_23A33D8BC();
      swift_allocError();
      *(_QWORD *)v22 = v20;
      *(_QWORD *)(v22 + 8) = v5;
      *(_BYTE *)(v22 + 16) = 0;
      swift_willThrow();
      goto LABEL_11;
    }
  }
  if (qword_25696BD98 != -1)
    swift_once();
  v16 = (uint64_t *)(qword_25696E8F0 + 16);
  v17 = (os_unfair_lock_s *)(qword_25696E8F0 + 24);
  swift_retain();
  os_unfair_lock_lock(v17);
  v18 = v24[1];
  sub_23A35A36C(v16, (uint64_t)v10, &v25);
  if (v18)
  {
    os_unfair_lock_unlock(v17);
    swift_release();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
    return v5;
  }
  os_unfair_lock_unlock(v17);
  v5 = v25;
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
  return v5;
}

uint64_t sub_23A33C048(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_23A362A3C() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_23A33D7D8(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23A33C0C8(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23A33C0C8(uint64_t *a1)
{
  uint64_t v1;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
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
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  char *v77;
  void (*v78)(char *, uint64_t, uint64_t);
  unint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  char *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char *v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;

  v2 = v1;
  v4 = sub_23A362A3C();
  v159 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v146 = (char *)&v138 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v153 = (char *)&v138 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v155 = (char *)&v138 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v154 = (char *)&v138 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v142 = (char *)&v138 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v149 = (char *)&v138 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v144 = (char *)&v138 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v143 = (char *)&v138 - v19;
  v158 = a1;
  v20 = a1[1];
  result = sub_23A362EBC();
  if (result >= v20)
  {
    if (v20 < 0)
      goto LABEL_150;
    if (v20)
      return sub_23A33CC60(0, v20, 1, v158);
    return result;
  }
  if (v20 >= 0)
    v22 = v20;
  else
    v22 = v20 + 1;
  if (v20 < -1)
    goto LABEL_158;
  v139 = result;
  if (v20 < 2)
  {
    v27 = (char *)MEMORY[0x24BEE4AF8];
    v26 = MEMORY[0x24BEE4AF8]
        + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
    v138 = MEMORY[0x24BEE4AF8];
    if (v20 != 1)
    {
      v29 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_116:
      if (v29 >= 2)
      {
        v131 = *v158;
        do
        {
          v132 = v29 - 2;
          if (v29 < 2)
            goto LABEL_145;
          if (!v131)
            goto LABEL_157;
          v133 = *(_QWORD *)&v27[16 * v132 + 32];
          v134 = *(_QWORD *)&v27[16 * v29 + 24];
          v135 = v26;
          sub_23A33CF28(v131 + *(_QWORD *)(v159 + 72) * v133, v131 + *(_QWORD *)(v159 + 72) * *(_QWORD *)&v27[16 * v29 + 16], v131 + *(_QWORD *)(v159 + 72) * v134, v26);
          if (v2)
            break;
          if (v134 < v133)
            goto LABEL_146;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v27 = sub_23A33D7B0((uint64_t)v27);
          if (v132 >= *((_QWORD *)v27 + 2))
            goto LABEL_147;
          v136 = &v27[16 * v132 + 32];
          *(_QWORD *)v136 = v133;
          *((_QWORD *)v136 + 1) = v134;
          v137 = *((_QWORD *)v27 + 2);
          if (v29 > v137)
            goto LABEL_148;
          memmove(&v27[16 * v29 + 16], &v27[16 * v29 + 32], 16 * (v137 - v29));
          *((_QWORD *)v27 + 2) = v137 - 1;
          v29 = v137 - 1;
          v26 = v135;
        }
        while (v137 > 2);
      }
LABEL_127:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v138 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v23 = v22 >> 1;
    v24 = sub_23A362D00();
    *(_QWORD *)(v24 + 16) = v23;
    v25 = *(unsigned __int8 *)(v159 + 80);
    v138 = v24;
    v26 = v24 + ((v25 + 32) & ~v25);
  }
  v28 = 0;
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v148 = v26;
  v152 = v4;
  while (1)
  {
    v30 = v28;
    v31 = v28 + 1;
    if (v28 + 1 >= v20)
    {
      v39 = v28 + 1;
      goto LABEL_67;
    }
    v156 = v20;
    v32 = *v158;
    v33 = *(_QWORD *)(v159 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 16);
    v34(v143, *v158 + v33 * v31, v4);
    v147 = v30;
    v145 = v32;
    v157 = v33;
    v34(v144, v32 + v33 * v30, v4);
    v35 = sub_23A3629F4();
    v37 = v36;
    if (v35 == sub_23A3629F4() && v37 == v38)
      LODWORD(v151) = 0;
    else
      LODWORD(v151) = sub_23A362EE0();
    v40 = v142;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v41 = *(void (**)(char *, uint64_t))(v159 + 8);
    v42 = v152;
    v41(v144, v152);
    v41(v143, v42);
    v39 = v147 + 2;
    if (v147 + 2 < v156)
    {
      v140 = v27;
      v141 = v2;
      v150 = v157 * v31;
      v43 = v145;
      v44 = v157 * v39;
      while (1)
      {
        v45 = v152;
        v34(v149, v43 + v44, v152);
        v34(v40, v43 + v150, v45);
        v46 = sub_23A3629F4();
        v48 = v47;
        if (v46 == sub_23A3629F4() && v48 == v49)
          v50 = 0;
        else
          v50 = sub_23A362EE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v51 = v152;
        v41(v40, v152);
        v41(v149, v51);
        if (((v151 ^ v50) & 1) != 0)
          break;
        ++v39;
        v43 += v157;
        if (v156 == v39)
        {
          v52 = v156;
          v39 = v156;
          v27 = v140;
          v2 = v141;
          goto LABEL_32;
        }
      }
      v27 = v140;
      v2 = v141;
    }
    v52 = v156;
LABEL_32:
    v30 = v147;
    v53 = v145;
    if ((v151 & 1) == 0)
      break;
    if (v39 < v147)
      goto LABEL_151;
    if (v147 >= v39)
      break;
    v140 = v27;
    v141 = v2;
    v54 = 0;
    v55 = v157 * (v39 - 1);
    v56 = v39 * v157;
    v57 = v147;
    v58 = v147 * v157;
    do
    {
      if (v57 != v39 + v54 - 1)
      {
        if (!v53)
          goto LABEL_156;
        v60 = v39;
        v61 = v53 + v55;
        v151 = *(_QWORD *)(v159 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v151)(v146, v53 + v58, v152);
        if (v58 < v55 || v53 + v58 >= (unint64_t)(v53 + v56))
        {
          v59 = v152;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v59 = v152;
          if (v58 != v55)
            swift_arrayInitWithTakeBackToFront();
        }
        ((void (*)(uint64_t, char *, uint64_t))v151)(v61, v146, v59);
        v39 = v60;
        v53 = v145;
      }
      ++v57;
      --v54;
      v55 -= v157;
      v56 -= v157;
      v58 += v157;
    }
    while (v57 < v39 + v54);
    v27 = v140;
    v2 = v141;
    v62 = v152;
    v30 = v147;
    v52 = v156;
    if (v39 < v156)
      goto LABEL_48;
LABEL_67:
    if (v39 < v30)
      goto LABEL_144;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v27 = sub_23A33D504(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
    v80 = *((_QWORD *)v27 + 2);
    v79 = *((_QWORD *)v27 + 3);
    v29 = v80 + 1;
    v26 = v148;
    v157 = v39;
    if (v80 >= v79 >> 1)
    {
      v130 = sub_23A33D504((char *)(v79 > 1), v80 + 1, 1, v27);
      v26 = v148;
      v27 = v130;
    }
    *((_QWORD *)v27 + 2) = v29;
    v81 = v27 + 32;
    v82 = &v27[16 * v80 + 32];
    v83 = v157;
    *(_QWORD *)v82 = v30;
    *((_QWORD *)v82 + 1) = v83;
    if (v80)
    {
      while (1)
      {
        v84 = v29 - 1;
        if (v29 >= 4)
        {
          v89 = &v81[16 * v29];
          v90 = *((_QWORD *)v89 - 8);
          v91 = *((_QWORD *)v89 - 7);
          v95 = __OFSUB__(v91, v90);
          v92 = v91 - v90;
          if (v95)
            goto LABEL_133;
          v94 = *((_QWORD *)v89 - 6);
          v93 = *((_QWORD *)v89 - 5);
          v95 = __OFSUB__(v93, v94);
          v87 = v93 - v94;
          v88 = v95;
          if (v95)
            goto LABEL_134;
          v96 = v29 - 2;
          v97 = &v81[16 * v29 - 32];
          v99 = *(_QWORD *)v97;
          v98 = *((_QWORD *)v97 + 1);
          v95 = __OFSUB__(v98, v99);
          v100 = v98 - v99;
          if (v95)
            goto LABEL_136;
          v95 = __OFADD__(v87, v100);
          v101 = v87 + v100;
          if (v95)
            goto LABEL_139;
          if (v101 >= v92)
          {
            v119 = &v81[16 * v84];
            v121 = *(_QWORD *)v119;
            v120 = *((_QWORD *)v119 + 1);
            v95 = __OFSUB__(v120, v121);
            v122 = v120 - v121;
            if (v95)
              goto LABEL_143;
            v112 = v87 < v122;
            goto LABEL_104;
          }
        }
        else
        {
          if (v29 != 3)
          {
            v113 = *((_QWORD *)v27 + 4);
            v114 = *((_QWORD *)v27 + 5);
            v95 = __OFSUB__(v114, v113);
            v106 = v114 - v113;
            v107 = v95;
            goto LABEL_98;
          }
          v86 = *((_QWORD *)v27 + 4);
          v85 = *((_QWORD *)v27 + 5);
          v95 = __OFSUB__(v85, v86);
          v87 = v85 - v86;
          v88 = v95;
        }
        if ((v88 & 1) != 0)
          goto LABEL_135;
        v96 = v29 - 2;
        v102 = &v81[16 * v29 - 32];
        v104 = *(_QWORD *)v102;
        v103 = *((_QWORD *)v102 + 1);
        v105 = __OFSUB__(v103, v104);
        v106 = v103 - v104;
        v107 = v105;
        if (v105)
          goto LABEL_138;
        v108 = &v81[16 * v84];
        v110 = *(_QWORD *)v108;
        v109 = *((_QWORD *)v108 + 1);
        v95 = __OFSUB__(v109, v110);
        v111 = v109 - v110;
        if (v95)
          goto LABEL_141;
        if (__OFADD__(v106, v111))
          goto LABEL_142;
        if (v106 + v111 >= v87)
        {
          v112 = v87 < v111;
LABEL_104:
          if (v112)
            v84 = v96;
          goto LABEL_106;
        }
LABEL_98:
        if ((v107 & 1) != 0)
          goto LABEL_137;
        v115 = &v81[16 * v84];
        v117 = *(_QWORD *)v115;
        v116 = *((_QWORD *)v115 + 1);
        v95 = __OFSUB__(v116, v117);
        v118 = v116 - v117;
        if (v95)
          goto LABEL_140;
        if (v118 < v106)
          goto LABEL_14;
LABEL_106:
        v123 = v84 - 1;
        if (v84 - 1 >= v29)
        {
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
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
          goto LABEL_153;
        }
        if (!*v158)
          goto LABEL_155;
        v124 = v27;
        v125 = &v81[16 * v123];
        v126 = *(_QWORD *)v125;
        v127 = &v81[16 * v84];
        v128 = *((_QWORD *)v127 + 1);
        sub_23A33CF28(*v158 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v125, *v158 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v127, *v158 + *(_QWORD *)(v159 + 72) * v128, v26);
        if (v2)
          goto LABEL_127;
        if (v128 < v126)
          goto LABEL_130;
        if (v84 > *((_QWORD *)v124 + 2))
          goto LABEL_131;
        *(_QWORD *)v125 = v126;
        *(_QWORD *)&v81[16 * v123 + 8] = v128;
        v129 = *((_QWORD *)v124 + 2);
        if (v84 >= v129)
          goto LABEL_132;
        v27 = v124;
        v29 = v129 - 1;
        memmove(&v81[16 * v84], v127 + 16, 16 * (v129 - 1 - v84));
        *((_QWORD *)v124 + 2) = v129 - 1;
        v26 = v148;
        if (v129 <= 2)
          goto LABEL_14;
      }
    }
    v29 = 1;
LABEL_14:
    v20 = v158[1];
    v28 = v157;
    v4 = v152;
    if (v157 >= v20)
      goto LABEL_116;
  }
  v62 = v152;
  if (v39 >= v52)
    goto LABEL_67;
LABEL_48:
  if (__OFSUB__(v39, v30))
    goto LABEL_149;
  if (v39 - v30 >= v139)
    goto LABEL_67;
  if (__OFADD__(v30, v139))
    goto LABEL_152;
  if (v30 + v139 >= v52)
    v63 = v52;
  else
    v63 = v30 + v139;
  if (v63 >= v30)
  {
    if (v39 != v63)
    {
      v147 = v30;
      v140 = v27;
      v141 = v2;
      v64 = *(_QWORD *)(v159 + 72);
      v150 = *(_QWORD *)(v159 + 16);
      v151 = v64;
      v156 = v39 * v64;
      v157 = v64 * (v39 - 1);
      v145 = v63;
      do
      {
        v66 = 0;
        v67 = v147;
        while (1)
        {
          v68 = *v158;
          v69 = (void (*)(char *, uint64_t, uint64_t))v150;
          ((void (*)(char *, uint64_t, uint64_t))v150)(v154, v156 + v66 + *v158, v62);
          v69(v155, v157 + v66 + v68, v62);
          v70 = sub_23A3629F4();
          v72 = v71;
          if (v70 == sub_23A3629F4() && v72 == v73)
            break;
          v74 = sub_23A362EE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v75 = *(void (**)(char *, uint64_t))(v159 + 8);
          v62 = v152;
          v75(v155, v152);
          v75(v154, v62);
          if ((v74 & 1) == 0)
            goto LABEL_58;
          v76 = *v158;
          if (!*v158)
            goto LABEL_154;
          v77 = (char *)(v76 + v157 + v66);
          v78 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 32);
          v78(v153, v76 + v156 + v66, v62);
          swift_arrayInitWithTakeFrontToBack();
          v78(v77, (uint64_t)v153, v62);
          v66 -= v151;
          if (v39 == ++v67)
            goto LABEL_58;
        }
        swift_bridgeObjectRelease_n();
        v65 = *(void (**)(char *, uint64_t))(v159 + 8);
        v62 = v152;
        v65(v155, v152);
        v65(v154, v62);
LABEL_58:
        ++v39;
        v157 += v151;
        v156 += v151;
      }
      while (v39 != v145);
      v39 = v145;
      v27 = v140;
      v2 = v141;
      v30 = v147;
    }
    goto LABEL_67;
  }
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  result = sub_23A362E5C();
  __break(1u);
  return result;
}

uint64_t sub_23A33CC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  _QWORD *v38;
  char *v39;
  char *v40;
  uint64_t v41;

  v37 = a4;
  v31 = a1;
  v6 = sub_23A362A3C();
  v38 = *(_QWORD **)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v29 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v29 - v12;
  v35 = a3;
  v30 = a2;
  if (a3 != a2)
  {
    v13 = v38[9];
    v32 = (void (*)(char *, uint64_t, uint64_t))v38[2];
    v33 = v13;
    v14 = v13 * (v35 - 1);
    v41 = v13 * v35;
LABEL_6:
    v16 = 0;
    v17 = v31;
    v34 = v14;
    while (1)
    {
      v18 = *v37;
      v19 = v32;
      v32(v39, v41 + v16 + *v37, v6);
      v19(v40, v14 + v16 + v18, v6);
      v20 = sub_23A3629F4();
      v22 = v21;
      if (v20 == sub_23A3629F4() && v22 == v23)
      {
        swift_bridgeObjectRelease_n();
        v15 = (void (*)(char *, uint64_t))v38[1];
        v15(v40, v6);
        result = ((uint64_t (*)(char *, uint64_t))v15)(v39, v6);
        v14 = v34;
LABEL_5:
        v14 += v33;
        v41 += v33;
        if (++v35 == v30)
          return result;
        goto LABEL_6;
      }
      v24 = sub_23A362EE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v25 = (void (*)(char *, uint64_t))v38[1];
      v25(v40, v6);
      result = ((uint64_t (*)(char *, uint64_t))v25)(v39, v6);
      v14 = v34;
      if ((v24 & 1) == 0)
        goto LABEL_5;
      v26 = *v37;
      if (!*v37)
        break;
      v27 = v26 + v34 + v16;
      v28 = (void (*)(char *, uint64_t, uint64_t))v38[4];
      v28(v36, v26 + v41 + v16, v6);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v27, v36, v6);
      v16 -= v33;
      if (v35 == ++v17)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A33CF28(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
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
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(char *, unint64_t, uint64_t);
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void (*v48)(char *, uint64_t);
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;

  v8 = sub_23A362A3C();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v57 = (char *)&v54 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v54 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v54 - v16;
  v19 = *(_QWORD *)(v18 + 72);
  v59 = v18;
  v60 = v19;
  if (!v19)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (a2 - a1 == 0x8000000000000000 && v60 == -1)
    goto LABEL_69;
  v20 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v60 == -1)
    goto LABEL_70;
  v21 = (uint64_t)(a2 - a1) / v60;
  v63 = a1;
  v62 = a4;
  v22 = v20 / v60;
  if (v21 >= v20 / v60)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      v24 = v22 * v60;
      if (a4 < a2 || a2 + v24 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v37 = a4 + v24;
      v61 = a4 + v24;
      v63 = a2;
      if (v24 >= 1 && a1 < a2)
      {
        v39 = -v60;
        v60 = *(_QWORD *)(v59 + 16);
        v55 = a4;
        v56 = a1;
        do
        {
          v40 = a3;
          v41 = (void (*)(char *, unint64_t, uint64_t))v60;
          ((void (*)(char *, unint64_t, uint64_t))v60)(v57, v37 + v39, v8);
          v42 = a2 + v39;
          v41(v58, a2 + v39, v8);
          v43 = sub_23A3629F4();
          v45 = v44;
          if (v43 == sub_23A3629F4() && v45 == v46)
            v47 = 0;
          else
            v47 = sub_23A362EE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a3 += v39;
          v48 = *(void (**)(char *, uint64_t))(v59 + 8);
          v48(v58, v8);
          v48(v57, v8);
          if ((v47 & 1) != 0)
          {
            if (v40 < a2 || a3 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v50 = v55;
              v51 = v56;
            }
            else
            {
              v49 = v40 == a2;
              v50 = v55;
              v51 = v56;
              if (!v49)
                swift_arrayInitWithTakeBackToFront();
            }
            v63 += v39;
          }
          else
          {
            v52 = v61;
            v61 += v39;
            if (v40 < v52 || a3 >= v52)
            {
              swift_arrayInitWithTakeFrontToBack();
              v42 = a2;
              v50 = v55;
              v51 = v56;
            }
            else
            {
              v51 = v56;
              if (v40 != v52)
                swift_arrayInitWithTakeBackToFront();
              v42 = a2;
              v50 = v55;
            }
          }
          v37 = v61;
          if (v61 <= v50)
            break;
          a2 = v42;
        }
        while (v42 > v51);
      }
LABEL_67:
      sub_23A33D6A4(&v63, &v62, (uint64_t *)&v61);
      return 1;
    }
  }
  else if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21 * v60;
    if (a4 < a1 || a1 + v23 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v58 = (char *)(a4 + v23);
    v61 = a4 + v23;
    if (v23 >= 1 && a2 < a3)
    {
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v59 + 16);
      while (1)
      {
        v26(v17, a2, v8);
        v26(v15, a4, v8);
        v27 = sub_23A3629F4();
        v29 = v28;
        if (v27 == sub_23A3629F4() && v29 == v30)
          break;
        v32 = sub_23A362EE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v59 + 8);
        v33(v15, v8);
        v33(v17, v8);
        if ((v32 & 1) == 0)
          goto LABEL_31;
        v34 = v63;
        v35 = a2 + v60;
        if (v63 < a2 || v63 >= v35)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v63 == a2)
        {
          v34 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_37:
        v63 = v34 + v60;
        a4 = v62;
        if (v62 < (unint64_t)v58)
        {
          a2 = v35;
          if (v35 < a3)
            continue;
        }
        goto LABEL_67;
      }
      swift_bridgeObjectRelease_n();
      v31 = *(void (**)(char *, uint64_t))(v59 + 8);
      v31(v15, v8);
      v31(v17, v8);
LABEL_31:
      v34 = v63;
      v36 = v62 + v60;
      if (v63 < v62 || v63 >= v36)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v63 != v62)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v62 = v36;
      v35 = a2;
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_71:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

char *sub_23A33D504(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C198);
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

char *sub_23A33D5FC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_23A362E8C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

uint64_t sub_23A33D6A4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
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
  result = sub_23A362A3C();
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
    result = sub_23A362E8C();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_23A33D7B0(uint64_t a1)
{
  return sub_23A33D504(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A33D7C4(uint64_t a1)
{
  return sub_23A3543C8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A33D7D8(_QWORD *a1)
{
  return sub_23A354530(0, a1[2], 0, a1);
}

unint64_t sub_23A33D7EC()
{
  unint64_t result;

  result = qword_25696C180;
  if (!qword_25696C180)
  {
    result = MEMORY[0x23B849AC0](&unk_23A3646C8, &type metadata for DataFrameStreamConfigurationError);
    atomic_store(result, (unint64_t *)&qword_25696C180);
  }
  return result;
}

unint64_t sub_23A33D830()
{
  unint64_t result;

  result = qword_25696C188;
  if (!qword_25696C188)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364708, &type metadata for DataFrameStreamConfiguration);
    atomic_store(result, (unint64_t *)&qword_25696C188);
  }
  return result;
}

unint64_t sub_23A33D874()
{
  unint64_t result;

  result = qword_25696C190;
  if (!qword_25696C190)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364730, &type metadata for DataFrameStreamConfiguration);
    atomic_store(result, (unint64_t *)&qword_25696C190);
  }
  return result;
}

unint64_t sub_23A33D8BC()
{
  unint64_t result;

  result = qword_25696C1A0;
  if (!qword_25696C1A0)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364E2C, &type metadata for StorageError);
    atomic_store(result, (unint64_t *)&qword_25696C1A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamContainer.ConfigurationState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 127);
  v3 = ((*(unsigned __int8 *)(a1 + 4) >> 7) & 0xFFFFFF81 | (2 * ((*(unsigned __int8 *)(a1 + 4) >> 1) & 0x3F))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamContainer.ConfigurationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
    {
      *(_DWORD *)result = 0;
      *(_BYTE *)(result + 4) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_23A33D9A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4) >> 7;
}

uint64_t sub_23A33D9B4(uint64_t result)
{
  *(_BYTE *)(result + 4) &= ~0x80u;
  return result;
}

unsigned int *sub_23A33D9CC(unsigned int *result, uint64_t a2)
{
  *((_BYTE *)result + 4) = ((*result | ((unint64_t)*((unsigned __int8 *)result + 4) << 32)) & 0x1FFFFFFFFLL | (a2 << 39)) >> 32;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamContainer.ConfigurationState()
{
  return &type metadata for DataFrameStreamContainer.ConfigurationState;
}

uint64_t sub_23A33D9FC(int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 aBlock;
  uint64_t (*v25)(uint64_t);
  ValueMetadata *v26;
  uint64_t (*v27)();
  uint64_t v28;
  __int128 v29[2];
  _BYTE v30[40];
  _BYTE v31[32];
  uint64_t v32;

  v21 = a4;
  v22 = a3;
  v8 = sub_23A362B38();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A362B5C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = 0;
  memset(v31, 0, sizeof(v31));
  if ((a2 & 1) != 0)
  {
    v16 = MKBGetDeviceLockState();
    v26 = &type metadata for EmbeddedDeviceLockState;
    v27 = (uint64_t (*)())&off_250B4B448;
    LODWORD(aBlock) = v16;
  }
  else
  {
    v26 = &type metadata for EmbeddedDeviceLockState;
    v27 = (uint64_t (*)())&off_250B4B448;
    LODWORD(aBlock) = a1;
  }
  sub_23A33DD8C((uint64_t)v31);
  sub_23A33DDCC((uint64_t)&aBlock, (uint64_t)v31);
  sub_23A33DE14((uint64_t)v31, (uint64_t)&aBlock);
  if (v26)
  {
    sub_23A33DE5C(&aBlock, (uint64_t)v30);
    sub_23A33DE74((uint64_t)v30, (uint64_t)v29);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v21;
    *(_QWORD *)(v17 + 24) = a5;
    sub_23A33DE5C(v29, v17 + 32);
    v27 = sub_23A33DF04;
    v28 = v17;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v25 = sub_23A33DCA8;
    v26 = (ValueMetadata *)&block_descriptor;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    sub_23A362B44();
    v23 = MEMORY[0x24BEE4AF8];
    sub_23A33DF44();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1B8);
    sub_23A33DF8C();
    sub_23A362DF0();
    MEMORY[0x23B8492F8](0, v15, v11, v18);
    _Block_release(v18);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    sub_23A33DD8C((uint64_t)v31);
    return swift_release();
  }
  else
  {
    sub_23A33DD8C((uint64_t)v31);
    return sub_23A33DD8C((uint64_t)&aBlock);
  }
}

uint64_t sub_23A33DCA8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23A33DCD4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + 56) + 136);
  v2 = swift_retain();
  atomic_store(1u, (unsigned __int8 *)v1(v2));
  swift_release();
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceLockStateNotificationObserver()
{
  return objc_opt_self();
}

uint64_t sub_23A33DD8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A33DDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A33DE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A33DE5C(__int128 *a1, uint64_t a2)
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

uint64_t sub_23A33DE74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A33DEB8()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
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

uint64_t sub_23A33DF04()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
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

unint64_t sub_23A33DF44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696C1B0;
  if (!qword_25696C1B0)
  {
    v1 = sub_23A362B38();
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_25696C1B0);
  }
  return result;
}

unint64_t sub_23A33DF8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696C1C0;
  if (!qword_25696C1C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25696C1B8);
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25696C1C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B849AB4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A33E01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23A33E058(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A362B08();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23A33E08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A33E0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A33E114(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A33E158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A33E19C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A33E1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23A33E1E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A33E1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362B08();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result;

  result = qword_2542D1108;
  if (!qword_2542D1108)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A33E26C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A362B08();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A33E2D4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A33E2F8(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE7908]);
}

uint64_t sub_23A33E2E0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A33E2F8(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE7910]);
}

uint64_t sub_23A33E2EC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A33E2F8(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE78F0]);
}

uint64_t sub_23A33E2F8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE v29[4];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a5;
  v36 = a1;
  v33 = a3;
  v34 = sub_23A362A3C();
  v11 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = &v29[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_23A362B08();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v37 = a2;
  swift_bridgeObjectRetain_n();
  v18 = sub_23A362AFC();
  v19 = a7();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v32 = v15;
    v22 = v21;
    v31 = swift_slowAlloc();
    v39 = v31;
    *(_DWORD *)v22 = 136315650;
    sub_23A3629E8();
    v30 = v20;
    v23 = sub_23A3629F4();
    v33 = v14;
    v25 = v24;
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v34);
    v38 = sub_23A33EA68(v23, v25, &v39);
    sub_23A362DD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    v38 = sub_23A33EA68(v35, a6, &v39);
    sub_23A362DD8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    v26 = v37;
    swift_bridgeObjectRetain();
    v38 = sub_23A33EA68(v36, v26, &v39);
    sub_23A362DD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A331000, v18, (os_log_type_t)v30, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    v27 = v31;
    swift_arrayDestroy();
    MEMORY[0x23B849B5C](v27, -1, -1);
    MEMORY[0x23B849B5C](v22, -1, -1);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v32 + 8))(v17, v33);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_23A33E610(uint64_t a1)
{
  return sub_23A33E728(a1, qword_25696E870, &qword_25696BD20, (id *)&qword_25696C1C8);
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

uint64_t sub_23A33E674(uint64_t a1)
{
  return sub_23A33E728(a1, qword_25696E888, &qword_25696BD28, (id *)&qword_25696C1D0);
}

uint64_t sub_23A33E698(uint64_t a1)
{
  return sub_23A33E728(a1, qword_25696E8A0, qword_25696BD30, (id *)&qword_25696C1D8);
}

uint64_t sub_23A33E6BC(uint64_t a1)
{
  return sub_23A33E728(a1, qword_2542D12A8, &qword_2542D0148, (id *)&qword_2542D0140);
}

uint64_t sub_23A33E6E0(uint64_t a1)
{
  return sub_23A33E728(a1, qword_25696E8B8, &qword_25696BD40, (id *)&qword_25696C1E0);
}

uint64_t sub_23A33E704(uint64_t a1)
{
  return sub_23A33E728(a1, qword_25696E8D0, &qword_25696BD48, (id *)&qword_25696C1E8);
}

uint64_t sub_23A33E728(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v7 = sub_23A362B08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InternalLogger();
  __swift_allocate_value_buffer(v11, a2);
  v12 = __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v13 = *a4;
  sub_23A362B14();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v7);
}

uint64_t sub_23A33E808()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_25696C1C8 = result;
  return result;
}

unint64_t sub_23A33E858()
{
  unint64_t result;

  result = qword_2542D0150;
  if (!qword_2542D0150)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D0150);
  }
  return result;
}

uint64_t sub_23A33E894()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_25696C1D0 = result;
  return result;
}

uint64_t sub_23A33E8FC()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_25696C1D8 = result;
  return result;
}

uint64_t sub_23A33E950()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_2542D0140 = result;
  return result;
}

uint64_t sub_23A33E9AC()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_25696C1E0 = result;
  return result;
}

uint64_t sub_23A33EA10()
{
  uint64_t result;

  sub_23A33E858();
  result = sub_23A362DB4();
  qword_25696C1E8 = result;
  return result;
}

uint64_t sub_23A33EA68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A33EB38(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A33F044((uint64_t)v12, *a3);
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
      sub_23A33F044((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A33EB38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A362DE4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A33ECF0(a5, a6);
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
  v8 = sub_23A362E44();
  if (!v8)
  {
    sub_23A362E5C();
    __break(1u);
LABEL_17:
    result = sub_23A362E8C();
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

uint64_t sub_23A33ECF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A33ED84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A33EEF8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A33EEF8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A33ED84(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A35DE34(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A362E38();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A362E5C();
      __break(1u);
LABEL_10:
      v2 = sub_23A362C64();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A362E8C();
    __break(1u);
LABEL_14:
    result = sub_23A362E5C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_23A33EEF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1F0);
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A33F044(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A33F080()
{
  return 1;
}

uint64_t sub_23A33F088()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t sub_23A33F0C8()
{
  return sub_23A362F40();
}

uint64_t sub_23A33F0EC()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t DataFrameStream.__allocating_init(containerURL:segmentSize:protection:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for StorageContainer();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A362A3C();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  *(_QWORD *)&v8[*(int *)(v6 + 20)] = a3;
  v11 = swift_allocObject();
  DataFrameStream.init(storageContainer:segmentSize:)((uint64_t)v8, a2, 0);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v11;
}

uint64_t DataFrameStream.__allocating_init(storageContainer:segmentSize:)(uint64_t a1, unint64_t a2, char a3)
{
  char v5;
  uint64_t v6;

  v5 = a3 & 1;
  v6 = swift_allocObject();
  DataFrameStream.init(storageContainer:segmentSize:)(a1, a2, v5);
  return v6;
}

uint64_t DataFrameStream.init(storageContainer:segmentSize:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  os_unfair_lock_s *v31;
  os_unfair_lock_s *v32;
  os_unfair_lock_s *v33;
  _QWORD v35[2];
  char v36;
  id v37;
  uint64_t v38[2];

  v4 = v3;
  v8 = type metadata accessor for DataFrameStreamContainer();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (_QWORD *)((char *)v35 - v12);
  v14 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) != 0)
  {
    LODWORD(a2) = 0;
    v18 = 0x100000000;
  }
  else if (HIDWORD(a2))
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v14, (uint64_t)qword_2542D12A8);
    sub_23A3485A0(v17, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v38[0] = 0;
    v38[1] = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    strcpy((char *)v38, "segmentSize: ");
    HIWORD(v38[1]) = -4864;
    v37 = (id)a2;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    sub_23A33E2E0(v38[0], v38[1], 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A3660E0);
    swift_bridgeObjectRelease();
    sub_23A3485E4((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v18 = 0;
    LODWORD(a2) = -1;
  }
  else if (a2 <= 0x40)
  {
    sub_23A34855C();
    v19 = (void *)swift_allocError();
    *v20 = 0;
    swift_willThrow();
    v35[0] = 0;
    v37 = v19;
    v21 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C200);
    if ((swift_dynamicCast() & 1) != 0 && (v36 & 1) == 0)
    {

      if (qword_2542D0118 != -1)
        swift_once();
      v23 = __swift_project_value_buffer(v14, (uint64_t)qword_2542D12A8);
      sub_23A3485A0(v23, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
      v38[0] = 0;
      v38[1] = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      strcpy((char *)v38, "segmentSize: ");
      HIWORD(v38[1]) = -4864;
      v35[1] = a2;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      sub_23A33E2E0(v38[0], v38[1], 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A3660E0);
      swift_bridgeObjectRelease();
      sub_23A3485E4((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);

    }
    else
    {

      if (qword_2542D0118 != -1)
        swift_once();
      v22 = __swift_project_value_buffer(v14, (uint64_t)qword_2542D12A8);
      sub_23A3485A0(v22, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
      v38[0] = 0;
      v38[1] = 0xE000000000000000;
      sub_23A362E2C();
      sub_23A362C58();
      v37 = (id)a2;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      v37 = v19;
      sub_23A362E50();
      sub_23A33E2E0(v38[0], v38[1], 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A3660E0);
      swift_bridgeObjectRelease();

      sub_23A3485E4((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    }
    LODWORD(a2) = 0;
    v18 = 0x100000000;
  }
  else
  {
    v18 = 0;
  }
  sub_23A3485A0(a1, (uint64_t)v13 + *(int *)(v8 + 20), (uint64_t (*)(_QWORD))type metadata accessor for StorageContainer);
  *v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v24 = (char *)v13 + *(int *)(v8 + 24);
  v24[4] = (v18 | 0x8000000000uLL) >> 32;
  *(_DWORD *)v24 = v18 | a2;
  sub_23A33F970((uint64_t)v13, v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D1158);
  v25 = swift_allocObject();
  *(_DWORD *)(v25 + 32) = 0;
  v26 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = v26;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D1170);
  v27 = swift_allocObject();
  *(_DWORD *)(v27 + 40) = 0;
  v28 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v27 + 16) = 0;
  *(_QWORD *)(v27 + 24) = v28;
  *(_QWORD *)(v27 + 32) = v28;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites) = v27;
  v29 = v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v29, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  if (_s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0())
  {
    v30 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
    sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    if ((v30 & 1) != 0)
    {
      v31 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
      v32 = v31 + 4;
      v33 = v31 + 8;
      os_unfair_lock_lock(v31 + 8);
      sub_23A33F9B4(v32, v4);
      os_unfair_lock_unlock(v33);
    }
  }
  else
  {
    sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  }
  sub_23A3485E4(a1, (uint64_t (*)(_QWORD))type metadata accessor for StorageContainer);
  return v4;
}

uint64_t sub_23A33F970(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A33F9B4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;

  v4 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v7, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v8 = sub_23A33B9F4();
  sub_23A3485E4((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void sub_23A33FA84(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  os_unfair_lock_s *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  int v26;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  if (*a1 && (v11 = *(_QWORD *)(v10 + 16)) != 0)
  {
    v12 = v10 + 16 * v11;
    v13 = *(_QWORD *)(v12 + 16);
    v14 = *(_QWORD *)(v12 + 24);
    v15 = type metadata accessor for DataFrameStreamContainer();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 1, 1, v15);
    swift_bridgeObjectRetain();
    sub_23A33FFB8(v13, v14, (uint64_t)a1, (uint64_t)v9, (_QWORD *)a3);
    sub_23A348E48((uint64_t)v9, &qword_25696C218);
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    swift_beginAccess();
    v17 = sub_23A33BC68();
    if (!v3)
    {
      v18 = v17;
      sub_23A33FC9C(v16, a1, a2, &v23);
      if (qword_25696BD98 != -1)
        swift_once();
      v19 = (uint64_t *)(qword_25696E8F0 + 16);
      v20 = (os_unfair_lock_s *)(qword_25696E8F0 + 24);
      swift_retain();
      os_unfair_lock_lock(v20);
      sub_23A35A878(v19, v18);
      os_unfair_lock_unlock(v20);
      swift_release();
      swift_release();
      v21 = v26;
      *(_QWORD *)a3 = v23;
      *(_OWORD *)(a3 + 8) = v24;
      *(_OWORD *)(a3 + 24) = v25;
      *(_DWORD *)(a3 + 40) = v21;
    }
    swift_endAccess();
  }
}

uint64_t sub_23A33FC9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
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
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24[4];

  v24[3] = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = (uint64_t)sub_23A33B9F4();
  swift_bridgeObjectRelease();
  v14 = *a2;
  if (*a2 && (v15 = *(_QWORD *)(v14 + 16)) != 0)
  {
    v23[1] = v4;
    v16 = v14 + 16 * v15;
    v18 = *(_QWORD *)(v16 + 16);
    v17 = *(_QWORD *)(v16 + 24);
    v19 = qword_2542D0118;
    swift_bridgeObjectRetain();
    if (v19 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
    sub_23A3485A0(v20, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v24[0] = 0;
    v24[1] = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    strcpy((char *)v24, "last segment: ");
    HIBYTE(v24[1]) = -18;
    sub_23A362C58();
    sub_23A33E2D4(v24[0], v24[1], 0xD000000000000062, 0x800000023A366070, 0x655374736574616CLL, 0xEF2928746E656D67);
    swift_bridgeObjectRelease();
    sub_23A3485E4((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    sub_23A3485A0(a1, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v21 = type metadata accessor for DataFrameStreamContainer();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v10, 0, 1, v21);
    sub_23A33FFB8(v18, v17, (uint64_t)a2, (uint64_t)v10, a4);
    sub_23A348E48((uint64_t)v10, &qword_25696C218);
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2542D0118 != -1)
      swift_once();
    __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
    sub_23A33E2D4(0xD000000000000010, 0x800000023A366390, 0xD000000000000062, 0x800000023A366070, 0x655374736574616CLL, 0xEF2928746E656D67);
    return sub_23A340498((uint64_t)a2, a4);
  }
}

double sub_23A33FFB8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void (*v37)(uint64_t, uint64_t);
  double result;
  _QWORD *v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  void (*v44)(uint64_t, uint64_t);
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  __int128 v51;
  _QWORD *v52;
  char *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  _OWORD v65[2];
  __int128 v66;
  _OWORD v67[3];
  char v68;

  v60 = a3;
  v62 = a1;
  v63 = a2;
  v54 = a5;
  v6 = sub_23A3629C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_23A362A3C();
  v59 = *(_QWORD *)(v56 - 8);
  v10 = MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)&v53 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v61 = (char *)&v53 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DataFrameStreamContainer();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A348E84(a4, (uint64_t)v17, &qword_25696C218);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    v22 = v55 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    swift_beginAccess();
    sub_23A3485A0(v22, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348E48((uint64_t)v17, &qword_25696C218);
  }
  else
  {
    sub_23A33F970((uint64_t)v17, (uint64_t)v21);
  }
  *(_QWORD *)&v64 = 47;
  *((_QWORD *)&v64 + 1) = 0xE100000000000000;
  sub_23A362C58();
  sub_23A362C58();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDCD7A0], v6);
  sub_23A336470();
  v23 = (uint64_t)v61;
  sub_23A362A30();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  v25 = v59;
  v24 = v60;
  v26 = *(_QWORD *)(v60 + 8);
  v27 = (uint64_t)v58;
  if (*(_QWORD *)(v26 + 16) && (v28 = sub_23A3548EC(v23), (v29 & 1) != 0))
  {
    v30 = *(_QWORD *)(v26 + 56) + 48 * v28;
    v32 = *(_QWORD *)v30;
    v31 = *(_QWORD *)(v30 + 8);
    v33 = *(_QWORD *)(v30 + 16);
    v34 = *(_QWORD *)(v30 + 24);
    v35 = *(_QWORD *)(v30 + 32);
    v36 = *(_DWORD *)(v30 + 40);
    v37 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    v37(v23, v56);
    sub_23A3485E4((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v39 = v54;
    *v54 = v32;
    v39[1] = v31;
    v39[2] = v33;
    v39[3] = v34;
    v39[4] = v35;
    *((_DWORD *)v39 + 10) = v36;
  }
  else
  {
    v40 = *(void (**)(void))(v25 + 16);
    v41 = v56;
    ((void (*)(uint64_t, uint64_t, uint64_t))v40)(v27, v23, v56);
    v42 = v57;
    v43 = sub_23A33AFEC();
    if (v42)
    {
      v44 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v44(v27, v41);
      v44(v23, v41);
      sub_23A3485E4((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    }
    else
    {
      v45 = v43;
      v68 = 1;
      v46 = v63;
      swift_bridgeObjectRetain();
      DataFrameStreamSegment.init(name:filePath:byteSize:access:)(v62, v46, v27, v45, &v68, (uint64_t)&v64);
      v66 = v64;
      v67[0] = v65[0];
      *(_OWORD *)((char *)v67 + 12) = *(_OWORD *)((char *)v65 + 12);
      v47 = (uint64_t)v53;
      v40();
      sub_23A348C2C((uint64_t)&v66);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v64 = *(_QWORD *)(v24 + 8);
      *(_QWORD *)(v24 + 8) = 0x8000000000000000;
      v49 = v47;
      sub_23A3477E0(&v66, v47, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v24 + 8) = v64;
      swift_bridgeObjectRelease();
      v50 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v50(v49, v41);
      v50(v23, v41);
      sub_23A3485E4((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
      v51 = v67[0];
      v52 = v54;
      *(_OWORD *)v54 = v66;
      *((_OWORD *)v52 + 1) = v51;
      result = *(double *)((char *)v67 + 12);
      *(_OWORD *)((char *)v52 + 28) = *(_OWORD *)((char *)v67 + 12);
    }
  }
  return result;
}

uint64_t sub_23A340498@<X0>(uint64_t a1@<X1>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  void (*v17)(char *, char *, uint64_t);
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  void (*v22)(uint64_t, uint64_t);
  __int128 v23;
  _OWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _OWORD *v28;
  __int128 v29;
  _OWORD v30[2];
  __int128 v31;
  _OWORD v32[2];
  char v33;

  v27 = a1;
  v28 = a2;
  v3 = sub_23A362A3C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  if (qword_2542D0118 != -1)
    swift_once();
  v12 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v12, (uint64_t)qword_2542D12A8);
  sub_23A33E2D4(0, 0xE000000000000000, 0xD000000000000062, 0x800000023A366070, 0xD00000000000001ELL, 0x800000023A366370);
  CFAbsoluteTimeGetCurrent();
  v13 = sub_23A362D3C();
  v15 = v14;
  sub_23A33B520((uint64_t)v11);
  if (v2)
    return swift_bridgeObjectRelease();
  v17 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v17(v9, v11, v3);
  v18 = sub_23A33AFEC();
  v33 = 1;
  DataFrameStreamSegment.init(name:filePath:byteSize:access:)(v13, v15, (uint64_t)v9, v18, &v33, (uint64_t)&v29);
  v31 = v29;
  v32[0] = v30[0];
  *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)v30 + 12);
  v19 = (uint64_t)v26;
  v17(v26, v11, v3);
  sub_23A348C2C((uint64_t)&v31);
  v20 = v27;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v29 = *(_QWORD *)(v20 + 8);
  *(_QWORD *)(v20 + 8) = 0x8000000000000000;
  sub_23A3477E0(&v31, v19, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v20 + 8) = v29;
  swift_bridgeObjectRelease();
  v22 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v22(v19, v3);
  result = ((uint64_t (*)(char *, uint64_t))v22)(v11, v3);
  v23 = v32[0];
  v24 = v28;
  *v28 = v31;
  v24[1] = v23;
  *(_OWORD *)((char *)v24 + 28) = *(_OWORD *)((char *)v32 + 12);
  return result;
}

void sub_23A340740(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  os_unfair_lock_s *v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  int v38;
  uint64_t v39;

  v34 = a4;
  v32 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DataFrameStreamContainer();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a2;
  v15 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v15, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v16 = sub_23A33B9F4();
  sub_23A3485E4((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  swift_bridgeObjectRelease();
  *a1 = (uint64_t)v16;
  if (v16 && (v17 = v16[2]) != 0)
  {
    v18 = &v16[2 * v17];
    v19 = v18[2];
    v20 = v18[3];
    v21 = a3;
    v23 = v19 == a3;
    v22 = v34;
    v23 = v23 && v20 == v34;
    if (v23 || (sub_23A362EE0() & 1) != 0)
    {
      swift_beginAccess();
      v24 = v39;
      v25 = sub_23A33BC68();
      if (!v24)
      {
        v26 = v25;
        sub_23A340A44(v15, a1, v21, v22, &v35);
        if (qword_25696BD98 != -1)
          swift_once();
        v27 = (uint64_t *)(qword_25696E8F0 + 16);
        v28 = (os_unfair_lock_s *)(qword_25696E8F0 + 24);
        swift_retain();
        os_unfair_lock_lock(v28);
        sub_23A35A878(v27, v26);
        os_unfair_lock_unlock(v28);
        swift_release();
        swift_release();
        v29 = v38;
        v30 = v32;
        *v32 = v35;
        *(_OWORD *)(v30 + 1) = v36;
        *(_OWORD *)(v30 + 3) = v37;
        *((_DWORD *)v30 + 10) = v29;
      }
      swift_endAccess();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
      swift_bridgeObjectRetain();
      sub_23A33FFB8(v19, v20, (uint64_t)a1, (uint64_t)v10, v32);
      sub_23A348E48((uint64_t)v10, &qword_25696C218);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_23A348D48();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t sub_23A340A44@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = (uint64_t)sub_23A33B9F4();
  swift_bridgeObjectRelease();
  v14 = *a2;
  if (!*a2 || (v15 = *(_QWORD *)(v14 + 16)) == 0)
  {
    sub_23A348D48();
    swift_allocError();
    return swift_willThrow();
  }
  v39 = a5;
  v16 = v14 + 16 * v15;
  v17 = *(_QWORD *)(v16 + 24);
  v45 = *(_QWORD *)(v16 + 16);
  sub_23A3485A0(a1, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v18 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v13, 0, 1, v18);
  swift_bridgeObjectRetain();
  sub_23A33FFB8(a3, a4, (uint64_t)a2, (uint64_t)v13, &v40);
  sub_23A348E48((uint64_t)v13, &qword_25696C218);
  if (v5)
    return swift_bridgeObjectRelease();
  v20 = *((_QWORD *)&v41 + 1);
  v38 = v41;
  v22 = v42;
  v21 = v43;
  if (v45 == a3 && v17 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = v40;
    v37 = v44;
    v24 = sub_23A362EE0();
    result = swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      v25 = v39;
      v26 = v38;
      *v39 = v36;
      v25[1] = v26;
      v25[2] = v20;
      v25[3] = v22;
      v25[4] = v21;
      *((_DWORD *)v25 + 10) = v37;
      return result;
    }
  }
  result = sub_23A340498((uint64_t)a2, &v40);
  v27 = v39;
  v28 = *(_QWORD *)(v22 + 16);
  v29 = *(_QWORD *)(v28 + 24);
  v30 = *(unsigned int *)(v28 + 16);
  v31 = __CFADD__(v29, v30);
  v32 = v29 + v30;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    v33 = v42;
    atomic_store(v32, (unint64_t *)(*(_QWORD *)(v42 + 16) + 24));
    swift_release();
    swift_release();
    swift_release();
    result = swift_bridgeObjectRelease();
    v34 = v43;
    v35 = v44;
    *v27 = v40;
    *(_OWORD *)(v27 + 1) = v41;
    v27[3] = v33;
    v27[4] = v34;
    *((_DWORD *)v27 + 10) = v35;
  }
  return result;
}

uint64_t sub_23A340CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[8] = a4;
  v5 = sub_23A362A3C();
  v4[9] = v5;
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = type metadata accessor for InternalLogger();
  v4[13] = swift_task_alloc();
  v4[14] = type metadata accessor for DataFrameStreamContainer();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A340DB0()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  _QWORD *v13;
  uint64_t (__cdecl *v14)();

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 144) = Strong;
  if (Strong)
  {
    v2 = Strong;
    if (qword_2542D0118 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 136);
    *(_QWORD *)(v0 + 152) = __swift_project_value_buffer(*(_QWORD *)(v0 + 96), (uint64_t)qword_2542D12A8);
    sub_23A33E2D4(0xD000000000000020, 0x800000023A3663E0, 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A366410);
    v4 = OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    *(_QWORD *)(v0 + 160) = OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
    v5 = v2 + v4;
    swift_beginAccess();
    sub_23A3485A0(v5, v3, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    *(_QWORD *)(v0 + 168) = type metadata accessor for StorageContainer();
    v6 = sub_23A362BC8();
    v8 = v7;
    if (v6 == sub_23A362BC8() && v8 == v9)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = sub_23A362EE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_23A3485E4(*(_QWORD *)(v0 + 136), (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
        return swift_task_switch();
      }
    }
    v14 = (uint64_t (__cdecl *)())((char *)&dword_25696C570 + dword_25696C570);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v13;
    *v13 = v0;
    v13[1] = sub_23A341030;
    return v14();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A341030()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  sub_23A3485E4(*(_QWORD *)(v1 + 136), (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  return swift_task_switch();
}

uint64_t sub_23A341090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 144) + *(_QWORD *)(v0 + 160);
  sub_23A33E2D4(0xD000000000000016, 0x800000023A366440, 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A366410);
  sub_23A3485A0(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v3 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  v4 = *(_QWORD *)(v0 + 128);
  if (!v3)
  {
    sub_23A3485E4(*(_QWORD *)(v0 + 128), (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    goto LABEL_5;
  }
  v5 = _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0();
  sub_23A3485E4(v4, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    v8 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 144) + *(_QWORD *)(v0 + 160);
    sub_23A3485A0(*(_QWORD *)(v0 + 152), v9, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    sub_23A3485A0(v13, v7, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v11, v7 + *(int *)(v8 + 20), v12);
    sub_23A3485E4(v7, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    sub_23A33E2E0(0xD00000000000001ELL, 0x800000023A366460, 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A366410);
    swift_bridgeObjectRelease();
    swift_release();
    sub_23A3485E4(v9, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 40));
  sub_23A3413CC((_QWORD *)(v6 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 40));
  swift_release();
  swift_release();
LABEL_6:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3413CC(_QWORD *a1)
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
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v21[2];
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C230);
  v27 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D0118 != -1)
    swift_once();
  v25 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D12A8);
  sub_23A3485A0(v25, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  v28 = 0;
  v29 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v28 = 0x676E696873756C46;
  v29 = 0xE900000000000020;
  v30 = *(_QWORD *)(a1[1] + 16);
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  v23 = 0x800000023A366070;
  v24 = 0xD000000000000062;
  v22 = 0x800000023A366410;
  sub_23A33E2D4(v28, v29, 0xD000000000000062, 0x800000023A366070, 0xD000000000000023, 0x800000023A366410);
  swift_bridgeObjectRelease();
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  v9 = a1[1];
  v10 = *(_QWORD *)(v9 + 16);
  v26 = a1;
  if (v10)
  {
    v21[0] = v8;
    swift_bridgeObjectRetain();
    v21[1] = v9;
    v11 = (unint64_t *)(v9 + 40);
    while (1)
    {
      v13 = *(v11 - 1);
      v12 = *v11;
      sub_23A333494(v13, *v11);
      sub_23A3417F0(v13, v12);
      if (v1)
        break;
      v11 += 2;
      sub_23A33350C(v13, v12);
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        a1 = v26;
        v8 = (char *)v21[0];
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    return sub_23A33350C(v13, v12);
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
    a1[1] = MEMORY[0x24BEE4AF8];
    sub_23A3485A0(v25, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v28 = 0x676E696D75736552;
    v29 = 0xE900000000000020;
    v30 = *(_QWORD *)(a1[2] + 16);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    sub_23A33E2D4(v28, v29, v24, v23, 0xD000000000000023, v22);
    swift_bridgeObjectRelease();
    sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v15 = a1[2];
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v17 = v15 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
      v18 = *(_QWORD *)(v27 + 72);
      v19 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
      swift_bridgeObjectRetain();
      do
      {
        v19(v5, v17, v3);
        sub_23A362D18();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v3);
        v17 += v18;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
      a1 = v26;
      v14 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    a1[2] = v14;
    result = swift_release();
    *a1 = 0;
  }
  return result;
}

uint64_t sub_23A3417F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  uint64_t *v12;
  uint64_t v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = v2;
  v7 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v11 = v10 + 8;
  v12 = (uint64_t *)&v10[4];
  os_unfair_lock_lock(v10 + 8);
  sub_23A33FA84(v12, v4, (uint64_t)&v18);
  if (v3)
  {
    os_unfair_lock_unlock(v11);
  }
  else
  {
    v15[4] = v12;
    v15[5] = v9;
    v15[7] = v7;
    v16 = a1;
    v17 = a2;
    v15[2] = 0x800000023A366070;
    v15[3] = 0x800000023A366330;
    v15[1] = 0x800000023A366350;
    v15[6] = v4;
    os_unfair_lock_unlock(v11);
    DataFrameStreamSegment.append(data:compressed:)(v16, v17);
    a2 = v14;
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return a2;
}

uint64_t sub_23A341B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A348E84(a1, (uint64_t)v7, &qword_25696C250);
  v8 = sub_23A362D30();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_23A348E48((uint64_t)v7, &qword_25696C250);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  else
  {
    sub_23A362D24();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v10 = sub_23A362D0C();
  v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

void DataFrameStream.append(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;
  char v9;

  v6 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  v7 = (uint64_t *)&v6[4];
  v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_23A341DAC(v7, v2, a1, a2, &v9);
  os_unfair_lock_unlock(v8);
  if (v3)
    __break(1u);
  else
    sub_23A3417F0(a1, a2);
}

uint64_t sub_23A341DAC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;

  v28 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1)
    goto LABEL_5;
  v27 = v5;
  v16 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v16, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  LOBYTE(v16) = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  result = sub_23A3485E4((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if ((v16 & 1) == 0)
  {
    type metadata accessor for OSTransaction();
    swift_allocObject();
    v18 = sub_23A34904C("com.apple.dendrite.pending-writes", 33, 2);
    swift_release();
    *a1 = v18;
    v19 = sub_23A362D30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v12, 1, 1, v19);
    v20 = swift_allocObject();
    swift_weakInit();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = v20;
    sub_23A341B6C((uint64_t)v12, (uint64_t)&unk_25696C260, (uint64_t)v21);
    swift_release();
    result = sub_23A348E48((uint64_t)v12, &qword_25696C250);
  }
  if (*a1)
  {
LABEL_5:
    v22 = (_QWORD *)a1[1];
    sub_23A333494(a3, a4);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_23A35F820(0, v22[2] + 1, 1, v22);
      v22 = (_QWORD *)result;
    }
    v24 = v22[2];
    v23 = v22[3];
    if (v24 >= v23 >> 1)
    {
      result = (uint64_t)sub_23A35F820((_QWORD *)(v23 > 1), v24 + 1, 1, v22);
      v22 = (_QWORD *)result;
    }
    v25 = 0;
    v22[2] = v24 + 1;
    v26 = &v22[2 * v24];
    v26[4] = a3;
    v26[5] = a4;
    a1[1] = (uint64_t)v22;
  }
  else
  {
    v25 = 1;
  }
  *v28 = v25;
  return result;
}

uint64_t DataFrameStream.iterate(reversed:each:)(int a1, uint64_t (*a2)(_QWORD, unint64_t, uint64_t, unint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  BOOL v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  os_unfair_lock_s *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  _QWORD v45[2];
  os_unfair_lock_s *v46;
  os_unfair_lock_s *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t (*v54)(_QWORD, unint64_t, uint64_t, unint64_t);
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  int v66;

  v54 = a2;
  v55 = a3;
  v52 = a1;
  v4 = sub_23A362A3C();
  v60 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (unint64_t)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v13, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v14 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (!v14)
  {
    if (qword_2542D0118 == -1)
    {
LABEL_8:
      v20 = __swift_project_value_buffer(v7, (uint64_t)qword_2542D12A8);
      sub_23A3485A0(v20, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
      v61 = 0;
      v62 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v61 = 0xD000000000000018;
      v62 = 0x800000023A366110;
      sub_23A3485A0(v13, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
      v21 = &v12[*(int *)(v10 + 20)];
      v22 = v60;
      (*(void (**)(unint64_t, char *, uint64_t))(v60 + 16))(v6, v21, v4);
      sub_23A3485E4((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
      sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v22 + 8))(v6, v4);
      sub_23A33E2E0(v61, v62, 0xD000000000000062, 0x800000023A366070, 0xD000000000000017, 0x800000023A366130);
      swift_bridgeObjectRelease();
      return sub_23A3485E4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    }
LABEL_46:
    swift_once();
    goto LABEL_8;
  }
  v15 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v16 = v15 + 4;
  v17 = v15 + 8;
  os_unfair_lock_lock(v15 + 8);
  v4 = 0;
  sub_23A342F94(v16, v3, &v61);
  os_unfair_lock_unlock(v17);
  result = v61;
  if (!v61)
    return result;
  if ((v52 & 1) != 0)
    result = sub_23A3426F0(v61);
  v49 = *(_QWORD *)(result + 16);
  if (!v49)
    return swift_bridgeObjectRelease();
  v19 = 0;
  LODWORD(v60) = 0;
  v45[1] = result;
  v50 = result + 32;
  v48 = v3;
  v47 = v16;
  v46 = v17;
  while (1)
  {
    v23 = (uint64_t *)(v50 + 16 * v19);
    v25 = *v23;
    v24 = v23[1];
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v17);
    sub_23A343074((uint64_t)v16, v25, v24, &v61);
    os_unfair_lock_unlock(v17);
    swift_bridgeObjectRelease();
    v51 = v19;
    v59 = v62;
    v10 = v64;
    v57 = v61;
    v58 = v63;
    v9 = v65;
    v56 = v66;
    v12 = *(char **)(v64 + 16);
    v53 = *((_QWORD *)v12 + 3);
    v7 = *((unsigned int *)v12 + 4);
    if ((_DWORD)v7)
    {
      if ((v52 & 1) != 0)
      {
        v13 = (v7 - 1);
        v12 = (char *)(8 * v13 + 8);
        v6 = v7;
        while (v6 <= v7)
        {
          if (*(_DWORD *)(*(_QWORD *)(v10 + 16) + 16) > v13)
          {
            v26 = *((_QWORD *)v9 + 2);
            v27 = *(_QWORD *)(v26 + 32);
            v28 = __OFSUB__(v27, v12);
            v29 = v27 - (_QWORD)v12;
            if (v28)
              goto LABEL_42;
            v30 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v26 + 16) + v29 + 4));
            if (v30 == 2)
            {
              v61 = v57;
              v62 = v59;
              v63 = v58;
              v64 = v10;
              v65 = v9;
              v66 = v56;
              v31 = DataFrameStreamSegment.frameData(forSegmentIndex:)((_QWORD *)v13);
              if (v32 >> 60 != 15)
              {
                v33 = v32;
                if (__CFADD__(v53, v13))
                  goto LABEL_43;
                v34 = v31;
                v35 = v54(v60, v53 + v13, v31, v32);
                sub_23A33A628(v34, v33);
                if ((v35 & 1) == 0)
                  goto LABEL_38;
                v36 = __CFADD__((_DWORD)v60, 1);
                LODWORD(v60) = v60 + 1;
                if (v36)
                  goto LABEL_44;
              }
            }
          }
          --v13;
          v12 -= 8;
          if (!(_DWORD)--v6)
            goto LABEL_38;
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
        goto LABEL_46;
      }
      if (*((_DWORD *)v12 + 4))
        break;
    }
    swift_release();
LABEL_11:
    v19 = v51 + 1;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    if (v19 == v49)
      return swift_bridgeObjectRelease();
  }
  v13 = 0;
  v6 = 8;
  while (1)
  {
    if (v13 >= *(unsigned int *)(*(_QWORD *)(v10 + 16) + 16))
      goto LABEL_28;
    v37 = *((_QWORD *)v9 + 2);
    v38 = *(_QWORD *)(v37 + 32);
    v28 = __OFSUB__(v38, v6);
    v39 = v38 - v6;
    if (v28)
      goto LABEL_45;
    v40 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v37 + 16) + v39 + 4));
    if (v40 != 2)
      goto LABEL_28;
    v61 = v57;
    v62 = v59;
    v63 = v58;
    v64 = v10;
    v65 = v9;
    v66 = v56;
    result = DataFrameStreamSegment.frameData(forSegmentIndex:)((_QWORD *)v13);
    if (v41 >> 60 == 15)
      goto LABEL_28;
    v42 = v41;
    if (__CFADD__(v53, v13))
      break;
    v43 = result;
    v44 = v54(v60, v53 + v13, result, v41);
    result = sub_23A33A628(v43, v42);
    if ((v44 & 1) == 0)
    {
LABEL_38:
      swift_release();
      v16 = v47;
      v17 = v46;
      goto LABEL_11;
    }
    v36 = __CFADD__((_DWORD)v60, 1);
    LODWORD(v60) = v60 + 1;
    if (v36)
      goto LABEL_48;
LABEL_28:
    ++v13;
    v6 += 8;
    if (v13 >= *((unsigned int *)v12 + 4))
      goto LABEL_38;
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_23A3426F0(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 < 2)
    return (uint64_t)v1;
  v3 = 0;
  v4 = 0;
  v5 = v2 >> 1;
  v6 = v2 - 1;
  v7 = 16 * v2 + 16;
  v15 = v2 >> 1;
  while (1)
  {
    if (v4 == v6)
      goto LABEL_4;
    v8 = v1[2];
    if (v4 >= v8)
      break;
    if (v6 >= v8)
      goto LABEL_13;
    v10 = v1[v3 + 4];
    v9 = v1[v3 + 5];
    v12 = *(_QWORD *)((char *)v1 + v7);
    v11 = *(_QWORD *)((char *)v1 + v7 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v1 = sub_23A34815C(v1);
    v13 = &v1[v3];
    result = swift_bridgeObjectRelease();
    v13[4] = v12;
    v13[5] = v11;
    if (v6 >= v1[2])
      goto LABEL_14;
    v14 = (_QWORD *)((char *)v1 + v7);
    result = swift_bridgeObjectRelease();
    *v14 = v10;
    v14[1] = v9;
    v5 = v15;
LABEL_4:
    ++v4;
    --v6;
    v7 -= 16;
    v3 += 2;
    if (v5 == v4)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

void DataFrameStream.prune(each:)(uint64_t (*a1)(uint64_t, char *, uint64_t, unint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  os_unfair_lock_s *v12;
  BOOL v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  __int16 v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  os_unfair_lock_s *v41;
  os_unfair_lock_s *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, char *, uint64_t, unint64_t);
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  int v66;

  v3 = v2;
  v50 = a1;
  v51 = a2;
  v4 = (uint64_t *)sub_23A362A3C();
  v5 = *(v4 - 1);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v46);
  v49 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (os_unfair_lock_s *)(v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container);
  swift_beginAccess();
  sub_23A3485A0((uint64_t)v12, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v13 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (!v13)
  {
    if (qword_2542D0118 != -1)
      goto LABEL_38;
    goto LABEL_29;
  }
  v14 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v15 = v14 + 4;
  v12 = v14 + 8;
  os_unfair_lock_lock(v14 + 8);
  v7 = 0;
  sub_23A342F94(v15, v2, &v61);
  os_unfair_lock_unlock(v12);
  v16 = v61;
  if (v61)
  {
    v17 = *(_QWORD *)(v61 + 16);
    if (v17)
    {
      v9 = 0;
      v55 = 0;
      v47 = v61 + 32;
      v39 = 0x800000023A366150;
      v38 = 0x800000023A366070;
      v43 = v3;
      v44 = v61;
      v42 = v15;
      v41 = v12;
      v40 = v17;
      do
      {
        if (v9 >= *(_QWORD *)(v16 + 16))
          goto LABEL_37;
        v4 = &v37;
        v18 = (uint64_t *)(v47 + 16 * v9);
        v20 = *v18;
        v19 = v18[1];
        swift_bridgeObjectRetain();
        os_unfair_lock_lock(v12);
        v48 = v20;
        v54 = v19;
        sub_23A343074((uint64_t)v15, v20, v19, &v61);
        os_unfair_lock_unlock(v12);
        if (v7)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        v52 = v9;
        v59 = v62;
        v5 = v64;
        v57 = v61;
        v58 = v63;
        v11 = v65;
        v56 = v66;
        v9 = *(_QWORD *)(v64 + 16);
        v53 = *(_QWORD *)(v9 + 24);
        if (*(_DWORD *)(v9 + 16))
        {
          v21 = 0;
          v22 = 8;
          v23 = v55;
          while (1)
          {
            if ((unint64_t)v21 < *(unsigned int *)(*(_QWORD *)(v5 + 16) + 16))
            {
              v24 = *((_QWORD *)v11 + 2);
              v25 = *(_QWORD *)(v24 + 32);
              v26 = __OFSUB__(v25, v22);
              v27 = v25 - v22;
              if (v26)
              {
                __break(1u);
LABEL_35:
                __break(1u);
LABEL_36:
                __break(1u);
LABEL_37:
                __break(1u);
LABEL_38:
                swift_once();
LABEL_29:
                v35 = __swift_project_value_buffer(v46, (uint64_t)qword_2542D12A8);
                v36 = v49;
                sub_23A3485A0(v35, v49, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
                v61 = 0;
                v62 = 0xE000000000000000;
                sub_23A362E2C();
                swift_bridgeObjectRelease();
                v61 = 0xD000000000000018;
                v62 = 0x800000023A366110;
                sub_23A3485A0((uint64_t)v12, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
                (*(void (**)(char *, char *, uint64_t *))(v5 + 16))(v7, &v11[*(int *)(v9 + 20)], v4);
                sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
                sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
                sub_23A362EC8();
                sub_23A362C58();
                swift_bridgeObjectRelease();
                (*(void (**)(char *, uint64_t *))(v5 + 8))(v7, v4);
                sub_23A33E2E0(v61, v62, 0xD000000000000062, 0x800000023A366070, 0x616528656E757270, 0xEC000000293A6863);
                swift_bridgeObjectRelease();
                sub_23A3485E4(v36, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
                return;
              }
              v28 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v24 + 16) + v27 + 4));
              if (v28 == 2)
              {
                v61 = v57;
                v62 = v59;
                v63 = v58;
                v64 = v5;
                v65 = v11;
                v66 = v56;
                v29 = DataFrameStreamSegment.frameData(forSegmentIndex:)(v21);
                if (v30 >> 60 != 15)
                {
                  v4 = (uint64_t *)v30;
                  if (__CFADD__(v53, v21))
                    goto LABEL_35;
                  v12 = (os_unfair_lock_s *)v29;
                  v55 = v23;
                  v31 = v50(v23, (char *)v21 + v53, v29, v30);
                  if (v7)
                  {
                    sub_23A33A628((uint64_t)v12, (unint64_t)v4);
                    swift_release();
                    swift_release();
                    swift_release();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();

                    return;
                  }
                  v32 = v31;
                  if ((v31 & 1) != 0)
                  {
                    v61 = v57;
                    v62 = v59;
                    v63 = v58;
                    v64 = v5;
                    v65 = v11;
                    v66 = v56;
                    if (!DataFrameStreamSegment.deleteFrame(index:)((Swift::UInt32)v21))
                    {
                      v45 = 0;
                      if (qword_2542D0118 != -1)
                        swift_once();
                      v33 = __swift_project_value_buffer(v46, (uint64_t)qword_2542D12A8);
                      sub_23A3485A0(v33, v49, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
                      v61 = 0;
                      v62 = 0xE000000000000000;
                      sub_23A362E2C();
                      swift_bridgeObjectRelease();
                      v61 = 0xD000000000000017;
                      v62 = v39;
                      v60 = (int)v21;
                      sub_23A362EC8();
                      sub_23A362C58();
                      swift_bridgeObjectRelease();
                      sub_23A362C58();
                      sub_23A362C58();
                      v34 = v49;
                      sub_23A33E2E0(v61, v62, 0xD000000000000062, v38, 0x616528656E757270, 0xEC000000293A6863);
                      swift_bridgeObjectRelease();
                      sub_23A3485E4(v34, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
                      v7 = v45;
                    }
                  }
                  sub_23A33A628((uint64_t)v12, (unint64_t)v4);
                  if ((v32 & 0x100) == 0)
                    goto LABEL_27;
                  v23 = v55 + 1;
                  if (v55 == -1)
                    goto LABEL_36;
                }
              }
            }
            v21 = (_QWORD *)((char *)v21 + 1);
            v22 += 8;
            if ((unint64_t)v21 >= *(unsigned int *)(v9 + 16))
            {
              v55 = v23;
LABEL_27:
              swift_release();
              v16 = v44;
              v15 = v42;
              v12 = v41;
              v17 = v40;
              goto LABEL_6;
            }
          }
        }
        swift_release();
LABEL_6:
        v9 = v52 + 1;
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v9 != v17);
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A342F94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v10 = sub_23A33B9F4();
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  swift_bridgeObjectRelease();
  *a1 = v10;
  *a3 = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A343074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C218);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DataFrameStreamContainer();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_23A33FFB8(a2, a3, a1, (uint64_t)v10, a4);
  return sub_23A348E48((uint64_t)v10, &qword_25696C218);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataFrameStream.vacuum()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  os_unfair_lock_s *v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t *v48;
  os_unfair_lock_s *v49;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_unfair_lock_s *v55;
  os_unfair_lock_s *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63[4];
  char *v64;

  v1 = sub_23A362A3C();
  v60 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v4);
  v58 = (uint64_t)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = v0;
  v9 = v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  v54 = v9;
  sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (v10)
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v52 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D12A8);
    v11 = v58;
    sub_23A3485A0(v52, v58, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    sub_23A3485A0(v54, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v12 = &v8[*(int *)(v6 + 20)];
    v13 = v60;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v3, v12, v1);
    sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    v14 = sub_23A362EC8();
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v3, v1);
    v17 = " general error: ";
    sub_23A33E2D4(v14, v16, 0xD000000000000062, 0x800000023A366070, 0x29286D7575636176, 0xE800000000000000);
    swift_bridgeObjectRelease();
    sub_23A3485E4(v11, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v18 = v59;
    v19 = *(os_unfair_lock_s **)(v59 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
    v20 = v19 + 4;
    v21 = v19 + 8;
    os_unfair_lock_lock(v19 + 8);
    v22 = v61;
    sub_23A342F94(v20, v18, v63);
    if (!v22)
    {
      v23 = 0;
      os_unfair_lock_unlock(v21);
      if (!v63[0])
        return;
      v64 = (char *)MEMORY[0x24BEE4B08];
      v24 = *(_QWORD *)(v63[0] + 16);
      if (v24)
      {
        v50[1] = v63[0];
        v25 = (uint64_t *)(v63[0] + 40);
        v51 = 0x800000023A366070;
        v55 = v20;
        v56 = v21;
        do
        {
          v29 = *(v25 - 1);
          v28 = *v25;
          swift_bridgeObjectRetain();
          os_unfair_lock_lock(v21);
          sub_23A343074((uint64_t)v20, v29, v28, v63);
          if (v23)
          {
            os_unfair_lock_unlock(v21);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_31;
          }
          v60 = v28;
          v61 = 0;
          os_unfair_lock_unlock(v21);
          v30 = v63[1];
          v31 = v63[2];
          v32 = *(_QWORD *)(v63[3] + 16);
          v33 = *(_DWORD *)(v32 + 16);
          v34 = *(_DWORD *)(v32 + 20);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_retain();
          swift_retain();
          if (v33 < v34)
          {
            v39 = v58;
            sub_23A3485A0(v52, v58, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
            v63[0] = 0;
            v63[1] = 0xE000000000000000;
            v53 = v30;
            sub_23A362E2C();
            sub_23A362C58();
            v62 = v33;
            sub_23A362EC8();
            sub_23A362C58();
            swift_bridgeObjectRelease();
            sub_23A362C58();
            v62 = v34;
            sub_23A362EC8();
            sub_23A362C58();
            swift_bridgeObjectRelease();
            sub_23A33E2E0(v63[0], v63[1], 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000011, 0x800000023A366210);
            swift_bridgeObjectRelease();
            sub_23A3485E4(v39, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
            sub_23A348788();
            swift_allocError();
            *v40 = 2;
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_release_n();
            swift_release_n();
            swift_release_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            goto LABEL_31;
          }
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          if (v33 && (v57 = v31, v33 == v34))
          {
            v26 = v58;
            sub_23A3485A0(v52, v58, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
            v63[0] = 0;
            v63[1] = 0xE000000000000000;
            v53 = v30;
            sub_23A362E2C();
            swift_bridgeObjectRelease();
            strcpy((char *)v63, "segment dead: ");
            HIBYTE(v63[1]) = -18;
            v27 = v60;
            sub_23A362C58();
            sub_23A33E2D4(v63[0], v63[1], 0xD000000000000062, v51, 0x29286D7575636176, 0xE800000000000000);
            swift_bridgeObjectRelease();
            sub_23A3485E4(v26, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
            sub_23A345C1C(v63, v29, v27);
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            swift_release();
          }
          swift_bridgeObjectRelease();
          v25 += 2;
          --v24;
          v23 = v61;
          v20 = v55;
          v21 = v56;
        }
        while (v24);
        swift_bridgeObjectRelease();
        v17 = v64;
      }
      else
      {
        swift_bridgeObjectRelease();
        v17 = (char *)MEMORY[0x24BEE4B08];
      }
      v41 = v54;
      if (!*((_QWORD *)v17 + 2))
        goto LABEL_31;
      v42 = (uint64_t)v20;
      swift_beginAccess();
      v43 = sub_23A33BC68();
      if (v23)
      {
        swift_endAccess();
LABEL_31:
        swift_bridgeObjectRelease();
        return;
      }
      v44 = v43;
      os_unfair_lock_lock(v21);
      if (!*(_QWORD *)v42)
      {
LABEL_28:
        v47 = swift_bridgeObjectRetain();
        sub_23A343F40(v47, v41, v42);
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock(v21);
        if (qword_25696BD98 != -1)
          swift_once();
        v48 = (uint64_t *)(qword_25696E8F0 + 16);
        v49 = (os_unfair_lock_s *)(qword_25696E8F0 + 24);
        swift_retain();
        os_unfair_lock_lock(v49);
        sub_23A35A878(v48, v44);
        os_unfair_lock_unlock(v49);
        swift_release();
        swift_release();
        swift_endAccess();
        goto LABEL_31;
      }
      v45 = sub_23A348170(v42, (uint64_t *)&v64);
      v46 = *(_QWORD *)(*(_QWORD *)v42 + 16);
      if (v46 >= v45)
      {
        sub_23A348620(v45, v46);
        goto LABEL_28;
      }
      __break(1u);
    }
    os_unfair_lock_unlock(v21);
    __break(1u);
    os_unfair_lock_unlock((os_unfair_lock_t)v17);
    __break(1u);
    return;
  }
  if (qword_2542D0118 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D12A8);
  v36 = v58;
  sub_23A3485A0(v35, v58, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  v63[0] = 0;
  v63[1] = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v63[0] = 0xD000000000000018;
  v63[1] = 0x800000023A366110;
  sub_23A3485A0(v54, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v37 = &v8[*(int *)(v6 + 20)];
  v38 = v60;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v3, v37, v1);
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v3, v1);
  sub_23A33E2E0(v63[0], v63[1], 0xD000000000000062, 0x800000023A366070, 0x29286D7575636176, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_23A3485E4(v36, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
}

uint64_t sub_23A343B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19[2];
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v19[0] = a2;
  v19[1] = a3;
  v20 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v20);
  v21 = (uint64_t)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A3629C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23A362A3C();
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A3485A0(v19[0], (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  v24 = 47;
  v25 = 0xE100000000000000;
  sub_23A362C58();
  sub_23A362C58();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCD7A0], v4);
  sub_23A336470();
  sub_23A362A30();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  sub_23A3485E4((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  sub_23A35AAD0((uint64_t)v12, (uint64_t)&v24);
  sub_23A348CF8(v24, v25);
  if (qword_2542D0118 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v20, (uint64_t)qword_2542D12A8);
  v14 = v21;
  sub_23A3485A0(v13, v21, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v24 = 0xD000000000000017;
  v25 = 0x800000023A3662F0;
  sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v24, v25, 0xD000000000000062, 0x800000023A366070, 0x29286D7575636176, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_23A3485E4(v14, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  v15 = v22;
  sub_23A355B24();
  if (v15)
  {
    sub_23A3485A0(v13, v14, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v24 = 0;
    v25 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v24 = 0xD00000000000001FLL;
    v25 = 0x800000023A366310;
    v16 = v26;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v24, v25, 0xD000000000000062, 0x800000023A366070, 0x29286D7575636176, 0xE800000000000000);
    swift_bridgeObjectRelease();

    sub_23A3485E4(v14, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v17 = v16;
  }
  else
  {
    v17 = v26;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v17);
}

uint64_t sub_23A343F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  int64_t v21;
  _QWORD v22[2];

  v7 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  if (!v10)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    v19 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v20 = v19[1];
    v22[0] = *v19;
    v22[1] = v20;
    swift_bridgeObjectRetain();
    sub_23A343B00((uint64_t)v22, a2, a3);
    if (v3)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v11)
      return swift_release();
    v17 = *(_QWORD *)(v7 + 8 * v13);
    if (!v17)
    {
      v18 = v13 + 1;
      if (v13 + 1 >= v11)
        return swift_release();
      v17 = *(_QWORD *)(v7 + 8 * v18);
      if (v17)
        goto LABEL_14;
      v18 = v13 + 2;
      if (v13 + 2 >= v11)
        return swift_release();
      v17 = *(_QWORD *)(v7 + 8 * v18);
      if (v17)
        goto LABEL_14;
      v18 = v13 + 3;
      if (v13 + 3 >= v11)
        return swift_release();
      v17 = *(_QWORD *)(v7 + 8 * v18);
      if (v17)
      {
LABEL_14:
        v13 = v18;
        goto LABEL_15;
      }
      v21 = v13 + 4;
      if (v13 + 4 >= v11)
        return swift_release();
      v17 = *(_QWORD *)(v7 + 8 * v21);
      v13 += 4;
      if (!v17)
        break;
    }
LABEL_15:
    v10 = (v17 - 1) & v17;
  }
  while (1)
  {
    v13 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v13 >= v11)
      return swift_release();
    v17 = *(_QWORD *)(v7 + 8 * v13);
    ++v21;
    if (v17)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

void DataFrameStream.frameData(forIdentifier:)(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  os_unfair_lock_s *v31;
  uint64_t v32;
  _QWORD v33[2];
  os_unfair_lock_s *v34;
  uint64_t v35;
  _QWORD *p_os_unfair_lock_opaque;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;

  v37 = a1;
  p_os_unfair_lock_opaque = (_QWORD *)sub_23A362A3C();
  v34 = (os_unfair_lock_s *)*(p_os_unfair_lock_opaque - 1);
  MEMORY[0x24BDAC7A8](p_os_unfair_lock_opaque);
  v3 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v4);
  v38 = (uint64_t)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (v10)
  {
    v11 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
    v12 = v11 + 4;
    v13 = v11 + 8;
    os_unfair_lock_lock(v11 + 8);
    p_os_unfair_lock_opaque = &v12->_os_unfair_lock_opaque;
    v14 = v45;
    sub_23A342F94(v12, v1, &v39);
    if (v14)
    {
      os_unfair_lock_unlock(v13);
      __break(1u);
    }
    else
    {
      v15 = 0;
      os_unfair_lock_unlock(v13);
      if (v39)
      {
        v16 = *(_QWORD *)(v39 + 16);
        if (v16)
        {
          v33[1] = v39;
          v34 = v13;
          v17 = (uint64_t *)(v39 + 40);
          v35 = v1;
          while (1)
          {
            v19 = *(v17 - 1);
            v18 = *v17;
            swift_bridgeObjectRetain();
            os_unfair_lock_lock(v13);
            sub_23A343074((uint64_t)p_os_unfair_lock_opaque, v19, v18, &v39);
            os_unfair_lock_unlock(v13);
            swift_bridgeObjectRelease();
            if (v15)
              break;
            v45 = 0;
            v20 = v39;
            v22 = v41;
            v21 = v42;
            v23 = v43;
            v24 = v44;
            v38 = v40;
            v25 = sub_23A34DC18(v37);
            v27 = (_QWORD *)v25;
            if (v26 == 1)
            {
              v37 = v25;
            }
            else if (v26 != 2)
            {
              swift_bridgeObjectRelease();
              v39 = v20;
              v40 = v38;
              v41 = v22;
              v42 = v21;
              v43 = v23;
              v44 = v24;
              DataFrameStreamSegment.frameData(forSegmentIndex:)(v27);
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              return;
            }
            v17 += 2;
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            --v16;
            v15 = v45;
            v13 = v34;
            if (!v16)
              goto LABEL_16;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_16:
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  else
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D12A8);
    v29 = v38;
    sub_23A3485A0(v28, v38, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v39 = 0;
    v40 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v39 = 0xD000000000000018;
    v40 = 0x800000023A366110;
    sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v30 = &v8[*(int *)(v6 + 20)];
    v31 = v34;
    v32 = (uint64_t)p_os_unfair_lock_opaque;
    (*(void (**)(char *, char *, _QWORD *))&v34[4]._os_unfair_lock_opaque)(v3, v30, p_os_unfair_lock_opaque);
    sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))&v31[2]._os_unfair_lock_opaque)(v3, v32);
    sub_23A33E2E0(v39, v40, 0xD000000000000062, 0x800000023A366070, 0xD000000000000019, 0x800000023A366230);
    swift_bridgeObjectRelease();
    sub_23A3485E4(v29, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
  }
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataFrameStream.deleteFrame(forIdentifier:)(Swift::UInt64 forIdentifier)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  Swift::UInt32 v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  os_unfair_lock_s *v31;
  uint64_t v32;
  Swift::Bool result;
  _QWORD v34[2];
  os_unfair_lock_s *v35;
  uint64_t v36;
  _QWORD *p_os_unfair_lock_opaque;
  Swift::UInt64 v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;

  v38 = forIdentifier;
  p_os_unfair_lock_opaque = (_QWORD *)sub_23A362A3C();
  v35 = (os_unfair_lock_s *)*(p_os_unfair_lock_opaque - 1);
  MEMORY[0x24BDAC7A8](p_os_unfair_lock_opaque);
  v3 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v4);
  v39 = (uint64_t)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v10 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (!v10)
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D12A8);
    v29 = v39;
    sub_23A3485A0(v28, v39, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v40 = 0;
    v41 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v40 = 0xD000000000000018;
    v41 = 0x800000023A366110;
    sub_23A3485A0(v9, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v30 = &v8[*(int *)(v6 + 20)];
    v31 = v35;
    v32 = (uint64_t)p_os_unfair_lock_opaque;
    (*(void (**)(char *, char *, _QWORD *))&v35[4]._os_unfair_lock_opaque)(v3, v30, p_os_unfair_lock_opaque);
    sub_23A3485E4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))&v31[2]._os_unfair_lock_opaque)(v3, v32);
    sub_23A33E2E0(v40, v41, 0xD000000000000062, 0x800000023A366070, 0xD00000000000001BLL, 0x800000023A366250);
    swift_bridgeObjectRelease();
    sub_23A3485E4(v29, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    LOBYTE(v17) = 0;
    return v17 & 1;
  }
  v11 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v12 = v11 + 4;
  v13 = v11 + 8;
  os_unfair_lock_lock(v11 + 8);
  p_os_unfair_lock_opaque = &v12->_os_unfair_lock_opaque;
  v14 = v46;
  sub_23A342F94(v12, v1, &v40);
  if (!v14)
  {
    os_unfair_lock_unlock(v13);
    if (v40)
    {
      v46 = 0;
      v15 = *(_QWORD *)(v40 + 16);
      if (v15)
      {
        v34[1] = v40;
        v35 = v13;
        v16 = (uint64_t *)(v40 + 40);
        v36 = v1;
        while (1)
        {
          v18 = *(v16 - 1);
          v17 = *v16;
          swift_bridgeObjectRetain();
          os_unfair_lock_lock(v13);
          v19 = v46;
          sub_23A343074((uint64_t)p_os_unfair_lock_opaque, v18, v17, &v40);
          os_unfair_lock_unlock(v13);
          swift_bridgeObjectRelease();
          v46 = v19;
          if (v19)
            break;
          v20 = v40;
          v22 = v42;
          v21 = v43;
          v23 = v44;
          v24 = v45;
          v39 = v41;
          v25 = sub_23A34DC18(v38);
          v27 = v25;
          if (v26 == 1)
          {
            v38 = v25;
          }
          else if (v26 != 2)
          {
            swift_bridgeObjectRelease();
            v40 = v20;
            v41 = v39;
            v42 = v22;
            v43 = v21;
            v44 = v23;
            v45 = v24;
            LOBYTE(v17) = DataFrameStreamSegment.deleteFrame(index:)(v27);
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            return v17 & 1;
          }
          v16 += 2;
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          --v15;
          v13 = v35;
          if (!v15)
            goto LABEL_17;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_17:
        swift_bridgeObjectRelease();
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
    return v17 & 1;
  }
  os_unfair_lock_unlock(v13);
  __break(1u);
  return result;
}

void DataFrameStream.mutateFrame(forIdentifier:_:)(unint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  BOOL v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  void (*v38)(void);
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  os_unfair_lock_s *v44;
  unint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;

  v38 = a2;
  v39 = a3;
  v45 = a1;
  v41 = a4;
  v42 = sub_23A362A3C();
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v7);
  v44 = (os_unfair_lock_s *)((char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v12, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v13 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (!v13)
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v31 = __swift_project_value_buffer(v7, (uint64_t)qword_2542D12A8);
    v32 = (uint64_t)v44;
    sub_23A3485A0(v31, (uint64_t)v44, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    *(_QWORD *)&v46 = 0;
    *((_QWORD *)&v46 + 1) = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v46 = 0xD000000000000018;
    *((_QWORD *)&v46 + 1) = 0x800000023A366110;
    sub_23A3485A0(v12, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v33 = &v11[*(int *)(v9 + 20)];
    v34 = v40;
    v35 = v42;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v6, v33, v42);
    sub_23A3485E4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
    sub_23A33E2E0(v46, *((unint64_t *)&v46 + 1), 0xD000000000000062, 0x800000023A366070, 0xD00000000000001DLL, 0x800000023A366270);
    swift_bridgeObjectRelease();
    sub_23A3485E4(v32, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    goto LABEL_16;
  }
  v14 = *(os_unfair_lock_s **)(v4 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v15 = v14 + 4;
  v16 = v14 + 8;
  os_unfair_lock_lock(v14 + 8);
  v44 = v15;
  v17 = v51;
  sub_23A342F94(v15, v4, &v46);
  if (v17)
  {
    os_unfair_lock_unlock(v16);
    __break(1u);
    return;
  }
  os_unfair_lock_unlock(v16);
  if (!(_QWORD)v46)
  {
LABEL_16:
    v36 = v41;
    *v41 = 0;
    *((_BYTE *)v36 + 8) = 1;
    return;
  }
  v51 = 0;
  v18 = *(_QWORD *)(v46 + 16);
  v40 = v46;
  if (!v18)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v19 = (uint64_t *)(v46 + 40);
  v42 = (uint64_t)v16;
  v43 = v4;
  while (1)
  {
    v21 = *(v19 - 1);
    v20 = *v19;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v16);
    v22 = v51;
    sub_23A343074((uint64_t)v44, v21, v20, &v46);
    os_unfair_lock_unlock(v16);
    swift_bridgeObjectRelease();
    v51 = v22;
    if (v22)
      break;
    v23 = v46;
    v24 = v47;
    v25 = v48;
    v26 = v49;
    v27 = v50;
    v28 = sub_23A34DC18(v45);
    v30 = v28;
    if (v29 == 1)
    {
      v45 = v28;
    }
    else if (v29 != 2)
    {
      swift_bridgeObjectRelease();
      v46 = v23;
      v47 = v24;
      v48 = v25;
      v49 = v26;
      v50 = v27;
      swift_retain();
      sub_23A34E1A8(v30, v38, v39, &v46, (uint64_t)v41);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    v19 += 2;
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    --v18;
    v16 = (os_unfair_lock_s *)v42;
    if (!v18)
      goto LABEL_15;
  }
  swift_bridgeObjectRelease();
}

void sub_23A344ED0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  os_unfair_lock_s *v7;
  uint64_t *v8;
  os_unfair_lock_s *v9;
  char v10;

  v7 = *(os_unfair_lock_s **)(a3 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  v8 = (uint64_t *)&v7[4];
  v9 = v7 + 10;
  os_unfair_lock_lock(v7 + 10);
  sub_23A341DAC(v8, a3, a1, a2, &v10);
  os_unfair_lock_unlock(v9);
  if (v3)
    __break(1u);
  else
    sub_23A3417F0(a1, a2);
}

uint64_t DataFrameStream.dataAvailable()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A344FB4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23A34503C;
  return sub_23A362ED4();
}

uint64_t sub_23A34503C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A345090()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A345098(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;

  v3 = *(os_unfair_lock_s **)(a2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  v4 = v3 + 4;
  v5 = v3 + 10;
  os_unfair_lock_lock(v3 + 10);
  sub_23A3450F4(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_23A3450F4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C230);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*a1)
    return sub_23A362D18();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = a1[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v8 = sub_23A35F610(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
  v10 = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  if (v10 >= v9 >> 1)
    v8 = sub_23A35F610(v9 > 1, v10 + 1, 1, v8);
  *(_QWORD *)(v8 + 16) = v10 + 1;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v10, v7, v4);
  a1[2] = v8;
  return result;
}

unint64_t DataFrameStream.frameCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  BOOL v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  void (**v24)(char *, _QWORD, uint64_t);
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  BOOL v29;
  uint64_t v30;
  void (**v31)(char *, _QWORD, uint64_t);
  unsigned __int8 v32;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  os_unfair_lock_t v41;
  os_unfair_lock_s *v42;
  void (**v43)(char *, _QWORD, uint64_t);
  unsigned int v44;
  uint64_t v45;
  os_unfair_lock_s *v46;
  uint64_t v47;
  uint64_t v48;
  void (**v49)(char *, _QWORD, uint64_t);

  v1 = v0;
  v2 = sub_23A362A3C();
  v43 = *(void (***)(char *, _QWORD, uint64_t))(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v40);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DataFrameStreamContainer();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (os_unfair_lock_s *)((char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container;
  swift_beginAccess();
  sub_23A3485A0(v10, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  type metadata accessor for StorageContainer();
  v11 = _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0();
  sub_23A3485E4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  if (!v11)
  {
    v18 = (uint64_t)v6;
    if (qword_2542D0118 != -1)
LABEL_23:
      swift_once();
    v30 = __swift_project_value_buffer(v40, (uint64_t)qword_2542D12A8);
    sub_23A3485A0(v30, v18, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    v45 = 0;
    v46 = (os_unfair_lock_s *)0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v45 = 0xD000000000000018;
    v46 = (os_unfair_lock_s *)0x800000023A366110;
    sub_23A3485A0(v10, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    v31 = v43;
    ((void (**)(char *, char *, uint64_t))v43)[2](v4, (char *)v9 + *(int *)(v7 + 20), v2);
    sub_23A3485E4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v31[1])(v4, v2);
    sub_23A33E2E0(v45, (unint64_t)v46, 0xD000000000000062, 0x800000023A366070, 0x756F43656D617266, 0xEA0000000000746ELL);
    swift_bridgeObjectRelease();
    sub_23A3485E4(v18, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
    goto LABEL_13;
  }
  v12 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedState);
  v13 = v12 + 4;
  v14 = v12 + 8;
  os_unfair_lock_lock(v12 + 8);
  v42 = v13;
  v15 = 0;
  sub_23A342F94(v13, v1, &v45);
  v41 = v14;
  os_unfair_lock_unlock(v14);
  if (v45)
  {
    v16 = *(_QWORD *)(v45 + 16);
    if (v16)
    {
      v17 = v1;
      v38 = v6;
      v39 = v45;
      LODWORD(v18) = 0;
      v19 = (uint64_t *)(v45 + 40);
      while (1)
      {
        v21 = *(v19 - 1);
        v20 = *v19;
        swift_bridgeObjectRetain();
        v22 = v41;
        os_unfair_lock_lock(v41);
        sub_23A343074((uint64_t)v42, v21, v20, &v45);
        os_unfair_lock_unlock(v22);
        swift_bridgeObjectRelease();
        if (v15)
        {
          swift_bridgeObjectRelease();

          goto LABEL_13;
        }
        v23 = v16;
        v43 = 0;
        v2 = v17;
        v9 = v46;
        v10 = v47;
        v7 = v48;
        v24 = v49;
        v25 = *(_QWORD *)(v48 + 16);
        v26 = *(_DWORD *)(v25 + 16);
        v27 = *(_DWORD *)(v25 + 20);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        swift_retain();
        v28 = v27;
        v29 = v26 >= v27;
        v4 = (char *)(v26 - v27);
        if (!v29)
          break;
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease_n();
        v29 = __CFADD__((_DWORD)v18, (_DWORD)v4);
        v18 = (v18 + (_DWORD)v4);
        if (v29)
        {
          __break(1u);
          goto LABEL_23;
        }
        v19 += 2;
        v16 = v23 - 1;
        v17 = v2;
        v15 = v43;
        if (v23 == 1)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }
      v34 = v28;
      v42 = v9;
      v43 = v24;
      if (qword_2542D0118 != -1)
        swift_once();
      v35 = __swift_project_value_buffer(v40, (uint64_t)qword_2542D12A8);
      v36 = (uint64_t)v38;
      sub_23A3485A0(v35, (uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
      v45 = 0;
      v46 = (os_unfair_lock_s *)0xE000000000000000;
      sub_23A362E2C();
      sub_23A362C58();
      v44 = v26;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      v44 = v34;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v45, (unint64_t)v46, 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000011, 0x800000023A366210);
      swift_bridgeObjectRelease();
      sub_23A3485E4(v36, (uint64_t (*)(_QWORD))type metadata accessor for InternalLogger);
      swift_bridgeObjectRelease();
      swift_release_n();
      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease_n();
LABEL_13:
      v18 = 0;
      v32 = 1;
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
  }
  v18 = 0;
LABEL_16:
  v32 = 0;
LABEL_17:
  LOBYTE(v45) = v32;
  return v18 | ((unint64_t)v32 << 32);
}

uint64_t DataFrameStream.deinit()
{
  uint64_t v0;

  sub_23A3485E4(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  swift_release();
  swift_release();
  return v0;
}

uint64_t DataFrameStream.__deallocating_deinit()
{
  uint64_t v0;

  sub_23A3485E4(v0 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_container, (uint64_t (*)(_QWORD))type metadata accessor for DataFrameStreamContainer);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_23A3458CC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  os_unfair_lock_s *v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;
  char v9;

  v6 = *(os_unfair_lock_s **)(*v2 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
  v7 = (uint64_t *)&v6[4];
  v8 = v6 + 10;
  os_unfair_lock_lock(v6 + 10);
  sub_23A348C10(v7, &v9);
  os_unfair_lock_unlock(v8);
  if (v3)
    __break(1u);
  else
    sub_23A3417F0(a1, a2);
}

void sub_23A3459A4(uint64_t (*a1)(uint64_t, char *, uint64_t, unint64_t), uint64_t a2)
{
  DataFrameStream.prune(each:)(a1, a2);
}

void sub_23A3459C4()
{
  DataFrameStream.vacuum()();
}

uint64_t sub_23A3459E4(int a1, uint64_t (*a2)(_QWORD, unint64_t, uint64_t, unint64_t), uint64_t a3)
{
  return DataFrameStream.iterate(reversed:each:)(a1, a2, a3);
}

void sub_23A345A04(unint64_t a1)
{
  DataFrameStream.frameData(forIdentifier:)(a1);
}

uint64_t sub_23A345A24(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  uint64_t v22;

  v5 = *v2;
  sub_23A362F34();
  v6 = *(_QWORD *)(a2 + 16);
  sub_23A362F40();
  v7 = *(_QWORD *)(a2 + 16);
  if (v7)
  {
    v8 = a2 + 32;
    do
    {
      v8 += 4;
      sub_23A362F58();
      --v7;
    }
    while (v7);
  }
  result = sub_23A362F64();
  v10 = -1 << *(_BYTE *)(v5 + 32);
  v11 = result & ~v10;
  if (((*(_QWORD *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    v13 = v6 - 2;
    while (1)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v11);
      if (*(_QWORD *)(v14 + 16) == v6)
      {
        if (!v6 || v14 == a2)
          goto LABEL_22;
        v15 = *(_QWORD *)(a2 + 16);
        if (!v15)
          goto LABEL_26;
        if (*(_DWORD *)(v14 + 32) == *(_DWORD *)(a2 + 32))
        {
          if (v6 == 1)
            goto LABEL_22;
          v16 = v15 >= 2;
          v17 = v15 - 2;
          if (!v16)
            goto LABEL_27;
          if (*(_DWORD *)(v14 + 36) == *(_DWORD *)(a2 + 36))
            break;
        }
      }
LABEL_6:
      v11 = (v11 + 1) & v12;
      if (((*(_QWORD *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_23;
    }
    if (v6 == 2)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v11);
      swift_bridgeObjectRetain();
      return 0;
    }
    v18 = 0;
    v19 = v14 + 40;
    while (v13 != v18)
    {
      if (v17 == v18)
        goto LABEL_25;
      if (*(_DWORD *)(v19 + 4 * v18) != *(_DWORD *)(a2 + 4 * v18 + 40))
        goto LABEL_6;
      if (v13 == ++v18)
        goto LABEL_22;
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
LABEL_23:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v2;
    *v2 = 0x8000000000000000;
    v21 = swift_bridgeObjectRetain();
    sub_23A3463A0(v21, v11, isUniquelyReferenced_nonNull_native);
    *v2 = v22;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  return result;
}

uint64_t sub_23A345C1C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A362F34();
  swift_bridgeObjectRetain();
  sub_23A362C34();
  v8 = sub_23A362F64();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A362EE0() & 1) != 0)
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
      if (v19 || (sub_23A362EE0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A3465B0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A345DC8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  _QWORD *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C268);
  result = sub_23A362E14();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v28 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v27 = (unint64_t)(v6 + 63) >> 6;
    v9 = result + 56;
    while (1)
    {
      if (v8)
      {
        v11 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v12 = v11 | (v5 << 6);
      }
      else
      {
        v13 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v13 >= v27)
          goto LABEL_36;
        v14 = v28[v13];
        ++v5;
        if (!v14)
        {
          v5 = v13 + 1;
          if (v13 + 1 >= v27)
            goto LABEL_36;
          v14 = v28[v5];
          if (!v14)
          {
            v5 = v13 + 2;
            if (v13 + 2 >= v27)
              goto LABEL_36;
            v14 = v28[v5];
            if (!v14)
            {
              v15 = v13 + 3;
              if (v15 >= v27)
              {
LABEL_36:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v28 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v14 = v28[v15];
              if (!v14)
              {
                while (1)
                {
                  v5 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_42;
                  if (v5 >= v27)
                    goto LABEL_36;
                  v14 = v28[v5];
                  ++v15;
                  if (v14)
                    goto LABEL_23;
                }
              }
              v5 = v15;
            }
          }
        }
LABEL_23:
        v8 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v5 << 6);
      }
      v16 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v12);
      sub_23A362F34();
      sub_23A362F40();
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v18 = v16 + 32;
        do
        {
          v18 += 4;
          sub_23A362F58();
          --v17;
        }
        while (v17);
      }
      result = sub_23A362F64();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6))) != 0)
      {
        v10 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v9 + 8 * v21);
        }
        while (v25 == -1);
        v10 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v10) = v16;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23A3460C4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C238);
  v3 = sub_23A362E14();
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
      sub_23A362F34();
      sub_23A362C34();
      result = sub_23A362F64();
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

uint64_t sub_23A3463A0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  _DWORD *v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_23A345DC8();
    }
    else
    {
      if (v7 > v6)
      {
        result = (uint64_t)sub_23A346748();
        goto LABEL_30;
      }
      sub_23A346AA0();
    }
    v8 = *v3;
    sub_23A362F34();
    v9 = *(_QWORD *)(v5 + 16);
    sub_23A362F40();
    v10 = *(_QWORD *)(v5 + 16);
    if (v10)
    {
      v11 = v5 + 32;
      do
      {
        v11 += 4;
        sub_23A362F58();
        --v10;
      }
      while (v10);
    }
    result = sub_23A362F64();
    v12 = -1 << *(_BYTE *)(v8 + 32);
    a2 = result & ~v12;
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v13 = ~v12;
      while (1)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        if (*(_QWORD *)(v14 + 16) == v9)
        {
          if (!v9 || v14 == v5)
            goto LABEL_29;
          v15 = *(_QWORD *)(v5 + 16);
          if (!v15)
            goto LABEL_34;
          if (*(_DWORD *)(v14 + 32) == *(_DWORD *)(v5 + 32))
          {
            if (v9 == 1)
              goto LABEL_29;
            v16 = v15 >= 2;
            v17 = v15 - 2;
            if (!v16)
              goto LABEL_35;
            if (*(_DWORD *)(v14 + 36) == *(_DWORD *)(v5 + 36))
              break;
          }
        }
LABEL_13:
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          goto LABEL_30;
      }
      if (v9 == 2)
      {
LABEL_29:
        result = sub_23A362EEC();
        __break(1u);
        goto LABEL_30;
      }
      v18 = (_DWORD *)(v14 + 40);
      v19 = (unsigned int *)(v5 + 40);
      v20 = v9 - 2;
      while (v20)
      {
        if (!v17)
          goto LABEL_33;
        result = *v19;
        if (*v18 != (_DWORD)result)
          goto LABEL_13;
        --v17;
        ++v18;
        ++v19;
        if (!--v20)
          goto LABEL_29;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_30:
  v21 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v21 + 48) + 8 * a2) = v5;
  v22 = *(_QWORD *)(v21 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v21 + 16) = v24;
    return result;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23A3465B0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A3460C4();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A3468F0();
      goto LABEL_22;
    }
    sub_23A346D6C();
  }
  v11 = *v4;
  sub_23A362F34();
  sub_23A362C34();
  result = sub_23A362F64();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A362EE0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A362EEC();
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
          result = sub_23A362EE0();
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

void *sub_23A346748()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C268);
  v2 = *v0;
  v3 = sub_23A362E08();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_23A3468F0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C238);
  v2 = *v0;
  v3 = sub_23A362E08();
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

uint64_t sub_23A346AA0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C268);
  result = sub_23A362E14();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_37:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v26 = v2 + 56;
  v6 = 1 << *(_BYTE *)(v2 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v27 = (unint64_t)(v6 + 63) >> 6;
  v9 = result + 56;
  while (1)
  {
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_23;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v27)
        goto LABEL_35;
      v14 = *(_QWORD *)(v26 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v27)
          goto LABEL_35;
        v14 = *(_QWORD *)(v26 + 8 * v5);
        if (!v14)
        {
          v15 = v13 + 3;
          if (v15 >= v27)
          {
LABEL_35:
            result = swift_release();
            v1 = v0;
            goto LABEL_37;
          }
          v14 = *(_QWORD *)(v26 + 8 * v15);
          v5 = v15;
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_23:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v12);
    sub_23A362F34();
    sub_23A362F40();
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v18 = v16 + 32;
      do
      {
        v18 += 4;
        sub_23A362F58();
        --v17;
      }
      while (v17);
    }
    result = sub_23A362F64();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        v25 = *(_QWORD *)(v9 + 8 * v21);
      }
      while (v25 == -1);
      v10 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v10) = v16;
    ++*(_QWORD *)(v4 + 16);
    result = swift_bridgeObjectRetain();
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23A346D6C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C238);
  v3 = sub_23A362E14();
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
    sub_23A362F34();
    swift_bridgeObjectRetain();
    sub_23A362C34();
    result = sub_23A362F64();
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

uint64_t sub_23A347018(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  int64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  char *v58;
  uint64_t v59;

  v3 = v2;
  v5 = sub_23A362A3C();
  v53 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C220);
  v52 = a2;
  v9 = sub_23A362E80();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v49 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v47 = v2;
  v48 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v50 = v8;
  v51 = v10;
  v58 = v7;
  v59 = v5;
  v18 = v53;
  while (1)
  {
    if (v14)
    {
      v22 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v23 = v22 | (v17 << 6);
      goto LABEL_22;
    }
    v24 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v48)
      break;
    v25 = v49;
    v26 = v49[v24];
    ++v17;
    if (!v26)
    {
      v17 = v24 + 1;
      if (v24 + 1 >= v48)
        goto LABEL_34;
      v26 = v49[v17];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v48)
        {
LABEL_34:
          swift_release();
          v3 = v47;
          if ((v52 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v26 = v49[v27];
        if (!v26)
        {
          while (1)
          {
            v17 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_43;
            if (v17 >= v48)
              goto LABEL_34;
            v26 = v49[v17];
            ++v27;
            if (v26)
              goto LABEL_21;
          }
        }
        v17 = v27;
      }
    }
LABEL_21:
    v14 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_22:
    v28 = *(_QWORD *)(v18 + 72);
    v29 = *(_QWORD *)(v8 + 48) + v28 * v23;
    v30 = 48 * v23;
    v57 = v17;
    if ((v52 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v18 + 32))(v58, v29, v59);
      v31 = *(_QWORD *)(v8 + 56) + v30;
      v32 = *(_QWORD *)v31;
      v33 = *(_QWORD *)(v31 + 16);
      v55 = *(_QWORD *)(v31 + 8);
      v56 = v32;
      v35 = *(_QWORD *)(v31 + 24);
      v34 = *(_QWORD *)(v31 + 32);
      v54 = *(_DWORD *)(v31 + 40);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v58, v29, v59);
      v36 = *(_QWORD *)(v8 + 56) + v30;
      v37 = *(_QWORD *)v36;
      v55 = *(_QWORD *)(v36 + 8);
      v56 = v37;
      v33 = *(_QWORD *)(v36 + 16);
      v35 = *(_QWORD *)(v36 + 24);
      v34 = *(_QWORD *)(v36 + 32);
      v54 = *(_DWORD *)(v36 + 40);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
    }
    v10 = v51;
    sub_23A348CB8(&qword_25696C228, MEMORY[0x24BDCDAF0]);
    result = sub_23A362B74();
    v38 = -1 << *(_BYTE *)(v10 + 32);
    v39 = result & ~v38;
    v40 = v39 >> 6;
    if (((-1 << v39) & ~*(_QWORD *)(v15 + 8 * (v39 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v39) & ~*(_QWORD *)(v15 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
      v18 = v53;
    }
    else
    {
      v41 = 0;
      v42 = (unint64_t)(63 - v38) >> 6;
      v18 = v53;
      do
      {
        if (++v40 == v42 && (v41 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v43 = v40 == v42;
        if (v40 == v42)
          v40 = 0;
        v41 |= v43;
        v44 = *(_QWORD *)(v15 + 8 * v40);
      }
      while (v44 == -1);
      v19 = __clz(__rbit64(~v44)) + (v40 << 6);
    }
    *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(*(_QWORD *)(v10 + 48) + v28 * v19, v58, v59);
    v20 = *(_QWORD *)(v10 + 56) + 48 * v19;
    v17 = v57;
    v21 = v55;
    *(_QWORD *)v20 = v56;
    *(_QWORD *)(v20 + 8) = v21;
    *(_QWORD *)(v20 + 16) = v33;
    *(_QWORD *)(v20 + 24) = v35;
    *(_QWORD *)(v20 + 32) = v34;
    *(_DWORD *)(v20 + 40) = v54;
    ++*(_QWORD *)(v10 + 16);
    v8 = v50;
  }
  swift_release();
  v3 = v47;
  v25 = v49;
  if ((v52 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v45 = 1 << *(_BYTE *)(v8 + 32);
  if (v45 >= 64)
    bzero(v25, ((unint64_t)(v45 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v45;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_23A347430(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  int v44;
  uint64_t v45;

  v3 = v2;
  v5 = sub_23A362A3C();
  v45 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C240);
  v44 = a2;
  v9 = sub_23A362E80();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v42 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v40 = v2;
  v41 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  for (i = v8; ; v8 = i)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v41)
      break;
    v23 = v42;
    v24 = v42[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v41)
        goto LABEL_34;
      v24 = v42[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v41)
        {
LABEL_34:
          swift_release();
          v3 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v42[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v41)
              goto LABEL_34;
            v24 = v42[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v45 + 72);
    v27 = *(_QWORD *)(v8 + 48) + v26 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v45 + 32))(v7, v27, v5);
      v28 = *(_QWORD *)(v8 + 56) + 16 * v21;
      v29 = *(_DWORD *)v28;
      v30 = *(_QWORD *)(v28 + 8);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v7, v27, v5);
      v31 = *(_QWORD *)(v8 + 56) + 16 * v21;
      v29 = *(_DWORD *)v31;
      v30 = *(_QWORD *)(v31 + 8);
      swift_retain();
    }
    sub_23A348CB8(&qword_25696C228, MEMORY[0x24BDCDAF0]);
    result = sub_23A362B74();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v45 + 32))(*(_QWORD *)(v10 + 48) + v26 * v18, v7, v5);
    v19 = *(_QWORD *)(v10 + 56) + 16 * v18;
    *(_DWORD *)v19 = v29;
    *(_QWORD *)(v19 + 8) = v30;
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v40;
  v23 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v39 = 1 << *(_BYTE *)(v8 + 32);
  if (v39 >= 64)
    bzero(v23, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v39;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_23A3477E0(_OWORD *a1, uint64_t a2, char a3)
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
  uint64_t result;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = sub_23A362A3C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23A3548EC(a2);
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
        return sub_23A348C7C((uint64_t)a1, v20[7] + 48 * v14);
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_23A347C14();
      goto LABEL_7;
    }
    sub_23A347018(v17, a3 & 1);
    v22 = sub_23A3548EC(a2);
    if ((v18 & 1) == (v23 & 1))
    {
      v14 = v22;
      v20 = *v4;
      if ((v18 & 1) != 0)
        return sub_23A348C7C((uint64_t)a1, v20[7] + 48 * v14);
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_23A347AC4(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_23A362EF8();
  __break(1u);
  return result;
}

uint64_t sub_23A347954(int a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v5 = (_QWORD **)v4;
  v27 = a2;
  v9 = sub_23A362A3C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_23A3548EC(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = *v5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = v21[7] + 16 * v15;
      result = swift_release();
      *(_DWORD *)v22 = a1;
      *(_QWORD *)(v22 + 8) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_23A347EE4();
    goto LABEL_7;
  }
  sub_23A347430(v18, a4 & 1);
  v24 = sub_23A3548EC(a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = sub_23A362EF8();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = *v5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_23A347B70(v15, (uint64_t)v12, a1, v27, v21);
}

uint64_t sub_23A347AC4(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23A362A3C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v11 = (_OWORD *)(a4[7] + 48 * a1);
  *(_OWORD *)((char *)v11 + 28) = *(_OWORD *)((char *)a3 + 28);
  v12 = a3[1];
  *v11 = *a3;
  v11[1] = v12;
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_23A347B70(unint64_t a1, uint64_t a2, int a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = sub_23A362A3C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = a5[7] + 16 * a1;
  *(_DWORD *)v13 = a3;
  *(_QWORD *)(v13 + 8) = a4;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

void *sub_23A347C14()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  const void *v36;
  int64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  int v45;
  uint64_t v46;

  v1 = sub_23A362A3C();
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v38 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C220);
  v35 = v0;
  v3 = *v0;
  v4 = sub_23A362E74();
  v5 = *(_QWORD *)(v3 + 16);
  v42 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v34 = v42;
    v33 = v35;
LABEL_28:
    *v33 = v34;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v36 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, v36, 8 * v8);
    v6 = v42;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v41 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v38;
  v14 = v39;
  v16 = v40;
  v17 = v42;
  while (1)
  {
    if (v13)
    {
      v43 = (v13 - 1) & v13;
      v44 = v10;
      v18 = __clz(__rbit64(v13)) | (v10 << 6);
      v19 = v41;
      goto LABEL_12;
    }
    v29 = v10 + 1;
    v19 = v41;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v29 >= v37)
      goto LABEL_26;
    v30 = *((_QWORD *)v36 + v29);
    v31 = v10 + 1;
    if (!v30)
    {
      v31 = v10 + 2;
      if (v10 + 2 >= v37)
        goto LABEL_26;
      v30 = *((_QWORD *)v36 + v31);
      if (!v30)
        break;
    }
LABEL_25:
    v43 = (v30 - 1) & v30;
    v44 = v31;
    v18 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v14 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v16);
    v21 = *(_QWORD *)(v19 + 56);
    v22 = 48 * v18;
    v23 = (uint64_t *)(v21 + 48 * v18);
    v24 = v23[1];
    v46 = *v23;
    v25 = v23[2];
    v26 = v23[3];
    v27 = v23[4];
    v45 = *((_DWORD *)v23 + 10);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v17 + 48) + v20, v15, v16);
    v28 = *(_QWORD *)(v17 + 56) + v22;
    *(_QWORD *)v28 = v46;
    *(_QWORD *)(v28 + 8) = v24;
    *(_QWORD *)(v28 + 16) = v25;
    *(_QWORD *)(v28 + 24) = v26;
    *(_QWORD *)(v28 + 32) = v27;
    *(_DWORD *)(v28 + 40) = v45;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    result = (void *)swift_retain();
    v13 = v43;
    v10 = v44;
  }
  v32 = v10 + 3;
  if (v10 + 3 >= v37)
  {
LABEL_26:
    result = (void *)swift_release();
    v33 = v35;
    v34 = v42;
    goto LABEL_28;
  }
  v30 = *((_QWORD *)v36 + v32);
  if (v30)
  {
    v31 = v10 + 3;
    goto LABEL_25;
  }
  while (1)
  {
    v31 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v31 >= v37)
      goto LABEL_26;
    v30 = *((_QWORD *)v36 + v31);
    ++v32;
    if (v30)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23A347EE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  const void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = sub_23A362A3C();
  v1 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C240);
  v32 = v0;
  v3 = *v0;
  v4 = sub_23A362E74();
  v5 = *(_QWORD *)(v3 + 16);
  v38 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v30 = v38;
    v29 = v32;
LABEL_28:
    *v29 = v30;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, v34, 8 * v8);
    v6 = v38;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v37 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v33 = (unint64_t)(v11 + 63) >> 6;
  v15 = v35;
  v14 = v36;
  v16 = v38;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v10 << 6);
      v19 = v37;
      goto LABEL_12;
    }
    v26 = v10 + 1;
    v19 = v37;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v33)
      goto LABEL_26;
    v27 = *((_QWORD *)v34 + v26);
    ++v10;
    if (!v27)
    {
      v10 = v26 + 1;
      if (v26 + 1 >= v33)
        goto LABEL_26;
      v27 = *((_QWORD *)v34 + v10);
      if (!v27)
        break;
    }
LABEL_25:
    v13 = (v27 - 1) & v27;
    v18 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v14);
    v21 = 16 * v18;
    v22 = *(_QWORD *)(v19 + 56) + 16 * v18;
    v23 = *(_DWORD *)v22;
    v24 = *(_QWORD *)(v22 + 8);
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v16 + 48) + v20, v15, v14);
    v25 = *(_QWORD *)(v16 + 56) + v21;
    *(_DWORD *)v25 = v23;
    *(_QWORD *)(v25 + 8) = v24;
    result = (void *)swift_retain();
  }
  v28 = v26 + 2;
  if (v28 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v29 = v32;
    v30 = v38;
    goto LABEL_28;
  }
  v27 = *((_QWORD *)v34 + v28);
  if (v27)
  {
    v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v10 >= v33)
      goto LABEL_26;
    v27 = *((_QWORD *)v34 + v10);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *sub_23A34815C(_QWORD *a1)
{
  return sub_23A35F504(0, a1[2], 0, a1);
}

uint64_t sub_23A348170(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  _QWORD *v16;
  BOOL v17;
  _QWORD *v18;
  uint64_t result;
  unint64_t v20;
  uint64_t *v21;
  BOOL v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  BOOL v34;
  unint64_t i;
  _QWORD *v36;
  BOOL v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v48;
  _QWORD *v49;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v3)
  {
    v45 = v2 + 4;
    swift_bridgeObjectRetain();
    v4 = 0;
    v48 = v2;
    while (1)
    {
      v5 = *a2;
      if (!*(_QWORD *)(*a2 + 16))
        goto LABEL_4;
      v6 = &v45[2 * v4];
      v8 = *v6;
      v7 = v6[1];
      sub_23A362F34();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A362C34();
      v9 = sub_23A362F64();
      v10 = -1 << *(_BYTE *)(v5 + 32);
      v11 = v9 & ~v10;
      v12 = v5 + 56;
      if (((*(_QWORD *)(v5 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
        break;
LABEL_3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v2 = v48;
LABEL_4:
      if (++v4 == v3)
      {
        swift_bridgeObjectRelease();
        return v2[2];
      }
    }
    v13 = *(_QWORD *)(v5 + 48);
    v14 = (_QWORD *)(v13 + 16 * v11);
    v15 = *v14 == v8 && v14[1] == v7;
    if (!v15 && (sub_23A362EE0() & 1) == 0)
    {
      v10 = ~v10;
      do
      {
        v11 = (v11 + 1) & v10;
        if (((*(_QWORD *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
          goto LABEL_3;
        v16 = (_QWORD *)(v13 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
      }
      while (!v17 && (sub_23A362EE0() & 1) == 0);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = v48;
    result = swift_bridgeObjectRelease();
    v20 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    while (1)
    {
      while (1)
      {
        v23 = v18[2];
        if (v20 == v23)
          return v4;
        if (v20 >= v23)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        v24 = v18 + 4;
        v25 = &v18[2 * v20 + 4];
        v26 = *a2;
        if (*(_QWORD *)(*a2 + 16))
          break;
LABEL_45:
        if (v4 != v20)
        {
          if ((v4 & 0x8000000000000000) != 0)
            goto LABEL_59;
          v38 = v18[2];
          if (v4 >= v38)
            goto LABEL_60;
          if (v20 >= v38)
            goto LABEL_61;
          v39 = &v24[2 * v4];
          v10 = *v39;
          v12 = v39[1];
          v40 = *v25;
          v41 = v25[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v18 = sub_23A34815C(v18);
          v11 = (unint64_t)(v18 + 4);
          v42 = &v18[2 * v4 + 4];
          *v42 = v40;
          v42[1] = v41;
          result = swift_bridgeObjectRelease();
          if (v20 >= v18[2])
            goto LABEL_62;
LABEL_22:
          v21 = (uint64_t *)(v11 + 16 * v20);
          *v21 = v10;
          v21[1] = v12;
          result = swift_bridgeObjectRelease();
          *(_QWORD *)a1 = v18;
        }
        v22 = __OFADD__(v4++, 1);
        if (v22)
          goto LABEL_58;
        v22 = __OFADD__(v20++, 1);
        if (v22)
          goto LABEL_57;
      }
      v46 = v18 + 4;
      v49 = v18;
      v28 = *v25;
      v27 = v25[1];
      sub_23A362F34();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A362C34();
      v29 = sub_23A362F64();
      v30 = -1 << *(_BYTE *)(v26 + 32);
      v31 = v29 & ~v30;
      v32 = v26 + 56;
      if (((*(_QWORD *)(v26 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
        goto LABEL_44;
      v44 = *(_QWORD *)(v26 + 48);
      v33 = (_QWORD *)(v44 + 16 * v31);
      v34 = *v33 == v28 && v33[1] == v27;
      if (!v34 && (sub_23A362EE0() & 1) == 0)
        break;
LABEL_34:
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v18 = v49;
      v22 = __OFADD__(v20++, 1);
      if (v22)
        goto LABEL_57;
    }
    for (i = (v31 + 1) & ~v30; ((*(_QWORD *)(v32 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & ~v30)
    {
      v36 = (_QWORD *)(v44 + 16 * i);
      v37 = *v36 == v28 && v36[1] == v27;
      if (v37 || (sub_23A362EE0() & 1) != 0)
        goto LABEL_34;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v18 = v49;
    v24 = v46;
    goto LABEL_45;
  }
  return 0;
}

unint64_t sub_23A34855C()
{
  unint64_t result;

  result = qword_25696C1F8;
  if (!qword_25696C1F8)
  {
    result = MEMORY[0x23B849AC0](&unk_23A3644AC, &type metadata for SegmentLayoutError);
    atomic_store(result, (unint64_t *)&qword_25696C1F8);
  }
  return result;
}

uint64_t sub_23A3485A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A3485E4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A348620(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_23A35F504(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (_QWORD *)&v16[16 * v15])
      result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

unint64_t sub_23A348788()
{
  unint64_t result;

  result = qword_25696C208;
  if (!qword_25696C208)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364964, &type metadata for DataFrameStreamSegmentError);
    atomic_store(result, (unint64_t *)&qword_25696C208);
  }
  return result;
}

void sub_23A3487CC(uint64_t a1)
{
  uint64_t v1;

  sub_23A345098(a1, v1);
}

uint64_t sub_23A3487D4()
{
  return type metadata accessor for DataFrameStream();
}

uint64_t type metadata accessor for DataFrameStream()
{
  uint64_t result;

  result = qword_2542D1118;
  if (!qword_2542D1118)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A348818()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DataFrameStreamContainer();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DataFrameStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DataFrameStream.__allocating_init(storageContainer:segmentSize:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 104))(a1, a2, a3 & 1);
}

uint64_t destroy for DataFrameStreamPendingWrites()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s8Dendrite28DataFrameStreamPendingWritesVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DataFrameStreamPendingWrites(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataFrameStreamPendingWrites(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamPendingWrites(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamPendingWrites(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataFrameStreamPendingWrites()
{
  return &type metadata for DataFrameStreamPendingWrites;
}

uint64_t destroy for DataFrameStreamSegments()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s8Dendrite23DataFrameStreamSegmentsVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DataFrameStreamSegments(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for DataFrameStreamSegments(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegments(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamSegments(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataFrameStreamSegments()
{
  return &type metadata for DataFrameStreamSegments;
}

uint64_t sub_23A348C10@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_23A341DAC(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_23A348C2C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23A348C7C(uint64_t a1, uint64_t a2)
{
  assignWithTake for DataFrameStreamSegment(a2, a1);
  return a2;
}

uint64_t sub_23A348CB8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23A362A3C();
    result = MEMORY[0x23B849AC0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A348CF8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_23A348D48()
{
  unint64_t result;

  result = qword_25696C248;
  if (!qword_25696C248)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364320, &type metadata for DataFrameStreamError);
    atomic_store(result, (unint64_t *)&qword_25696C248);
  }
  return result;
}

uint64_t sub_23A348D8C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A348DB0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A348DDC(uint64_t a1)
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
  v7[1] = sub_23A3371B0;
  return sub_23A340CEC(a1, v4, v5, v6);
}

uint64_t sub_23A348E48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A348E84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A348F5C + 4 * asc_23A364200[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A348F7C + 4 * byte_23A364205[v4]))();
}

_BYTE *sub_23A348F5C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A348F7C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A348F84(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A348F8C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A348F94(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A348F9C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A348FA8()
{
  return 0;
}

ValueMetadata *type metadata accessor for DataFrameStreamError()
{
  return &type metadata for DataFrameStreamError;
}

unint64_t sub_23A348FC4()
{
  unint64_t result;

  result = qword_25696C270;
  if (!qword_25696C270)
  {
    result = MEMORY[0x23B849AC0](&unk_23A3642F8, &type metadata for DataFrameStreamError);
    atomic_store(result, (unint64_t *)&qword_25696C270);
  }
  return result;
}

uint64_t sub_23A349008()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SegmentOffsetTable()
{
  return objc_opt_self();
}

uint64_t sub_23A34904C(char *a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v4 = v3;
  v8 = sub_23A362AE4();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (char *)&v28 - v12;
  v29 = a3;
  v28 = a2;
  if ((a3 & 1) != 0)
  {
    v12 = (unint64_t)a1 >> 32;
    if (!((unint64_t)a1 >> 32))
    {
      if (a1 >> 11 != 27)
      {
        LODWORD(v12) = a1 >> 16;
        if (a1 >> 16 > 0x10)
        {
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
        if ((a1 & 0xFFFFFF80) != 0)
        {
LABEL_16:
          v23 = (a1 & 0x3F) << 8;
          v24 = (v23 | (a1 >> 6)) + 33217;
          v25 = (v23 | (a1 >> 6) & 0x3F) << 8;
          v26 = (((v25 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
          v27 = (v25 | (a1 >> 12)) + 8487393;
          if ((_DWORD)v12)
            v14 = v26;
          else
            v14 = v27;
          if (a1 < 0x800)
            v14 = v24;
          goto LABEL_10;
        }
        if (a1 <= 0xFF)
        {
          v14 = ((_BYTE)a1 + 1);
LABEL_10:
          v30 = (v14 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v14) >> 3)) & 7)));
          goto LABEL_11;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_14;
  }
LABEL_11:
  v30 = sub_23A362C1C();
  v31 = v15;
  swift_bridgeObjectRetain();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  v16 = v30;
  v17 = v31;
  sub_23A362AD8();
  sub_23A362AB4();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  v30 = v16;
  v31 = v17;
  swift_bridgeObjectRetain();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v30;
  v18 = v31;
  v4[2] = v30;
  v4[3] = v18;
  swift_bridgeObjectRetain();
  sub_23A362D54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C280);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_23A363D70;
  *(_QWORD *)(v20 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v20 + 64) = sub_23A349600();
  *(_QWORD *)(v20 + 32) = v19;
  *(_QWORD *)(v20 + 40) = v18;
  sub_23A33E858();
  swift_bridgeObjectRetain();
  v21 = (void *)sub_23A362DA8();
  sub_23A362AF0();
  swift_bridgeObjectRelease();

  sub_23A362C10();
  swift_bridgeObjectRelease();
  v22 = os_transaction_create();
  result = swift_release();
  if (v22)
  {
    v4[4] = v22;
    type metadata accessor for OSActivity();
    swift_allocObject();
    v4[5] = sub_23A34B334(a1, v28, v29);
    return (uint64_t)v4;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_23A349370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_activity_scope_state_s *v6;

  v1 = v0;
  sub_23A362D54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C280);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A363D70;
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 64) = sub_23A349600();
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v3;
  sub_23A33E858();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_23A362DA8();
  sub_23A362AF0();
  swift_bridgeObjectRelease();

  v6 = (os_activity_scope_state_s *)(*(_QWORD *)(v1 + 40) + 24);
  swift_beginAccess();
  os_activity_scope_leave(v6);
  return swift_endAccess();
}

uint64_t OSTransaction.deinit()
{
  uint64_t v0;

  sub_23A349370();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t OSTransaction.__deallocating_deinit()
{
  sub_23A349370();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t static OSTransaction.named(_:block:)(char *a1, uint64_t a2, int a3, void (*a4)(uint64_t))
{
  uint64_t v8;

  swift_initStackObject();
  v8 = sub_23A34904C(a1, a2, a3);
  a4(v8);
  return swift_release();
}

{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_23A34904C(a1, a2, a3);
  a4(v8);
  return swift_release();
}

uint64_t type metadata accessor for OSTransaction()
{
  return objc_opt_self();
}

uint64_t method lookup function for OSTransaction()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_23A349600()
{
  unint64_t result;

  result = qword_25696C288[0];
  if (!qword_25696C288[0])
  {
    result = MEMORY[0x23B849AC0](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, qword_25696C288);
  }
  return result;
}

uint64_t sub_23A349644()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for SegmentLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SegmentLayout);
}

uint64_t getEnumTagSinglePayload for SegmentLayoutError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SegmentLayoutError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A349734 + 4 * byte_23A3643E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A349768 + 4 * byte_23A3643E0[v4]))();
}

uint64_t sub_23A349768(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A349770(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A349778);
  return result;
}

uint64_t sub_23A349784(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A34978CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A349790(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A349798(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A3497A4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SegmentLayoutError()
{
  return &type metadata for SegmentLayoutError;
}

unint64_t sub_23A3497C4()
{
  unint64_t result;

  result = qword_25696C310;
  if (!qword_25696C310)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364484, &type metadata for SegmentLayoutError);
    atomic_store(result, (unint64_t *)&qword_25696C310);
  }
  return result;
}

BOOL sub_23A349808(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B849A48](a1, v6, a5);
}

uint64_t static SegmentedDataRegion.from<A, B>(tuple:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(void);
  uint64_t inited;
  char *v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(void);
  void (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;

  v42 = a5;
  v43 = a6;
  v44 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v45 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v12 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v46 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v35 - v18;
  v20 = *(int *)(v17 + 48);
  v47 = v17;
  v21 = (char *)&v35 + v20 - v18;
  v38 = v21;
  v39 = *(_QWORD *)(a3 - 8);
  v22 = *(void (**)(void))(v39 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v22)((char *)&v35 - v18, a1, a3);
  v36 = v22;
  v41 = *(_QWORD *)(a4 - 8);
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
  v37(v21, a2, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C318);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A3644F0;
  v40 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
  v24 = v40;
  ((void (*)(char *, char *, uint64_t))v22)(v16, v19, a3);
  v25 = v38;
  v26 = (void (*)(char *, char *, uint64_t))v37;
  v37(v24, (uint64_t)v38, a4);
  v27 = v42;
  *(_QWORD *)(inited + 56) = a3;
  *(_QWORD *)(inited + 64) = v27;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  v29 = v39;
  (*(void (**)(uint64_t *, char *, uint64_t))(v39 + 32))(boxed_opaque_existential_1, v16, a3);
  v30 = &v46[*(int *)(v47 + 48)];
  v42 = v19;
  v36();
  v26(v30, v25, a4);
  v31 = v43;
  *(_QWORD *)(inited + 96) = a4;
  *(_QWORD *)(inited + 104) = v31;
  v32 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 72));
  v33 = v41;
  (*(void (**)(uint64_t *, char *, uint64_t))(v41 + 32))(v32, v30, a4);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v46, a3);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v40, a4);
  SegmentedDataRegion.init(representables:)(inited, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v42, v47);
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

uint64_t static SegmentedDataRegion.from<A, B, C>(tuple:)@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  uint64_t TupleTypeMetadata3;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t inited;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(void);
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;
  char *v40;
  uint64_t *boxed_opaque_existential_1;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  void (*v58)(char *, uint64_t);
  void (*v59)(char *, uint64_t);
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  void (*v73)(char *, uint64_t, uint64_t);
  char *v74;
  uint64_t v75;
  void (*v76)(void);
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;

  v68 = a8;
  v65 = a7;
  v67 = a3;
  v77 = a1;
  v71 = a9;
  v69 = a10;
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v70 = *(_QWORD *)(TupleTypeMetadata3 - 8);
  v15 = MEMORY[0x24BDAC7A8](TupleTypeMetadata3);
  v81 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v79 = (char *)&v61 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v61 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v61 - v23;
  v74 = (char *)&v61 + *(int *)(v22 + 48) - v23;
  v25 = v74;
  v72 = (char *)&v61 + *(int *)(v22 + 64) - v23;
  v26 = v72;
  v75 = a4;
  v80 = *(_QWORD *)(a4 - 8);
  v76 = *(void (**)(void))(v80 + 16);
  v82 = (char *)&v61 - v23;
  ((void (*)(char *, _QWORD, uint64_t))v76)((char *)&v61 - v23, v77, a4);
  v63 = *(_QWORD *)(a5 - 8);
  v73 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
  v27 = a2;
  v28 = a5;
  v62 = a5;
  v73(v25, v27, a5);
  v78 = a6;
  v66 = *(_QWORD *)(a6 - 8);
  v77 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v77(v26, v67, a6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C318);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A364500;
  v61 = (uint64_t *)(inited + 32);
  v67 = &v21[*(int *)(TupleTypeMetadata3 + 48)];
  v30 = v67;
  v64 = &v21[*(int *)(TupleTypeMetadata3 + 64)];
  v31 = v64;
  v32 = v75;
  v33 = v76;
  ((void (*)(char *, char *, uint64_t))v76)(v21, v24, v75);
  v34 = v30;
  v35 = v74;
  v36 = v28;
  v37 = (void (*)(char *, char *, uint64_t))v73;
  v73(v34, (uint64_t)v74, v36);
  v38 = v31;
  v39 = v72;
  v77(v38, v72, v78);
  v40 = v65;
  *(_QWORD *)(inited + 56) = v32;
  *(_QWORD *)(inited + 64) = v40;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v61);
  (*(void (**)(uint64_t *, char *, uint64_t))(v80 + 32))(boxed_opaque_existential_1, v21, v32);
  v61 = (uint64_t *)(inited + 72);
  v42 = &v79[*(int *)(TupleTypeMetadata3 + 48)];
  v65 = &v79[*(int *)(TupleTypeMetadata3 + 64)];
  v43 = v65;
  v33();
  v44 = v62;
  v37(v42, v35, v62);
  v45 = v39;
  v46 = v78;
  v47 = v77;
  v77(v43, v45, v78);
  v48 = v68;
  *(_QWORD *)(inited + 96) = v44;
  *(_QWORD *)(inited + 104) = v48;
  v49 = __swift_allocate_boxed_opaque_existential_1(v61);
  v50 = v63;
  (*(void (**)(uint64_t *, char *, uint64_t))(v63 + 32))(v49, v42, v44);
  v51 = &v81[*(int *)(TupleTypeMetadata3 + 48)];
  v68 = TupleTypeMetadata3;
  v52 = &v81[*(int *)(TupleTypeMetadata3 + 64)];
  v53 = v75;
  v76();
  v73(v51, (uint64_t)v74, v44);
  v47(v52, v72, v46);
  v54 = v69;
  *(_QWORD *)(inited + 136) = v46;
  *(_QWORD *)(inited + 144) = v54;
  v55 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 112));
  v56 = v66;
  (*(void (**)(uint64_t *, char *, uint64_t))(v66 + 32))(v55, v52, v46);
  v57 = *(void (**)(char *, uint64_t))(v50 + 8);
  v57(v51, v44);
  v58 = *(void (**)(char *, uint64_t))(v80 + 8);
  v58(v81, v53);
  v59 = *(void (**)(char *, uint64_t))(v56 + 8);
  v59(v65, v46);
  v58(v79, v53);
  v59(v64, v46);
  v57(v67, v44);
  SegmentedDataRegion.init(representables:)(inited, v71);
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v82, v68);
}

uint64_t static SegmentedDataRegion.from<A, B, C, D>(tuple:)@<X0>(void (*a1)(uint64_t *, char *, uint64_t)@<X0>, char *a2@<X1>, void (*a3)(char *, char *)@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, char *a10, char *a11, int *a12, uint64_t a13)
{
  int *TupleTypeMetadata;
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
  char *v26;
  char *v27;
  char *v28;
  uint64_t inited;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  void (*v35)(uint64_t *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v41;
  char *v42;
  char *v43;
  void (*v44)(void);
  uint64_t *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(uint64_t *, char *, uint64_t);
  int *v54;
  char *v55;
  uint64_t *v56;
  char *v57;
  uint64_t *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  int *v64;
  uint64_t *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  void (*v78)(uint64_t *, uint64_t);
  char *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(void);
  void (*v104)(char *, char *);
  uint64_t v105;
  void (*v106)(uint64_t *, char *, uint64_t);
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;

  v105 = a8;
  v107 = a7;
  v90 = a4;
  v104 = a3;
  v109 = a2;
  v106 = a1;
  v94 = a9;
  v92 = a13;
  v91 = a12;
  v86 = a11;
  v85 = a10;
  v112 = a5;
  v113 = a6;
  v114 = a7;
  v115 = a8;
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  v93 = *((_QWORD *)TupleTypeMetadata - 1);
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v100 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v98 = (char *)&v80 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v99 = (char *)&v80 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v80 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v116 = (char *)&v80 - v25;
  v111 = (char *)&v80 + TupleTypeMetadata[12] - v25;
  v26 = v111;
  v108 = (char *)&v80 + TupleTypeMetadata[16] - v25;
  v27 = v108;
  v28 = (char *)&v80 + TupleTypeMetadata[20] - v25;
  v102 = *(_QWORD *)(a5 - 8);
  v103 = *(void (**)(void))(v102 + 16);
  v103();
  v110 = a6;
  v101 = *(_QWORD *)(a6 - 8);
  v106 = *(void (**)(uint64_t *, char *, uint64_t))(v101 + 16);
  v106((uint64_t *)v26, v109, a6);
  v97 = *(_QWORD *)(v107 - 8);
  v109 = *(char **)(v97 + 16);
  ((void (*)(char *, _QWORD))v109)(v27, v104);
  v87 = *(_QWORD *)(v105 - 8);
  v104 = *(void (**)(char *, char *))(v87 + 16);
  v95 = v28;
  v104(v28, v90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C318);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A364510;
  v30 = TupleTypeMetadata[12];
  v84 = v24;
  v31 = &v24[v30];
  v90 = &v24[v30];
  v89 = &v24[TupleTypeMetadata[16]];
  v32 = v89;
  v88 = &v24[TupleTypeMetadata[20]];
  v33 = v88;
  ((void (*)(char *, char *, uint64_t))v103)(v24, v116, a5);
  v34 = v31;
  v35 = v106;
  v106((uint64_t *)v34, v111, v110);
  ((void (*)(char *, char *, uint64_t))v109)(v32, v108, v107);
  v36 = v28;
  v37 = v105;
  ((void (*)(char *, char *, uint64_t))v104)(v33, v36, v105);
  v38 = a5;
  v39 = v85;
  *(_QWORD *)(inited + 56) = a5;
  *(_QWORD *)(inited + 64) = v39;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v102 + 32))(boxed_opaque_existential_1, v84, a5);
  v83 = (uint64_t *)(inited + 72);
  v81 = (uint64_t *)&v99[TupleTypeMetadata[12]];
  v41 = v81;
  v85 = &v99[TupleTypeMetadata[16]];
  v42 = v85;
  v84 = &v99[TupleTypeMetadata[20]];
  v43 = v84;
  v96 = v38;
  v44 = v103;
  v103();
  v45 = v41;
  v46 = v110;
  v35(v45, v111, v110);
  v47 = v42;
  v48 = v108;
  v49 = v107;
  ((void (*)(char *, char *, uint64_t))v109)(v47, v108, v107);
  v50 = v43;
  v51 = v95;
  v52 = v37;
  v53 = (void (*)(uint64_t *, char *, uint64_t))v104;
  ((void (*)(char *, char *, uint64_t))v104)(v50, v95, v52);
  v54 = TupleTypeMetadata;
  v55 = v86;
  *(_QWORD *)(inited + 96) = v46;
  *(_QWORD *)(inited + 104) = v55;
  v56 = __swift_allocate_boxed_opaque_existential_1(v83);
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v101 + 32))(v56, v81, v46);
  v81 = (uint64_t *)(inited + 112);
  v57 = &v98[TupleTypeMetadata[12]];
  v86 = v57;
  v80 = &v98[v54[16]];
  v83 = (uint64_t *)&v98[v54[20]];
  v58 = v83;
  v44();
  v59 = v57;
  v60 = v110;
  v106((uint64_t *)v59, v111, v110);
  v61 = v80;
  ((void (*)(char *, char *, uint64_t))v109)(v80, v48, v49);
  v62 = v51;
  v63 = v105;
  v53(v58, v62, v105);
  v64 = v91;
  *(_QWORD *)(inited + 136) = v49;
  *(_QWORD *)(inited + 144) = v64;
  v65 = __swift_allocate_boxed_opaque_existential_1(v81);
  (*(void (**)(uint64_t *, char *, uint64_t))(v97 + 32))(v65, v61, v49);
  v66 = &v100[v54[12]];
  v67 = &v100[v54[16]];
  v91 = v54;
  v68 = &v100[v54[20]];
  v69 = v96;
  v103();
  v106((uint64_t *)v66, v111, v60);
  ((void (*)(char *, char *, uint64_t))v109)(v67, v108, v49);
  ((void (*)(char *, char *, uint64_t))v104)(v68, v95, v63);
  v82 = inited;
  v70 = v63;
  v71 = v92;
  *(_QWORD *)(inited + 176) = v63;
  *(_QWORD *)(inited + 184) = v71;
  v72 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 152));
  v73 = v87;
  (*(void (**)(uint64_t *, char *, uint64_t))(v87 + 32))(v72, v68, v70);
  v74 = *(void (**)(char *, uint64_t))(v97 + 8);
  v74(v67, v49);
  v75 = *(void (**)(char *, uint64_t))(v101 + 8);
  v76 = v110;
  v75(v66, v110);
  v77 = *(void (**)(char *, uint64_t))(v102 + 8);
  v77(v100, v69);
  v78 = *(void (**)(uint64_t *, uint64_t))(v73 + 8);
  v78(v83, v70);
  v75(v86, v76);
  v77(v98, v69);
  v78((uint64_t *)v84, v70);
  v74(v85, v49);
  v77(v99, v69);
  v78((uint64_t *)v88, v70);
  v74(v89, v49);
  v75(v90, v76);
  SegmentedDataRegion.init(representables:)(v82, v94);
  return (*(uint64_t (**)(char *, int *))(v93 + 8))(v116, v91);
}

uint64_t SegmentedDataRegion.toTuple<A, B>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t *v5;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t TupleTypeMetadata2;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;

  v34 = a4;
  v35 = a3;
  v36 = a5;
  v32 = sub_23A362DC0();
  v30 = *(_QWORD *)(v32 - 8);
  v8 = MEMORY[0x24BDAC7A8](v32);
  v10 = (char *)&v30 - v9;
  v33 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v31 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A362DC0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v30 - v15;
  v17 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *v5;
  v37 = *v5;
  SegmentedDataRegion.subscript.getter(0, a1, v35, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
LABEL_5:
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v36, 1, 1, TupleTypeMetadata2);
  }
  v21 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  v21(v19, v16, a1);
  v37 = v20;
  SegmentedDataRegion.subscript.getter(1, a2, v34, (uint64_t)v10);
  v22 = v33;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v10, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a1);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v32);
    goto LABEL_5;
  }
  v25 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v26 = v31;
  v25(v31, v10, a2);
  v27 = swift_getTupleTypeMetadata2();
  v28 = v36;
  v29 = &v36[*(int *)(v27 + 48)];
  v21(v36, v19, a1);
  v25(v29, v26, a2);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v28, 0, 1, v27);
}

uint64_t SegmentedDataRegion.toTuple<A, B, C>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(char *, char *, uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t *v7;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t TupleTypeMetadata3;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  uint64_t v55;
  uint64_t v56;

  v49 = a6;
  v51 = a5;
  v53 = a4;
  v54 = a7;
  v11 = sub_23A362DC0();
  v42 = *(_QWORD *)(v11 - 8);
  v43 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v50 = (uint64_t)&v41 - v13;
  v55 = a3;
  v48 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v44 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A362DC0();
  v45 = *(_QWORD *)(v15 - 8);
  v46 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v41 - v17;
  v52 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v47 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23A362DC0();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v41 - v23;
  v25 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v41 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *v7;
  v56 = *v7;
  SegmentedDataRegion.subscript.getter(0, a1, (uint64_t)v53, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v24, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  else
  {
    v29 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v29(v27, v24, a1);
    v56 = v28;
    SegmentedDataRegion.subscript.getter(1, a2, v51, (uint64_t)v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v18, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a1);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v46);
    }
    else
    {
      v32 = v47;
      v53 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
      v53(v47, v18, a2);
      v56 = v28;
      v33 = v50;
      v34 = v55;
      SegmentedDataRegion.subscript.getter(2, v55, v49, v50);
      v35 = v48;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v33, 1, v34) != 1)
      {
        v52 = *(_QWORD *)(v35 + 32);
        v36 = v44;
        ((void (*)(char *, uint64_t, uint64_t))v52)(v44, v33, v34);
        TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
        v38 = v54;
        v39 = &v54[*(int *)(TupleTypeMetadata3 + 48)];
        v40 = &v54[*(int *)(TupleTypeMetadata3 + 64)];
        v29(v54, v27, a1);
        v53(v39, v32, a2);
        ((void (*)(char *, char *, uint64_t))v52)(v40, v36, v55);
        return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata3 - 8) + 56))(v38, 0, 1, TupleTypeMetadata3);
      }
      (*(void (**)(char *, uint64_t))(v52 + 8))(v32, a2);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, a1);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v33, v43);
    }
  }
  v30 = swift_getTupleTypeMetadata3();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v54, 1, 1, v30);
}

uint64_t SegmentedDataRegion.toTuple<A, B, C, D>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(char *, uint64_t, uint64_t)@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  uint64_t *v9;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  int *TupleTypeMetadata;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v63 = a8;
  v70 = a7;
  v73 = (char *)a6;
  v75 = (char *)a5;
  v77 = a9;
  v59 = sub_23A362DC0();
  v58 = *(_QWORD *)(v59 - 8);
  v14 = MEMORY[0x24BDAC7A8](v59);
  v64 = (uint64_t)&v58 - v15;
  v78 = a4;
  v62 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v65 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23A362DC0();
  v60 = *(_QWORD *)(v61 - 8);
  v17 = MEMORY[0x24BDAC7A8](v61);
  v68 = (uint64_t)&v58 - v18;
  v76 = a3;
  v69 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v71 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23A362DC0();
  v66 = *(_QWORD *)(v20 - 8);
  v67 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v58 - v22;
  v74 = a2;
  v24 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v72 = (char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23A362DC0();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v58 - v29;
  v31 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v58 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = *v9;
  v79 = *v9;
  SegmentedDataRegion.subscript.getter(0, a1, (uint64_t)v75, (uint64_t)v30);
  v35 = v31;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v30, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    v36 = v78;
    v37 = v76;
    v38 = v74;
  }
  else
  {
    v39 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    v39(v33, v30, a1);
    v40 = v34;
    v79 = v34;
    v38 = v74;
    SegmentedDataRegion.subscript.getter(1, v74, (uint64_t)v73, (uint64_t)v23);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v23, 1, v38) == 1)
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v33, a1);
      (*(void (**)(char *, uint64_t))(v66 + 8))(v23, v67);
      v36 = v78;
      v37 = v76;
    }
    else
    {
      v73 = (char *)v35;
      v75 = v33;
      v41 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
      v42 = v72;
      v41(v72, v23, v38);
      v79 = v40;
      v43 = v68;
      v37 = v76;
      SegmentedDataRegion.subscript.getter(2, v76, (uint64_t)v70, v68);
      v44 = v43;
      v45 = v69;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v44, 1, v37) == 1)
      {
        (*(void (**)(char *, uint64_t))(v24 + 8))(v42, v38);
        (*((void (**)(char *, uint64_t))v73 + 1))(v75, a1);
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v44, v61);
        v36 = v78;
      }
      else
      {
        v70 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 32);
        v70(v71, v44, v37);
        v79 = v40;
        v46 = v64;
        v47 = v45;
        v36 = v78;
        SegmentedDataRegion.subscript.getter(3, v78, v63, v64);
        v48 = v62;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v46, 1, v36) != 1)
        {
          v51 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
          v51(v65, v46, v36);
          v52 = a1;
          v79 = a1;
          v80 = v38;
          v81 = v37;
          v82 = v36;
          TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
          v54 = v77;
          v55 = &v77[TupleTypeMetadata[12]];
          v56 = v37;
          v57 = &v77[TupleTypeMetadata[16]];
          v73 = &v77[TupleTypeMetadata[20]];
          v39(v77, v75, v52);
          v41(v55, v72, v38);
          v70(v57, (uint64_t)v71, v56);
          v51(v73, (uint64_t)v65, v78);
          return (*(uint64_t (**)(char *, _QWORD, uint64_t, int *))(*((_QWORD *)TupleTypeMetadata - 1) + 56))(v54, 0, 1, TupleTypeMetadata);
        }
        (*(void (**)(char *, uint64_t))(v47 + 8))(v71, v37);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v72, v38);
        (*((void (**)(char *, uint64_t))v73 + 1))(v75, a1);
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v46, v59);
      }
    }
  }
  v79 = a1;
  v80 = v38;
  v81 = v37;
  v82 = v36;
  v49 = swift_getTupleTypeMetadata();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v77, 1, 1, v49);
}

Swift::Void __swiftcall OSActivity.close()()
{
  uint64_t v0;

  swift_beginAccess();
  os_activity_scope_leave((os_activity_scope_state_t)(v0 + 24));
  swift_endAccess();
}

uint64_t sub_23A34B334(char *a1, uint64_t a2, char a3)
{
  int v3;
  uint64_t v4;
  NSObject *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  char description[8];

  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  if ((a3 & 1) != 0)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    v8 = a1 >> 11;
    if (a1 >> 11 == 27)
    {
      __break(1u);
    }
    else
    {
      v8 = a1 >> 16;
      if (a1 >> 16 > 0x10)
      {
        __break(1u);
      }
      else if ((a1 & 0xFFFFFF80) == 0)
      {
        if (a1 > 0xFF)
        {
          __break(1u);
          goto LABEL_21;
        }
        v9 = ((_BYTE)a1 + 1);
LABEL_11:
        *(_QWORD *)description = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v9) & 0x38)) & 0x38));
        if (qword_25696BD50 == -1)
        {
LABEL_12:
          v6 = qword_25696C320;
          v7 = description;
          goto LABEL_13;
        }
LABEL_21:
        swift_once();
        goto LABEL_12;
      }
      v3 = (a1 & 0x3F) << 8;
      if (a1 < 0x800)
      {
        v9 = (v3 | (a1 >> 6)) + 33217;
        goto LABEL_11;
      }
    }
    v12 = (v3 | (a1 >> 6) & 0x3F) << 8;
    v13 = (((v12 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    v14 = (v12 | (a1 >> 12)) + 8487393;
    if (v8)
      v9 = v13;
    else
      v9 = v14;
    goto LABEL_11;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (qword_25696BD50 != -1)
LABEL_16:
    swift_once();
  v6 = qword_25696C320;
  v7 = a1;
LABEL_13:
  *(_QWORD *)(v4 + 16) = _os_activity_create(&dword_23A331000, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  swift_beginAccess();
  v10 = swift_unknownObjectRetain();
  os_activity_scope_enter(v10, (os_activity_scope_state_t)(v4 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_23A34B518()
{
  qword_25696C320 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t OSActivity.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t OSActivity.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OSActivity()
{
  return objc_opt_self();
}

uint64_t method lookup function for OSActivity()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23A34B5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_23A34B5C4()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    type metadata accessor for FirstUnlockObserver();
    sub_23A34C328();
    sub_23A362D0C();
    return swift_task_switch();
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A34B668()
{
  sub_23A34B858();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23A34B6AC()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A34B6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A34C4B4(a1, (uint64_t)v8);
  v9 = sub_23A362D30();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23A34C474((uint64_t)v8);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_23A362D0C();
      v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23A362D24();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v11 = 0;
  v13 = 0;
LABEL_6:
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C358);
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_23A34B858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C230);
  v2 = *(_QWORD *)(v1 - 8);
  result = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    *(_BYTE *)(v0 + 48) = 1;
    if (qword_25696BD18 != -1)
      swift_once();
    v6 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v6, (uint64_t)qword_25696E8D0);
    sub_23A33E2D4(0xD000000000000016, 0x800000023A3666C0, 0xD000000000000058, 0x800000023A3666E0, 0x5574737269466E6FLL, 0xEF29286B636F6C6ELL);
    v7 = *(_QWORD *)(v0 + 32);
    if (v7)
    {
      v8 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v7 + 56) + 136);
      swift_retain();
      v9 = swift_retain();
      atomic_store(1u, (unsigned __int8 *)v8(v9));
      swift_release();
      swift_beginAccess();
      notify_cancel(*(_DWORD *)(v7 + 48));
      swift_release();
    }
    *(_QWORD *)(v0 + 32) = 0;
    swift_release();
    v10 = *(_QWORD *)(v0 + 40);
    if (v10)
    {
      v11 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v10 + 56) + 136);
      swift_retain();
      v12 = swift_retain();
      atomic_store(1u, (unsigned __int8 *)v11(v12));
      swift_release();
      swift_beginAccess();
      notify_cancel(*(_DWORD *)(v10 + 48));
      swift_release();
    }
    *(_QWORD *)(v0 + 40) = 0;
    swift_release();
    swift_beginAccess();
    v13 = *(_QWORD *)(v0 + 24);
    v14 = *(_QWORD *)(v13 + 16);
    if (v14)
    {
      v15 = v13 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      v16 = *(_QWORD *)(v2 + 72);
      v17 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
      swift_bridgeObjectRetain();
      do
      {
        v17(v5, v15, v1);
        sub_23A362D18();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
        v15 += v16;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    *(_QWORD *)(v0 + 24) = MEMORY[0x24BEE4AF8];
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23A34BAFC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;

  if (!v0[4])
  {
    v1 = v0;
    if (!v0[5])
    {
      v2 = (void *)v0[2];
      v3 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for DarwinNotificationObserver();
      swift_allocObject();
      v4 = v2;
      v1[4] = sub_23A350AC4(0xD000000000000025, 0x800000023A366660, v4, (uint64_t)sub_23A34C398, v3);
      swift_release();
      v5 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for DeviceLockStateNotificationObserver();
      swift_allocObject();
      v6 = (_QWORD *)swift_allocObject();
      v6[2] = v4;
      v6[3] = sub_23A34C3A4;
      v6[4] = v5;
      v7 = v4;
      swift_retain();
      v8 = sub_23A350AC4(0xD000000000000024, 0x800000023A366690, v7, (uint64_t)sub_23A34C3D8, (uint64_t)v6);
      swift_release();
      v1[5] = v8;
      swift_release();
    }
  }
}

uint64_t sub_23A34BC90()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D1140 != -1)
    swift_once();
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
  v4 = swift_retain();
  LOBYTE(v3) = *(_BYTE *)v3(v4);
  swift_release();
  if ((v3 & 1) == 0)
  {
    result = MKBDeviceUnlockedSinceBoot();
    if ((_DWORD)result != 1)
      return result;
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
    v7 = swift_retain();
    *(_BYTE *)v6(v7) = 1;
    swift_release();
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = sub_23A362D30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 1, 1, v8);
    v9 = swift_allocObject();
    swift_weakInit();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v9;
    sub_23A34B6C8((uint64_t)v2, (uint64_t)&unk_25696C360, (uint64_t)v10);
    swift_release();
    sub_23A34C474((uint64_t)v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A34BE38(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  if ((result & 1) != 0)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v8 = sub_23A362D30();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
      v9 = swift_allocObject();
      swift_weakInit();
      v10 = (_QWORD *)swift_allocObject();
      v10[2] = 0;
      v10[3] = 0;
      v10[4] = v9;
      sub_23A34B6C8((uint64_t)v4, (uint64_t)&unk_25696C340, (uint64_t)v10);
      swift_release();
      sub_23A34C474((uint64_t)v4);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_23A34BF84()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  type metadata accessor for FirstUnlockObserver();
  v1[3] = sub_23A34C328();
  v1[4] = sub_23A362D0C();
  v1[5] = v2;
  return swift_task_switch();
}

uint64_t sub_23A34BFE0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  _QWORD *v6;

  if (qword_2542D1140 != -1)
    swift_once();
  v1 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
  v2 = swift_retain();
  LOBYTE(v1) = *(_BYTE *)v1(v2);
  swift_release();
  if ((v1 & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
    v4 = swift_retain();
    *(_BYTE *)v3(v4) = 1;
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_23A34BAFC();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v6;
  *v6 = v0;
  v6[1] = sub_23A34C118;
  return sub_23A362ED4();
}

uint64_t sub_23A34C118()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A34C164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t *v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C230);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (unint64_t *)(a2 + 24);
  swift_beginAccess();
  v9 = *(_QWORD *)(a2 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 24) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_23A35F610(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    *v8 = v9;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    v9 = sub_23A35F610(v11 > 1, v12 + 1, 1, v9);
    *v8 = v9;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t sub_23A34C2AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FirstUnlockObserver()
{
  return objc_opt_self();
}

uint64_t sub_23A34C308()
{
  return sub_23A362D90();
}

unint64_t sub_23A34C328()
{
  unint64_t result;
  uint64_t UnlockObserver;

  result = qword_25696C330;
  if (!qword_25696C330)
  {
    UnlockObserver = type metadata accessor for FirstUnlockObserver();
    result = MEMORY[0x23B849AC0](&unk_23A3645B4, UnlockObserver);
    atomic_store(result, &qword_25696C330);
  }
  return result;
}

uint64_t sub_23A34C36C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A34C164(a1, v1);
}

uint64_t sub_23A34C374()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A34C398()
{
  return sub_23A34BC90();
}

uint64_t sub_23A34C3A4(_QWORD *a1)
{
  return sub_23A34BE38(a1);
}

uint64_t sub_23A34C3AC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A34C3D8(int a1, char a2)
{
  uint64_t *v2;

  return sub_23A33D9FC(a1, a2 & 1, v2[2], v2[3], v2[4]);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23A34C410(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A337A40;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_23A34C474(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A34C4B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A34C4FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_23A34C564;
  return v5(v2 + 32);
}

uint64_t sub_23A34C564()
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

uint64_t sub_23A34C5B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A34C5D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A3371B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25696C348 + dword_25696C348))(a1, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A34C678(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A3371B0;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_23A34C6DC()
{
  return 0x53746E656D676573;
}

uint64_t sub_23A34C6FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x53746E656D676573 && a2 == 0xEB00000000657A69)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A362EE0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A34C7A8()
{
  return 0;
}

void sub_23A34C7B4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A34C7C0()
{
  sub_23A34CC74();
  return sub_23A362F88();
}

uint64_t sub_23A34C7E8()
{
  sub_23A34CC74();
  return sub_23A362F94();
}

uint64_t sub_23A34C810@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C370);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A34CC74();
  sub_23A362F70();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v9 = sub_23A362EA4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  return result;
}

uint64_t sub_23A34C920(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696C380);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A34CC74();
  sub_23A362F7C();
  sub_23A362EB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23A34CA08()
{
  uint64_t v0;

  sub_23A362940();
  swift_allocObject();
  sub_23A362934();
  sub_23A33D830();
  v0 = sub_23A362928();
  swift_release();
  return v0;
}

uint64_t sub_23A34CA98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int v4;

  sub_23A36291C();
  swift_allocObject();
  sub_23A362910();
  sub_23A33D874();
  sub_23A362904();
  result = swift_release();
  if (!v1)
  {
    *(_DWORD *)a1 = v4;
    *(_BYTE *)(a1 + 4) = 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamConfigurationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A34CB9C + 4 * byte_23A3645E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A34CBD0 + 4 * byte_23A3645E0[v4]))();
}

uint64_t sub_23A34CBD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A34CBD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A34CBE0);
  return result;
}

uint64_t sub_23A34CBEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A34CBF4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A34CBF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A34CC00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamConfigurationError()
{
  return &type metadata for DataFrameStreamConfigurationError;
}

ValueMetadata *type metadata accessor for DataFrameStreamConfiguration()
{
  return &type metadata for DataFrameStreamConfiguration;
}

unint64_t sub_23A34CC30()
{
  unint64_t result;

  result = qword_25696C368;
  if (!qword_25696C368)
  {
    result = MEMORY[0x23B849AC0](&unk_23A3646A0, &type metadata for DataFrameStreamConfigurationError);
    atomic_store(result, (unint64_t *)&qword_25696C368);
  }
  return result;
}

unint64_t sub_23A34CC74()
{
  unint64_t result;

  result = qword_25696C378;
  if (!qword_25696C378)
  {
    result = MEMORY[0x23B849AC0](&unk_23A36481C, &type metadata for DataFrameStreamConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696C378);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamConfiguration.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A34CCF8 + 4 * byte_23A3645EA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A34CD18 + 4 * byte_23A3645EF[v4]))();
}

_BYTE *sub_23A34CCF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A34CD18(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A34CD20(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A34CD28(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A34CD30(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A34CD38(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamConfiguration.CodingKeys()
{
  return &type metadata for DataFrameStreamConfiguration.CodingKeys;
}

unint64_t sub_23A34CD58()
{
  unint64_t result;

  result = qword_25696C388;
  if (!qword_25696C388)
  {
    result = MEMORY[0x23B849AC0](&unk_23A3647F4, &type metadata for DataFrameStreamConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696C388);
  }
  return result;
}

unint64_t sub_23A34CDA0()
{
  unint64_t result;

  result = qword_25696C390;
  if (!qword_25696C390)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364764, &type metadata for DataFrameStreamConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696C390);
  }
  return result;
}

unint64_t sub_23A34CDE8()
{
  unint64_t result;

  result = qword_25696C398;
  if (!qword_25696C398)
  {
    result = MEMORY[0x23B849AC0](&unk_23A36478C, &type metadata for DataFrameStreamConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696C398);
  }
  return result;
}

uint64_t DataFrameStreamSegment.identifierSeed.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16) + 24);
}

uint64_t DataFrameStreamSegment.writtenFrameCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16) + 16);
}

unint64_t DataFrameStreamSegment.identifierSeed.setter(unint64_t result)
{
  uint64_t v1;

  atomic_store(result, (unint64_t *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16) + 24));
  return result;
}

uint64_t DataFrameStreamSegment.init(name:filePath:byteSize:access:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v25 = a1;
  v12 = sub_23A362A3C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0x41)
  {
    sub_23A34855C();
    swift_allocError();
    *v22 = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    goto LABEL_5;
  }
  v16 = *a5;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
  v26 = v16;
  type metadata accessor for MemoryMappedRegion();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v17 = MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)((uint64_t)v15, a4, 1088, &v26);
  if (v6)
  {
LABEL_5:
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v18 = v17;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  v19 = *(_QWORD *)(v18 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C3A0);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v19;
  type metadata accessor for SegmentOffsetTable();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v18;
  swift_retain();
  *(_QWORD *)a6 = v25;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = v18;
  *(_QWORD *)(a6 + 24) = v20;
  *(_QWORD *)(a6 + 32) = v21;
  *(_DWORD *)(a6 + 40) = a4;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void DataFrameStreamSegment.append(data:compressed:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X14 }
}

uint64_t sub_23A34D0D4()
{
  unsigned int v0;
  uint64_t v2;
  _BYTE *v3;

  if (v0 < 0x40)
  {
    __break(1u);
    JUMPOUT(0x23A34D3D0);
  }
  if (BYTE6(v2) <= (uint64_t)(v0 - 64))
    __asm { BR              X15 }
  sub_23A348788();
  swift_allocError();
  *v3 = 3;
  return swift_willThrow();
}

uint64_t DataFrameStreamSegment.iterate(reversed:each:)(uint64_t result, uint64_t (*a2)(unint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v31;

  v4 = *(_QWORD *)(v2 + 24);
  v5 = *(_QWORD *)(v2 + 32);
  v6 = *(_QWORD *)(v4 + 16);
  v31 = *(_QWORD *)(v6 + 24);
  v7 = *(_DWORD *)(v6 + 16);
  if (v7)
  {
    if ((result & 1) != 0)
    {
      v8 = v7 - 1;
      do
      {
        if (v8 >= *(_DWORD *)(*(_QWORD *)(v4 + 16) + 16))
          goto LABEL_8;
        v9 = 8 * v8 + 8;
        v10 = *(_QWORD *)(v5 + 16);
        v11 = *(_QWORD *)(v10 + 32);
        v12 = __OFSUB__(v11, v9);
        v13 = v11 - v9;
        if (v12)
          goto LABEL_27;
        v14 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v10 + 16) + v13 + 4));
        if (v14 == 2 && (result = DataFrameStreamSegment.frameData(forSegmentIndex:)((_QWORD *)v8), v15 >> 60 != 15))
        {
          v17 = v15;
          if (__CFADD__(v31, v8))
            goto LABEL_28;
          v18 = result;
          v19 = a2(v8, v31 + v8, result, v15);
          result = sub_23A33A628(v18, v17);
          if (v3 || (((_DWORD)v8 != 0) & v19) == 0)
            return result;
        }
        else
        {
LABEL_8:
          if (!(_DWORD)v8)
            return result;
        }
        v16 = v7 >= v8;
        v8 = (v8 - 1);
      }
      while (v16);
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
    }
    else if (*(_DWORD *)(v6 + 16))
    {
      v20 = 0;
      v21 = 8;
      do
      {
        if ((unint64_t)v20 < *(unsigned int *)(*(_QWORD *)(v4 + 16) + 16))
        {
          v22 = *(_QWORD *)(v5 + 16);
          v23 = *(_QWORD *)(v22 + 32);
          v12 = __OFSUB__(v23, v21);
          v24 = v23 - v21;
          if (v12)
            goto LABEL_26;
          v25 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v22 + 16) + v24 + 4));
          if (v25 == 2)
          {
            result = DataFrameStreamSegment.frameData(forSegmentIndex:)(v20);
            if (v26 >> 60 != 15)
            {
              v27 = v26;
              if (__CFADD__(v31, v20))
                goto LABEL_29;
              v28 = result;
              v29 = a2((unint64_t)v20, (uint64_t)v20 + v31, result, v26);
              result = sub_23A33A628(v28, v27);
              if (v3 || (v29 & 1) == 0)
                break;
            }
          }
        }
        v20 = (_QWORD *)((char *)v20 + 1);
        v21 += 8;
      }
      while ((unint64_t)v20 < *(unsigned int *)(v6 + 16));
    }
  }
  return result;
}

Swift::Bool __swiftcall DataFrameStreamSegment.deleteFrame(index:)(Swift::UInt32 index)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  BOOL v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unsigned int *v35;
  unsigned int v36;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[5];
  int v44;
  int v45;

  v2 = *(_QWORD *)&index;
  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)v1;
  v7 = *(_QWORD *)(v1 + 8);
  v9 = *(_QWORD **)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v10 = *(_QWORD *)(v1 + 32);
  v11 = *(_DWORD *)(v1 + 40);
  if (*(_DWORD *)(*(_QWORD *)(v8 + 16) + 16) <= v2)
    goto LABEL_26;
  v12 = 8 * v2 + 8;
  v13 = *(_QWORD *)(v10 + 16);
  v14 = *(_QWORD *)(v13 + 32);
  v15 = __OFSUB__(v14, v12);
  v16 = v14 - v12;
  if (v15)
  {
    __break(1u);
    goto LABEL_36;
  }
  v17 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v13 + 16) + v16 + 4));
  if (v17 > 5)
  {
LABEL_26:
    if (qword_2542D0118 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v39, (uint64_t)v5);
    v43[0] = 0;
    v43[1] = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v40 = "Unknown frame index: ";
    v41 = 0xD000000000000015;
    goto LABEL_29;
  }
  v18 = 1 << v17;
  if ((v18 & 0x26) == 0)
  {
    if ((v18 & 0x18) != 0)
    {
      if (qword_2542D0118 == -1)
      {
LABEL_25:
        v38 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
        sub_23A3363A8(v38, (uint64_t)v5);
        v43[0] = 0;
        v43[1] = 0xE000000000000000;
        sub_23A362E2C();
        swift_bridgeObjectRelease();
        strcpy((char *)v43, "Frame index: ");
        HIWORD(v43[1]) = -4864;
        v45 = v2;
        sub_23A362EC8();
        sub_23A362C58();
        swift_bridgeObjectRelease();
        sub_23A362C58();
        sub_23A33E2D4(v43[0], v43[1], 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000013, 0x800000023A3667E0);
        swift_bridgeObjectRelease();
        sub_23A336434((uint64_t)v5);
        return 1;
      }
LABEL_37:
      swift_once();
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v19 = *(_QWORD *)(v10 + 16);
  v20 = *(_QWORD *)(v19 + 32);
  v15 = __OFSUB__(v20, v12);
  v21 = v20 - v12;
  if (v15)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v22 = (unsigned __int8 *)(*(_QWORD *)(v19 + 16) + v21 + 4);
  do
    __ldaxr(v22);
  while (__stlxr(3u, v22));
  v43[0] = v6;
  v43[1] = v7;
  v43[2] = (uint64_t)v9;
  v43[3] = v8;
  v43[4] = v10;
  v44 = v11;
  v23 = sub_23A34ED98(v2);
  if ((v25 & 1) != 0)
  {
    if (qword_2542D0118 == -1)
    {
LABEL_32:
      v42 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v42, (uint64_t)v5);
      v43[0] = 0;
      v43[1] = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v40 = "unable to retrieve data region for ";
      v41 = 0xD000000000000023;
LABEL_29:
      v43[0] = v41;
      v43[1] = (unint64_t)(v40 - 32) | 0x8000000000000000;
      v45 = v2;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v43[0], v43[1], 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000013, 0x800000023A3667E0);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v5);
      return 0;
    }
LABEL_39:
    swift_once();
    goto LABEL_32;
  }
  v26 = v24;
  v27 = v24 < v23;
  v28 = v24 - v23;
  if (v27)
  {
    __break(1u);
    goto LABEL_39;
  }
  v29 = v9[3];
  if (v23 < v29 || (v30 = v9[4], v23 > v30) || v26 < v29 || v30 < v26)
  {
    if (qword_2542D0118 == -1)
    {
LABEL_34:
      __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
      sub_23A33E2E0(0xD000000000000027, 0x800000023A366830, 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000013, 0x800000023A3667E0);
      return 0;
    }
LABEL_42:
    swift_once();
    goto LABEL_34;
  }
  if ((v28 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v26 != v23)
    bzero((void *)(v9[2] + v23), v28);
  v31 = *(_QWORD *)(v10 + 16);
  v32 = *(_QWORD *)(v31 + 32);
  v15 = __OFSUB__(v32, v12);
  v33 = v32 - v12;
  if (v15)
    goto LABEL_41;
  v34 = (unsigned __int8 *)(*(_QWORD *)(v31 + 16) + v33 + 4);
  do
    __ldaxr(v34);
  while (__stlxr(4u, v34));
  v35 = (unsigned int *)(*(_QWORD *)(v8 + 16) + 20);
  do
    v36 = __ldaxr(v35);
  while (__stlxr(v36 + 1, v35));
  return 1;
}

uint64_t sub_23A34DC18(unint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;

  v4 = type metadata accessor for InternalLogger();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)v1;
  v9 = *(_QWORD *)(v1 + 8);
  v11 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v12 = *(_QWORD *)(v1 + 32);
  v13 = *(_DWORD *)(v1 + 40);
  v14 = *(_QWORD *)(v10 + 16);
  v15 = *(_QWORD *)(v14 + 24);
  v16 = *(unsigned int *)(v14 + 16);
  v17 = v15 + v16;
  if (__CFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v17 < v15)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v2 = (_QWORD *)(a1 - v15);
  if (a1 < v15)
    return 0;
  if (v17 <= a1)
    return 1;
  v18 = (a1 - v15);
  v19 = 8 * v2 + 8;
  v20 = *(_QWORD *)(v12 + 16);
  v21 = *(_QWORD *)(v20 + 32);
  v22 = __OFSUB__(v21, v19);
  v23 = v21 - v19;
  if (v22)
    goto LABEL_25;
  v24 = atomic_load((unsigned __int8 *)(*(_QWORD *)(v20 + 16) + v23 + 4));
  if ((v24 - 1) < 2)
    return v18;
  if ((v24 - 3) < 2)
    return 2;
  if (v24 != 5)
  {
    if (qword_2542D0118 == -1)
    {
LABEL_19:
      v27 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v27, (uint64_t)v7);
      v32 = 0;
      v33 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v32 = 0xD000000000000022;
      v33 = 0x800000023A3669A0;
      v38 = (int)v2;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v32, v33, 0xD000000000000069, 0x800000023A3661A0, 0xD00000000000001BLL, 0x800000023A3669D0);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v7);
      return 3;
    }
LABEL_26:
    v29 = v5;
    swift_once();
    v5 = v29;
    goto LABEL_19;
  }
  v31 = *(_QWORD *)v1;
  v32 = v8;
  v25 = v9;
  v33 = v9;
  v34 = v11;
  v35 = v10;
  v36 = v12;
  v37 = v13;
  v26 = sub_23A34EE18(v2);
  if (!v26)
    return 2;
  v18 = *(_QWORD *)(*(_QWORD *)(v26[4] + 16) + 16);
  if (!v18)
  {
    swift_release();
    return 2;
  }
  if (v18 < v15 || v18 >= v17)
  {
    swift_release();
  }
  else
  {
    v32 = v31;
    v33 = v25;
    v34 = v11;
    v35 = v10;
    v36 = v12;
    v37 = v13;
    v18 = sub_23A34DC18(v18);
    swift_release();
  }
  return v18;
}

uint64_t DataFrameStreamSegment.frameData(forSegmentIndex:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  _DWORD v17[4];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int v21;

  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_DWORD *)(v1 + 40);
  v18 = *(_QWORD *)v1;
  v19 = *(_OWORD *)(v1 + 8);
  v20 = *(_OWORD *)(v1 + 24);
  v21 = v6;
  v7 = sub_23A34EE18(a1);
  if (v7)
  {
    v8 = v7[4];
    v9 = *(_QWORD *)(v8 + 16);
    if (*(_BYTE *)(v9 + 8))
    {
      v10 = 1023;
      while (*(_BYTE *)(v9 + 8))
      {
        if (!--v10)
        {
          if (qword_2542D0118 != -1)
            swift_once();
          __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
          sub_23A33E2E0(0xD000000000000025, 0x800000023A3668A0, 0xD000000000000062, 0x800000023A3668D0, 0xD000000000000019, 0x800000023A366940);
          swift_release();
          return 0;
        }
      }
    }
    v11 = (unsigned __int8 *)(v9 + 9);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
    v13 = sub_23A34FCA8((_BYTE *)v7[3], *(unsigned int *)(*(_QWORD *)(v8 + 16) + 4));
    do
      v14 = __ldxr(v11);
    while (__stxr(v14 - 1, v11));
    swift_release();
  }
  else
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v15, (uint64_t)v5);
    v18 = 0;
    *(_QWORD *)&v19 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v18 = 0xD000000000000023;
    *(_QWORD *)&v19 = 0x800000023A366800;
    v17[3] = (_DWORD)a1;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v18, v19, 0xD000000000000069, 0x800000023A3661A0, 0xD00000000000001BLL, 0x800000023A366880);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v5);
    return 0;
  }
  return v13;
}

uint64_t sub_23A34E1A8@<X0>(unsigned int a1@<W0>, void (*a2)(void)@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v11;
  __int128 v12;
  unsigned int v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  _BYTE v28[28];

  v6 = v5;
  v11 = *(__int128 *)((char *)a4 + 28);
  v12 = a4[1];
  v27 = *a4;
  *(_OWORD *)v28 = v12;
  *(_OWORD *)&v28[12] = v11;
  v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v28[8] + 16) + 16);
  result = swift_retain();
  if (v13 <= a1)
    goto LABEL_8;
  v15 = 8 * a1 + 8;
  v16 = *(_QWORD *)(*(_QWORD *)&v28[16] + 16);
  v17 = *(_QWORD *)(v16 + 32);
  v18 = __OFSUB__(v17, v15);
  v19 = v17 - v15;
  if (v18)
  {
    __break(1u);
    return result;
  }
  v20 = *(unsigned int *)(*(_QWORD *)(v16 + 16) + v19);
  type metadata accessor for DataFrameReader();
  swift_allocObject();
  v21 = (_QWORD *)swift_retain();
  v22 = sub_23A33A650(v21, v20);
  if (!v22)
  {
LABEL_8:
    result = swift_release_n();
LABEL_9:
    *(_QWORD *)a5 = 0;
    *(_BYTE *)(a5 + 8) = 1;
    return result;
  }
  v23 = (uint64_t)v22;
  v25 = 0;
  v26 = 1;
  v24 = 0;
  swift_retain();
  swift_retain();
  sub_23A348C2C((uint64_t)&v27);
  sub_23A33A794(v23, a2, a3, v23, (uint64_t)&v24, (uint64_t)&v27);
  swift_release();
  result = swift_release_n();
  if (v6)
    return result;
  if ((v24 & 1) == 0)
    goto LABEL_9;
  if ((v26 & 1) != 0)
  {
    *(_QWORD *)a5 = 1;
    *(_BYTE *)(a5 + 8) = 1;
  }
  else
  {
    *(_QWORD *)a5 = v25;
    *(_BYTE *)(a5 + 8) = 0;
  }
  return result;
}

uint64_t DataFrameStreamSegment.mutateFrame(frameSegmentIndex:mutate:supersede:)@<X0>(uint64_t result@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  _BYTE v18[28];
  char v19;

  v6 = *(__int128 *)((char *)v3 + 28);
  v7 = v3[1];
  v17 = *v3;
  *(_OWORD *)v18 = v7;
  *(_OWORD *)&v18[12] = v6;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v18[8] + 16) + 16) > result)
  {
    v8 = 8 * result + 8;
    v9 = *(_QWORD *)(*(_QWORD *)&v18[16] + 16);
    v10 = *(_QWORD *)(v9 + 32);
    v11 = __OFSUB__(v10, v8);
    v12 = v10 - v8;
    if (v11)
    {
      __break(1u);
      return result;
    }
    v14 = *(unsigned int *)(*(_QWORD *)(v9 + 16) + v12);
    type metadata accessor for DataFrameReader();
    swift_allocObject();
    v15 = (_QWORD *)swift_retain();
    result = (uint64_t)sub_23A33A650(v15, v14);
    if (result)
    {
      v16 = result;
      v19 = 0;
      sub_23A348C2C((uint64_t)&v17);
      sub_23A33A8E0(v16, a2);
      sub_23A33A9FC((uint64_t)&v17);
      result = swift_release();
      if (v4)
        return result;
      if ((v19 & 1) != 0)
      {
        *(_QWORD *)a3 = 1;
        *(_BYTE *)(a3 + 8) = 1;
        return result;
      }
    }
  }
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  return result;
}

uint64_t DataFrameMutationResult.succeeded.getter()
{
  uint64_t v0;

  return (*(_QWORD *)v0 != 0) | ((*(_BYTE *)(v0 + 8) & 1) == 0);
}

unint64_t *(*DataFrameStreamSegment.identifierSeed.modify(_QWORD *a1))(unint64_t *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16) + 24);
  return sub_23A34E504;
}

unint64_t *sub_23A34E504(unint64_t *result)
{
  atomic_store(*result, (unint64_t *)(*(_QWORD *)(*(_QWORD *)(result[1] + 24) + 16) + 24));
  return result;
}

int64_t sub_23A34E51C(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unsigned int *v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;

  v6 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a2;
  v10 = *(_QWORD *)(v2 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(v2 + 24) + 16);
  v12 = (unint64_t *)(v11 + 8);
  v13 = atomic_load((unint64_t *)(v11 + 8));
  v14 = (unsigned int *)(v11 + 16);
  while (1)
  {
    v15 = v13;
    if (v9)
    {
      if (v9 == 1)
        v16 = 4;
      else
        v16 = 8;
      v17 = v13 + v16;
      if (__OFADD__(v13, v16))
        goto LABEL_37;
      v18 = __OFSUB__(v17, 1);
      v19 = v17 - 1;
      if (v18)
        goto LABEL_38;
      v20 = v19 / v16;
      v15 = v20 * v16;
      if ((unsigned __int128)(v20 * (__int128)v16) >> 64 != (v20 * v16) >> 63)
        goto LABEL_39;
    }
    if (!v13)
    {
      v18 = __OFADD__(v15, 32);
      v15 += 32;
      if (v18)
        goto LABEL_43;
    }
    v21 = v15 + a1;
    if (__OFADD__(v15, a1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v9)
    {
      if (v9 == 1)
        v22 = 4;
      else
        v22 = 8;
      v23 = v21 + v22;
      if (__OFADD__(v21, v22))
        goto LABEL_40;
      v18 = __OFSUB__(v23, 1);
      v24 = v23 - 1;
      if (v18)
        goto LABEL_41;
      v25 = v24 / v22;
      v21 = v25 * v22;
      if ((unsigned __int128)(v25 * (__int128)v22) >> 64 != (v25 * v22) >> 63)
        goto LABEL_42;
    }
    if (v21 < v15)
      goto LABEL_35;
    v26 = atomic_load(v14);
    v27 = 8 * v26 + 8;
    v28 = *(_QWORD *)(*(_QWORD *)(v10 + 16) + 32);
    v3 = v28 - v27;
    if (__OFSUB__(v28, v27))
      goto LABEL_36;
    if (v15 >= v3)
    {
      if (qword_2542D0118 == -1)
      {
LABEL_28:
        v30 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D12A8);
        sub_23A3363A8(v30, (uint64_t)v8);
        v39 = 0;
        v40 = 0xE000000000000000;
        sub_23A362E2C();
        swift_bridgeObjectRelease();
        v39 = 0xD000000000000016;
        v40 = 0x800000023A366A90;
        v36 = v15;
        sub_23A362EC8();
        sub_23A362C58();
        swift_bridgeObjectRelease();
        sub_23A362C58();
        v36 = v3;
        sub_23A362EC8();
        sub_23A362C58();
        swift_bridgeObjectRelease();
        v31 = v39;
        v15 = v40;
        goto LABEL_32;
      }
LABEL_44:
      swift_once();
      goto LABEL_28;
    }
    if (v21 > v3)
      break;
    while (1)
    {
      v29 = __ldaxr(v12);
      if (v29 != v13)
        break;
      if (!__stlxr(v21, v12))
        return v15;
    }
    __clrex();
    v13 = v29;
  }
  if (qword_2542D0118 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D12A8);
  sub_23A3363A8(v32, (uint64_t)v8);
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_23A362E2C();
  sub_23A362C58();
  v41 = v15;
  v37 = 0xE000000000000000;
  v38 = v21;
  v36 = 0;
  sub_23A362E50();
  sub_23A362C58();
  sub_23A362E50();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  v41 = v15;
  v37 = 0xE000000000000000;
  v38 = v3;
  v36 = 0;
  sub_23A362E50();
  sub_23A362C58();
  sub_23A362E50();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  v31 = v39;
  v15 = v40;
LABEL_32:
  sub_23A33E2D4(v31, v15, 0xD000000000000069, 0x800000023A3661A0, 0xD000000000000019, 0x800000023A366AD0);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v8);
  sub_23A348788();
  swift_allocError();
  *v33 = 0;
  swift_willThrow();
  return v15;
}

int64_t sub_23A34E9D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;
  int64_t result;
  char v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  int v27;

  v3 = *v1;
  v4 = *(_OWORD *)(v1 + 1);
  v6 = v1[3];
  v5 = v1[4];
  v7 = *((_DWORD *)v1 + 10);
  v8 = *(unsigned __int8 **)(v6 + 16);
  do
  {
    while (__ldaxr(v8))
      __clrex();
  }
  while (__stlxr(1u, v8));
  v23 = v3;
  v24 = v4;
  v25 = v6;
  v26 = v5;
  v27 = v7;
  v22 = 2;
  result = sub_23A34E51C(a1, &v22);
  if (v2)
    goto LABEL_6;
  if ((v11 & 1) != 0)
  {
    result = 0;
    goto LABEL_6;
  }
  v12 = result;
  v13 = (unsigned int *)(*(_QWORD *)(v6 + 16) + 16);
  do
  {
    v14 = __ldaxr(v13);
    v15 = v14 + 1;
  }
  while (__stlxr(v15, v13));
  result = v15 - 1;
  if (v15)
  {
    if ((v12 & 0x8000000000000000) != 0 || HIDWORD(v12))
      goto LABEL_18;
    v16 = 8 * (v15 - 1) + 8;
    v17 = *(_QWORD *)(v5 + 16);
    v18 = *(_QWORD *)(v17 + 32);
    v19 = __OFSUB__(v18, v16);
    v20 = v18 - v16;
    if (!v19)
    {
      v21 = *(_QWORD *)(v17 + 16) + v20;
      *(_DWORD *)v21 = v12;
      *(_BYTE *)(v21 + 4) = 1;
LABEL_6:
      atomic_store(0, v8);
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_18:
  result = sub_23A362E5C();
  __break(1u);
  return result;
}

uint64_t sub_23A34EB60(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  _BOOL4 v16;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;
  unint64_t v23;

  v11 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = a4 + 24;
  if (__OFADD__(a4, 24))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (result < a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_18;
  }
  v5 = v4[3];
  v6 = v4[4];
  v16 = v5 <= a4 && v6 >= a4;
  if (result >= v5 && v6 >= result && v16)
  {
    v19 = v4[2] + a4;
    *(_BYTE *)v19 = a1 & 1;
    *(_DWORD *)(v19 + 4) = HIDWORD(a1);
    *(_WORD *)(v19 + 8) = a2;
    *(_QWORD *)(v19 + 16) = a3;
    return result;
  }
  if (qword_2542D0118 != -1)
    goto LABEL_21;
LABEL_18:
  v20 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
  sub_23A3363A8(v20, (uint64_t)v13);
  v22 = 0;
  v23 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v22 = 0xD000000000000011;
  v23 = 0x800000023A3669F0;
  v21[2] = v6;
  v21[3] = v5;
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  sub_23A362E50();
  sub_23A362C58();
  sub_23A362E50();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2E0(v22, v23, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000019, 0x800000023A366A70);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v13);
  return 0;
}

uint64_t sub_23A34ED98(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v2 = v1[2];
  if (*(_DWORD *)(*(_QWORD *)(v1[3] + 16) + 16) <= result)
    return 0;
  v3 = 8 * result + 8;
  v4 = *(_QWORD *)(v1[4] + 16);
  v5 = *(_QWORD *)(v4 + 32);
  v6 = __OFSUB__(v5, v3);
  v7 = v5 - v3;
  if (v6)
  {
    __break(1u);
    return result;
  }
  v8 = *(unsigned int *)(*(_QWORD *)(v4 + 16) + v7);
  result = v8 + 24;
  v9 = *(_QWORD *)(v2 + 24);
  v10 = *(_QWORD *)(v2 + 32);
  v11 = v9 > v8 || v10 < v8;
  v12 = v11 || v10 < result;
  if (v12 || result < v9)
    return 0;
  return result;
}

_QWORD *sub_23A34EE18(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16) + 16) <= result)
    return 0;
  v2 = 8 * result + 8;
  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16);
  v4 = *(_QWORD *)(v3 + 32);
  v5 = __OFSUB__(v4, v2);
  v6 = v4 - v2;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    v7 = *(unsigned int *)(*(_QWORD *)(v3 + 16) + v6);
    type metadata accessor for DataFrameReader();
    swift_allocObject();
    v8 = (_QWORD *)swift_retain();
    return sub_23A33A650(v8, v7);
  }
  return result;
}

uint64_t sub_23A34EEA8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;

  a3();
  if (!v3)
    __asm { BR              X9 }
  return swift_release();
}

uint64_t sub_23A34F530(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;

  result = a3();
  if (!v3)
    __asm { BR              X9 }
  return result;
}

void sub_23A34FACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x23A34FB4CLL);
}

Swift::Void __swiftcall DataFrameStreamSegment.sync()()
{
  uint64_t v0;
  Swift::Int v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) + 16) + 8));
  MemoryMappedRegion.sync(used:)(v1);
}

uint64_t sub_23A34FBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_23A362964();
  v12 = result;
  if (result)
  {
    result = sub_23A362988();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  v13 = __OFSUB__(a2, a1);
  v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  v15 = sub_23A36297C();
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  v17 = v12 + v16;
  if (v12)
    v18 = v17;
  else
    v18 = 0;
  sub_23A34FACC(v12, v18, a4, a5, a6);
  swift_release();
  return sub_23A33350C(a5, a6);
}

uint64_t sub_23A34FCA8(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_23A35CC78(__src, &__src[a2]);
  sub_23A362994();
  swift_allocObject();
  sub_23A362958();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_23A362A78();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23A34FD54@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 24);
  return result;
}

unint64_t *sub_23A34FD68(unint64_t *result, uint64_t a2)
{
  atomic_store(*result, (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) + 16) + 24));
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

uint64_t getEnumTagSinglePayload for DataFrameMutationResult(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DataFrameMutationResult(uint64_t result, int a2, int a3)
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

uint64_t sub_23A34FDE4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A34FE00(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for DataFrameMutationResult()
{
  return &type metadata for DataFrameMutationResult;
}

uint64_t destroy for DataFrameStreamSegment()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DataFrameStreamSegment(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegment(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 44))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataFrameStreamSegment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 44) = 1;
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
    *(_BYTE *)(result + 44) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamSegment()
{
  return &type metadata for DataFrameStreamSegment;
}

uint64_t getEnumTagSinglePayload for DataFrameStreamSegmentError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DataFrameStreamSegmentError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A350160 + 4 * byte_23A364875[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A350194 + 4 * byte_23A364870[v4]))();
}

uint64_t sub_23A350194(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A35019C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A3501A4);
  return result;
}

uint64_t sub_23A3501B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A3501B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A3501BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3501C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataFrameStreamSegmentError()
{
  return &type metadata for DataFrameStreamSegmentError;
}

unint64_t sub_23A3501E4()
{
  unint64_t result;

  result = qword_25696C3A8;
  if (!qword_25696C3A8)
  {
    result = MEMORY[0x23B849AC0](&unk_23A36493C, &type metadata for DataFrameStreamSegmentError);
    atomic_store(result, (unint64_t *)&qword_25696C3A8);
  }
  return result;
}

uint64_t StorageContainer.init(url:protection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for StorageContainer();
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for StorageContainer()
{
  uint64_t result;

  result = qword_2542D1128;
  if (!qword_2542D1128)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t StorageContainer.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A362A3C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id StorageContainer.protection.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for StorageContainer() + 20));
}

uint64_t *initializeBufferWithCopyOfBuffer for StorageContainer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A362A3C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for StorageContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for StorageContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for StorageContainer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A35057C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A362A3C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for StorageContainer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A350604(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A362A3C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23A35067C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A362A3C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t MultiStreamContainer.init(storageContainer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A3506F4(a1, a2);
}

uint64_t sub_23A3506F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for MultiStreamContainer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = type metadata accessor for StorageContainer();
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
    v6 = v4;
    v7 = sub_23A362A3C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for MultiStreamContainer(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);

}

uint64_t initializeWithCopy for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v6 = *(void **)(a2 + v5);
  *(_QWORD *)(a1 + v5) = v6;
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v6 = *(void **)(a2 + v5);
  v7 = *(void **)(a1 + v5);
  *(_QWORD *)(a1 + v5) = v6;
  v8 = v6;

  return a1;
}

uint64_t initializeWithTake for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = type metadata accessor for StorageContainer();
  *(_QWORD *)(a1 + *(int *)(v5 + 20)) = *(_QWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t assignWithTake for MultiStreamContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = *(int *)(type metadata accessor for StorageContainer() + 20);
  v6 = *(void **)(a1 + v5);
  *(_QWORD *)(a1 + v5) = *(_QWORD *)(a2 + v5);

  return a1;
}

uint64_t getEnumTagSinglePayload for MultiStreamContainer()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A350998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageContainer();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MultiStreamContainer()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3509E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageContainer();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MultiStreamContainer()
{
  uint64_t result;

  result = qword_25696C3B0;
  if (!qword_25696C3B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A350A5C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for StorageContainer();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A350AC4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock;
  unint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  uint64_t (*v31)();
  _QWORD *v32;

  v6 = v5;
  v12 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v6 + 48) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D1100);
  v15 = swift_allocObject();
  *(_BYTE *)(v15 + 16) = 0;
  *(_QWORD *)(v6 + 56) = v15;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  v16 = qword_25696BD18;
  swift_bridgeObjectRetain();
  v26 = a5;
  swift_retain();
  if (v16 != -1)
    swift_once();
  v25 = __swift_project_value_buffer(v12, (uint64_t)qword_25696E8D0);
  sub_23A3363A8(v25, (uint64_t)v14);
  aBlock = 0;
  v28 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000013;
  v28 = 0x800000023A366B90;
  sub_23A362C58();
  v24 = 0x800000023A366BB0;
  sub_23A33E2D4(aBlock, v28, 0xD00000000000005FLL, 0x800000023A366BB0, 0xD00000000000001ALL, 0x800000023A366C10);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v14);
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_bridgeObjectRetain();
  swift_unownedRetain();
  v17 = a3;
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRetain();
  swift_release();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = v6;
  v31 = sub_23A351404;
  v32 = v18;
  aBlock = MEMORY[0x24BDAC760];
  v28 = 1107296256;
  v29 = sub_23A35137C;
  v30 = &block_descriptor_0;
  v19 = _Block_copy(&aBlock);
  swift_release();
  v20 = (const char *)(sub_23A362C10() + 32);
  swift_beginAccess();
  v21 = notify_register_dispatch(v20, (int *)(v6 + 48), v17, v19);
  swift_endAccess();
  swift_release();
  _Block_release(v19);

  if (v21)
  {
    sub_23A3363A8(v25, (uint64_t)v14);
    aBlock = 0;
    v28 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000017;
    v28 = 0x800000023A366C40;
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(aBlock, v28, 0xD00000000000005FLL, v24, 0xD00000000000001ALL, 0x800000023A366C10);

    swift_release();
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v14);
    swift_release();
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();

    swift_release();
  }
  return v6;
}

uint64_t sub_23A350E4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t state64[5];

  v1 = v0;
  state64[4] = *MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  state64[0] = 0;
  swift_beginAccess();
  if (!notify_get_state(*(_DWORD *)(v1 + 48), state64))
    return state64[0];
  if (qword_25696BD18 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_25696E8D0);
  sub_23A3363A8(v5, (uint64_t)v4);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v8 = 0xD000000000000020;
  v9 = 0x800000023A366CA0;
  swift_bridgeObjectRetain();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2E0(v8, v9, 0xD00000000000005FLL, 0x800000023A366BB0, 0x53746E6572727563, 0xEC00000065746174);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v4);
  return 0;
}

uint64_t sub_23A35100C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;

  v1 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + 56) + 136);
  v5 = swift_retain();
  LOBYTE(v4) = atomic_load((unsigned __int8 *)v4(v5));
  result = swift_release();
  if ((v4 & 1) == 0)
  {
    v7 = sub_23A350E4C();
    v9 = v8 & 1;
    if (qword_25696BD18 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v1, (uint64_t)qword_25696E8D0);
    sub_23A3363A8(v10, (uint64_t)v3);
    v13 = 0;
    v14 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v13 = 0x6E69796669746F4ELL;
    v14 = 0xEF3A656D616E2067;
    swift_bridgeObjectRetain();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    v11 = v7;
    v12 = (_DWORD)v9 != 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C3C0);
    sub_23A362C04();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2D4(v13, v14, 0xD00000000000005FLL, 0x800000023A366BB0, 0xD000000000000014, 0x800000023A366C80);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v3);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v7, v9);
  }
  return result;
}

uint64_t sub_23A35121C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;

  v0 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BD18 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v0, (uint64_t)qword_25696E8D0);
  sub_23A3363A8(v3, (uint64_t)v2);
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v5 = 0xD00000000000001ALL;
  v6 = 0x800000023A366C60;
  sub_23A362C58();
  sub_23A33E2D4(v5, v6, 0xD00000000000005FLL, 0x800000023A366BB0, 0xD00000000000001ALL, 0x800000023A366C10);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v2);
  swift_unownedRetainStrong();
  sub_23A35100C();
  return swift_release();
}

uint64_t sub_23A35137C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t type metadata accessor for DarwinNotificationObserver()
{
  return objc_opt_self();
}

uint64_t sub_23A3513D8()
{
  swift_bridgeObjectRelease();
  swift_unownedRelease();
  return swift_deallocObject();
}

uint64_t sub_23A351404()
{
  return sub_23A35121C();
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

Dendrite::MemoryAlignment_optional __swiftcall MemoryAlignment.init(rawValue:)(Dendrite::MemoryAlignment_optional rawValue)
{
  Dendrite::MemoryAlignment *v1;
  Dendrite::MemoryAlignment value;
  char v3;

  value = rawValue.value;
  if (rawValue.value)
  {
    if (rawValue.value == 8)
      v3 = 2;
    else
      v3 = 3;
    if (rawValue.value == 4)
      value = Dendrite_MemoryAlignment_fourByte;
    else
      value = v3;
  }
  *v1 = value;
  return rawValue;
}

uint64_t MemoryAlignment.rawValue.getter()
{
  unsigned __int8 *v0;

  return 4 * *v0;
}

unint64_t sub_23A351464()
{
  unint64_t result;

  result = qword_25696C3C8;
  if (!qword_25696C3C8)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for MemoryAlignment, &type metadata for MemoryAlignment);
    atomic_store(result, (unint64_t *)&qword_25696C3C8);
  }
  return result;
}

uint64_t sub_23A3514A8()
{
  sub_23A362F34();
  sub_23A362F4C();
  return sub_23A362F64();
}

uint64_t sub_23A3514EC()
{
  return sub_23A362F4C();
}

uint64_t sub_23A351518()
{
  sub_23A362F34();
  sub_23A362F4C();
  return sub_23A362F64();
}

Dendrite::MemoryAlignment_optional sub_23A351558(Swift::UInt8 *a1)
{
  return MemoryAlignment.init(rawValue:)(*a1);
}

void sub_23A351560(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = 4 * *v1;
}

uint64_t storeEnumTagSinglePayload for MemoryAlignment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A3515BC + 4 * byte_23A364A81[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A3515F0 + 4 * asc_23A364A7C[v4]))();
}

uint64_t sub_23A3515F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3515F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A351600);
  return result;
}

uint64_t sub_23A35160C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A351614);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A351618(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A351620(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MemoryAlignment()
{
  return &type metadata for MemoryAlignment;
}

uint64_t static DataRepresentableError.== infix(_:_:)()
{
  return 1;
}

uint64_t DataRepresentableError.hash(into:)()
{
  return sub_23A362F40();
}

uint64_t DataRepresentableError.hashValue.getter()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t UUID.serialize()()
{
  char v0;
  char v1;
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  uint64_t __src;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  __src = sub_23A362ACC();
  v10 = v0;
  v11 = v1;
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  return sub_23A34FCA8(&__src, 16);
}

void static UUID.deserialize(data:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D10F8);
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

uint64_t sub_23A3517EC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (BYTE6(v4) != 16)
  {
    v5 = sub_23A362AE4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  }
  if (!a1)
  {
    sub_23A362AC0();
    goto LABEL_13;
  }
  if (a1 != 1)
  {
    v7 = *(_QWORD *)(v3 + 16);
    swift_retain();
    swift_retain();
    if (!sub_23A362964())
    {
LABEL_18:
      sub_23A36297C();
      __break(1u);
      JUMPOUT(0x23A351A2CLL);
    }
    if (!__OFSUB__(v7, sub_23A362988()))
    {
      sub_23A36297C();
      sub_23A362AC0();
      swift_release();
      swift_release();
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  if ((int)v3 > v3 >> 32)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_23A333494(v3, v4);
  if (!sub_23A362964())
  {
LABEL_17:
    sub_23A36297C();
    __break(1u);
    goto LABEL_18;
  }
  if (__OFSUB__((int)v3, sub_23A362988()))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  sub_23A36297C();
  sub_23A362AC0();
  sub_23A33350C(v3, v4);
LABEL_13:
  v8 = sub_23A362AE4();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 0, 1, v8);
  return sub_23A351E58(v2, v1);
}

uint64_t sub_23A351A3C()
{
  return UUID.serialize()();
}

void sub_23A351A60(uint64_t a1, uint64_t a2)
{
  static UUID.deserialize(data:)(a1, a2);
}

uint64_t String.serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_23A362BF8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A362BEC();
  v4 = sub_23A362BD4();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    sub_23A351EA0();
    swift_allocError();
    swift_willThrow();
  }
  return v4;
}

uint64_t static String.deserialize(data:)()
{
  uint64_t v0;

  v0 = sub_23A362BF8();
  MEMORY[0x24BDAC7A8](v0);
  sub_23A362BEC();
  sub_23A351EE4();
  return sub_23A362BE0();
}

uint64_t sub_23A351BF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_23A362BF8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A362BEC();
  v4 = sub_23A362BD4();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    sub_23A351EA0();
    swift_allocError();
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_23A351CD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = sub_23A362BF8();
  MEMORY[0x24BDAC7A8](v2);
  sub_23A362BEC();
  sub_23A351EE4();
  result = sub_23A362BE0();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t Data.serialize()(uint64_t a1, unint64_t a2)
{
  sub_23A333494(a1, a2);
  return a1;
}

uint64_t static Data.deserialize(data:)(uint64_t a1, unint64_t a2)
{
  sub_23A333494(a1, a2);
  return a1;
}

uint64_t sub_23A351DF0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23A333494(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t sub_23A351E30@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return sub_23A333494(a1, a2);
}

uint64_t sub_23A351E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D10F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A351EA0()
{
  unint64_t result;

  result = qword_25696C3D0;
  if (!qword_25696C3D0)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for DataRepresentableError, &type metadata for DataRepresentableError);
    atomic_store(result, (unint64_t *)&qword_25696C3D0);
  }
  return result;
}

unint64_t sub_23A351EE4()
{
  unint64_t result;

  result = qword_25696C3D8;
  if (!qword_25696C3D8)
  {
    result = MEMORY[0x23B849AC0](MEMORY[0x24BDCDE28], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25696C3D8);
  }
  return result;
}

unint64_t sub_23A351F2C()
{
  unint64_t result;

  result = qword_25696C3E0;
  if (!qword_25696C3E0)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for DataRepresentableError, &type metadata for DataRepresentableError);
    atomic_store(result, (unint64_t *)&qword_25696C3E0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DataRepresentableError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A351FB0 + 4 * byte_23A364B60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A351FD0 + 4 * byte_23A364B65[v4]))();
}

_BYTE *sub_23A351FB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A351FD0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A351FD8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A351FE0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A351FE8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A351FF0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DataRepresentableError()
{
  return &type metadata for DataRepresentableError;
}

uint64_t dispatch thunk of DataRepresentable.serialize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DataRepresentable.deserialize(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_23A35203C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL sub_23A352044()
{
  _DWORD *v0;

  return *v0 == 0;
}

ValueMetadata *type metadata accessor for EmbeddedDeviceLockState()
{
  return &type metadata for EmbeddedDeviceLockState;
}

uint64_t SegmentedDataRegion.init(representables:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v20 = a2;
    v5 = a1 + 32;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      sub_23A33DE74(v5, (uint64_t)v17);
      v7 = v18;
      v8 = v19;
      __swift_project_boxed_opaque_existential_1(v17, v18);
      v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      if (v2)
        break;
      v11 = v9;
      v12 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_23A35F820(0, v6[2] + 1, 1, v6);
      v14 = v6[2];
      v13 = v6[3];
      if (v14 >= v13 >> 1)
        v6 = sub_23A35F820((_QWORD *)(v13 > 1), v14 + 1, 1, v6);
      v6[2] = v14 + 1;
      v15 = &v6[2 * v14];
      v15[4] = v11;
      v15[5] = v12;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      v5 += 40;
      if (!--v4)
      {
        result = swift_bridgeObjectRelease();
        *v20 = v6;
        return result;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *a2 = MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t SegmentedDataRegion.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;

  v9 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 0 || *(_QWORD *)(*(_QWORD *)v4 + 16) <= a1)
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v9, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v16, (uint64_t)v11);
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    v19 = 0xD000000000000014;
    v20 = 0x800000023A366CD0;
    v18[1] = a1;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v19, v20, 0xD000000000000066, 0x800000023A366CF0, 0x7069726373627573, 0xED0000293A5F2874);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v11);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
  }
  else
  {
    v12 = *(_QWORD *)v4 + 16 * a1;
    v13 = *(_QWORD *)(v12 + 32);
    v14 = *(_QWORD *)(v12 + 40);
    v15 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a3 + 16);
    sub_23A333494(v13, v14);
    v15(v13, v14, a2, a3);
    return sub_23A33350C(v13, v14);
  }
}

uint64_t SegmentedDataRegion.serialize()()
{
  uint64_t v0;
  char *v1;

  if (*(_QWORD *)(*(_QWORD *)v0 + 16))
  {
    v1 = (char *)&loc_23A35258C + dword_23A352A94[*(_QWORD *)(swift_bridgeObjectRetain() + 40) >> 62];
    __asm { BR              X9 }
  }
  return 0;
}

void static SegmentedDataRegion.deserialize(data:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A352B1C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  __int16 v6;
  char v7;
  char v8;
  char v9;
  char v10;

  v5 = v0;
  v6 = v1;
  v7 = BYTE2(v1);
  v8 = BYTE3(v1);
  v9 = BYTE4(v1);
  v10 = BYTE5(v1);
  sub_23A352D24((uint64_t)&v5, v1, v3);
  if (v2)
  {
    sub_23A33350C(v0, v1);
    sub_23A33350C(v0, v1);
    __break(1u);
    JUMPOUT(0x23A352D00);
  }
  sub_23A33350C(v0, v1);
  sub_23A33350C(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A352D24@<X0>(uint64_t result@<X0>, uint64_t a2@<X4>, _QWORD *a3@<X8>)
{
  if (result)
    __asm { BR              X10 }
  *a3 = 0;
  return result;
}

uint64_t sub_23A3530E8()
{
  return SegmentedDataRegion.serialize()();
}

void sub_23A3530FC(uint64_t a1, uint64_t a2)
{
  static SegmentedDataRegion.deserialize(data:)(a1, a2);
}

uint64_t sub_23A353110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, unint64_t a4@<X5>, _QWORD *a5@<X8>)
{
  uint64_t result;
  uint64_t v11;

  result = sub_23A362964();
  v11 = result;
  if (result)
  {
    result = sub_23A362988();
    if (__OFSUB__(a1, result))
      goto LABEL_7;
    v11 += a1 - result;
  }
  if (!__OFSUB__(a2, a1))
  {
    sub_23A36297C();
    sub_23A352D24(v11, a4, a5);
    return sub_23A33350C(a3, a4);
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SegmentedDataRegion()
{
  return &type metadata for SegmentedDataRegion;
}

void static Storage.ensureFileExists(fileURL:)(unsigned __int8 *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_23A362A3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A362A24();
  v7 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_fileExistsAtPath_, v7);

  if (v8)
  {

    *a1 = 2;
    return;
  }
  sub_23A362A18();
  sub_23A362A24();
  v9 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v6, sel_fileExistsAtPath_, v9);

  if ((v10 & 1) != 0)
    goto LABEL_6;
  v11 = (void *)sub_23A362A00();
  v18[0] = 0;
  v12 = objc_msgSend(v6, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v11, 1, 0, v18);

  if (v12)
  {
    v13 = v18[0];
LABEL_6:
    sub_23A362A24();
    v14 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v6, sel_createFileAtPath_contents_attributes_, v14, 0, 0);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *a1 = v15;
    return;
  }
  v16 = v18[0];
  sub_23A3629B8();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void static Storage.listFiles(directoryURL:)()
{
  sub_23A35511C();
}

void static Storage.delete(url:)()
{
  sub_23A355B24();
}

uint64_t static Storage.available(for:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A353488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t (*v7)(void);
  _QWORD *v8;
  uint64_t (*v10)(void);

  v1 = sub_23A362BC8();
  v3 = v2;
  if (v1 == sub_23A362BC8() && v3 == v4)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v6 = sub_23A362EE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
LABEL_8:
    v10 = (uint64_t (*)(void))((char *)&dword_25696C570 + dword_25696C570);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v8;
    *v8 = v0;
    v8[1] = sub_23A353560;
    v7 = v10;
    return v7();
  }
  v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_23A353560()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void static Storage.listDirectories(directoryURL:)()
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
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t inited;
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  char v33;
  char v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  id v55[8];

  v55[6] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_23A3629AC();
  v45 = *(_QWORD *)(v1 - 8);
  v46 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  MEMORY[0x24BDAC7A8](v3);
  v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A362A3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v39 - v9;
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v11 = (void *)sub_23A362A00();
  v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D0128);
  v12 = swift_allocObject();
  v49 = xmmword_23A363D70;
  *(_OWORD *)(v12 + 16) = xmmword_23A363D70;
  v13 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(v12 + 32) = *MEMORY[0x24BDBCC60];
  type metadata accessor for URLResourceKey(0);
  v15 = v14;
  v47 = v13;
  v48 = v15;
  v16 = (void *)sub_23A362CE8();
  swift_bridgeObjectRelease();
  v55[0] = 0;
  v17 = objc_msgSend(v10, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v11, v16, 0, v55);

  v18 = v55[0];
  if (v17)
  {
    v39 = v10;
    v54 = v0;
    v19 = sub_23A362CF4();
    v20 = v18;

    v55[0] = (id)MEMORY[0x24BEE4AF8];
    v21 = v5;
    v43 = *(_QWORD *)(v19 + 16);
    if (v43)
    {
      v22 = 0;
      v23 = (uint64_t)v52;
      v42 = v6;
      v41 = v19;
      v24 = v53;
      do
      {
        if (v22 >= *(_QWORD *)(v19 + 16))
        {
          __break(1u);
LABEL_22:
          __break(1u);
        }
        v25 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
        v26 = *(_QWORD *)(v6 + 72);
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))(v23, v19 + v25 + v26 * v22, v21);
        v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
        v40(v23, 0, 1, v21);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v23, 1, v21) == 1)
          goto LABEL_20;
        v27 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 32);
        v27(v24, v23, v21);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v49;
        v29 = v47;
        *(_QWORD *)(inited + 32) = v47;
        v30 = v29;
        sub_23A354EF0(inited);
        swift_setDeallocating();
        v31 = v51;
        swift_arrayDestroy();
        v32 = v54;
        sub_23A3629DC();
        v54 = v32;
        if (v32)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v53, v21);
          swift_bridgeObjectRelease();

          swift_release();
          return;
        }
        swift_bridgeObjectRelease();
        v33 = sub_23A3629A0();
        if (v33 == 2)
          goto LABEL_22;
        v34 = v33;
        (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v46);
        if ((v34 & 1) != 0)
        {
          v27(v44, (uint64_t)v53, v21);
          v35 = (char *)v55[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_23A353EE4(0, *((_QWORD *)v35 + 2) + 1, 1);
            v35 = (char *)v55[0];
          }
          v37 = *((_QWORD *)v35 + 2);
          v36 = *((_QWORD *)v35 + 3);
          if (v37 >= v36 >> 1)
          {
            sub_23A353EE4(v36 > 1, v37 + 1, 1);
            v35 = (char *)v55[0];
          }
          *((_QWORD *)v35 + 2) = v37 + 1;
          v27(&v35[v25 + v37 * v26], (uint64_t)v44, v21);
          v55[0] = v35;
          v6 = v42;
        }
        else
        {
          v6 = v42;
          (*(void (**)(char *, uint64_t))(v42 + 8))(v53, v21);
        }
        v19 = v41;
        ++v22;
        v23 = (uint64_t)v52;
      }
      while (v43 != v22);
      v40((uint64_t)v52, 1, 1, v21);
    }
    else
    {
      v23 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v52, 1, 1, v5);
    }
LABEL_20:
    swift_bridgeObjectRelease();
    sub_23A348E48(v23, &qword_2542D0110);

  }
  else
  {
    v38 = v55[0];
    sub_23A3629B8();

    swift_willThrow();
  }
}

uint64_t static Storage.pathURLExists(pathURL:andIsDirectory:)(uint64_t a1, int a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  unsigned __int8 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v7 = 0;
  sub_23A362A24();
  v4 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_fileExistsAtPath_isDirectory_, v4, &v7);

  return v5 & (v7 ^ a2 ^ 1);
}

BOOL static MemoryAccess.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MemoryAccess.hash(into:)()
{
  return sub_23A362F40();
}

uint64_t MemoryAccess.hashValue.getter()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

void static Storage.truncate(_:size:)(uint64_t a1, unsigned int a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  sub_23A362A24();
  v3 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_fileHandleForUpdatingAtPath_, v3);

  if (v4)
  {
    sub_23A355970(v4, a2);

  }
  else
  {
    if (qword_2542D0118 != -1)
      swift_once();
    v5 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v5, (uint64_t)qword_2542D12A8);
    sub_23A33E2E0(0xD000000000000019, 0x800000023A366DE0, 0xD000000000000062, 0x800000023A366E00, 0xD000000000000011, 0x800000023A366E70);
    sub_23A33D8BC();
    swift_allocError();
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_BYTE *)(v6 + 16) = 2;
    swift_willThrow();
  }
}

uint64_t static Storage.truncate(_:size:)(void *a1, unsigned int a2)
{
  return sub_23A355970(a1, a2);
}

void static Storage.fileSize(pathURL:)()
{
  sub_23A355728();
}

id static Storage.fileHandle(url:forAccess:)(uint64_t a1, _BYTE *a2)
{
  return sub_23A355660(a1, a2);
}

void *static Storage.sharedResourcesDirectory.getter()
{
  void *result;
  id v1;

  result = (void *)CPSharedResourcesDirectory();
  if (result)
  {
    v1 = result;
    sub_23A362BC8();

    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    sub_23A3629E8();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A353E90(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A353F38(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A353EAC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A3540A0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23A353EC8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A354244(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A353EE4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A354530(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23A353F00(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A354710(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A353F1C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A3543C8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A353F38(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C408);
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A3540A0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C3F8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C400);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A354244(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C430);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A3543C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D0160);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A354530(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C418);
  v10 = *(_QWORD *)(sub_23A362A3C() - 8);
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
  v16 = *(_QWORD *)(sub_23A362A3C() - 8);
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A354710(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D1068);
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

unint64_t sub_23A35486C(uint64_t a1)
{
  uint64_t v2;

  sub_23A362BC8();
  sub_23A362F34();
  sub_23A362C34();
  v2 = sub_23A362F64();
  swift_bridgeObjectRelease();
  return sub_23A354958(a1, v2);
}

unint64_t sub_23A3548EC(uint64_t a1)
{
  uint64_t v2;

  sub_23A362A3C();
  sub_23A33319C(&qword_25696C228, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v2 = sub_23A362B74();
  return sub_23A354ACC(a1, v2);
}

unint64_t sub_23A354958(uint64_t a1, uint64_t a2)
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
    v6 = sub_23A362BC8();
    v8 = v7;
    if (v6 == sub_23A362BC8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23A362EE0();
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
          v13 = sub_23A362BC8();
          v15 = v14;
          if (v13 == sub_23A362BC8() && v15 == v16)
            break;
          v18 = sub_23A362EE0();
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

unint64_t sub_23A354ACC(uint64_t a1, uint64_t a2)
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
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_23A362A3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
      sub_23A33319C(&qword_25696C428, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v14 = sub_23A362B8C();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

BOOL _s8Dendrite7StorageV11isAvailable3forSbSo20NSFileProtectionTypea_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;

  v0 = sub_23A362BC8();
  v2 = v1;
  if (v0 == sub_23A362BC8() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v5 = sub_23A362EE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
      v6 = sub_23A362BC8();
      v8 = v7;
      if (v6 == sub_23A362BC8() && v8 == v9)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v11 = sub_23A362EE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
          return 1;
      }
      return MKBGetDeviceLockState() == 0;
    }
  }
  if (qword_2542D1140 != -1)
    swift_once();
  v12 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
  v13 = swift_retain();
  LOBYTE(v12) = *(_BYTE *)v12(v13);
  swift_release();
  if ((v12 & 1) != 0)
    return 1;
  if (MKBDeviceUnlockedSinceBoot() != 1)
    return 0;
  v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
  v15 = swift_retain();
  v16 = (_BYTE *)v14(v15);
  v17 = 1;
  *v16 = 1;
  swift_release();
  return v17;
}

uint64_t _s8Dendrite7StorageV21ensureDirectoryExists12directoryURLSb10Foundation0G0V_tFZ_0()
{
  id v0;
  void *v1;
  unsigned int v2;
  void *v3;
  unsigned int v4;
  id v5;
  id v7;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A362A24();
  v1 = (void *)sub_23A362BA4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
    goto LABEL_4;
  v3 = (void *)sub_23A362A00();
  v9[0] = 0;
  v4 = objc_msgSend(v0, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v3, 1, 0, v9);

  if (v4)
  {
    v5 = v9[0];
LABEL_4:

    return 1;
  }
  v7 = v9[0];
  v8 = (void *)sub_23A3629B8();

  swift_willThrow();
  return 0;
}

uint64_t sub_23A354EF0(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C420);
    v3 = sub_23A362E20();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_23A362BC8();
      sub_23A362F34();
      v7 = v6;
      sub_23A362C34();
      v8 = sub_23A362F64();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_23A362BC8();
        v17 = v16;
        if (v15 == sub_23A362BC8() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_23A362EE0();
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
          v22 = sub_23A362BC8();
          v24 = v23;
          if (v22 == sub_23A362BC8() && v24 == v25)
            goto LABEL_3;
          v27 = sub_23A362EE0();
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

void sub_23A35511C()
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
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t inited;
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  char v33;
  char v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  id v55[8];

  v55[6] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_23A3629AC();
  v45 = *(_QWORD *)(v1 - 8);
  v46 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  MEMORY[0x24BDAC7A8](v3);
  v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A362A3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v39 - v9;
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v11 = (void *)sub_23A362A00();
  v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D0128);
  v12 = swift_allocObject();
  v49 = xmmword_23A363D70;
  *(_OWORD *)(v12 + 16) = xmmword_23A363D70;
  v13 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(v12 + 32) = *MEMORY[0x24BDBCC60];
  type metadata accessor for URLResourceKey(0);
  v15 = v14;
  v47 = v13;
  v48 = v15;
  v16 = (void *)sub_23A362CE8();
  swift_bridgeObjectRelease();
  v55[0] = 0;
  v17 = objc_msgSend(v10, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v11, v16, 0, v55);

  v18 = v55[0];
  if (v17)
  {
    v39 = v10;
    v54 = v0;
    v19 = sub_23A362CF4();
    v20 = v18;

    v55[0] = (id)MEMORY[0x24BEE4AF8];
    v21 = v5;
    v43 = *(_QWORD *)(v19 + 16);
    if (v43)
    {
      v22 = 0;
      v23 = (uint64_t)v52;
      v42 = v6;
      v41 = v19;
      v24 = v53;
      do
      {
        if (v22 >= *(_QWORD *)(v19 + 16))
        {
          __break(1u);
LABEL_22:
          __break(1u);
        }
        v25 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
        v26 = *(_QWORD *)(v6 + 72);
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))(v23, v19 + v25 + v26 * v22, v21);
        v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
        v40(v23, 0, 1, v21);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v23, 1, v21) == 1)
          goto LABEL_20;
        v27 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 32);
        v27(v24, v23, v21);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v49;
        v29 = v47;
        *(_QWORD *)(inited + 32) = v47;
        v30 = v29;
        sub_23A354EF0(inited);
        swift_setDeallocating();
        v31 = v51;
        swift_arrayDestroy();
        v32 = v54;
        sub_23A3629DC();
        v54 = v32;
        if (v32)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v53, v21);
          swift_bridgeObjectRelease();

          swift_release();
          return;
        }
        swift_bridgeObjectRelease();
        v33 = sub_23A3629A0();
        if (v33 == 2)
          goto LABEL_22;
        v34 = v33;
        (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v46);
        if ((v34 & 1) != 0)
        {
          v6 = v42;
          (*(void (**)(char *, uint64_t))(v42 + 8))(v53, v21);
        }
        else
        {
          v27(v44, (uint64_t)v53, v21);
          v35 = (char *)v55[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_23A353EE4(0, *((_QWORD *)v35 + 2) + 1, 1);
            v35 = (char *)v55[0];
          }
          v37 = *((_QWORD *)v35 + 2);
          v36 = *((_QWORD *)v35 + 3);
          if (v37 >= v36 >> 1)
          {
            sub_23A353EE4(v36 > 1, v37 + 1, 1);
            v35 = (char *)v55[0];
          }
          *((_QWORD *)v35 + 2) = v37 + 1;
          v27(&v35[v25 + v37 * v26], (uint64_t)v44, v21);
          v55[0] = v35;
          v6 = v42;
        }
        v19 = v41;
        ++v22;
        v23 = (uint64_t)v52;
      }
      while (v43 != v22);
      v40((uint64_t)v52, 1, 1, v21);
    }
    else
    {
      v23 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v52, 1, 1, v5);
    }
LABEL_20:
    swift_bridgeObjectRelease();
    sub_23A348E48(v23, &qword_2542D0110);

  }
  else
  {
    v38 = v55[0];
    sub_23A3629B8();

    swift_willThrow();
  }
}

id sub_23A355660(uint64_t a1, _BYTE *a2)
{
  void *v2;
  char **v3;
  id v4;

  if (*a2)
  {
    if (*a2 == 1)
    {
      sub_23A362A24();
      v2 = (void *)sub_23A362BA4();
      v3 = &selRef_fileHandleForUpdatingAtPath_;
    }
    else
    {
      sub_23A362A24();
      v2 = (void *)sub_23A362BA4();
      v3 = &selRef_fileHandleForWritingAtPath_;
    }
  }
  else
  {
    sub_23A362A24();
    v2 = (void *)sub_23A362BA4();
    v3 = &selRef_fileHandleForReadingAtPath_;
  }
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), *v3, v2);

  return v4;
}

void sub_23A355728()
{
  id v0;
  void *v1;
  unsigned int v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  char v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A362A24();
  v1 = (void *)sub_23A362BA4();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
  {
    v3 = (void *)sub_23A362BA4();
    swift_bridgeObjectRelease();
    v13 = 0;
    v4 = objc_msgSend(v0, sel_attributesOfItemAtPath_error_, v3, &v13);

    v5 = v13;
    if (v4)
    {
      type metadata accessor for FileAttributeKey(0);
      sub_23A33319C(&qword_25696BF08, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23A363D20);
      v6 = sub_23A362B68();
      v7 = v5;

      v8 = (void *)*MEMORY[0x24BDD0D08];
      if (*(_QWORD *)(v6 + 16))
      {
        v9 = sub_23A35486C((uint64_t)v8);
        if ((v10 & 1) != 0)
        {
          sub_23A33F044(*(_QWORD *)(v6 + 56) + 32 * v9, (uint64_t)&v14);
        }
        else
        {
          v14 = 0u;
          v15 = 0u;
        }
      }
      else
      {
        v14 = 0u;
        v15 = 0u;
        v12 = v8;
      }

      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v15 + 1))
        swift_dynamicCast();
      else
        sub_23A348E48((uint64_t)&v14, &qword_25696C410);
    }
    else
    {
      v11 = v13;
      sub_23A3629B8();

      swift_willThrow();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A355970(void *a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;

  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = ftruncate((int)objc_msgSend(a1, sel_fileDescriptor), a2);
  if ((_DWORD)result)
  {
    v8 = result;
    if (qword_2542D0118 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v9, (uint64_t)v6);
    v11 = 0x7461636E75727466;
    v12 = 0xEB00000000203A65;
    v13 = v8;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v11, v12, 0xD000000000000062, 0x800000023A366E00, 0xD000000000000011, 0x800000023A366E70);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v6);
    sub_23A33D8BC();
    swift_allocError();
    *(_QWORD *)v10 = v8;
    *(_QWORD *)(v10 + 8) = 0;
    *(_BYTE *)(v10 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

void sub_23A355B24()
{
  id v0;
  void *v1;
  unsigned __int8 v2;
  id v3;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v1 = (void *)sub_23A362A00();
  v5[0] = 0;
  v2 = objc_msgSend(v0, sel_removeItemAtURL_error_, v1, v5);

  if ((v2 & 1) != 0)
  {
    v3 = v5[0];
  }
  else
  {
    v4 = v5[0];
    sub_23A3629B8();

    swift_willThrow();
  }

}

unint64_t sub_23A355C0C()
{
  unint64_t result;

  result = qword_25696C3F0;
  if (!qword_25696C3F0)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for MemoryAccess, &type metadata for MemoryAccess);
    atomic_store(result, (unint64_t *)&qword_25696C3F0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MemoryAccess(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A355C9C + 4 * byte_23A364D45[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A355CD0 + 4 * asc_23A364D40[v4]))();
}

uint64_t sub_23A355CD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A355CD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A355CE0);
  return result;
}

uint64_t sub_23A355CEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A355CF4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A355CF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A355D00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MemoryAccess()
{
  return &type metadata for MemoryAccess;
}

ValueMetadata *type metadata accessor for Storage()
{
  return &type metadata for Storage;
}

uint64_t getEnumTagSinglePayload for Storage.EnsureExistsResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23A355D7C + 4 * byte_23A364D4A[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for Storage.EnsureExistsResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_23A355E34 + 4 * byte_23A364D54[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A355E68 + 4 * byte_23A364D4F[v5]))();
}

uint64_t sub_23A355E68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A355E70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A355E78);
  return result;
}

uint64_t sub_23A355E84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A355E8CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A355E90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A355E98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A355EA4(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_23A355EC0(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for Storage.EnsureExistsResult()
{
  return &type metadata for Storage.EnsureExistsResult;
}

uint64_t sub_23A355EEC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for StorageError(uint64_t a1)
{
  return sub_23A355F10(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23A355F10(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s8Dendrite12StorageErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A355EEC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StorageError(uint64_t a1, uint64_t a2)
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
  sub_23A355EEC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A355F10(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for StorageError(uint64_t a1, uint64_t a2)
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
  sub_23A355F10(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorageError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23A356090(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A3560A8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StorageError()
{
  return &type metadata for StorageError;
}

uint64_t sub_23A3560D0()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C438 = 0xD000000000000041;
  unk_25696C440 = 0x800000023A366FE0;
  return result;
}

uint64_t sub_23A356130()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C448 = 0xD00000000000002ELL;
  unk_25696C450 = 0x800000023A3671F0;
  return result;
}

uint64_t sub_23A356190()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C458 = 0xD000000000000033;
  unk_25696C460 = 0x800000023A367140;
  return result;
}

uint64_t sub_23A3561F0()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C468 = 0xD000000000000025;
  unk_25696C470 = 0x800000023A367110;
  return result;
}

uint64_t sub_23A356250()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C478 = 0xD000000000000032;
  unk_25696C480 = 0x800000023A367180;
  return result;
}

uint64_t sub_23A3562B0()
{
  uint64_t result;

  sub_23A362E2C();
  result = swift_bridgeObjectRelease();
  qword_25696C488 = 0xD000000000000027;
  unk_25696C490 = 0x800000023A3671C0;
  return result;
}

_QWORD *sub_23A356310(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;

  v3 = v2;
  v6 = sub_23A362A3C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[2] = 0;
  *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC) = 0;
  *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_TRANSIENT) = -1;
  if (qword_25696BCF0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v10, (uint64_t)qword_25696E870);
  sub_23A3363A8(v13, (uint64_t)v12);
  v16 = 0x7461702074696E49;
  v17 = 0xEA00000000002068;
  sub_23A362A24();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4(v16, v17, 0xD000000000000056, 0x800000023A366F40, 0xD00000000000001ALL, 0x800000023A367220);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v12);
  v3[3] = sub_23A362A24();
  v3[4] = v14;
  sub_23A362A18();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))((uint64_t)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_folderUrl, v9, v6);
  *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_protectionType) = a2;
  return v3;
}

void sub_23A356510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;
  unsigned int v5;

  v2 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v2);
  sub_23A358DD8();
  if (!v1)
  {
    v3 = sub_23A356810() | 6;
    v4 = (const char *)(sub_23A362C10() + 32);
    swift_beginAccess();
    v5 = sqlite3_open_v2(v4, (sqlite3 **)(v0 + 16), v3, 0);
    swift_endAccess();
    swift_release();
    sub_23A356DC0(v5, 0x7243724F6E65706FLL, 0xEE00292865746165);
    sub_23A3569F8();
    sub_23A356BB0();
  }
}

uint64_t sub_23A356810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v0 = sub_23A362BC8();
  v2 = v1;
  if (v0 == sub_23A362BC8() && v2 == v3)
  {
    v6 = 0x100000;
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  v5 = sub_23A362EE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
    v8 = sub_23A362BC8();
    v10 = v9;
    if (v8 == sub_23A362BC8() && v10 == v11)
    {
      v6 = 0x200000;
    }
    else
    {
      v13 = sub_23A362EE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        return 0x200000;
      v14 = sub_23A362BC8();
      v16 = v15;
      if (v14 == sub_23A362BC8() && v16 == v17)
      {
        v6 = 3145728;
      }
      else
      {
        v18 = sub_23A362EE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          return 3145728;
        v19 = sub_23A362BC8();
        v21 = v20;
        v6 = 0x400000;
        if (v19 != sub_23A362BC8() || v21 != v22)
        {
          if ((sub_23A362EE0() & 1) != 0)
            v6 = 0x400000;
          else
            v6 = 0;
        }
      }
    }
    goto LABEL_8;
  }
  return 0x100000;
}

const char *sub_23A3569F8()
{
  uint64_t v0;
  uint64_t v1;
  sqlite3 *v2;
  unsigned int v3;
  const char *result;
  uint64_t v5;

  swift_beginAccess();
  v2 = *(sqlite3 **)(v0 + 16);
  if (v2)
  {
LABEL_2:
    v3 = sqlite3_exec(v2, "PRAGMA journal_mode=WAL", 0, 0, 0);
    result = sub_23A356DC0(v3, 0x657475636578655FLL, 0xEE00293A6C717328);
    if (!v1)
      return result;
    goto LABEL_5;
  }
  sub_23A356510();
  if (!v1)
  {
    v2 = *(sqlite3 **)(v0 + 16);
    goto LABEL_2;
  }
LABEL_5:
  if (qword_25696BCF0 != -1)
    swift_once();
  v5 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v5, (uint64_t)qword_25696E870);
  sub_23A362E2C();
  sub_23A362C58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C200);
  sub_23A362E50();
  sub_23A33E2D4(0, 0xE000000000000000, 0xD000000000000056, 0x800000023A366F40, 0xD000000000000019, 0x800000023A367050);
  swift_bridgeObjectRelease();
  return (const char *)swift_willThrow();
}

const char *sub_23A356BB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  sqlite3 *v3;
  uint64_t v4;
  unsigned int v5;
  const char *result;
  uint64_t v7;

  if (qword_25696BD58 != -1)
    swift_once();
  v2 = swift_beginAccess();
  v3 = *(sqlite3 **)(v0 + 16);
  if (v3)
  {
LABEL_4:
    v4 = sub_23A362C10();
    v5 = sqlite3_exec(v3, (const char *)(v4 + 32), 0, 0, 0);
    swift_release();
    result = sub_23A356DC0(v5, 0x657475636578655FLL, 0xEE00293A6C717328);
    if (!v1)
      return result;
    goto LABEL_7;
  }
  sub_23A356510(v2);
  if (!v1)
  {
    v3 = *(sqlite3 **)(v0 + 16);
    goto LABEL_4;
  }
LABEL_7:
  if (qword_25696BCF0 != -1)
    swift_once();
  v7 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v7, (uint64_t)qword_25696E870);
  sub_23A362E2C();
  sub_23A362C58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C200);
  sub_23A362E50();
  sub_23A33E2D4(0, 0xE000000000000000, 0xD000000000000056, 0x800000023A366F40, 0x286574617267696DLL, 0xE900000000000029);
  swift_bridgeObjectRelease();
  return (const char *)swift_willThrow();
}

const char *sub_23A356DC0(unsigned int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  const char *result;
  uint64_t v9;
  char *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;

  v7 = type metadata accessor for InternalLogger();
  result = (const char *)MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
    v11 = a1 == 100;
  else
    v11 = 1;
  if (!v11 && a1 != 101)
  {
    swift_beginAccess();
    v13 = sqlite3_extended_errcode(*(sqlite3 **)(v3 + 16));
    result = sqlite3_errstr(a1);
    if (result)
    {
      v14 = sub_23A362B98();
      v16 = v15;
      sub_23A358A24();
      if (qword_25696BCF0 != -1)
        swift_once();
      v17 = __swift_project_value_buffer(v7, (uint64_t)qword_25696E870);
      sub_23A3363A8(v17, (uint64_t)v10);
      v20 = 0;
      v21 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v20 = a2;
      v21 = a3;
      sub_23A362C58();
      v22 = a1;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      v22 = v13;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A362C58();
      swift_bridgeObjectRetain();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v20, v21, 0xD000000000000056, 0x800000023A366F40, 0xD000000000000018, 0x800000023A366FA0);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v10);
      sub_23A358CCC();
      swift_allocError();
      *(_QWORD *)v18 = a1 | (unint64_t)(v13 << 32);
      *(_QWORD *)(v18 + 8) = v14;
      *(_QWORD *)(v18 + 24) = 0;
      *(_QWORD *)(v18 + 32) = 0;
      *(_QWORD *)(v18 + 16) = v16;
      *(_BYTE *)(v18 + 40) = 0;
      return (const char *)swift_willThrow();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_23A3570A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  sqlite3 *v12;
  unsigned int v13;
  sqlite3 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  sqlite3 **v29;
  unint64_t v30;
  sqlite3_stmt *ppStmt[5];

  v28 = a1;
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)v23 - v10;
  v29 = (sqlite3 **)(v2 + 16);
  swift_beginAccess();
  v12 = *(sqlite3 **)(v2 + 16);
  if (!v12)
  {
    sub_23A356510();
    if (v3)
      return;
    v12 = *v29;
  }
  v13 = sqlite3_exec(v12, "BEGIN;", 0, 0, 0);
  sub_23A356DC0(v13, 0x657475636578655FLL, 0xEE00293A6C717328);
  if (v3)
    return;
  v26 = v2;
  v27 = v11;
  v24 = v9;
  v25 = AssociatedTypeWitness;
  ppStmt[0] = 0;
  v14 = *v29;
  if (qword_25696BD60 != -1)
    swift_once();
  v15 = sub_23A362C40();
  v16 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v16 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x23A35793CLL);
  }
  v17 = sub_23A362C10();
  v18 = sqlite3_prepare_v2(v14, (const char *)(v17 + 32), v16, ppStmt, 0);
  swift_release();
  v19 = v26;
  sub_23A356DC0(v18, 0xD000000000000011, 0x800000023A365950);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v28, a2);
  sub_23A362CD0();
  v28 = OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC;
  v20 = v25;
  v23[2] = swift_getAssociatedConformanceWitness();
  sub_23A362DCC();
  if (v30 >> 60 != 15)
  {
    v23[1] = 0x800000023A365950;
    __asm { BR              X9 }
  }
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v20);
  v21 = sqlite3_exec(*(sqlite3 **)(v19 + 16), "COMMIT;", 0, 0, 0);
  sub_23A356DC0(v21, 0x657475636578655FLL, 0xEE00293A6C717328);
  v22 = sqlite3_finalize(ppStmt[0]);
  sub_23A356DC0(v22, 0xD000000000000011, 0x800000023A365950);
  sqlite3_last_insert_rowid(*v29);
}

void sub_23A35796C(sqlite3_int64 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  sqlite3 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  sqlite3_stmt *ppStmt[5];

  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  swift_beginAccess();
  v7 = *(sqlite3 **)(v3 + 16);
  if (!v7)
  {
    sub_23A356510();
    if (v4)
      return;
    v7 = *(sqlite3 **)(v3 + 16);
  }
  ppStmt[0] = 0;
  if (qword_25696BD78 != -1)
    swift_once();
  v8 = sub_23A362C40();
  v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v9 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    JUMPOUT(0x23A357D3CLL);
  }
  v10 = sub_23A362C10();
  v11 = sqlite3_prepare_v2(v7, (const char *)(v10 + 32), v9, ppStmt, 0);
  swift_release();
  sub_23A356DC0(v11, 0xD000000000000013, 0x800000023A365600);
  if (!v4)
  {
    v12 = sqlite3_bind_int64(ppStmt[0], 2, a1);
    sub_23A356DC0(v12, 0xD000000000000013, 0x800000023A365600);
    __asm { BR              X10 }
  }
  sub_23A358A24();
  swift_willThrow();
}

const char *sub_23A357D54(const char *result, uint64_t a2, uint64_t a3, sqlite3_stmt **a4, int a5)
{
  uint64_t v5;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;

  if (result)
    v7 = a2 - (_QWORD)result;
  else
    v7 = 0;
  if (v7 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v8 = sqlite3_bind_blob(*a4, a5, result, v7, *(void (__cdecl **)(void *))(a3 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_SQLITE_STATIC));
  result = sub_23A356DC0(v8, 0xD000000000000013, 0x800000023A365600);
  if (!v5)
  {
    v9 = sqlite3_step(*a4);
    return sub_23A356DC0(v9, 0xD000000000000013, 0x800000023A365600);
  }
  return result;
}

uint64_t sub_23A357E1C(sqlite3_int64 a1)
{
  uint64_t v1;
  uint64_t v2;
  sqlite3 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  sqlite3_stmt *v9;
  unsigned int v10;
  _QWORD *v11;
  sqlite3_stmt *ppStmt[5];

  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  swift_beginAccess();
  v4 = *(sqlite3 **)(v1 + 16);
  if (!v4)
  {
    sub_23A356510();
    if (v2)
      return v1;
    v4 = *(sqlite3 **)(v1 + 16);
  }
  ppStmt[0] = 0;
  if (qword_25696BD68 != -1)
    swift_once();
  v5 = sub_23A362C40();
  v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  if (v6 > 0x7FFFFFFF)
    goto LABEL_17;
  v7 = sub_23A362C10();
  v8 = sqlite3_prepare_v2(v4, (const char *)(v7 + 32), v6, ppStmt, 0);
  swift_release();
  sub_23A356DC0(v8, 0x6469286863746566, 0xEA0000000000293ALL);
  if (!v2)
  {
    v9 = ppStmt[0];
    v10 = sqlite3_bind_int64(ppStmt[0], 1, a1);
    sub_23A356DC0(v10, 0x6469286863746566, 0xEA0000000000293ALL);
    v11 = (_QWORD *)sub_23A358330(v9);
    if (v11[2])
    {
      v1 = v11[4];
      sub_23A333494(v11[5], v11[6]);
    }
    else
    {
      v1 = 0;
    }
    swift_bridgeObjectRelease();
  }
  return v1;
}

void sub_23A35802C(sqlite3_int64 a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  sqlite3 **v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  sqlite3 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  unsigned int v23;
  sqlite3_int64 v24;
  int v25[2];
  sqlite3_stmt *ppStmt[5];

  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v8 = (sqlite3 **)(v3 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(v3 + 16) || (sub_23A356510(), !v4))
  {
    v24 = a1;
    *(_QWORD *)v25 = a3;
    if ((a2 & 1) != 0)
      v9 = 0;
    else
      v9 = 0x4F20455245485720;
    if ((a2 & 1) != 0)
      v10 = 0xE000000000000000;
    else
      v10 = 0xEF3F203D3E204449;
    if ((a3 & 0x100000000) != 0)
      v11 = 0;
    else
      v11 = 0x3F2054494D494CLL;
    if ((a3 & 0x100000000) != 0)
      v12 = 0xE000000000000000;
    else
      v12 = 0xE700000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C408);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_23A364510;
    if (qword_25696BD70 != -1)
      swift_once();
    v14 = unk_25696C470;
    *(_QWORD *)(v13 + 32) = qword_25696C468;
    *(_QWORD *)(v13 + 40) = v14;
    *(_QWORD *)(v13 + 48) = v9;
    *(_QWORD *)(v13 + 56) = v10;
    *(_QWORD *)(v13 + 64) = v11;
    *(_QWORD *)(v13 + 72) = v12;
    *(_QWORD *)(v13 + 80) = 59;
    *(_QWORD *)(v13 + 88) = 0xE100000000000000;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696C4D8);
    sub_23A35905C();
    sub_23A362B80();
    swift_bridgeObjectRelease();
    ppStmt[0] = 0;
    v15 = *v8;
    v16 = sub_23A362C40();
    v17 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
    }
    else if (v17 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (v17 <= 0x7FFFFFFF)
      {
        v18 = sub_23A362C10();
        swift_bridgeObjectRelease();
        v19 = sqlite3_prepare_v2(v15, (const char *)(v18 + 32), v17, ppStmt, 0);
        swift_release();
        sub_23A356DC0(v19, 0xD00000000000001BLL, 0x800000023A3670F0);
        if (v4)
          return;
        if ((a2 & 1) != 0)
        {
          v22 = 1;
          v21 = v25[0];
          if ((*(_QWORD *)v25 & 0x100000000) != 0)
          {
LABEL_27:
            sub_23A358330(ppStmt[0]);
            return;
          }
        }
        else
        {
          v20 = sqlite3_bind_int64(ppStmt[0], 1, v24);
          sub_23A356DC0(v20, 0xD00000000000001BLL, 0x800000023A3670F0);
          v21 = v25[0];
          v22 = 2;
          if ((*(_QWORD *)v25 & 0x100000000) != 0)
            goto LABEL_27;
        }
        v23 = sqlite3_bind_int(ppStmt[0], v22, v21);
        sub_23A356DC0(v23, 0xD00000000000001BLL, 0x800000023A3670F0);
        goto LABEL_27;
      }
LABEL_31:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
}

uint64_t sub_23A358330(sqlite3_stmt *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  sqlite3_int64 v8;
  const void *v9;
  const void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  __int128 v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  sqlite3_int64 v28;
  __int128 __dst;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sqlite3_step(a1);
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5 == 100)
  {
    v26 = 0x800000023A366F40;
    v27 = 0x800000023A366F20;
    v25 = 0x800000023A366F00;
    v24 = xmmword_23A364E70;
    do
    {
      v8 = sqlite3_column_int64(a1, 0);
      v9 = sqlite3_column_blob(a1, 1);
      if (v9)
      {
        v10 = v9;
        v11 = sqlite3_column_bytes(a1, 1);
        if (v11)
        {
          v12 = v11;
          if (v11 <= 14)
          {
            *(_QWORD *)((char *)&__dst + 6) = 0;
            *(_QWORD *)&__dst = 0;
            BYTE14(__dst) = v11;
            memcpy(&__dst, v10, v11);
            v14 = __dst;
            v15 = DWORD2(__dst) | ((unint64_t)BYTE12(__dst) << 32) | ((unint64_t)BYTE13(__dst) << 40) | ((unint64_t)BYTE14(__dst) << 48);
          }
          else
          {
            sub_23A362994();
            swift_allocObject();
            if ((_DWORD)v12 == 0x7FFFFFFF)
            {
              v13 = sub_23A362958();
              sub_23A362A78();
              v14 = swift_allocObject();
              *(_OWORD *)(v14 + 16) = v24;
              v15 = v13 | 0x8000000000000000;
            }
            else
            {
              v14 = v12 << 32;
              v15 = sub_23A362958() | 0x4000000000000000;
            }
          }
        }
        else
        {
          v14 = 0;
          v15 = 0xC000000000000000;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23A35F1C8(0, v6[2] + 1, 1, v6);
        v18 = v6[2];
        v17 = v6[3];
        if (v18 >= v17 >> 1)
          v6 = sub_23A35F1C8((_QWORD *)(v17 > 1), v18 + 1, 1, v6);
        v6[2] = v18 + 1;
        v7 = &v6[3 * v18];
        v7[4] = v8;
        v7[5] = v14;
        v7[6] = v15;
      }
      else
      {
        if (qword_25696BCF0 != -1)
          swift_once();
        v16 = __swift_project_value_buffer(v2, (uint64_t)qword_25696E870);
        sub_23A3363A8(v16, (uint64_t)v4);
        *(_QWORD *)&__dst = 0;
        *((_QWORD *)&__dst + 1) = 0xE000000000000000;
        sub_23A362E2C();
        swift_bridgeObjectRelease();
        *(_QWORD *)&__dst = 0xD000000000000014;
        *((_QWORD *)&__dst + 1) = v27;
        v28 = v8;
        sub_23A362EC8();
        sub_23A362C58();
        swift_bridgeObjectRelease();
        sub_23A33E2D4(__dst, *((unint64_t *)&__dst + 1), 0xD000000000000056, v26, 0xD000000000000013, v25);
        swift_bridgeObjectRelease();
        sub_23A336434((uint64_t)v4);
      }
    }
    while (sqlite3_step(a1) == 100);
  }
  v19 = sqlite3_finalize(a1);
  v20 = v23[0];
  v21 = v23[1];
  sub_23A356DC0(v19, 0xD000000000000013, 0x800000023A366F00);
  if (!v21)
    v20 = sub_23A3586E8((uint64_t)v6);
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_23A3586E8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_23A353EAC(0, v1, 0);
    v2 = v12;
    v4 = (unint64_t *)(a1 + 48);
    do
    {
      sub_23A333494(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696C4C8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696C400);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A353EAC(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v12;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23A353EAC(v5 > 1, v6 + 1, 1);
        v2 = v12;
      }
      v4 += 3;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = (_QWORD *)(v2 + 24 * v6);
      v7[4] = v9;
      v7[5] = v10;
      v7[6] = v11;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_23A358830(sqlite3_int64 a1)
{
  uint64_t v1;
  uint64_t v2;
  sqlite3 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  sqlite3_stmt *v9;
  unsigned int v10;
  unsigned int v11;
  sqlite3_stmt *ppStmt[5];

  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  swift_beginAccess();
  v4 = *(sqlite3 **)(v1 + 16);
  if (!v4)
  {
    sub_23A356510();
    if (v2)
      return;
    v4 = *(sqlite3 **)(v1 + 16);
  }
  ppStmt[0] = 0;
  if (qword_25696BD80 != -1)
    swift_once();
  v5 = sub_23A362C40();
  v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  if (v6 > 0x7FFFFFFF)
    goto LABEL_14;
  v7 = sub_23A362C10();
  v8 = sqlite3_prepare_v2(v4, (const char *)(v7 + 32), v6, ppStmt, 0);
  swift_release();
  sub_23A356DC0(v8, 0x69286574656C6564, 0xEB00000000293A64);
  if (!v2)
  {
    v9 = ppStmt[0];
    v10 = sqlite3_bind_int64(ppStmt[0], 1, a1);
    sub_23A356DC0(v10, 0x69286574656C6564, 0xEB00000000293A64);
    v11 = sqlite3_step(v9);
    sub_23A356DC0(v11, 0x69286574656C6564, 0xEB00000000293A64);
    sqlite3_finalize(v9);
  }
}

uint64_t sub_23A358A24()
{
  uint64_t v0;
  sqlite3 **v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v1 = (sqlite3 **)(v0 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(v0 + 16))
  {
    if (qword_25696BCF0 != -1)
      swift_once();
    v2 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v2, (uint64_t)qword_25696E870);
    sub_23A33E2EC(0x20676E69736F6C43, 0xEA00000000006264, 0xD000000000000056, 0x800000023A366F40, 0x292865736F6C63, 0xE700000000000000);
    result = sqlite3_close_v2(*v1);
    *v1 = 0;
  }
  else
  {
    if (qword_25696BCF0 != -1)
      swift_once();
    v4 = type metadata accessor for InternalLogger();
    __swift_project_value_buffer(v4, (uint64_t)qword_25696E870);
    return sub_23A33E2EC(0x20676E69736F6C43, 0xED0000706F2D6F6ELL, 0xD000000000000056, 0x800000023A366F40, 0x292865736F6C63, 0xE700000000000000);
  }
  return result;
}

uint64_t sub_23A358B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23A358A24();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC8Dendrite13SQLiteStorage_folderUrl;
  v2 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_23A358BEC()
{
  return type metadata accessor for SQLiteStorage();
}

uint64_t type metadata accessor for SQLiteStorage()
{
  uint64_t result;

  result = qword_25696C4B8;
  if (!qword_25696C4B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A358C30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A362A3C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23A358CCC()
{
  unint64_t result;

  result = qword_25696C4D0;
  if (!qword_25696C4D0)
  {
    result = MEMORY[0x23B849AC0](&unk_23A364EE4, &type metadata for SQLiteError);
    atomic_store(result, (unint64_t *)&qword_25696C4D0);
  }
  return result;
}

uint64_t sub_23A358D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, sqlite3_stmt **a5, int a6)
{
  uint64_t result;
  const char *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  result = sub_23A362964();
  v12 = (const char *)result;
  if (result)
  {
    result = sub_23A362988();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  v13 = __OFSUB__(a2, a1);
  v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  v15 = sub_23A36297C();
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  v17 = &v12[v16];
  if (v12)
    v18 = (uint64_t)v17;
  else
    v18 = 0;
  sub_23A357D54(v12, v18, a4, a5, a6);
  return swift_release();
}

id sub_23A358DD8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v0 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696BCF0 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v0, (uint64_t)qword_25696E870);
  sub_23A3363A8(v3, (uint64_t)v2);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  v10 = (id)0xD000000000000010;
  v11 = 0x800000023A3670B0;
  sub_23A362A3C();
  sub_23A3363EC();
  sub_23A362EC8();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2D4((uint64_t)v10, v11, 0xD000000000000056, 0x800000023A366F40, 0xD000000000000011, 0x800000023A3670D0);
  swift_bridgeObjectRelease();
  sub_23A336434((uint64_t)v2);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v5 = (void *)sub_23A362A00();
  v10 = 0;
  v6 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v5, 1, 0, &v10);

  if ((v6 & 1) != 0)
    return v10;
  v8 = v10;
  sub_23A3629B8();

  return (id)swift_willThrow();
}

uint64_t sub_23A359000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if (a6 && a6 != 2)
  {
    if (a6 != 1)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_23A35905C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696C4E0[0];
  if (!qword_25696C4E0[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25696C4D8);
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, qword_25696C4E0);
  }
  return result;
}

uint64_t sub_23A3590A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if (a6 && a6 != 2)
  {
    if (a6 != 1)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SQLiteError(uint64_t a1)
{
  return sub_23A359000(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23A3590A8(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_23A3590A8(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_23A359000(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_23A359000(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A35930C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_23A359314(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t sub_23A359330()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23A359374()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A35937C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicRegion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicRegion);
}

void DataFrameStream.append(_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t *v11;
  os_unfair_lock_s *v12;
  char v13;

  v3 = v1;
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (!v2)
  {
    v8 = v6;
    v9 = v7;
    v10 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC8Dendrite15DataFrameStream_guardedPendingWrites);
    v11 = (uint64_t *)&v10[4];
    v12 = v10 + 10;
    os_unfair_lock_lock(v10 + 10);
    sub_23A341DAC(v11, v3, v8, v9, &v13);
    os_unfair_lock_unlock(v12);
    if ((v13 & 1) != 0)
      sub_23A3417F0(v8, v9);
    sub_23A33350C(v8, v9);
  }
}

uint64_t DataFrameStream.iterate<A>(ignoreConversionFailures:reversed:each:)(char a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD v7[4];
  char v8;
  uint64_t v9;
  uint64_t v10;

  v7[2] = a5;
  v7[3] = a6;
  v8 = a1;
  v9 = a3;
  v10 = a4;
  return DataFrameStream.iterate(reversed:each:)(a2, (uint64_t (*)(_QWORD, unint64_t, uint64_t, unint64_t))sub_23A359694, (uint64_t)v7);
}

uint64_t sub_23A359504(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t (*a6)(uint64_t, uint64_t, char *), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t (*v27)(uint64_t, uint64_t, char *);
  unsigned int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v26[1] = a7;
  v27 = a6;
  v30 = a5;
  v29 = a2;
  v28 = a1;
  v13 = sub_23A362DC0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v26 - v16;
  v31 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a4;
  v21 = a8;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16))(a3, v20, a8, a9);
  if (!v9)
  {
    v22 = v28;
    v23 = v29;
    v21 = v30;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v17, 1, a8) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    }
    else
    {
      v24 = v31;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v19, v17, a8);
      v21 = v27(v22, v23, v19);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v19, a8);
    }
  }
  return v21 & 1;
}

uint64_t sub_23A359694(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A359504(a1, a2, a3, a4, *(unsigned __int8 *)(v4 + 32), *(uint64_t (**)(uint64_t, uint64_t, char *))(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24)) & 1;
}

void DataFrameStream.message<A>(forIdentifier:)(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  DataFrameStream.frameData(forIdentifier:)(a1);
  if (!v4)
  {
    v10 = v9;
    if (v9 >> 60 == 15)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
    }
    else
    {
      v11 = v8;
      (*(void (**)(void))(a3 + 16))();
      sub_23A33A628(v11, v10);
    }
  }
}

void DataFrameStream.mutateMessage<A, B>(forIdentifier:_:)(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  _QWORD v8[8];

  v8[2] = a4;
  v8[3] = a5;
  v8[4] = a6;
  v8[5] = a7;
  v8[6] = a2;
  v8[7] = a3;
  DataFrameStream.mutateFrame(forIdentifier:_:)(a1, (void (*)(void))sub_23A35991C, (uint64_t)v8, a8);
}

uint64_t sub_23A3597A8(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void (*v23)(char *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v23 = a3;
  v24 = a8;
  v22 = a4;
  v25 = a6;
  v12 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A362DC0();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v22 - v17;
  v19 = v26;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 16))(a1, a2, a5, a7);
  if (!v19)
  {
    v23(v18);
    v20 = v25;
    a5 = (*(uint64_t (**)(uint64_t))(v24 + 8))(v25);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  return a5;
}

uint64_t sub_23A35991C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A3597A8(a1, a2, *(void (**)(char *))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

void DataFrameStream.prune<A>(ignoreConversionFailures:each:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[4];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v5[2] = a4;
  v5[3] = a5;
  v6 = a1;
  v7 = a2;
  v8 = a3;
  DataFrameStream.prune(each:)((uint64_t (*)(uint64_t, char *, uint64_t, unint64_t))sub_23A359B04, (uint64_t)v5);
}

uint64_t sub_23A359970(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t (*a6)(uint64_t, uint64_t, char *), uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  _QWORD v28[2];
  int v29;
  uint64_t (*v30)(uint64_t, uint64_t, char *);
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;

  v28[1] = a7;
  v30 = a6;
  v29 = a5;
  v32 = a2;
  v31 = a1;
  v12 = sub_23A362DC0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v28 - v15;
  v17 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = v33;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16))(a3, a4, a8, a9);
  if (!v20)
  {
    v22 = v31;
    v23 = v32;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a8) == 1)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      v24 = 0;
      LOBYTE(v25) = v29;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a8);
      v26 = v30(v22, v23, v19);
      v24 = v26 & 1;
      v25 = (v26 >> 8) & 1;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a8);
    }
    if ((v25 & 1) != 0)
      v27 = 256;
    else
      v27 = 0;
    return v27 | v24;
  }
  return result;
}

uint64_t sub_23A359B04(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A359970(a1, a2, a3, a4, *(unsigned __int8 *)(v4 + 32), *(uint64_t (**)(uint64_t, uint64_t, char *))(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t DataFrameStream.last<A>(ignoreConversionFailures:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD v7[6];
  _BYTE v8[16];
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  _QWORD *v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a3, 1, 1, a1);
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v9 = a1;
  v10 = a2;
  v11 = 1;
  v12 = sub_23A359BC8;
  v13 = v7;
  return DataFrameStream.iterate(reversed:each:)(1, (uint64_t (*)(_QWORD, unint64_t, uint64_t, unint64_t))sub_23A359694, (uint64_t)v8);
}

uint64_t sub_23A359BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A359C78(a1, a2, a3) & 1;
}

uint64_t DataFrameStream.first<A>(ignoreConversionFailures:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  _QWORD v7[6];
  _BYTE v8[16];
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  _QWORD *v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a3, 1, 1, a1);
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v9 = a1;
  v10 = a2;
  v11 = 1;
  v12 = sub_23A359BC8;
  v13 = v7;
  return DataFrameStream.iterate(reversed:each:)(0, (uint64_t (*)(_QWORD, unint64_t, uint64_t, unint64_t))sub_23A359694, (uint64_t)v8);
}

uint64_t sub_23A359C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 32);
  v7 = sub_23A362DC0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, a3, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v5);
  return 0;
}

uint64_t static Device.firstUnlock()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_25696C570 + dword_25696C570);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A3371B0;
  return v3();
}

uint64_t sub_23A359D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];

  v0 = sub_23A362D78();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23A362D60();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A362B5C();
  MEMORY[0x24BDAC7A8](v5);
  sub_23A35A0E4();
  sub_23A362B50();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5758], v1);
  v7[1] = MEMORY[0x24BEE4AF8];
  sub_23A35A120();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C588);
  sub_23A35A168();
  sub_23A362DF0();
  result = sub_23A362D84();
  qword_25696E8E8 = result;
  return result;
}

uint64_t sub_23A359EE8()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D1100);
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  qword_2542D12C0 = result;
  return result;
}

uint64_t sub_23A359F1C()
{
  return swift_task_switch();
}

uint64_t sub_23A359F30()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;

  if (qword_2542D1140 != -1)
    swift_once();
  v1 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
  v2 = swift_retain();
  LOBYTE(v1) = *(_BYTE *)v1(v2);
  swift_release();
  if ((v1 & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)qword_2542D12C0 + 136);
    v4 = swift_retain();
    *(_BYTE *)v3(v4) = 1;
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_25696BD88 != -1)
    swift_once();
  v6 = (void *)qword_25696E8E8;
  type metadata accessor for FirstUnlockObserver();
  v7 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v7;
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = 0;
  *(_BYTE *)(v7 + 48) = 0;
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = v6;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v10;
  *v10 = v0;
  v10[1] = sub_23A35A084;
  return sub_23A34BF84();
}

uint64_t sub_23A35A084()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

ValueMetadata *type metadata accessor for Device()
{
  return &type metadata for Device;
}

unint64_t sub_23A35A0E4()
{
  unint64_t result;

  result = qword_25696C578;
  if (!qword_25696C578)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696C578);
  }
  return result;
}

unint64_t sub_23A35A120()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696C580;
  if (!qword_25696C580)
  {
    v1 = sub_23A362D78();
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE5940], v1);
    atomic_store(result, (unint64_t *)&qword_25696C580);
  }
  return result;
}

unint64_t sub_23A35A168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696C590;
  if (!qword_25696C590)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25696C588);
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25696C590);
  }
  return result;
}

uint64_t sub_23A35A1B4()
{
  uint64_t v0;
  uint64_t *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25696BD98 != -1)
    swift_once();
  v1 = (uint64_t *)(qword_25696E8F0 + 16);
  v2 = (os_unfair_lock_s *)(qword_25696E8F0 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  sub_23A35A878(v1, v0);
  os_unfair_lock_unlock(v2);
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL;
  v4 = sub_23A362A3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_23A35A27C()
{
  return type metadata accessor for GlobalFileLockRegistration();
}

uint64_t type metadata accessor for GlobalFileLockRegistration()
{
  uint64_t result;

  result = qword_25696C598;
  if (!qword_25696C598)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A35A2C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A362A3C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A35A32C()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C5A8);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4B00];
  qword_25696E8F0 = result;
  return result;
}

void sub_23A35A36C(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, char *, uint64_t);
  uint64_t v30;
  void *v31;
  id v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  char v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v42 = a3;
  v6 = sub_23A362A3C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = *(_QWORD *)(*a1 + 16);
  v45 = v3;
  if (v14 && (v15 = sub_23A3548EC(a2), (v16 & 1) != 0))
  {
    v17 = *(_QWORD *)(v13 + 56) + 16 * v15;
    v18 = *(_DWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v20(v9, a2, v6);
    if (v18 != -1)
    {
      swift_retain_n();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v43 = *a1;
      *a1 = 0x8000000000000000;
      sub_23A347954(v18 + 1, v19, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
      *a1 = v43;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_release();
      v20(v9, a2, v6);
      type metadata accessor for GlobalFileLockRegistration();
      v22 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v22 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL, v9, v6);
LABEL_13:
      *v42 = v22;
      return;
    }
    __break(1u);
  }
  else
  {
    v41 = a1;
    if (qword_25696BD10 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v10, (uint64_t)qword_25696E8B8);
    sub_23A3363A8(v23, (uint64_t)v12);
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_23A362E2C();
    sub_23A362C58();
    sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    sub_23A33E2D4(v43, v44, 0xD000000000000058, 0x800000023A3672D0, 0x7265747369676572, 0xEE00293A726F6628);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v12);
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v24(v9, a2, v6);
    type metadata accessor for FileLock();
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + OBJC_IVAR____TtC8Dendrite8FileLock_handle) = 0;
    v26 = OBJC_IVAR____TtC8Dendrite8FileLock_fm;
    *(_QWORD *)(v25 + v26) = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v27 = v25 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL;
    v28 = a2;
    v29 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
    v29(v25 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL, v9, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v27, 0, 1, v6);
    v30 = v45;
    v31 = (void *)sub_23A3616BC();
    if (v30)
    {
      swift_release();
      return;
    }
    v40 = v29;
    v45 = 0;
    v32 = v31;
    v33 = flock((int)objc_msgSend(v32, sel_fileDescriptor), 2);
    v34 = v28;
    v35 = v41;
    if (!v33)
    {
LABEL_12:

      v24(v9, v34, v6);
      swift_retain();
      v36 = swift_isUniquelyReferenced_nonNull_native();
      v43 = *v35;
      *v35 = 0x8000000000000000;
      sub_23A347954(1, v25, (uint64_t)v9, v36);
      *v35 = v43;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_release();
      v24(v9, v34, v6);
      type metadata accessor for GlobalFileLockRegistration();
      v22 = swift_allocObject();
      v40(v22 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL, v9, v6);
      goto LABEL_13;
    }
    while (MEMORY[0x23B8490B8]() != 4)
    {
      if (!flock((int)objc_msgSend(v32, sel_fileDescriptor), 2))
        goto LABEL_12;
    }
    v37 = MEMORY[0x23B8490B8]();
    sub_23A35B214();
    swift_allocError();
    *(_DWORD *)v38 = v37;
    *(_BYTE *)(v38 + 4) = 0;
    swift_willThrow();
    swift_release();

  }
}

unint64_t sub_23A35A878(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  unint64_t v18;

  v4 = type metadata accessor for InternalLogger();
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    v9 = a2 + OBJC_IVAR____TtC8Dendrite26GlobalFileLockRegistration_lockedURL;
    result = sub_23A3548EC(v9);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(v8 + 56) + 16 * result;
      v12 = *(_QWORD *)(v11 + 8);
      v13 = *(_DWORD *)v11 - 1;
      if (*(_DWORD *)v11 == 1)
      {
        v14 = qword_25696BD10;
        swift_retain();
        if (v14 != -1)
          swift_once();
        v15 = __swift_project_value_buffer(v4, (uint64_t)qword_25696E8B8);
        sub_23A3363A8(v15, (uint64_t)v7);
        v17 = 0;
        v18 = 0xE000000000000000;
        sub_23A362E2C();
        swift_bridgeObjectRelease();
        v17 = 0xD00000000000001FLL;
        v18 = 0x800000023A3672B0;
        sub_23A362A3C();
        sub_23A348CB8((unint64_t *)&qword_2542D0138, MEMORY[0x24BDCDB28]);
        sub_23A362EC8();
        sub_23A362C58();
        swift_bridgeObjectRelease();
        sub_23A33E2D4(v17, v18, 0xD000000000000058, 0x800000023A3672D0, 0xD000000000000015, 0x800000023A367330);
        swift_bridgeObjectRelease();
        sub_23A336434((uint64_t)v7);
        sub_23A35ABEC(v9);
        swift_release();
        return swift_release();
      }
      else if (*(_DWORD *)v11)
      {
        swift_retain_n();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v17 = *a1;
        *a1 = 0x8000000000000000;
        sub_23A347954(v13, v12, v9, isUniquelyReferenced_nonNull_native);
        *a1 = v17;
        swift_release();
        return swift_bridgeObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

double sub_23A35AAD0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double result;
  uint64_t v15;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A3548EC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v15 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23A347C14();
      v9 = v15;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_23A362A3C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56) + 48 * v6;
    v13 = *(_DWORD *)(v12 + 40);
    *(_QWORD *)a2 = *(_QWORD *)v12;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)(v12 + 8);
    *(_OWORD *)(a2 + 24) = *(_OWORD *)(v12 + 24);
    *(_DWORD *)(a2 + 40) = v13;
    sub_23A35ACDC(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(a2 + 28) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_23A35ABEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_23A3548EC(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23A347EE4();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_23A362A3C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(unsigned int *)(*(_QWORD *)(v7 + 56) + 16 * v4);
  sub_23A35AF88(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_23A35ACDC(int64_t a1, uint64_t a2)
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
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  __int128 *v23;
  __int128 *v24;
  BOOL v25;
  __int128 v26;
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

  v4 = sub_23A362A3C();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23A362DFC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_23A348CB8(&qword_25696C228, MEMORY[0x24BDCDAF0]);
        v17 = sub_23A362B74();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v36)
        {
          if (v18 >= v36 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (__int128 *)(v22 + 48 * a1);
            v24 = (__int128 *)(v22 + 48 * v10);
            if (48 * a1 < (uint64_t)(48 * v10) || v23 >= v24 + 3 || (v25 = a1 == v10, a1 = v10, !v25))
            {
              v26 = *v24;
              v27 = v24[2];
              v23[1] = v24[1];
              v23[2] = v27;
              *v23 = v26;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v36 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        v12 = v14;
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

unint64_t sub_23A35AF88(int64_t a1, uint64_t a2)
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
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;

  v4 = sub_23A362A3C();
  v34 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23A362DFC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v32(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_23A348CB8(&qword_25696C228, MEMORY[0x24BDCDAF0]);
        v17 = sub_23A362B74();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 >= v33 && a1 >= (uint64_t)v18)
          {
LABEL_17:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_OWORD *)(v22 + 16 * a1);
            v24 = (_OWORD *)(v22 + 16 * v10);
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v33 || a1 >= (uint64_t)v18)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23A35B214()
{
  unint64_t result;

  result = qword_25696C5B0;
  if (!qword_25696C5B0)
  {
    result = MEMORY[0x23B849AC0](&unk_23A365410, &type metadata for FileLockError);
    atomic_store(result, (unint64_t *)&qword_25696C5B0);
  }
  return result;
}

uint64_t MemoryMappedRegion.__allocating_init(filePath:requestedByteSize:minimumByteSize:access:)(uint64_t a1, int a2, int a3, _BYTE *a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)(a1, a2, a3, a4);
  return v8;
}

uint64_t MemoryMappedRegion.write<A>(structInstance:at:)(const void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  size_t v19;
  uint64_t v20;
  _QWORD v22[4];
  uint64_t v23;
  unint64_t v24;

  v9 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = a2 + v13;
  if (__OFADD__(a2, v13))
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v14 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v4 = v3[3];
  v5 = v3[4];
  v16 = v4 <= a2 && v5 >= a2;
  if (v14 < v4 || v5 < v14 || !v16)
  {
    if (qword_2542D0118 == -1)
    {
LABEL_19:
      v20 = __swift_project_value_buffer(v9, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v20, (uint64_t)v11);
      v23 = 0;
      v24 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v23 = 0xD000000000000011;
      v24 = 0x800000023A3669F0;
      v22[2] = v5;
      v22[3] = v4;
      v22[0] = 0;
      v22[1] = 0xE000000000000000;
      sub_23A362E50();
      sub_23A362C58();
      sub_23A362E50();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v23, v24, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000019, 0x800000023A366A70);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v11);
      return 0;
    }
LABEL_24:
    swift_once();
    goto LABEL_19;
  }
  v19 = *(_QWORD *)(v12 + 64);
  if ((v19 & 0x8000000000000000) != 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  memcpy((void *)(v3[2] + a2), a1, v19);
  return v14;
}

void MemoryMappedRegion.write(data:at:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X11 }
}

uint64_t sub_23A35B578@<X0>(int a1@<W8>)
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
  BOOL v11;
  uint64_t v14;

  v9 = v4 + BYTE6(v2);
  if (__OFADD__(v4, BYTE6(v2)))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v9 < v4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_18;
  }
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v11 = v6 <= v4 && v7 >= v4;
  if (v9 >= v6 && v7 >= v9 && v11)
    __asm { BR              X10 }
  if (qword_2542D0118 != -1)
    goto LABEL_21;
LABEL_18:
  v14 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D12A8);
  sub_23A3363A8(v14, v3);
  *(_QWORD *)(v8 - 96) = 0;
  *(_QWORD *)(v8 - 88) = 0xE000000000000000;
  sub_23A362E2C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 - 96) = 0xD000000000000011;
  *(_QWORD *)(v8 - 88) = 0x800000023A3669F0;
  *(_QWORD *)(v8 - 112) = v7;
  *(_QWORD *)(v8 - 104) = v6;
  *(_QWORD *)(v8 - 128) = 0;
  *(_QWORD *)(v8 - 120) = 0xE000000000000000;
  sub_23A362E50();
  sub_23A362C58();
  sub_23A362E50();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A33E2E0(*(_QWORD *)(v8 - 96), *(_QWORD *)(v8 - 88), 0xD00000000000005FLL, 0x800000023A366A10, 0x6164286574697277, 0xEF293A74613A6174);
  swift_bridgeObjectRelease();
  sub_23A336434(v3);
  return 0;
}

Swift::Void __swiftcall MemoryMappedRegion.sync(used:)(Swift::Int used)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12[2];

  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = msync(*(void **)(v1 + 16), used, 1);
  if (v6)
  {
    v7 = v6;
    if (qword_2542D0118 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v8, (uint64_t)v5);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_23A362E2C();
    swift_bridgeObjectRelease();
    strcpy((char *)v12, "msync return: ");
    HIBYTE(v12[1]) = -18;
    v11 = v7;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    v9 = sub_23A362C58();
    v11 = MEMORY[0x23B8490B8](v9);
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2E0(v12[0], v12[1], 0xD00000000000005FLL, 0x800000023A366A10, 0x65737528636E7973, 0xEB00000000293A64);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v5);
  }
}

uint64_t MemoryMappedRegion.init(filePath:requestedByteSize:minimumByteSize:access:)(uint64_t a1, int a2, int a3, _BYTE *a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  id v37;
  int i;
  uint64_t v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  size_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;

  v6 = v4;
  v74 = *v6;
  v11 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (char)*a4;
  LOBYTE(v78) = *a4;
  v15 = sub_23A355660(a1, &v78);
  if (v5)
  {
LABEL_21:
    v26 = sub_23A362A3C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
LABEL_22:
    swift_deallocPartialClassInstance();
    return (uint64_t)v6;
  }
  v16 = v15;
  LODWORD(v73) = a2;
  LODWORD(v72) = a3;
  if (!v15)
  {
LABEL_18:
    if (qword_2542D0118 != -1)
      swift_once();
    __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
    sub_23A33E2E0(0xD000000000000019, 0x800000023A366DE0, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000038, 0x800000023A3673A0);
    sub_23A35CD38();
    swift_allocError();
    *(_DWORD *)v25 = 0;
    *(_BYTE *)(v25 + 4) = 1;
    swift_willThrow();
    goto LABEL_21;
  }
  sub_23A355728();
  if ((v18 & 1) != 0)
  {

    goto LABEL_18;
  }
  v19 = v17;
  v20 = NSRoundUpToMultipleOfPageSize(v73);
  if ((v20 & 0x8000000000000000) == 0 && !HIDWORD(v20))
  {
    v71 = v16;
    if (v19)
    {
      if (v19 >= v20)
      {
LABEL_13:
        if (v20 >= v72)
        {
          v6[3] = 0;
          v6[4] = v20;
          v73 = v20;
          if (qword_2542D0118 != -1)
            swift_once();
          v72 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
          sub_23A3363A8(v72, (uint64_t)v13);
          v78 = 0;
          v79 = 0xE000000000000000;
          sub_23A362E2C();
          swift_bridgeObjectRelease();
          v78 = 0xD000000000000016;
          v79 = 0x800000023A3673E0;
          LODWORD(v75) = objc_msgSend(v71, sel_fileDescriptor);
          sub_23A362EC8();
          sub_23A362C58();
          swift_bridgeObjectRelease();
          sub_23A362C58();
          v39 = v6[4];
          v80 = v6[3];
          v76 = 0xE000000000000000;
          v77 = v39;
          v75 = 0;
          sub_23A362E50();
          sub_23A362C58();
          sub_23A362E50();
          sub_23A362C58();
          swift_bridgeObjectRelease();
          v69 = (id)0x800000023A366A10;
          v70 = 0xD00000000000005FLL;
          sub_23A33E2D4(v78, v79, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000038, 0x800000023A3673A0);
          swift_bridgeObjectRelease();
          sub_23A336434((uint64_t)v13);
          v40 = dword_23A36506C[v14];
          v41 = objc_msgSend(v71, sel_fileDescriptor);
          v42 = mmap(0, v73, v40, 1, v41, 0);
          if (v42)
          {
            v43 = v42;
            v44 = sub_23A362B20();
            if (!v44 || v43 != (void *)v44)
            {

              v50 = sub_23A362A3C();
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 8))(a1, v50);
              v6[2] = (uint64_t)v43;
              return (uint64_t)v6;
            }
          }
          LODWORD(v78) = MEMORY[0x23B8490B8]();
          v45 = sub_23A362EC8();
          sub_23A33E2E0(v45, v46, v70, (uint64_t)v69, 0xD000000000000038, 0x800000023A3673A0);
          v47 = swift_bridgeObjectRelease();
          v48 = MEMORY[0x23B8490B8](v47);
          sub_23A35CD38();
          swift_allocError();
          *(_DWORD *)v49 = v48;
          *(_BYTE *)(v49 + 4) = 0;
        }
        else
        {
          v22 = v20;
          if (qword_2542D0118 != -1)
            swift_once();
          v23 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
          sub_23A3363A8(v23, (uint64_t)v13);
          v78 = 0;
          v79 = 0xE000000000000000;
          sub_23A362E2C();
          sub_23A362C58();
          LODWORD(v75) = v22;
          sub_23A362EC8();
          sub_23A362C58();
          swift_bridgeObjectRelease();
          sub_23A362C58();
          LODWORD(v75) = v73;
          sub_23A362EC8();
          sub_23A362C58();
          swift_bridgeObjectRelease();
          sub_23A362C58();
          LODWORD(v75) = v72;
          sub_23A362EC8();
          sub_23A362C58();
          swift_bridgeObjectRelease();
          sub_23A33E2D4(v78, v79, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000038, 0x800000023A3673A0);
          swift_bridgeObjectRelease();
          sub_23A336434((uint64_t)v13);
          sub_23A35CD38();
          swift_allocError();
          *(_DWORD *)v24 = 1;
          *(_BYTE *)(v24 + 4) = 1;
        }
        swift_willThrow();

        goto LABEL_21;
      }
    }
    else
    {
      v67 = v20;
      type metadata accessor for FileLock();
      v28 = v16;
      v29 = swift_allocObject();
      v30 = OBJC_IVAR____TtC8Dendrite8FileLock_handle;
      *(_QWORD *)(v29 + OBJC_IVAR____TtC8Dendrite8FileLock_handle) = 0;
      v70 = OBJC_IVAR____TtC8Dendrite8FileLock_fm;
      v69 = (id)objc_opt_self();
      v68 = v28;
      v31 = objc_msgSend(v69, sel_defaultManager);
      *(_QWORD *)(v29 + v70) = v31;
      v32 = *(void **)(v29 + v30);
      *(_QWORD *)(v29 + v30) = v28;

      v33 = v29 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL;
      v34 = (_QWORD *)sub_23A362A3C();
      v35 = *(v34 - 1);
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 56);
      v69 = v34;
      v36(v33, 1, 1);
      v70 = v29;
      v37 = (id)sub_23A3616BC();
      for (i = objc_msgSend(v37, sel_fileDescriptor);
            flock(i, 2);
            i = objc_msgSend(v37, sel_fileDescriptor))
      {
        if (MEMORY[0x23B8490B8]() == 4)
        {
          v53 = MEMORY[0x23B8490B8]();
          sub_23A35B214();
          swift_allocError();
          *(_DWORD *)v54 = v53;
          *(_BYTE *)(v54 + 4) = 0;
          swift_willThrow();

          (*(void (**)(uint64_t, id))(v35 + 8))(a1, v69);
          v55 = v70;
          swift_setDeallocating();
          v56 = (id)sub_23A3616BC();
          flock((int)objc_msgSend(v56, sel_fileDescriptor), 8);

          sub_23A336CFC(v55 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);
          swift_deallocClassInstance();
          goto LABEL_22;
        }
      }

      sub_23A355728();
      if ((v52 & 1) != 0)
      {
        sub_23A35CD38();
        swift_allocError();
        *(_DWORD *)v57 = 0;
        *(_BYTE *)(v57 + 4) = 1;
        swift_willThrow();
        v58 = v70;
        swift_setDeallocating();
        v60 = (id)sub_23A3616BC();
        flock((int)objc_msgSend(v60, sel_fileDescriptor), 8);

        v61 = v68;
        v62 = v69;
        sub_23A336CFC(v58 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);

        swift_deallocClassInstance();
        (*(void (**)(uint64_t, id))(v35 + 8))(a1, v62);
        goto LABEL_22;
      }
      if (v51)
      {
        v66 = v51;
      }
      else
      {
        v59 = v67;
        sub_23A355970(v68, v67);
        v66 = v59;
      }
      v63 = (id)sub_23A3616BC();
      flock((int)objc_msgSend(v63, sel_fileDescriptor), 8);

      swift_setDeallocating();
      v64 = (id)sub_23A3616BC();
      flock((int)objc_msgSend(v64, sel_fileDescriptor), 8);

      v65 = v70;
      sub_23A336CFC(v70 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);

      swift_deallocClassInstance();
      v19 = v66;
      LODWORD(v20) = v67;
      if (v66 >= v67)
        goto LABEL_13;
    }
    if (qword_2542D0118 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D12A8);
    sub_23A3363A8(v21, (uint64_t)v13);
    v78 = 0;
    v79 = 0xE000000000000000;
    sub_23A362E2C();
    sub_23A362C58();
    LODWORD(v75) = v73;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A362C58();
    v75 = v19;
    sub_23A362EC8();
    sub_23A362C58();
    swift_bridgeObjectRelease();
    sub_23A33E2D4(v78, v79, 0xD00000000000005FLL, 0x800000023A366A10, 0xD000000000000038, 0x800000023A3673A0);
    swift_bridgeObjectRelease();
    sub_23A336434((uint64_t)v13);
    if ((v19 & 0x8000000000000000) == 0 && !HIDWORD(v19))
    {
      LODWORD(v20) = v19;
      goto LABEL_13;
    }
  }
  result = sub_23A362E5C();
  __break(1u);
  return result;
}

uint64_t MemoryMappedRegion.read(at:count:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD);
  uint64_t v18;

  v5 = sub_23A362A60();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFADD__(a1, a2))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = v2[3];
  v11 = v2[4];
  v12 = __OFSUB__(v11, v10);
  v13 = v11 - v10;
  if (v12)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (a1 + a2 >= v13)
    return 0;
  v14 = v2[2] + a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDCDB98], v5);
  sub_23A362A54();
  if (a2)
  {
    sub_23A362994();
    swift_allocObject();
    swift_retain();
    v15 = sub_23A36294C();
    v16 = sub_23A35CD7C(v15, a2);
    swift_release();
  }
  else
  {
    v17 = (void (*)(uint64_t, _QWORD))sub_23A362A54();
    v17(v14, 0);
    swift_release();
    swift_release();
    v16 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v16;
}

uint64_t MemoryMappedRegion.deinit()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;

  v2 = v0;
  v3 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_7;
  }
  v8 = munmap(*(void **)(v2 + 16), v7 - v6);
  if (v8)
  {
    v1 = v8;
    if (qword_2542D0118 == -1)
    {
LABEL_4:
      v9 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D12A8);
      sub_23A3363A8(v9, (uint64_t)v5);
      v14 = 0;
      v15 = 0xE000000000000000;
      sub_23A362E2C();
      swift_bridgeObjectRelease();
      v14 = 0x722070616D6E756DLL;
      v15 = 0xEF203A6E72757465;
      v13 = v1;
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      v10 = sub_23A362C58();
      v13 = MEMORY[0x23B8490B8](v10);
      sub_23A362EC8();
      sub_23A362C58();
      swift_bridgeObjectRelease();
      sub_23A33E2E0(v14, v15, 0xD00000000000005FLL, 0x800000023A366A10, 0x74696E696564, 0xE600000000000000);
      swift_bridgeObjectRelease();
      sub_23A336434((uint64_t)v5);
      return v2;
    }
LABEL_7:
    swift_once();
    goto LABEL_4;
  }
  return v2;
}

uint64_t MemoryMappedRegion.__deallocating_deinit()
{
  MemoryMappedRegion.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A35CC78(_BYTE *__src, _BYTE *a2)
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

unint64_t sub_23A35CD38()
{
  unint64_t result;

  result = qword_25696C5B8;
  if (!qword_25696C5B8)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for MemoryMappingError, &type metadata for MemoryMappingError);
    atomic_store(result, (unint64_t *)&qword_25696C5B8);
  }
  return result;
}

uint64_t sub_23A35CD7C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;

  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF)
      return a2 << 32;
    sub_23A362A78();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = (_BYTE *)sub_23A362964();
    if (!v4)
    {
LABEL_10:
      v5 = sub_23A36297C();
      if (v5 >= a2)
        v6 = a2;
      else
        v6 = v5;
      v7 = &v4[v6];
      if (v4)
        v8 = v7;
      else
        v8 = 0;
      v3 = sub_23A35CC78(v4, v8);
      swift_release();
      return v3;
    }
    result = sub_23A362988();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for MemoryMappingError()
{
  return &type metadata for MemoryMappingError;
}

uint64_t type metadata accessor for MemoryMappedRegion()
{
  return objc_opt_self();
}

uint64_t method lookup function for MemoryMappedRegion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MemoryMappedRegion.__allocating_init(filePath:requestedByteSize:minimumByteSize:access:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_23A35CEB4()
{
  uint64_t v0;

  sub_23A35D0A0(v0 + OBJC_IVAR____TtC8Dendrite22RollingStreamContainer_storageContainer);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A35D0DC(v0 + OBJC_IVAR____TtC8Dendrite22RollingStreamContainer__currentContainerId);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23A35CF44()
{
  return type metadata accessor for RollingStreamContainer();
}

uint64_t type metadata accessor for RollingStreamContainer()
{
  uint64_t result;

  result = qword_25696C5F0;
  if (!qword_25696C5F0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A35CF88()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for StorageContainer();
  if (v0 <= 0x3F)
  {
    sub_23A35D04C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_23A35D04C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25696C600[0])
  {
    sub_23A362AE4();
    v0 = sub_23A362DC0();
    if (!v1)
      atomic_store(v0, qword_25696C600);
  }
}

uint64_t sub_23A35D0A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StorageContainer();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A35D0DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D10F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for FrameStorageLayout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FrameStorageLayout);
}

uint64_t ProtoTagPath.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

BOOL static ProtoTagPath.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23A35D5E8(*a1, *a2);
}

BOOL static ProtoTagPath.FormatError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ProtoTagPath.FormatError.hash(into:)()
{
  return sub_23A362F40();
}

uint64_t ProtoTagPath.FormatError.hashValue.getter()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t ProtoTagPath.init(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t i;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t result;
  _BYTE *v21;
  _QWORD *v22;
  _BYTE v23[16];
  _QWORD *v24;
  char v25;
  _QWORD v26[2];
  uint64_t v27;

  v26[0] = 46;
  v24 = v26;
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)sub_23A35D840(0x7FFFFFFFFFFFFFFFLL, 1, sub_23A35E73C, (uint64_t)v23, a1, a2);
  swift_bridgeObjectRelease();
  v7 = v6[2];
  if (v7)
  {
    v27 = MEMORY[0x24BEE4AF8];
    sub_23A353F00(0, v7, 0);
    v9 = v6[4];
    v8 = v6[5];
    v10 = v6[7];
    if ((v8 ^ v9) < 0x4000)
    {
LABEL_22:
      swift_bridgeObjectRetain();
LABEL_23:
      sub_23A35E790();
      swift_allocError();
      *v21 = 0;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_release();
    }
    else
    {
      v22 = a3;
      v11 = v7 - 1;
      for (i = 6; ; i += 4)
      {
        v13 = &v6[i];
        v14 = v6[i];
        swift_bridgeObjectRetain();
        if ((v10 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          v8 = sub_23A35DF10(v9, v8, v14, v10, 10);
          swift_bridgeObjectRelease();
          if ((v8 & 0x100000000) != 0)
            goto LABEL_23;
        }
        else
        {
          if ((v10 & 0x2000000000000000) != 0)
          {
            v26[0] = v14;
            v26[1] = v10 & 0xFFFFFFFFFFFFFFLL;
            v15 = v26;
          }
          else if ((v14 & 0x1000000000000000) != 0)
          {
            v15 = (_QWORD *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            v15 = (_QWORD *)sub_23A362E44();
          }
          v16 = sub_23A35E85C((uint64_t)v15, v9, v8, v14, v10, 10);
          LODWORD(v8) = v16;
          v25 = BYTE4(v16) & 1;
          if ((v16 & 0x100000000) != 0)
            goto LABEL_23;
        }
        swift_bridgeObjectRelease();
        v17 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A353F00(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v27;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_23A353F00(v18 > 1, v19 + 1, 1);
          v17 = v27;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        *(_DWORD *)(v17 + 4 * v19 + 32) = v8;
        if (!v11)
          break;
        v9 = v13[2];
        v8 = v13[3];
        v10 = v13[5];
        if ((v8 ^ v9) < 0x4000)
          goto LABEL_22;
        --v11;
      }
      result = swift_bridgeObjectRelease();
      *v22 = v17;
    }
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *a3 = MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t ProtoTagPath.description.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1)
  {
    v10 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A353E90(0, v1, 0);
    v2 = 0;
    do
    {
      v3 = sub_23A362EC8();
      v5 = v4;
      v7 = *(_QWORD *)(v10 + 16);
      v6 = *(_QWORD *)(v10 + 24);
      if (v7 >= v6 >> 1)
        sub_23A353E90(v6 > 1, v7 + 1, 1);
      ++v2;
      *(_QWORD *)(v10 + 16) = v7 + 1;
      v8 = v10 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v3;
      *(_QWORD *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C4D8);
  sub_23A35905C();
  sub_23A362B80();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  swift_bridgeObjectRelease();
  sub_23A362C58();
  return 8315;
}

BOOL sub_23A35D5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  int *v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (int *)(a1 + 36);
  v6 = (int *)(a2 + 36);
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t ProtoTagPath.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  result = sub_23A362F40();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = v1 + 32;
    do
    {
      v4 += 4;
      result = sub_23A362F58();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t ProtoTagPath.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_23A362F34();
  sub_23A362F40();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      v3 += 4;
      sub_23A362F58();
      --v2;
    }
    while (v2);
  }
  return sub_23A362F64();
}

uint64_t sub_23A35D720()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_23A362F34();
  v2 = *(_QWORD *)(v1 + 16);
  sub_23A362F40();
  if (v2)
  {
    v3 = v1 + 32;
    do
    {
      v3 += 4;
      sub_23A362F58();
      --v2;
    }
    while (v2);
  }
  return sub_23A362F64();
}

BOOL sub_23A35D790(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return (_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v4, &v5) & 1) == 0;
}

BOOL sub_23A35D7C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return (_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v5, &v4) & 1) == 0;
}

unint64_t sub_23A35D800(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return (unint64_t)_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(&v4, &v5) & 1;
}

BOOL sub_23A35D834(uint64_t *a1, uint64_t *a2)
{
  return sub_23A35D5E8(*a1, *a2);
}

uint64_t sub_23A35D840(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_23A35DCDC(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_23A362CAC();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_23A362C4C();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_23A362C4C();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_23A362CC4();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_23A35F92C(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_23A35F92C((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_23A362C4C();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_23A362CC4();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_23A35F92C(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_23A35F92C((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_23A362E5C();
  __break(1u);
LABEL_42:
  result = sub_23A362E5C();
  __break(1u);
  return result;
}

uint64_t sub_23A35DCDC(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_23A362CC4();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_23A35F92C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_23A35F92C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_23A362E5C();
  __break(1u);
  return result;
}

_QWORD *sub_23A35DE34(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C1F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A35DE98(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_23A362CA0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B849208](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_23A35DF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_23A35EDEC();
  swift_bridgeObjectRetain();
  v7 = sub_23A362CB8();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_23A35E280();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_23A362E44();
  }
LABEL_7:
  v13 = sub_23A35E000(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_23A35E000(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A35E280()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23A362CC4();
  v4 = sub_23A35E2FC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23A35E2FC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_23A35E440(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23A35DE34(v9, 0);
      v12 = sub_23A35E52C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x23B8491B4](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23B8491B4);
LABEL_9:
      sub_23A362E44();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23B8491B4]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_23A35E440(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_23A35DE98(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_23A35DE98(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_23A362C88();
  }
  __break(1u);
  return result;
}

unint64_t sub_23A35E52C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_23A35DE98(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_23A362C94();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_23A362E44();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_23A35DE98(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_23A362C70();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23A35E73C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_23A362EE0() & 1;
}

unint64_t sub_23A35E790()
{
  unint64_t result;

  result = qword_25696C688;
  if (!qword_25696C688)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagPath.FormatError, &type metadata for ProtoTagPath.FormatError);
    atomic_store(result, (unint64_t *)&qword_25696C688);
  }
  return result;
}

uint64_t *_s8Dendrite12ProtoTagPathV1loiySbAC_ACtFZ_0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *result;
  v3 = *a2;
  v4 = *(_QWORD *)(*result + 16);
  v5 = *(_QWORD *)(*a2 + 16);
  if (v5 >= v4)
    v6 = *(_QWORD *)(*result + 16);
  else
    v6 = *(_QWORD *)(*a2 + 16);
  if (!v6)
    return (uint64_t *)(v4 < v5);
  v7 = *(_DWORD *)(v2 + 32);
  v8 = *(_DWORD *)(v3 + 32);
  if (v7 == v8)
  {
    v9 = 0;
    v10 = v2 + 36;
    v11 = v3 + 36;
    v12 = v6 - 1;
    while (v12 != v9)
    {
      v7 = *(_DWORD *)(v10 + 4 * v9);
      v8 = *(_DWORD *)(v11 + 4 * v9++);
      if (v7 != v8)
        goto LABEL_12;
    }
    return (uint64_t *)(v4 < v5);
  }
  v9 = 0;
LABEL_12:
  if (v9 < v4)
    return (uint64_t *)(v7 < v8);
  __break(1u);
  return result;
}

uint64_t sub_23A35E85C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned int v29;
  unsigned __int8 v30;
  unint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_23A35DE98(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_23A362C88();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_23A35DE98(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_23A35DE98(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_23A362C88();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v34 = a6 + 55;
        }
        else
        {
          v33 = 97;
          v34 = 65;
        }
        if (a6 <= 10)
          v35 = a6 + 48;
        else
          v35 = 58;
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                v30 = 1;
                if (v38 < 0x61 || v38 >= v33)
                  return v29 | ((unint64_t)v30 << 32);
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            v40 = v24 * (unint64_t)a6;
            if ((v40 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_96;
            v41 = v38 + v39;
            v24 = v40 + v41;
            if (__CFADD__((_DWORD)v40, v41))
              goto LABEL_96;
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          v30 = 0;
          v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 87;
      if (a6 > 10)
      {
        v43 = a6 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a6 <= 10)
        v44 = a6 + 48;
      else
        v44 = 58;
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              v30 = 1;
              if (v45 < 0x61 || v45 >= v42)
                return v29 | ((unint64_t)v30 << 32);
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          v47 = v24 * (unint64_t)a6;
          if ((v47 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v48 = v45 + v46;
          v24 = v47 + v48;
          if (__CFADD__((_DWORD)v47, v48))
            goto LABEL_96;
          ++v19;
          if (!--result)
            goto LABEL_94;
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    v29 = 0;
    v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | ((unint64_t)v30 << 32);
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v31 = v24 * (unint64_t)a6;
          if ((v31 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v32 = v27 + v28;
          v24 = v31 - v32;
          if (v31 < v32)
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_94;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unint64_t sub_23A35EC84()
{
  unint64_t result;

  result = qword_25696C690;
  if (!qword_25696C690)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagPath.FormatError, &type metadata for ProtoTagPath.FormatError);
    atomic_store(result, (unint64_t *)&qword_25696C690);
  }
  return result;
}

unint64_t sub_23A35ECCC()
{
  unint64_t result;

  result = qword_2542D1058;
  if (!qword_2542D1058)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagPath, &type metadata for ProtoTagPath);
    atomic_store(result, (unint64_t *)&qword_2542D1058);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagPath()
{
  return &type metadata for ProtoTagPath;
}

uint64_t storeEnumTagSinglePayload for ProtoTagPath.FormatError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A35ED6C + 4 * byte_23A365165[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A35EDA0 + 4 * byte_23A365160[v4]))();
}

uint64_t sub_23A35EDA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A35EDA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A35EDB0);
  return result;
}

uint64_t sub_23A35EDBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A35EDC4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A35EDC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A35EDD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagPath.FormatError()
{
  return &type metadata for ProtoTagPath.FormatError;
}

unint64_t sub_23A35EDEC()
{
  unint64_t result;

  result = qword_25696C698;
  if (!qword_25696C698)
  {
    result = MEMORY[0x23B849AC0](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_25696C698);
  }
  return result;
}

uint64_t sub_23A35EE30()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A35EE54()
{
  return swift_deallocObject();
}

uint64_t Set<>.optimized(for:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int64_t v19;
  uint64_t v20;
  uint64_t result;
  _QWORD *v22;

  swift_bridgeObjectRetain();
  v3 = sub_23A35FAA0(a2);
  swift_bridgeObjectRelease();
  v22 = v3;
  sub_23A35FA38((uint64_t *)&v22);
  v4 = v22[2];
  if (v4)
  {
    v5 = v22 + 4;
    swift_retain();
    v6 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v10 = v5[v6];
      v11 = v7[2];
      if (!v11)
      {
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v19 = 1;
LABEL_26:
          v7 = sub_23A35F2EC(0, v19, 1, v7);
        }
LABEL_4:
        v9 = v7[2];
        v8 = v7[3];
        if (v9 >= v8 >> 1)
          v7 = sub_23A35F2EC((_QWORD *)(v8 > 1), v9 + 1, 1, v7);
        v7[2] = v9 + 1;
        v7[v9 + 4] = v10;
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      v12 = v7[v11 + 3];
      v13 = *(_QWORD *)(v10 + 16);
      if (v13)
      {
        v14 = *(_QWORD *)(v12 + 16);
        if (!v14)
          goto LABEL_7;
        if (*(_DWORD *)(v10 + 32) != *(_DWORD *)(v12 + 32))
          goto LABEL_23;
        if (v13 != 1)
        {
          if (v14 == 1)
            goto LABEL_7;
          if (*(_DWORD *)(v10 + 36) != *(_DWORD *)(v12 + 36))
            goto LABEL_23;
          v15 = 0;
          v16 = v12 + 40;
          while (v13 - 2 != v15)
          {
            if (v14 - 2 == v15)
              goto LABEL_7;
            v17 = *(_DWORD *)(v10 + 40 + 4 * v15);
            v18 = *(_DWORD *)(v16 + 4 * v15++);
            if (v17 != v18)
              goto LABEL_23;
          }
        }
      }
      else
      {
        v14 = *(_QWORD *)(v12 + 16);
      }
      if (v13 != v14)
      {
        if (v13 >= v14)
        {
          __break(1u);
          result = swift_release();
          __break(1u);
          return result;
        }
LABEL_23:
        swift_bridgeObjectRetain_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v19 = v11 + 1;
          goto LABEL_26;
        }
        goto LABEL_4;
      }
LABEL_7:
      if (++v6 == v4)
      {
        swift_release_n();
        goto LABEL_29;
      }
    }
  }
  swift_release();
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_29:
  v20 = sub_23A360A3C((uint64_t)v7);
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_23A35F08C(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(result + 16);
    if (!v3)
      return 1;
    if (*(_DWORD *)(a2 + 32) != *(_DWORD *)(result + 32))
      return 0;
    v4 = 0;
    v5 = result + 36;
    v6 = v3 - 1;
    while (v2 - 1 != v4)
    {
      result = v6 == v4;
      if (v6 != v4)
      {
        v7 = *(_DWORD *)(a2 + 36 + 4 * v4);
        v8 = *(_DWORD *)(v5 + 4 * v4++);
        if (v7 == v8)
          continue;
      }
      return result;
    }
  }
  else
  {
    v3 = *(_QWORD *)(result + 16);
  }
  if (v2 == v3)
    return 1;
  if (v2 < v3)
    return 0;
  __break(1u);
  return result;
}

BOOL static ProtoTagTreeOperation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ProtoTagTreeOperation.hash(into:)()
{
  return sub_23A362F40();
}

uint64_t ProtoTagTreeOperation.hashValue.getter()
{
  sub_23A362F34();
  sub_23A362F40();
  return sub_23A362F64();
}

uint64_t Set<>.init(tagPaths:)(uint64_t a1)
{
  return sub_23A361084(a1);
}

{
  return sub_23A361084(a1);
}

_QWORD *sub_23A35F1C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696C6A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23A360930(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23A35F2EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D0160);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A360AC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23A35F3F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D1068);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_23A360BB0(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23A35F504(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696C408);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A360C98(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A35F610(char a1, int64_t a2, char a3, unint64_t a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696C6B0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696C230) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23A362E5C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696C230) - 8);
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
    sub_23A360E78(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_23A35F820(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696BFD0);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A360D88(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23A35F92C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542D1060);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A360F94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A35FA38(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A33D7C4(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_23A35FB84(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_23A35FAA0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D0160);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_23A360738((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23A361428();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23A35FB84(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  BOOL v36;
  int v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  char v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  unint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *__dst;
  uint64_t v118;

  v2 = a1;
  v3 = a1[1];
  result = sub_23A362EBC();
  if (result < v3)
  {
    v114 = result;
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_190;
    v118 = v1;
    if (v3 < 2)
    {
      v8 = MEMORY[0x24BEE4AF8];
      __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if (v3 != 1)
      {
        v56 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
        v11 = (char *)MEMORY[0x24BEE4AF8];
        goto LABEL_145;
      }
      v113 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v6 = v5 >> 1;
      v7 = sub_23A362D00();
      *(_QWORD *)(v7 + 16) = v6;
      v113 = v7;
      __dst = (char *)(v7 + 32);
    }
    v9 = 0;
    v112 = v2;
    v10 = *v2;
    v11 = (char *)MEMORY[0x24BEE4AF8];
    v115 = v3;
    while (1)
    {
      v12 = v9 + 1;
      if (v9 + 1 >= v3)
        goto LABEL_63;
      v13 = *(_QWORD *)(v10 + 8 * v12);
      v14 = v10 + 8 * v9;
      v15 = *(_QWORD *)v14;
      v16 = *(_QWORD *)(v13 + 16);
      v17 = *(_QWORD *)(*(_QWORD *)v14 + 16);
      if (v17 >= v16)
        v18 = *(_QWORD *)(v13 + 16);
      else
        v18 = *(_QWORD *)(*(_QWORD *)v14 + 16);
      if (v18)
      {
        v19 = *(_DWORD *)(v13 + 32);
        v20 = *(_DWORD *)(v15 + 32);
        if (v19 != v20)
        {
          v21 = 0;
LABEL_26:
          if (v21 >= v16)
            goto LABEL_185;
          v24 = v19 >= v20;
          goto LABEL_28;
        }
        v21 = 0;
        v22 = v15 + 36;
        v23 = v18 - 1;
        while (v23 != v21)
        {
          v19 = *(_DWORD *)(v13 + 36 + 4 * v21);
          v20 = *(_DWORD *)(v22 + 4 * v21++);
          if (v19 != v20)
            goto LABEL_26;
        }
      }
      v24 = v16 >= v17;
LABEL_28:
      v25 = !v24;
      v12 = v9 + 2;
      if (v9 + 2 < v3)
      {
        while (1)
        {
          v26 = *(_QWORD *)(v10 + 8 * v12);
          v27 = *(_QWORD *)(v26 + 16);
          if (v16 >= v27)
            v28 = *(_QWORD *)(v26 + 16);
          else
            v28 = v16;
          if (v28)
          {
            v29 = *(_DWORD *)(v26 + 32);
            v30 = *(_DWORD *)(v13 + 32);
            if (v29 != v30)
            {
              v31 = 0;
LABEL_47:
              if (v31 >= v27)
                goto LABEL_174;
              v36 = v29 >= v30;
              goto LABEL_49;
            }
            v31 = 0;
            if ((uint64_t)v16 <= 1)
              v32 = 1;
            else
              v32 = v16;
            v33 = v32 - 1;
            v34 = v13 + 36;
            v35 = v28 - 1;
            while (v35 != v31)
            {
              if (v33 == v31)
                goto LABEL_158;
              v29 = *(_DWORD *)(v26 + 36 + 4 * v31);
              v30 = *(_DWORD *)(v34 + 4 * v31++);
              if (v29 != v30)
                goto LABEL_47;
            }
          }
          v36 = v27 >= v16;
LABEL_49:
          v37 = !v36;
          if (v25 != v37)
            break;
          ++v12;
          v16 = *(_QWORD *)(v26 + 16);
          v13 = v26;
          if (v12 == v3)
          {
            v12 = v3;
            break;
          }
        }
      }
      if (v25)
      {
        if (v12 < v9)
          goto LABEL_184;
        if (v9 < v12)
        {
          v38 = (_QWORD *)(v10 - 8 + 8 * v12);
          v39 = v12;
          v40 = v9;
          do
          {
            if (v40 != --v39)
            {
              if (!v10)
                goto LABEL_188;
              v41 = *(_QWORD *)v14;
              *(_QWORD *)v14 = *v38;
              *v38 = v41;
            }
            ++v40;
            --v38;
            v14 += 8;
          }
          while (v40 < v39);
        }
      }
LABEL_63:
      if (v12 >= v3)
        goto LABEL_92;
      if (__OFSUB__(v12, v9))
        goto LABEL_180;
      if (v12 - v9 >= v114)
        goto LABEL_92;
      v42 = v9 + v114;
      if (__OFADD__(v9, v114))
        goto LABEL_182;
      if (v42 >= v3)
        v42 = v3;
      if (v42 < v9)
      {
LABEL_183:
        __break(1u);
LABEL_184:
        __break(1u);
LABEL_185:
        __break(1u);
LABEL_186:
        __break(1u);
LABEL_187:
        __break(1u);
LABEL_188:
        __break(1u);
LABEL_189:
        __break(1u);
LABEL_190:
        result = sub_23A362E5C();
        __break(1u);
        return result;
      }
      if (v12 != v42)
      {
        while (1)
        {
          v43 = *(_QWORD *)(v10 + 8 * v12);
          v44 = v12;
          do
          {
            v45 = v44 - 1;
            v46 = *(_QWORD *)(v10 + 8 * (v44 - 1));
            v47 = *(_QWORD *)(v43 + 16);
            v48 = *(_QWORD *)(v46 + 16);
            if (v48 >= v47)
              v49 = *(_QWORD *)(v43 + 16);
            else
              v49 = *(_QWORD *)(v46 + 16);
            if (!v49)
              goto LABEL_83;
            v50 = *(_DWORD *)(v43 + 32);
            v51 = *(_DWORD *)(v46 + 32);
            if (v50 == v51)
            {
              v52 = 0;
              v53 = v49 - 1;
              while (v53 != v52)
              {
                v50 = *(_DWORD *)(v43 + 36 + 4 * v52);
                v51 = *(_DWORD *)(v46 + 36 + 4 * v52++);
                if (v50 != v51)
                  goto LABEL_86;
              }
LABEL_83:
              if (v47 >= v48)
                break;
              goto LABEL_88;
            }
            v52 = 0;
LABEL_86:
            if (v52 >= v47)
            {
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
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
LABEL_171:
              __break(1u);
LABEL_172:
              __break(1u);
LABEL_173:
              __break(1u);
LABEL_174:
              __break(1u);
LABEL_175:
              __break(1u);
LABEL_176:
              __break(1u);
LABEL_177:
              __break(1u);
LABEL_178:
              __break(1u);
LABEL_179:
              __break(1u);
LABEL_180:
              __break(1u);
LABEL_181:
              __break(1u);
LABEL_182:
              __break(1u);
              goto LABEL_183;
            }
            if (v50 >= v51)
              break;
LABEL_88:
            if (!v10)
              goto LABEL_186;
            *(_QWORD *)(v10 + 8 * v44) = v46;
            *(_QWORD *)(v10 + 8 * v45) = v43;
            --v44;
          }
          while (v45 != v9);
          if (++v12 == v42)
          {
            v12 = v42;
            break;
          }
        }
      }
LABEL_92:
      if (v12 < v9)
        goto LABEL_176;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v11 = sub_23A33D504(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
      v55 = *((_QWORD *)v11 + 2);
      v54 = *((_QWORD *)v11 + 3);
      v56 = v55 + 1;
      if (v55 >= v54 >> 1)
        v11 = sub_23A33D504((char *)(v54 > 1), v55 + 1, 1, v11);
      *((_QWORD *)v11 + 2) = v56;
      v57 = v11 + 32;
      v58 = &v11[16 * v55 + 32];
      *(_QWORD *)v58 = v9;
      *((_QWORD *)v58 + 1) = v12;
      v116 = v12;
      if (v55)
      {
        while (1)
        {
          v59 = v56 - 1;
          if (v56 >= 4)
          {
            v64 = &v57[16 * v56];
            v65 = *((_QWORD *)v64 - 8);
            v66 = *((_QWORD *)v64 - 7);
            v70 = __OFSUB__(v66, v65);
            v67 = v66 - v65;
            if (v70)
              goto LABEL_163;
            v69 = *((_QWORD *)v64 - 6);
            v68 = *((_QWORD *)v64 - 5);
            v70 = __OFSUB__(v68, v69);
            v62 = v68 - v69;
            v63 = v70;
            if (v70)
              goto LABEL_164;
            v71 = v56 - 2;
            v72 = &v57[16 * v56 - 32];
            v74 = *(_QWORD *)v72;
            v73 = *((_QWORD *)v72 + 1);
            v70 = __OFSUB__(v73, v74);
            v75 = v73 - v74;
            if (v70)
              goto LABEL_166;
            v70 = __OFADD__(v62, v75);
            v76 = v62 + v75;
            if (v70)
              goto LABEL_169;
            if (v76 >= v67)
            {
              v94 = &v57[16 * v59];
              v96 = *(_QWORD *)v94;
              v95 = *((_QWORD *)v94 + 1);
              v70 = __OFSUB__(v95, v96);
              v97 = v95 - v96;
              if (v70)
                goto LABEL_173;
              v87 = v62 < v97;
              goto LABEL_129;
            }
          }
          else
          {
            if (v56 != 3)
            {
              v88 = *((_QWORD *)v11 + 4);
              v89 = *((_QWORD *)v11 + 5);
              v70 = __OFSUB__(v89, v88);
              v81 = v89 - v88;
              v82 = v70;
              goto LABEL_123;
            }
            v61 = *((_QWORD *)v11 + 4);
            v60 = *((_QWORD *)v11 + 5);
            v70 = __OFSUB__(v60, v61);
            v62 = v60 - v61;
            v63 = v70;
          }
          if ((v63 & 1) != 0)
            goto LABEL_165;
          v71 = v56 - 2;
          v77 = &v57[16 * v56 - 32];
          v79 = *(_QWORD *)v77;
          v78 = *((_QWORD *)v77 + 1);
          v80 = __OFSUB__(v78, v79);
          v81 = v78 - v79;
          v82 = v80;
          if (v80)
            goto LABEL_168;
          v83 = &v57[16 * v59];
          v85 = *(_QWORD *)v83;
          v84 = *((_QWORD *)v83 + 1);
          v70 = __OFSUB__(v84, v85);
          v86 = v84 - v85;
          if (v70)
            goto LABEL_171;
          if (__OFADD__(v81, v86))
            goto LABEL_172;
          if (v81 + v86 >= v62)
          {
            v87 = v62 < v86;
LABEL_129:
            if (v87)
              v59 = v71;
            goto LABEL_131;
          }
LABEL_123:
          if ((v82 & 1) != 0)
            goto LABEL_167;
          v90 = &v57[16 * v59];
          v92 = *(_QWORD *)v90;
          v91 = *((_QWORD *)v90 + 1);
          v70 = __OFSUB__(v91, v92);
          v93 = v91 - v92;
          if (v70)
            goto LABEL_170;
          if (v93 < v81)
            goto LABEL_140;
LABEL_131:
          v98 = v59 - 1;
          if (v59 - 1 >= v56)
            goto LABEL_159;
          if (!v10)
            goto LABEL_187;
          v99 = &v57[16 * v98];
          v100 = *(_QWORD *)v99;
          v101 = &v57[16 * v59];
          v102 = *((_QWORD *)v101 + 1);
          sub_23A3603EC((char *)(v10 + 8 * *(_QWORD *)v99), (char *)(v10 + 8 * *(_QWORD *)v101), (char *)(v10 + 8 * v102), __dst);
          if (v118)
            goto LABEL_156;
          if (v102 < v100)
            goto LABEL_160;
          if (v59 > *((_QWORD *)v11 + 2))
            goto LABEL_161;
          *(_QWORD *)v99 = v100;
          *(_QWORD *)&v57[16 * v98 + 8] = v102;
          v103 = *((_QWORD *)v11 + 2);
          if (v59 >= v103)
            goto LABEL_162;
          v56 = v103 - 1;
          memmove(&v57[16 * v59], v101 + 16, 16 * (v103 - 1 - v59));
          *((_QWORD *)v11 + 2) = v103 - 1;
          if (v103 <= 2)
            goto LABEL_140;
        }
      }
      v56 = 1;
LABEL_140:
      v3 = v115;
      v9 = v116;
      if (v116 >= v115)
      {
        v8 = v113;
        v2 = v112;
LABEL_145:
        v113 = v8;
        if (v56 >= 2)
        {
          v104 = *v2;
          do
          {
            v105 = v56 - 2;
            if (v56 < 2)
              goto LABEL_175;
            if (!v104)
              goto LABEL_189;
            v106 = v11;
            v107 = v11 + 32;
            v108 = *(_QWORD *)&v11[16 * v105 + 32];
            v109 = *(_QWORD *)&v107[16 * v56 - 8];
            sub_23A3603EC((char *)(v104 + 8 * v108), (char *)(v104 + 8 * *(_QWORD *)&v107[16 * v56 - 16]), (char *)(v104 + 8 * v109), __dst);
            if (v118)
              break;
            if (v109 < v108)
              goto LABEL_177;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v106 = sub_23A33D7B0((uint64_t)v106);
            if (v105 >= *((_QWORD *)v106 + 2))
              goto LABEL_178;
            v110 = &v106[16 * v105 + 32];
            *(_QWORD *)v110 = v108;
            *((_QWORD *)v110 + 1) = v109;
            v111 = *((_QWORD *)v106 + 2);
            if (v56 > v111)
              goto LABEL_179;
            memmove(&v106[16 * v56 + 16], &v106[16 * v56 + 32], 16 * (v111 - v56));
            v11 = v106;
            *((_QWORD *)v106 + 2) = v111 - 1;
            v56 = v111 - 1;
          }
          while (v111 > 2);
        }
LABEL_156:
        swift_bridgeObjectRelease();
        *(_QWORD *)(v113 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
    }
  }
  if (v3 < 0)
    goto LABEL_181;
  if (v3)
    return sub_23A360320(0, v3, 1, v2);
  return result;
}

uint64_t sub_23A360320(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;

  if (a3 == a2)
    return result;
  v4 = *a4;
LABEL_5:
  v5 = *(_QWORD *)(v4 + 8 * a3);
  v6 = a3;
  while (1)
  {
    v7 = v6 - 1;
    v8 = *(_QWORD *)(v4 + 8 * (v6 - 1));
    v9 = *(_QWORD *)(v5 + 16);
    v10 = *(_QWORD *)(v8 + 16);
    if (v10 >= v9)
      v11 = *(_QWORD *)(v5 + 16);
    else
      v11 = *(_QWORD *)(v8 + 16);
    if (!v11)
      goto LABEL_15;
    v12 = *(_DWORD *)(v5 + 32);
    v13 = *(_DWORD *)(v8 + 32);
    if (v12 != v13)
      break;
    v14 = 0;
    v15 = v11 - 1;
    while (v15 != v14)
    {
      v12 = *(_DWORD *)(v5 + 36 + 4 * v14);
      v13 = *(_DWORD *)(v8 + 36 + 4 * v14++);
      if (v12 != v13)
        goto LABEL_18;
    }
LABEL_15:
    if (v9 >= v10)
      goto LABEL_4;
LABEL_20:
    if (!v4)
      goto LABEL_24;
    *(_QWORD *)(v4 + 8 * v6) = v8;
    *(_QWORD *)(v4 + 8 * v7) = v5;
    --v6;
    if (v7 == result)
    {
LABEL_4:
      if (++a3 == a2)
        return result;
      goto LABEL_5;
    }
  }
  v14 = 0;
LABEL_18:
  if (v14 < v9)
  {
    if (v12 >= v13)
      goto LABEL_4;
    goto LABEL_20;
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_23A3603EC(char *__src, char *a2, char *a3, char *__dst)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t result;
  char *v39;
  char *v40;
  char *v41;

  v4 = __dst;
  v5 = a3;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - a2;
  v12 = a3 - a2 + 7;
  if (a3 - a2 >= 0)
    v12 = a3 - a2;
  v13 = v12 >> 3;
  v41 = __src;
  v40 = __dst;
  if (v10 < v12 >> 3)
  {
    if (v8 < -7)
      goto LABEL_69;
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[8 * v10];
    v39 = v14;
    if (v6 < v5 && v8 >= 8)
    {
      while (1)
      {
        v15 = *(_QWORD *)v6;
        v16 = *(_QWORD *)v4;
        v17 = *(_QWORD *)(*(_QWORD *)v6 + 16);
        v18 = *(_QWORD *)(*(_QWORD *)v4 + 16);
        if (v18 >= v17)
          v19 = *(_QWORD *)(*(_QWORD *)v6 + 16);
        else
          v19 = *(_QWORD *)(*(_QWORD *)v4 + 16);
        if (!v19)
          goto LABEL_21;
        v20 = *(_DWORD *)(v15 + 32);
        v21 = *(_DWORD *)(v16 + 32);
        if (v20 == v21)
          break;
        v22 = 0;
LABEL_27:
        if (v22 >= v17)
          goto LABEL_68;
        if (v20 < v21)
        {
LABEL_22:
          v24 = v6 + 8;
          if (v7 < v6 || v7 >= v24 || v7 != v6)
            *(_QWORD *)v7 = v15;
          goto LABEL_32;
        }
LABEL_29:
        if (v7 != v4)
          *(_QWORD *)v7 = v16;
        v4 += 8;
        v40 = v4;
        v24 = v6;
LABEL_32:
        v7 += 8;
        if (v4 < v14)
        {
          v6 = v24;
          if (v24 < v5)
            continue;
        }
        v41 = v7;
        goto LABEL_66;
      }
      v22 = 0;
      v23 = v19 - 1;
      while (v23 != v22)
      {
        v20 = *(_DWORD *)(v15 + 36 + 4 * v22);
        v21 = *(_DWORD *)(v16 + 36 + 4 * v22++);
        if (v20 != v21)
          goto LABEL_27;
      }
LABEL_21:
      if (v17 < v18)
        goto LABEL_22;
      goto LABEL_29;
    }
LABEL_66:
    sub_23A33D5FC((void **)&v41, (const void **)&v40, &v39);
    return 1;
  }
  if (v11 < -7)
    goto LABEL_69;
  if (__dst != a2 || &a2[8 * v13] <= __dst)
    memmove(__dst, a2, 8 * v13);
  v25 = &v4[8 * v13];
  v39 = v25;
  v41 = v6;
  if (v7 >= v6 || v11 < 8)
    goto LABEL_66;
  while (1)
  {
    v26 = *((_QWORD *)v25 - 1);
    v27 = v6 - 8;
    v28 = *((_QWORD *)v6 - 1);
    v29 = *(_QWORD *)(v26 + 16);
    v30 = *(_QWORD *)(v28 + 16);
    if (v30 >= v29)
      v31 = *(_QWORD *)(v26 + 16);
    else
      v31 = *(_QWORD *)(v28 + 16);
    if (!v31)
      goto LABEL_54;
    v32 = *(_DWORD *)(v26 + 32);
    v33 = *(_DWORD *)(v28 + 32);
    if (v32 == v33)
    {
      v34 = 0;
      v35 = v26 + 36;
      v36 = v31 - 1;
      while (v36 != v34)
      {
        v32 = *(_DWORD *)(v35 + 4 * v34);
        v33 = *(_DWORD *)(v28 + 36 + 4 * v34++);
        if (v32 != v33)
          goto LABEL_59;
      }
LABEL_54:
      v37 = v5 - 8;
      if (v29 >= v30)
        goto LABEL_61;
      goto LABEL_55;
    }
    v34 = 0;
LABEL_59:
    if (v34 >= v29)
      break;
    v37 = v5 - 8;
    if (v32 >= v33)
    {
LABEL_61:
      v39 = v25 - 8;
      if (v5 < v25 || v37 >= v25 || v5 != v25)
        *(_QWORD *)v37 = *((_QWORD *)v25 - 1);
      v25 -= 8;
      if (v6 <= v7)
        goto LABEL_66;
      goto LABEL_44;
    }
LABEL_55:
    if (v5 != v6 || v37 >= v6)
      *(_QWORD *)v37 = v28;
    v41 = v6 - 8;
    v6 -= 8;
    if (v27 <= v7)
      goto LABEL_66;
LABEL_44:
    v5 = v37;
    if (v25 <= v4)
      goto LABEL_66;
  }
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360738(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
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
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v16);
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
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

uint64_t sub_23A360930(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696C4C8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360A3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23A3613E4();
  result = sub_23A362D48();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      swift_bridgeObjectRetain();
      sub_23A345A24(&v6, v5);
      swift_bridgeObjectRelease();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_23A360AC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

char *sub_23A360BB0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360C98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360D88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360E78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696C230) - 8);
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
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A360F94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A362E8C();
  __break(1u);
  return result;
}

uint64_t sub_23A361084(uint64_t a1)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_23A353F1C(0, v3, 0);
    v4 = v14;
    v5 = (unint64_t *)(a1 + 40);
    while (1)
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      swift_bridgeObjectRetain_n();
      ProtoTagPath.init(_:)(v7, v6, &v13);
      if (v1)
        break;
      swift_bridgeObjectRelease();
      v8 = v13;
      v14 = v4;
      v10 = *(_QWORD *)(v4 + 16);
      v9 = *(_QWORD *)(v4 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_23A353F1C(v9 > 1, v10 + 1, 1);
        v4 = v14;
      }
      v5 += 2;
      *(_QWORD *)(v4 + 16) = v10 + 1;
      *(_QWORD *)(v4 + 8 * v10 + 32) = v8;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
LABEL_10:
    v12 = sub_23A360A3C(v4);
    swift_bridgeObjectRelease();
    return v12;
  }
}

uint64_t _sSh8DendriteAA12ProtoTagPathVRszrlE8tagPathsShyACGSaySays6UInt32VGG_tcfC_0(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v10 = MEMORY[0x24BEE4AF8];
    sub_23A353F1C(0, v2, 0);
    v3 = 0;
    v4 = v10;
    do
    {
      v5 = *(_QWORD *)(a1 + 8 * v3 + 32);
      v6 = *(_QWORD *)(v10 + 16);
      v7 = *(_QWORD *)(v10 + 24);
      swift_bridgeObjectRetain();
      if (v6 >= v7 >> 1)
        sub_23A353F1C(v7 > 1, v6 + 1, 1);
      ++v3;
      *(_QWORD *)(v10 + 16) = v6 + 1;
      *(_QWORD *)(v10 + 8 * v6 + 32) = v5;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
  }
  v8 = sub_23A360A3C(v4);
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_23A3612D4()
{
  unint64_t result;

  result = qword_25696C6A0;
  if (!qword_25696C6A0)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagTreeOperation, &type metadata for ProtoTagTreeOperation);
    atomic_store(result, (unint64_t *)&qword_25696C6A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ProtoTagTreeOperation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A361364 + 4 * byte_23A365325[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A361398 + 4 * byte_23A365320[v4]))();
}

uint64_t sub_23A361398(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3613A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A3613A8);
  return result;
}

uint64_t sub_23A3613B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A3613BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A3613C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3613C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProtoTagTreeOperation()
{
  return &type metadata for ProtoTagTreeOperation;
}

unint64_t sub_23A3613E4()
{
  unint64_t result;

  result = qword_2542D1050;
  if (!qword_2542D1050)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoTagPath, &type metadata for ProtoTagPath);
    atomic_store(result, (unint64_t *)&qword_2542D1050);
  }
  return result;
}

uint64_t sub_23A361428()
{
  return swift_release();
}

id sub_23A361430(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (void *)sub_23A362A00();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForUpdatingURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_23A362A3C();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_23A3629B8();

    swift_willThrow();
    v9 = sub_23A362A3C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_23A361544()
{
  uint64_t v0;
  id v1;

  v1 = (id)sub_23A3616BC();
  flock((int)objc_msgSend(v1, sel_fileDescriptor), 8);

  sub_23A336CFC(v0 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL);
  return swift_deallocClassInstance();
}

uint64_t sub_23A3615E4()
{
  return type metadata accessor for FileLock();
}

uint64_t type metadata accessor for FileLock()
{
  uint64_t result;

  result = qword_25696C6B8;
  if (!qword_25696C6B8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A361628()
{
  unint64_t v0;

  sub_23A33779C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

ValueMetadata *type metadata accessor for FileLockError()
{
  return &type metadata for FileLockError;
}

uint64_t sub_23A3616BC()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v2 = v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D0110);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A362A3C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = OBJC_IVAR____TtC8Dendrite8FileLock_handle;
  result = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Dendrite8FileLock_handle);
  if (!result)
  {
    sub_23A3379B0(v2 + OBJC_IVAR____TtC8Dendrite8FileLock_fileURL, (uint64_t)v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_23A336CFC((uint64_t)v5);
      sub_23A35B214();
      swift_allocError();
      *(_DWORD *)v15 = 0;
      *(_BYTE *)(v15 + 4) = 1;
      return swift_willThrow();
    }
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    sub_23A3618C0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    v16 = sub_23A361430((uint64_t)v10);
    if (v1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
    else
    {
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      v18 = *(void **)(v2 + v13);
      *(_QWORD *)(v2 + v13) = v17;

      result = *(_QWORD *)(v2 + v13);
      if (!result)
      {
        sub_23A35B214();
        swift_allocError();
        *(_DWORD *)v19 = 0;
        *(_BYTE *)(v19 + 4) = 1;
        return swift_willThrow();
      }
    }
  }
  return result;
}

unint64_t sub_23A3618C0()
{
  unint64_t result;

  result = qword_25696C6C8;
  if (!qword_25696C6C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696C6C8);
  }
  return result;
}

void PBDataWriter.writeSubgroup(tag:writeData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  void *v10;
  id v11;
  objc_super v12;

  v5 = (objc_class *)type metadata accessor for BlockShimForPBCodable();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error] = 0;
  v7 = &v6[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block];
  *(_QWORD *)v7 = a2;
  *((_QWORD *)v7 + 1) = a3;
  v12.receiver = v6;
  v12.super_class = v5;
  swift_retain();
  v8 = (char *)objc_msgSendSuper2(&v12, sel_init);
  if (v8)
  {
    v9 = v8;
    PBDataWriterWriteSubgroup();
    v10 = *(void **)&v9[OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error];
    if (v10)
    {
      v11 = v10;
      swift_willThrow();
    }

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for BlockShimForPBCodable()
{
  return objc_opt_self();
}

void ProtoCodable.serialize()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7AF00]), sel_init);
  if (v5)
  {
    v6 = v5;
    (*(void (**)(id, uint64_t, uint64_t))(a2 + 16))(v5, a1, a2);
    if (v2)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, sel_immutableData);
      if (v8)
      {
        v9 = v8;
        sub_23A362A90();

      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_23A361AFC();
    swift_allocError();
    *v7 = 0xD000000000000017;
    v7[1] = 0x800000023A367750;
    swift_willThrow();
  }
}

unint64_t sub_23A361AFC()
{
  unint64_t result;

  result = qword_25696C6E0;
  if (!qword_25696C6E0)
  {
    result = MEMORY[0x23B849AC0](&protocol conformance descriptor for ProtoCodableError, &type metadata for ProtoCodableError);
    atomic_store(result, (unint64_t *)&qword_25696C6E0);
  }
  return result;
}

void static ProtoCodable.deserialize(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  id v11;
  void *v12;
  id v13;
  _QWORD *v14;

  v11 = objc_allocWithZone(MEMORY[0x24BE7AEF8]);
  sub_23A333494(a1, a2);
  v12 = (void *)sub_23A362A84();
  sub_23A33350C(a1, a2);
  v13 = objc_msgSend(v11, sel_initWithData_, v12);

  if (v13)
  {
    (*(void (**)(id, uint64_t, uint64_t))(a4 + 24))(v13, a3, a4);
    if (!v5)
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a5, 0, 1, a3);

  }
  else
  {
    sub_23A361AFC();
    swift_allocError();
    *v14 = 0xD000000000000017;
    v14[1] = 0x800000023A367770;
    swift_willThrow();
  }
}

id sub_23A361DDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlockShimForPBCodable();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t PBDataWriter.writeSubmessage(tag:writeData:)(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = PBDataWriterPlaceMark();
  result = a2(v4);
  if (!v2)
    return PBDataWriterRecallMark();
  return result;
}

uint64_t PBDataWriter.write(submessage:forTag:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v3 = v1;
  PBDataWriterPlaceMark();
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v5, v6);
  if (!v2)
    return PBDataWriterRecallMark();
  return result;
}

uint64_t PBDataWriter.write(_:forTag:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t __src;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;

  v3 = v2;
  v27 = *MEMORY[0x24BDAC8D0];
  __src = sub_23A362ACC();
  v19 = v5;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v13 = sub_23A34FCA8(&__src, 16);
  v15 = v14;
  v16 = (void *)sub_23A362A84();
  objc_msgSend(v3, sel_writeData_forTag_, v16, a2);

  return sub_23A33350C(v13, v15);
}

uint64_t PBDataReader.readUUID()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D10F8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = objc_msgSend(v1, sel_readData);
  if (v4)
  {
    v5 = v4;
    sub_23A362A90();
    v7 = v6;

    __asm { BR              X10 }
  }
  v8 = sub_23A362AE4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, 1, 1, v8);
}

uint64_t PBDataReader.readFields<A>(each:)(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  int v21;
  uint64_t v22;

  v18 = a2;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = sub_23A362DC0();
  v16 = *(_QWORD *)(v7 - 8);
  v17 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - v9;
  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (uint64_t)objc_msgSend(v3, sel_hasMoreData);
  if ((_DWORD)result)
  {
    while (1)
    {
      v21 = 0;
      v20 = 0;
      objc_msgSend(v3, sel_readTag_type_, &v21, &v20, v16, v17, v18);
      result = (uint64_t)objc_msgSend(v3, sel_hasError);
      if ((result & 1) != 0)
        break;
      if (v20 == 4)
        return result;
      v19 = v21;
      sub_23A362CDC();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3) == 1)
      {
        (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v17);
        break;
      }
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a3);
      a1(v13);
      result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a3);
      if (!v4)
      {
        result = (uint64_t)objc_msgSend(v3, sel_hasMoreData);
        if ((result & 1) != 0)
          continue;
      }
      return result;
    }
    sub_23A361AFC();
    swift_allocError();
    *v15 = 0;
    v15[1] = 0;
    return swift_willThrow();
  }
  return result;
}

id PBDataReader.readSubmessage(readBody:)(uint64_t (*a1)(id))
{
  void *v1;
  uint64_t v2;
  id result;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  result = (id)a1(objc_msgSend(v1, sel_mark_, v4));
  if (!v2)
    return objc_msgSend(v1, sel_recall_, v4);
  return result;
}

id PBDataReader.readSubmessage<A>(ofType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  _QWORD v8[3];

  v4 = v3;
  v8[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v8[1] = 0;
  objc_msgSend(v4, sel_mark_, v8);
  (*(void (**)(void *, uint64_t, uint64_t))(a3 + 24))(v4, a2, a3);
  return objc_msgSend(v4, sel_recall_, v8);
}

_QWORD *initializeBufferWithCopyOfBuffer for ProtoCodableError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProtoCodableError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ProtoCodableError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ProtoCodableError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProtoCodableError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ProtoCodableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_23A362888(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A3628A0(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtoCodableError()
{
  return &type metadata for ProtoCodableError;
}

uint64_t dispatch thunk of ProtoCodable.write(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static ProtoCodable.read(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_23A362904()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23A362910()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23A36291C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23A362928()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23A362934()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23A362940()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23A36294C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23A362958()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23A362964()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A362970()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23A36297C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A362988()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A362994()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A3629A0()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_23A3629AC()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23A3629B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A3629C4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23A3629D0()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_23A3629DC()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_23A3629E8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23A3629F4()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_23A362A00()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A362A0C()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_23A362A18()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_23A362A24()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23A362A30()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_23A362A3C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A362A48()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23A362A54()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t sub_23A362A60()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t sub_23A362A6C()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23A362A78()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A362A84()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A362A90()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A362A9C()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23A362AA8()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_23A362AB4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A362AC0()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_23A362ACC()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_23A362AD8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A362AE4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A362AF0()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23A362AFC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A362B08()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A362B14()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23A362B20()
{
  return MEMORY[0x24BEE5340]();
}

uint64_t sub_23A362B2C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_23A362B38()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A362B44()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A362B50()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_23A362B5C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A362B68()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A362B74()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23A362B80()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A362B8C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A362B98()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_23A362BA4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A362BB0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23A362BBC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23A362BC8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A362BD4()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23A362BE0()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t sub_23A362BEC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23A362BF8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23A362C04()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A362C10()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A362C1C()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23A362C28()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23A362C34()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A362C40()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23A362C4C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23A362C58()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A362C64()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A362C70()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23A362C7C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23A362C88()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23A362C94()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23A362CA0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23A362CAC()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23A362CB8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23A362CC4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23A362CD0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23A362CDC()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_23A362CE8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A362CF4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A362D00()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A362D0C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A362D18()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A362D24()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A362D30()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A362D3C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_23A362D48()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A362D54()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A362D60()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23A362D6C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A362D78()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_23A362D84()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_23A362D90()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_23A362D9C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23A362DA8()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_23A362DB4()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A362DC0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A362DCC()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23A362DD8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A362DE4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A362DF0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A362DFC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A362E08()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A362E14()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A362E20()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A362E2C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A362E38()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A362E44()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A362E50()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A362E5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A362E68()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A362E74()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A362E80()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A362E8C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A362E98()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23A362EA4()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_23A362EB0()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_23A362EBC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A362EC8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A362ED4()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23A362EE0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A362EEC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A362EF8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A362F04()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A362F10()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A362F1C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A362F28()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A362F34()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A362F40()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A362F4C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23A362F58()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A362F64()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A362F70()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A362F7C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A362F88()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A362F94()
{
  return MEMORY[0x24BEE4A10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67138]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67160]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x24BDD1200](bytes);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x24BE7AF70]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x24BE7AF78]();
}

uint64_t PBDataWriterWriteSubgroup()
{
  return MEMORY[0x24BE7AFE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFE0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
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


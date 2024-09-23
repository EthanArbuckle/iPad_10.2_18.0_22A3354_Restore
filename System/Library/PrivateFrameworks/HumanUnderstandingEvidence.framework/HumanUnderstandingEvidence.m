void type metadata accessor for RPProximity(uint64_t a1)
{
  sub_1C1262074(a1, &qword_1EF6D2830);
}

void type metadata accessor for RPPersonFlags(uint64_t a1)
{
  sub_1C1262074(a1, &qword_1EF6D2838);
}

void type metadata accessor for RPActivityLevel(uint64_t a1)
{
  sub_1C1262074(a1, (unint64_t *)&unk_1EF6D2840);
}

void sub_1C1262074(uint64_t a1, unint64_t *a2)
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

_DWORD *sub_1C12620B8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_1C12620C8(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1C12620D4@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_1C1262104(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_1C1262104(uint64_t result)
{
  return result;
}

uint64_t sub_1C1262120@<X0>(_DWORD *a1@<X8>)
{
  unsigned int *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1C1262154()
{
  uint64_t v0;

  v0 = sub_1C12665A8();
  sub_1C12621C8(v0, qword_1EF6D32D0);
  sub_1C1262208(v0, (uint64_t)qword_1EF6D32D0);
  return sub_1C126659C();
}

uint64_t *sub_1C12621C8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1C1262208(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1C1262220()
{
  qword_1EF6D32E8 = 0x6944656C706F6550;
  unk_1EF6D32F0 = 0xEF797265766F6373;
}

uint64_t PeopleDiscoveryBiomeStream.identifier.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_identifier);
  v2 = sub_1C12665D8();

  return v2;
}

void PeopleDiscoveryBiomeStream.init()(id *a1@<X8>)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_self();
  sub_1C1262680(0xD000000000000033, 0x80000001C1267600, v2);
  if (qword_1EF6D2828 != -1)
    swift_once();
  v3 = objc_allocWithZone(MEMORY[0x1E0D02790]);
  sub_1C1262724();
  *a1 = sub_1C1262700();
  sub_1C1262714();
}

void PeopleDiscoveryBiomeStream.init(basePath:)(uint64_t a1@<X0>, uint64_t a2@<X1>, id *a3@<X8>)
{
  void *v6;
  id v7;

  v6 = (void *)objc_opt_self();
  sub_1C1262680(a1, a2, v6);
  if (qword_1EF6D2828 != -1)
    swift_once();
  v7 = objc_allocWithZone(MEMORY[0x1E0D02790]);
  sub_1C1262724();
  *a3 = sub_1C1262700();
  sub_1C1262714();
}

id PeopleDiscoveryBiomeStream.source()()
{
  id *v0;

  return objc_msgSend(*v0, sel_source);
}

id PeopleDiscoveryBiomeStream.publisher(fromStartTime:)()
{
  id *v0;

  return objc_msgSend(*v0, sel_publisherFromStartTime_);
}

id PeopleDiscoveryBiomeStream.publisher(withStartTime:endTime:maxEvents:lastN:reversed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id *v5;

  return objc_msgSend(*v5, sel_publisherWithStartTime_endTime_maxEvents_lastN_reversed_, a1, a2, a3, a4, a5 & 1);
}

Swift::Void __swiftcall PeopleDiscoveryBiomeStream.clearAllData()()
{
  void **v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD v7[6];

  v1 = *v0;
  v7[4] = sub_1C12625C8;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1C12625CC;
  v7[3] = &unk_1E7A7B840;
  v2 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v1, sel_pruneWithPredicateBlock_, v2);
  _Block_release(v2);
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
    __break(1u);
  }
  else if (qword_1EF6D2820 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v3 = sub_1C12665A8();
  sub_1C1262208(v3, (uint64_t)qword_1EF6D32D0);
  v4 = sub_1C1266590();
  v5 = sub_1C1266644();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C1260000, v4, v5, "PeopleDiscoveryBiomeStream cleared.", v6, 2u);
    MEMORY[0x1C3BA8B24](v6, -1, -1);
  }

}

uint64_t sub_1C12625C0()
{
  return 1;
}

uint64_t sub_1C12625CC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(void *, uint64_t);
  id v6;

  v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

id sub_1C1262620(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_1C12665CC();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithPrivateStreamIdentifier_storeConfig_, v5, a3);

  return v6;
}

id sub_1C1262680(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = (void *)sub_1C12665CC();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(a3, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v4);

  return v5;
}

uint64_t sub_1C12626D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1C12626E8()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for PeopleDiscoveryBiomeStream()
{
  return &type metadata for PeopleDiscoveryBiomeStream;
}

id sub_1C1262700()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C1262620(v1, v2, v0);
}

uint64_t sub_1C1262724()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C1262730()
{
  sub_1C12648B4(&qword_1EF6D2998, (uint64_t (*)(uint64_t))type metadata accessor for RPActivityLevel, (uint64_t)&unk_1C1266CE0);
  return sub_1C1266608();
}

uint64_t sub_1C12627A4()
{
  sub_1C12648B4(&qword_1EF6D2998, (uint64_t (*)(uint64_t))type metadata accessor for RPActivityLevel, (uint64_t)&unk_1C1266CE0);
  return sub_1C12665F0();
}

uint64_t sub_1C1262808()
{
  sub_1C12648B4(&qword_1EF6D2990, (uint64_t (*)(uint64_t))type metadata accessor for RPPersonFlags, (uint64_t)&unk_1C1266D18);
  return sub_1C1266614();
}

uint64_t sub_1C126287C()
{
  sub_1C12648B4(&qword_1EF6D2990, (uint64_t (*)(uint64_t))type metadata accessor for RPPersonFlags, (uint64_t)&unk_1C1266D18);
  return sub_1C12665FC();
}

uint64_t sub_1C12628E0()
{
  sub_1C12648B4(&qword_1EF6D2988, (uint64_t (*)(uint64_t))type metadata accessor for RPProximity, (uint64_t)&unk_1C1266D50);
  return sub_1C1266608();
}

uint64_t sub_1C1262954()
{
  sub_1C12648B4(&qword_1EF6D2988, (uint64_t (*)(uint64_t))type metadata accessor for RPProximity, (uint64_t)&unk_1C1266D50);
  return sub_1C12665F0();
}

uint64_t RPPersonWrapper.activityLevel.getter()
{
  unsigned int *v0;

  return *v0;
}

void RPPersonWrapper.contactID.getter()
{
  sub_1C12649B0();
  sub_1C1264940();
  sub_1C12649E4();
}

uint64_t RPPersonWrapper.flags.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24);
}

void RPPersonWrapper.identifier.getter()
{
  sub_1C12649B0();
  sub_1C1264940();
  sub_1C12649E4();
}

void RPPersonWrapper.name.getter()
{
  sub_1C12649B0();
  sub_1C1264940();
  sub_1C12649E4();
}

uint64_t RPPersonWrapper.proximity.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 64);
}

uint64_t RPPersonWrapper.init(WithContactID:activityLevel:flags:identifier:name:proximity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10)
{
  *(_DWORD *)a9 = a3;
  *(_QWORD *)(a9 + 8) = result;
  *(_QWORD *)(a9 + 16) = a2;
  *(_DWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_DWORD *)(a9 + 64) = a10;
  return result;
}

void RPPersonWrapper.init(WithRPPerson:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;

  v17 = sub_1C12640FC(a1, (SEL *)&selRef_contactID);
  v5 = v4;
  v6 = sub_1C12649EC(v17, sel_activityLevel);
  v7 = (int)v6;
  v8 = sub_1C12649EC((uint64_t)v6, sel_flags);
  v9 = objc_msgSend(a1, sel_identifier);
  v10 = sub_1C12665D8();
  v12 = v11;

  v13 = sub_1C12640FC(a1, (SEL *)&selRef_name);
  v15 = v14;
  v16 = sub_1C12649EC(v13, sel_proximity);

  *(_DWORD *)a2 = v7;
  *(_QWORD *)(a2 + 8) = v17;
  *(_QWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 24) = v8;
  *(_QWORD *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v13;
  *(_QWORD *)(a2 + 56) = v15;
  *(_DWORD *)(a2 + 64) = v16;
}

BOOL sub_1C1262B40(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C1262B50()
{
  return sub_1C12666F8();
}

uint64_t sub_1C1262B74(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x7974697669746361 && a2 == 0xED00006C6576654CLL;
  if (v3 || (sub_1C12666D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x49746361746E6F63 && a2 == 0xE900000000000044;
    if (v6 || (sub_1C12666D4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7367616C66 && a2 == 0xE500000000000000;
      if (v7 || (sub_1C12666D4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
        if (v8 || (sub_1C12666D4() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 1701667182 && a2 == 0xE400000000000000;
          if (v9 || (sub_1C12666D4() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_1C12666D4();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_1C1262DCC()
{
  return 6;
}

uint64_t sub_1C1262DD4()
{
  sub_1C12666EC();
  sub_1C12666F8();
  return sub_1C1266704();
}

uint64_t sub_1C1262E18()
{
  return 0;
}

uint64_t sub_1C1262E24(char a1)
{
  return *(_QWORD *)&aActivitycontac[8 * a1];
}

BOOL sub_1C1262E44(char *a1, char *a2)
{
  return sub_1C1262B40(*a1, *a2);
}

uint64_t sub_1C1262E50()
{
  return sub_1C1262DD4();
}

uint64_t sub_1C1262E58()
{
  return sub_1C1262B50();
}

uint64_t sub_1C1262E60()
{
  sub_1C12666EC();
  sub_1C12666F8();
  return sub_1C1266704();
}

uint64_t sub_1C1262EA0()
{
  char *v0;

  return sub_1C1262E24(*v0);
}

uint64_t sub_1C1262EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1262B74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C1262ECC()
{
  return sub_1C1262E18();
}

uint64_t sub_1C1262EE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C1262DCC();
  *a1 = result;
  return result;
}

uint64_t sub_1C1262F0C()
{
  sub_1C12641B0();
  return sub_1C1266728();
}

uint64_t sub_1C1262F34()
{
  sub_1C12641B0();
  return sub_1C1266734();
}

void RPPersonWrapper.encode(to:)(_QWORD *a1)
{
  int *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;

  v4 = sub_1C126414C(&qword_1EF6D2850);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v19 = *((_QWORD *)v1 + 2);
  v20 = v9;
  v18 = v1[6];
  v10 = *((_QWORD *)v1 + 4);
  v16 = *((_QWORD *)v1 + 5);
  v17 = v10;
  v11 = *((_QWORD *)v1 + 7);
  v14 = *((_QWORD *)v1 + 6);
  v15 = v11;
  HIDWORD(v13) = v1[16];
  sub_1C126418C(a1, a1[3]);
  sub_1C12641B0();
  sub_1C126671C();
  v22 = v8;
  v21 = 0;
  type metadata accessor for RPActivityLevel(0);
  sub_1C12648B4(&qword_1EF6D2860, (uint64_t (*)(uint64_t))type metadata accessor for RPActivityLevel, (uint64_t)&protocol conformance descriptor for RPActivityLevel);
  sub_1C12648F8();
  if (!v2)
  {
    v12 = v18;
    LOBYTE(v22) = 1;
    sub_1C1264978();
    v22 = v12;
    v21 = 2;
    type metadata accessor for RPPersonFlags(0);
    sub_1C12648B4(&qword_1EF6D2868, (uint64_t (*)(uint64_t))type metadata accessor for RPPersonFlags, (uint64_t)&protocol conformance descriptor for RPPersonFlags);
    sub_1C12648F8();
    LOBYTE(v22) = 3;
    sub_1C12666BC();
    LOBYTE(v22) = 4;
    sub_1C1264978();
    v22 = HIDWORD(v13);
    v21 = 5;
    type metadata accessor for RPProximity(0);
    sub_1C12648B4(&qword_1EF6D2870, (uint64_t (*)(uint64_t))type metadata accessor for RPProximity, (uint64_t)&protocol conformance descriptor for RPProximity);
    sub_1C12648F8();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1C1264928();
}

void RPPersonWrapper.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v5;
  uint64_t v6;
  char v7;
  int v8;
  int v9;
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
  int v20;
  uint64_t v21;
  int v22;

  sub_1C126414C(&qword_1EF6D2878);
  MEMORY[0x1E0C80A78]();
  sub_1C126418C(a1, a1[3]);
  sub_1C12641B0();
  sub_1C1266710();
  if (v2)
  {
    v7 = 0;
    v8 = 0;
LABEL_4:
    sub_1C12649CC();
    if (!v8)
      goto LABEL_12;
    v9 = 0;
    goto LABEL_6;
  }
  type metadata accessor for RPActivityLevel(0);
  sub_1C12648B4(&qword_1EF6D2880, (uint64_t (*)(uint64_t))type metadata accessor for RPActivityLevel, (uint64_t)&protocol conformance descriptor for RPActivityLevel);
  sub_1C1264998();
  sub_1C1264958();
  v5 = v22;
  LOBYTE(v22) = 1;
  v6 = sub_1C1264964();
  v11 = v10;
  v21 = v6;
  type metadata accessor for RPPersonFlags(0);
  v12 = sub_1C12648B4(&qword_1EF6D2888, (uint64_t (*)(uint64_t))type metadata accessor for RPPersonFlags, (uint64_t)&protocol conformance descriptor for RPPersonFlags);
  swift_bridgeObjectRetain();
  sub_1C1264998();
  sub_1C1264958();
  if (v12)
  {
    sub_1C1264918();
    sub_1C1264988();
    v7 = 0;
    v8 = 1;
    goto LABEL_4;
  }
  v20 = v22;
  v18 = sub_1C1266698();
  v19 = v13;
  LOBYTE(v22) = 4;
  swift_bridgeObjectRetain();
  v17 = sub_1C1264964();
  v15 = v14;
  type metadata accessor for RPProximity(0);
  v16 = sub_1C12648B4(&qword_1EF6D2890, (uint64_t (*)(uint64_t))type metadata accessor for RPProximity, (uint64_t)&protocol conformance descriptor for RPProximity);
  sub_1C12649B0();
  sub_1C1264958();
  if (!v16)
  {
    sub_1C1264918();
    *(_DWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v21;
    *(_QWORD *)(a2 + 16) = v11;
    *(_DWORD *)(a2 + 24) = v20;
    *(_QWORD *)(a2 + 32) = v18;
    *(_QWORD *)(a2 + 40) = v19;
    *(_QWORD *)(a2 + 48) = v17;
    *(_QWORD *)(a2 + 56) = v15;
    *(_DWORD *)(a2 + 64) = v22;
    sub_1C12649CC();
    swift_bridgeObjectRelease();
    sub_1C12649DC();
    goto LABEL_11;
  }
  sub_1C1264918();
  sub_1C1264988();
  sub_1C12649DC();
  swift_bridgeObjectRelease();
  sub_1C12649CC();
  v7 = 1;
  v9 = 1;
LABEL_6:
  sub_1C1264988();
  if ((v7 & 1) == 0)
  {
    if (!v9)
      goto LABEL_12;
    goto LABEL_11;
  }
  sub_1C12649DC();
  if ((v9 & 1) != 0)
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
  sub_1C1264928();
}

void sub_1C1263488(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  RPPersonWrapper.init(from:)(a1, a2);
}

void sub_1C126349C(_QWORD *a1)
{
  RPPersonWrapper.encode(to:)(a1);
}

uint64_t PeopleDiscoveryEvent.peopleDiscovered.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  objc_class *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  char *v32;
  objc_super v33;

  v1 = result;
  if (result >> 62)
  {
    result = sub_1C1266674();
    v2 = result;
  }
  else
  {
    v2 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2)
  {
    v32 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_21:
    swift_bridgeObjectRelease();
    v24 = (char *)objc_allocWithZone(v25);
    *(_QWORD *)&v24[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = v32;
    v33.receiver = v24;
    v33.super_class = v25;
    return (unint64_t)objc_msgSendSuper2(&v33, sel_init);
  }
  if (v2 >= 1)
  {
    v3 = 0;
    v28 = v1 & 0xC000000000000001;
    v32 = (char *)MEMORY[0x1E0DEE9D8];
    v26 = v2;
    v27 = v1;
    do
    {
      if (v28)
        v4 = (id)MEMORY[0x1C3BA8644](v3, v1);
      else
        v4 = *(id *)(v1 + 8 * v3 + 32);
      v5 = v4;
      v6 = objc_msgSend(v4, sel_devices);
      sub_1C126420C();
      v7 = sub_1C1266620();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        v8 = sub_1C1266674();
        sub_1C1264990();
      }
      else
      {
        v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      sub_1C1264990();
      if (v8)
      {
        v9 = v5;
        v10 = sub_1C12640FC(v9, (SEL *)&selRef_contactID);
        v31 = v11;
        v12 = sub_1C12649D4(v10, sel_activityLevel);
        v30 = (int)v12;
        v29 = sub_1C12649D4((uint64_t)v12, sel_flags);
        v13 = objc_msgSend(v9, sel_identifier);
        v14 = sub_1C12665D8();
        v16 = v15;

        v17 = sub_1C12640FC(v9, (SEL *)&selRef_name);
        v19 = v18;
        v20 = sub_1C12649D4(v17, sel_proximity);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v32 = sub_1C1263E84(0, *((_QWORD *)v32 + 2) + 1, 1, (uint64_t)v32);
        v22 = *((_QWORD *)v32 + 2);
        v21 = *((_QWORD *)v32 + 3);
        if (v22 >= v21 >> 1)
          v32 = sub_1C1263E84((char *)(v21 > 1), v22 + 1, 1, (uint64_t)v32);
        *((_QWORD *)v32 + 2) = v22 + 1;
        v23 = &v32[72 * v22];
        *((_DWORD *)v23 + 8) = v30;
        *((_QWORD *)v23 + 5) = v10;
        *((_QWORD *)v23 + 6) = v31;
        *((_DWORD *)v23 + 14) = v29;
        *((_QWORD *)v23 + 8) = v14;
        *((_QWORD *)v23 + 9) = v16;
        *((_QWORD *)v23 + 10) = v17;
        *((_QWORD *)v23 + 11) = v19;
        *((_DWORD *)v23 + 24) = v20;
        v2 = v26;
        v1 = v27;
      }
      ++v3;

    }
    while (v2 != v3);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = a1;
  v10.receiver = v3;
  v10.super_class = v1;
  sub_1C12649C4((uint64_t)v3, sel_init, v4, v5, v6, v7, v8, v9, v10);
  sub_1C12649B8();
}

void PeopleDiscoveryEvent.init(WithPeopleDiscovered:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = a1;
  v10.receiver = v1;
  v10.super_class = ObjectType;
  sub_1C12649C4((uint64_t)ObjectType, sel_init, v4, v5, v6, v7, v8, v9, v10);
  sub_1C12649B8();
}

uint64_t PeopleDiscoveryEvent.dataVersion.getter()
{
  return 1;
}

id static PeopleDiscoveryEvent.event(with:dataVersion:)(uint64_t a1, uint64_t a2, int a3)
{
  objc_class *v3;
  objc_class *v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;

  v4 = v3;
  v5 = 0;
  if (a3 == 1)
  {
    sub_1C1266530();
    sub_1C12649F4();
    sub_1C1266524();
    sub_1C126414C(&qword_1EF6D28A8);
    sub_1C12642C8(&qword_1EF6D28B0, (uint64_t (*)(void))sub_1C126428C, MEMORY[0x1E0DEAF40]);
    sub_1C1266518();
    v6 = (char *)objc_allocWithZone(v4);
    *(_QWORD *)&v6[OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered] = v15;
    v14.receiver = v6;
    v14.super_class = v4;
    v5 = sub_1C12649C4((uint64_t)v6, sel_init, v7, v8, v9, v10, v11, v12, v14);
    swift_release();
  }
  return v5;
}

uint64_t PeopleDiscoveryEvent.serialize()()
{
  uint64_t v0;

  sub_1C1266560();
  sub_1C12649F4();
  sub_1C1266554();
  sub_1C126653C();
  swift_bridgeObjectRetain();
  sub_1C126414C(&qword_1EF6D28A8);
  sub_1C12642C8(&qword_1EF6D28D0, (uint64_t (*)(void))sub_1C1264330, MEMORY[0x1E0DEAF10]);
  v0 = sub_1C1266548();
  swift_release();
  sub_1C1264990();
  return v0;
}

uint64_t PeopleDiscoveryEvent.json()()
{
  uint64_t v0;
  void *v1;
  uint64_t inited;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v10[10];

  v10[9] = *(id *)MEMORY[0x1E0C80C00];
  v1 = (void *)objc_opt_self();
  sub_1C126414C(&qword_1EF6D28E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C1266DF0;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x80000001C1267680;
  *(_QWORD *)(inited + 48) = MEMORY[0x1C3BA8614](*(_QWORD *)(v0+ OBJC_IVAR____TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent_peopleDiscovered), &type metadata for RPPersonWrapper);
  *(_QWORD *)(inited + 56) = v3;
  sub_1C12665C0();
  v4 = (void *)sub_1C12665B4();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v5 = objc_msgSend(v1, sel_dataWithJSONObject_options_error_, v4, 1, v10);

  v6 = v10[0];
  if (v5)
  {
    sub_1C1266584();
    sub_1C126494C();
  }
  else
  {
    v7 = v6;
    v8 = (void *)sub_1C126656C();

    swift_willThrow();
  }
  return sub_1C1264940();
}

id sub_1C1263D84(void *a1, uint64_t a2, void (*a3)(void))
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a1;
  a3();
  sub_1C126494C();
  if (v4 >> 60 == 15)
  {
    v5 = 0;
  }
  else
  {
    sub_1C1264940();
    v5 = (void *)sub_1C1266578();
    v6 = sub_1C1264940();
    sub_1C126485C(v6, v7);
  }
  return v5;
}

id PeopleDiscoveryEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PeopleDiscoveryEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PeopleDiscoveryEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1C1263E84(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_1C126414C((uint64_t *)&unk_1EF6D29A0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C1264074((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C1263F78(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C1263F78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 72 * a1 + 32;
    v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C1266680();
  __break(1u);
  return result;
}

char *sub_1C1264074(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C1266680();
    __break(1u);
  }
  else if (__dst != __src || &__src[72 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

uint64_t sub_1C12640FC(void *a1, SEL *a2)
{
  if (objc_msgSend(a1, *a2))
  {
    sub_1C12665D8();
    sub_1C126494C();
  }
  return sub_1C1264940();
}

uint64_t sub_1C126414C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BA8AA0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_1C126418C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C12641B0()
{
  unint64_t result;

  result = qword_1EF6D2858;
  if (!qword_1EF6D2858)
  {
    result = MEMORY[0x1C3BA8AB8](&unk_1C126708C, &type metadata for RPPersonWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D2858);
  }
  return result;
}

uint64_t sub_1C12641EC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_1C126420C()
{
  unint64_t result;

  result = qword_1EF6D28A0;
  if (!qword_1EF6D28A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF6D28A0);
  }
  return result;
}

uint64_t sub_1C1264248(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BA8AAC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C126428C()
{
  unint64_t result;

  result = qword_1EF6D28B8;
  if (!qword_1EF6D28B8)
  {
    result = MEMORY[0x1C3BA8AB8](&protocol conformance descriptor for RPPersonWrapper, &type metadata for RPPersonWrapper);
    atomic_store(result, (unint64_t *)&qword_1EF6D28B8);
  }
  return result;
}

uint64_t sub_1C12642C8(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = sub_1C1264248(&qword_1EF6D28A8);
    v8 = a2();
    result = MEMORY[0x1C3BA8AB8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C1264330()
{
  unint64_t result;

  result = qword_1EF6D28D8;
  if (!qword_1EF6D28D8)
  {
    result = MEMORY[0x1C3BA8AB8](&protocol conformance descriptor for RPPersonWrapper, &type metadata for RPPersonWrapper);
    atomic_store(result, (unint64_t *)&qword_1EF6D28D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RPPersonWrapper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RPPersonWrapper()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  return a1;
}

void *initializeWithTake for RPPersonWrapper(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x44uLL);
}

uint64_t assignWithTake for RPPersonWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for RPPersonWrapper(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 68))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RPPersonWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 68) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 68) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RPPersonWrapper()
{
  return &type metadata for RPPersonWrapper;
}

uint64_t type metadata accessor for PeopleDiscoveryEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for PeopleDiscoveryEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleDiscoveryEvent.__allocating_init(WithPeopleDiscovered:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

_BYTE *initializeBufferWithCopyOfBuffer for RPPersonWrapper.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RPPersonWrapper.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RPPersonWrapper.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C126470C + 4 * byte_1C1266E05[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1C1264740 + 4 * byte_1C1266E00[v4]))();
}

uint64_t sub_1C1264740(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1264748(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1264750);
  return result;
}

uint64_t sub_1C126475C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1264764);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1C1264768(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1264770(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C126477C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C1264784(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RPPersonWrapper.CodingKeys()
{
  return &type metadata for RPPersonWrapper.CodingKeys;
}

unint64_t sub_1C12647A0()
{
  unint64_t result;

  result = qword_1EF6D2970;
  if (!qword_1EF6D2970)
  {
    result = MEMORY[0x1C3BA8AB8](&unk_1C1267064, &type metadata for RPPersonWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D2970);
  }
  return result;
}

unint64_t sub_1C12647E0()
{
  unint64_t result;

  result = qword_1EF6D2978;
  if (!qword_1EF6D2978)
  {
    result = MEMORY[0x1C3BA8AB8](&unk_1C1266FD4, &type metadata for RPPersonWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D2978);
  }
  return result;
}

unint64_t sub_1C1264820()
{
  unint64_t result;

  result = qword_1EF6D2980;
  if (!qword_1EF6D2980)
  {
    result = MEMORY[0x1C3BA8AB8](&unk_1C1266FFC, &type metadata for RPPersonWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D2980);
  }
  return result;
}

uint64_t sub_1C126485C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1C1264870(a1, a2);
  return a1;
}

uint64_t sub_1C1264870(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C12648B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3BA8AB8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C12648F8()
{
  return sub_1C12666C8();
}

uint64_t sub_1C1264918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1C1264940()
{
  uint64_t v0;

  return v0;
}

void sub_1C126494C()
{
  void *v0;

}

uint64_t sub_1C1264958()
{
  return sub_1C12666A4();
}

uint64_t sub_1C1264964()
{
  return sub_1C126668C();
}

uint64_t sub_1C1264978()
{
  return sub_1C12666B0();
}

uint64_t sub_1C1264988()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1264990()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C1264998()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C12649B0()
{
  return swift_bridgeObjectRetain();
}

id sub_1C12649C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_1C12649CC()
{
  uint64_t v0;

  return sub_1C12641EC(v0);
}

id sub_1C12649D4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_1C12649DC()
{
  return swift_bridgeObjectRelease();
}

id sub_1C12649EC(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_1C12649F4()
{
  return swift_allocObject();
}

void sub_1C1264B34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C1264BC8(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C1264CF0(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C1265028(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C12650AC(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C1265180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C12652E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C12653F8(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C1265574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C1265638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C1265904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  pthread_mutex_t *v3;
  void *v4;
  void *v5;

  pthread_mutex_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1C1265A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  pthread_mutex_t *v10;
  void *v11;
  void *v12;

  v12 = v11;

  pthread_mutex_unlock(v10);
  _Unwind_Resume(a1);
}

uint64_t *sub_1C1265B14(uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
    JUMPOUT(0x1C3BA877CLL);
  }
  return result;
}

void sub_1C1265B64(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1C1265B74(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  char *v21;
  void *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  void *v33[2];
  uint64_t v34;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = (a2 + 7) >> 3;
  v6 = *(char **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (v7 - *(_QWORD *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8)
      goto LABEL_21;
    v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  v9 = v5 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(_QWORD *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  v34 = 0;
  v32 = 0u;
  *(_OWORD *)v33 = 0u;
  if ((a2 + 7) >> 62)
    sub_1C1265FD4();
  v11 = v10 - (_QWORD)v6;
  if (v11 >> 4 > v5)
    v5 = v11 >> 4;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
    v12 = 0x7FFFFFFFFFFFFFFLL;
  else
    v12 = v5;
  sub_1C1265FE0(&v32, v12, v8, a1 + 16);
  v13 = (char *)v33[0];
  bzero(v33[0], 32 * v9);
  v14 = &v13[32 * v9];
  v33[0] = v14;
  v16 = *(char **)a1;
  v15 = *(char **)(a1 + 8);
  v17 = *((_QWORD *)&v32 + 1);
  if (v15 == *(char **)a1)
  {
    v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      v18 = *((_OWORD *)v15 - 2);
      v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *(_OWORD *)(v17 - 32) = v18;
      *(_OWORD *)(v17 - 16) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    v20 = *(char **)a1;
    v15 = *(char **)(a1 + 8);
    v14 = (char *)v33[0];
  }
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v14;
  v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v33[1];
  v33[0] = v15;
  v33[1] = v22;
  *(_QWORD *)&v32 = v20;
  *((_QWORD *)&v32 + 1) = v20;
  if (v15 != v20)
    v33[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  if (v20)
    free(v20);
LABEL_21:
  *(_QWORD *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    v23 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
    if (v23 < (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 5)
    {
      v34 = 0;
      v32 = 0u;
      *(_OWORD *)v33 = 0u;
      sub_1C1265FE0(&v32, v23, v23, a1 + 16);
      v25 = *(char **)a1;
      v24 = *(char **)(a1 + 8);
      v26 = *((_QWORD *)&v32 + 1);
      if (v24 == *(char **)a1)
      {
        v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          v27 = *((_OWORD *)v24 - 2);
          v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *(_OWORD *)(v26 - 32) = v27;
          *(_OWORD *)(v26 - 16) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        v29 = *(char **)a1;
        v24 = *(char **)(a1 + 8);
      }
      *(_QWORD *)a1 = v26;
      v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v33;
      v33[0] = v24;
      v33[1] = v30;
      *(_QWORD *)&v32 = v29;
      *((_QWORD *)&v32 + 1) = v29;
      if (v24 != v29)
        v33[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      if (v29)
        free(v29);
    }
    v31 = *(_QWORD *)(a1 + 24);
    if (v31)
      bzero((void *)(*(_QWORD *)a1 + 4 * v31), *(_QWORD *)(a1 + 8) - (*(_QWORD *)a1 + 4 * v31));
  }
}

void sub_1C1265D94(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1C1265D60);
}

void sub_1C1265DA4(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  char *v21;
  void *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  void *v33[2];
  uint64_t v34;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = (a2 + 7) >> 3;
  v6 = *(char **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (v7 - *(_QWORD *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8)
      goto LABEL_21;
    v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  v9 = v5 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(_QWORD *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  v34 = 0;
  v32 = 0u;
  *(_OWORD *)v33 = 0u;
  if ((a2 + 7) >> 62)
    sub_1C1265FD4();
  v11 = v10 - (_QWORD)v6;
  if (v11 >> 4 > v5)
    v5 = v11 >> 4;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
    v12 = 0x7FFFFFFFFFFFFFFLL;
  else
    v12 = v5;
  sub_1C1265FE0(&v32, v12, v8, a1 + 16);
  v13 = (char *)v33[0];
  bzero(v33[0], 32 * v9);
  v14 = &v13[32 * v9];
  v33[0] = v14;
  v16 = *(char **)a1;
  v15 = *(char **)(a1 + 8);
  v17 = *((_QWORD *)&v32 + 1);
  if (v15 == *(char **)a1)
  {
    v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      v18 = *((_OWORD *)v15 - 2);
      v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *(_OWORD *)(v17 - 32) = v18;
      *(_OWORD *)(v17 - 16) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    v20 = *(char **)a1;
    v15 = *(char **)(a1 + 8);
    v14 = (char *)v33[0];
  }
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v14;
  v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v33[1];
  v33[0] = v15;
  v33[1] = v22;
  *(_QWORD *)&v32 = v20;
  *((_QWORD *)&v32 + 1) = v20;
  if (v15 != v20)
    v33[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  if (v20)
    free(v20);
LABEL_21:
  *(_QWORD *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    v23 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
    if (v23 < (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 5)
    {
      v34 = 0;
      v32 = 0u;
      *(_OWORD *)v33 = 0u;
      sub_1C1265FE0(&v32, v23, v23, a1 + 16);
      v25 = *(char **)a1;
      v24 = *(char **)(a1 + 8);
      v26 = *((_QWORD *)&v32 + 1);
      if (v24 == *(char **)a1)
      {
        v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          v27 = *((_OWORD *)v24 - 2);
          v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *(_OWORD *)(v26 - 32) = v27;
          *(_OWORD *)(v26 - 16) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        v29 = *(char **)a1;
        v24 = *(char **)(a1 + 8);
      }
      *(_QWORD *)a1 = v26;
      v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v33;
      v33[0] = v24;
      v33[1] = v30;
      *(_QWORD *)&v32 = v29;
      *((_QWORD *)&v32 + 1) = v29;
      if (v24 != v29)
        v33[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      if (v29)
        free(v29);
    }
    v31 = *(_QWORD *)(a1 + 24);
    if (v31)
      bzero((void *)(*(_QWORD *)a1 + 4 * v31), *(_QWORD *)(a1 + 8) - (*(_QWORD *)a1 + 4 * v31));
  }
}

void sub_1C1265FC4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1C1265F90);
}

void sub_1C1265FD4()
{
  sub_1C1266084();
}

_QWORD *sub_1C1265FE0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v7;
  char *v8;
  std::bad_alloc *exception;
  std::bad_alloc *v11;
  void *memptr;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    memptr = 0;
    if (malloc_type_posix_memalign(&memptr, 0x40uLL, 32 * a2, 0x1000040E0EAB150uLL))
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v11 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v11, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
    }
    v7 = (char *)memptr;
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[32 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[32 * a2];
  return a1;
}

void sub_1C1266084()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C12660CC(exception);
  __cxa_throw(exception, (struct type_info *)off_1E7A7B470, MEMORY[0x1E0DE42D0]);
}

void sub_1C12660B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C12660CC(std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

uint64_t sub_1C12660F8(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(result + 40) == a3)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t sub_1C126611C(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 40) == a2)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

float sub_1C1266140(uint64_t ***a1, int a2, int a3)
{
  float v3;
  size_t v8;
  unint64_t v9;
  float *v10;
  size_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  double v27;
  float v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  float v34;
  float v35;
  int v37;
  int v38;
  id v39;
  id v40;
  uint64_t v41;
  void *memptr;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (a2 != 0xFFFF && a3 != 0xFFFF)
    return v3;
  v8 = (**a1)[1] - ***a1;
  v9 = v8 | 0xF;
  memptr = 0;
  v43 = 0;
  if ((v8 | 0xF) > 0x800)
  {
    v37 = malloc_type_posix_memalign(&memptr, 0x10uLL, v8, 0x72D18ACAuLL);
    LOBYTE(v43) = 0;
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v39);
    }
    v10 = (float *)memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    bzero((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v8 | 0xF);
    v10 = (float *)(((unint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  v11 = v8 | 3;
  memptr = 0;
  v43 = 0;
  if ((v8 | 3) > 0x800)
  {
    v38 = malloc_type_posix_memalign(&memptr, 8uLL, v8, 0x50C67BDFuLL);
    LOBYTE(v43) = 0;
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v40);
    }
    v12 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
  }
  if ((a3 & a2) == 0xFFFF)
  {
    v13 = **a1;
    v14 = *v13;
    if (v13[1] != *v13)
    {
      v15 = 0;
      v16 = 0uLL;
      v17 = 0uLL;
      do
      {
        v18 = (float32x4_t *)(v14 + 32 * v15);
        v19 = *v18;
        v20 = v18[1];
        v17 = vaddq_f32(v17, v20);
        v16 = vaddq_f32(v16, *v18);
        v21 = (float32x4_t *)&v10[8 * v15];
        *v21 = v19;
        v21[1] = v20;
        ++v15;
        v13 = **a1;
        v14 = *v13;
      }
      while (v15 < (v13[1] - *v13) >> 5);
    }
    v25 = *((_DWORD *)v13 + 6);
LABEL_29:
    if (v25 < 1)
    {
      v3 = 0.0;
    }
    else
    {
      cblas_sscal_NEWLAPACK();
      LODWORD(memptr) = (v25 + 7) & 0xFFFFFFF8;
      vvlog2f((float *)v12, v10, (const int *)&memptr);
      cblas_sdot_NEWLAPACK();
      v3 = -v35;
    }
    goto LABEL_32;
  }
  if (a2 == 0xFFFF)
  {
    v22 = **a1;
    v23 = v22[3];
    if (v23)
    {
      v24 = 0;
      v25 = 0;
      v26 = v22[4];
      v27 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v26 + 4 * v24) == a3)
        {
          v28 = *(float *)(*v22 + 4 * v24);
          v27 = v27 + v28;
          v10[v25++] = v28;
        }
        ++v24;
      }
      while (v23 > v24);
      goto LABEL_29;
    }
  }
  else
  {
    v29 = **a1;
    v30 = v29[3];
    if (v30)
    {
      v31 = 0;
      v25 = 0;
      v32 = v29[4];
      v33 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v32 + 4 * v31 + 2) == a2)
        {
          v34 = *(float *)(*v29 + 4 * v31);
          v33 = v33 + v34;
          v10[v25++] = v34;
        }
        ++v31;
      }
      while (v30 > v31);
      goto LABEL_29;
    }
  }
LABEL_32:
  if (v11 >= 0x801)
    free(v12);
  if (v9 >= 0x801)
    free(v10);
  if (fabsf(v3) == INFINITY)
    return 0.0;
  return v3;
}

uint64_t sub_1C1266518()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1C1266524()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1C1266530()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1C126653C()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_1C1266548()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1C1266554()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1C1266560()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1C126656C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C1266578()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C1266584()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C1266590()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C126659C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C12665A8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C12665B4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C12665C0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C12665CC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C12665D8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C12665E4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C12665F0()
{
  return MEMORY[0x1E0DEACD0]();
}

uint64_t sub_1C12665FC()
{
  return MEMORY[0x1E0DEACF0]();
}

uint64_t sub_1C1266608()
{
  return MEMORY[0x1E0DEAD48]();
}

uint64_t sub_1C1266614()
{
  return MEMORY[0x1E0DEAD68]();
}

uint64_t sub_1C1266620()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C126662C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C1266638()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C1266644()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C1266650()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C126665C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C1266668()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C1266674()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C1266680()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C126668C()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1C1266698()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C12666A4()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C12666B0()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1C12666BC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C12666C8()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C12666D4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C12666E0()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1C12666EC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C12666F8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C1266704()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C1266710()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C126671C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C1266728()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C1266734()
{
  return MEMORY[0x1E0DEE8E8]();
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete()
{
  return off_1E7A7B488();
}

uint64_t operator new()
{
  return off_1E7A7B490();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cblas_sdot_NEWLAPACK()
{
  return MEMORY[0x1E0C8BBE0]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC68]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void vvlog2f(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DA80](a1, a2, a3);
}


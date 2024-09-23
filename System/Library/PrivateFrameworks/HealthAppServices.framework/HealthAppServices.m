const __CFString *HAStringForDataRequestType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("write");
  if (a1)
    return v1;
  else
    return CFSTR("read");
}

id AllHealthAppAnalyticsAgreements()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("ImproveHealthAndAnalytics");
  v1[1] = CFSTR("ImproveHealthRecords");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ContactDeepLinkingParameter.value.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContactDeepLinkingParameter.value.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ContactDeepLinkingParameter.value.modify())()
{
  return nullsub_1;
}

uint64_t static ContactDeepLinkingParameter.keyName.getter()
{
  return sub_1D712F784(&qword_1F00AE3C0);
}

uint64_t static ContactDeepLinkingParameter.keyName.setter(uint64_t a1, uint64_t a2)
{
  return sub_1D712F7E4(a1, a2, &qword_1F00AE3C0, &qword_1F00AE3C8);
}

uint64_t (*static ContactDeepLinkingParameter.keyName.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

HealthAppServices::ContactDeepLinkingParameter __swiftcall ContactDeepLinkingParameter.init(value:)(HealthAppServices::ContactDeepLinkingParameter value)
{
  HealthAppServices::ContactDeepLinkingParameter *v1;

  *v1 = value;
  return value;
}

_QWORD *sub_1D712F700@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1D712F70C(uint64_t a1, uint64_t a2)
{
  return sub_1D7130D84(a1, a2, &qword_1F00AE3C0);
}

uint64_t sub_1D712F71C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D712F728(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*sub_1D712F758())()
{
  return nullsub_1;
}

uint64_t SharingInviteFlowURLData.contactData.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static SharingInviteFlowURLData.urlPath.getter()
{
  return sub_1D712F784(&qword_1F00AE3D0);
}

uint64_t sub_1D712F784(uint64_t *a1)
{
  uint64_t v2;

  swift_beginAccess();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static SharingInviteFlowURLData.urlPath.setter(uint64_t a1, uint64_t a2)
{
  return sub_1D712F7E4(a1, a2, &qword_1F00AE3D0, &qword_1F00AE3D8);
}

uint64_t sub_1D712F7E4(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  swift_beginAccess();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SharingInviteFlowURLData.urlPath.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

HealthAppServices::SharingInviteFlowURLData __swiftcall SharingInviteFlowURLData.init(contactData:)(HealthAppServices::SharingInviteFlowURLData contactData)
{
  _OWORD *v1;

  *v1 = *(_OWORD *)contactData.contactData.value.value._countAndFlagsBits;
  return contactData;
}

void static SharingInviteFlowURLData.isSharingInviteFlow(_:)(void *a1)
{
  id v1;

  v1 = objc_msgSend(a1, sel_activityType);
  sub_1D714631C();

  JUMPOUT(0x1D712FA24);
}

uint64_t sub_1D712FA24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  if (v1 == 0xD000000000000022 && (*(_QWORD *)(v4 - 104) | 0x8000000000000000) == v0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v5 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    *(_BYTE *)(v4 - 89) = v3;
    DeepLinkActivityType.rawValue.getter();
    v7 = v6;
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(), sel_healthAppSharingInviteFlowPath);
    v11 = sub_1D714631C();
    v13 = v12;

    if (v7 == v11 && v9 == v13)
      v15 = 1;
    else
      v15 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v15 & 1;
  }
  if (v2 != 18)
    JUMPOUT(0x1D712FA00);
  swift_bridgeObjectRelease();
  v15 = 0;
  return v15 & 1;
}

uint64_t sub_1D712FCB4(uint64_t a1, uint64_t a2)
{
  return sub_1D712FCCC(a1, a2, (uint64_t (*)(void))DeepLinkActivityType.rawValue.getter);
}

uint64_t sub_1D712FCC0(uint64_t a1, uint64_t a2)
{
  return sub_1D712FCCC(a1, a2, (uint64_t (*)(void))QueryParameterName.rawValue.getter);
}

uint64_t sub_1D712FCCC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

void sub_1D712FD64(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1D712FDB0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1D712FEB4 + 4 * byte_1D71471FA[a2]))(1702125924);
}

uint64_t sub_1D712FEB4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1702125924 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t SharingInviteFlowURLData.url()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  uint64_t v15;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[4];

  v3 = sub_1D714610C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7131240(0, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v23 - v8;
  v10 = sub_1D7146274();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v1;
  v14 = v1[1];
  sub_1D7130278();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1D71312DC((uint64_t)v9, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a1, 1, 1, v10);
  }
  else
  {
    v23[0] = a1;
    v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v17(v13, v9, v10);
    if (v14)
    {
      v23[1] = v15;
      v23[2] = v14;
      swift_bridgeObjectRetain();
      sub_1D7146100();
      sub_1D7130F40();
      v18 = sub_1D7146478();
      v20 = v19;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v21 = qword_1F00AE3C8;
      swift_bridgeObjectRetain();
      sub_1D713DCCC(v21, v18, v20, v23[0]);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {
      v22 = v23[0];
      v17((char *)v23[0], v13, v10);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
    }
  }
}

uint64_t sub_1D7130278()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_externalHealthAppURLScheme);
  sub_1D714631C();

  v2 = objc_msgSend(v0, sel_externalHealthAppURLHost);
  sub_1D714631C();

  sub_1D7146364();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146364();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146268();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D71303A8()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_externalHealthAppURLScheme);
  sub_1D714631C();

  v2 = objc_msgSend(v0, sel_externalHealthAppURLHost);
  sub_1D714631C();

  sub_1D7146364();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146364();
  if (qword_1F00AE3F0 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146268();
  return swift_bridgeObjectRelease();
}

uint64_t static SharingInviteFlowURLData.fromURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v20;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = sub_1D714613C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v31 - v9;
  v11 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v13, a1, v14);
  v15 = HAURL.queryItems.getter();
  if (v15)
  {
    v16 = *(_QWORD *)(v15 + 16);
    if (!v16)
      goto LABEL_15;
    v32 = v10;
    v33 = v15;
    v34 = v13;
    v35 = a2;
    v17 = v15 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v18 = *(_QWORD *)(v5 + 72);
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    while (1)
    {
      v19(v8, v17, v4);
      if (sub_1D7146124() == qword_1F00AE3C0 && v20 == qword_1F00AE3C8)
        break;
      v22 = sub_1D71465A4();
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        goto LABEL_12;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      v17 += v18;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        v13 = v34;
        a2 = v35;
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    v23 = v32;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v32, v8, v4);
    v24 = sub_1D7146130();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v23, v4);
    v13 = v34;
    a2 = v35;
    if (v26)
    {
      v36 = v24;
      v37 = v26;
      sub_1D7130F40();
      v27 = sub_1D7146490();
      v29 = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v29)
      {
        result = sub_1D7130F84((uint64_t)v13);
        *a2 = v27;
        a2[1] = v29;
        return result;
      }
    }
    else
    {
LABEL_15:
      swift_bridgeObjectRelease();
    }
  }
  result = sub_1D7130F84((uint64_t)v13);
  *a2 = 0;
  a2[1] = 0;
  return result;
}

NSUserActivity __swiftcall SharingInviteFlowURLData.userActivity()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t inited;
  void *v9;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *v0;
  v1 = v0[1];
  sub_1D71464F0();
  swift_bridgeObjectRelease();
  v11 = 0xD000000000000012;
  v12 = 0x80000001D7148810;
  if (v1)
    v3 = v2;
  else
    v3 = 0;
  v13 = v3;
  v14 = v1;
  v4 = MEMORY[0x1E0DEA968];
  sub_1D7131298(0, &qword_1F00AE438);
  swift_bridgeObjectRetain();
  sub_1D7146334();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  v5 = v11;
  LOBYTE(v11) = 14;
  _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(v5, v12, (unsigned __int8 *)&v11, 0, 0, 2, 0);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_1D7131240(0, (unint64_t *)&qword_1EDBEA578, (uint64_t (*)(uint64_t))sub_1D7130FC8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D7147290;
    swift_beginAccess();
    v13 = qword_1F00AE3C0;
    v14 = qword_1F00AE3C8;
    swift_bridgeObjectRetain();
    sub_1D71464D8();
    *(_QWORD *)(inited + 96) = v4;
    *(_QWORD *)(inited + 72) = v2;
    *(_QWORD *)(inited + 80) = v1;
    swift_bridgeObjectRetain();
    sub_1D7130E18(inited);
    v9 = (void *)sub_1D71462EC();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_addUserInfoEntriesFromDictionary_, v9);

  }
  return (NSUserActivity)v7;
}

double static SharingInviteFlowURLData.fromUserActivity(_:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  sub_1D7130994(a1, &v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_1D7130994@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t result;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v3 = objc_msgSend(a1, sel_userInfo);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1D71462F8();

    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1D71464D8();
    if (*(_QWORD *)(v5 + 16) && (v6 = sub_1D713E0AC((uint64_t)v10), (v7 & 1) != 0))
    {
      sub_1D7131354(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v11);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    sub_1D7131320((uint64_t)v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  sub_1D7131298(0, (unint64_t *)&qword_1F00AE488);
  result = swift_dynamicCast();
  if ((_DWORD)result)
    v9 = v10[0];
  else
    v9 = 0uLL;
  *a2 = v9;
  return result;
}

uint64_t sub_1D7130AD8@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[2];
  _BYTE v23[40];
  __int128 v24;
  __int128 v25;

  sub_1D7131240(0, &qword_1F00AE480, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v22 - v5;
  v7 = sub_1D71462BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_userInfo);
  if (v11)
  {
    v12 = v11;
    v13 = sub_1D71462F8();

    if (qword_1F00AE3E8 != -1)
      swift_once();
    swift_beginAccess();
    v22[0] = qword_1F00AE4D0;
    v22[1] = *(_QWORD *)algn_1F00AE4D8;
    swift_bridgeObjectRetain();
    sub_1D71464D8();
    if (*(_QWORD *)(v13 + 16) && (v14 = sub_1D713E0AC((uint64_t)v23), (v15 & 1) != 0))
    {
      sub_1D7131354(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v24);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    sub_1D7131320((uint64_t)v23);
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  sub_1D7131298(0, (unint64_t *)&qword_1F00AE488);
  v16 = swift_dynamicCast();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v16)
  {
    v17(v6, 0, 1, v7);
    v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v10, v6, v7);
    v18(a2, v10, v7);
    v19 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 0, 1, v19);
  }
  else
  {
    v17(v6, 1, 1, v7);
    sub_1D71312DC((uint64_t)v6, &qword_1F00AE480, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998]);
    v21 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a2, 1, 1, v21);
  }
}

uint64_t sub_1D7130D74(uint64_t a1, uint64_t a2)
{
  return sub_1D7130D84(a1, a2, &qword_1F00AE3D0);
}

uint64_t sub_1D7130D84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  swift_beginAccess();
  v4 = *a3;
  swift_bridgeObjectRetain();
  return v4;
}

double sub_1D7130DE4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  sub_1D7130994(a1, &v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

unint64_t sub_1D7130E18(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1D7131390();
  v2 = sub_1D7146550();
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
    sub_1D71313F8(v6, (uint64_t)v15);
    result = sub_1D713E0AC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1D713143C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_1D7130F40()
{
  unint64_t result;

  result = qword_1EDBEA798;
  if (!qword_1EDBEA798)
  {
    result = MEMORY[0x1D8292E28](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDBEA798);
  }
  return result;
}

uint64_t sub_1D7130F84(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HAURL();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D7130FC0()
{
  return 1;
}

void sub_1D7130FC8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EDBEA528)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EDBEA528);
  }
}

_UNKNOWN **sub_1D7131030()
{
  return &protocol witness table for String;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactDeepLinkingParameter(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ContactDeepLinkingParameter(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ContactDeepLinkingParameter()
{
  return &type metadata for ContactDeepLinkingParameter;
}

_QWORD *initializeBufferWithCopyOfBuffer for SharingInviteFlowURLData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SharingInviteFlowURLData()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PluginURLType(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SharingInviteFlowURLData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingInviteFlowURLData(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingInviteFlowURLData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for SharingInviteFlowURLData()
{
  return &type metadata for SharingInviteFlowURLData;
}

void sub_1D7131240(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_1D7131298(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1D7146454();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1D71312DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1D7131240(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1D7131320(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1D7131354(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1D7131390()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDBEA570)
  {
    v0 = sub_1D714655C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDBEA570);
  }
}

uint64_t sub_1D71313F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D7130FC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1D713143C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t static ProfileInformationSupport.localizedFullName(firstName:lastName:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1D71461CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71461C0();
  swift_bridgeObjectRetain();
  sub_1D714619C();
  swift_bridgeObjectRetain();
  sub_1D71461A8();
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1D71461B4();
  v6 = objc_msgSend(v4, sel_localizedStringFromPersonNameComponents_style_options_, v5, 2, 0);

  v7 = sub_1D714631C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

uint64_t static ProfileInformationSupport.localizedShortName(firstName:lastName:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1D71461CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71461C0();
  swift_bridgeObjectRetain();
  sub_1D714619C();
  swift_bridgeObjectRetain();
  sub_1D71461A8();
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1D71461B4();
  v6 = objc_msgSend(v4, sel_localizedStringFromPersonNameComponents_style_options_, v5, 1, 0);

  v7 = sub_1D714631C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

uint64_t static ProfileInformationSupport.localizedFullNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;

  HIDWORD(v23) = a8;
  v11 = sub_1D71461CC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71461C0();
  swift_bridgeObjectRetain();
  sub_1D714619C();
  swift_bridgeObjectRetain();
  sub_1D71461A8();
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_1D71461B4();
  v17 = objc_msgSend(v15, sel_localizedStringFromPersonNameComponents_style_options_, v16, 2, 0);

  v18 = sub_1D714631C();
  v20 = v19;

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if ((a5 & 1) != 0)
  {
    v21 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0)
      v21 = v18 & 0xFFFFFFFFFFFFLL;
    if (v21)
    {
      return v18;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    a6 = sub_1D7131840(v18, v20, a6, a7, BYTE4(v23) & 1);
    swift_bridgeObjectRelease();
  }
  return a6;
}

uint64_t sub_1D7131840(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t ObjCClassFromMetadata;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1D7146190();

  if ((a5 & 1) == 0)
    goto LABEL_6;
  v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v12 = a1 & 0xFFFFFFFFFFFFLL;
  if (v12)
  {
    sub_1D7131EC0();
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1D7147290;
    *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
    v14 = sub_1D7131F68();
    *(_QWORD *)(v13 + 64) = v14;
    *(_QWORD *)(v13 + 32) = a1;
    *(_QWORD *)(v13 + 40) = a2;
    swift_bridgeObjectRetain();
    v15 = sub_1D7146310();
    v17 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1D71472A0;
    v19 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v18 + 64) = v14;
    *(_QWORD *)(v18 + 32) = a3;
    *(_QWORD *)(v18 + 40) = a4;
    *(_QWORD *)(v18 + 96) = v19;
    *(_QWORD *)(v18 + 104) = v14;
    *(_QWORD *)(v18 + 72) = v15;
    *(_QWORD *)(v18 + 80) = v17;
    swift_bridgeObjectRetain();
    a3 = sub_1D7146328();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a3;
}

uint64_t static ProfileInformationSupport.localizedShortNameOrAccountIdentifier(firstName:lastName:isContact:accountIdentifier:shouldDisplaySuggestedName:newlineBetweenNames:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, unsigned __int8 a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a8;
  v32 = a6;
  v33 = a7;
  v31 = a5;
  v10 = sub_1D71461CC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71461C0();
  swift_bridgeObjectRetain();
  sub_1D714619C();
  swift_bridgeObjectRetain();
  v29 = a3;
  sub_1D71461A8();
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_1D71461B4();
  v16 = objc_msgSend(v14, sel_localizedStringFromPersonNameComponents_style_options_, v15, 1, 0);

  v17 = sub_1D714631C();
  v19 = v18;

  v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v13, v10);
  if ((v31 & 1) != 0)
  {
    v21 = v32;
    v22 = HIBYTE(v19) & 0xF;
    if ((v19 & 0x2000000000000000) == 0)
      v22 = v17 & 0xFFFFFFFFFFFFLL;
    if (!v22)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      return v21;
    }
  }
  else
  {
    v31 = a9;
    swift_bridgeObjectRelease();
    sub_1D71461C0();
    swift_bridgeObjectRetain();
    sub_1D714619C();
    swift_bridgeObjectRetain();
    sub_1D71461A8();
    v23 = (void *)sub_1D71461B4();
    v24 = objc_msgSend(v14, sel_localizedStringFromPersonNameComponents_style_options_, v23, 2, 0);

    v25 = sub_1D714631C();
    v27 = v26;

    v20(v13, v10);
    v17 = sub_1D7131840(v25, v27, v32, v33, v30 & 1);
    swift_bridgeObjectRelease();
  }
  return v17;
}

id sub_1D7131CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, char a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v11 = a4;
  if (!a3)
  {
    v12 = 0;
    v14 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v12 = sub_1D714631C();
  v14 = v13;
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v15 = sub_1D714631C();
  v11 = v16;
LABEL_6:
  v17 = sub_1D714631C();
  v19 = v18;
  swift_getObjCClassMetadata();
  a9(v12, v14, v15, v11, a5, v17, v19, a7, a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = (void *)sub_1D7146304();
  swift_bridgeObjectRelease();
  return v20;
}

id ProfileInformationSupport.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ProfileInformationSupport.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ProfileInformationSupport.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileInformationSupport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ProfileInformationSupport()
{
  return objc_opt_self();
}

void sub_1D7131EC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE490)
  {
    sub_1D7131F14();
    v0 = sub_1D7146598();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE490);
  }
}

unint64_t sub_1D7131F14()
{
  unint64_t result;

  result = qword_1F00AE498;
  if (!qword_1F00AE498)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE498);
  }
  return result;
}

unint64_t sub_1D7131F68()
{
  unint64_t result;

  result = qword_1F00AE4A0;
  if (!qword_1F00AE4A0)
  {
    result = MEMORY[0x1D8292E28](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F00AE4A0);
  }
  return result;
}

id sub_1D7131FAC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HealthAppOrchestrationClient()), sel_init);
  qword_1F00AE4A8 = (uint64_t)result;
  return result;
}

id HealthAppOrchestrationClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static HealthAppOrchestrationClient.sharedConnection.getter()
{
  if (qword_1F00AE3E0 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1F00AE4A8;
}

void static HealthAppOrchestrationClient.sharedConnection.setter(uint64_t a1)
{
  void *v2;

  if (qword_1F00AE3E0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1F00AE4A8;
  qword_1F00AE4A8 = a1;

}

uint64_t (*static HealthAppOrchestrationClient.sharedConnection.modify())()
{
  if (qword_1F00AE3E0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t static HealthAppOrchestrationClient.serviceName.getter()
{
  return 0xD000000000000022;
}

id HealthAppOrchestrationClient.init()()
{
  char *v0;
  char *v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  objc_super v26;
  uint64_t aBlock;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  void *v31;
  uint64_t v32;

  v1 = v0;
  ObjectType = swift_getObjectType();
  type metadata accessor for HealthAppOrchestrationClient.WeakClientProxy();
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_clientProxy;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_clientProxy] = v3;
  v5 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v6 = v1;
  v7 = (void *)sub_1D7146304();
  v8 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v7, 0);

  v9 = OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection] = v8;
  v10 = (void *)objc_opt_self();
  v11 = v8;
  v12 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_1F00B39B0);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  v13 = *(id *)&v6[v9];
  v14 = objc_msgSend(v10, sel_interfaceWithProtocol_, &unk_1F00B1A18);
  objc_msgSend(v13, sel_setExportedInterface_, v14);

  v15 = *(void **)&v6[v9];
  objc_msgSend(v15, sel_setExportedObject_, *(_QWORD *)&v1[v4]);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = ObjectType;
  v31 = sub_1D71338D8;
  v32 = v16;
  v17 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v28 = 1107296256;
  v29 = sub_1D7132624;
  v30 = &block_descriptor;
  v18 = _Block_copy(&aBlock);
  v19 = v15;
  swift_release();
  objc_msgSend(v19, sel_setInterruptionHandler_, v18);
  _Block_release(v18);

  v20 = *(id *)&v6[v9];
  v21 = objc_msgSend(v20, sel_interruptionHandler);
  if (v21)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v21;
    v31 = sub_1D713393C;
    v32 = v22;
    aBlock = v17;
    v28 = 1107296256;
    v29 = sub_1D7132624;
    v30 = &block_descriptor_6;
    v21 = _Block_copy(&aBlock);
    swift_release();
  }
  objc_msgSend(v20, sel_setInvalidationHandler_, v21);
  _Block_release(v21);

  v23 = *(id *)&v6[v9];
  objc_msgSend(v23, sel_resume);

  v26.receiver = v6;
  v26.super_class = (Class)type metadata accessor for HealthAppOrchestrationClient();
  v24 = objc_msgSendSuper2(&v26, sel_init);
  swift_unknownObjectWeakAssign();
  return v24;
}

uint64_t type metadata accessor for HealthAppOrchestrationClient.WeakClientProxy()
{
  return objc_opt_self();
}

void sub_1D713249C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_1EDBEA7D0 != -1)
    swift_once();
  v0 = sub_1D71462E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDBEA7D8);
  oslog = sub_1D71462C8();
  v1 = sub_1D714643C();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315138;
    sub_1D713B4E4(0xD000000000000022, 0x80000001D7148A60, &v5);
    sub_1D7146460();
    _os_log_impl(&dword_1D712B000, oslog, v1, "%s: connection interrupted", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8292EA0](v3, -1, -1);
    MEMORY[0x1D8292EA0](v2, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1D7132624(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D7132670(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t (*v16)();
  uint64_t v17;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v6);
  swift_release();
  if ((a1 & 1) != 0)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = a3;
    v16 = sub_1D7133D90;
    v17 = v8;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 1107296256;
    v14 = sub_1D7132624;
    v15 = &block_descriptor_21;
    v9 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fireOnceWithCompletion_, v9);
    swift_unknownObjectRelease();
    _Block_release(v9);
  }
  else
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = a3;
    v16 = sub_1D7133D90;
    v17 = v10;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 1107296256;
    v14 = sub_1D7132624;
    v15 = &block_descriptor_15;
    v11 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_resetAndFireWithCompletion_, v11);
    _Block_release(v11);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1D713281C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D713396C, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133994;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132920;
  v9[3] = &block_descriptor_30;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_fetchOrchestrationStatusWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D7132920(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = sub_1D714631C();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7132974(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D71339B8, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D71339DC;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132A78;
  v9[3] = &block_descriptor_39;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_fetchOrchestrationGraphWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D7132A78(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_1D7146400();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D7132AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133A00, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133A34;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132BD4;
  v9[3] = &block_descriptor_48;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_deleteCacheAndTerminateWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D7132BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133A34, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133A54;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132624;
  v9[3] = &block_descriptor_57;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_cancelAllGenerationWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

id sub_1D7132CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v4);
  swift_release();
  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132BD4;
  v9[3] = &block_descriptor_63;
  v6 = _Block_copy(v9);
  swift_retain();
  swift_release();
  v7 = objc_msgSend(v5, sel_remote_runForegroundGenerationWithCompletion_, v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
  return v7;
}

void sub_1D7132DD0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_1D7132E24(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  swift_retain();
  v11 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v10);
  swift_release();
  if (a1)
    a1 = (void *)sub_1D71463F4();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  *(_QWORD *)(v12 + 24) = a5;
  v14[4] = sub_1D7133CD8;
  v14[5] = v12;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1D7132BD4;
  v14[3] = &block_descriptor_72;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_remote_runBackgroundGenerationWithPlugins_commitAsUrgent_generationType_completion_, a1, a2 & 1, a3, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();

}

uint64_t sub_1D7132F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133D90;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132624;
  v9[3] = &block_descriptor_81;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D7133070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133D90;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132624;
  v9[3] = &block_descriptor_90;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D7133174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_1D7133388((uint64_t)sub_1D7133CD8, v4);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_1D7133D90;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1D7132624;
  v9[3] = &block_descriptor_99;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_remote_runOrRequestBackgroundGenerationWithCompletion_, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

id HealthAppOrchestrationClient.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  swift_unknownObjectWeakAssign();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppOrchestrationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D7133388(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v5;
  _QWORD *v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t result;
  id v11;
  uint64_t v12;
  _BYTE v13[32];
  _QWORD aBlock[6];

  v5 = *(void **)&v2[OBJC_IVAR____TtC17HealthAppServices28HealthAppOrchestrationClient_connection];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  aBlock[4] = sub_1D7133BEC;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7133854;
  aBlock[3] = &block_descriptor_107;
  v7 = _Block_copy(aBlock);
  v8 = v2;
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_1D71464A8();
  swift_unknownObjectRelease();
  sub_1D7131354((uint64_t)aBlock, (uint64_t)v13);
  sub_1D7133BF8();
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
    return v12;
  }
  else
  {
    sub_1D7131354((uint64_t)aBlock, (uint64_t)v13);
    sub_1D71464F0();
    v11 = objc_msgSend(v8, sel_description);
    sub_1D714631C();

    sub_1D7146364();
    swift_bridgeObjectRelease();
    sub_1D7146364();
    sub_1D7146514();
    sub_1D7146364();
    result = sub_1D714652C();
    __break(1u);
  }
  return result;
}

uint64_t sub_1D71335DC(void *a1, void *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t (*v24)(_QWORD);
  uint64_t v25;

  if (qword_1EDBEA7D0 != -1)
    swift_once();
  v6 = sub_1D71462E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EDBEA7D8);
  v7 = a2;
  v8 = a1;
  v9 = v7;
  v10 = a1;
  v11 = sub_1D71462C8();
  v12 = sub_1D7146430();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v25 = v14;
    *(_DWORD *)v13 = 136315394;
    v15 = v9;
    v16 = objc_msgSend(v15, sel_description);
    v24 = a3;
    v17 = sub_1D714631C();
    v19 = v18;

    sub_1D713B4E4(v17, v19, &v25);
    sub_1D7146460();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    v20 = a1;
    sub_1D7133C84();
    v21 = sub_1D7146334();
    sub_1D713B4E4(v21, v22, &v25);
    a3 = v24;
    sub_1D7146460();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D712B000, v11, v12, "%s: remoteObjectProxyWithErrorHandler error: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D8292EA0](v14, -1, -1);
    MEMORY[0x1D8292EA0](v13, -1, -1);
  }
  else
  {

  }
  return a3(a1);
}

void sub_1D7133854(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1D71338A4()
{
  uint64_t v0;

  sub_1D7133B9C(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1D71338C8()
{
  return swift_deallocObject();
}

void sub_1D71338D8()
{
  sub_1D713249C();
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

uint64_t type metadata accessor for HealthAppOrchestrationClient()
{
  return objc_opt_self();
}

uint64_t sub_1D7133918()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1D713393C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1D7133948()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D713396C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(a1, 0, 1);
}

uint64_t sub_1D7133994(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(a1, a2, 0);
}

uint64_t sub_1D71339B8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, 1);
}

uint64_t sub_1D71339DC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(a1, 0);
}

void sub_1D7133A00()
{
  uint64_t v0;
  void (*v1)(void);
  id v2;

  v1 = *(void (**)(void))(v0 + 16);
  v2 = (id)sub_1D71461D8();
  v1();

}

uint64_t sub_1D7133A34()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D7133A54()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t method lookup function for HealthAppOrchestrationClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fireOnce(resetErrors:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fetchOrchestrationStatus(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.fetchOrchestrationGraph(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.deleteCacheAndTerminate(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.cancelAllGeneration(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runForegroundGeneration(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runBackgroundGeneration(plugins:commitAsUrgent:generationType:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.requestBackgroundGenerationForFeedItemsAfterUnlock(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.requestBackgroundGenerationForAllModelsAfterUnlock(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HealthAppOrchestrationClient.runOrRequestBackgroundGeneration(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t sub_1D7133B9C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1D7133BC0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D7133BEC(void *a1)
{
  uint64_t v1;

  return sub_1D71335DC(a1, *(void **)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24));
}

unint64_t sub_1D7133BF8()
{
  unint64_t result;

  result = qword_1EDBEA558;
  if (!qword_1EDBEA558)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDBEA558);
  }
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1D7133C84()
{
  unint64_t result;

  result = qword_1F00AE4C0;
  if (!qword_1F00AE4C0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE4C0);
  }
  return result;
}

uint64_t DeepLinkingDataConformable.healthAppBaseURL()(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_externalHealthAppURLScheme);
  sub_1D714631C();

  v6 = objc_msgSend(v4, sel_externalHealthAppURLHost);
  sub_1D714631C();

  sub_1D7146364();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146364();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1D7146364();
  swift_bridgeObjectRelease();
  sub_1D7146268();
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.urlPath.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DeepLinkingDataConformable.url()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.fromURL(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DeepLinkingDataConformable.userActivity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static DeepLinkingDataConformable.fromUserActivity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

HealthAppServices::HAUserActivity::UserActivityVersion __swiftcall NSUserActivityProtocol.versionInfo()()
{
  uint64_t v0;
  BOOL *v1;
  BOOL *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  HealthAppServices::HAUserActivity::UserActivityVersion result;
  BOOL v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;

  v2 = v1;
  v3 = (*(uint64_t (**)(void))(v0 + 32))();
  if (!v3)
  {
    v10 = 0u;
    v11 = 0u;
LABEL_11:
    result = sub_1D7133FF0((uint64_t)&v10);
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v4 = v3;
  sub_1D71464D8();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1D713E0AC((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_1D7131354(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D7131320((uint64_t)v9);
  if (!*((_QWORD *)&v11 + 1))
    goto LABEL_11;
  result = swift_dynamicCast();
  if ((result & 1) == 0 || !v9[0])
    goto LABEL_12;
  v8 = v9[0] == 1;
LABEL_13:
  *v2 = v8;
  return result;
}

uint64_t sub_1D7133FF0(uint64_t a1)
{
  uint64_t v2;

  sub_1D713402C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1D713402C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE488)
  {
    v0 = sub_1D7146454();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE488);
  }
}

Swift::String_optional __swiftcall NSUserActivityProtocol.fetchUpToDatePluginIdForActivity(since:)(HealthAppServices::HAUserActivity::UserActivityVersion since)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  Swift::String_optional result;
  id v12[5];
  __int128 v13;
  __int128 v14;

  v2 = *(unsigned __int8 *)since;
  v3 = (*(uint64_t (**)())(v1 + 32))();
  if (!v3)
  {
    v13 = 0u;
    v14 = 0u;
LABEL_18:
    sub_1D7133FF0((uint64_t)&v13);
    goto LABEL_19;
  }
  v4 = v3;
  sub_1D71464D8();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1D713E0AC((uint64_t)v12), (v6 & 1) != 0))
  {
    sub_1D7131354(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v13);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1D7131320((uint64_t)v12);
  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_18;
  sub_1D713423C();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    v9 = 0;
    v10 = 0;
    goto LABEL_20;
  }
  v7 = v12[0];
  if (objc_msgSend(v12[0], sel_integerValue) == (id)63)
    v8 = v2;
  else
    v8 = 1;

  if (v8)
    v9 = 0;
  else
    v9 = 0xD000000000000015;
  if (v8)
    v10 = 0;
  else
    v10 = (void *)0x80000001D7148CA0;
LABEL_20:
  result.value._object = v10;
  result.value._countAndFlagsBits = v9;
  return result;
}

id NSUserActivityProtocol<>.ensureLatestVersionAndUpgradeIfNeeded()()
{
  void *v1;
  char v2[17];

  NSUserActivityProtocol.versionInfo()();
  if ((v2[16] & 1) != 0)
    return v1;
  v2[0] = 0;
  return sub_1D7134278(v2);
}

unint64_t sub_1D713423C()
{
  unint64_t result;

  result = qword_1F00AE4C8;
  if (!qword_1F00AE4C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE4C8);
  }
  return result;
}

void *sub_1D7134278(char *a1)
{
  void *v1;
  void *v2;
  char v3;
  uint64_t inited;
  uint64_t v5;
  void *v6;
  Swift::String_optional v7;
  uint64_t v8;
  void *v9;
  char v11;
  uint64_t v12;
  unint64_t v13;

  v2 = v1;
  v3 = *a1;
  sub_1D7134458();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7147290;
  v13 = 0xEA00000000007965;
  v5 = MEMORY[0x1E0DEA968];
  sub_1D71464D8();
  *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 72) = 1;
  sub_1D7130E18(inited);
  v6 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v6);

  v12 = (uint64_t)v2;
  v11 = v3;
  v7 = NSUserActivityProtocol.fetchUpToDatePluginIdForActivity(since:)((HealthAppServices::HAUserActivity::UserActivityVersion)&v11);
  if (v7.value._object)
  {
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1D7147290;
    v12 = 0x614E656C646E7562;
    v13 = 0xEA0000000000656DLL;
    sub_1D71464D8();
    *(_QWORD *)(v8 + 96) = v5;
    *(Swift::String_optional *)(v8 + 72) = v7;
    sub_1D7130E18(v8);
    v9 = (void *)sub_1D71462EC();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v9);

  }
  return v2;
}

void sub_1D7134458()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDBEA578)
  {
    sub_1D7130FC8();
    v0 = sub_1D7146598();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDBEA578);
  }
}

uint64_t SharingUUIDDeepLinkingParameter.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SharingUUIDDeepLinkingParameter.value.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*SharingUUIDDeepLinkingParameter.value.modify())()
{
  return nullsub_1;
}

void sub_1D713452C()
{
  qword_1F00AE4D0 = 0x55676E6972616873;
  *(_QWORD *)algn_1F00AE4D8 = 0xEB00000000444955;
}

uint64_t static SharingUUIDDeepLinkingParameter.keyName.getter()
{
  return sub_1D71347C0(&qword_1F00AE3E8, &qword_1F00AE4D0);
}

uint64_t static SharingUUIDDeepLinkingParameter.keyName.setter(uint64_t a1, uint64_t a2)
{
  return sub_1D713484C(a1, a2, &qword_1F00AE3E8, &qword_1F00AE4D0, algn_1F00AE4D8);
}

uint64_t (*static SharingUUIDDeepLinkingParameter.keyName.modify())()
{
  if (qword_1F00AE3E8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SharingUUIDDeepLinkingParameter.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_1D7134640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_1D713467C(uint64_t a1, uint64_t a2)
{
  return sub_1D713565C(a1, a2, &qword_1F00AE3E8, &qword_1F00AE4D0);
}

uint64_t sub_1D713469C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_1D71346D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t SharingManagementURLData.sharingUUIDParameter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D7134718(v1, a1);
}

uint64_t sub_1D7134718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SharingUUIDDeepLinkingParameter(uint64_t a1)
{
  return sub_1D7135828(a1, qword_1F00AE598);
}

void sub_1D7134770()
{
  strcpy((char *)&qword_1F00AE4E0, "sharingProfile");
  algn_1F00AE4E8[7] = -18;
}

uint64_t static SharingManagementURLData.urlPath.getter()
{
  return sub_1D71347C0(&qword_1F00AE3F0, &qword_1F00AE4E0);
}

uint64_t sub_1D71347C0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static SharingManagementURLData.urlPath.setter(uint64_t a1, uint64_t a2)
{
  return sub_1D713484C(a1, a2, &qword_1F00AE3F0, &qword_1F00AE4E0, algn_1F00AE4E8);
}

uint64_t sub_1D713484C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  if (*a3 != -1)
    swift_once();
  swift_beginAccess();
  *a4 = a1;
  *a5 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SharingManagementURLData.urlPath.modify())()
{
  if (qword_1F00AE3F0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SharingManagementURLData.init(sharingUUIDParameter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1D7134938(a1, a2);
}

uint64_t sub_1D7134938(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static SharingManagementURLData.isSharingProfile(_:)(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = objc_msgSend(a1, sel_activityType);
  v2 = sub_1D714631C();
  v4 = v3;

  v5 = 18;
  v6 = &byte_1E9BE1790;
  while (1)
  {
    ++v6;
    if (DeepLinkActivityType.userActivityType.getter() == v2 && v7 == v4)
      break;
    v9 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      goto LABEL_10;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      v10 = 0;
      return v10 & 1;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  DeepLinkActivityType.rawValue.getter();
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend((id)objc_opt_self(), sel_healthAppSharingProfilePath);
  v16 = sub_1D714631C();
  v18 = v17;

  if (v12 == v16 && v14 == v18)
    v10 = 1;
  else
    v10 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t SharingManagementURLData.url()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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

  v3 = sub_1D714610C();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D71462BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7131240(0, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - v11;
  v13 = sub_1D7146274();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71303A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_1D71312DC((uint64_t)v12, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a1, 1, 1, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v1, v6);
    v18 = _s10Foundation4UUIDV17HealthAppServicesE11toURLStringSSyF_0();
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v28 = v18;
    v29 = v20;
    sub_1D7146100();
    sub_1D7130F40();
    v21 = sub_1D7146478();
    v23 = v22;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
    swift_bridgeObjectRelease();
    if (qword_1F00AE3E8 != -1)
      swift_once();
    swift_beginAccess();
    v24 = *(_QWORD *)algn_1F00AE4D8;
    swift_bridgeObjectRetain();
    sub_1D713DCCC(v24, v21, v23, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

uint64_t static SharingManagementURLData.fromURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  char *v36;
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
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v66 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D7131240(0, &qword_1F00AE480, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v54 - v5;
  v7 = sub_1D71462BC();
  v61 = *(_QWORD *)(v7 - 8);
  v62 = v7;
  MEMORY[0x1E0C80A78](v7);
  v60 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D714613C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v65 = (char *)&v54 - v14;
  sub_1D7131240(0, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter, v3);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v54 - v16;
  v18 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v24, a1, v25);
  v26 = HAURL.queryItems.getter();
  if (!v26)
  {
    sub_1D7130F84((uint64_t)v24);
    v46 = v66;
LABEL_24:
    v49 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v46, 1, 1, v49);
  }
  v63 = v24;
  v64 = v19;
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    v45 = 1;
    v48 = (uint64_t)v63;
    v47 = v64;
    v46 = v66;
    goto LABEL_22;
  }
  v55 = v6;
  v56 = v18;
  v57 = v21;
  v58 = v17;
  v28 = v26 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v29 = *(_QWORD *)(v10 + 72);
  v30 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
  v59 = v26;
  swift_bridgeObjectRetain();
  while (1)
  {
    v30(v13, v28, v9);
    v31 = sub_1D7146124();
    v33 = v32;
    if (qword_1F00AE3E8 != -1)
      swift_once();
    swift_beginAccess();
    if (v31 == qword_1F00AE4D0 && v33 == *(_QWORD *)algn_1F00AE4D8)
      break;
    v35 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
      goto LABEL_16;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v28 += v29;
    if (!--v27)
    {
      swift_bridgeObjectRelease();
      v45 = 1;
      v46 = v66;
      v21 = v57;
      v17 = v58;
      v18 = v56;
      v48 = (uint64_t)v63;
      v47 = v64;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  v17 = v58;
  v36 = v65;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v65, v13, v9);
  v37 = sub_1D7146130();
  v39 = v38;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v36, v9);
  v18 = v56;
  v21 = v57;
  v40 = (uint64_t)v55;
  if (v39)
  {
    v67 = v37;
    v68 = v39;
    sub_1D7130F40();
    sub_1D7146490();
    v42 = v41;
    swift_bridgeObjectRelease();
    if (v42)
    {
      _s10Foundation4UUIDV17HealthAppServicesE13fromURLStringyACSgSSFZ_0();
      swift_bridgeObjectRelease();
      v43 = v61;
      v44 = v62;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v40, 1, v62) != 1)
      {
        v52 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 32);
        v53 = v60;
        v52(v60, v40, v44);
        v52(v17, (uint64_t)v53, v44);
        v45 = 0;
        goto LABEL_21;
      }
      sub_1D71312DC(v40, &qword_1F00AE480, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998]);
    }
  }
  v45 = 1;
LABEL_21:
  v46 = v66;
  v48 = (uint64_t)v63;
  v47 = v64;
LABEL_22:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v17, v45, 1, v18);
  swift_bridgeObjectRelease();
  sub_1D7130F84(v48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v17, 1, v18) == 1)
  {
    sub_1D71312DC((uint64_t)v17, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    goto LABEL_24;
  }
  sub_1D7134938((uint64_t)v17, (uint64_t)v21);
  sub_1D7134938((uint64_t)v21, v46);
  v51 = type metadata accessor for SharingManagementURLData(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v46, 0, 1, v51);
}

NSUserActivity __swiftcall SharingManagementURLData.userActivity()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t inited;
  uint64_t *boxed_opaque_existential_0;
  void *v12;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_1D71464F0();
  swift_bridgeObjectRelease();
  v15 = 0x50676E6972616853;
  v16 = 0xEF2E656C69666F72;
  sub_1D7134718(v0, (uint64_t)v4);
  v5 = sub_1D71462BC();
  sub_1D713585C();
  sub_1D714658C();
  sub_1D7146364();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  v7 = v15;
  LOBYTE(v15) = 16;
  _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(v7, v16, (unsigned __int8 *)&v15, 0, 0, 2, 0);
  v9 = v8;
  swift_bridgeObjectRelease();
  sub_1D7131240(0, (unint64_t *)&qword_1EDBEA578, (uint64_t (*)(uint64_t))sub_1D7130FC8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7147290;
  if (qword_1F00AE3E8 != -1)
    swift_once();
  swift_beginAccess();
  v14[0] = qword_1F00AE4D0;
  v14[1] = *(_QWORD *)algn_1F00AE4D8;
  swift_bridgeObjectRetain();
  sub_1D71464D8();
  *(_QWORD *)(inited + 96) = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 72));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_0, v1, v5);
  sub_1D7130E18(inited);
  v12 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_addUserInfoEntriesFromDictionary_, v12);

  return (NSUserActivity)v9;
}

uint64_t static SharingManagementURLData.fromUserActivity(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  sub_1D7131240(0, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - v5;
  v7 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7130AD8(a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1D71312DC((uint64_t)v6, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    v11 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a2, 1, 1, v11);
  }
  else
  {
    sub_1D7134938((uint64_t)v6, (uint64_t)v10);
    sub_1D7134938((uint64_t)v10, a2);
    v13 = type metadata accessor for SharingManagementURLData(0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a2, 0, 1, v13);
  }
}

uint64_t sub_1D713563C(uint64_t a1, uint64_t a2)
{
  return sub_1D713565C(a1, a2, &qword_1F00AE3F0, &qword_1F00AE4E0);
}

uint64_t sub_1D713565C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1D71356D8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  sub_1D7131240(0, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - v7;
  v9 = type metadata accessor for SharingUUIDDeepLinkingParameter(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7130AD8(a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1D71312DC((uint64_t)v8, &qword_1F00AE4F0, type metadata accessor for SharingUUIDDeepLinkingParameter);
    v13 = 1;
  }
  else
  {
    sub_1D7134938((uint64_t)v8, (uint64_t)v12);
    sub_1D7134938((uint64_t)v12, a3);
    v13 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, v13, 1, a2);
}

uint64_t type metadata accessor for SharingManagementURLData(uint64_t a1)
{
  return sub_1D7135828(a1, (uint64_t *)&unk_1EDBEA788);
}

uint64_t sub_1D7135828(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1D713585C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F00AE4F8;
  if (!qword_1F00AE4F8)
  {
    v1 = sub_1D71462BC();
    result = MEMORY[0x1D8292E28](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&qword_1F00AE4F8);
  }
  return result;
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

_UNKNOWN **sub_1D71358E0()
{
  return &protocol witness table for UUID;
}

uint64_t getEnumTagSinglePayload for SharingUUIDDeepLinkingParameter()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D7135910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998]);
}

uint64_t storeEnumTagSinglePayload for SharingUUIDDeepLinkingParameter()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D7135928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998]);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D71462BC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t _s17HealthAppServices31SharingUUIDDeepLinkingParameterVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D71462BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingManagementURLData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D7135AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, type metadata accessor for SharingUUIDDeepLinkingParameter);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;

  v6 = a4(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for SharingManagementURLData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D7135B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, type metadata accessor for SharingUUIDDeepLinkingParameter);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v7;

  v7 = a5(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

uint64_t sub_1D7135B64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D71462BC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t URLParameterConvertible<>.toURLString()()
{
  return sub_1D714658C();
}

uint64_t static String.fromURLString(_:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D7135C04()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D7135C30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of URLParameterConvertible.toURLString()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static URLParameterConvertible.fromURLString(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t HAURL.init(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t HAURL.queryItems.getter()
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
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = type metadata accessor for HAURL();
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v26 - v5;
  v7 = sub_1D71462E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_allocWithZone(MEMORY[0x1E0CB3998]);
  v12 = (void *)sub_1D7146220();
  v13 = objc_msgSend(v11, sel_initWithURL_resolvingAgainstBaseURL_, v12, 0);

  if (v13)
  {
    v14 = objc_msgSend(v13, sel_queryItems);
    if (v14)
    {
      v15 = v14;
      sub_1D714613C();
      v16 = sub_1D7146400();

      return v16;
    }

  }
  if (qword_1EDBEA7D0 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v7, (uint64_t)qword_1EDBEA7D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
  sub_1D713B4A0(v0, (uint64_t)v6);
  v18 = sub_1D71462C8();
  v19 = sub_1D7146430();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v29 = v26;
    *(_DWORD *)v20 = 136315394;
    v21 = sub_1D713B4E4(0x4C52554148, 0xE500000000000000, &v29);
    v27 = v8;
    v28 = v21;
    sub_1D7146460();
    *(_WORD *)(v20 + 12) = 2080;
    sub_1D713B4A0((uint64_t)v6, (uint64_t)v4);
    v22 = sub_1D7146334();
    v28 = sub_1D713B4E4(v22, v23, &v29);
    sub_1D7146460();
    swift_bridgeObjectRelease();
    sub_1D713BBC4((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    _os_log_impl(&dword_1D712B000, v18, v19, "[%s] Could not resolve query items for URL: %s", (uint8_t *)v20, 0x16u);
    v24 = v26;
    swift_arrayDestroy();
    MEMORY[0x1D8292EA0](v24, -1, -1);
    MEMORY[0x1D8292EA0](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v7);
  }
  else
  {
    sub_1D713BBC4((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return 0;
}

uint64_t HAURL.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id HAURL.objectType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char v34;
  _QWORD v36[4];

  v1 = v0;
  v2 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, v0, v8);
  v9 = sub_1D714625C();
  if (!v10)
  {
    sub_1D713B4A0(v0, (uint64_t)v4);
    goto LABEL_8;
  }
  v36[2] = v9;
  v36[3] = v10;
  v11 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  v12 = sub_1D714631C();
  v14 = v13;

  v36[0] = v12;
  v36[1] = v14;
  sub_1D7130F40();
  v15 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D713B4A0(v1, (uint64_t)v4);
  if (v15)
  {
LABEL_8:
    sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    goto LABEL_9;
  }
  v16 = sub_1D7146244();
  v18 = v17;
  v19 = objc_msgSend((id)objc_opt_self(), sel_sampleTypeHostName);
  v20 = sub_1D714631C();
  v22 = v21;

  if (v18)
  {
    if (v16 == v20 && v18 == v22)
    {
      swift_bridgeObjectRelease();
      sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      swift_bridgeObjectRelease();
LABEL_16:
      v28 = sub_1D713633C();
      goto LABEL_17;
    }
    v34 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
  }
LABEL_9:
  v23 = (void *)objc_opt_self();
  v24 = objc_msgSend(v23, sel_sampleTypeHostName);
  v25 = sub_1D714631C();
  v27 = v26;

  LOBYTE(v24) = sub_1D7143BF4(v1, v25, v27);
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
  {
    v28 = sub_1D7136700();
LABEL_17:
    v33 = v28;
    goto LABEL_18;
  }
  v29 = objc_msgSend(v23, sel_dataTypeDetailHostName);
  v30 = sub_1D714631C();
  v32 = v31;

  LOBYTE(v29) = sub_1D7143BF4(v1, v30, v32);
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
    v28 = sub_1D7136B3C();
    goto LABEL_17;
  }
  v33 = 0;
LABEL_18:
  sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  return v33;
}

id sub_1D713633C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[4];
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v1);
  v3 = &v24[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1D71462E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (_QWORD *)sub_1D7146208();
  v9 = v8;
  if (v8[2] != 2)
    goto LABEL_10;
  v11 = v8[4];
  v10 = v8[5];
  swift_bridgeObjectRetain();
  if (!v10)
    goto LABEL_10;
  if (v11 == 47 && v10 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v11 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_7:
  if (v9[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_19;
  }
  v11 = v9[6];
  v10 = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = (void *)objc_opt_self();
  v13 = (void *)sub_1D7146304();
  v14 = objc_msgSend(v12, sel__typeWithIdentifier_, v13);

  if (!v14)
  {
    if (qword_1EDBEA7D0 == -1)
    {
LABEL_14:
      v16 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDBEA7D8);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
      sub_1D713B4A0(v0, (uint64_t)v3);
      swift_bridgeObjectRetain();
      v17 = sub_1D71462C8();
      v18 = sub_1D7146430();
      v19 = v18;
      if (os_log_type_enabled(v17, v18))
      {
        v20 = swift_slowAlloc();
        v26 = swift_slowAlloc();
        v28 = v26;
        *(_DWORD *)v20 = 136315651;
        v25 = v19;
        v27 = sub_1D713B4E4(0x4C52554148, 0xE500000000000000, &v28);
        sub_1D7146460();
        *(_WORD *)(v20 + 12) = 2082;
        swift_bridgeObjectRetain();
        v27 = sub_1D713B4E4(v11, v10, &v28);
        sub_1D7146460();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 22) = 2081;
        v21 = sub_1D71461FC();
        v27 = sub_1D713B4E4(v21, v22, &v28);
        sub_1D7146460();
        swift_bridgeObjectRelease();
        sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
        _os_log_impl(&dword_1D712B000, v17, (os_log_type_t)v25, "%s Invalid type identifier %{public}s provided in URL %{private}s", (uint8_t *)v20, 0x20u);
        v23 = v26;
        swift_arrayDestroy();
        MEMORY[0x1D8292EA0](v23, -1, -1);
        MEMORY[0x1D8292EA0](v20, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      }

      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
      return 0;
    }
LABEL_19:
    swift_once();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  return v14;
}

id sub_1D7136700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D71462E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)sub_1D7146208();
  v9 = v8;
  if (v8[2] != 3)
    goto LABEL_14;
  v10 = v8[4] == 47 && v8[5] == 0xE100000000000000;
  if (!v10 && (sub_1D71465A4() & 1) == 0)
    goto LABEL_14;
  v31 = v5;
  v12 = v9[6];
  v11 = v9[7];
  v13 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v14 = objc_msgSend(v13, sel_sampleTypeHostName);
  v15 = sub_1D714631C();
  v17 = v16;

  if (v12 == v15 && v11 == v17)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  v12 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_11:
  if (v9[2] < 3uLL)
  {
    __break(1u);
LABEL_22:
    swift_once();
LABEL_18:
    v22 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDBEA7D8);
    v23 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v7, v22, v4);
    sub_1D713B4A0(v0, (uint64_t)v3);
    swift_bridgeObjectRetain();
    v24 = sub_1D71462C8();
    v25 = sub_1D7146430();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v33 = v30;
      *(_DWORD *)v26 = 136315651;
      v32 = sub_1D713B4E4(0x4C52554148, 0xE500000000000000, &v33);
      sub_1D7146460();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      v32 = sub_1D713B4E4(v12, v11, &v33);
      sub_1D7146460();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 22) = 2081;
      v27 = sub_1D71461FC();
      v32 = sub_1D713B4E4(v27, v28, &v33);
      sub_1D7146460();
      swift_bridgeObjectRelease();
      sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      _os_log_impl(&dword_1D712B000, v24, v25, "%s Invalid type identifier %{public}s provided in URL %{private}s", (uint8_t *)v26, 0x20u);
      v29 = v30;
      swift_arrayDestroy();
      MEMORY[0x1D8292EA0](v29, -1, -1);
      MEMORY[0x1D8292EA0](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v4);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    }
    return 0;
  }
  v12 = v9[8];
  v11 = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = (void *)objc_opt_self();
  v19 = (void *)sub_1D7146304();
  v20 = objc_msgSend(v18, sel__typeWithIdentifier_, v19);

  if (!v20)
  {
    if (qword_1EDBEA7D0 == -1)
      goto LABEL_18;
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  return v20;
}

id sub_1D7136B3C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 *v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  unsigned __int8 *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int8 *v54;
  unsigned int v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, unint64_t, uint64_t);
  id v63;
  _QWORD v64[3];

  v0 = sub_1D714613C();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890];
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D7131240(0, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v58 - v11;
  sub_1D7131240(0, &qword_1F00AE600, v1, v6);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v58 - v14;
  v16 = (uint64_t)v12;
  sub_1D7146154();
  sub_1D713CC88((uint64_t)v12, (uint64_t)v10, &qword_1F00AE5F8, v5);
  v17 = sub_1D7146184();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) == 1)
  {
    sub_1D71312DC(v16, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
LABEL_14:
    sub_1D71312DC((uint64_t)v10, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v15, 1, 1, v0);
    goto LABEL_20;
  }
  v19 = sub_1D7146148();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v17);
  if (!v19)
  {
    v10 = (char *)v16;
    goto LABEL_14;
  }
  v20 = *(_QWORD *)(v19 + 16);
  if (v20)
  {
    v59 = v16;
    v60 = v15;
    v21 = (void *)objc_opt_self();
    v22 = v19 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v61 = *(_QWORD *)(v2 + 72);
    v62 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
    v63 = v21;
    v58 = v19;
    swift_bridgeObjectRetain();
    while (1)
    {
      v23 = v2;
      v62(v4, v22, v0);
      v24 = sub_1D7146124();
      v26 = v25;
      v27 = objc_msgSend(v63, sel_queryParameterNameDataTypeCode);
      v28 = sub_1D714631C();
      v30 = v29;

      if (v24 == v28 && v26 == v30)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      v32 = sub_1D71465A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v32 & 1) != 0)
        break;
      v2 = v23;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v0);
      v22 += v61;
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        v33 = 1;
        v16 = v59;
        v15 = v60;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
LABEL_18:
    v2 = v23;
    v16 = v59;
    v15 = v60;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v60, v4, v0);
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v15, v33, 1, v0);
  swift_bridgeObjectRelease();
  sub_1D71312DC(v16, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
LABEL_20:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v15, 1, v0) == 1)
  {
    sub_1D71312DC((uint64_t)v15, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
    return 0;
  }
  v34 = sub_1D7146130();
  v36 = v35;
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v15, v0);
  if (!v36)
    return 0;
  v38 = HIBYTE(v36) & 0xF;
  v39 = v34 & 0xFFFFFFFFFFFFLL;
  if ((v36 & 0x2000000000000000) != 0)
    v40 = HIBYTE(v36) & 0xF;
  else
    v40 = v34 & 0xFFFFFFFFFFFFLL;
  if (!v40)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v36 & 0x1000000000000000) != 0)
  {
    v42 = (uint64_t)sub_1D713BC00(v34, v36, 10);
    v44 = v57;
    goto LABEL_66;
  }
  if ((v36 & 0x2000000000000000) == 0)
  {
    if ((v34 & 0x1000000000000000) != 0)
      v41 = (unsigned __int8 *)((v36 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v41 = (unsigned __int8 *)sub_1D7146508();
    v42 = (uint64_t)sub_1D713BCE4(v41, v39, 10);
    v44 = v43 & 1;
LABEL_66:
    swift_bridgeObjectRelease();
    if ((v44 & 1) == 0)
      return objc_msgSend((id)objc_opt_self(), sel_dataTypeWithCode_, v42);
    return 0;
  }
  v64[0] = v34;
  v64[1] = v36 & 0xFFFFFFFFFFFFFFLL;
  if (v34 == 43)
  {
    if (!v38)
      goto LABEL_79;
    if (v38 == 1 || (BYTE1(v34) - 48) > 9u)
      goto LABEL_53;
    v42 = (BYTE1(v34) - 48);
    if (v38 != 2)
    {
      if ((BYTE2(v34) - 48) > 9u)
        goto LABEL_53;
      v42 = 10 * (BYTE1(v34) - 48) + (BYTE2(v34) - 48);
      v45 = v38 - 3;
      if (v45)
      {
        v46 = (unsigned __int8 *)v64 + 3;
        while (1)
        {
          v47 = *v46 - 48;
          if (v47 > 9)
            goto LABEL_53;
          v48 = 10 * v42;
          if ((unsigned __int128)(v42 * (__int128)10) >> 64 != (10 * v42) >> 63)
            goto LABEL_53;
          v42 = v48 + v47;
          if (__OFADD__(v48, v47))
            goto LABEL_53;
          v44 = 0;
          ++v46;
          if (!--v45)
            goto LABEL_66;
        }
      }
    }
LABEL_65:
    v44 = 0;
    goto LABEL_66;
  }
  if (v34 != 45)
  {
    if (!v38 || (v34 - 48) > 9u)
      goto LABEL_53;
    v42 = (v34 - 48);
    if (v38 != 1)
    {
      if ((BYTE1(v34) - 48) > 9u)
        goto LABEL_53;
      v42 = 10 * (v34 - 48) + (BYTE1(v34) - 48);
      v49 = v38 - 2;
      if (v49)
      {
        v50 = (unsigned __int8 *)v64 + 2;
        while (1)
        {
          v51 = *v50 - 48;
          if (v51 > 9)
            goto LABEL_53;
          v52 = 10 * v42;
          if ((unsigned __int128)(v42 * (__int128)10) >> 64 != (10 * v42) >> 63)
            goto LABEL_53;
          v42 = v52 + v51;
          if (__OFADD__(v52, v51))
            goto LABEL_53;
          v44 = 0;
          ++v50;
          if (!--v49)
            goto LABEL_66;
        }
      }
    }
    goto LABEL_65;
  }
  if (v38)
  {
    if (v38 != 1 && (BYTE1(v34) - 48) <= 9u)
    {
      if (v38 == 2)
      {
        v44 = 0;
        v42 = -(uint64_t)(BYTE1(v34) - 48);
        goto LABEL_66;
      }
      if ((BYTE2(v34) - 48) <= 9u)
      {
        v42 = -10 * (BYTE1(v34) - 48) - (BYTE2(v34) - 48);
        v53 = v38 - 3;
        if (!v53)
          goto LABEL_65;
        v54 = (unsigned __int8 *)v64 + 3;
        while (1)
        {
          v55 = *v54 - 48;
          if (v55 > 9)
            break;
          v56 = 10 * v42;
          if ((unsigned __int128)(v42 * (__int128)10) >> 64 != (10 * v42) >> 63)
            break;
          v42 = v56 - v55;
          if (__OFSUB__(v56, v55))
            break;
          v44 = 0;
          ++v54;
          if (!--v53)
            goto LABEL_66;
        }
      }
    }
LABEL_53:
    v42 = 0;
    v44 = 1;
    goto LABEL_66;
  }
  __break(1u);
LABEL_79:
  __break(1u);
  return result;
}

uint64_t sub_1D71371E8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v21;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;

  v4 = sub_1D714613C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890];
  sub_1D7131240(0, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v26 = *a1;
  v14 = (char *)v22 - v13;
  sub_1D7146154();
  sub_1D713CC88((uint64_t)v14, (uint64_t)v12, &qword_1F00AE5F8, v8);
  v15 = sub_1D7146184();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) == 1)
  {
    sub_1D71312DC((uint64_t)v14, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
LABEL_7:
    sub_1D71312DC((uint64_t)v12, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
  v17 = sub_1D7146148();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  if (!v17)
  {
    v12 = v14;
    goto LABEL_7;
  }
  v23 = v14;
  if (*(_QWORD *)(v17 + 16))
  {
    v22[0] = v17;
    v22[1] = a2;
    v18 = v17 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v24 = *(_QWORD *)(v5 + 72);
    v25 = v19;
    swift_bridgeObjectRetain();
    v25(v7, v18, v4);
    sub_1D7146124();
    __asm { BR              X8 }
  }
  v21 = (uint64_t)v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  swift_bridgeObjectRelease();
  return sub_1D71312DC(v21, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
}

uint64_t sub_1D7137670(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_1D7146508();
      v7 = (uint64_t)sub_1D713BCE4(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_1D713BC00(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

id HAURL.profileIdentifier.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1D7146220();
  v1 = objc_msgSend(v0, sel__hk_extractEncodedHKProfileIdentifier);

  return v1;
}

uint64_t HAURL.date.getter@<X0>(uint64_t a1@<X8>)
{
  char v2;

  v2 = 0;
  return sub_1D7137920(&v2, a1);
}

uint64_t sub_1D7137920@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v4)(uint64_t);
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
  _BYTE *v17;
  char v18;
  uint64_t v19;
  BOOL v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  uint64_t v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;

  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690];
  sub_1D7131240(0, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v26[-1] - v9;
  LOBYTE(v26[0]) = *a1;
  sub_1D71371E8((unsigned __int8 *)v26, (uint64_t)&v26[-1] - v9);
  sub_1D713CC88((uint64_t)v10, (uint64_t)v8, &qword_1F00AE600, v4);
  v11 = sub_1D714613C();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    sub_1D71312DC((uint64_t)v8, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
  }
  else
  {
    v13 = sub_1D7146130();
    v15 = v14;
    v16 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v11);
    if (v15)
    {
      v28 = 0;
      MEMORY[0x1E0C80A78](v16);
      *(&v25 - 2) = (uint64_t)&v28;
      if ((v15 & 0x1000000000000000) != 0 || !(v15 & 0x2000000000000000 | v13 & 0x1000000000000000))
      {
        sub_1D71464E4();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
          goto LABEL_16;
      }
      else if ((v15 & 0x2000000000000000) != 0)
      {
        v26[0] = v13;
        v26[1] = v15 & 0xFFFFFFFFFFFFFFLL;
        v21 = v13 > 0x20u || ((1 << v13) & 0x100003E01) == 0;
        if (!v21 || (v23 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
        v24 = *v23;
        swift_bridgeObjectRelease();
        if (v24)
          goto LABEL_16;
      }
      else
      {
        if ((v13 & 0x1000000000000000) != 0)
          v17 = (_BYTE *)((v15 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v17 = (_BYTE *)sub_1D7146508();
        sub_1D713CCE0(v17, (BOOL *)v26);
        v18 = v26[0];
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
          goto LABEL_16;
      }
      sub_1D714628C();
      sub_1D71312DC((uint64_t)v10, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
      v19 = sub_1D7146298();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 0, 1, v19);
    }
  }
LABEL_16:
  sub_1D71312DC((uint64_t)v10, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
  v22 = sub_1D7146298();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
}

uint64_t HAURL.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  char v2;

  v2 = 1;
  return sub_1D7137920(&v2, a1);
}

uint64_t HAURL.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  char v2;

  v2 = 2;
  return sub_1D7137920(&v2, a1);
}

uint64_t HAURL.source.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, unint64_t, uint64_t);
  id v41;

  v0 = sub_1D714613C();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890];
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D7131240(0, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v36 - v11;
  sub_1D7131240(0, &qword_1F00AE600, v1, v6);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v36 - v14;
  sub_1D7146154();
  sub_1D713CC88((uint64_t)v12, (uint64_t)v10, &qword_1F00AE5F8, v5);
  v16 = sub_1D7146184();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16) == 1)
  {
    sub_1D71312DC((uint64_t)v12, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
LABEL_14:
    sub_1D71312DC((uint64_t)v10, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v15, 1, 1, v0);
    goto LABEL_21;
  }
  v18 = sub_1D7146148();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v16);
  if (!v18)
  {
    v10 = v12;
    goto LABEL_14;
  }
  v38 = v12;
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v37 = v15;
    v20 = (void *)objc_opt_self();
    v21 = v18 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v39 = *(_QWORD *)(v2 + 72);
    v40 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
    v41 = v20;
    v36 = v18;
    swift_bridgeObjectRetain();
    while (1)
    {
      v22 = v2;
      v40(v4, v21, v0);
      v23 = sub_1D7146124();
      v25 = v24;
      v26 = objc_msgSend(v41, sel_queryParameterNameSource);
      v27 = sub_1D714631C();
      v29 = v28;

      if (v23 == v27 && v25 == v29)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_19;
      }
      v31 = sub_1D71465A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) != 0)
        break;
      v2 = v22;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v0);
      v21 += v39;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        v32 = 1;
        v15 = v37;
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
LABEL_19:
    v15 = v37;
    v33 = (uint64_t)v38;
    v2 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v37, v4, v0);
    v32 = 0;
  }
  else
  {
    v32 = 1;
LABEL_16:
    v33 = (uint64_t)v38;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v15, v32, 1, v0);
  swift_bridgeObjectRelease();
  sub_1D71312DC(v33, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
LABEL_21:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v15, 1, v0) == 1)
  {
    sub_1D71312DC((uint64_t)v15, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
    return 0;
  }
  else
  {
    v34 = sub_1D7146130();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v0);
  }
  return v34;
}

uint64_t HAURL.pluginBundleName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  uint64_t v24;
  unint64_t v25;

  v1 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3, v0, v4);
  v5 = sub_1D714625C();
  if (!v6)
    goto LABEL_3;
  v24 = v5;
  v25 = v6;
  v7 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  v8 = sub_1D714631C();
  v10 = v9;

  v23[2] = v8;
  v23[3] = v10;
  sub_1D7130F40();
  v11 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
    goto LABEL_3;
  v14 = sub_1D7146244();
  if (v15)
  {
    v12 = v14;
    v16 = v15;
    v24 = 46;
    v25 = 0xE100000000000000;
    MEMORY[0x1E0C80A78](v14);
    v23[-2] = &v24;
    swift_bridgeObjectRetain_n();
    v17 = (_QWORD *)sub_1D713AA4C(0x7FFFFFFFFFFFFFFFLL, 1, sub_1D713C9B8, (uint64_t)&v23[-4], v12, v16);
    swift_bridgeObjectRelease();
    if (v17[2] == 2)
    {
      v18 = v17[8];
      v19 = v17[9];
      v20 = v17[10];
      v21 = v17[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v22 = sub_1D713CC14(v18, v19, v20, v21, 0x6C7068746C616568, 0xEC0000006E696775);
      swift_bridgeObjectRelease();
      sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
      if ((v22 & 1) != 0)
        return v12;
    }
    else
    {
      sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_3:
    sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  }
  return 0;
}

uint64_t HAURL.trendTimescope.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;
  char v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  void (*v85)(char *, unint64_t, uint64_t);
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unsigned __int8 *v102;
  char v103;
  char v104;
  uint64_t v105;
  unsigned __int8 *v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 *v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unsigned __int8 *v114;
  unsigned int v115;
  uint64_t v116;
  char v117;
  id v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v1 = v0;
  v2 = sub_1D71462E0();
  v121 = *(_QWORD *)(v2 - 8);
  v122 = v2;
  MEMORY[0x1E0C80A78](v2);
  v127 = (char *)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D714613C();
  v125 = *(_QWORD *)(v4 - 8);
  v126 = v4;
  MEMORY[0x1E0C80A78](v4);
  v124 = (char *)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D7131240(0, &qword_1F00AE600, v7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v9 = MEMORY[0x1E0C80A78](v8);
  v123 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v118 - v11;
  sub_1D7131240(0, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], v6);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v118 - v17;
  v19 = type metadata accessor for HAURL();
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v118 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v118 - v26;
  v28 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v118 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v30, v0, v31);
  v32 = sub_1D714625C();
  if (!v33)
  {
    sub_1D713B4A0(v0, (uint64_t)v27);
    goto LABEL_8;
  }
  v119 = v18;
  v120 = v12;
  v131 = v32;
  v132 = v33;
  v34 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  v35 = sub_1D714631C();
  v128 = (uint64_t)v30;
  v36 = v35;
  v38 = v37;

  v129 = v36;
  v130 = v38;
  v30 = (char *)v128;
  sub_1D7130F40();
  v39 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D713B4A0(v1, (uint64_t)v27);
  if (v39)
  {
LABEL_8:
    v48 = (uint64_t)v27;
LABEL_9:
    sub_1D713BBC4(v48, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    goto LABEL_10;
  }
  v40 = sub_1D7146244();
  v42 = v41;
  v118 = (id)objc_opt_self();
  v43 = objc_msgSend(v118, sel_sampleTypeHostName);
  v44 = sub_1D714631C();
  v46 = v45;

  if (!v42)
  {
    sub_1D713BBC4((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    v30 = (char *)v128;
    goto LABEL_10;
  }
  if (v40 == v44 && v42 == v46)
  {
    swift_bridgeObjectRelease();
    sub_1D713BBC4((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    v30 = (char *)v128;
    v47 = (uint64_t)v120;
  }
  else
  {
    v51 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    sub_1D713BBC4((uint64_t)v27, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    v30 = (char *)v128;
    v47 = (uint64_t)v120;
    if ((v51 & 1) == 0)
      goto LABEL_10;
  }
  v52 = *(_QWORD *)(sub_1D7146208() + 16);
  swift_bridgeObjectRelease();
  sub_1D713B4A0(v1, (uint64_t)v25);
  if (v52 != 2)
    goto LABEL_21;
  v53 = (_QWORD *)sub_1D7146208();
  if (!v53[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  v55 = v53[4];
  v54 = v53[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v54)
  {
LABEL_21:
    v48 = (uint64_t)v25;
    goto LABEL_9;
  }
  if (v55 == 47 && v54 == 0xE100000000000000)
  {
    sub_1D713BBC4((uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    swift_bridgeObjectRelease();
    v56 = v127;
    goto LABEL_23;
  }
  v57 = sub_1D71465A4();
  sub_1D713BBC4((uint64_t)v25, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
  swift_bridgeObjectRelease();
  v56 = v127;
  if ((v57 & 1) == 0)
  {
LABEL_10:
    sub_1D713BBC4((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    return 0;
  }
LABEL_23:
  v58 = sub_1D7146208();
  v59 = *(_QWORD *)(v58 + 16);
  if (!v59)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v60 = v58 + 16 * v59;
  v62 = *(_QWORD *)(v60 + 16);
  v61 = *(_QWORD *)(v60 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v63 = (void *)objc_opt_self();
  v64 = (void *)sub_1D7146304();
  v65 = objc_msgSend(v63, sel__typeWithIdentifier_, v64);

  if (!v65)
  {
    if (qword_1EDBEA7D0 != -1)
      swift_once();
    v72 = v122;
    v73 = __swift_project_value_buffer(v122, (uint64_t)qword_1EDBEA7D8);
    v74 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v56, v73, v72);
    sub_1D713B4A0(v1, (uint64_t)v22);
    swift_bridgeObjectRetain();
    v75 = sub_1D71462C8();
    v76 = sub_1D7146430();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = swift_slowAlloc();
      v128 = swift_slowAlloc();
      v131 = v128;
      *(_DWORD *)v77 = 136315651;
      v129 = sub_1D713B4E4(0x4C52554148, 0xE500000000000000, &v131);
      sub_1D7146460();
      *(_WORD *)(v77 + 12) = 2082;
      swift_bridgeObjectRetain();
      v129 = sub_1D713B4E4(v62, v61, &v131);
      sub_1D7146460();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v77 + 22) = 2081;
      v78 = sub_1D71461FC();
      v129 = sub_1D713B4E4(v78, v79, &v131);
      sub_1D7146460();
      swift_bridgeObjectRelease();
      sub_1D713BBC4((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      _os_log_impl(&dword_1D712B000, v75, v76, "%s Invalid type identifier %{public}s provided in URL %{private}s with trend", (uint8_t *)v77, 0x20u);
      v80 = v128;
      swift_arrayDestroy();
      MEMORY[0x1D8292EA0](v80, -1, -1);
      MEMORY[0x1D8292EA0](v77, -1, -1);

      (*(void (**)(char *, uint64_t))(v121 + 8))(v127, v122);
    }
    else
    {

      sub_1D713BBC4((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v56, v72);
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  v66 = (uint64_t)v119;
  sub_1D7146154();
  sub_1D713CC88(v66, (uint64_t)v16, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
  v67 = sub_1D7146184();
  v68 = *(_QWORD *)(v67 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v16, 1, v67) == 1)
  {
    sub_1D71312DC((uint64_t)v16, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v70 = v125;
    v69 = v126;
    v71 = (uint64_t)v123;
LABEL_43:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v47, 1, 1, v69);
    goto LABEL_49;
  }
  v81 = sub_1D7146148();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v16, v67);
  v70 = v125;
  v69 = v126;
  v71 = (uint64_t)v123;
  if (!v81)
    goto LABEL_43;
  v82 = *(_QWORD *)(v81 + 16);
  if (v82)
  {
    v83 = v81 + ((*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
    v84 = *(_QWORD *)(v125 + 72);
    v85 = *(void (**)(char *, unint64_t, uint64_t))(v125 + 16);
    swift_bridgeObjectRetain();
    v86 = v124;
    while (1)
    {
      v85(v86, v83, v69);
      v87 = sub_1D7146124();
      v89 = v88;
      v90 = objc_msgSend(v118, sel_queryParameterNameTrendOverlay);
      v91 = sub_1D714631C();
      v93 = v92;

      if (v87 == v91 && v89 == v93)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_47;
      }
      v95 = sub_1D71465A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v95 & 1) != 0)
        break;
      v86 = v124;
      v70 = v125;
      v69 = v126;
      (*(void (**)(char *, uint64_t))(v125 + 8))(v124, v126);
      v83 += v84;
      if (!--v82)
      {
        swift_bridgeObjectRelease();
        v47 = (uint64_t)v120;
        v71 = (uint64_t)v123;
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
LABEL_47:
    v70 = v125;
    v69 = v126;
    v71 = (uint64_t)v123;
    v47 = (uint64_t)v120;
    (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v120, v124, v126);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v70 + 56))(v47, 0, 1, v69);
  }
  else
  {
LABEL_42:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v47, 1, 1, v69);
  }
  swift_bridgeObjectRelease();
  v30 = (char *)v128;
LABEL_49:
  sub_1D713CC88(v47, v71, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v71, 1, v69) == 1)
  {
    sub_1D71312DC(v71, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
LABEL_107:
    sub_1D71312DC(v47, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
    sub_1D71312DC((uint64_t)v119, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    goto LABEL_10;
  }
  v96 = sub_1D7146130();
  v98 = v97;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 8))(v71, v69);
  if (!v98)
    goto LABEL_107;
  v99 = HIBYTE(v98) & 0xF;
  v100 = v96 & 0xFFFFFFFFFFFFLL;
  if ((v98 & 0x2000000000000000) != 0)
    v101 = HIBYTE(v98) & 0xF;
  else
    v101 = v96 & 0xFFFFFFFFFFFFLL;
  if (!v101)
  {
    swift_bridgeObjectRelease();
    goto LABEL_107;
  }
  if ((v98 & 0x1000000000000000) != 0)
  {
    v49 = (uint64_t)sub_1D713BC00(v96, v98, 10);
    v104 = v117;
    goto LABEL_104;
  }
  if ((v98 & 0x2000000000000000) == 0)
  {
    if ((v96 & 0x1000000000000000) != 0)
      v102 = (unsigned __int8 *)((v98 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v102 = (unsigned __int8 *)sub_1D7146508();
    v49 = (uint64_t)sub_1D713BCE4(v102, v100, 10);
    v104 = v103 & 1;
LABEL_104:
    swift_bridgeObjectRelease();
    if ((v104 & 1) == 0)
    {
      sub_1D71312DC(v47, &qword_1F00AE600, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
      sub_1D71312DC((uint64_t)v119, &qword_1F00AE5F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
      sub_1D713BBC4((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
      return v49;
    }
    goto LABEL_107;
  }
  v131 = v96;
  v132 = v98 & 0xFFFFFFFFFFFFFFLL;
  if (v96 == 43)
  {
    if (!v99)
      goto LABEL_111;
    if (v99 == 1 || (BYTE1(v96) - 48) > 9u)
      goto LABEL_82;
    v49 = (BYTE1(v96) - 48);
    if (v99 == 2)
    {
LABEL_84:
      v104 = 0;
      goto LABEL_104;
    }
    if ((BYTE2(v96) - 48) > 9u)
      goto LABEL_82;
    v49 = 10 * (BYTE1(v96) - 48) + (BYTE2(v96) - 48);
    v105 = v99 - 3;
    if (v105)
    {
      v106 = (unsigned __int8 *)&v131 + 3;
      while (1)
      {
        v107 = *v106 - 48;
        if (v107 > 9)
          goto LABEL_102;
        v108 = 10 * v49;
        if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63)
          goto LABEL_102;
        v49 = v108 + v107;
        if (__OFADD__(v108, v107))
          goto LABEL_102;
        v104 = 0;
        ++v106;
        if (!--v105)
          goto LABEL_103;
      }
    }
LABEL_95:
    v104 = 0;
LABEL_103:
    v30 = (char *)v128;
    v47 = (uint64_t)v120;
    goto LABEL_104;
  }
  if (v96 != 45)
  {
    if (!v99 || (v96 - 48) > 9u)
      goto LABEL_82;
    v49 = (v96 - 48);
    if (v99 == 1)
      goto LABEL_84;
    if ((BYTE1(v96) - 48) > 9u)
      goto LABEL_82;
    v49 = 10 * (v96 - 48) + (BYTE1(v96) - 48);
    v109 = v99 - 2;
    if (v109)
    {
      v110 = (unsigned __int8 *)&v131 + 2;
      while (1)
      {
        v111 = *v110 - 48;
        if (v111 > 9)
          goto LABEL_102;
        v112 = 10 * v49;
        if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63)
          goto LABEL_102;
        v49 = v112 + v111;
        if (__OFADD__(v112, v111))
          goto LABEL_102;
        v104 = 0;
        ++v110;
        if (!--v109)
          goto LABEL_103;
      }
    }
    goto LABEL_95;
  }
  if (v99)
  {
    if (v99 != 1 && (BYTE1(v96) - 48) <= 9u)
    {
      if (v99 == 2)
      {
        v104 = 0;
        v49 = -(uint64_t)(BYTE1(v96) - 48);
        goto LABEL_104;
      }
      if ((BYTE2(v96) - 48) <= 9u)
      {
        v49 = -10 * (BYTE1(v96) - 48) - (BYTE2(v96) - 48);
        v113 = v99 - 3;
        if (!v113)
          goto LABEL_95;
        v114 = (unsigned __int8 *)&v131 + 3;
        while (1)
        {
          v115 = *v114 - 48;
          if (v115 > 9)
            break;
          v116 = 10 * v49;
          if ((unsigned __int128)(v49 * (__int128)10) >> 64 != (10 * v49) >> 63)
            break;
          v49 = v116 - v115;
          if (__OFSUB__(v116, v115))
            break;
          v104 = 0;
          ++v114;
          if (!--v113)
            goto LABEL_103;
        }
LABEL_102:
        v49 = 0;
        v104 = 1;
        goto LABEL_103;
      }
    }
LABEL_82:
    v49 = 0;
    v104 = 1;
    goto LABEL_104;
  }
  __break(1u);
LABEL_111:
  __break(1u);
  return result;
}

uint64_t static HAURL.createURLComponents(pluginBundleName:)()
{
  id v0;

  sub_1D7146178();
  v0 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  sub_1D714631C();

  sub_1D714616C();
  swift_bridgeObjectRetain();
  return sub_1D7146160();
}

uint64_t static HAURL.appendProfileIdentifier(to:profileIdentifier:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1D7146220();
  v6 = objc_msgSend(v4, sel__hk_appendQueryParameterToURL_forHKProfileIdentifier_, v5, a1);

  if (v6)
  {
    sub_1D714622C();

    v7 = sub_1D7146274();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a2;
    v10 = 0;
  }
  else
  {
    v7 = sub_1D7146274();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a2;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

Swift::OpaquePointer_optional __swiftcall HAURL.createUserActivityDictionary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  Swift::Bool v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  void *v35;
  _QWORD v36[6];
  __int128 v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _QWORD v57[13];
  Swift::OpaquePointer_optional result;

  v57[11] = *MEMORY[0x1E0C80C00];
  v1 = sub_1D71462E0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v8);
  v49 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D714613C();
  v52 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_allocWithZone(MEMORY[0x1E0CB3998]);
  v43 = v0;
  v14 = (void *)sub_1D7146220();
  v15 = objc_msgSend(v13, sel_initWithURL_resolvingAgainstBaseURL_, v14, 0);

  if (v15)
  {
    v17 = objc_msgSend(v15, sel_queryItems);
    v48 = v10;
    if (v17)
    {
      v18 = v17;
      v19 = sub_1D7146400();

    }
    else
    {
      v19 = MEMORY[0x1E0DEE9D8];
    }
    v21 = sub_1D7130E18(MEMORY[0x1E0DEE9D8]);
    v20 = (void *)v21;
    if (*(_QWORD *)(v19 + 16))
    {
      v38 = v4;
      v39 = v2;
      v40 = v1;
      v50 = v21;
      v36[0] = v15;
      v36[1] = v7;
      v41 = 0;
      v45 = v19 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
      v36[4] = (char *)&v55 + 8;
      v44 = xmmword_1D7147430;
      v37 = xmmword_1D7147440;
      v36[3] = MEMORY[0x1E0DEE9B8] + 8;
      v42 = "query";
      v36[2] = "displayCategoryID";
      v46 = v19;
      if (*(_QWORD *)(v19 + 16))
      {
        v51 = 1;
        (*(void (**)(char *, unint64_t, uint64_t))(v52 + 16))(v12, v45, v48);
        sub_1D7146124();
        sub_1D713D2EC(0, &qword_1F00AE608, (uint64_t)&type metadata for QueryParameterName, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v44;
        *(_QWORD *)(inited + 32) = 0x706050403020100;
        *(_WORD *)(inited + 40) = 2312;
        __asm { BR              X8 }
      }
      __break(1u);
    }
    swift_bridgeObjectRelease();
    v23 = sub_1D7146274();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v7, v43, v23);
    v24 = sub_1D714625C();
    if (!v25)
      goto LABEL_13;
    v57[0] = v24;
    v57[1] = v25;
    v26 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
    v27 = sub_1D714631C();
    v29 = v28;

    *(_QWORD *)&v55 = v27;
    *((_QWORD *)&v55 + 1) = v29;
    sub_1D7130F40();
    v30 = MEMORY[0x1E0DEA968];
    v31 = sub_1D7146484();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v31)
    {
      *(_QWORD *)&v55 = 0x63536D6F74737563;
      *((_QWORD *)&v55 + 1) = 0xEF4C5255656D6568;
      sub_1D71464D8();
      v32 = sub_1D71461FC();
      v56 = v30;
      *(_QWORD *)&v55 = v32;
      *((_QWORD *)&v55 + 1) = v33;
      sub_1D713143C(&v55, &v54);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53 = v20;
      sub_1D713C72C(&v54, (uint64_t)v57, isUniquelyReferenced_nonNull_native);
      v20 = v53;
      swift_bridgeObjectRelease();
      sub_1D7131320((uint64_t)v57);

      sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    }
    else
    {
LABEL_13:
      sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);

    }
  }
  else
  {
    v20 = 0;
  }
  v35 = v20;
  result.value._rawValue = v35;
  result.is_nil = v16;
  return result;
}

uint64_t sub_1D713AA18(void *a1)
{
  id v1;

  v1 = a1;
  sub_1D7133C84();
  return sub_1D7146334();
}

uint64_t sub_1D713AA4C(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
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
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
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
    sub_1D713AEE8(v30 | (v11 << 16), v47, a2 & 1, v10);
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
  v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_1D71463D0();
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
    v14 = sub_1D7146358();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_1D7146358();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_1D71463E8();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_1D713B25C(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_1D713B25C((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_1D7146358();
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
    v31 = sub_1D71463E8();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_1D713B25C(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_1D713B25C((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
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
  sub_1D7146520();
  __break(1u);
LABEL_42:
  result = sub_1D7146520();
  __break(1u);
  return result;
}

uint64_t sub_1D713AEE8(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
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
    v7 = sub_1D71463E8();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_1D713B25C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_1D713B25C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
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
  result = sub_1D7146520();
  __break(1u);
  return result;
}

uint64_t sub_1D713B040(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_1D7131240(0, &qword_1F00AE680, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = *(_QWORD *)(sub_1D714613C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1D7146520();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1D714613C() - 8);
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
    sub_1D713CA0C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_1D713B25C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_1D713D2EC(0, &qword_1EDBEA7A0, MEMORY[0x1E0DEBAF0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
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
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1D713CB24(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D713B37C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for HAURL();
  v5 = sub_1D71465EC();
  sub_1D713B4E4(v5, v6, a3);
  v7 = *a1 + 8;
  sub_1D7146460();
  result = swift_bridgeObjectRelease();
  *a1 = v7;
  return result;
}

uint64_t sub_1D713B3F4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1D713B4E4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1D7146460();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t type metadata accessor for HAURL()
{
  uint64_t result;

  result = qword_1EDBEA638;
  if (!qword_1EDBEA638)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D713B4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HAURL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D713B4E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D713B5B4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D7131354((uint64_t)v12, *a3);
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
      sub_1D7131354((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D713B5B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D714646C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D713B76C(a5, a6);
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
  v8 = sub_1D7146508();
  if (!v8)
  {
    sub_1D7146520();
    __break(1u);
LABEL_17:
    result = sub_1D7146568();
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

uint64_t sub_1D713B76C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D713B800(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D713BA64(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D713BA64(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D713B800(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D713B974(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D71464FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D7146520();
      __break(1u);
LABEL_10:
      v2 = sub_1D7146370();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D7146568();
    __break(1u);
LABEL_14:
    result = sub_1D7146520();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1D713B974(uint64_t a1, uint64_t a2)
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
  sub_1D713D2EC(0, &qword_1F00AE678, MEMORY[0x1E0DEDE70], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D713B9EC(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_1D71463AC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1D82927C8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_1D713BA64(char a1, int64_t a2, char a3, char *a4)
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
    sub_1D713D2EC(0, &qword_1F00AE678, MEMORY[0x1E0DEDE70], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
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
  result = sub_1D7146568();
  __break(1u);
  return result;
}

uint64_t sub_1D713BBC4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned __int8 *sub_1D713BC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_1D71463DC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1D713BF60();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1D7146508();
  }
LABEL_7:
  v11 = sub_1D713BCE4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1D713BCE4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1D713BF60()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1D71463E8();
  v4 = sub_1D713BFDC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1D713BFDC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1D713C120(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1D713B974(v9, 0);
      v12 = sub_1D713C20C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1D8292780](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1D8292780);
LABEL_9:
      sub_1D7146508();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1D8292780]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1D713C120(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_1D713B9EC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1D713B9EC(a2, a3, a4);
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
    return sub_1D7146394();
  }
  __break(1u);
  return result;
}

unint64_t sub_1D713C20C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_1D713B9EC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1D71463A0();
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
          result = sub_1D7146508();
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
    result = sub_1D713B9EC(v12, a6, a7);
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
    v12 = sub_1D714637C();
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

uint64_t sub_1D713C41C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  sub_1D7131390();
  v6 = sub_1D7146544();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1D713143C((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1D713D278(v25, (uint64_t)&v38);
      sub_1D7131354(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1D71464C0();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1D713143C(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1D713C72C(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1D713E0AC(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_1D713143C(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1D713F7B8();
      goto LABEL_7;
    }
    sub_1D713C41C(v13, a3 & 1);
    v19 = sub_1D713E0AC(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1D713D278(a2, (uint64_t)v21);
      return sub_1D713C864(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1D71465BC();
  __break(1u);
  return result;
}

_OWORD *sub_1D713C864(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1D713143C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

uint64_t sub_1D713C8DC(void (*a1)(char *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  char v7;
  char v9;
  _QWORD v10[2];
  char v11;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    sub_1D71464E4();
    if (!v4)
      v7 = v11;
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v10[0] = a3;
    v10[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    a1(&v9, v10);
    if (!v4)
      v7 = v9;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v6 = sub_1D7146508();
    a1((char *)v10, (_QWORD *)v6);
    if (!v4)
      v7 = v10[0];
  }
  return v7 & 1;
}

uint64_t sub_1D713C9B8(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_1D71465A4() & 1;
}

uint64_t sub_1D713CA0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_1D714613C() - 8);
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
  result = sub_1D7146568();
  __break(1u);
  return result;
}

uint64_t sub_1D713CB24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1D7146568();
  __break(1u);
  return result;
}

uint64_t sub_1D713CC14(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  if ((a6 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a6) & 0xF;
  else
    v6 = a5 & 0xFFFFFFFFFFFFLL;
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6)
    return 1;
  else
    return sub_1D7146580() & 1;
}

uint64_t sub_1D713CC88(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D7131240(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

_BYTE *sub_1D713CCE0@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_1D713D330(a1, a2);
}

uint64_t sub_1D713CCF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D713CD18()
{
  uint64_t v0;

  return sub_1D713AA18(*(void **)(v0 + 16));
}

uint64_t sub_1D713CD20()
{
  return swift_deallocObject();
}

_BYTE **sub_1D713CD30(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

uint64_t sub_1D713CD44()
{
  return swift_deallocObject();
}

uint64_t sub_1D713CD54()
{
  return swift_deallocObject();
}

uint64_t sub_1D713CD64()
{
  return swift_deallocObject();
}

uint64_t sub_1D713CD74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D713CD98(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1D713B3F4(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1D713CDA0()
{
  unint64_t result;

  result = qword_1F00AE618;
  if (!qword_1F00AE618)
  {
    sub_1D713D2EC(255, &qword_1EDBEA560, MEMORY[0x1E0DEDE70], MEMORY[0x1E0DEB910]);
    sub_1D7131240(255, &qword_1F00AE620, (uint64_t (*)(uint64_t))sub_1D713CE4C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    sub_1D713CF04();
    result = swift_getFunctionTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE618);
  }
  return result;
}

void sub_1D713CE4C(uint64_t a1)
{
  sub_1D7131240(a1, &qword_1F00AE628, (uint64_t (*)(uint64_t))sub_1D713CE68, MEMORY[0x1E0DEB910]);
}

void sub_1D713CE68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE630)
  {
    sub_1D713CECC(255, &qword_1F00AE638);
    v0 = sub_1D7146454();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE630);
  }
}

uint64_t sub_1D713CECC(uint64_t a1, unint64_t *a2)
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

void sub_1D713CF04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE640)
  {
    sub_1D713D2EC(255, qword_1F00AE648, MEMORY[0x1E0DEE9B8] + 8, MEMORY[0x1E0DEB910]);
    v0 = sub_1D7146454();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE640);
  }
}

uint64_t sub_1D713CF74(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D713CFB8(uint64_t a1, unint64_t a2)
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

uint64_t initializeBufferWithCopyOfBuffer for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for HAURL(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for HAURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HAURL()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D713D188(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HAURL()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D713D1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1D713D210()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D7146274();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1D713D278(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1D713D2B8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D713D2DC()
{
  return swift_deallocObject();
}

void sub_1D713D2EC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

_BYTE *sub_1D713D330@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t DeepLinkingDataParameter.addToURL(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23[4];

  v23[0] = a4;
  v23[1] = a1;
  v6 = sub_1D714610C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)v23 - v12;
  (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
  v23[2] = v15;
  v23[3] = v17;
  sub_1D7146100();
  sub_1D7130F40();
  v18 = sub_1D7146478();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  sub_1D713DCCC(v21, v18, v20, v23[0]);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static DeepLinkingDataParameter.fromURLQueryItems(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t AssociatedConformanceWitness;
  char *v40;
  uint64_t v41;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_1D7146454();
  v50 = *(_QWORD *)(v10 - 8);
  v51 = v10;
  v11 = MEMORY[0x1E0C80A78](v10);
  v52 = (char *)&v45 - v12;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x1E0C80A78](v11);
  v48 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v49 = (char *)&v45 - v16;
  v17 = sub_1D714613C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](a1);
  v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = *(_QWORD *)(a1 + 16);
  if (v24)
  {
    v46 = AssociatedTypeWitness;
    v47 = (char *)&v45 - v23;
    v45 = v13;
    v54 = a4;
    v55 = a3;
    v25 = a2;
    v26 = v22 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    v27 = *(_QWORD *)(v18 + 72);
    v28 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
    v53 = v22;
    swift_bridgeObjectRetain();
    while (1)
    {
      v28(v21, v26, v17);
      if ((sub_1D713DFF8((uint64_t)v21, v4, v25, v55) & 1) != 0)
        break;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      v26 += v27;
      if (!--v24)
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    v30 = v47;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v47, v21, v17);
    v31 = sub_1D7146130();
    v33 = v32;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v17);
    if (!v33)
    {
LABEL_12:
      v29 = 1;
      a2 = v25;
      goto LABEL_13;
    }
    v56 = v31;
    v57 = v33;
    sub_1D7130F40();
    v34 = sub_1D7146490();
    v36 = v35;
    swift_bridgeObjectRelease();
    a2 = v25;
    if (!v36)
    {
LABEL_11:
      v29 = 1;
LABEL_13:
      a4 = v54;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, v29, 1, a2);
    }
    v37 = v55;
    v38 = v46;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v40 = v52;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v34, v36, v38, AssociatedConformanceWitness);
    swift_bridgeObjectRelease();
    v41 = v45;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v40, 1, v38) == 1)
    {
      (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v51);
      goto LABEL_11;
    }
    v43 = v49;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v49, v40, v38);
    v44 = v48;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v48, v43, v38);
    a4 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 24))(v44, a2, v37);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v38);
    v29 = 0;
  }
  else
  {
    v29 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, v29, 1, a2);
}

NSUserActivity __swiftcall DeepLinkingDataParameter.addToUserActivity(_:)(NSUserActivity a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  void (*v6)(uint64_t, uint64_t);
  void *v7;

  v3 = v2;
  v4 = v1;
  sub_1D7131240(0, (unint64_t *)&qword_1EDBEA578, (uint64_t (*)(uint64_t))sub_1D7130FC8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7147290;
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  sub_1D71464D8();
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
  *(_QWORD *)(inited + 96) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 72));
  v6(v4, v3);
  sub_1D7130E18(inited);
  v7 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  -[objc_class addUserInfoEntriesFromDictionary:](a1.super.isa, sel_addUserInfoEntriesFromDictionary_, v7);

  return (NSUserActivity)a1.super.isa;
}

uint64_t static DeepLinkingDataParameter.fromUserActivity(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[40];
  __int128 v35;
  __int128 v36;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_1D7146454();
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v29 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x1E0C80A78](v10);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v29 - v17;
  v19 = objc_msgSend(a1, sel_userInfo);
  if (v19)
  {
    v20 = v19;
    v29 = a4;
    v21 = sub_1D71462F8();

    v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
    v33 = v22;
    sub_1D71464D8();
    if (*(_QWORD *)(v21 + 16) && (v23 = sub_1D713E0AC((uint64_t)v34), (v24 & 1) != 0))
    {
      sub_1D7131354(*(_QWORD *)(v21 + 56) + 32 * v23, (uint64_t)&v35);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
    }
    sub_1D7131320((uint64_t)v34);
    swift_bridgeObjectRelease();
    a4 = v29;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }
  sub_1D713402C();
  v25 = swift_dynamicCast();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v25)
  {
    v26(v12, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v12, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(a3 + 24))(v16, a2, a3);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, AssociatedTypeWitness);
    v27 = 0;
  }
  else
  {
    v27 = 1;
    v26(v12, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v31);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, v27, 1, a2);
}

uint64_t sub_1D713DCCC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[4];

  v29[2] = a2;
  v29[3] = a3;
  v29[1] = a1;
  sub_1D7131240(0, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)v29 - v5;
  v7 = sub_1D714613C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v29 - v12;
  v14 = objc_allocWithZone(MEMORY[0x1E0CB3998]);
  v15 = (void *)sub_1D7146220();
  v16 = objc_msgSend(v14, sel_initWithURL_resolvingAgainstBaseURL_, v15, 0);

  if (v16)
  {
    v29[0] = a4;
    v17 = objc_msgSend(v16, sel_queryItems);
    if (v17)
    {
      v18 = v17;
      v19 = sub_1D7146400();

    }
    else
    {
      v19 = MEMORY[0x1E0DEE9D8];
    }
    sub_1D7146118();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v19 = sub_1D713B040(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
    v23 = *(_QWORD *)(v19 + 16);
    v22 = *(_QWORD *)(v19 + 24);
    if (v23 >= v22 >> 1)
      v19 = sub_1D713B040(v22 > 1, v23 + 1, 1, v19);
    *(_QWORD *)(v19 + 16) = v23 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v23, v11, v7);
    v24 = (void *)sub_1D71463F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setQueryItems_, v24);

    v25 = objc_msgSend(v16, sel_URL);
    if (v25)
    {
      v26 = v25;
      sub_1D714622C();

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      v27 = sub_1D7146274();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 0, 1, v27);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      v28 = sub_1D7146274();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v6, 1, 1, v28);
    }
    return sub_1D713E1C8((uint64_t)v6, v29[0]);
  }
  else
  {
    v20 = sub_1D7146274();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a4, 1, 1, v20);
  }
}

uint64_t sub_1D713DFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v6 = sub_1D7146124();
  v8 = v7;
  if (v6 == (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4) && v8 == v9)
    v11 = 1;
  else
    v11 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

unint64_t sub_1D713E0AC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D71464C0();
  return sub_1D713E104(a1, v2);
}

uint64_t dispatch thunk of DeepLinkingDataParameter.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static DeepLinkingDataParameter.keyName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DeepLinkingDataParameter.value.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

unint64_t sub_1D713E104(uint64_t a1, uint64_t a2)
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
      sub_1D713D278(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D829290C](v9, a1);
      sub_1D7131320((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D713E1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D7131240(0, (unint64_t *)&qword_1F00AE430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NSUserActivityProtocol.init(activityType:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8))(a1, a2, a4, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 40))(a3, a4, a5);
}

void sub_1D713E288(_QWORD *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1D7146304();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithActivityType_, v3);

  *a1 = v4;
}

uint64_t sub_1D713E2FC()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_activityType);
  v2 = sub_1D714631C();

  return v2;
}

uint64_t sub_1D713E350()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_userInfo);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D71462F8();

  return v3;
}

void sub_1D713E3BC(uint64_t a1)
{
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  if (a1)
  {
    v3 = (id)sub_1D71462EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, sel_setUserInfo_, v3);

}

void (*sub_1D713E43C(uint64_t **a1))(_QWORD *a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_1D713E4E0(v2);
  return sub_1D713E484;
}

void sub_1D713E484(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t dispatch thunk of NSUserActivityProtocol.init(activityType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.init(activityType:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.activityType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of NSUserActivityProtocol.userInfo.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

void (*sub_1D713E4E0(uint64_t *a1))(uint64_t *a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;

  a1[1] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_userInfo);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1D71462F8();

  }
  else
  {
    v5 = 0;
  }
  *a1 = v5;
  return sub_1D713E568;
}

void sub_1D713E568(uint64_t *a1, char a2)
{
  uint64_t v3;
  id v4;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      v4 = (id)sub_1D71462EC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend((id)a1[1], sel_setUserInfo_, v4);
    swift_bridgeObjectRelease();
  }
  else if (v3)
  {
    v4 = (id)sub_1D71462EC();
    swift_bridgeObjectRelease();
    objc_msgSend((id)a1[1], sel_setUserInfo_, v4);
  }
  else
  {
    v4 = 0;
    objc_msgSend((id)a1[1], sel_setUserInfo_, 0);
  }

}

uint64_t sub_1D713E648()
{
  uint64_t v0;

  v0 = sub_1D71462E0();
  __swift_allocate_value_buffer(v0, qword_1EDBEA7D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDBEA7D8);
  return sub_1D71462D4();
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

HealthAppServices::DeepLinkActivityType_optional __swiftcall DeepLinkActivityType.init(_:)(Swift::String a1)
{
  HealthAppServices::DeepLinkActivityType_optional result;

  __asm { BR              X8 }
  return result;
}

void *static DeepLinkActivityType.allCases.getter()
{
  return &unk_1E9BE1770;
}

uint64_t DeepLinkActivityType.userActivityType.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D713EA74 + 4 * byte_1D71474E2[*v0]))(0xD000000000000019, 0x80000001D71487F0);
}

uint64_t sub_1D713EA74@<X0>(uint64_t a1@<X8>)
{
  return a1 + 6;
}

void DeepLinkActivityType.rawValue.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1D713EBD8()
{
  return 0x67657461436C6C61;
}

BOOL DeepLinkActivityType.eligibleForHandoff.getter()
{
  unsigned __int8 *v0;

  return *v0 != 5;
}

HealthAppServices::DeepLinkActivityType_optional __swiftcall DeepLinkActivityType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthAppServices::DeepLinkActivityType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1D71465B0();
  result.value = swift_bridgeObjectRelease();
  v5 = 18;
  if (v3 < 0x12)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_1D713EEC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1D712FCB4(*a1, *a2);
}

unint64_t sub_1D713EED0()
{
  unint64_t result;

  result = qword_1F00AE688;
  if (!qword_1F00AE688)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for DeepLinkActivityType, &type metadata for DeepLinkActivityType);
    atomic_store(result, (unint64_t *)&qword_1F00AE688);
  }
  return result;
}

uint64_t sub_1D713EF14()
{
  sub_1D71465C8();
  DeepLinkActivityType.rawValue.getter();
  sub_1D714634C();
  swift_bridgeObjectRelease();
  return sub_1D71465E0();
}

uint64_t sub_1D713EF78()
{
  DeepLinkActivityType.rawValue.getter();
  sub_1D714634C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D713EFC8()
{
  sub_1D71465C8();
  DeepLinkActivityType.rawValue.getter();
  sub_1D714634C();
  swift_bridgeObjectRelease();
  return sub_1D71465E0();
}

unint64_t sub_1D713F02C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F00AE690;
  if (!qword_1F00AE690)
  {
    sub_1D713F074();
    result = MEMORY[0x1D8292E28](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F00AE690);
  }
  return result;
}

void sub_1D713F074()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE698)
  {
    v0 = sub_1D714640C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE698);
  }
}

void sub_1D713F0C8(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E9BE1770;
}

HealthAppServices::DeepLinkActivityType_optional sub_1D713F0D8(Swift::String *a1)
{
  return DeepLinkActivityType.init(rawValue:)(*a1);
}

void sub_1D713F0E4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  DeepLinkActivityType.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeepLinkActivityType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEF)
    goto LABEL_17;
  if (a2 + 17 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 17) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 17;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 17;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 17;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v8 = v6 - 18;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DeepLinkActivityType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_1D713F1F0 + 4 * byte_1D71474F9[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_1D713F224 + 4 * byte_1D71474F4[v4]))();
}

uint64_t sub_1D713F224(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D713F22C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D713F234);
  return result;
}

uint64_t sub_1D713F240(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D713F248);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_1D713F24C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D713F254(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D713F260(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D713F268(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkActivityType()
{
  return &type metadata for DeepLinkActivityType;
}

id sub_1D713F280()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_soundWithAlertType_, 17);
  qword_1F00AE6A0 = (uint64_t)result;
  return result;
}

id static NotificationSupport.defaultHealthAppNotificationSound.getter()
{
  if (qword_1F00AE3F8 != -1)
    swift_once();
  return (id)qword_1F00AE6A0;
}

id NotificationSupport.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NotificationSupport.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationSupport();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NotificationSupport.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationSupport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_1D713F508@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1D713E0AC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1D713F7B8();
      v9 = v11;
    }
    sub_1D7131320(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_1D713143C((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_1D713F5F0(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_1D713F5F0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1D71464B4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1D713D278(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_1D71464C0();
        result = sub_1D7131320((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1D713F7B8()
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
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_1D7131390();
  v2 = *v0;
  v3 = sub_1D7146538();
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
    v16 = 40 * v15;
    sub_1D713D278(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1D7131354(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1D713143C(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
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

unint64_t _s17HealthAppServices19NotificationSupportC06createD8UserInfo3for4withSDys11AnyHashableVypGSo20HKNotificationDomainV_10Foundation3URLVSgtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  unint64_t v22;
  _OWORD v23[2];
  __int128 v24;
  unint64_t v25;
  _BYTE v26[40];
  unint64_t v27;

  sub_1D713FBE8();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D7130E18(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v24 = sub_1D714631C();
  *((_QWORD *)&v24 + 1) = v8;
  v9 = MEMORY[0x1E0DEA968];
  sub_1D71464D8();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, a1);
  v25 = sub_1D713423C();
  *(_QWORD *)&v24 = v10;
  sub_1D713143C(&v24, v23);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = v7;
  sub_1D713C72C(v23, (uint64_t)v26, isUniquelyReferenced_nonNull_native);
  v27 = v22;
  swift_bridgeObjectRelease();
  sub_1D7131320((uint64_t)v26);
  *(_QWORD *)&v24 = sub_1D714631C();
  *((_QWORD *)&v24 + 1) = v12;
  sub_1D71464D8();
  sub_1D713FC3C(a2, (uint64_t)v6);
  v13 = sub_1D7146274();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, v13) == 1)
  {
    sub_1D713BBC4((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1D713FBE8);
    sub_1D713F508((uint64_t)v26, &v24);
    sub_1D7131320((uint64_t)v26);
    sub_1D713BBC4((uint64_t)&v24, (uint64_t (*)(_QWORD))sub_1D713402C);
    return v27;
  }
  else
  {
    v16 = sub_1D71461FC();
    v25 = v9;
    *(_QWORD *)&v24 = v16;
    *((_QWORD *)&v24 + 1) = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v13);
    sub_1D713143C(&v24, v23);
    v18 = v27;
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = v18;
    sub_1D713C72C(v23, (uint64_t)v26, v19);
    v15 = v22;
    swift_bridgeObjectRelease();
    sub_1D7131320((uint64_t)v26);
  }
  return v15;
}

uint64_t type metadata accessor for NotificationSupport()
{
  return objc_opt_self();
}

void sub_1D713FBE8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE430)
  {
    sub_1D7146274();
    v0 = sub_1D7146454();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE430);
  }
}

uint64_t sub_1D713FC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D713FBE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void QueryParameterName.rawValue.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1D713FCB4()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_queryParameterNameDate);
  v1 = sub_1D714631C();

  return v1;
}

HealthAppServices::QueryParameterName_optional __swiftcall QueryParameterName.init(paramName:)(Swift::String paramName)
{
  char *v1;
  void *object;
  char *v3;
  uint64_t v4;
  uint64_t countAndFlagsBits;
  char *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  char v12;
  HealthAppServices::QueryParameterName_optional result;

  object = paramName._object;
  v3 = v1;
  v4 = 10;
  countAndFlagsBits = paramName._countAndFlagsBits;
  v6 = &byte_1E9BE17C8;
  while (1)
  {
    v8 = *v6++;
    v7 = v8;
    QueryParameterName.rawValue.getter();
    if (v10 == countAndFlagsBits && v9 == object)
      break;
    v12 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_10;
    if (!--v4)
    {
      v7 = 10;
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  result.value = swift_bridgeObjectRelease();
  *v3 = v7;
  return result;
}

uint64_t QueryParameterName.restorationType.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D713FF00 + 4 * byte_1D7147670[*v0]))(0xD000000000000011, 0x80000001D71484B0);
}

uint64_t sub_1D713FF00()
{
  return 1702125924;
}

uint64_t sub_1D713FF10()
{
  return 0x7461447472617473;
}

void *static QueryParameterName.allCases.getter()
{
  return &unk_1E9BE17A8;
}

HealthAppServices::QueryParameterName_optional __swiftcall QueryParameterName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthAppServices::QueryParameterName_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1D7146574();
  result.value = swift_bridgeObjectRelease();
  v5 = 10;
  if (v3 < 0xA)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_1D7140044(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1D712FCC0(*a1, *a2);
}

unint64_t sub_1D7140054()
{
  unint64_t result;

  result = qword_1F00AE6D0;
  if (!qword_1F00AE6D0)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for QueryParameterName, &type metadata for QueryParameterName);
    atomic_store(result, (unint64_t *)&qword_1F00AE6D0);
  }
  return result;
}

uint64_t sub_1D7140098()
{
  sub_1D71465C8();
  QueryParameterName.rawValue.getter();
  sub_1D714634C();
  swift_bridgeObjectRelease();
  return sub_1D71465E0();
}

uint64_t sub_1D71400FC()
{
  QueryParameterName.rawValue.getter();
  sub_1D714634C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D714014C()
{
  sub_1D71465C8();
  QueryParameterName.rawValue.getter();
  sub_1D714634C();
  swift_bridgeObjectRelease();
  return sub_1D71465E0();
}

HealthAppServices::QueryParameterName_optional sub_1D71401AC(Swift::String *a1)
{
  return QueryParameterName.init(rawValue:)(*a1);
}

void sub_1D71401B8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  QueryParameterName.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_1D71401E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F00AE6D8;
  if (!qword_1F00AE6D8)
  {
    sub_1D7140228();
    result = MEMORY[0x1D8292E28](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F00AE6D8);
  }
  return result;
}

void sub_1D7140228()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F00AE6E0)
  {
    v0 = sub_1D714640C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F00AE6E0);
  }
}

void sub_1D714027C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E9BE17A8;
}

uint64_t getEnumTagSinglePayload for QueryParameterName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryParameterName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1D7140368 + 4 * byte_1D714767F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1D714039C + 4 * byte_1D714767A[v4]))();
}

uint64_t sub_1D714039C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D71403A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D71403ACLL);
  return result;
}

uint64_t sub_1D71403B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D71403C0);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1D71403C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D71403CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for QueryParameterName()
{
  return &type metadata for QueryParameterName;
}

uint64_t HAUserActivity.VersioningKey.rawValue.getter()
{
  return 0x4B6E6F6973726576;
}

HealthAppServices::HAUserActivity::UserActivityVersion_optional __swiftcall HAUserActivity.UserActivityVersion.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (HealthAppServices::HAUserActivity::UserActivityVersion_optional)rawValue;
}

uint64_t HAUserActivity.RestorationInfoKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D7140458 + 4 * byte_1D71477A0[*v0]))(0xD000000000000011, 0x80000001D71484B0);
}

uint64_t sub_1D7140458()
{
  return 1702125924;
}

uint64_t sub_1D7140468()
{
  return 0x7461447472617473;
}

uint64_t sub_1D7140528(uint64_t a1)
{
  return a1 + 12;
}

void static HAUserActivity.UserActivityVersion.current.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t HAUserActivity.UserActivityVersion.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t HAUserActivity.PluginUserInfoKey.rawValue.getter()
{
  return 0x614E656C646E7562;
}

uint64_t HAUserActivity.URLConversionKey.rawValue.getter()
{
  return 0x63536D6F74737563;
}

void sub_1D7140594(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1D71405D8()
{
  sub_1D714634C();
  return swift_bridgeObjectRelease();
}

unint64_t HAUserActivity.ProfilesRestorationKey.rawValue.getter()
{
  return 0xD000000000000011;
}

unint64_t static HAUserActivity.dateSavedRestorationKey.getter()
{
  return 0xD000000000000011;
}

uint64_t HAUserActivity.PluginUserInfoKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140BFC(a1);
}

uint64_t sub_1D714071C()
{
  return sub_1D7141AFC();
}

uint64_t sub_1D714074C()
{
  return sub_1D7141BC0();
}

uint64_t sub_1D7140778@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140CD0(a1);
}

uint64_t sub_1D7140784@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HAUserActivity.PluginUserInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.ProfilesRestorationKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140BFC(a1);
}

uint64_t sub_1D71407B4()
{
  sub_1D71465C8();
  sub_1D714634C();
  return sub_1D71465E0();
}

uint64_t sub_1D7140808()
{
  return sub_1D714634C();
}

uint64_t sub_1D7140824()
{
  sub_1D71465C8();
  sub_1D714634C();
  return sub_1D71465E0();
}

uint64_t sub_1D7140874@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140CD0(a1);
}

void sub_1D7140880(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001D71484D0;
}

HealthAppServices::HAUserActivity::RestorationInfoKey_optional __swiftcall HAUserActivity.RestorationInfoKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthAppServices::HAUserActivity::RestorationInfoKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1D7146574();
  result.value = swift_bridgeObjectRelease();
  v5 = 10;
  if (v3 < 0xA)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1D71408F8(char *a1)
{
  sub_1D712FD64(*a1);
}

uint64_t sub_1D7140904()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1D71465C8();
  sub_1D7140594((uint64_t)v3, v1);
  return sub_1D71465E0();
}

void sub_1D7140948(uint64_t a1)
{
  char *v1;

  sub_1D7140594(a1, *v1);
}

uint64_t sub_1D7140950()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1D71465C8();
  sub_1D7140594((uint64_t)v3, v1);
  return sub_1D71465E0();
}

HealthAppServices::HAUserActivity::RestorationInfoKey_optional sub_1D7140990(Swift::String *a1)
{
  return HAUserActivity.RestorationInfoKey.init(rawValue:)(*a1);
}

uint64_t sub_1D714099C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HAUserActivity.RestorationInfoKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.URLConversionKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140BFC(a1);
}

uint64_t sub_1D71409CC()
{
  return sub_1D7141AFC();
}

uint64_t sub_1D7140A04()
{
  return sub_1D7141BC0();
}

uint64_t sub_1D7140A38@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140CD0(a1);
}

uint64_t sub_1D7140A44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HAUserActivity.URLConversionKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_1D7140A68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1D7140A80()
{
  sub_1D71465C8();
  sub_1D71465D4();
  return sub_1D71465E0();
}

uint64_t sub_1D7140AC4()
{
  return sub_1D71465D4();
}

uint64_t sub_1D7140AEC()
{
  sub_1D71465C8();
  sub_1D71465D4();
  return sub_1D71465E0();
}

_QWORD *sub_1D7140B2C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_1D7140B4C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t HAUserActivity.VersioningKey.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140BFC(a1);
}

uint64_t sub_1D7140B64()
{
  return sub_1D7141AFC();
}

uint64_t sub_1D7140B94()
{
  return sub_1D7141BC0();
}

uint64_t sub_1D7140BC0@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140CD0(a1);
}

uint64_t sub_1D7140BCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HAUserActivity.VersioningKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HAUserActivity.ViewNavigationKeys.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140BFC(a1);
}

uint64_t sub_1D7140BFC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1D7146574();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t HAUserActivity.ViewNavigationKeys.rawValue.getter()
{
  return 0x646E6572546C6C61;
}

uint64_t sub_1D7140C68()
{
  return sub_1D7141AFC();
}

uint64_t sub_1D7140C98()
{
  return sub_1D7141BC0();
}

uint64_t sub_1D7140CC4@<X0>(BOOL *a1@<X8>)
{
  return sub_1D7140CD0(a1);
}

uint64_t sub_1D7140CD0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1D7146574();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1D7140D1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = HAUserActivity.ViewNavigationKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *static HAUserActivity.addProfileIdentifier(to:profileIdentifier:)(void *a1, uint64_t a2)
{
  return sub_1D7140EF0(a1, a2);
}

id static HAUserActivity.createActivity(bundleName:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t inited;
  uint64_t v8;
  void *v9;

  v4 = objc_allocWithZone(MEMORY[0x1E0CA5920]);
  v5 = (void *)sub_1D7146304();
  v6 = objc_msgSend(v4, sel_initWithActivityType_, v5);

  sub_1D7134458();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D71472A0;
  v8 = MEMORY[0x1E0DEA968];
  sub_1D71464D8();
  *(_QWORD *)(inited + 96) = v8;
  *(_QWORD *)(inited + 72) = a1;
  *(_QWORD *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  sub_1D71464D8();
  *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 144) = 1;
  sub_1D7130E18(inited);
  v9 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_addUserInfoEntriesFromDictionary_, v9, 0x4B6E6F6973726576, 0xEA00000000007965);

  return v6;
}

void *sub_1D7140EF0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t inited;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  id v31[17];

  v31[15] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1D71462E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)objc_opt_self();
  v31[0] = 0;
  v9 = objc_msgSend(v8, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a2, 1, v31);
  v10 = v31[0];
  if (v9)
  {
    v11 = sub_1D7146280();
    v13 = v12;

    sub_1D7134458();
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D7147290;
    v31[0] = (id)0xD000000000000011;
    v31[1] = (id)0x80000001D71484D0;
    sub_1D71464D8();
    *(_QWORD *)(inited + 96) = MEMORY[0x1E0CB0338];
    *(_QWORD *)(inited + 72) = v11;
    *(_QWORD *)(inited + 80) = v13;
    sub_1D713CF74(v11, v13);
    sub_1D7130E18(inited);
    v15 = (void *)sub_1D71462EC();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_addUserInfoEntriesFromDictionary_, v15);

    sub_1D713CFB8(v11, v13);
  }
  else
  {
    v16 = v10;
    v17 = (void *)sub_1D71461E4();

    swift_willThrow();
    if (qword_1EDBEA7D0 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDBEA7D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v18, v4);
    v19 = v17;
    v20 = v17;
    v21 = sub_1D71462C8();
    v22 = sub_1D7146430();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v29 = (void *)swift_slowAlloc();
      v31[0] = v29;
      *(_DWORD *)v23 = 136315394;
      v30 = sub_1D713B4E4(0x6341726573554148, 0xEE00797469766974, (uint64_t *)v31);
      sub_1D7146460();
      *(_WORD *)(v23 + 12) = 2080;
      v30 = (uint64_t)v17;
      v24 = v17;
      sub_1D7133C84();
      v25 = sub_1D7146334();
      v30 = sub_1D713B4E4(v25, v26, (uint64_t *)v31);
      sub_1D7146460();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D712B000, v21, v22, "%s Failed to encode profile identifier. Error: %s", (uint8_t *)v23, 0x16u);
      v27 = v29;
      swift_arrayDestroy();
      MEMORY[0x1D8292EA0](v27, -1, -1);
      MEMORY[0x1D8292EA0](v23, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return a1;
}

void _s17HealthAppServices14HAUserActivityV06createE05title15restorationType17profileIdentifier17eligibleForSearch0lM7Handoff0lM10PredictionSo06NSUserE0CSS_AA08DeepLinkeI0OSo09HKProfileK0CSgS2bSgSbtFZ_0(uint64_t a1, uint64_t a2, unsigned __int8 *a3, void *a4, char a5, char a6, char a7)
{
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t inited;
  void *v25;

  v11 = *a3;
  DeepLinkActivityType.userActivityType.getter();
  v12 = objc_allocWithZone(MEMORY[0x1E0CA5920]);
  v13 = (void *)sub_1D7146304();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithActivityType_, v13);

  v15 = v14;
  v16 = (void *)sub_1D7146304();
  objc_msgSend(v15, sel_setTitle_, v16);

  objc_msgSend(v15, sel_setEligibleForSearch_, a5 & 1);
  objc_msgSend(v15, sel_setEligibleForHandoff_, a6 & 1);
  v17 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v17)
  {
    __break(1u);
    goto LABEL_12;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_12:
    __break(1u);
    return;
  }
  v20 = objc_msgSend(v19, sel_stanley);

  if (v20)
  {
    if (a6 == 2)
      v21 = v11 != 5;
    else
      v21 = a6;
    objc_msgSend(v15, sel_setEligibleForHandoff_, v21);
  }
  objc_msgSend(v15, sel_setEligibleForPrediction_, a7 & 1);
  v22 = v15;
  if (a4)
  {
    v23 = a4;
    v22 = sub_1D7140EF0(v15, (uint64_t)v23);

  }
  sub_1D7134458();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D7147290;
  sub_1D71464D8();
  *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 72) = 1;
  sub_1D7130E18(inited);
  v25 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_addUserInfoEntriesFromDictionary_, v25);

}

unint64_t sub_1D7141584()
{
  unint64_t result;

  result = qword_1F00AE6E8;
  if (!qword_1F00AE6E8)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.PluginUserInfoKey, &type metadata for HAUserActivity.PluginUserInfoKey);
    atomic_store(result, (unint64_t *)&qword_1F00AE6E8);
  }
  return result;
}

unint64_t sub_1D71415CC()
{
  unint64_t result;

  result = qword_1F00AE6F0;
  if (!qword_1F00AE6F0)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.ProfilesRestorationKey, &type metadata for HAUserActivity.ProfilesRestorationKey);
    atomic_store(result, (unint64_t *)&qword_1F00AE6F0);
  }
  return result;
}

unint64_t sub_1D7141614()
{
  unint64_t result;

  result = qword_1EDBEA568;
  if (!qword_1EDBEA568)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.RestorationInfoKey, &type metadata for HAUserActivity.RestorationInfoKey);
    atomic_store(result, (unint64_t *)&qword_1EDBEA568);
  }
  return result;
}

unint64_t sub_1D714165C()
{
  unint64_t result;

  result = qword_1F00AE6F8;
  if (!qword_1F00AE6F8)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.URLConversionKey, &type metadata for HAUserActivity.URLConversionKey);
    atomic_store(result, (unint64_t *)&qword_1F00AE6F8);
  }
  return result;
}

unint64_t sub_1D71416A4()
{
  unint64_t result;

  result = qword_1F00AE700;
  if (!qword_1F00AE700)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.UserActivityVersion, &type metadata for HAUserActivity.UserActivityVersion);
    atomic_store(result, (unint64_t *)&qword_1F00AE700);
  }
  return result;
}

unint64_t sub_1D71416EC()
{
  unint64_t result;

  result = qword_1F00AE708;
  if (!qword_1F00AE708)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.VersioningKey, &type metadata for HAUserActivity.VersioningKey);
    atomic_store(result, (unint64_t *)&qword_1F00AE708);
  }
  return result;
}

unint64_t sub_1D7141734()
{
  unint64_t result;

  result = qword_1F00AE710;
  if (!qword_1F00AE710)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for HAUserActivity.ViewNavigationKeys, &type metadata for HAUserActivity.ViewNavigationKeys);
    atomic_store(result, (unint64_t *)&qword_1F00AE710);
  }
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity()
{
  return &type metadata for HAUserActivity;
}

uint64_t sub_1D7141794()
{
  return 0;
}

ValueMetadata *type metadata accessor for HAUserActivity.PluginUserInfoKey()
{
  return &type metadata for HAUserActivity.PluginUserInfoKey;
}

ValueMetadata *type metadata accessor for HAUserActivity.ProfilesRestorationKey()
{
  return &type metadata for HAUserActivity.ProfilesRestorationKey;
}

uint64_t storeEnumTagSinglePayload for HAUserActivity.RestorationInfoKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1D7141808 + 4 * byte_1D71477B9[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1D714183C + 4 * byte_1D71477B4[v4]))();
}

uint64_t sub_1D714183C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D7141844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D714184CLL);
  return result;
}

uint64_t sub_1D7141858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D7141860);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1D7141864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D714186C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.RestorationInfoKey()
{
  return &type metadata for HAUserActivity.RestorationInfoKey;
}

ValueMetadata *type metadata accessor for HAUserActivity.URLConversionKey()
{
  return &type metadata for HAUserActivity.URLConversionKey;
}

uint64_t getEnumTagSinglePayload for HAUserActivity.UserActivityVersion(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HAUserActivity.UserActivityVersion(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D7141974 + 4 * byte_1D71477C3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D71419A8 + 4 * byte_1D71477BE[v4]))();
}

uint64_t sub_1D71419A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D71419B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D71419B8);
  return result;
}

uint64_t sub_1D71419C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D71419CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D71419D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D71419D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1D71419E4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.UserActivityVersion()
{
  return &type metadata for HAUserActivity.UserActivityVersion;
}

ValueMetadata *type metadata accessor for HAUserActivity.VersioningKey()
{
  return &type metadata for HAUserActivity.VersioningKey;
}

uint64_t _s17HealthAppServices14HAUserActivityV17PluginUserInfoKeyOwet_0(unsigned int *a1, int a2)
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

uint64_t _s17HealthAppServices14HAUserActivityV17PluginUserInfoKeyOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D7141AA0 + 4 * byte_1D71477C8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D7141AC0 + 4 * byte_1D71477CD[v4]))();
}

_BYTE *sub_1D7141AA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D7141AC0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D7141AC8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D7141AD0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D7141AD8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D7141AE0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HAUserActivity.ViewNavigationKeys()
{
  return &type metadata for HAUserActivity.ViewNavigationKeys;
}

uint64_t sub_1D7141AFC()
{
  sub_1D71465C8();
  sub_1D714634C();
  return sub_1D71465E0();
}

uint64_t sub_1D7141B48()
{
  return sub_1D714634C();
}

uint64_t sub_1D7141B64()
{
  return sub_1D714634C();
}

uint64_t sub_1D7141B80()
{
  return sub_1D714634C();
}

uint64_t sub_1D7141BA4()
{
  return sub_1D714634C();
}

uint64_t sub_1D7141BC0()
{
  sub_1D71465C8();
  sub_1D714634C();
  return sub_1D71465E0();
}

void sub_1D7141C10()
{
  strcpy((char *)&qword_1F00AF740, "HealthRecords");
  *(_WORD *)&algn_1F00AF748[6] = -4864;
}

HealthAppServices::PluginURLType __swiftcall PluginURLType.init(stringLiteral:)(HealthAppServices::PluginURLType stringLiteral)
{
  HealthAppServices::PluginURLType *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

void sub_1D7141C48()
{
  qword_1F00AF750 = 0x7472616548;
  *(_QWORD *)algn_1F00AF758 = 0xE500000000000000;
}

void sub_1D7141C68()
{
  qword_1F00AF760 = 0x73656C69666F7250;
  *(_QWORD *)algn_1F00AF768 = 0xE800000000000000;
}

void sub_1D7141C8C()
{
  qword_1F00AF770 = 0x797465666153;
  *(_QWORD *)algn_1F00AF778 = 0xE600000000000000;
}

HealthAppServices::PluginURLType __swiftcall PluginURLType.init(rawValue:)(HealthAppServices::PluginURLType rawValue)
{
  HealthAppServices::PluginURLType *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t PluginURLType.bundleName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D7141CE0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1D71465A4();
}

BOOL static AppURLRouting.useCurrentContext(url:)()
{
  uint64_t v0;

  sub_1D7146214();
  sub_1D7130F40();
  v0 = sub_1D7146484();
  swift_bridgeObjectRelease();
  return v0 == 0;
}

id static AppURLRouting.determineURLType(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id result;
  void *v40;
  unsigned int v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Swift::Bool v46;
  void *v47;
  unsigned int v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  char v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  char v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  char v64;
  char *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  void (*v89)(char *, unint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  __int128 v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  void *v140;
  unsigned int v141;
  uint64_t *v142;
  uint64_t v143;
  NSObject *v144;
  os_log_type_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  void (*v154)(char *, uint64_t);
  id v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  char *v168;
  ValueMetadata *v169;
  uint64_t v170;

  v4 = sub_1D714613C();
  v5 = *(_QWORD *)(v4 - 8);
  v164 = v4;
  v165 = v5;
  MEMORY[0x1E0C80A78](v4);
  v166 = (char *)&v153 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7143798(0, &qword_1F00AE600, v7);
  MEMORY[0x1E0C80A78](v8);
  v158 = (char *)&v153 - v9;
  sub_1D7143798(0, &qword_1F00AE5F8, (void (*)(uint64_t))MEMORY[0x1E0CAE890]);
  MEMORY[0x1E0C80A78](v10);
  v160 = (char *)&v153 - v11;
  v12 = sub_1D7146184();
  v161 = *(_QWORD *)(v12 - 8);
  v162 = v12;
  MEMORY[0x1E0C80A78](v12);
  v159 = (char *)&v153 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1D7146274();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v156 = (char *)&v153 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v153 - v18;
  v20 = type metadata accessor for HAURLValidator();
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v153 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v153 - v24;
  v26 = type metadata accessor for HAURL();
  v27 = MEMORY[0x1E0C80A78](v26);
  v157 = (char *)&v153 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v153 - v30;
  v32 = MEMORY[0x1E0C80A78](v29);
  v34 = (char *)&v153 - v33;
  MEMORY[0x1E0C80A78](v32);
  v35 = *(void (**)(void))(v15 + 16);
  v167 = (uint64_t)&v153 - v36;
  v35();
  ((void (*)(char *, uint64_t, uint64_t))v35)(v25, a1, v14);
  v168 = v25;
  if (!HAURLValidator.isCHRURL()())
  {
    v163 = (uint64_t *)a2;
    v40 = (void *)sub_1D7146220();
    v41 = objc_msgSend(v40, sel_hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL);

    if (v41)
    {
      if (qword_1F00AE400 != -1)
        swift_once();
      v42 = &qword_1F00AF740;
LABEL_9:
      v44 = *v42;
      v43 = v42[1];
      swift_bridgeObjectRetain();
      v45 = (uint64_t)v168;
LABEL_17:
      sub_1D713BBC4(v45, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
      result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      v52 = v163;
      *v163 = v44;
      v52[1] = v43;
LABEL_18:
      v53 = 1;
      goto LABEL_19;
    }
    v46 = HAURLValidator.isSmartHealthCardFile()();
    ((void (*)(char *, uint64_t, uint64_t))v35)(v19, a1, v14);
    if (v46)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
LABEL_13:
      v50 = (uint64_t)v168;
      if (qword_1F00AE400 != -1)
        swift_once();
      v51 = &qword_1F00AF740;
LABEL_16:
      v44 = *v51;
      v43 = v51[1];
      swift_bridgeObjectRetain();
      v45 = v50;
      goto LABEL_17;
    }
    v47 = (void *)sub_1D7146220();
    v48 = objc_msgSend(v47, sel_hk_isRewrittenHealthCardQRCodeURL);

    v49 = *(void (**)(char *, uint64_t))(v15 + 8);
    v49(v19, v14);
    if (v48)
      goto LABEL_13;
    v154 = v49;
    v54 = (void *)objc_opt_self();
    v155 = objc_msgSend(v54, sel_electrocardiogramType);
    v50 = (uint64_t)v168;
    ((void (*)(char *, char *, uint64_t))v35)(v34, v168, v14);
    v55 = HAURL.objectType.getter();
    if (v55)
    {
      v56 = v55;
      sub_1D714389C();
      v57 = v54;
      v58 = v155;
      v59 = sub_1D7146448();
      sub_1D713BBC4((uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

      v54 = v57;
      v50 = (uint64_t)v168;

      sub_1D71437E4(v50, (uint64_t)v23);
      if ((v59 & 1) != 0)
      {
        sub_1D713BBC4((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
LABEL_27:
        if (qword_1F00AE408 != -1)
          swift_once();
        v51 = &qword_1F00AF750;
        goto LABEL_16;
      }
    }
    else
    {
      sub_1D713BBC4((uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

      sub_1D71437E4(v50, (uint64_t)v23);
    }
    v60 = objc_msgSend(v54, sel_atrialFibrillationEventType);
    ((void (*)(char *, char *, uint64_t))v35)(v31, v23, v14);
    v61 = HAURL.objectType.getter();
    if (v61)
    {
      v62 = v61;
      if (v60)
      {
        sub_1D714389C();
        v63 = v60;
        v64 = sub_1D7146448();
        sub_1D713BBC4((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

        sub_1D713BBC4((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
        v65 = v166;
        if ((v64 & 1) != 0)
          goto LABEL_27;
LABEL_33:
        v66 = (void *)objc_opt_self();
        v67 = objc_msgSend(v66, sel_healthAppSummaryHostName);
        v68 = sub_1D714631C();
        v70 = v69;

        LOBYTE(v67) = sub_1D7145ED0(v50, v68, v70);
        swift_bridgeObjectRelease();
        if ((v67 & 1) != 0)
        {
          sub_1D713BBC4(v50, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v52 = v163;
          *v163 = 0;
          v52[1] = 0;
          v53 = 4;
          goto LABEL_19;
        }
        v71 = objc_msgSend(v66, sel_healthAppBrowseHostName);
        v72 = sub_1D714631C();
        v74 = v73;

        LOBYTE(v71) = sub_1D7145ED0(v50, v72, v74);
        swift_bridgeObjectRelease();
        if ((v71 & 1) != 0)
        {
          v75 = (uint64_t)v160;
          sub_1D7146154();
          v77 = v161;
          v76 = v162;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v161 + 48))(v75, 1, v162) == 1)
          {
            sub_1D713BBC4(v50, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
            sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
            result = (id)sub_1D7143860(v75, &qword_1F00AE5F8, (void (*)(uint64_t))MEMORY[0x1E0CAE890]);
            v78 = v163;
          }
          else
          {
            v84 = v159;
            (*(void (**)(char *, uint64_t, uint64_t))(v77 + 32))(v159, v75, v76);
            v85 = sub_1D7146148();
            v78 = v163;
            if (v85)
            {
              v86 = *(_QWORD *)(v85 + 16);
              if (v86)
              {
                v87 = v85
                    + ((*(unsigned __int8 *)(v165 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v165 + 80));
                v88 = *(_QWORD *)(v165 + 72);
                v89 = *(void (**)(char *, unint64_t, uint64_t))(v165 + 16);
                swift_bridgeObjectRetain();
                v90 = v164;
                while (1)
                {
                  v89(v65, v87, v90);
                  if (sub_1D7146124() == 0x7972657571 && v91 == 0xE500000000000000)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_58;
                  }
                  v92 = sub_1D71465A4();
                  swift_bridgeObjectRelease();
                  if ((v92 & 1) != 0)
                    break;
                  v90 = v164;
                  (*(void (**)(char *, uint64_t))(v165 + 8))(v65, v164);
                  v87 += v88;
                  --v86;
                  v78 = v163;
                  if (!v86)
                  {
                    swift_bridgeObjectRelease();
                    v93 = 1;
                    v50 = (uint64_t)v168;
                    v94 = v165;
                    v95 = (uint64_t)v158;
                    goto LABEL_59;
                  }
                }
                v78 = v163;
LABEL_58:
                swift_bridgeObjectRelease();
                v90 = v164;
                v94 = v165;
                v95 = (uint64_t)v158;
                (*(void (**)(char *, char *, uint64_t))(v165 + 32))(v158, v65, v164);
                v93 = 0;
                v50 = (uint64_t)v168;
LABEL_59:
                v77 = v161;
                v76 = v162;
              }
              else
              {
                v93 = 1;
                v90 = v164;
                v94 = v165;
                v95 = (uint64_t)v158;
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v94 + 56))(v95, v93, 1, v90);
              swift_bridgeObjectRelease();
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v95, 1, v90) == 1)
              {
                (*(void (**)(char *, uint64_t))(v77 + 8))(v159, v76);
                sub_1D713BBC4(v50, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                result = (id)sub_1D7143860(v95, &qword_1F00AE600, (void (*)(uint64_t))MEMORY[0x1E0CAE690]);
              }
              else
              {
                v102 = v90;
                v103 = sub_1D7146130();
                v105 = v104;
                (*(void (**)(char *, uint64_t))(v77 + 8))(v159, v76);
                sub_1D713BBC4(v50, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v94 + 8))(v95, v102);
                if (v105)
                {
                  *v78 = v103;
                  v78[1] = v105;
                  *((_BYTE *)v78 + 16) = 0;
                  return result;
                }
              }
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v77 + 8))(v84, v76);
              sub_1D713BBC4(v50, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
              result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
            }
          }
          v97 = xmmword_1D7147DF0;
          goto LABEL_65;
        }
        v79 = objc_msgSend(v66, sel_healthAppSharingInviteFlowPath);
        v80 = v50;
        v81 = sub_1D714631C();
        v83 = v82;

        if ((sub_1D7143BF4(v80, v81, v83) & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v78 = v163;
LABEL_49:
          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147DE0;
LABEL_65:
          *(_OWORD *)v78 = v97;
          *((_BYTE *)v78 + 16) = 4;
          return result;
        }
        v96 = sub_1D7145ED0(v80, v81, v83);
        swift_bridgeObjectRelease();
        v78 = v163;
        if (v96)
          goto LABEL_49;
        if (HAURLValidator.isSharingProfileURL()())
        {
          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147DD0;
          goto LABEL_65;
        }
        v98 = objc_msgSend(v66, sel_healthTrendsHostName);
        v99 = sub_1D714631C();
        v101 = v100;

        LOBYTE(v98) = sub_1D7145ED0(v80, v99, v101);
        swift_bridgeObjectRelease();
        if ((v98 & 1) != 0)
        {
          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147DC0;
          goto LABEL_65;
        }
        if ((sub_1D71449D0() & 1) != 0)
        {
          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147DB0;
          goto LABEL_65;
        }
        v106 = (uint64_t)v157;
        ((void (*)(char *, uint64_t, uint64_t))v35)(v157, v80, v14);
        v107 = HAURL.objectType.getter();
        sub_1D713BBC4(v106, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
        if (v107)
        {

          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147D50;
          goto LABEL_65;
        }
        v108 = objc_msgSend(v66, sel_categoryTypeHostName);
        v109 = sub_1D714631C();
        v111 = v110;

        LOBYTE(v108) = sub_1D7145ED0(v80, v109, v111);
        swift_bridgeObjectRelease();
        if ((v108 & 1) != 0)
        {
          sub_1D713BBC4(v80, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v97 = xmmword_1D7147DA0;
          goto LABEL_65;
        }
        if (HAURLValidator.isEmergencyOnboardingURL()())
        {
LABEL_73:
          if (qword_1F00AE418 != -1)
            swift_once();
          v42 = &qword_1F00AF770;
          goto LABEL_9;
        }
        if (HAURLValidator.isMedicalIDURL()())
        {
          sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v112 = xmmword_1D7147D90;
        }
        else
        {
          v113 = objc_msgSend(v66, sel_healthProfileResourceSpecifier);
          v114 = sub_1D714631C();
          v116 = v115;

          LOBYTE(v113) = sub_1D7145ED0((uint64_t)v168, v114, v116);
          swift_bridgeObjectRelease();
          if ((v113 & 1) == 0)
          {
            if (HAURLValidator.isHealthChecklistURL()())
              goto LABEL_73;
            if ((sub_1D7145518() & 1) != 0)
            {
              if (qword_1F00AE410 != -1)
                swift_once();
              v42 = &qword_1F00AF760;
              goto LABEL_9;
            }
            if (HAURLValidator.isResearchStudiesURL()())
            {
              v117 = sub_1D7146208();
              v118 = *(_QWORD *)(v117 + 16);
              if (v118)
              {
                v119 = v117 + 16 * v118;
                v121 = *(_QWORD *)(v119 + 16);
                v120 = *(_QWORD *)(v119 + 24);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v52 = v163;
                *v163 = v121;
                v52[1] = v120;
              }
              else
              {
                swift_bridgeObjectRelease();
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v52 = v163;
                *v163 = 0;
                v52[1] = 0;
              }
              v53 = 2;
              goto LABEL_19;
            }
            if ((sub_1D71457FC() & 1) != 0)
            {
              v122 = sub_1D7146208();
              v123 = *(_QWORD *)(v122 + 16);
              if (v123)
              {
                v124 = v122 + 16 * v123;
                v126 = *(_QWORD *)(v124 + 16);
                v125 = *(_QWORD *)(v124 + 24);
                swift_bridgeObjectRetain();
              }
              else
              {
                v126 = 0;
                v125 = 0;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v135 = objc_msgSend(v66, sel_authorizationManagementHostName);
              v136 = sub_1D714631C();
              v138 = v137;

              if (v125)
              {
                if (v126 == v136 && v125 == v138)
                {
                  swift_bridgeObjectRelease();
                  sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                  sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                  swift_bridgeObjectRelease();
                }
                else
                {
                  v139 = sub_1D71465A4();
                  swift_bridgeObjectRelease();
                  sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                  sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                  result = (id)swift_bridgeObjectRelease();
                  if ((v139 & 1) == 0)
                  {
                    v52 = v163;
                    *v163 = v126;
                    v52[1] = v125;
                    v53 = 3;
                    goto LABEL_19;
                  }
                }
                result = (id)swift_bridgeObjectRelease();
                v52 = v163;
                *v163 = 0;
                v52[1] = 0;
                v53 = 3;
              }
              else
              {
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                result = (id)swift_bridgeObjectRelease();
                v52 = v163;
                *v163 = v126;
                v52[1] = 0;
                v53 = 3;
              }
            }
            else
            {
              v127 = objc_msgSend(v66, sel_sharingOverviewHostName);
              v128 = sub_1D714631C();
              v130 = v129;

              LOBYTE(v127) = sub_1D7145ED0((uint64_t)v168, v128, v130);
              swift_bridgeObjectRelease();
              if ((v127 & 1) != 0)
              {
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v112 = xmmword_1D7147D70;
                goto LABEL_80;
              }
              v131 = HAURL.pluginBundleName.getter();
              if (v132)
              {
                v133 = v131;
                v134 = v132;
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v52 = v163;
                *v163 = v133;
                v52[1] = v134;
                goto LABEL_18;
              }
              result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
              if (!result)
              {
                __break(1u);
                return result;
              }
              v140 = result;
              v141 = objc_msgSend(result, sel_isAppleInternalInstall);

              if (v141 && sub_1D7145ED0((uint64_t)v168, 0xD000000000000010, 0x80000001D7149140))
              {
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v112 = xmmword_1D7147D60;
                goto LABEL_80;
              }
              if ((sub_1D7145BFC() & 1) != 0)
              {
                sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
                result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
                v142 = v163;
                *v163 = 0xD000000000000015;
                v142[1] = 0x80000001D7149120;
                *((_BYTE *)v142 + 16) = 1;
                return result;
              }
              if (qword_1EDBEA7D0 != -1)
                swift_once();
              v143 = sub_1D71462E0();
              __swift_project_value_buffer(v143, (uint64_t)qword_1EDBEA7D8);
              ((void (*)(char *, uint64_t, uint64_t))v35)(v156, a1, v14);
              v144 = sub_1D71462C8();
              v145 = sub_1D7146430();
              if (os_log_type_enabled(v144, v145))
              {
                v146 = swift_slowAlloc();
                v147 = swift_slowAlloc();
                *(_DWORD *)v146 = 136446466;
                v169 = &type metadata for AppURLRouting;
                v170 = v147;
                sub_1D7143828();
                v148 = sub_1D7146334();
                v169 = (ValueMetadata *)sub_1D713B4E4(v148, v149, &v170);
                sub_1D7146460();
                swift_bridgeObjectRelease();
                *(_WORD *)(v146 + 12) = 2082;
                v150 = v156;
                v151 = sub_1D71461FC();
                v169 = (ValueMetadata *)sub_1D713B4E4(v151, v152, &v170);
                sub_1D7146460();
                swift_bridgeObjectRelease();
                v154(v150, v14);
                _os_log_impl(&dword_1D712B000, v144, v145, "[%{public}s]: could not determine URL type for: %{public}s\n", (uint8_t *)v146, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x1D8292EA0](v147, -1, -1);
                MEMORY[0x1D8292EA0](v146, -1, -1);

              }
              else
              {

                v154(v156, v14);
              }
              sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
              result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
              v52 = v163;
              *v163 = 0;
              v52[1] = 0;
              v53 = -1;
            }
LABEL_19:
            *((_BYTE *)v52 + 16) = v53;
            return result;
          }
          sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
          result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
          v112 = xmmword_1D7147D80;
        }
LABEL_80:
        v52 = v163;
        *(_OWORD *)v163 = v112;
        v53 = 4;
        goto LABEL_19;
      }
      sub_1D713BBC4((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
      v60 = v62;
    }
    else
    {
      sub_1D713BBC4((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
    }

    sub_1D713BBC4((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    v65 = v166;
    goto LABEL_33;
  }
  if (qword_1F00AE400 != -1)
    swift_once();
  v38 = qword_1F00AF740;
  v37 = *(_QWORD *)algn_1F00AF748;
  swift_bridgeObjectRetain();
  sub_1D713BBC4((uint64_t)v168, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  result = (id)sub_1D713BBC4(v167, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
  *(_QWORD *)a2 = v38;
  *(_QWORD *)(a2 + 8) = v37;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

void _s17HealthAppServices7URLTypeO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1D7143184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  int v5;
  char v7;

  if (v5)
  {
    sub_1D7143990(v1, v3, v5);
    sub_1D7143990(v0, v2, v4);
    sub_1D71439B8(v0, v2, v4);
    sub_1D71439B8(v1, v3, v5);
    v7 = 0;
  }
  else
  {
    if (v0 == v1 && v2 == v3)
      v7 = 1;
    else
      v7 = sub_1D71465A4();
    sub_1D7143990(v1, v3, 0);
    sub_1D7143990(v0, v2, 0);
    sub_1D71439B8(v0, v2, 0);
    sub_1D71439B8(v1, v3, 0);
  }
  return v7 & 1;
}

void sub_1D7143798(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1D7146454();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1D71437E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HAURLValidator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1D7143828()
{
  unint64_t result;

  result = qword_1F00AE718;
  if (!qword_1F00AE718)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE718);
  }
  return result;
}

uint64_t sub_1D7143860(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1D7143798(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1D714389C()
{
  unint64_t result;

  result = qword_1F00AE720;
  if (!qword_1F00AE720)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F00AE720);
  }
  return result;
}

unint64_t sub_1D71438DC()
{
  unint64_t result;

  result = qword_1F00AE728;
  if (!qword_1F00AE728)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for PluginURLType, &type metadata for PluginURLType);
    atomic_store(result, (unint64_t *)&qword_1F00AE728);
  }
  return result;
}

uint64_t sub_1D7143920()
{
  return MEMORY[0x1E0DEA9F0];
}

unint64_t sub_1D7143930()
{
  unint64_t result;

  result = qword_1F00AE730;
  if (!qword_1F00AE730)
  {
    result = MEMORY[0x1D8292E28](&protocol conformance descriptor for PluginURLType, &type metadata for PluginURLType);
    atomic_store(result, (unint64_t *)&qword_1F00AE730);
  }
  return result;
}

uint64_t sub_1D7143974()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t sub_1D7143980()
{
  return MEMORY[0x1E0DEA9F8];
}

uint64_t sub_1D7143990(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for URLType(uint64_t a1)
{
  return sub_1D71439B8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1D71439B8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s17HealthAppServices7URLTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D7143990(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for URLType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1D7143990(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1D71439B8(v6, v7, v8);
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

uint64_t assignWithTake for URLType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1D71439B8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for URLType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D7143B50(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1D7143B68(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for URLType()
{
  return &type metadata for URLType;
}

ValueMetadata *type metadata accessor for PluginURLType()
{
  return &type metadata for PluginURLType;
}

ValueMetadata *type metadata accessor for AppURLRouting()
{
  return &type metadata for AppURLRouting;
}

uint64_t HAURLValidator.init(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t sub_1D7143BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = sub_1D7146274();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v31 - v11;
  v13 = sub_1D714625C();
  if (!v14)
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v20(v12, a1, v6);
    v21 = 0;
    goto LABEL_8;
  }
  v33 = a2;
  v34 = a3;
  v37 = v13;
  v38 = v14;
  v15 = objc_msgSend((id)objc_opt_self(), sel_externalHealthAppURLScheme);
  v16 = sub_1D714631C();
  v18 = v17;

  v35 = v16;
  v36 = v18;
  sub_1D7130F40();
  v19 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v20(v12, a1, v6);
  if (!v19)
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_externalHealthAppURLHost);
    v32 = sub_1D714631C();
    v24 = v23;

    v25 = sub_1D7146244();
    if (v26)
    {
      v37 = v25;
      v38 = v26;
      v35 = v32;
      v36 = v24;
      v27 = sub_1D7146484();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v27 == 0;
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  v21 = 0;
LABEL_7:
  a2 = v33;
  a3 = v34;
LABEL_8:
  v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v28(v12, v6);
  v20(v10, a1, v6);
  if (v21)
  {
    v37 = sub_1D7146250();
    v38 = v29;
    v35 = a2;
    v36 = a3;
    sub_1D7130F40();
    LOBYTE(v21) = sub_1D714649C();
    swift_bridgeObjectRelease();
  }
  v28(v10, v6);
  return v21 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isCHRURL()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;

  v1 = v0;
  v2 = type metadata accessor for HAURLValidator();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v3);
  v8 = (char *)v35 - v7;
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)v35 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v35 - v12;
  v14 = sub_1D714625C();
  if (!v15)
  {
    sub_1D71437E4(v0, (uint64_t)v13);
LABEL_7:
    sub_1D713BBC4((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    goto LABEL_8;
  }
  v36 = v14;
  v37 = v15;
  strcpy((char *)v35, "x-argonaut-app");
  HIBYTE(v35[1]) = -18;
  sub_1D7130F40();
  v16 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v13);
  if (v16)
    goto LABEL_7;
  v17 = sub_1D7146244();
  if (!v18)
    goto LABEL_7;
  v36 = v17;
  v37 = v18;
  v35[0] = 0xD000000000000013;
  v35[1] = 0x80000001D7149160;
  v19 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  if (!v19)
    return 1;
LABEL_8:
  v20 = sub_1D714625C();
  if (!v21)
  {
    sub_1D71437E4(v1, (uint64_t)v11);
LABEL_15:
    sub_1D713BBC4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    sub_1D71437E4(v1, (uint64_t)v8);
    goto LABEL_16;
  }
  v36 = v20;
  v37 = v21;
  v35[0] = 0x7370747468;
  v35[1] = 0xE500000000000000;
  sub_1D7130F40();
  v22 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v11);
  if (v22)
    goto LABEL_15;
  v23 = sub_1D7146244();
  if (!v24)
    goto LABEL_15;
  v36 = v23;
  v37 = v24;
  v35[0] = 0xD000000000000019;
  v35[1] = 0x80000001D7149180;
  v25 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  sub_1D71437E4(v1, (uint64_t)v8);
  if (v25)
  {
LABEL_16:
    sub_1D713BBC4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    goto LABEL_17;
  }
  v36 = sub_1D7146250();
  v37 = v26;
  v35[0] = 0xD000000000000013;
  v35[1] = 0x80000001D7149160;
  v27 = sub_1D714649C();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  if ((v27 & 1) != 0)
    return 1;
LABEL_17:
  if (sub_1D7145ED0(v1, 0xD000000000000010, 0x80000001D71491A0)
    || sub_1D7145ED0(v1, 0xD000000000000011, 0x80000001D71491C0)
    || sub_1D7145ED0(v1, 0xD00000000000001DLL, 0x80000001D71491E0))
  {
    return 1;
  }
  v29 = sub_1D714625C();
  if (!v30)
  {
    sub_1D71437E4(v1, (uint64_t)v5);
LABEL_27:
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    return 0;
  }
  v36 = v29;
  v37 = v30;
  v35[0] = 0x7370747468;
  v35[1] = 0xE500000000000000;
  sub_1D7130F40();
  v31 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v5);
  if (v31)
    goto LABEL_27;
  v32 = sub_1D7146244();
  if (!v33)
    goto LABEL_27;
  v36 = v32;
  v37 = v33;
  v35[0] = 0xD000000000000023;
  v35[1] = 0x80000001D7149200;
  v34 = sub_1D7146484();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  return !v34;
}

uint64_t type metadata accessor for HAURLValidator()
{
  uint64_t result;

  result = qword_1EDBEA778;
  if (!qword_1EDBEA778)
    return swift_getSingletonMetadata();
  return result;
}

Swift::Bool __swiftcall HAURLValidator.isSmartHealthCardFile()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D71461F0();
  sub_1D71437E4(v0, (uint64_t)v3);
  if ((v4 & 1) != 0)
  {
    sub_1D7146214();
    v5 = sub_1D71463C4();
    swift_bridgeObjectRelease();
    sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    if ((v5 & 1) != 0)
    {
      if (qword_1EDBEA7D0 != -1)
        swift_once();
      v6 = sub_1D71462E0();
      __swift_project_value_buffer(v6, (uint64_t)qword_1EDBEA7D8);
      v7 = sub_1D71462C8();
      v8 = sub_1D714643C();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D712B000, v7, v8, "[URL+ValidateURLs]: looks like this is a SMART Health Card", v9, 2u);
        MEMORY[0x1D8292EA0](v9, -1, -1);
      }

      return 1;
    }
  }
  else
  {
    sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  }
  if (qword_1EDBEA7D0 != -1)
    swift_once();
  v11 = sub_1D71462E0();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EDBEA7D8);
  v12 = sub_1D71462C8();
  v13 = sub_1D7146424();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v17 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = sub_1D713B4E4(0xD000000000000012, 0x80000001D7149230, &v17);
    sub_1D7146460();
    _os_log_impl(&dword_1D712B000, v12, v13, "[URL+ValidateURLs]: not a file URL and/or doesn't end with %s: not a SMART Health Card", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8292EA0](v15, -1, -1);
    MEMORY[0x1D8292EA0](v14, -1, -1);
  }

  return 0;
}

Swift::Bool __swiftcall HAURLValidator.hasObjectType(_:)(HKObjectType_optional a1)
{
  uint64_t v1;
  Class isa;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  objc_class *v9;
  char v10;
  uint64_t v12;

  isa = a1.value.super.isa;
  v3 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, v1, v6);
  v7 = HAURL.objectType.getter();
  if (!v7)
  {
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
LABEL_6:
    v10 = 0;
    return v10 & 1;
  }
  v8 = v7;
  if (!isa)
  {
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

    goto LABEL_6;
  }
  sub_1D714389C();
  v9 = isa;
  v10 = sub_1D7146448();
  sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);

  return v10 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isSummaryURL()()
{
  return sub_1D7145AF4((SEL *)&selRef_healthAppSummaryHostName);
}

Swift::Bool __swiftcall HAURLValidator.isBrowseURL()()
{
  return sub_1D7145AF4((SEL *)&selRef_healthAppBrowseHostName);
}

Swift::Bool __swiftcall HAURLValidator.isSharingInviteFlowURL()()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_healthAppSharingInviteFlowPath);
  v2 = sub_1D714631C();
  v4 = v3;

  v5 = (sub_1D7143BF4(v0, v2, v4) & 1) != 0 || sub_1D7145ED0(v0, v2, v4);
  swift_bridgeObjectRelease();
  return v5;
}

Swift::Bool __swiftcall HAURLValidator.isSharingProfileURL()()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char v15;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_healthAppSharingProfilePath);
  v3 = sub_1D714631C();
  v5 = v4;

  if ((sub_1D7143BF4(v0, v3, v5) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  v7 = (void *)sub_1D7146220();
  v8 = objc_msgSend(v7, sel_resourceSpecifier);

  if (v8)
  {
    sub_1D714631C();
    v10 = v9;

    sub_1D714625C();
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v10 = 0;
    sub_1D714625C();
    if (!v12)
    {
LABEL_8:
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  v13 = objc_msgSend(v1, sel_internalHealthAppURLScheme);
  sub_1D714631C();

  sub_1D7130F40();
  v14 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
    goto LABEL_8;
  if (!v10)
    goto LABEL_9;
  sub_1D7146364();
  swift_bridgeObjectRelease();
  v15 = sub_1D71463B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v15 & 1) != 0;
}

Swift::Bool __swiftcall HAURLValidator.isAllTrendsURL()()
{
  return sub_1D7145AF4((SEL *)&selRef_healthTrendsHostName);
}

uint64_t sub_1D71449D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v0 = sub_1D714625C();
  if (!v1)
    return 0;
  v21 = v0;
  v22 = v1;
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_internalHealthAppURLScheme);
  v4 = sub_1D714631C();
  v6 = v5;

  v19 = v4;
  v20 = v6;
  sub_1D7130F40();
  v7 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
    return 0;
  v8 = (_QWORD *)sub_1D7146208();
  v9 = v8;
  if (v8[2] == 2)
  {
    v11 = v8[4];
    v10 = v8[5];
    swift_bridgeObjectRetain();
    if (v10)
    {
      if (v11 == 47 && v10 == 0xE100000000000000)
      {
        result = swift_bridgeObjectRelease();
LABEL_9:
        if (v9[2] < 2uLL)
        {
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v14 = objc_msgSend(v2, sel_healthAppNotificationSettingsPath, v19, v20, v21, v22);
        sub_1D714631C();

        v15 = objc_msgSend(v2, sel_healthProfileResourceSpecifier);
        sub_1D714631C();

        sub_1D7146244();
        if (v16)
        {
          v17 = sub_1D7146484();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v17)
          {
            v18 = sub_1D7146484();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v18 == 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      v13 = sub_1D71465A4();
      result = swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return 0;
}

Swift::Bool __swiftcall HAURLValidator.hasObjectType()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v7;

  v1 = type metadata accessor for HAURL();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D7146274();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3, v0, v4);
  v5 = HAURL.objectType.getter();
  sub_1D713BBC4((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for HAURL);
  if (v5)

  return v5 != 0;
}

Swift::Bool __swiftcall HAURLValidator.isCategoryURL()()
{
  return sub_1D7145AF4((SEL *)&selRef_categoryTypeHostName);
}

Swift::Bool __swiftcall HAURLValidator.isEmergencyOnboardingURL()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Bool result;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v0 = sub_1D714625C();
  if (!v1)
    return 0;
  v20 = v0;
  v21 = v1;
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_internalHealthAppURLScheme);
  v4 = sub_1D714631C();
  v6 = v5;

  v18 = v4;
  v19 = v6;
  sub_1D7130F40();
  v7 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
    return 0;
  v8 = (_QWORD *)sub_1D7146208();
  v9 = v8;
  if (v8[2] == 2)
  {
    v11 = v8[4];
    v10 = v8[5];
    swift_bridgeObjectRetain();
    if (v10)
    {
      if (v11 == 47 && v10 == 0xE100000000000000)
      {
        result = swift_bridgeObjectRelease();
LABEL_9:
        if (v9[2] < 2uLL)
        {
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v14 = objc_msgSend(v2, sel_healthAppMedicalIDPath, v18, v19, v20, v21);
        sub_1D714631C();

        sub_1D7146244();
        if (v15)
        {
          v16 = sub_1D7146484();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v16)
          {
            v17 = sub_1D7146484();
            swift_bridgeObjectRelease();
            return v17 == 0;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        goto LABEL_12;
      }
      v13 = sub_1D71465A4();
      result = swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return 0;
}

Swift::Bool __swiftcall HAURLValidator.isMedicalIDURL()()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v0 = (void *)sub_1D7146220();
  v1 = objc_msgSend(v0, sel_resourceSpecifier);

  if (v1)
  {
    sub_1D714631C();
    v3 = v2;

  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_healthAppMedicalIDPath);
  sub_1D714631C();

  sub_1D714625C();
  if (!v6
    || (v7 = objc_msgSend(v4, sel_internalHealthAppURLScheme),
        sub_1D714631C(),
        v7,
        sub_1D7130F40(),
        v8 = sub_1D7146484(),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        v8))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v3)
    goto LABEL_7;
  v10 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return !v10;
}

Swift::Bool __swiftcall HAURLValidator.isHealthChecklistURL()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = v0;
  v2 = type metadata accessor for HAURLValidator();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v37 - v6;
  v8 = sub_1D714625C();
  if (!v9)
    goto LABEL_23;
  v39 = v8;
  v40 = v9;
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_internalHealthAppURLScheme);
  v12 = sub_1D714631C();
  v14 = v13;

  v37 = v12;
  v38 = v14;
  sub_1D7130F40();
  v15 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
    goto LABEL_23;
  v16 = sub_1D7146244();
  if (v17)
  {
    if (v16 == 0x684368746C616548 && v17 == 0xEF7473696C6B6365)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v18) = 1;
      return (char)v18;
    }
    v19 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
    {
      LOBYTE(v18) = 1;
      return (char)v18;
    }
  }
  v20 = sub_1D7146244();
  v22 = v21;
  v23 = objc_msgSend(v10, sel_healthProfileResourceSpecifier);
  v24 = sub_1D714631C();
  v26 = v25;

  if (!v22)
  {
    swift_bridgeObjectRelease();
    sub_1D71437E4(v1, (uint64_t)v7);
    goto LABEL_21;
  }
  if (v20 != v24 || v22 != v26)
  {
    v27 = sub_1D71465A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1D71437E4(v1, (uint64_t)v7);
    if ((v27 & 1) != 0)
      goto LABEL_15;
LABEL_21:
    sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    sub_1D71437E4(v1, (uint64_t)v5);
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v7);
LABEL_15:
  v28 = *(_QWORD *)(sub_1D7146208() + 16);
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  sub_1D71437E4(v1, (uint64_t)v5);
  if (v28 < 2)
    goto LABEL_22;
  v29 = (_QWORD *)sub_1D7146208();
  if (!v29[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v31 = v29[4];
  v30 = v29[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v30)
  {
LABEL_22:
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
LABEL_23:
    LOBYTE(v18) = 0;
    return (char)v18;
  }
  if (v31 == 47 && v30 == 0xE100000000000000)
  {
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = sub_1D71465A4();
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    swift_bridgeObjectRelease();
    LOBYTE(v18) = 0;
    if ((v32 & 1) == 0)
      return (char)v18;
  }
  v18 = (_QWORD *)sub_1D7146208();
  if (v18[2] < 2uLL)
  {
    __break(1u);
  }
  else
  {
    v33 = v18[6];
    v34 = v18[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v39 = v33;
    v40 = v34;
    v37 = 0x684368746C616548;
    v38 = 0xEF7473696C6B6365;
    v35 = sub_1D7146484();
    swift_bridgeObjectRelease();
    LOBYTE(v18) = v35 == 0;
  }
  return (char)v18;
}

uint64_t sub_1D7145518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  _QWORD v17[4];

  v1 = v0;
  v2 = type metadata accessor for HAURLValidator();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D714625C();
  if (!v6)
  {
    sub_1D71437E4(v0, (uint64_t)v4);
LABEL_10:
    sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    v15 = 0;
    return v15 & 1;
  }
  v17[2] = v5;
  v17[3] = v6;
  v7 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  v8 = sub_1D714631C();
  v10 = v9;

  v17[0] = v8;
  v17[1] = v10;
  sub_1D7130F40();
  v11 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v4);
  if (v11)
    goto LABEL_10;
  v12 = sub_1D7146244();
  if (!v13)
    goto LABEL_10;
  if (v12 == 0x656C69666F7270 && v13 == 0xE700000000000000)
    v15 = 1;
  else
    v15 = sub_1D71465A4();
  sub_1D713BBC4((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  swift_bridgeObjectRelease();
  return v15 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isResearchStudiesURL()()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  char v9;

  v0 = (void *)sub_1D7146220();
  v1 = objc_msgSend(v0, sel_resourceSpecifier);

  if (v1)
  {
    sub_1D714631C();
    v3 = v2;

    sub_1D714625C();
    if (!v4)
      goto LABEL_6;
  }
  else
  {
    v3 = 0;
    sub_1D714625C();
    if (!v5)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  v6 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  sub_1D714631C();

  sub_1D7130F40();
  v7 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
    goto LABEL_6;
  if (!v3)
    return 0;
  v9 = sub_1D71463B8();
  swift_bridgeObjectRelease();
  return (v9 & 1) != 0;
}

_QWORD *sub_1D71457FC()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_authorizationManagementHostName);
  v2 = sub_1D714631C();
  v4 = v3;

  sub_1D714625C();
  if (!v5)
    goto LABEL_3;
  v6 = objc_msgSend(v0, sel_internalHealthAppURLScheme);
  v7 = sub_1D714631C();
  v9 = v8;

  sub_1D7130F40();
  v10 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
    goto LABEL_3;
  v13 = sub_1D7146238();
  if (!v14)
    goto LABEL_3;
  v15 = v13;
  v16 = v14;
  if (v13 == v2 && v14 == v4 || (sub_1D71465A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = 1;
    return (_QWORD *)(v11 & 1);
  }
  v17 = objc_msgSend(v0, sel_sharingOverviewHostName, v7, v9, v15, v16);
  sub_1D714631C();

  LOBYTE(v17) = sub_1D714649C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
    goto LABEL_3;
  v18 = *(_QWORD *)(sub_1D7146208() + 16);
  swift_bridgeObjectRelease();
  if (v18 < 2)
    goto LABEL_3;
  v19 = (_QWORD *)sub_1D7146208();
  if (!v19[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_3;
  }
  v21 = v19[4];
  v20 = v19[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_3;
  if (v21 == 47 && v20 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v22 = sub_1D71465A4();
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
LABEL_3:
    swift_bridgeObjectRelease();
    v11 = 0;
    return (_QWORD *)(v11 & 1);
  }
LABEL_19:
  result = (_QWORD *)sub_1D7146208();
  if (result[2] >= 2uLL)
  {
    v23 = result[6];
    v24 = result[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v23 == v2 && v24 == v4)
    {
      swift_bridgeObjectRelease_n();
      v11 = 1;
    }
    else
    {
      v11 = sub_1D71465A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    return (_QWORD *)(v11 & 1);
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall HAURLValidator.isSharingOverviewURL()()
{
  return sub_1D7145AF4((SEL *)&selRef_sharingOverviewHostName);
}

uint64_t sub_1D7145AF4(SEL *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)objc_opt_self(), *a1);
  v3 = sub_1D714631C();
  v5 = v4;

  LOBYTE(v2) = sub_1D7145ED0(v1, v3, v5);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

Swift::Bool __swiftcall HAURLValidator.isInternalSettingsURL()()
{
  uint64_t v0;
  id v1;
  void *v2;
  unsigned int v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_isAppleInternalInstall);

    if (v3)
      LOBYTE(v1) = sub_1D7145ED0(v0, 0xD000000000000010, 0x80000001D7149140);
    else
      LOBYTE(v1) = 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v1;
}

uint64_t sub_1D7145BFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0;
  v2 = type metadata accessor for HAURLValidator();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v29 - v6;
  v8 = sub_1D714625C();
  if (!v9)
  {
    sub_1D71437E4(v0, (uint64_t)v7);
    goto LABEL_7;
  }
  v31 = v8;
  v32 = v9;
  v10 = objc_msgSend((id)objc_opt_self(), sel_externalHealthAppURLScheme);
  v11 = sub_1D714631C();
  v13 = v12;

  v29 = v11;
  v30 = v13;
  sub_1D7130F40();
  v14 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D71437E4(v1, (uint64_t)v7);
  if (v14)
  {
LABEL_7:
    sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    sub_1D71437E4(v1, (uint64_t)v5);
    goto LABEL_8;
  }
  v15 = objc_msgSend((id)objc_opt_self(), sel_externalHealthAppURLHost);
  v16 = sub_1D714631C();
  v18 = v17;

  v19 = sub_1D7146244();
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v31 = v19;
  v32 = v20;
  v29 = v16;
  v30 = v18;
  v21 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  sub_1D71437E4(v1, (uint64_t)v5);
  if (v21)
  {
LABEL_8:
    sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
    v27 = 0;
    return v27 & 1;
  }
  v31 = sub_1D7146250();
  v32 = v22;
  v23 = objc_msgSend((id)objc_opt_self(), sel_healthAppVisionRXIngestionURLPath);
  v24 = sub_1D714631C();
  v26 = v25;

  v29 = v24;
  v30 = v26;
  v27 = sub_1D714649C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D713BBC4((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for HAURLValidator);
  return v27 & 1;
}

uint64_t HAURLValidator.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

BOOL sub_1D7145ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_1D7146274();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D714625C();
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
  v24 = v10;
  v25 = v11;
  v12 = objc_msgSend((id)objc_opt_self(), sel_internalHealthAppURLScheme);
  v13 = sub_1D714631C();
  v15 = v14;

  v22 = v13;
  v23 = v15;
  sub_1D7130F40();
  v16 = sub_1D7146484();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  if (v16)
    goto LABEL_6;
  v17 = sub_1D7146244();
  if (!v18)
    goto LABEL_6;
  v24 = v17;
  v25 = v18;
  v22 = a2;
  v23 = a3;
  v19 = sub_1D7146484();
  swift_bridgeObjectRelease();
  v20 = v19 == 0;
LABEL_7:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v20;
}

uint64_t getEnumTagSinglePayload for HAURLValidator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D7146078(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HAURLValidator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D71460C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1D7146274();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1D7146100()
{
  return MEMORY[0x1E0CAE3D8]();
}

uint64_t sub_1D714610C()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1D7146118()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1D7146124()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1D7146130()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1D714613C()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1D7146148()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1D7146154()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1D7146160()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1D714616C()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1D7146178()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1D7146184()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1D7146190()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1D714619C()
{
  return MEMORY[0x1E0CAF6F8]();
}

uint64_t sub_1D71461A8()
{
  return MEMORY[0x1E0CAF708]();
}

uint64_t sub_1D71461B4()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1D71461C0()
{
  return MEMORY[0x1E0CAF788]();
}

uint64_t sub_1D71461CC()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1D71461D8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D71461E4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D71461F0()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1D71461FC()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1D7146208()
{
  return MEMORY[0x1E0CAFDB0]();
}

uint64_t sub_1D7146214()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1D7146220()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1D714622C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D7146238()
{
  return MEMORY[0x1E0CAFF18]();
}

uint64_t sub_1D7146244()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1D7146250()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1D714625C()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1D7146268()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1D7146274()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D7146280()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D714628C()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1D7146298()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t _s10Foundation4UUIDV17HealthAppServicesE13fromURLStringyACSgSSFZ_0()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t _s10Foundation4UUIDV17HealthAppServicesE11toURLStringSSyF_0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D71462BC()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D71462C8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D71462D4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D71462E0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D71462EC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D71462F8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D7146304()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D7146310()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1D714631C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D7146328()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1D7146334()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D7146340()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1D714634C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D7146358()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1D7146364()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D7146370()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D714637C()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1D7146388()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1D7146394()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1D71463A0()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1D71463AC()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1D71463B8()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1D71463C4()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1D71463D0()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1D71463DC()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1D71463E8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1D71463F4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D7146400()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D714640C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D7146418()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1D7146424()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D7146430()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D714643C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D7146448()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D7146454()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D7146460()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D714646C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D7146478()
{
  return MEMORY[0x1E0CB24B0]();
}

uint64_t sub_1D7146484()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1D7146490()
{
  return MEMORY[0x1E0CB24C8]();
}

uint64_t sub_1D714649C()
{
  return MEMORY[0x1E0CB2500]();
}

uint64_t sub_1D71464A8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D71464B4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D71464C0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D71464CC()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D71464D8()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D71464E4()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1D71464F0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D71464FC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D7146508()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D7146514()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D7146520()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D714652C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D7146538()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D7146544()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D7146550()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D714655C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1D7146568()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D7146574()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1D7146580()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_1D714658C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D7146598()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1D71465A4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D71465B0()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1D71465BC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D71465C8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D71465D4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D71465E0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D71465EC()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x1E0DEEC88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}


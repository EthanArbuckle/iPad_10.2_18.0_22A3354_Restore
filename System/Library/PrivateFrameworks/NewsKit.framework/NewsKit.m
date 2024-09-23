uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21C1C39D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  type metadata accessor for EngagementFeatureSettings();
  v2 = swift_allocObject();
  *(_WORD *)(v2 + 16) = 0;
  *(_BYTE *)(v2 + 18) = 0;
  result = sub_21C1C4064(&qword_255245F30, (uint64_t (*)(uint64_t))type metadata accessor for EngagementFeatureSettings, (uint64_t)&unk_21C1DA08C);
  *a1 = v2;
  a1[1] = result;
  return result;
}

unint64_t sub_21C1C3A38@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  *(_QWORD *)(a1 + 24) = &type metadata for FeatureAvailability;
  result = sub_21C1C3B9C();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t sub_21C1C3A68()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SettingsAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C3A98()
{
  sub_21C1D8FAC();
  sub_21C1C3B50(0, &qword_253F4B348);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C3B50(0, &qword_253F4BBF0);
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

uint64_t sub_21C1C3B50(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_21C1C3B9C()
{
  unint64_t result;

  result = qword_255245F28;
  if (!qword_255245F28)
  {
    result = MEMORY[0x220774CC4](&unk_21C1D9DC0, &type metadata for FeatureAvailability);
    atomic_store(result, (unint64_t *)&qword_255245F28);
  }
  return result;
}

uint64_t sub_21C1C3BE0(uint64_t a1, uint64_t a2)
{
  return sub_21C1C3D28(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21C1C3BEC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21C1D93B4();
  *a2 = 0;
  return result;
}

uint64_t sub_21C1C3C60(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21C1D93C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21C1C3CDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21C1D93CC();
  v2 = sub_21C1D93A8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21C1C3D1C(uint64_t a1, uint64_t a2)
{
  return sub_21C1C3D28(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21C1C3D28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21C1D93CC();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21C1C3D64()
{
  sub_21C1D93CC();
  sub_21C1D93D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C1C3DA4()
{
  uint64_t v0;

  sub_21C1D93CC();
  sub_21C1D95DC();
  sub_21C1D93D8();
  v0 = sub_21C1D95F4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21C1C3E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21C1D93CC();
  v2 = v1;
  if (v0 == sub_21C1D93CC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21C1D9594();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255246178)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255246178);
  }
}

uint64_t sub_21C1C3EF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21C1D93A8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21C1C3F34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21C1D93CC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21C1C3F5C()
{
  sub_21C1C4064((unint64_t *)&qword_255246EA0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21C1D9D24);
  sub_21C1C4064((unint64_t *)&unk_2552461A0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21C1D9C78);
  return sub_21C1D951C();
}

uint64_t sub_21C1C3FE0()
{
  return sub_21C1C4064(&qword_255246180, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21C1D9C3C);
}

uint64_t sub_21C1C400C()
{
  return sub_21C1C4064(&qword_255246188, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21C1D9C10);
}

uint64_t sub_21C1C4038()
{
  return sub_21C1C4064((unint64_t *)&unk_255246190, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21C1D9CAC);
}

uint64_t sub_21C1C4064(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220774CC4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for NewsPlugLabelConfigProvider()
{
  return objc_opt_self();
}

uint64_t sub_21C1C40C4()
{
  return 0;
}

uint64_t sub_21C1C40CC()
{
  return 0;
}

uint64_t sub_21C1C40D8()
{
  return 1;
}

ValueMetadata *type metadata accessor for FeatureAvailability()
{
  return &type metadata for FeatureAvailability;
}

uint64_t sub_21C1C410C@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for PostPurchaseOnboardingPresenter, (unint64_t *)&unk_255246560, (uint64_t)&unk_21C1DB340, a1);
}

uint64_t sub_21C1C4128@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for PostPurchaseOnboardingViewControllerFactory, &qword_255246558, (uint64_t)&unk_21C1DAA9C, a1);
}

uint64_t sub_21C1C4144@<X0>(uint64_t (*a1)(uint64_t)@<X1>, unint64_t *a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = a1(0);
  v9 = swift_allocObject();
  a4[3] = v8;
  result = sub_21C1C4064(a2, a1, a3);
  a4[4] = result;
  *a4 = v9;
  return result;
}

uint64_t sub_21C1C41B4@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for CampaignLandingPageTracker, &qword_255246550, (uint64_t)&unk_21C1DA20C, a1);
}

uint64_t type metadata accessor for SubscriptionAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C41F0()
{
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B370);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C42EC(0, (unint64_t *)&unk_253F4B378);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C42EC(0, (unint64_t *)&unk_253F4B2F8);
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

uint64_t sub_21C1C42EC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21C1C4338()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

uint64_t sub_21C1C4378()
{
  return sub_21C1D95E8();
}

uint64_t sub_21C1C439C()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

void sub_21C1C43E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v11 = *(void **)(a5 + 16);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = sub_21C1C4758;
  v12[3] = v10;
  v12[4] = a3;
  v12[5] = a4;
  v14[4] = sub_21C1C47B4;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_21C1C45E8;
  v14[3] = &block_descriptor;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_fetchAppConfigurationIfNeededWithCompletion_, v13);
  _Block_release(v13);
}

void sub_21C1C44EC(uint64_t a1, id a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, void (*a5)(void))
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  if (a1)
  {
    v8 = objc_msgSend((id)swift_unknownObjectRetain(), sel_articleRecirculationConfigJSON);
    if (v8)
    {
      v9 = v8;
      v10 = sub_21C1D93CC();
      v12 = v11;

      a3(v10, v12);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
  }
  if (a2)
  {
    v13 = a2;
    ((void (*)(id))a5)(a2);
    v14 = a2;
  }
  else
  {
    sub_21C1C47C0();
    v15 = swift_allocError();
    a5();
    v14 = (id)v15;
  }

}

uint64_t sub_21C1C45E8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_21C1C4650()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ArticleRecirculationConfigurationService()
{
  return objc_opt_self();
}

uint64_t sub_21C1C4694()
{
  sub_21C1C46E0();
  swift_allocObject();
  return sub_21C1D903C();
}

void sub_21C1C46D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_21C1C43E8(a1, a2, a3, a4, v4);
}

void sub_21C1C46E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255246670)
  {
    v0 = sub_21C1D9048();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255246670);
  }
}

uint64_t sub_21C1C4734()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C1C4758(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_21C1C4788()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21C1C47B4(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_21C1C44EC(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(void))(v2 + 32));
}

unint64_t sub_21C1C47C0()
{
  unint64_t result;

  result = qword_255246678;
  if (!qword_255246678)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA010, &type metadata for ArticleRecirculationConfigurationService.Errors);
    atomic_store(result, (unint64_t *)&qword_255246678);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleRecirculationConfigurationService.Errors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArticleRecirculationConfigurationService.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21C1C489C + 4 * byte_21C1D9F20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21C1C48BC + 4 * byte_21C1D9F25[v4]))();
}

_BYTE *sub_21C1C489C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21C1C48BC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21C1C48C4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21C1C48CC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21C1C48D4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21C1C48DC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ArticleRecirculationConfigurationService.Errors()
{
  return &type metadata for ArticleRecirculationConfigurationService.Errors;
}

unint64_t sub_21C1C4900()
{
  unint64_t result;

  result = qword_255246680;
  if (!qword_255246680)
  {
    result = MEMORY[0x220774CC4](&unk_21C1D9FE8, &type metadata for ArticleRecirculationConfigurationService.Errors);
    atomic_store(result, (unint64_t *)&qword_255246680);
  }
  return result;
}

uint64_t sub_21C1C4944()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EngagementFeatureSettings()
{
  return objc_opt_self();
}

uint64_t sub_21C1C4974()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_21C1C49A4(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_21C1C49E0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21C1C4A20()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t sub_21C1C4A50(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 18) = a1;
  return result;
}

uint64_t (*sub_21C1C4A8C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21C1C4AC8()
{
  return sub_21C1D90A8();
}

uint64_t sub_21C1C4AD0()
{
  return sub_21C1D90B4();
}

uint64_t sub_21C1C4AD8()
{
  return sub_21C1D9090();
}

uint64_t sub_21C1C4AE0()
{
  return sub_21C1D909C();
}

uint64_t NewsArticleThumbnail.article.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21C1C4D80(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for NewsArticle);
}

uint64_t NewsArticleThumbnail.init(article:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21C1C4B18(a1, a2);
}

uint64_t sub_21C1C4B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NewsArticleThumbnail.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  sub_21C1C4C44();
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for NewsArticle();
  sub_21C1C4D80(v0 + *(int *)(v3 + 24), (uint64_t)v2, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = sub_21C1C4C98;
  v4[3] = 0;
  v4[4] = sub_21C1C4D5C;
  v4[5] = 0;
  sub_21C1C5018();
  sub_21C1C50D0();
  return sub_21C1D91E0();
}

void sub_21C1C4C44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F4B2D8)
  {
    sub_21C1D8CE8();
    v0 = sub_21C1D9450();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F4B2D8);
  }
}

uint64_t sub_21C1C4C98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = sub_21C1D92C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v6 = sub_21C1D92D0();
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  return result;
}

uint64_t sub_21C1C4D5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21C1D92B8();
  *a1 = result;
  return result;
}

uint64_t sub_21C1C4D80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21C1C4DCC()
{
  return sub_21C1D92AC();
}

uint64_t sub_21C1C4DE4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  sub_21C1C4C44();
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for NewsArticle();
  sub_21C1C4D80(v0 + *(int *)(v3 + 24), (uint64_t)v2, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = sub_21C1C4C98;
  v4[3] = 0;
  v4[4] = sub_21C1C4D5C;
  v4[5] = 0;
  sub_21C1C5018();
  sub_21C1C50D0();
  return sub_21C1D91E0();
}

uint64_t sub_21C1C4ECC(uint64_t a1, void (*a2)(uint64_t *__return_ptr), uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  uint64_t v7;

  if (sub_21C1D91F8())
  {
    a2(&v7);
    sub_21C1C5074();
    sub_21C1C5138();
    swift_retain_n();
    sub_21C1D9210();
    swift_release_n();
    swift_release();
  }
  else
  {
    a4(&v7);
    sub_21C1C5074();
    sub_21C1C5138();
    sub_21C1D9210();
  }
  return v7;
}

void sub_21C1C5018()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255246740)
  {
    sub_21C1C5074();
    v0 = sub_21C1D921C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255246740);
  }
}

void sub_21C1C5074()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255246748)
  {
    v0 = sub_21C1D9204();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255246748);
  }
}

unint64_t sub_21C1C50D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255246750;
  if (!qword_255246750)
  {
    sub_21C1C5018();
    v2 = v1;
    v3[0] = sub_21C1C5138();
    v3[1] = MEMORY[0x24BDF3E20];
    result = MEMORY[0x220774CC4](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_255246750);
  }
  return result;
}

unint64_t sub_21C1C5138()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255246758;
  if (!qword_255246758)
  {
    sub_21C1C5074();
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x220774CC4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255246758);
  }
  return result;
}

uint64_t sub_21C1C5198()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for NewsArticleThumbnail(char *a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  unsigned int (*v59)(char *, uint64_t, uint64_t);
  int *v60;
  int *v61;

  v4 = type metadata accessor for NewsArticle();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = a2[3];
    *((_QWORD *)a1 + 2) = a2[2];
    *((_QWORD *)a1 + 3) = v8;
    v9 = *(int *)(v4 + 24);
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    v12 = sub_21C1D8CE8();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v59 = v14;
    if (v14(v11, 1, v12))
    {
      sub_21C1C4C44();
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = v6[7];
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v20 = sub_21C1D8D18();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = v6[8];
    v22 = (char *)a2 + v21;
    v23 = a2;
    v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v24(&a1[v21], v22, v12);
    v60 = v6;
    v25 = v6[9];
    v26 = &a1[v25];
    v55 = v13;
    v56 = v23;
    v27 = (_QWORD *)((char *)v23 + v25);
    v28 = v27[1];
    *(_QWORD *)v26 = *v27;
    *((_QWORD *)v26 + 1) = v28;
    v29 = v27[3];
    *((_QWORD *)v26 + 2) = v27[2];
    *((_QWORD *)v26 + 3) = v29;
    v57 = type metadata accessor for NewsChannel();
    v58 = v27;
    v30 = *(int *)(v57 + 24);
    v31 = &v26[v30];
    v32 = (char *)v27 + v30;
    *(_QWORD *)&v26[v30] = *(_QWORD *)v32;
    v61 = (int *)type metadata accessor for NewsChannelLogoCollection();
    v33 = v61[5];
    v34 = &v31[v33];
    v35 = &v32[v33];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v36 = v24;
    if (v59(v35, 1, v12))
    {
      sub_21C1C4C44();
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      v38 = v55;
    }
    else
    {
      v24(v34, v35, v12);
      v38 = v55;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v34, 0, 1, v12);
    }
    v39 = v61[6];
    v40 = &v31[v39];
    v41 = &v32[v39];
    if (v59(&v32[v39], 1, v12))
    {
      sub_21C1C4C44();
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    else
    {
      v36(v40, v41, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v12);
    }
    v43 = v61[7];
    v44 = &v31[v43];
    v45 = &v32[v43];
    if (v59(&v32[v43], 1, v12))
    {
      sub_21C1C4C44();
      memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    }
    else
    {
      v36(v44, v45, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v44, 0, 1, v12);
    }
    v47 = *(int *)(v57 + 28);
    v48 = &v26[v47];
    v49 = (char *)v58 + v47;
    v50 = *(void **)((char *)v58 + v47);
    if (v50)
    {
      v51 = (void *)*((_QWORD *)v49 + 1);
      *(_QWORD *)v48 = v50;
      *((_QWORD *)v48 + 1) = v51;
      v52 = v50;
      v53 = v51;
    }
    else
    {
      *(_OWORD *)v48 = *(_OWORD *)v49;
    }
    *(_QWORD *)&a1[v60[10]] = *(_QWORD *)((char *)v56 + v60[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for NewsArticleThumbnail(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for NewsArticle();
  v3 = a1 + v2[6];
  v4 = sub_21C1D8CE8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v7 = a1 + v2[7];
  v8 = sub_21C1D8D18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(a1 + v2[8], v4);
  v10 = a1 + v2[9];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for NewsChannel();
  v12 = v10 + *(int *)(v11 + 24);
  v13 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v14 = v12 + v13[5];
  if (!v6(v14, 1, v4))
    v9(v14, v4);
  v15 = v12 + v13[6];
  if (!v6(v15, 1, v4))
    v9(v15, v4);
  v16 = v12 + v13[7];
  if (!v6(v16, 1, v4))
    v9(v16, v4);
  v17 = (id *)(v10 + *(int *)(v11 + 28));
  if (*v17)
  {

  }
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for NewsArticleThumbnail(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  int *v52;
  _QWORD *v53;
  int *v54;
  char *v55;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v4;
  v5 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v5;
  v6 = (int *)type metadata accessor for NewsArticle();
  v7 = v6[6];
  v55 = a1;
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_21C1D8CE8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v51 = v12;
  if (v12(v9, 1, v10))
  {
    sub_21C1C4C44();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = v6[7];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v18(&v55[v6[8]], &a2[v6[8]], v10);
  v52 = v6;
  v53 = a2;
  v19 = v6[9];
  v20 = &v55[v19];
  v21 = &a2[v19];
  v49 = v11;
  v22 = *(_QWORD *)&a2[v19 + 8];
  *(_QWORD *)v20 = *(_QWORD *)&a2[v19];
  *((_QWORD *)v20 + 1) = v22;
  v23 = *(_QWORD *)&a2[v19 + 24];
  *((_QWORD *)v20 + 2) = *(_QWORD *)&a2[v19 + 16];
  *((_QWORD *)v20 + 3) = v23;
  v50 = type metadata accessor for NewsChannel();
  v24 = *(int *)(v50 + 24);
  v25 = &v20[v24];
  v26 = &v21[v24];
  *(_QWORD *)&v20[v24] = *(_QWORD *)&v21[v24];
  v54 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v27 = v54[5];
  v28 = &v25[v27];
  v29 = &v26[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30 = v18;
  if (v51(v29, 1, v10))
  {
    sub_21C1C4C44();
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    v32 = v49;
  }
  else
  {
    v18(v28, v29, v10);
    v32 = v49;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v28, 0, 1, v10);
  }
  v33 = v54[6];
  v34 = &v25[v33];
  v35 = &v26[v33];
  if (v51(&v26[v33], 1, v10))
  {
    sub_21C1C4C44();
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    v30(v34, v35, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v10);
  }
  v37 = v54[7];
  v38 = &v25[v37];
  v39 = &v26[v37];
  if (v51(&v26[v37], 1, v10))
  {
    sub_21C1C4C44();
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    v30(v38, v39, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v38, 0, 1, v10);
  }
  v41 = *(int *)(v50 + 28);
  v42 = &v20[v41];
  v43 = &v21[v41];
  v44 = *(void **)&v21[v41];
  if (v44)
  {
    v45 = (void *)*((_QWORD *)v43 + 1);
    *(_QWORD *)v42 = v44;
    *((_QWORD *)v42 + 1) = v45;
    v46 = v44;
    v47 = v45;
  }
  else
  {
    *(_OWORD *)v42 = *(_OWORD *)v43;
  }
  *(_QWORD *)&v55[v52[10]] = *(_QWORD *)((char *)v53 + v52[10]);
  swift_bridgeObjectRetain();
  return v55;
}

char *assignWithCopy for NewsArticleThumbnail(char *a1, char *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  int *v59;
  _QWORD *v60;
  uint64_t v61;
  int *v62;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for NewsArticle();
  v5 = v4[6];
  v6 = &a1[v5];
  v7 = &a2[v5];
  v8 = sub_21C1D8CE8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v11 = v10(v6, 1, v8);
  v12 = v10(v7, 1, v8);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(v6, v7, v8);
LABEL_7:
  v14 = v4[7];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v61 = v9;
  v57 = *(void (**)(char *, char *, uint64_t))(v9 + 24);
  v57(&a1[v4[8]], &a2[v4[8]], v8);
  v59 = v4;
  v60 = a2;
  v18 = v4[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_QWORD *)v19 = *(_QWORD *)&a2[v18];
  *((_QWORD *)v19 + 1) = *(_QWORD *)&a2[v18 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  *((_QWORD *)v19 + 3) = *((_QWORD *)v20 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = type metadata accessor for NewsChannel();
  v21 = *(int *)(v58 + 24);
  v22 = &v19[v21];
  v23 = &v20[v21];
  *(_QWORD *)&v19[v21] = *(_QWORD *)&v20[v21];
  v62 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v24 = v62[5];
  v25 = &v22[v24];
  v26 = &v23[v24];
  v27 = v10(&v22[v24], 1, v8);
  v28 = v10(v26, 1, v8);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v25, v26, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v25, 0, 1, v8);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v61 + 8))(v25, v8);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  v57(v25, v26, v8);
LABEL_13:
  v30 = v62[6];
  v31 = &v22[v30];
  v32 = &v23[v30];
  v33 = v10(&v22[v30], 1, v8);
  v34 = v10(v32, 1, v8);
  if (v33)
  {
    if (!v34)
    {
      v36 = v61;
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v31, v32, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v31, 0, 1, v8);
      goto LABEL_23;
    }
    sub_21C1C4C44();
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    if (v34)
    {
      v36 = v61;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v31, v8);
      sub_21C1C4C44();
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      goto LABEL_23;
    }
    v57(v31, v32, v8);
  }
  v36 = v61;
LABEL_23:
  v38 = v62[7];
  v39 = &v22[v38];
  v40 = &v23[v38];
  v41 = v10(v39, 1, v8);
  v42 = v10(v40, 1, v8);
  if (v41)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v39, v40, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v39, 0, 1, v8);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v8);
LABEL_28:
    sub_21C1C4C44();
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    goto LABEL_29;
  }
  v57(v39, v40, v8);
LABEL_29:
  v44 = *(int *)(v58 + 28);
  v45 = &v19[v44];
  v46 = &v20[v44];
  v47 = *(id *)v45;
  v48 = *(void **)&v20[v44];
  if (!*(_QWORD *)v45)
  {
    if (v48)
    {
      *(_QWORD *)v45 = v48;
      v53 = (void *)*((_QWORD *)v46 + 1);
      *((_QWORD *)v45 + 1) = v53;
      v54 = v48;
      v55 = v53;
      goto LABEL_36;
    }
LABEL_35:
    *(_OWORD *)v45 = *(_OWORD *)v46;
    goto LABEL_36;
  }
  if (!v48)
  {
    sub_21C1C5F08((id *)v45);
    goto LABEL_35;
  }
  *(_QWORD *)v45 = v48;
  v49 = v48;

  v50 = (void *)*((_QWORD *)v46 + 1);
  v51 = (void *)*((_QWORD *)v45 + 1);
  *((_QWORD *)v45 + 1) = v50;
  v52 = v50;

LABEL_36:
  *(_QWORD *)&a1[v59[10]] = *(_QWORD *)((char *)v60 + v59[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *sub_21C1C5F08(id *a1)
{
  destroy for NewsChannelTheme(a1);
  return a1;
}

char *initializeWithTake for NewsArticleThumbnail(char *a1, char *a2)
{
  __int128 v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v41;
  uint64_t v42;
  _OWORD *v43;
  uint64_t v44;
  int *v45;
  unsigned int (*v46)(char *, uint64_t, uint64_t);

  v4 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v4;
  v5 = (int *)type metadata accessor for NewsArticle();
  v6 = v5[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v46(v8, 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = v5[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v16(&a1[v5[8]], &a2[v5[8]], v9);
  v45 = v5;
  v17 = v5[9];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(_OWORD *)&a2[v17 + 16];
  *(_OWORD *)v18 = *(_OWORD *)&a2[v17];
  *((_OWORD *)v18 + 1) = v20;
  v42 = type metadata accessor for NewsChannel();
  v43 = v18;
  v21 = *(int *)(v42 + 24);
  v22 = &v18[v21];
  v41 = v19;
  v23 = &v19[v21];
  *(_QWORD *)v22 = *(_QWORD *)&v19[v21];
  v24 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v25 = v24[5];
  v26 = &v22[v25];
  v27 = v10;
  v28 = &v23[v25];
  v44 = v27;
  if (v46(&v23[v25], 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v26, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v16(v26, v28, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v26, 0, 1, v9);
  }
  v30 = v24[6];
  v31 = &v22[v30];
  v32 = &v23[v30];
  if (v46(&v23[v30], 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    v34 = v27;
    v35 = v16;
  }
  else
  {
    v35 = v16;
    v16(v31, v32, v9);
    v34 = v44;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v31, 0, 1, v9);
  }
  v36 = v24[7];
  v37 = &v22[v36];
  v38 = &v23[v36];
  if (v46(&v23[v36], 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    v35(v37, v38, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v37, 0, 1, v9);
  }
  *(_OWORD *)((char *)v43 + *(int *)(v42 + 28)) = *(_OWORD *)&v41[*(int *)(v42 + 28)];
  *(_QWORD *)&a1[v45[10]] = *(_QWORD *)&a2[v45[10]];
  return a1;
}

char *assignWithTake for NewsArticleThumbnail(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  id *v49;
  char *v50;
  void *v51;
  id v52;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  int *v56;
  _QWORD *v57;
  uint64_t v58;
  int *v59;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v4;
  swift_bridgeObjectRelease();
  v5 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v5;
  swift_bridgeObjectRelease();
  v6 = (int *)type metadata accessor for NewsArticle();
  v7 = v6[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_21C1D8CE8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = v6[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v58 = v11;
  v54 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v54(&a1[v6[8]], &a2[v6[8]], v10);
  v56 = v6;
  v57 = a2;
  v20 = v6[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = *(_QWORD *)&a2[v20 + 8];
  *(_QWORD *)v21 = *(_QWORD *)&a2[v20];
  *((_QWORD *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  v24 = *((_QWORD *)v22 + 3);
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  *((_QWORD *)v21 + 3) = v24;
  swift_bridgeObjectRelease();
  v55 = type metadata accessor for NewsChannel();
  v25 = *(int *)(v55 + 24);
  v26 = &v21[v25];
  v27 = &v22[v25];
  *(_QWORD *)&v21[v25] = *(_QWORD *)&v22[v25];
  v59 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v28 = v59[5];
  v29 = &v26[v28];
  v30 = &v27[v28];
  v31 = v12(&v26[v28], 1, v10);
  v32 = v12(v30, 1, v10);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v29, v30, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v29, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v58 + 8))(v29, v10);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  v54(v29, v30, v10);
LABEL_13:
  v34 = v59[6];
  v35 = &v26[v34];
  v36 = &v27[v34];
  v37 = v12(&v26[v34], 1, v10);
  v38 = v12(v36, 1, v10);
  if (v37)
  {
    if (!v38)
    {
      v40 = v58;
      (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v35, v36, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v35, 0, 1, v10);
      goto LABEL_23;
    }
    sub_21C1C4C44();
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    if (v38)
    {
      v40 = v58;
      (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v10);
      sub_21C1C4C44();
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
      goto LABEL_23;
    }
    v54(v35, v36, v10);
  }
  v40 = v58;
LABEL_23:
  v42 = v59[7];
  v43 = &v26[v42];
  v44 = &v27[v42];
  v45 = v12(v43, 1, v10);
  v46 = v12(v44, 1, v10);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v44, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v43, 0, 1, v10);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v10);
LABEL_28:
    sub_21C1C4C44();
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_29;
  }
  v54(v43, v44, v10);
LABEL_29:
  v48 = *(int *)(v55 + 28);
  v49 = (id *)&v21[v48];
  v50 = &v22[v48];
  v51 = *(void **)&v21[v48];
  if (!v51)
  {
LABEL_33:
    *(_OWORD *)v49 = *(_OWORD *)v50;
    goto LABEL_34;
  }
  if (!*(_QWORD *)v50)
  {
    sub_21C1C5F08(v49);
    goto LABEL_33;
  }
  *v49 = *(id *)v50;

  v52 = v49[1];
  v49[1] = (id)*((_QWORD *)v50 + 1);

LABEL_34:
  *(_QWORD *)&a1[v56[10]] = *(_QWORD *)((char *)v57 + v56[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsArticleThumbnail()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1C66D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsArticle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for NewsArticleThumbnail()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1C671C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsArticle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for NewsArticleThumbnail()
{
  uint64_t result;

  result = qword_2552467B8;
  if (!qword_2552467B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C1C6798()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for NewsArticle();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_21C1C6804()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552467F0;
  if (!qword_2552467F0)
  {
    sub_21C1C684C();
    result = MEMORY[0x220774CC4](MEMORY[0x24BDEAF78], v1);
    atomic_store(result, (unint64_t *)&qword_2552467F0);
  }
  return result;
}

void sub_21C1C684C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552467F8)
  {
    sub_21C1C5018();
    sub_21C1C50D0();
    v0 = sub_21C1D91EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552467F8);
  }
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C1C68DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  __int16 v6;
  char v7;

  result = sub_21C1C4ECC(a1, *(void (**)(uint64_t *__return_ptr))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(uint64_t *__return_ptr))(v2 + 32));
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 18) = v7 & 1;
  return result;
}

uint64_t sub_21C1C6914(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D8E20();
  result = sub_21C1D8F7C();
  if (result)
  {
    v2 = sub_21C1D8E14();
    swift_release();
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C1C697C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, _QWORD, uint64_t);
  void (*v5)(char *, uint64_t);
  uint64_t v7;

  v0 = sub_21C1D900C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8E20();
  sub_21C1D8FF4();
  v4 = *(void (**)(char *, _QWORD, uint64_t))(v1 + 104);
  v4(v3, *MEMORY[0x24BEB4658], v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_21C1D8D6C();
  sub_21C1D8FF4();
  v4(v3, *MEMORY[0x24BEB4660], v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v5)(v3, v0);
}

uint64_t sub_21C1C6AB4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v20 = a1;
  v19 = sub_21C1D8DB4();
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_21C1D8E2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8E08();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE03C18];
  MEMORY[0x24BDAC7A8]();
  v6 = sub_21C1D8E5C();
  v15 = *(_QWORD *)(v6 - 8);
  v16 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1C7098(0, &qword_255246800, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21C1DA190;
  sub_21C1D8DF0();
  sub_21C1D8DFC();
  v21 = v9;
  sub_21C1C4064(&qword_255246808, v5, MEMORY[0x24BE03C28]);
  sub_21C1C7098(0, &qword_255246810, v5, MEMORY[0x24BEE1250]);
  sub_21C1C7050(&qword_255246818, &qword_255246810, v5);
  sub_21C1D9474();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v17, *MEMORY[0x24BE03C50], v2);
  sub_21C1D8E74();
  swift_allocObject();
  sub_21C1D8E68();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BE03B28];
  sub_21C1C7098(0, &qword_255246820, (uint64_t (*)(uint64_t))MEMORY[0x24BE03B28], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21C1DA1A0;
  sub_21C1D8DA8();
  sub_21C1D8D90();
  sub_21C1D8D9C();
  v21 = v11;
  sub_21C1C4064(&qword_255246828, v10, MEMORY[0x24BE03B38]);
  sub_21C1C7098(0, &qword_255246830, v10, MEMORY[0x24BEE1250]);
  sub_21C1C7050(&qword_255246838, &qword_255246830, v10);
  sub_21C1D9474();
  sub_21C1D8DE4();
  swift_allocObject();
  sub_21C1D8DD8();
  sub_21C1D8E50();
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  sub_21C1D8D6C();
  result = sub_21C1D8F7C();
  if (result)
  {
    v13 = sub_21C1D8D54();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v16);
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C1C6E8C()
{
  sub_21C1D8E44();
  sub_21C1D8E38();
  sub_21C1D8D84();
  sub_21C1D8D78();
  sub_21C1D8DCC();
  sub_21C1D8DC0();
  sub_21C1D8D6C();
  swift_allocObject();
  return sub_21C1D8D60();
}

uint64_t type metadata accessor for AnalyticsAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C6F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21C1D900C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8FAC();
  sub_21C1D8E80();
  sub_21C1D8FF4();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEB4658], v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_21C1D8FB8();
  sub_21C1D8FE8();
  return swift_release();
}

uint64_t sub_21C1C7050(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_21C1C7098(255, a2, a3, MEMORY[0x24BEE1250]);
    result = MEMORY[0x220774CC4](MEMORY[0x24BEE12C8], v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_21C1C7098(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for CampaignLandingPageTracker()
{
  return objc_opt_self();
}

unint64_t sub_21C1C7110@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C725C();
  result = sub_21C1D8F7C();
  if (result)
  {
    v4 = result;
    v5 = type metadata accessor for ArticleRecirculationConfigurationService();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    a2[3] = v5;
    result = sub_21C1C72B0();
    a2[4] = result;
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ServicesAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C71B8()
{
  sub_21C1D8FAC();
  sub_21C1C7208();
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

unint64_t sub_21C1C7208()
{
  unint64_t result;

  result = qword_253F4B308;
  if (!qword_253F4B308)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253F4B308);
  }
  return result;
}

unint64_t sub_21C1C725C()
{
  unint64_t result;

  result = qword_253F4BD10;
  if (!qword_253F4BD10)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253F4BD10);
  }
  return result;
}

unint64_t sub_21C1C72B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552468D8;
  if (!qword_2552468D8)
  {
    v1 = type metadata accessor for ArticleRecirculationConfigurationService();
    result = MEMORY[0x220774CC4](&unk_21C1D9F78, v1);
    atomic_store(result, (unint64_t *)&qword_2552468D8);
  }
  return result;
}

unint64_t sub_21C1C72F8@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  *(_QWORD *)(a1 + 24) = &type metadata for ToolbarNavigationArticleViewerFeatureVisibilityProvider;
  result = sub_21C1C7490();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

unint64_t sub_21C1C7328@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  v2 = type metadata accessor for NewsPlugLabelConfigProvider();
  v3 = swift_allocObject();
  a1[3] = v2;
  result = sub_21C1C7448();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for ArticleAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C7398()
{
  sub_21C1D8FAC();
  sub_21C1C42EC(0, (unint64_t *)&unk_253F4B310);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B2E0);
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

unint64_t sub_21C1C7448()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552468E0;
  if (!qword_2552468E0)
  {
    v1 = type metadata accessor for NewsPlugLabelConfigProvider();
    result = MEMORY[0x220774CC4](&unk_21C1D9D8C, v1);
    atomic_store(result, (unint64_t *)&qword_2552468E0);
  }
  return result;
}

unint64_t sub_21C1C7490()
{
  unint64_t result;

  result = qword_2552468E8;
  if (!qword_2552468E8)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DB3A8, &type metadata for ToolbarNavigationArticleViewerFeatureVisibilityProvider);
    atomic_store(result, (unint64_t *)&qword_2552468E8);
  }
  return result;
}

id NewsChannelTheme.backgroundColor.getter()
{
  id *v0;

  return *v0;
}

id NewsChannelTheme.foregroundColor.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t sub_21C1C74E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C1C751C + 4 * byte_21C1DA2C0[a1]))(0xD000000000000013, 0x800000021C1DB700);
}

uint64_t sub_21C1C751C()
{
  return 0x756F72676B636162;
}

BOOL sub_21C1C7560(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21C1C7574()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

uint64_t sub_21C1C75B8()
{
  return sub_21C1D95E8();
}

uint64_t sub_21C1C75E0()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

uint64_t sub_21C1C7620()
{
  unsigned __int8 *v0;

  return sub_21C1C74E4(*v0);
}

uint64_t sub_21C1C7628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C1C84E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C1C764C()
{
  return 0;
}

void sub_21C1C7658(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_21C1C7664()
{
  sub_21C1C7A58();
  return sub_21C1D9618();
}

uint64_t sub_21C1C768C()
{
  sub_21C1C7A58();
  return sub_21C1D9624();
}

uint64_t NewsChannelTheme.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  __int128 v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id (*v29)(uint64_t, void *);
  __int128 v30;
  void *v31;
  id (*v32)(uint64_t, void *);
  uint64_t v33;
  uint64_t v34;
  __int128 aBlock;
  id (*v36)(uint64_t, void *);
  void *v37;
  uint64_t (*v38)();
  uint64_t v39;
  char v40;

  sub_21C1C8034(0, &qword_2552468F0, MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v28 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C7A58();
  sub_21C1D9600();
  if (!v2)
  {
    v40 = 0;
    sub_21C1C7ABC();
    sub_21C1D954C();
    v10 = aBlock;
    v11 = v36;
    v12 = v37;
    v40 = 1;
    sub_21C1D954C();
    v13 = aBlock;
    v14 = v36;
    v15 = v37;
    v40 = 0;
    sub_21C1D954C();
    v33 = *((_QWORD *)&aBlock + 1);
    v34 = aBlock;
    v31 = v37;
    v32 = v36;
    v40 = 3;
    sub_21C1D954C();
    v30 = aBlock;
    v29 = v36;
    v28 = v37;
    v17 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v13;
    *(_QWORD *)(v18 + 32) = v14;
    *(_QWORD *)(v18 + 40) = v15;
    *(_OWORD *)(v18 + 48) = v10;
    *(_QWORD *)(v18 + 64) = v11;
    *(_QWORD *)(v18 + 72) = v12;
    v38 = sub_21C1C7FBC;
    v39 = v18;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v36 = sub_21C1C7FC0;
    v37 = &block_descriptor_0;
    v19 = _Block_copy(&aBlock);
    swift_release();
    v20 = objc_msgSend(v17, sel_initWithDynamicProvider_, v19);
    _Block_release(v19);
    v21 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = v30;
    v23 = v28;
    *(_QWORD *)(v22 + 32) = v29;
    *(_QWORD *)(v22 + 40) = v23;
    v24 = v33;
    *(_QWORD *)(v22 + 48) = v34;
    *(_QWORD *)(v22 + 56) = v24;
    v25 = v31;
    *(_QWORD *)(v22 + 64) = v32;
    *(_QWORD *)(v22 + 72) = v25;
    v38 = sub_21C1C7FBC;
    v39 = v22;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v36 = sub_21C1C7FC0;
    v37 = &block_descriptor_7;
    v26 = _Block_copy(&aBlock);
    swift_release();
    v27 = objc_msgSend(v21, sel_initWithDynamicProvider_, v26);
    _Block_release(v26);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v20;
    a2[1] = v27;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_21C1C7A58()
{
  unint64_t result;

  result = qword_2552468F8;
  if (!qword_2552468F8)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA424, &type metadata for NewsChannelTheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552468F8);
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

unint64_t sub_21C1C7ABC()
{
  unint64_t result;

  result = qword_255246900;
  if (!qword_255246900)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA4B4, &type metadata for RGBAColor);
    atomic_store(result, (unint64_t *)&qword_255246900);
  }
  return result;
}

uint64_t NewsChannelTheme.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  char v60;

  sub_21C1C8034(0, &qword_255246908, MEMORY[0x24BEE3520]);
  v4 = v3;
  v50 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v45 - v5;
  v8 = *(void **)v1;
  v7 = *(void **)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C7A58();
  sub_21C1D960C();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v11 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v10);

  sub_21C1D9438();
  v54 = v12;
  sub_21C1D9438();
  v53 = v13;
  sub_21C1D9438();
  v52 = v14;
  sub_21C1D9438();
  v51 = v15;

  v16 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v17 = objc_msgSend(v8, sel_resolvedColorWithTraitCollection_, v16);

  sub_21C1D9438();
  v49 = v18;
  sub_21C1D9438();
  v48 = v19;
  sub_21C1D9438();
  v47 = v20;
  sub_21C1D9438();
  v46 = v21;

  v22 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 1);
  v23 = objc_msgSend(v7, sel_resolvedColorWithTraitCollection_, v22);

  sub_21C1D9438();
  v25 = v24;
  sub_21C1D9438();
  v27 = v26;
  sub_21C1D9438();
  v29 = v28;
  sub_21C1D9438();
  v31 = v30;

  v32 = objc_msgSend(v9, sel_traitCollectionWithUserInterfaceStyle_, 2);
  v33 = objc_msgSend(v7, sel_resolvedColorWithTraitCollection_, v32);

  sub_21C1D9438();
  v35 = v34;
  sub_21C1D9438();
  v37 = v36;
  sub_21C1D9438();
  v39 = v38;
  sub_21C1D9438();
  v41 = v40;

  v56 = v54;
  v57 = v53;
  v58 = v52;
  v59 = v51;
  v60 = 0;
  sub_21C1C8090();
  v42 = v55;
  sub_21C1D957C();
  if (v42)
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v6, v4);
  v44 = v50;
  v56 = v49;
  v57 = v48;
  v58 = v47;
  v59 = v46;
  v60 = 1;
  sub_21C1D957C();
  v56 = v25;
  v57 = v27;
  v58 = v29;
  v59 = v31;
  v60 = 2;
  sub_21C1D957C();
  v56 = v35;
  v57 = v37;
  v58 = v39;
  v59 = v41;
  v60 = 3;
  sub_21C1D957C();
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v6, v4);
}

uint64_t sub_21C1C7EBC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return NewsChannelTheme.init(from:)(a1, a2);
}

uint64_t sub_21C1C7ED0(_QWORD *a1)
{
  return NewsChannelTheme.encode(to:)(a1);
}

uint64_t static NewsChannelTheme.== infix(_:_:)()
{
  sub_21C1C80D4();
  if ((sub_21C1D9444() & 1) != 0)
    return sub_21C1D9444() & 1;
  else
    return 0;
}

uint64_t sub_21C1C7F48()
{
  sub_21C1C80D4();
  if ((sub_21C1D9444() & 1) != 0)
    return sub_21C1D9444() & 1;
  else
    return 0;
}

uint64_t sub_21C1C7FAC()
{
  return swift_deallocObject();
}

id sub_21C1C7FC0(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_21C1C8010()
{
  return swift_deallocObject();
}

id sub_21C1C8020(void *a1)
{
  double *v1;

  return sub_21C1D757C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

void sub_21C1C8034(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21C1C7A58();
    v7 = a3(a1, &type metadata for NewsChannelTheme.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_21C1C8090()
{
  unint64_t result;

  result = qword_255246910;
  if (!qword_255246910)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA48C, &type metadata for RGBAColor);
    atomic_store(result, (unint64_t *)&qword_255246910);
  }
  return result;
}

unint64_t sub_21C1C80D4()
{
  unint64_t result;

  result = qword_255246918;
  if (!qword_255246918)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255246918);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for NewsChannelTheme(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for NewsChannelTheme(id *a1)
{

}

uint64_t assignWithCopy for NewsChannelTheme(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for NewsChannelTheme(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannelTheme(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NewsChannelTheme(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NewsChannelTheme()
{
  return &type metadata for NewsChannelTheme;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NewsChannelTheme.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NewsChannelTheme.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1C8380 + 4 * byte_21C1DA2C9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C1C83B4 + 4 * byte_21C1DA2C4[v4]))();
}

uint64_t sub_21C1C83B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1C83BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1C83C4);
  return result;
}

uint64_t sub_21C1C83D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1C83D8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C1C83DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1C83E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1C83F0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21C1C83F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannelTheme.CodingKeys()
{
  return &type metadata for NewsChannelTheme.CodingKeys;
}

unint64_t sub_21C1C8414()
{
  unint64_t result;

  result = qword_255246920;
  if (!qword_255246920)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA3FC, &type metadata for NewsChannelTheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246920);
  }
  return result;
}

unint64_t sub_21C1C845C()
{
  unint64_t result;

  result = qword_255246928;
  if (!qword_255246928)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA36C, &type metadata for NewsChannelTheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246928);
  }
  return result;
}

unint64_t sub_21C1C84A4()
{
  unint64_t result;

  result = qword_255246930;
  if (!qword_255246930)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA394, &type metadata for NewsChannelTheme.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246930);
  }
  return result;
}

uint64_t sub_21C1C84E8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL;
  if (v3 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021C1DB700 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F726765726F66 && a2 == 0xEF726F6C6F43646ELL || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021C1DB720)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21C1D9594();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t initializeBufferWithCopyOfBuffer for RGBAColor(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for RGBAColor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RGBAColor(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RGBAColor()
{
  return &type metadata for RGBAColor;
}

uint64_t sub_21C1C8748(char a1)
{
  return qword_21C1DA5F0[a1];
}

uint64_t sub_21C1C8768(_QWORD *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  char v18;
  double v19;

  sub_21C1C8E08(0, &qword_255246950, MEMORY[0x24BEE3520]);
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v17 - v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C8D80();
  sub_21C1D960C();
  v19 = a2;
  v18 = 0;
  sub_21C1C8E64();
  sub_21C1D957C();
  if (!v5)
  {
    v19 = a3;
    v18 = 1;
    sub_21C1D957C();
    v19 = a4;
    v18 = 2;
    sub_21C1D957C();
    v19 = a5;
    v18 = 3;
    sub_21C1D957C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_21C1C8938()
{
  char *v0;

  return sub_21C1C8748(*v0);
}

uint64_t sub_21C1C8940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C1C89FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C1C8964()
{
  sub_21C1C8D80();
  return sub_21C1D9618();
}

uint64_t sub_21C1C898C()
{
  sub_21C1C8D80();
  return sub_21C1D9624();
}

void sub_21C1C89B4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_21C1C8B6C(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 24) = v7;
  }
}

uint64_t sub_21C1C89E0(_QWORD *a1)
{
  double *v1;

  return sub_21C1C8768(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_21C1C89FC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v3 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6168706C61 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21C1D9594();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

double sub_21C1C8B6C(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  double v11;

  sub_21C1C8E08(0, &qword_255246938, MEMORY[0x24BEE33E0]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C8D80();
  sub_21C1D9600();
  if (!v1)
  {
    HIBYTE(v10) = 0;
    sub_21C1C8DC4();
    sub_21C1D954C();
    v2 = v11;
    HIBYTE(v10) = 1;
    sub_21C1D954C();
    HIBYTE(v10) = 2;
    sub_21C1D954C();
    HIBYTE(v10) = 3;
    sub_21C1D954C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v2;
}

unint64_t sub_21C1C8D80()
{
  unint64_t result;

  result = qword_255246940;
  if (!qword_255246940)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA5A0, &type metadata for RGBAColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246940);
  }
  return result;
}

unint64_t sub_21C1C8DC4()
{
  unint64_t result;

  result = qword_255246948;
  if (!qword_255246948)
  {
    result = MEMORY[0x220774CC4](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255246948);
  }
  return result;
}

void sub_21C1C8E08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21C1C8D80();
    v7 = a3(a1, &type metadata for RGBAColor.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_21C1C8E64()
{
  unint64_t result;

  result = qword_255246958;
  if (!qword_255246958)
  {
    result = MEMORY[0x220774CC4](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255246958);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RGBAColor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1C8EF4 + 4 * byte_21C1DA47D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C1C8F28 + 4 * byte_21C1DA478[v4]))();
}

uint64_t sub_21C1C8F28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1C8F30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1C8F38);
  return result;
}

uint64_t sub_21C1C8F44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1C8F4CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C1C8F50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1C8F58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RGBAColor.CodingKeys()
{
  return &type metadata for RGBAColor.CodingKeys;
}

unint64_t sub_21C1C8F78()
{
  unint64_t result;

  result = qword_255246960;
  if (!qword_255246960)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA578, &type metadata for RGBAColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246960);
  }
  return result;
}

unint64_t sub_21C1C8FC0()
{
  unint64_t result;

  result = qword_255246968;
  if (!qword_255246968)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA4E8, &type metadata for RGBAColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246968);
  }
  return result;
}

unint64_t sub_21C1C9008()
{
  unint64_t result;

  result = qword_255246970;
  if (!qword_255246970)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA510, &type metadata for RGBAColor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246970);
  }
  return result;
}

unint64_t sub_21C1C904C(uint64_t a1)
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
  sub_21C1C9294();
  v2 = sub_21C1D94F8();
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
    sub_21C1C9380(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_21C1C9300(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21C1C942C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t type metadata accessor for ArticleRouter()
{
  return objc_opt_self();
}

void sub_21C1C9180()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_21C1D8CC4();
  sub_21C1C904C(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_21C1C924C();
  v2 = (id)sub_21C1D9390();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

unint64_t sub_21C1C924C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255246EA0;
  if (!qword_255246EA0)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    result = MEMORY[0x220774CC4](&unk_21C1D9D24, v1);
    atomic_store(result, (unint64_t *)&qword_255246EA0);
  }
  return result;
}

void sub_21C1C9294()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255246A10)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    sub_21C1C924C();
    v0 = sub_21C1D9504();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255246A10);
  }
}

unint64_t sub_21C1C9300(uint64_t a1)
{
  uint64_t v2;

  sub_21C1D93CC();
  sub_21C1D95DC();
  sub_21C1D93D8();
  v2 = sub_21C1D95F4();
  swift_bridgeObjectRelease();
  return sub_21C1C943C(a1, v2);
}

uint64_t sub_21C1C9380(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1C93C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21C1C93C4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255246A18)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255246A18);
  }
}

_OWORD *sub_21C1C942C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21C1C943C(uint64_t a1, uint64_t a2)
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
    v6 = sub_21C1D93CC();
    v8 = v7;
    if (v6 == sub_21C1D93CC() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21C1D9594();
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
          v13 = sub_21C1D93CC();
          v15 = v14;
          if (v13 == sub_21C1D93CC() && v15 == v16)
            break;
          v18 = sub_21C1D9594();
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

id sub_21C1C95B0()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for WebViewControllerFactory()), sel_init);
}

uint64_t type metadata accessor for FactoryAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1C95F4()
{
  sub_21C1D8FAC();
  sub_21C1C9644();
  sub_21C1D8FF4();
  swift_release();
  return swift_release();
}

unint64_t sub_21C1C9644()
{
  unint64_t result;

  result = qword_253F4BD28;
  if (!qword_253F4BD28)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253F4BD28);
  }
  return result;
}

_QWORD *sub_21C1C9698()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for NewsService();
  v0 = swift_allocObject();
  result = sub_21C1C9710();
  qword_253F4B480 = v0;
  return result;
}

uint64_t static NewsService.shared.getter()
{
  if (qword_253F4B490 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_21C1C9710()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  id v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  if (qword_253F4B548 != -1)
    swift_once();
  v2 = sub_21C1CD4D4();
  v3 = objc_msgSend(v2, sel_tagController);
  result = objc_msgSend(v2, sel_subscriptionController);
  if (result)
  {
    v5 = sub_21C1D92F4();
    swift_allocObject();
    v6 = sub_21C1D92E8();
    v7 = MEMORY[0x24BE6CEA8];
    v13 = v5;
    v14 = MEMORY[0x24BE6CEA8];
    *(_QWORD *)&v12 = v6;
    swift_retain();
    v8 = objc_msgSend(v2, sel_news_core_ConfigurationManager);
    result = objc_msgSend(v2, sel_paidAccessChecker);
    if (result)
    {
      v9 = sub_21C1D930C();
      swift_allocObject();
      v10 = v2;
      v11 = sub_21C1D9300();
      v1[5] = v5;
      v1[6] = v7;
      v1[2] = v6;
      v13 = v9;
      v14 = MEMORY[0x24BE6CEC8];

      *(_QWORD *)&v12 = v11;
      sub_21C1CB538(&v12, (uint64_t)(v1 + 7));
      return v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t NewsService.storeFrontID.getter()
{
  id v0;
  id v1;
  uint64_t v2;

  if (qword_253F4B548 != -1)
    swift_once();
  v0 = sub_21C1CD4D4();
  v1 = objc_msgSend(v0, sel_contentStoreFrontID);

  v2 = sub_21C1D93CC();
  return v2;
}

uint64_t NewsService.fetchArticles(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_21C1C9960()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0[3] + 16);
  if (!v1)
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_15;
  }
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *(v2 - 1);
    v4 = *v2;
    swift_bridgeObjectRetain();
    v6 = (void *)sub_21C1D93A8();
    v7 = objc_msgSend(v6, sel_fc_isValidArticleID);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)sub_21C1D93A8();
      v9 = (id)FCArticleCloudKitIDFromUUID();

      if (!v9)
      {
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
      v5 = sub_21C1D93CC();
      v11 = v10;

      swift_bridgeObjectRelease();
      v4 = v11;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_21C1CA64C(0, v3[2] + 1, 1, v3);
    v13 = v3[2];
    v12 = v3[3];
    if (v13 >= v12 >> 1)
      v3 = sub_21C1CA64C((_QWORD *)(v12 > 1), v13 + 1, 1, v3);
    v3[2] = v13 + 1;
    v14 = &v3[2 * v13];
    v14[4] = v5;
    v14[5] = v4;
LABEL_4:
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
LABEL_15:
  v0[5] = v3;
  v15 = v0[4];
  v16 = swift_task_alloc();
  v0[6] = v16;
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v3;
  v17 = (_QWORD *)swift_task_alloc();
  v0[7] = v17;
  sub_21C1C7098(0, &qword_253F4B280, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x24BEE1250]);
  *v17 = v0;
  v17[1] = sub_21C1C9B68;
  return sub_21C1D95A0();
}

uint64_t sub_21C1C9B68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_21C1C9BDC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21C1C9BE8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C1C9C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, char *, uint64_t);
  void *v14;
  uint64_t v15;
  void *v16;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v19 = a1;
  sub_21C1CB0F4();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a2;
  v21 = a3;
  sub_21C1C7098(0, (unint64_t *)&unk_253F4B288, (uint64_t (*)(uint64_t))sub_21C1CB1E4, MEMORY[0x24BEE1250]);
  sub_21C1D9054();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v10, a1, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, v7);
  v14 = (void *)sub_21C1D9018();
  sub_21C1D9024();
  swift_release();
  swift_release();

  v18(v10, v19, v7);
  v15 = swift_allocObject();
  v13(v15 + v11, v10, v7);
  v16 = (void *)sub_21C1D9018();
  sub_21C1D9030();
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t sub_21C1C9DF0(uint64_t a1)
{
  id v1;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCachePolicy);
  v2 = sub_21C1D9318();

  return v2;
}

uint64_t sub_21C1C9E94(unint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _DWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t ObjectType;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD v59[4];
  __int128 v60;
  unint64_t v61;
  uint64_t v62;
  _DWORD *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;

  v59[1] = a2;
  v71 = type metadata accessor for NewsChannel();
  MEMORY[0x24BDAC7A8](v71);
  v70 = (_QWORD *)((char *)v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21C1C7098(0, &qword_253F4B188, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)v59 - v5);
  v69 = type metadata accessor for NewsArticle();
  v72 = *(_QWORD *)(v69 - 8);
  v7 = MEMORY[0x24BDAC7A8](v69);
  v68 = (uint64_t)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v62 = (uint64_t)v59 - v9;
  v10 = *a1;
  v74 = MEMORY[0x24BEE4AF8];
  if (v10 >> 62)
    goto LABEL_24;
  v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v65 = v6;
  if (v11)
  {
    while (1)
    {
      v13 = 0;
      v66 = v10 & 0xFFFFFFFFFFFFFF8;
      v67 = v10 & 0xC000000000000001;
      *(_QWORD *)&v12 = 136446210;
      v60 = v12;
      v59[3] = MEMORY[0x24BEE4AD8] + 8;
      v61 = v10;
      while (v67)
      {
        v14 = (void *)MEMORY[0x220774820](v13, v10);
        v15 = v13 + 1;
        if (__OFADD__(v13, 1))
          goto LABEL_23;
LABEL_9:
        if ((objc_msgSend(v14, sel_isPaid) & 1) != 0
          || (objc_msgSend(v14, sel_respondsToSelector_, sel_isBundlePaid) & 1) != 0
          && (objc_msgSend(v14, sel_isBundlePaid) & 1) != 0)
        {
          if (qword_255245F10 != -1)
            swift_once();
          v16 = sub_21C1D912C();
          __swift_project_value_buffer(v16, (uint64_t)qword_255249570);
          swift_unknownObjectRetain_n();
          v17 = sub_21C1D9114();
          v18 = sub_21C1D942C();
          if (os_log_type_enabled(v17, v18))
          {
            v19 = (_DWORD *)swift_slowAlloc();
            v63 = v19;
            v64 = swift_slowAlloc();
            v73 = v64;
            *v19 = v60;
            v20 = objc_msgSend(v14, sel_identifier);
            v21 = v11;
            v22 = sub_21C1D93CC();
            v24 = v23;

            v6 = v65;
            v25 = v22;
            v11 = v21;
            v26 = sub_21C1CA9AC(v25, v24, &v73);
            v27 = (uint8_t *)v63;
            *(_QWORD *)(v63 + 1) = v26;
            swift_unknownObjectRelease_n();
            v10 = v61;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21C1C1000, v17, v18, "NewsService filtered paid headline, id=%{public}s", v27, 0xCu);
            v28 = v64;
            swift_arrayDestroy();
            MEMORY[0x220774D3C](v28, -1, -1);
            MEMORY[0x220774D3C](v27, -1, -1);
            swift_unknownObjectRelease();

          }
          else
          {

            swift_unknownObjectRelease_n();
          }
        }
        else
        {
          sub_21C1D94A4();
          sub_21C1D94BC();
          sub_21C1D94C8();
          sub_21C1D94B0();
        }
        ++v13;
        if (v15 == v11)
        {
          v29 = v74;
          goto LABEL_26;
        }
      }
      if (v13 < *(_QWORD *)(v66 + 16))
        break;
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
      v11 = sub_21C1D94EC();
      v65 = v6;
      if (!v11)
        goto LABEL_25;
    }
    v14 = *(void **)(v10 + 8 * v13 + 32);
    swift_unknownObjectRetain();
    v15 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_23;
    goto LABEL_9;
  }
LABEL_25:
  v29 = MEMORY[0x24BEE4AF8];
LABEL_26:
  swift_bridgeObjectRelease();
  if ((v29 & 0x8000000000000000) == 0 && (v29 & 0x4000000000000000) == 0)
  {
    v30 = *(_QWORD *)(v29 + 16);
    result = swift_retain();
    if (v30)
      goto LABEL_29;
LABEL_49:
    v33 = MEMORY[0x24BEE4AF8];
LABEL_50:
    swift_release_n();
    v74 = v33;
    sub_21C1CB0F4();
    return sub_21C1D9414();
  }
  swift_retain();
  result = sub_21C1D94EC();
  v30 = result;
  if (!result)
    goto LABEL_49;
LABEL_29:
  if (v30 >= 1)
  {
    v32 = 0;
    v67 = v29 & 0xC000000000000001;
    v33 = MEMORY[0x24BEE4AF8];
    v66 = v30;
    do
    {
      if (v67)
      {
        v34 = (void *)MEMORY[0x220774820](v32, v29);
      }
      else
      {
        v34 = *(void **)(v29 + 8 * v32 + 32);
        swift_unknownObjectRetain();
      }
      v35 = objc_msgSend(v34, sel_sourceChannel);
      if (v35)
      {
        v36 = v35;
        v37 = v29;
        swift_unknownObjectRetain();
        v38 = objc_msgSend((id)swift_unknownObjectRetain(), sel_identifier);
        v39 = sub_21C1D93CC();
        v41 = v40;

        v42 = v70;
        *v70 = v39;
        v42[1] = v41;
        v43 = objc_msgSend(v36, sel_name);
        v44 = sub_21C1D93CC();
        v46 = v45;

        v42[2] = v44;
        v42[3] = v46;
        v47 = objc_msgSend(v36, sel_theme);
        sub_21C1D4FD8(v47, (double *)((char *)v42 + *(int *)(v71 + 24)));
        if (objc_msgSend(v36, sel_theme))
        {
          ObjectType = swift_getObjectType();
          v49 = sub_21C1CEB08(ObjectType);
          v50 = sub_21C1CEB24(ObjectType);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
          v49 = 0;
          v50 = 0;
        }
        v52 = (uint64_t)v70;
        v53 = (uint64_t *)((char *)v70 + *(int *)(v71 + 28));
        *v53 = v49;
        v53[1] = v50;
        v6 = v65;
        sub_21C1D0C28(v34, v52, v65);
        swift_unknownObjectRelease();
        v51 = 0;
        v29 = v37;
        v30 = v66;
      }
      else
      {
        v51 = 1;
      }
      v54 = v72;
      v55 = v69;
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v6, v51, 1, v69);
      swift_unknownObjectRelease();
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v54 + 48))(v6, 1, v55) == 1)
      {
        sub_21C1CB34C((uint64_t)v6);
      }
      else
      {
        v56 = v62;
        sub_21C1C4B18((uint64_t)v6, v62);
        sub_21C1C4B18(v56, v68);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v33 = sub_21C1CA790(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
        v58 = *(_QWORD *)(v33 + 16);
        v57 = *(_QWORD *)(v33 + 24);
        if (v58 >= v57 >> 1)
          v33 = sub_21C1CA790(v57 > 1, v58 + 1, 1, v33);
        *(_QWORD *)(v33 + 16) = v58 + 1;
        sub_21C1C4B18(v68, v33+ ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))+ *(_QWORD *)(v72 + 72) * v58);
      }
      ++v32;
    }
    while (v30 != v32);
    goto LABEL_50;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C1CA5B4(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C1CB0F4();
  return sub_21C1D9408();
}

uint64_t NewsService.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t NewsService.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_21C1CA644(uint64_t a1)
{
  uint64_t v1;

  return sub_21C1C9C24(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_QWORD *sub_21C1CA64C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C1CB4F4(0, &qword_253F4B2C0);
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
    sub_21C1CB004(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for NewsService()
{
  return objc_opt_self();
}

uint64_t method lookup function for NewsService()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21C1CA790(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_21C1C7098(0, (unint64_t *)&unk_253F4B2B0, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(type metadata accessor for NewsArticle() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21C1D94D4();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for NewsArticle() - 8);
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
    sub_21C1CB3A0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_21C1CA9AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21C1CAA7C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21C1CB4B8((uint64_t)v12, *a3);
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
      sub_21C1CB4B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21C1CAA7C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C1D945C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21C1CAC34(a5, a6);
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
  v8 = sub_21C1D9498();
  if (!v8)
  {
    sub_21C1D94D4();
    __break(1u);
LABEL_17:
    result = sub_21C1D9510();
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

uint64_t sub_21C1CAC34(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21C1CACC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21C1CAEAC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21C1CAEAC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C1CACC8(uint64_t a1, unint64_t a2)
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
      v3 = sub_21C1CAE3C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21C1D9480();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21C1D94D4();
      __break(1u);
LABEL_10:
      v2 = sub_21C1D93E4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21C1D9510();
    __break(1u);
LABEL_14:
    result = sub_21C1D94D4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21C1CAE3C(uint64_t a1, uint64_t a2)
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
  sub_21C1CB4F4(0, &qword_255246A98);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C1CAEAC(char a1, int64_t a2, char a3, char *a4)
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
    sub_21C1CB4F4(0, &qword_255246A98);
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
  result = sub_21C1D9510();
  __break(1u);
  return result;
}

uint64_t sub_21C1CB004(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_21C1D9510();
  __break(1u);
  return result;
}

void sub_21C1CB0F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F4B298)
  {
    sub_21C1C7098(255, &qword_253F4B280, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, MEMORY[0x24BEE1250]);
    sub_21C1CB178();
    v0 = sub_21C1D9420();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F4B298);
  }
}

unint64_t sub_21C1CB178()
{
  unint64_t result;

  result = qword_253F4B2D0;
  if (!qword_253F4B2D0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253F4B2D0);
  }
  return result;
}

uint64_t sub_21C1CB1CC()
{
  uint64_t v0;

  return sub_21C1C9DF0(*(_QWORD *)(v0 + 16));
}

unint64_t sub_21C1CB1E4()
{
  unint64_t result;

  result = qword_253F4B2A0;
  if (!qword_253F4B2A0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253F4B2A0);
  }
  return result;
}

uint64_t sub_21C1CB23C(unint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_21C1CB0F4();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return sub_21C1C9E94(a1, v1 + ((v4 + 16) & ~v4));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;

  sub_21C1CB0F4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_21C1CB2F8(void *a1)
{
  sub_21C1CB0F4();
  return sub_21C1CA5B4(a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21C1CB34C(uint64_t a1)
{
  uint64_t v2;

  sub_21C1C7098(0, &qword_253F4B188, (uint64_t (*)(uint64_t))type metadata accessor for NewsArticle, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C1CB3A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for NewsArticle() - 8);
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
  result = sub_21C1D9510();
  __break(1u);
  return result;
}

uint64_t sub_21C1CB4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_21C1CB4F4(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_21C1D9588();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_21C1CB538(__int128 *a1, uint64_t a2)
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

BOOL static NewsChannel.LogoTheme.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NewsChannel.LogoTheme.hash(into:)()
{
  return sub_21C1D95E8();
}

uint64_t NewsChannel.LogoTheme.hashValue.getter()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

uint64_t NewsChannel.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsChannel.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsChannel.logo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for NewsChannel();
  return sub_21C1C4D80(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannelLogoCollection);
}

uint64_t type metadata accessor for NewsChannel()
{
  uint64_t result;

  result = qword_253F4B1E8;
  if (!qword_253F4B1E8)
    return swift_getSingletonMetadata();
  return result;
}

id NewsChannel.theme.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = v1 + *(int *)(type metadata accessor for NewsChannel() + 28);
  v4 = *(void **)v3;
  v5 = *(void **)(v3 + 8);
  *a1 = *(_QWORD *)v3;
  a1[1] = v5;
  return sub_21C1CB6DC(v4, v5);
}

id sub_21C1CB6DC(id result, void *a2)
{
  id v2;

  if (result)
  {
    v2 = result;
    return a2;
  }
  return result;
}

uint64_t sub_21C1CB708(char a1)
{
  return qword_21C1DA9A8[a1];
}

uint64_t sub_21C1CB728()
{
  char *v0;

  return sub_21C1CB708(*v0);
}

uint64_t sub_21C1CB730@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C1CD340(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C1CB754()
{
  sub_21C1CB968();
  return sub_21C1D9618();
}

uint64_t sub_21C1CB77C()
{
  sub_21C1CB968();
  return sub_21C1D9624();
}

uint64_t NewsChannel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE v12[16];
  __int128 v13;

  v3 = v1;
  sub_21C1CBD1C(0, &qword_255246AA0, MEMORY[0x24BEE3520]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v12[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1CB968();
  sub_21C1D960C();
  LOBYTE(v13) = 0;
  sub_21C1D9564();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_21C1D9564();
    v10 = type metadata accessor for NewsChannel();
    LOBYTE(v13) = 2;
    type metadata accessor for NewsChannelLogoCollection();
    sub_21C1CBD78(&qword_255246AB0, (uint64_t)&protocol conformance descriptor for NewsChannelLogoCollection);
    sub_21C1D957C();
    v13 = *(_OWORD *)(v3 + *(int *)(v10 + 28));
    v12[15] = 3;
    sub_21C1CB9AC();
    sub_21C1D9558();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_21C1CB968()
{
  unint64_t result;

  result = qword_255246AA8;
  if (!qword_255246AA8)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA954, &type metadata for NewsChannel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246AA8);
  }
  return result;
}

unint64_t sub_21C1CB9AC()
{
  unint64_t result;

  result = qword_255246AB8;
  if (!qword_255246AB8)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsChannelTheme, &type metadata for NewsChannelTheme);
    atomic_store(result, (unint64_t *)&qword_255246AB8);
  }
  return result;
}

uint64_t NewsChannel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  char v25;

  v19 = a2;
  v21 = type metadata accessor for NewsChannelLogoCollection();
  MEMORY[0x24BDAC7A8](v21);
  v20 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1CBD1C(0, &qword_255246AC0, MEMORY[0x24BEE33E0]);
  v22 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - v6;
  v8 = type metadata accessor for NewsChannel();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1CB968();
  v11 = (uint64_t)v23;
  sub_21C1D9600();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = a1;
  v12 = (uint64_t)v20;
  v13 = v5;
  LOBYTE(v24) = 0;
  v14 = v22;
  *v10 = sub_21C1D9534();
  v10[1] = v15;
  LOBYTE(v24) = 1;
  v10[2] = sub_21C1D9534();
  v10[3] = v16;
  LOBYTE(v24) = 2;
  sub_21C1CBD78(&qword_255246AC8, (uint64_t)&protocol conformance descriptor for NewsChannelLogoCollection);
  sub_21C1D954C();
  sub_21C1CBDB8(v12, (uint64_t)v10 + *(int *)(v8 + 24));
  v25 = 3;
  sub_21C1CBDFC();
  sub_21C1D9528();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  *(_OWORD *)((char *)v10 + *(int *)(v8 + 28)) = v24;
  sub_21C1C4D80((uint64_t)v10, v19, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return sub_21C1CBE40((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannel);
}

void sub_21C1CBD1C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21C1CB968();
    v7 = a3(a1, &type metadata for NewsChannel.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_21C1CBD78(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for NewsChannelLogoCollection();
    result = MEMORY[0x220774CC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21C1CBDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsChannelLogoCollection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21C1CBDFC()
{
  unint64_t result;

  result = qword_255246AD0;
  if (!qword_255246AD0)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsChannelTheme, &type metadata for NewsChannelTheme);
    atomic_store(result, (unint64_t *)&qword_255246AD0);
  }
  return result;
}

uint64_t sub_21C1CBE40(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21C1CBE7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsChannel.init(from:)(a1, a2);
}

uint64_t sub_21C1CBE90(_QWORD *a1)
{
  return NewsChannel.encode(to:)(a1);
}

uint64_t sub_21C1CBEAC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

BOOL _s7NewsKit0A7ChannelV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_21C1D9594(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_21C1D9594(), result = 0, (v8 & 1) != 0))
    {
      v9 = type metadata accessor for NewsChannel();
      if ((static NewsChannelLogoCollection.== infix(_:_:)((char *)a1 + *(int *)(v9 + 24), (char *)a2 + *(int *)(v9 + 24)) & 1) == 0)return 0;
      v10 = *(int *)(v9 + 28);
      v12 = *(void **)((char *)a1 + v10);
      v11 = *(void **)((char *)a1 + v10 + 8);
      v13 = (char *)a2 + v10;
      v15 = *(void **)v13;
      v14 = (void *)*((_QWORD *)v13 + 1);
      if (v12)
      {
        if (v15)
        {
          sub_21C1C80D4();
          sub_21C1CB6DC(v12, v11);
          sub_21C1CB6DC(v12, v11);
          sub_21C1CB6DC(v15, v14);
          if ((sub_21C1D9444() & 1) != 0)
          {
            v16 = sub_21C1D9444();
            sub_21C1CD4A0(v15, v14);

            sub_21C1CD4A0(v12, v11);
            return (v16 & 1) != 0;
          }
          sub_21C1CD4A0(v15, v14);

          v19 = v12;
          v20 = v11;
          goto LABEL_22;
        }
        v17 = v12;
        v18 = v11;
      }
      else if (!v15)
      {
        return 1;
      }
      sub_21C1CB6DC(v15, v14);
      sub_21C1CD4A0(v12, v11);
      v19 = v15;
      v20 = v14;
LABEL_22:
      sub_21C1CD4A0(v19, v20);
      return 0;
    }
  }
  return result;
}

unint64_t sub_21C1CC050()
{
  unint64_t result;

  result = qword_255246AD8;
  if (!qword_255246AD8)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsChannel.LogoTheme, &type metadata for NewsChannel.LogoTheme);
    atomic_store(result, (unint64_t *)&qword_255246AD8);
  }
  return result;
}

uint64_t sub_21C1CC094()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t *initializeBufferWithCopyOfBuffer for NewsChannel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  char *__dst;
  uint64_t v37;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    v11 = type metadata accessor for NewsChannelLogoCollection();
    v12 = *(int *)(v11 + 20);
    __dst = &v9[v12];
    v37 = v11;
    v13 = &v10[v12];
    v14 = sub_21C1D8CE8();
    v15 = *(_QWORD *)(v14 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v13, 1, v14))
    {
      sub_21C1C4C44();
      memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    v19 = v15;
    v20 = *(int *)(v37 + 24);
    v21 = &v9[v20];
    v22 = &v10[v20];
    if (v16(&v10[v20], 1, v14))
    {
      sub_21C1C4C44();
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v21, v22, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
    }
    v24 = *(int *)(v37 + 28);
    v25 = &v9[v24];
    v26 = &v10[v24];
    if (v16(&v10[v24], 1, v14))
    {
      sub_21C1C4C44();
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v26, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v14);
    }
    v28 = *(int *)(a3 + 28);
    v29 = (uint64_t *)((char *)v4 + v28);
    v30 = (char *)a2 + v28;
    v31 = *(void **)((char *)a2 + v28);
    if (v31)
    {
      v32 = (void *)*((_QWORD *)v30 + 1);
      *v29 = v31;
      v29[1] = v32;
      v33 = v31;
      v34 = v32;
    }
    else
    {
      *(_OWORD *)v29 = *(_OWORD *)v30;
    }
  }
  return v4;
}

void destroy for NewsChannel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  id *v12;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v6 = v4 + v5[5];
  v7 = sub_21C1D8CE8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v10 = v4 + v5[6];
  if (!v9(v10, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  v11 = v4 + v5[7];
  if (!v9(v11, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  v12 = (id *)(a1 + *(int *)(a2 + 28));
  if (*v12)
  {

  }
}

_QWORD *initializeWithCopy for NewsChannel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  char *__dst;
  uint64_t v35;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for NewsChannelLogoCollection();
  v11 = *(int *)(v10 + 20);
  __dst = &v8[v11];
  v35 = v10;
  v12 = &v9[v11];
  v13 = sub_21C1D8CE8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    sub_21C1C4C44();
    memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(__dst, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(__dst, 0, 1, v13);
  }
  v17 = v14;
  v18 = *(int *)(v35 + 24);
  v19 = &v8[v18];
  v20 = &v9[v18];
  if (v15(&v9[v18], 1, v13))
  {
    sub_21C1C4C44();
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v19, v20, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v19, 0, 1, v13);
  }
  v22 = *(int *)(v35 + 28);
  v23 = &v8[v22];
  v24 = &v9[v22];
  if (v15(&v9[v22], 1, v13))
  {
    sub_21C1C4C44();
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v23, v24, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v23, 0, 1, v13);
  }
  v26 = *(int *)(a3 + 28);
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (char *)a2 + v26;
  v29 = *(void **)((char *)a2 + v26);
  if (v29)
  {
    v30 = (void *)*((_QWORD *)v28 + 1);
    *v27 = v29;
    v27[1] = v30;
    v31 = v29;
    v32 = v30;
  }
  else
  {
    *(_OWORD *)v27 = *(_OWORD *)v28;
  }
  return a1;
}

_QWORD *assignWithCopy for NewsChannel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v43;
  uint64_t v44;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = a3;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_21C1D8CE8();
  v44 = *(_QWORD *)(v13 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  v15 = v14(v11, 1, v13);
  v16 = v14(v12, 1, v13);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v13);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 24))(v11, v12, v13);
LABEL_7:
  v18 = v9[6];
  v19 = &v7[v18];
  v20 = &v8[v18];
  v21 = v14(&v7[v18], 1, v13);
  v22 = v14(v20, 1, v13);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v19, v20, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v19, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v13);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 24))(v19, v20, v13);
LABEL_13:
  v24 = v9[7];
  v25 = &v7[v24];
  v26 = &v8[v24];
  v27 = v14(&v7[v24], 1, v13);
  v28 = v14(v26, 1, v13);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v25, v26, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v25, 0, 1, v13);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v13);
LABEL_18:
    sub_21C1C4C44();
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 24))(v25, v26, v13);
LABEL_19:
  v30 = *(int *)(v43 + 28);
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  v33 = *(void **)((char *)a1 + v30);
  v34 = *(void **)v32;
  if (!v33)
  {
    if (v34)
    {
      *(_QWORD *)v31 = v34;
      v39 = (void *)*((_QWORD *)v32 + 1);
      *((_QWORD *)v31 + 1) = v39;
      v40 = v34;
      v41 = v39;
      return a1;
    }
LABEL_25:
    *(_OWORD *)v31 = *(_OWORD *)v32;
    return a1;
  }
  if (!v34)
  {
    sub_21C1C5F08((id *)v31);
    goto LABEL_25;
  }
  *(_QWORD *)v31 = v34;
  v35 = v34;

  v36 = (void *)*((_QWORD *)v32 + 1);
  v37 = (void *)*((_QWORD *)v31 + 1);
  *((_QWORD *)v31 + 1) = v36;
  v38 = v36;

  return a1;
}

_OWORD *initializeWithTake for NewsChannel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_21C1D8CE8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    sub_21C1C4C44();
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  v17 = v9[6];
  v18 = &v7[v17];
  v19 = &v8[v17];
  if (v15(&v8[v17], 1, v13))
  {
    sub_21C1C4C44();
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v19, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  v21 = v9[7];
  v22 = &v7[v21];
  v23 = &v8[v21];
  if (v15(&v8[v21], 1, v13))
  {
    sub_21C1C4C44();
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v23, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v22, 0, 1, v13);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

_QWORD *assignWithTake for NewsChannel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  char *v34;
  void *v35;
  id v36;
  uint64_t v38;
  uint64_t v39;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v38 = a3;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  v11 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v12 = v11[5];
  v13 = &v9[v12];
  v14 = &v10[v12];
  v15 = sub_21C1D8CE8();
  v39 = *(_QWORD *)(v15 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
  v17 = v16(v13, 1, v15);
  v18 = v16(v14, 1, v15);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v15);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 40))(v13, v14, v15);
LABEL_7:
  v20 = v11[6];
  v21 = &v9[v20];
  v22 = &v10[v20];
  v23 = v16(&v9[v20], 1, v15);
  v24 = v16(v22, 1, v15);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v21, v22, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v21, 0, 1, v15);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v21, v15);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 40))(v21, v22, v15);
LABEL_13:
  v26 = v11[7];
  v27 = &v9[v26];
  v28 = &v10[v26];
  v29 = v16(&v9[v26], 1, v15);
  v30 = v16(v28, 1, v15);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v27, v28, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v27, 0, 1, v15);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v15);
LABEL_18:
    sub_21C1C4C44();
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v39 + 40))(v27, v28, v15);
LABEL_19:
  v32 = *(int *)(v38 + 28);
  v33 = (id *)((char *)a1 + v32);
  v34 = (char *)a2 + v32;
  v35 = *(void **)((char *)a1 + v32);
  if (!v35)
  {
LABEL_23:
    *(_OWORD *)v33 = *(_OWORD *)v34;
    return a1;
  }
  if (!*(_QWORD *)v34)
  {
    sub_21C1C5F08(v33);
    goto LABEL_23;
  }
  *v33 = *(id *)v34;

  v36 = v33[1];
  v33[1] = (id)*((_QWORD *)v34 + 1);

  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1CCEC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for NewsChannelLogoCollection();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for NewsChannel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1CCF50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for NewsChannelLogoCollection();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21C1CCFC4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for NewsChannelLogoCollection();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NewsChannel.LogoTheme(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NewsChannel.LogoTheme(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1CD11C + 4 * byte_21C1DA6F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C1CD150 + 4 * byte_21C1DA6F0[v4]))();
}

uint64_t sub_21C1CD150(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1CD158(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1CD160);
  return result;
}

uint64_t sub_21C1CD16C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1CD174);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C1CD178(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1CD180(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannel.LogoTheme()
{
  return &type metadata for NewsChannel.LogoTheme;
}

uint64_t storeEnumTagSinglePayload for NewsChannel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1CD1E8 + 4 * byte_21C1DA6FF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C1CD21C + 4 * byte_21C1DA6FA[v4]))();
}

uint64_t sub_21C1CD21C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1CD224(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1CD22CLL);
  return result;
}

uint64_t sub_21C1CD238(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1CD240);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C1CD244(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1CD24C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannel.CodingKeys()
{
  return &type metadata for NewsChannel.CodingKeys;
}

unint64_t sub_21C1CD26C()
{
  unint64_t result;

  result = qword_255246AE0;
  if (!qword_255246AE0)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA92C, &type metadata for NewsChannel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246AE0);
  }
  return result;
}

unint64_t sub_21C1CD2B4()
{
  unint64_t result;

  result = qword_255246AE8;
  if (!qword_255246AE8)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA89C, &type metadata for NewsChannel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246AE8);
  }
  return result;
}

unint64_t sub_21C1CD2FC()
{
  unint64_t result;

  result = qword_255246AF0;
  if (!qword_255246AF0)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DA8C4, &type metadata for NewsChannel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246AF0);
  }
  return result;
}

uint64_t sub_21C1CD340(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1869049708 && a2 == 0xE400000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D656874 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21C1D9594();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

void sub_21C1CD4A0(void *a1, void *a2)
{
  if (a1)
  {

  }
}

id sub_21C1CD4D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id result;
  void *v25;
  id v26;
  uint64_t v27;

  v1 = v0;
  sub_21C1C4C44();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - v5;
  v7 = *(void **)(v0 + 72);
  if (v7)
  {
    v8 = *(id *)(v0 + 72);
LABEL_11:
    v26 = v7;
    return v8;
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CB30]), sel_initWithEnvironment_, sub_21C1CE94C());
  sub_21C1CDEFC();
  v11 = v10;
  v12 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v12)
  {
    v13 = v12;
    sub_21C1D8CDC();

    v14 = sub_21C1D8CE8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 0, 1, v14);
  }
  else
  {
    v15 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 1, 1, v15);
  }
  v16 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v16)
  {
    v17 = v16;
    sub_21C1D8CDC();

    v18 = sub_21C1D8CE8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 0, 1, v18);
  }
  else
  {
    v19 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 1, 1, v19);
  }
  v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PrivateDataActionProvider()), sel_init);
  v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StubAppActivityMonitor()), sel_init);
  v22 = objc_msgSend((id)objc_opt_self(), sel_defaultAvailability);
  v23 = objc_allocWithZone(MEMORY[0x24BE6CB18]);
  result = sub_21C1CE7A4(v9, v11, (uint64_t)v6, (uint64_t)v4, (uint64_t)v20, 0, (uint64_t)v21, 0xF87FFFFC1, 2, 0, 0, (uint64_t)v22, 0);
  if (result)
  {
    v25 = *(void **)(v1 + 72);
    *(_QWORD *)(v1 + 72) = result;
    v8 = result;

    v7 = 0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C1CD744()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for NewsKitModule();
  v0 = swift_allocObject();
  result = sub_21C1CD82C();
  qword_253F4C340 = v0;
  return result;
}

uint64_t sub_21C1CD77C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  swift_beginAccess();
  sub_21C1CE698(v1 + 24, (uint64_t)&v4);
  if (v5)
    return sub_21C1CB538(&v4, a1);
  sub_21C1CE5DC((uint64_t)&v4);
  sub_21C1D9078();
  sub_21C1CE6FC(a1, (uint64_t)&v4);
  swift_beginAccess();
  sub_21C1CE740((uint64_t)&v4, v1 + 24);
  return swift_endAccess();
}

uint64_t sub_21C1CD82C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t (*v16)(uint64_t);
  id v17;
  objc_class *v18;
  uint64_t (*v19)(uint64_t);
  id v20;
  objc_class *v21;
  uint64_t (*v22)(uint64_t);
  id v23;
  objc_class *v24;
  uint64_t (*v25)(uint64_t);
  id v26;
  objc_class *v27;
  uint64_t (*v28)(uint64_t);
  id v29;
  objc_class *v30;
  uint64_t (*v31)(uint64_t);
  id v32;
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
  uint64_t v55;

  v1 = v0;
  v2 = sub_21C1D9060();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8FA0();
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_QWORD *)(v0 + 56) = 0;
  swift_allocObject();
  *(_QWORD *)(v0 + 64) = sub_21C1D8F94();
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
  sub_21C1CE638(0, &qword_253F4BD48, &qword_253F4B340, MEMORY[0x24BEB44E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = 0;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21C1DA9F0;
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BE90720]), sel_init);
  v8 = sub_21C1D8FD0();
  swift_allocObject();
  v9 = sub_21C1D8FDC();
  v10 = MEMORY[0x24BEB4540];
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = v10;
  *(_QWORD *)(v7 + 32) = v9;
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6D318]), sel_init);
  swift_allocObject();
  v11 = sub_21C1D8FDC();
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = v10;
  *(_QWORD *)(v7 + 72) = v11;
  v12 = (objc_class *)sub_21C1D8FC4();
  v13 = objc_msgSend(objc_allocWithZone(v12), sel_init);
  v14 = MEMORY[0x24BEB44C0];
  *(_QWORD *)(v7 + 136) = v12;
  *(_QWORD *)(v7 + 144) = v14;
  *(_QWORD *)(v7 + 112) = v13;
  v15 = (objc_class *)sub_21C1D9180();
  v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BEB48B0];
  v17 = objc_msgSend(objc_allocWithZone(v15), sel_init);
  *(_QWORD *)(v7 + 176) = v15;
  *(_QWORD *)(v7 + 184) = sub_21C1C4064(&qword_253F4B398, v16, MEMORY[0x24BEB48A8]);
  *(_QWORD *)(v7 + 152) = v17;
  v18 = (objc_class *)sub_21C1D91D4();
  v19 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6C508];
  v20 = objc_msgSend(objc_allocWithZone(v18), sel_init);
  *(_QWORD *)(v7 + 216) = v18;
  *(_QWORD *)(v7 + 224) = sub_21C1C4064((unint64_t *)&unk_253F4B3C0, v19, MEMORY[0x24BE6C500]);
  *(_QWORD *)(v7 + 192) = v20;
  v21 = (objc_class *)sub_21C1D9384();
  v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6CF40];
  v23 = objc_msgSend(objc_allocWithZone(v21), sel_init);
  *(_QWORD *)(v7 + 256) = v21;
  *(_QWORD *)(v7 + 264) = sub_21C1C4064((unint64_t *)&unk_253F4BBF8, v22, MEMORY[0x24BE6CF38]);
  *(_QWORD *)(v7 + 232) = v23;
  v24 = (objc_class *)sub_21C1D8F40();
  v25 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6C650];
  v26 = objc_msgSend(objc_allocWithZone(v24), sel_init);
  *(_QWORD *)(v7 + 296) = v24;
  *(_QWORD *)(v7 + 304) = sub_21C1C4064((unint64_t *)&unk_253F4B320, v25, MEMORY[0x24BE6C648]);
  *(_QWORD *)(v7 + 272) = v26;
  v27 = (objc_class *)sub_21C1D9108();
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6D200];
  v29 = objc_msgSend(objc_allocWithZone(v27), sel_init);
  *(_QWORD *)(v7 + 336) = v27;
  *(_QWORD *)(v7 + 344) = sub_21C1C4064((unint64_t *)&unk_253F4B388, v28, MEMORY[0x24BE6D1F8]);
  *(_QWORD *)(v7 + 312) = v29;
  v30 = (objc_class *)sub_21C1D90E4();
  v31 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6CE48];
  v32 = objc_msgSend(objc_allocWithZone(v30), sel_init);
  *(_QWORD *)(v7 + 376) = v30;
  *(_QWORD *)(v7 + 384) = sub_21C1C4064(&qword_253F4B360, v31, MEMORY[0x24BE6CE40]);
  *(_QWORD *)(v7 + 352) = v32;
  sub_21C1CE638(0, (unint64_t *)&unk_253F4BD38, (unint64_t *)&unk_253F4B330, MEMORY[0x24BEB4360], v6);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_21C1DAA00;
  v34 = type metadata accessor for ArticleAssembly();
  v35 = swift_allocObject();
  *(_QWORD *)(v33 + 56) = v34;
  *(_QWORD *)(v33 + 64) = sub_21C1C4064(&qword_253F4B6B8, (uint64_t (*)(uint64_t))type metadata accessor for ArticleAssembly, (uint64_t)&unk_21C1DA28C);
  *(_QWORD *)(v33 + 32) = v35;
  v36 = type metadata accessor for AnalyticsAssembly();
  v37 = swift_allocObject();
  *(_QWORD *)(v33 + 96) = v36;
  *(_QWORD *)(v33 + 104) = sub_21C1C4064(&qword_253F4BAA0, (uint64_t (*)(uint64_t))type metadata accessor for AnalyticsAssembly, (uint64_t)&unk_21C1DA1C4);
  *(_QWORD *)(v33 + 72) = v37;
  v38 = type metadata accessor for FactoryAssembly();
  v39 = swift_allocObject();
  *(_QWORD *)(v33 + 136) = v38;
  *(_QWORD *)(v33 + 144) = sub_21C1C4064(&qword_253F4B758, (uint64_t (*)(uint64_t))type metadata accessor for FactoryAssembly, (uint64_t)&unk_21C1DA688);
  *(_QWORD *)(v33 + 112) = v39;
  v40 = type metadata accessor for NewsCoreAssembly();
  v41 = swift_allocObject();
  *(_QWORD *)(v33 + 176) = v40;
  *(_QWORD *)(v33 + 184) = sub_21C1C4064((unint64_t *)&unk_253F4B3D0, (uint64_t (*)(uint64_t))type metadata accessor for NewsCoreAssembly, (uint64_t)&unk_21C1DB494);
  *(_QWORD *)(v33 + 152) = v41;
  v42 = type metadata accessor for ProviderAssembly();
  v43 = swift_allocObject();
  *(_QWORD *)(v33 + 216) = v42;
  *(_QWORD *)(v33 + 224) = sub_21C1C4064(&qword_253F4B8A8, (uint64_t (*)(uint64_t))type metadata accessor for ProviderAssembly, (uint64_t)&unk_21C1DB3F4);
  *(_QWORD *)(v33 + 192) = v43;
  v44 = type metadata accessor for RouterAssembly();
  v45 = swift_allocObject();
  *(_QWORD *)(v33 + 256) = v44;
  *(_QWORD *)(v33 + 264) = sub_21C1C4064(&qword_253F4B610, (uint64_t (*)(uint64_t))type metadata accessor for RouterAssembly, (uint64_t)&unk_21C1DB42C);
  *(_QWORD *)(v33 + 232) = v45;
  v46 = type metadata accessor for ServicesAssembly();
  v47 = swift_allocObject();
  *(_QWORD *)(v33 + 296) = v46;
  *(_QWORD *)(v33 + 304) = sub_21C1C4064(&qword_253F4B948, (uint64_t (*)(uint64_t))type metadata accessor for ServicesAssembly, (uint64_t)&unk_21C1DA254);
  *(_QWORD *)(v33 + 272) = v47;
  v48 = type metadata accessor for SettingsAssembly();
  v49 = swift_allocObject();
  *(_QWORD *)(v33 + 336) = v48;
  *(_QWORD *)(v33 + 344) = sub_21C1C4064((unint64_t *)&unk_253F4B9F0, (uint64_t (*)(uint64_t))type metadata accessor for SettingsAssembly, (uint64_t)&unk_21C1D9B94);
  *(_QWORD *)(v33 + 312) = v49;
  v50 = type metadata accessor for SubscriptionAssembly();
  v51 = swift_allocObject();
  *(_QWORD *)(v33 + 376) = v50;
  *(_QWORD *)(v33 + 384) = sub_21C1C4064(&qword_253F4BB48, (uint64_t (*)(uint64_t))type metadata accessor for SubscriptionAssembly, (uint64_t)&unk_21C1D9EE8);
  *(_QWORD *)(v33 + 352) = v51;
  v52 = type metadata accessor for ToolbarAssembly();
  v53 = swift_allocObject();
  *(_QWORD *)(v33 + 416) = v52;
  *(_QWORD *)(v33 + 424) = sub_21C1C4064((unint64_t *)&unk_253F4B800, (uint64_t (*)(uint64_t))type metadata accessor for ToolbarAssembly, (uint64_t)&unk_21C1DACA4);
  *(_QWORD *)(v33 + 392) = v53;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEB4730], v2);
  sub_21C1D9084();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v1 + 16) = sub_21C1D906C();
  return v1;
}

void sub_21C1CDEFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[24];
  uint64_t v37;

  v1 = v0;
  sub_21C1C4C44();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v1 + 80);
  if (v4)
    goto LABEL_25;
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultConfiguration);
  v6 = (id)FCURLForContainerizedUserAccountCachesDirectory();
  if (v6)
  {
    v7 = v6;
    sub_21C1D8CDC();

    v8 = sub_21C1D8CE8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 0, 1, v8);
  }
  else
  {
    v9 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  }
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v11 = (id)FCBundle();
  if (!v11)
  {
    __break(1u);
    goto LABEL_27;
  }
  v12 = v11;
  v13 = (void *)sub_21C1D93A8();
  v14 = objc_msgSend(v12, sel_objectForInfoDictionaryKey_, v13);

  if (v14)
  {
    sub_21C1D9468();
    swift_unknownObjectRelease();
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  sub_21C1CE504((uint64_t)&v34, (uint64_t)v36);
  v33 = v10;
  if (v37)
  {
    if (swift_dynamicCast())
    {
      v15 = v5;
      goto LABEL_14;
    }
  }
  else
  {
    sub_21C1CE5A0((uint64_t)v36);
  }
  v15 = v5;
LABEL_14:
  v16 = (id)FCBundle();
  if (!v16)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v17 = v16;
  v18 = (void *)sub_21C1D93A8();
  v19 = objc_msgSend(v17, sel_objectForInfoDictionaryKey_, v18);

  if (v19)
  {
    sub_21C1D9468();
    swift_unknownObjectRelease();
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  sub_21C1CE504((uint64_t)&v34, (uint64_t)v36);
  if (v37)
    swift_dynamicCast();
  else
    sub_21C1CE5A0((uint64_t)v36);
  v20 = sub_21C1D8CE8();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v3, 1, v20) != 1)
  {
    v22 = (void *)sub_21C1D8CC4();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v20);
  }
  v23 = objc_allocWithZone(MEMORY[0x24BE6CB20]);
  v24 = (void *)sub_21C1D93A8();
  swift_bridgeObjectRelease();
  v25 = (void *)sub_21C1D93A8();
  swift_bridgeObjectRelease();
  v26 = v15;
  v27 = v15;
  v28 = v33;
  v29 = objc_msgSend(v23, sel_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_, v27, v22, v33, v24, v25, 0);

  if (v29)
  {
    v30 = *(void **)(v1 + 80);
    *(_QWORD *)(v1 + 80) = v29;
    v29;

    v4 = 0;
LABEL_25:
    v31 = v4;
    return;
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_21C1CE2F8()
{
  uint64_t v0;

  swift_release();
  sub_21C1CE5DC(v0 + 24);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NewsKitModule()
{
  return objc_opt_self();
}

uint64_t sub_21C1CE448(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_21C1CE4B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PrivateDataActionProvider()
{
  return objc_opt_self();
}

uint64_t sub_21C1CE504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1CE548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21C1CE548()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F4BD50)
  {
    v0 = sub_21C1D9450();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F4BD50);
  }
}

uint64_t sub_21C1CE5A0(uint64_t a1)
{
  uint64_t v2;

  sub_21C1CE548();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C1CE5DC(uint64_t a1)
{
  uint64_t v2;

  sub_21C1CE638(0, &qword_255246B58, &qword_255246B60, MEMORY[0x24BEB4388], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21C1CE638(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_21C1C42EC(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_21C1CE698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1CE638(0, &qword_255246B58, &qword_255246B60, MEMORY[0x24BEB4388], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C1CE6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C1CE740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1CE638(0, &qword_255246B58, &qword_255246B60, MEMORY[0x24BEB4388], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_21C1CE7A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  void *v19;
  uint64_t v21;
  void *v23;
  id v24;

  v15 = sub_21C1D8CE8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  v18 = 0;
  if (v17(a3, 1, v15) != 1)
  {
    v18 = (void *)sub_21C1D8CC4();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  if (v17(a4, 1, v15) == 1)
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)sub_21C1D8CC4();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a4, v15);
  }
  LOWORD(v21) = a10 & 0x101;
  v24 = objc_msgSend(v23, sel_initWithConfiguration_configurationManager_contentHostDirectory_privateDataHostDirectory_privateDataActionProvider_networkBehaviorMonitor_appActivityMonitor_desiredHeadlineFieldOptions_feedUsage_lockStoreFrontIfNeeded_deviceIsiPad_backgroundTaskable_privateDataSyncAvailability_pptContext_, a1, a2, v18, v19, a5, a6, a7, a8, a9, v21, a11, a12, a13);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v24;
}

uint64_t sub_21C1CE94C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_21C1D92DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8D48();
  sub_21C1D8D3C();
  sub_21C1D8D24();
  sub_21C1D8D30();
  swift_release();
  swift_release();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  v5 = 0;
  if (v4 != *MEMORY[0x24BE6CE58])
  {
    if (v4 == *MEMORY[0x24BE6CE90])
    {
      return 1;
    }
    else if (v4 == *MEMORY[0x24BE6CE60])
    {
      return 2;
    }
    else if (v4 == *MEMORY[0x24BE6CE68])
    {
      return 3;
    }
    else if (v4 == *MEMORY[0x24BE6CE80])
    {
      return 4;
    }
    else if (v4 == *MEMORY[0x24BE6CE88])
    {
      return 6;
    }
    else if (v4 == *MEMORY[0x24BE6CE70])
    {
      return 7;
    }
    else if (v4 == *MEMORY[0x24BE6CE78])
    {
      return 8;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      return 0;
    }
  }
  return v5;
}

uint64_t type metadata accessor for PostPurchaseOnboardingViewControllerFactory()
{
  return objc_opt_self();
}

id sub_21C1CEB08(uint64_t a1)
{
  return sub_21C1CEB40(a1, (uint64_t)&unk_24E013F70, (uint64_t)sub_21C1CEEBC, (uint64_t)&block_descriptor_10);
}

id sub_21C1CEB24(uint64_t a1)
{
  return sub_21C1CEB40(a1, (uint64_t)&unk_24E013F20, (uint64_t)sub_21C1CEE8C, (uint64_t)&block_descriptor_2);
}

id sub_21C1CEB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v13[4] = a3;
  v13[5] = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_21C1C7FC0;
  v13[3] = a4;
  v10 = _Block_copy(v13);
  swift_retain();
  v11 = objc_msgSend(v9, sel_initWithDynamicProvider_, v10);
  _Block_release(v10);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_21C1CEC40()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_21C1CEC64(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5, SEL *a6)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v10 = a2 + 16;
  swift_beginAccess();
  v11 = MEMORY[0x220774DC0](v10);
  if (!v11)
    return objc_msgSend((id)objc_opt_self(), *a4);
  v12 = (void *)v11;
  v13 = objc_msgSend(a1, sel_userInterfaceStyle);
  if ((unint64_t)v13 < 2)
  {
    v14 = objc_msgSend(v12, *a6);
    if (v14)
      goto LABEL_14;
    goto LABEL_15;
  }
  if (v13 != (id)2)
  {
    v14 = objc_msgSend(v12, sel_backgroundColor);
    if (v14)
      goto LABEL_14;
    goto LABEL_15;
  }
  v16 = objc_msgSend(v12, *a5);
  if (!v16)
  {
    v14 = objc_msgSend(v12, *a6);
    if (v14)
    {
LABEL_14:
      v19 = v14;
      v18 = objc_msgSend(v14, sel_ne_color);
      swift_unknownObjectRelease();

      return v18;
    }
LABEL_15:
    v18 = objc_msgSend((id)objc_opt_self(), *a4);
    swift_unknownObjectRelease();
    return v18;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_ne_color);
  swift_unknownObjectRelease();

  return v18;
}

uint64_t sub_21C1CEE68()
{
  swift_release();
  return swift_deallocObject();
}

id sub_21C1CEE8C(void *a1)
{
  uint64_t v1;

  return sub_21C1CEC64(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16), (SEL *)&selRef_whiteColor, (SEL *)&selRef_darkStyleForegroundColor, (SEL *)&selRef_foregroundColor);
}

id sub_21C1CEEBC(void *a1)
{
  uint64_t v1;

  return sub_21C1CEC64(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16), (SEL *)&selRef_systemBackgroundColor, (SEL *)&selRef_darkStyleBackgroundColor, (SEL *)&selRef_backgroundColor);
}

uint64_t type metadata accessor for StubAppActivityMonitor()
{
  return objc_opt_self();
}

uint64_t sub_21C1CEF5C()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = sub_21C1D912C();
  __swift_allocate_value_buffer(v0, qword_255249570);
  __swift_project_value_buffer(v0, (uint64_t)qword_255249570);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_21C1D93CC();

  }
  return sub_21C1D9120();
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

uint64_t NewsArticleView.init(articles:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t NewsArticleView.init(identifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 1;
  return result;
}

uint64_t NewsArticleView.makeUIViewController(context:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  v1 = *(_BYTE *)(v0 + 8);
  v2 = swift_bridgeObjectRetain();
  if ((v1 & 1) != 0)
    return _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(v2);
  else
    return _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(v2);
}

uint64_t sub_21C1CF0D4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  v1 = *(_BYTE *)(v0 + 8);
  v2 = swift_bridgeObjectRetain();
  if ((v1 & 1) != 0)
    return _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(v2);
  else
    return _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(v2);
}

uint64_t sub_21C1CF114()
{
  return sub_21C1D9240();
}

uint64_t sub_21C1CF14C()
{
  sub_21C1CF3F8();
  return sub_21C1D927C();
}

uint64_t sub_21C1CF19C()
{
  sub_21C1CF3F8();
  return sub_21C1D924C();
}

void sub_21C1CF1EC()
{
  sub_21C1CF3F8();
  sub_21C1D9270();
  __break(1u);
}

unint64_t sub_21C1CF214()
{
  unint64_t result;

  result = qword_255246C60;
  if (!qword_255246C60)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsArticleView, &type metadata for NewsArticleView);
    atomic_store(result, (unint64_t *)&qword_255246C60);
  }
  return result;
}

uint64_t sub_21C1CF258()
{
  return MEMORY[0x24BDF5560];
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for NewsArticleView()
{
  return &type metadata for NewsArticleView;
}

uint64_t initializeBufferWithCopyOfBuffer for NewsArticleView.Content(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for NewsArticleView.Content()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwca_0(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NewsArticleView.Content(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s7NewsKit15NewsArticleViewV7ContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_21C1CF3D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_21C1CF3DC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NewsArticleView.Content()
{
  return &type metadata for NewsArticleView.Content;
}

unint64_t sub_21C1CF3F8()
{
  unint64_t result;

  result = qword_255246C68;
  if (!qword_255246C68)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsArticleView, &type metadata for NewsArticleView);
    atomic_store(result, (unint64_t *)&qword_255246C68);
  }
  return result;
}

uint64_t type metadata accessor for SubscriptionsRouter()
{
  return objc_opt_self();
}

uint64_t sub_21C1CF470@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_21C1D9174();
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C3B50(0, &qword_255246D08);
  result = sub_21C1D8F88();
  if (v7)
  {
    sub_21C1D915C();
    sub_21C1D9168();
    result = sub_21C1D9150();
    v6 = MEMORY[0x24BEB4880];
    *a2 = result;
    a2[1] = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_21C1CF570@<X0>(_QWORD *a1@<X8>)
{
  objc_class *v2;
  id result;
  uint64_t v4;

  v2 = (objc_class *)sub_21C1D9198();
  result = objc_msgSend(objc_allocWithZone(v2), sel_init);
  v4 = MEMORY[0x24BEB48D0];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ToolbarAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1CF5D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21C1D900C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8FAC();
  sub_21C1C3B50(0, &qword_253F4B3A8);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C3B50(0, (unint64_t *)&unk_253F4B3B0);
  sub_21C1D9000();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEB4660], v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21C1CF724()
{
  uint64_t v0;

  v0 = sub_21C1D91BC();
  __swift_allocate_value_buffer(v0, qword_255249588);
  __swift_project_value_buffer(v0, (uint64_t)qword_255249588);
  return sub_21C1D91B0();
}

id NewsArticleViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NewsArticleViewController.init(coder:)()
{
  sub_21C1D94E0();
  __break(1u);
}

uint64_t sub_21C1CF8C0(_QWORD *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1C42EC(0, &qword_255246D50);
  return sub_21C1D8F64();
}

Swift::Void __swiftcall NewsArticleViewController.showArticle(with:)(Swift::String with)
{
  sub_21C1D8F1C();
}

Swift::Void __swiftcall NewsArticleViewController.loadView()()
{
  void *v0;
  objc_class *v1;
  id v2;
  id v3;
  objc_super v4;
  _BYTE v5[40];

  sub_21C1CE6FC((uint64_t)v0 + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider, (uint64_t)v5);
  v1 = (objc_class *)type metadata accessor for SceneProvidingView();
  v2 = objc_allocWithZone(v1);
  sub_21C1CE6FC((uint64_t)v5, (uint64_t)v2 + OBJC_IVAR____TtC7NewsKit18SceneProvidingView_sceneProvider);
  v4.receiver = v2;
  v4.super_class = v1;
  v3 = objc_msgSendSuper2(&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  objc_msgSend(v0, sel_setView_, v3);

}

Swift::Void __swiftcall NewsArticleViewController.viewDidLoad()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController];
  objc_msgSend(v0, sel_addChildViewController_, v1);
  v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v1, sel_view);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v3, sel_addSubview_, v4);

      objc_msgSend(v1, sel_didMoveToParentViewController_, v0);
      v6 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_articleViewController], sel_navigationItem);
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_handleDone);
      objc_msgSend(v6, sel_setLeftBarButtonItem_, v7);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

Swift::Void __swiftcall NewsArticleViewController.viewDidLayoutSubviews()()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v13, sel_viewDidLayoutSubviews);
  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController], sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_bounds);
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      objc_msgSend(v2, sel_setFrame_, v6, v8, v10, v12);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id NewsArticleViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_21C1D93A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void NewsArticleViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id NewsArticleViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C1CFF6C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21C1CFF88(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21C1CFF88(char a1, int64_t a2, char a3, _QWORD *a4)
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
  sub_21C1C7098(0, &qword_255246D68, (uint64_t (*)(uint64_t))MEMORY[0x24BE6C5C8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(sub_21C1D8EEC() - 8);
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
  v16 = *(_QWORD *)(sub_21C1D8EEC() - 8);
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
  result = sub_21C1D9510();
  __break(1u);
  return result;
}

uint64_t sub_21C1D017C(uint64_t a1, void *a2)
{
  objc_class *ObjectType;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v23[3] = sub_21C1D8F34();
  v23[4] = MEMORY[0x24BE6C618];
  v23[0] = a1;
  v5 = qword_253F4B548;
  v6 = a2;
  if (v5 != -1)
    swift_once();
  sub_21C1CD77C((uint64_t)v21);
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_21C1C42EC(0, &qword_255246D50);
  result = sub_21C1D8F88();
  if (!v19)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_21C1CB538(&v18, (uint64_t)v20);
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  if (qword_255245F18 != -1)
    swift_once();
  v8 = sub_21C1D91BC();
  __swift_project_value_buffer(v8, (uint64_t)qword_255249588);
  sub_21C1D0BB4();
  sub_21C1D91C8();
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_21C1C42EC(0, &qword_255246D60);
  sub_21C1CE6FC((uint64_t)v20, (uint64_t)&v18);
  v9 = swift_allocObject();
  sub_21C1CB538(&v18, v9 + 16);
  sub_21C1D8F70();
  result = swift_release();
  if (!v17)
    goto LABEL_10;
  sub_21C1CB538(&v16, (uint64_t)&v18);
  __swift_project_boxed_opaque_existential_1(&v18, v19);
  v10 = (void *)sub_21C1D8F10();
  v11 = objc_msgSend(objc_allocWithZone((Class)sub_21C1D91A4()), sel_initWithRootViewController_, v10);
  *(_QWORD *)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_articleViewController] = v10;
  *(_QWORD *)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController] = v11;
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_21C1C42EC(0, &qword_253F4B3A0);
  v12 = v10;
  v13 = v11;
  result = sub_21C1D8F88();
  if (v17)
  {
    sub_21C1CB538(&v16, (uint64_t)&v6[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider]);

    v15.receiver = v6;
    v15.super_class = ObjectType;
    v14 = objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    return (uint64_t)v14;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _s7NewsKit0A21ArticleViewControllerC8articlesACSayAA0aC0VG_tcfC_0(uint64_t a1)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - v3;
  v5 = sub_21C1D8ED4();
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for NewsArticle();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_21C1D8EEC();
  v12 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21C1D8EF8();
  v30 = *(_QWORD *)(v15 - 8);
  v31 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v32 = (uint64_t *)((char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
  {
    v38 = MEMORY[0x24BEE4AF8];
    sub_21C1CFF6C(0, v17, 0);
    v18 = *(unsigned __int8 *)(v9 + 80);
    v29 = a1;
    v19 = a1 + ((v18 + 32) & ~v18);
    v34 = *(_QWORD *)(v9 + 72);
    v33 = *MEMORY[0x24BE6C5B0];
    do
    {
      sub_21C1D0B34(v19, (uint64_t)v11);
      v20 = sub_21C1D8CE8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
      swift_bridgeObjectRetain();
      sub_21C1D8EA4();
      (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v7, v33, v37);
      sub_21C1D8EE0();
      sub_21C1D0B78((uint64_t)v11);
      v21 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C1CFF6C(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v38;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_21C1CFF6C(v22 > 1, v23 + 1, 1);
        v21 = v38;
      }
      *(_QWORD *)(v21 + 16) = v23 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v21+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v23, v14, v35);
      v38 = v21;
      v19 += v34;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  v24 = v31;
  v25 = v32;
  *v32 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v30 + 104))(v25, *MEMORY[0x24BE6C5D0], v24);
  sub_21C1D8F34();
  swift_allocObject();
  v26 = sub_21C1D8F28();
  v27 = objc_allocWithZone((Class)type metadata accessor for NewsArticleViewController());
  return sub_21C1D017C(v26, v27);
}

uint64_t _s7NewsKit0A21ArticleViewControllerC11identifiersACSaySSG_tcfC_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unsigned int v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - v3;
  v5 = sub_21C1D8ED4();
  v33 = *(_QWORD *)(v5 - 8);
  v34 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_21C1D8EEC();
  v8 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C1D8EF8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v25 = v12;
    v26 = v11;
    v27 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v35 = MEMORY[0x24BEE4AF8];
    sub_21C1CFF6C(0, v15, 0);
    v16 = v35;
    v17 = sub_21C1D8CE8();
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
    v31 = v17;
    v29 = *MEMORY[0x24BE6C5B0];
    v28 = a1;
    v18 = a1 + 40;
    do
    {
      v30(v4, 1, 1, v31);
      swift_bridgeObjectRetain_n();
      sub_21C1D8EA4();
      (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v7, v29, v34);
      sub_21C1D8EE0();
      swift_bridgeObjectRelease();
      v35 = v16;
      v20 = *(_QWORD *)(v16 + 16);
      v19 = *(_QWORD *)(v16 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_21C1CFF6C(v19 > 1, v20 + 1, 1);
        v16 = v35;
      }
      v18 += 16;
      *(_QWORD *)(v16 + 16) = v20 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v16+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v20, v10, v32);
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    v11 = v26;
    v14 = v27;
    v12 = v25;
  }
  else
  {
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x24BEE4AF8];
  }
  *v14 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE6C5D0], v11);
  sub_21C1D8F34();
  swift_allocObject();
  v21 = sub_21C1D8F28();
  v22 = objc_allocWithZone((Class)type metadata accessor for NewsArticleViewController());
  return sub_21C1D017C(v21, v22);
}

uint64_t type metadata accessor for NewsArticleViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for NewsArticleViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21C1D0B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C1D0B78(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NewsArticle();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21C1D0BB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255246D58;
  if (!qword_255246D58)
  {
    v1 = sub_21C1D91BC();
    result = MEMORY[0x220774CC4](MEMORY[0x24BE6C4E0], v1);
    atomic_store(result, (unint64_t *)&qword_255246D58);
  }
  return result;
}

uint64_t sub_21C1D0BFC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_21C1D0C20(_QWORD *a1)
{
  return sub_21C1CF8C0(a1);
}

void sub_21C1D0C28(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  int v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  id v63;

  v60 = a2;
  v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_21C1C7098(0, &qword_253F4B090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v57 - v7;
  v9 = sub_21C1D8D18();
  v58 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v57 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)&v57 - v12;
  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], v5);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v57 - v14;
  v62 = type metadata accessor for NewsArticle();
  v16 = (char *)a3 + *(int *)(v62 + 24);
  v17 = sub_21C1D8CE8();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  *(_QWORD *)&v61 = v16;
  v18(v16, 1, 1, v17);
  v19 = objc_msgSend(a1, sel_identifier);
  v20 = sub_21C1D93CC();
  v22 = v21;

  *a3 = v20;
  a3[1] = v22;
  v63 = a1;
  v23 = objc_msgSend(a1, sel_title);
  if (v23)
  {
    v24 = v23;
    v25 = sub_21C1D93CC();
    v27 = v26;

  }
  else
  {
    v25 = 0;
    v27 = 0xE000000000000000;
  }
  a3[2] = v25;
  a3[3] = v27;
  v28 = v63;
  v29 = objc_msgSend(v63, sel_thumbnail);
  if (v29)
  {
    v30 = v29;
    v31 = objc_msgSend(v29, sel_thumbnailAssetHandle);

    if (!v31)
    {
      __break(1u);
      return;
    }
    v32 = objc_msgSend(v31, sel_remoteURL);

    sub_21C1D8CDC();
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  v18(v15, v33, 1, v17);
  sub_21C1D13A4((uint64_t)v15, v61);
  v34 = objc_msgSend(v28, sel_publishDate);
  if (!v34)
  {
    v37 = v58;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v8, 1, 1, v9);
    v40 = v59;
    v41 = v60;
    v42 = v62;
    goto LABEL_12;
  }
  v35 = v34;
  v36 = v57;
  sub_21C1D8D00();

  v37 = v58;
  v38 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  v38(v8, v36, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v8, 0, 1, v9);
  v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v8, 1, v9);
  v40 = v59;
  v41 = v60;
  v42 = v62;
  if (v39 == 1)
  {
LABEL_12:
    sub_21C1D8D0C();
    sub_21C1D4610((uint64_t)v8, &qword_253F4B090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
    v38 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    goto LABEL_13;
  }
  v38(v59, v8, v9);
LABEL_13:
  v38((char *)a3 + *(int *)(v42 + 28), v40, v9);
  v43 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598];
  sub_21C1D4654(0, (unint64_t *)&qword_253F4B2C8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v44 = swift_allocObject();
  v61 = xmmword_21C1DAD10;
  *(_OWORD *)(v44 + 16) = xmmword_21C1DAD10;
  v46 = *a3;
  v45 = a3[1];
  *(_QWORD *)(v44 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v44 + 32) = v46;
  *(_QWORD *)(v44 + 40) = v45;
  swift_bridgeObjectRetain();
  v47 = (void *)sub_21C1D93F0();
  swift_bridgeObjectRelease();
  sub_21C1C7098(0, &qword_253F4B2A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB988], v43);
  sub_21C1D8CB8();
  *(_OWORD *)(swift_allocObject() + 16) = v61;
  v48 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v49 = objc_msgSend(v48, sel_bundleIdentifier);

  if (v49)
  {
    sub_21C1D93CC();

  }
  v50 = (void *)objc_opt_self();
  sub_21C1D8CAC();
  swift_bridgeObjectRelease();
  v51 = (void *)sub_21C1D93F0();
  swift_bridgeObjectRelease();
  v52 = objc_msgSend(v50, sel_nss_NewsURLWithPathComponents_queryItems_internal_, v47, v51, 0);

  v53 = v62;
  sub_21C1D8CDC();

  sub_21C1C4D80(v41, (uint64_t)a3 + *(int *)(v53 + 36), (uint64_t (*)(_QWORD))type metadata accessor for NewsChannel);
  v54 = objc_msgSend(v63, sel_authors);
  if (v54)
  {
    v55 = v54;
    v56 = sub_21C1D93FC();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    v56 = MEMORY[0x24BEE4AF8];
  }
  sub_21C1CBE40(v41, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannel);
  *(uint64_t *)((char *)a3 + *(int *)(v53 + 40)) = v56;
}

uint64_t NewsArticle.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsArticle.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NewsArticle.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NewsArticle.title.modify())()
{
  return nullsub_1;
}

uint64_t NewsArticle.thumbnailURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 24);
  return sub_21C1D1318(v3, a1);
}

uint64_t type metadata accessor for NewsArticle()
{
  uint64_t result;

  result = qword_253F4B130;
  if (!qword_253F4B130)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C1D1318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t NewsArticle.thumbnailURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 24);
  return sub_21C1D13A4(a1, v3);
}

uint64_t sub_21C1D13A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*NewsArticle.thumbnailURL.modify())()
{
  type metadata accessor for NewsArticle();
  return nullsub_1;
}

uint64_t NewsArticle.publishDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 28);
  v4 = sub_21C1D8D18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t NewsArticle.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 32);
  v4 = sub_21C1D8CE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t NewsArticle.url.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 32);
  v4 = sub_21C1D8CE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*NewsArticle.url.modify())()
{
  type metadata accessor for NewsArticle();
  return nullsub_1;
}

uint64_t NewsArticle.channel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for NewsArticle();
  return sub_21C1C4D80(v1 + *(int *)(v3 + 36), a1, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannel);
}

uint64_t NewsArticle.channel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for NewsArticle() + 36);
  return sub_21C1D1594(a1, v3);
}

uint64_t sub_21C1D1594(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsChannel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*NewsArticle.channel.modify())()
{
  type metadata accessor for NewsArticle();
  return nullsub_1;
}

uint64_t NewsArticle.authors.getter()
{
  type metadata accessor for NewsArticle();
  return swift_bridgeObjectRetain();
}

uint64_t NewsArticle.authors.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for NewsArticle() + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*NewsArticle.authors.modify())()
{
  type metadata accessor for NewsArticle();
  return nullsub_1;
}

uint64_t sub_21C1D1684(char a1)
{
  return qword_21C1DAF48[a1];
}

uint64_t sub_21C1D16A4()
{
  char *v0;

  return sub_21C1D1684(*v0);
}

uint64_t sub_21C1D16AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C1D42F4(a1, a2);
  *a3 = result;
  return result;
}

void sub_21C1D16D0(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_21C1D16DC()
{
  sub_21C1D1A34();
  return sub_21C1D9618();
}

uint64_t sub_21C1D1704()
{
  sub_21C1D1A34();
  return sub_21C1D9624();
}

uint64_t NewsArticle.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  v3 = v1;
  sub_21C1D2118(0, &qword_255246D70, MEMORY[0x24BEE3520]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D1A34();
  sub_21C1D960C();
  v19 = 0;
  sub_21C1D9564();
  if (!v2)
  {
    v18 = 1;
    sub_21C1D9564();
    v10 = type metadata accessor for NewsArticle();
    v17 = 2;
    sub_21C1D8CE8();
    sub_21C1C4064(&qword_255246D80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_21C1D9558();
    v12[0] = v3 + *(int *)(v10 + 28);
    v16 = 3;
    sub_21C1D8D18();
    sub_21C1C4064(&qword_255246D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_21C1D957C();
    v15 = 4;
    sub_21C1D957C();
    v14 = 5;
    type metadata accessor for NewsChannel();
    sub_21C1C4064(&qword_255246D90, (uint64_t (*)(uint64_t))type metadata accessor for NewsChannel, (uint64_t)&protocol conformance descriptor for NewsChannel);
    sub_21C1D957C();
    v12[1] = *(_QWORD *)(v3 + *(int *)(v10 + 40));
    v13 = 6;
    sub_21C1D4654(0, &qword_255246D98, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    sub_21C1D21B8(&qword_255246DA0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_21C1D957C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_21C1D1A34()
{
  unint64_t result;

  result = qword_255246D78;
  if (!qword_255246D78)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DAEF4, &type metadata for NewsArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246D78);
  }
  return result;
}

uint64_t NewsArticle.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char *v21;
  void (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;
  int *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;

  v40 = a2;
  v47 = type metadata accessor for NewsChannel();
  MEMORY[0x24BDAC7A8](v47);
  v41 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21C1D8CE8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C1D8D18();
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - v12;
  sub_21C1D2118(0, &qword_255246DA8, MEMORY[0x24BEE33E0]);
  v48 = v14;
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v38 - v16;
  v18 = type metadata accessor for NewsArticle();
  v49 = MEMORY[0x24BDAC7A8](v18);
  v20 = (uint64_t *)((char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = (char *)v20 + *(int *)(v49 + 24);
  v43 = v6;
  v22 = *(void (**)(void))(v6 + 56);
  v52 = (uint64_t)v21;
  v46 = v4;
  v22();
  v23 = a1[3];
  v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_21C1D1A34();
  v24 = v51;
  sub_21C1D9600();
  if (v24)
  {
    v25 = v52;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
    return sub_21C1D4610(v25, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  }
  else
  {
    v39 = v10;
    v51 = v15;
    v60 = 0;
    v26 = (uint64_t)v20;
    *v20 = sub_21C1D9534();
    v20[1] = v27;
    v59 = 1;
    v28 = sub_21C1D9534();
    v29 = v52;
    v20[2] = v28;
    v20[3] = v30;
    v58 = 2;
    sub_21C1C4064(&qword_255246DB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    sub_21C1D9528();
    sub_21C1D13A4((uint64_t)v13, v29);
    v57 = 3;
    sub_21C1C4064(&qword_255246DB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v32 = v39;
    v33 = v45;
    sub_21C1D954C();
    v34 = (int *)v49;
    (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v26 + *(int *)(v49 + 28), v32, v33);
    v56 = 4;
    v35 = v42;
    v36 = v46;
    sub_21C1D954C();
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v26 + v34[8], v35, v36);
    v55 = 5;
    sub_21C1C4064(&qword_255246DC0, (uint64_t (*)(uint64_t))type metadata accessor for NewsChannel, (uint64_t)&protocol conformance descriptor for NewsChannel);
    v37 = (uint64_t)v41;
    sub_21C1D954C();
    sub_21C1D2174(v37, v26 + v34[9]);
    sub_21C1D4654(0, &qword_255246D98, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    v54 = 6;
    sub_21C1D21B8(&qword_255246DC8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_21C1D954C();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v17, v48);
    *(_QWORD *)(v26 + v34[10]) = v53;
    sub_21C1C4D80(v26, v40, (uint64_t (*)(_QWORD))type metadata accessor for NewsArticle);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
    return sub_21C1CBE40(v26, (uint64_t (*)(_QWORD))type metadata accessor for NewsArticle);
  }
}

void sub_21C1D2118(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21C1D1A34();
    v7 = a3(a1, &type metadata for NewsArticle.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_21C1D2174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NewsChannel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C1D21B8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    sub_21C1D4654(255, &qword_255246D98, MEMORY[0x24BEE0D00], MEMORY[0x24BEE1250]);
    v8 = a2;
    result = MEMORY[0x220774CC4](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21C1D222C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsArticle.init(from:)(a1, a2);
}

uint64_t sub_21C1D2240(_QWORD *a1)
{
  return NewsArticle.encode(to:)(a1);
}

uint64_t sub_21C1D2258(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_21C1D9594(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_21C1D9594() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t _s7NewsKit0A7ArticleV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v28)(uint64_t);
  uint64_t (*v29)(uint64_t);
  _BYTE *v30;
  void (*v31)(_BYTE *, uint64_t);
  uint64_t (*v32)(uint64_t);
  int *v33;
  _BYTE v35[12];
  int v36;
  _BYTE *v37;
  int *v38;

  v4 = sub_21C1D8CE8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v35[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21C1D4598();
  v10 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v35[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = &v35[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = &v35[-v18];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v35[-v20];
  if (*a1 == *a2 && a1[1] == a2[1] || (v22 = sub_21C1D9594(), v23 = 0, (v22 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3] || (v24 = sub_21C1D9594(), v23 = 0, (v24 & 1) != 0))
    {
      v37 = v8;
      v25 = type metadata accessor for NewsArticle();
      sub_21C1D1318((uint64_t)a1 + *(int *)(v25 + 24), (uint64_t)v21);
      v38 = (int *)v25;
      sub_21C1D1318((uint64_t)a2 + *(int *)(v25 + 24), (uint64_t)v19);
      v26 = (uint64_t)&v12[*(int *)(v10 + 48)];
      sub_21C1D1318((uint64_t)v21, (uint64_t)v12);
      sub_21C1D1318((uint64_t)v19, v26);
      v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
      if (v27((uint64_t)v12, 1, v4) == 1)
      {
        v28 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
        sub_21C1D4610((uint64_t)v19, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
        sub_21C1D4610((uint64_t)v21, (unint64_t *)&qword_253F4B2D8, v28);
        if (v27(v26, 1, v4) == 1)
        {
          sub_21C1D4610((uint64_t)v12, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
LABEL_14:
          v33 = v38;
          if ((sub_21C1D8CF4() & 1) != 0
            && (MEMORY[0x220774064]((char *)a1 + v33[8], (char *)a2 + v33[8]) & 1) != 0
            && _s7NewsKit0A7ChannelV2eeoiySbAC_ACtFZ_0((_QWORD *)((char *)a1 + v33[9]), (_QWORD *)((char *)a2 + v33[9])))
          {
            v23 = sub_21C1D2258(*(_QWORD **)((char *)a1 + v33[10]), *(_QWORD **)((char *)a2 + v33[10]));
            return v23 & 1;
          }
LABEL_18:
          v23 = 0;
          return v23 & 1;
        }
      }
      else
      {
        sub_21C1D1318((uint64_t)v12, (uint64_t)v16);
        if (v27(v26, 1, v4) != 1)
        {
          v30 = v37;
          (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 32))(v37, v26, v4);
          sub_21C1C4064((unint64_t *)&unk_255246DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
          v36 = sub_21C1D939C();
          v31 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
          v31(v30, v4);
          v32 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
          sub_21C1D4610((uint64_t)v19, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
          sub_21C1D4610((uint64_t)v21, (unint64_t *)&qword_253F4B2D8, v32);
          v31(v16, v4);
          sub_21C1D4610((uint64_t)v12, (unint64_t *)&qword_253F4B2D8, v32);
          if ((v36 & 1) == 0)
            goto LABEL_18;
          goto LABEL_14;
        }
        v29 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
        sub_21C1D4610((uint64_t)v19, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
        sub_21C1D4610((uint64_t)v21, (unint64_t *)&qword_253F4B2D8, v29);
        (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v16, v4);
      }
      sub_21C1CBE40((uint64_t)v12, (uint64_t (*)(_QWORD))sub_21C1D4598);
      goto LABEL_18;
    }
  }
  return v23 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for NewsArticle(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  int *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  int *v56;
  uint64_t v57;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_21C1D8CE8();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v55 = v14;
    if (v14(v11, 1, v12))
    {
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[7];
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_21C1D8D18();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v21((char *)v4 + a3[8], (char *)a2 + a3[8], v12);
    v56 = a3;
    v57 = v13;
    v22 = a3[9];
    v23 = (uint64_t *)((char *)v4 + v22);
    v24 = (char *)a2 + v22;
    v25 = *(uint64_t *)((char *)a2 + v22 + 8);
    *v23 = *(uint64_t *)((char *)a2 + v22);
    v23[1] = v25;
    v26 = *(uint64_t *)((char *)a2 + v22 + 24);
    v23[2] = *(uint64_t *)((char *)a2 + v22 + 16);
    v23[3] = v26;
    v52 = (char *)v4 + v22;
    v53 = type metadata accessor for NewsChannel();
    v27 = *(int *)(v53 + 24);
    v28 = (_QWORD *)((char *)v23 + v27);
    v54 = v24;
    v29 = &v24[v27];
    *v28 = *(_QWORD *)v29;
    v51 = (int *)type metadata accessor for NewsChannelLogoCollection();
    v30 = v51[5];
    v31 = (char *)v28 + v30;
    v32 = &v29[v30];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = v21;
    if (v55(v32, 1, v12))
    {
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      v21(v31, v32, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v31, 0, 1, v12);
    }
    v35 = v51[6];
    v36 = (char *)v28 + v35;
    v37 = &v29[v35];
    if (v55(&v29[v35], 1, v12))
    {
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v21(v36, v37, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v36, 0, 1, v12);
    }
    v39 = v51[7];
    v40 = (char *)v28 + v39;
    v41 = &v29[v39];
    if (v55(&v29[v39], 1, v12))
    {
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
    else
    {
      v33(v40, v41, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v40, 0, 1, v12);
    }
    v43 = *(int *)(v53 + 28);
    v44 = &v52[v43];
    v45 = &v54[v43];
    v46 = *(void **)&v54[v43];
    if (v46)
    {
      v47 = (void *)*((_QWORD *)v45 + 1);
      *(_QWORD *)v44 = v46;
      *((_QWORD *)v44 + 1) = v47;
      v48 = v46;
      v49 = v47;
    }
    else
    {
      *(_OWORD *)v44 = *(_OWORD *)v45;
    }
    *(uint64_t *)((char *)v4 + v56[10]) = *(uint64_t *)((char *)a2 + v56[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for NewsArticle(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_21C1D8CE8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[7];
  v9 = sub_21C1D8D18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(a1 + a2[8], v5);
  v11 = a1 + a2[9];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = type metadata accessor for NewsChannel();
  v13 = v11 + *(int *)(v12 + 24);
  v14 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v15 = v13 + v14[5];
  if (!v7(v15, 1, v5))
    v10(v15, v5);
  v16 = v13 + v14[6];
  if (!v7(v16, 1, v5))
    v10(v16, v5);
  v17 = v13 + v14[7];
  if (!v7(v17, 1, v5))
    v10(v17, v5);
  v18 = (id *)(v11 + *(int *)(v12 + 28));
  if (*v18)
  {

  }
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for NewsArticle(char *a1, char *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  int *v47;
  uint64_t v48;
  unsigned int (*v49)(char *, uint64_t, uint64_t);
  int *v50;
  _QWORD *v51;
  uint64_t v52;

  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  v6 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v6;
  v7 = a3[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_21C1D8CE8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49 = v12;
  if (v12(v9, 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[7];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v18(&a1[a3[8]], &a2[a3[8]], v10);
  v50 = a3;
  v51 = a2;
  v19 = a3[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v52 = v11;
  v22 = *(_QWORD *)&a2[v19 + 8];
  *(_QWORD *)v20 = *(_QWORD *)&a2[v19];
  *((_QWORD *)v20 + 1) = v22;
  v23 = *(_QWORD *)&a2[v19 + 24];
  *((_QWORD *)v20 + 2) = *(_QWORD *)&a2[v19 + 16];
  *((_QWORD *)v20 + 3) = v23;
  v48 = type metadata accessor for NewsChannel();
  v24 = *(int *)(v48 + 24);
  v25 = &v20[v24];
  v26 = &v21[v24];
  *(_QWORD *)&v20[v24] = *(_QWORD *)&v21[v24];
  v47 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v27 = v47[5];
  v28 = &v25[v27];
  v29 = &v26[v27];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v49(v29, 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    v18(v28, v29, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v28, 0, 1, v10);
  }
  v31 = v47[6];
  v32 = &v25[v31];
  v33 = &v26[v31];
  if (v49(&v26[v31], 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    v18(v32, v33, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v32, 0, 1, v10);
  }
  v35 = v47[7];
  v36 = &v25[v35];
  v37 = &v26[v35];
  if (v49(&v26[v35], 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    v18(v36, v37, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v36, 0, 1, v10);
  }
  v39 = *(int *)(v48 + 28);
  v40 = &v20[v39];
  v41 = &v21[v39];
  v42 = *(void **)&v21[v39];
  if (v42)
  {
    v43 = (void *)*((_QWORD *)v41 + 1);
    *(_QWORD *)v40 = v42;
    *((_QWORD *)v40 + 1) = v43;
    v44 = v42;
    v45 = v43;
  }
  else
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
  }
  *(_QWORD *)&a1[v50[10]] = *(_QWORD *)((char *)v51 + v50[10]);
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for NewsArticle(char *a1, char *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void (*v58)(char *, char *, uint64_t);
  uint64_t v59;
  int *v60;
  _QWORD *v61;
  uint64_t v62;
  int *v63;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[7];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v62 = v10;
  v58 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v58(&a1[a3[8]], &a2[a3[8]], v9);
  v60 = a3;
  v61 = a2;
  v19 = a3[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)&a2[v19];
  *((_QWORD *)v20 + 1) = *(_QWORD *)&a2[v19 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
  *((_QWORD *)v20 + 3) = *((_QWORD *)v21 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v59 = type metadata accessor for NewsChannel();
  v22 = *(int *)(v59 + 24);
  v23 = &v20[v22];
  v24 = &v21[v22];
  *(_QWORD *)&v20[v22] = *(_QWORD *)&v21[v22];
  v63 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v25 = v63[5];
  v26 = &v23[v25];
  v27 = &v24[v25];
  v28 = v11(&v23[v25], 1, v9);
  v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v26, v27, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v26, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v62 + 8))(v26, v9);
LABEL_12:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_13;
  }
  v58(v26, v27, v9);
LABEL_13:
  v31 = v63[6];
  v32 = &v23[v31];
  v33 = &v24[v31];
  v34 = v11(&v23[v31], 1, v9);
  v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      v37 = v62;
      (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v32, v33, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v32, 0, 1, v9);
      goto LABEL_23;
    }
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    if (v35)
    {
      v37 = v62;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v32, v9);
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      goto LABEL_23;
    }
    v58(v32, v33, v9);
  }
  v37 = v62;
LABEL_23:
  v39 = v63[7];
  v40 = &v23[v39];
  v41 = &v24[v39];
  v42 = v11(v40, 1, v9);
  v43 = v11(v41, 1, v9);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v40, v41, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v40, 0, 1, v9);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v43)
  {
    (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v9);
LABEL_28:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_29;
  }
  v58(v40, v41, v9);
LABEL_29:
  v45 = *(int *)(v59 + 28);
  v46 = &v20[v45];
  v47 = &v21[v45];
  v48 = *(id *)v46;
  v49 = *(void **)&v21[v45];
  if (!*(_QWORD *)v46)
  {
    if (v49)
    {
      *(_QWORD *)v46 = v49;
      v54 = (void *)*((_QWORD *)v47 + 1);
      *((_QWORD *)v46 + 1) = v54;
      v55 = v49;
      v56 = v54;
      goto LABEL_36;
    }
LABEL_35:
    *(_OWORD *)v46 = *(_OWORD *)v47;
    goto LABEL_36;
  }
  if (!v49)
  {
    sub_21C1C5F08((id *)v46);
    goto LABEL_35;
  }
  *(_QWORD *)v46 = v49;
  v50 = v49;

  v51 = (void *)*((_QWORD *)v47 + 1);
  v52 = (void *)*((_QWORD *)v46 + 1);
  *((_QWORD *)v46 + 1) = v51;
  v53 = v51;

LABEL_36:
  *(_QWORD *)&a1[v60[10]] = *(_QWORD *)((char *)v61 + v60[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for NewsArticle(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  _OWORD *v42;
  uint64_t v43;
  int *v44;
  unsigned int (*v45)(char *, uint64_t, uint64_t);

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = a3[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_21C1D8CE8();
  v11 = *(_QWORD *)(v10 - 8);
  v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v45(v9, 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v17(&a1[a3[8]], &a2[a3[8]], v10);
  v44 = a3;
  v18 = a3[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = *(_OWORD *)&a2[v18 + 16];
  *(_OWORD *)v19 = *(_OWORD *)&a2[v18];
  *((_OWORD *)v19 + 1) = v21;
  v41 = type metadata accessor for NewsChannel();
  v42 = v19;
  v22 = *(int *)(v41 + 24);
  v23 = &v19[v22];
  v40 = v20;
  v24 = &v20[v22];
  *(_QWORD *)v23 = *(_QWORD *)&v20[v22];
  v25 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v26 = v25[5];
  v27 = &v23[v26];
  v28 = &v24[v26];
  v43 = v11;
  if (v45(&v24[v26], 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v17(v27, v28, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v27, 0, 1, v10);
  }
  v30 = v25[6];
  v31 = &v23[v30];
  v32 = &v24[v30];
  if (v45(&v24[v30], 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    v34 = v43;
  }
  else
  {
    v17(v31, v32, v10);
    v34 = v43;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v31, 0, 1, v10);
  }
  v35 = v25[7];
  v36 = &v23[v35];
  v37 = &v24[v35];
  if (v45(&v24[v35], 1, v10))
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    v17(v36, v37, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v10);
  }
  *(_OWORD *)((char *)v42 + *(int *)(v41 + 28)) = *(_OWORD *)&v40[*(int *)(v41 + 28)];
  *(_QWORD *)&a1[v44[10]] = *(_QWORD *)&a2[v44[10]];
  return a1;
}

char *assignWithTake for NewsArticle(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  char *v51;
  void *v52;
  id v53;
  void (*v55)(char *, char *, uint64_t);
  uint64_t v56;
  int *v57;
  _QWORD *v58;
  uint64_t v59;
  int *v60;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_21C1D8CE8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_21C1D8D18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v59 = v12;
  v55 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v55(&a1[a3[8]], &a2[a3[8]], v11);
  v57 = a3;
  v58 = a2;
  v21 = a3[9];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = *(_QWORD *)&a2[v21 + 8];
  *(_QWORD *)v22 = *(_QWORD *)&a2[v21];
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v25 = *((_QWORD *)v23 + 3);
  *((_QWORD *)v22 + 2) = *((_QWORD *)v23 + 2);
  *((_QWORD *)v22 + 3) = v25;
  swift_bridgeObjectRelease();
  v56 = type metadata accessor for NewsChannel();
  v26 = *(int *)(v56 + 24);
  v27 = &v22[v26];
  v28 = &v23[v26];
  *(_QWORD *)&v22[v26] = *(_QWORD *)&v23[v26];
  v60 = (int *)type metadata accessor for NewsChannelLogoCollection();
  v29 = v60[5];
  v30 = &v27[v29];
  v31 = &v28[v29];
  v32 = v13(&v27[v29], 1, v11);
  v33 = v13(v31, 1, v11);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v30, v31, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v30, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v59 + 8))(v30, v11);
LABEL_12:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  v55(v30, v31, v11);
LABEL_13:
  v35 = v60[6];
  v36 = &v27[v35];
  v37 = &v28[v35];
  v38 = v13(&v27[v35], 1, v11);
  v39 = v13(v37, 1, v11);
  if (v38)
  {
    if (!v39)
    {
      v41 = v59;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v36, v37, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(v36, 0, 1, v11);
      goto LABEL_23;
    }
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    if (v39)
    {
      v41 = v59;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v11);
      sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      goto LABEL_23;
    }
    v55(v36, v37, v11);
  }
  v41 = v59;
LABEL_23:
  v43 = v60[7];
  v44 = &v27[v43];
  v45 = &v28[v43];
  v46 = v13(v44, 1, v11);
  v47 = v13(v45, 1, v11);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v44, v45, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v44, 0, 1, v11);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v47)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v11);
LABEL_28:
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_29;
  }
  v55(v44, v45, v11);
LABEL_29:
  v49 = *(int *)(v56 + 28);
  v50 = (id *)&v22[v49];
  v51 = &v23[v49];
  v52 = *(void **)&v22[v49];
  if (!v52)
  {
LABEL_33:
    *(_OWORD *)v50 = *(_OWORD *)v51;
    goto LABEL_34;
  }
  if (!*(_QWORD *)v51)
  {
    sub_21C1C5F08(v50);
    goto LABEL_33;
  }
  *v50 = *(id *)v51;

  v53 = v50[1];
  v50[1] = (id)*((_QWORD *)v51 + 1);

LABEL_34:
  *(_QWORD *)&a1[v57[10]] = *(_QWORD *)((char *)v58 + v57[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsArticle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1D3DCC(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[6];
    }
    else
    {
      v12 = sub_21C1D8D18();
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[7];
      }
      else
      {
        v13 = sub_21C1D8CE8();
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[8];
        }
        else
        {
          v10 = type metadata accessor for NewsChannel();
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a3[9];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NewsArticle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1D3ED8(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_21C1C7098(0, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[6];
    }
    else
    {
      v12 = sub_21C1D8D18();
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[7];
      }
      else
      {
        v13 = sub_21C1D8CE8();
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[8];
        }
        else
        {
          v10 = type metadata accessor for NewsChannel();
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a4[9];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_21C1D3FD4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_21C1C7098(319, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_21C1D8D18();
    if (v1 <= 0x3F)
    {
      sub_21C1D8CE8();
      if (v2 <= 0x3F)
      {
        type metadata accessor for NewsChannel();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for NewsArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NewsArticle.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21C1D419C + 4 * byte_21C1DAD25[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21C1D41D0 + 4 * byte_21C1DAD20[v4]))();
}

uint64_t sub_21C1D41D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D41D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1D41E0);
  return result;
}

uint64_t sub_21C1D41EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1D41F4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21C1D41F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D4200(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsArticle.CodingKeys()
{
  return &type metadata for NewsArticle.CodingKeys;
}

unint64_t sub_21C1D4220()
{
  unint64_t result;

  result = qword_255246DD0;
  if (!qword_255246DD0)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DAECC, &type metadata for NewsArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246DD0);
  }
  return result;
}

unint64_t sub_21C1D4268()
{
  unint64_t result;

  result = qword_255246DD8;
  if (!qword_255246DD8)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DAE3C, &type metadata for NewsArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246DD8);
  }
  return result;
}

unint64_t sub_21C1D42B0()
{
  unint64_t result;

  result = qword_255246DE0;
  if (!qword_255246DE0)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DAE64, &type metadata for NewsArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246DE0);
  }
  return result;
}

uint64_t sub_21C1D42F4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEC0000004C52556CLL || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446873696C627570 && a2 == 0xEB00000000657461 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x73726F68747561 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_21C1D9594();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

void sub_21C1D4598()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255246DE8)
  {
    sub_21C1C7098(255, (unint64_t *)&qword_253F4B2D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255246DE8);
  }
}

uint64_t sub_21C1D4610(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_21C1C7098(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_21C1D4654(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_21C1D4698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  void **v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  char *v52;

  v4 = sub_21C1D8CE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C1D8EBC();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C1D8E8C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (void **)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void **, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v15 = (*(uint64_t (**)(void **, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == *MEMORY[0x24BE6C568])
  {
    (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
    v16 = *v14;
    v17 = (void *)objc_opt_self();
    sub_21C1D4E0C();
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21C1DAD10;
    v19 = objc_msgSend(v16, sel_identifier);
    v20 = sub_21C1D93CC();
    v22 = v21;

    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 32) = v20;
    *(_QWORD *)(v18 + 40) = v22;
    v23 = (void *)sub_21C1D93F0();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v17, sel_nss_NewsURLWithPathComponents_internal_, v23, 0);

    sub_21C1D8CDC();
    swift_unknownObjectRelease();

    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  if (v15 == *MEMORY[0x24BE6C560])
  {
    (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
    v25 = *v14;
    sub_21C1D4EA8();
    v52 = (char *)v14 + *(int *)(v26 + 48);
    v27 = (uint64_t)v14 + *(int *)(v26 + 64);
    swift_unknownObjectRelease();
    v28 = (void *)objc_opt_self();
    sub_21C1D4E0C();
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_21C1DAD10;
    v30 = objc_msgSend(v25, sel_identifier);
    v31 = a2;
    v32 = sub_21C1D93CC();
    v34 = v33;

    *(_QWORD *)(v29 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v29 + 32) = v32;
    *(_QWORD *)(v29 + 40) = v34;
    v35 = (void *)sub_21C1D93F0();
    swift_bridgeObjectRelease();
    v36 = objc_msgSend(v28, sel_nss_NewsURLWithPathComponents_internal_, v35, 0);

    sub_21C1D8CDC();
    swift_unknownObjectRelease();

    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v31, 0, 1, v4);
    __swift_destroy_boxed_opaque_existential_1(v27);
    v37 = sub_21C1D8F04();
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v52, v37);
  }
  if (v15 == *MEMORY[0x24BE6C550])
  {
    (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
    sub_21C1D4E64((uint64_t)v14, (uint64_t)v10);
    v39 = (void *)objc_opt_self();
    sub_21C1D4E0C();
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_21C1DAD10;
    v41 = sub_21C1D8EB0();
    *(_QWORD *)(v40 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v40 + 32) = v41;
    *(_QWORD *)(v40 + 40) = v42;
    v43 = (void *)sub_21C1D93F0();
    swift_bridgeObjectRelease();
    v44 = objc_msgSend(v39, sel_nss_NewsURLWithPathComponents_internal_, v43, 0);

    sub_21C1D8CDC();
    sub_21C1CBE40((uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BE6C598]);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  if (v15 == *MEMORY[0x24BE6C558])
  {
    (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
    v45 = *v14;
    v46 = v14[1];
    v47 = (void *)objc_opt_self();
    sub_21C1D4E0C();
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_21C1DAD10;
    *(_QWORD *)(v48 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v48 + 32) = v45;
    *(_QWORD *)(v48 + 40) = v46;
    v49 = (void *)sub_21C1D93F0();
    swift_bridgeObjectRelease();
    v50 = objc_msgSend(v47, sel_nss_NewsURLWithPathComponents_internal_, v49, 0);

    sub_21C1D8CDC();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  return (*(uint64_t (**)(void **, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t type metadata accessor for ArticleViewerRouter()
{
  return objc_opt_self();
}

uint64_t sub_21C1D4C20(uint64_t a1)
{
  return sub_21C1D4C68(a1);
}

uint64_t sub_21C1D4C40(uint64_t a1)
{
  return sub_21C1D4C68(a1);
}

uint64_t sub_21C1D4C68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  sub_21C1C4C44();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21C1D8CE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D4698(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_21C1CBE40((uint64_t)v4, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v11 = (void *)sub_21C1D8CC4();
  sub_21C1C904C(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_21C1C924C();
  v12 = (void *)sub_21C1D9390();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_21C1D4E0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F4B2C8)
  {
    v0 = sub_21C1D9588();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F4B2C8);
  }
}

uint64_t sub_21C1D4E64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21C1D8EBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21C1D4EA8()
{
  unint64_t TupleTypeMetadata;
  uint64_t v1;

  if (!qword_255246EB0)
  {
    MEMORY[0x24BDAC7A8](0);
    sub_21C1CB1E4();
    sub_21C1D8F04();
    sub_21C1C3B50(255, &qword_255246F20);
    sub_21C1C3B50(255, &qword_255246F28);
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_255246EB0);
  }
}

void sub_21C1D4FD8(void *a1@<X0>, double *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;

  sub_21C1C4C44();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v34 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  if (a1 && (v13 = objc_msgSend(a1, sel_bannerImageForWhiteBackground)) != 0)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_assetHandle);

    if (!v15)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    v16 = objc_msgSend(v15, sel_remoteURL);

    sub_21C1D8CDC();
    v17 = sub_21C1D8CE8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 0, 1, v17);
  }
  else
  {
    v18 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
  }
  v19 = (int *)type metadata accessor for NewsChannelLogoCollection();
  sub_21C1D6374((uint64_t)v12, (uint64_t)a2 + v19[5]);
  if (!a1 || (v20 = objc_msgSend(a1, sel_bannerImageForThemeBackground)) == 0)
  {
    v25 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v10, 1, 1, v25);
    sub_21C1D6374((uint64_t)v10, (uint64_t)a2 + v19[6]);
    if (!a1)
      goto LABEL_14;
    goto LABEL_11;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, sel_assetHandle);

  if (v22)
  {
    v23 = objc_msgSend(v22, sel_remoteURL);

    sub_21C1D8CDC();
    v24 = sub_21C1D8CE8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 0, 1, v24);
    sub_21C1D6374((uint64_t)v10, (uint64_t)a2 + v19[6]);
LABEL_11:
    v26 = objc_msgSend(a1, sel_bannerImageForMask);
    if (v26)
    {
      v27 = v26;
      v28 = objc_msgSend(v26, sel_assetHandle);

      if (v28)
      {
        v29 = objc_msgSend(v28, sel_remoteURL);

        sub_21C1D8CDC();
        v30 = sub_21C1D8CE8();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v7, 0, 1, v30);
        sub_21C1D6374((uint64_t)v7, (uint64_t)a2 + v19[7]);
        goto LABEL_15;
      }
      __break(1u);
      goto LABEL_19;
    }
LABEL_14:
    v31 = sub_21C1D8CE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v7, 1, 1, v31);
    sub_21C1D6374((uint64_t)v7, (uint64_t)a2 + v19[7]);
    if (!a1)
    {
      v33 = 1.0;
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(a1, sel_bannerImageScale);
    v33 = v32;
    swift_unknownObjectRelease();
LABEL_16:
    *a2 = v33;
    return;
  }
LABEL_20:
  __break(1u);
}

BOOL static NewsChannelLogoCollection.LogoTheme.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NewsChannelLogoCollection.LogoTheme.hash(into:)()
{
  return sub_21C1D95E8();
}

uint64_t NewsChannelLogoCollection.LogoTheme.hashValue.getter()
{
  sub_21C1D95DC();
  sub_21C1D95E8();
  return sub_21C1D95F4();
}

double NewsChannelLogoCollection.scale.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t NewsChannelLogoCollection.url(for:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = qword_21C1DB278[*a1];
  v5 = type metadata accessor for NewsChannelLogoCollection();
  return sub_21C1C4D80(v2 + *(int *)(v5 + 4 * v4), a2, (uint64_t (*)(_QWORD))sub_21C1C4C44);
}

uint64_t sub_21C1D5434(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C1D546C + 4 * byte_21C1DB030[a1]))(0xD000000000000012, 0x800000021C1DBE90);
}

uint64_t sub_21C1D546C()
{
  return 0x656C616373;
}

uint64_t sub_21C1D5494()
{
  return 0x6B73614D726F66;
}

uint64_t sub_21C1D54AC()
{
  unsigned __int8 *v0;

  return sub_21C1D5434(*v0);
}

uint64_t sub_21C1D54B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C1D726C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C1D54D8()
{
  sub_21C1D62D4();
  return sub_21C1D9618();
}

uint64_t sub_21C1D5500()
{
  sub_21C1D62D4();
  return sub_21C1D9624();
}

uint64_t NewsChannelLogoCollection.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;

  sub_21C1D6318(0, &qword_255246F30, MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D62D4();
  sub_21C1D960C();
  v13 = 0;
  sub_21C1D9570();
  if (!v1)
  {
    type metadata accessor for NewsChannelLogoCollection();
    v12 = 1;
    sub_21C1D8CE8();
    sub_21C1D7404(&qword_255246D80, MEMORY[0x24BDCDAE0]);
    sub_21C1D9558();
    v11 = 2;
    sub_21C1D9558();
    v10 = 3;
    sub_21C1D9558();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t NewsChannelLogoCollection.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v28 = a2;
  sub_21C1C4C44();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)&v26 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v26 - v8;
  sub_21C1D6318(0, &qword_255246F40, MEMORY[0x24BEE33E0]);
  v32 = v9;
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - v11;
  v13 = (int *)type metadata accessor for NewsChannelLogoCollection();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D62D4();
  v16 = v33;
  sub_21C1D9600();
  if (v16)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v33 = a1;
  v17 = v10;
  v19 = (uint64_t)v30;
  v18 = (uint64_t)v31;
  v37 = 0;
  v20 = v32;
  sub_21C1D9540();
  v27 = v15;
  *v15 = v21;
  sub_21C1D8CE8();
  v36 = 1;
  sub_21C1D7404(&qword_255246DB0, MEMORY[0x24BDCDB10]);
  sub_21C1D9528();
  sub_21C1D6374(v19, (uint64_t)v27 + v13[5]);
  v35 = 2;
  v22 = (uint64_t)v29;
  sub_21C1D9528();
  sub_21C1D6374(v22, (uint64_t)v27 + v13[6]);
  v34 = 3;
  sub_21C1D9528();
  v23 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v20);
  v24 = (uint64_t)v27;
  sub_21C1D6374(v18, (uint64_t)v27 + v13[7]);
  sub_21C1C4D80(v24, v28, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannelLogoCollection);
  __swift_destroy_boxed_opaque_existential_1(v23);
  return sub_21C1CBE40(v24, (uint64_t (*)(_QWORD))type metadata accessor for NewsChannelLogoCollection);
}

uint64_t sub_21C1D5A84@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return NewsChannelLogoCollection.init(from:)(a1, a2);
}

uint64_t sub_21C1D5A98(_QWORD *a1)
{
  return NewsChannelLogoCollection.encode(to:)(a1);
}

BOOL _s7NewsKit0A21ChannelLogoCollectionV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
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
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int (*v44)(_QWORD, _QWORD, _QWORD);
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v47)(_QWORD, _QWORD, _QWORD);
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v51;
  void (*v52)(_BYTE *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  double *v55;
  _BYTE *v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  unsigned int (*v64)(_QWORD, _QWORD, _QWORD);
  void (*v65)(_BYTE *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v74;
  char v75;
  uint64_t v76;
  void (*v77)(_BYTE *, uint64_t);
  _BYTE v78[12];
  int v79;
  unsigned int (*v80)(_QWORD, _QWORD, _QWORD);
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double *v86;
  double *v87;
  _BYTE *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;

  v4 = sub_21C1D8CE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v78[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21C1D4598();
  v9 = v8;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v78[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v93 = &v78[-v14];
  MEMORY[0x24BDAC7A8](v13);
  v16 = &v78[-v15];
  sub_21C1C4C44();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v20);
  v22 = MEMORY[0x24BDAC7A8](&v78[-v21]);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v92 = &v78[-v24];
  v25 = MEMORY[0x24BDAC7A8](v23);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = &v78[-v27];
  v29 = MEMORY[0x24BDAC7A8](v26);
  v36 = &v78[-v35];
  if (*a1 != *a2)
    return 0;
  v88 = v7;
  v89 = v31;
  v91 = v30;
  v83 = v29;
  v84 = v34;
  v85 = v33;
  v81 = v32;
  v82 = v12;
  v37 = type metadata accessor for NewsChannelLogoCollection();
  v38 = *(int *)(v37 + 20);
  v86 = a1;
  v39 = (uint64_t)a1 + v38;
  v40 = v5;
  sub_21C1C4D80(v39, (uint64_t)v36, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v90 = v37;
  v41 = *(int *)(v37 + 20);
  v87 = a2;
  sub_21C1C4D80((uint64_t)a2 + v41, (uint64_t)v28, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v42 = (uint64_t)&v16[*(int *)(v9 + 48)];
  sub_21C1C4D80((uint64_t)v36, (uint64_t)v16, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v43 = v40;
  sub_21C1C4D80((uint64_t)v28, v42, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v44 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v40 + 48);
  v45 = v9;
  v46 = v4;
  if (v44(v16, 1, v4) == 1)
  {
    sub_21C1CBE40((uint64_t)v28, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    sub_21C1CBE40((uint64_t)v36, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    if (v44(v42, 1, v4) == 1)
    {
      v47 = v44;
      sub_21C1CBE40((uint64_t)v16, (uint64_t (*)(_QWORD))sub_21C1C4C44);
      goto LABEL_9;
    }
LABEL_7:
    v49 = (uint64_t)v16;
LABEL_22:
    sub_21C1CBE40(v49, (uint64_t (*)(_QWORD))sub_21C1D4598);
    return 0;
  }
  v48 = v89;
  sub_21C1C4D80((uint64_t)v16, v89, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  if (v44(v42, 1, v46) == 1)
  {
    sub_21C1CBE40((uint64_t)v28, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    sub_21C1CBE40((uint64_t)v36, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v48, v46);
    goto LABEL_7;
  }
  v50 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v40 + 32);
  v80 = v44;
  v51 = v88;
  v50(v88, v42, v46);
  sub_21C1D7404((unint64_t *)&unk_255246DF0, MEMORY[0x24BDCDB00]);
  v79 = sub_21C1D939C();
  v52 = *(void (**)(_BYTE *, uint64_t))(v40 + 8);
  v52(v51, v46);
  sub_21C1CBE40((uint64_t)v28, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  sub_21C1CBE40((uint64_t)v36, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v52((_BYTE *)v48, v46);
  v43 = v40;
  sub_21C1CBE40((uint64_t)v16, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v47 = v80;
  if ((v79 & 1) == 0)
    return 0;
LABEL_9:
  v53 = v45;
  v54 = v90;
  v55 = v86;
  v56 = v92;
  sub_21C1C4D80((uint64_t)v86 + *(int *)(v90 + 24), (uint64_t)v92, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v57 = v87;
  v58 = (uint64_t)v87 + *(int *)(v54 + 24);
  v59 = v91;
  sub_21C1C4D80(v58, v91, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v89 = v53;
  v60 = v93;
  v61 = (uint64_t)&v93[*(int *)(v53 + 48)];
  sub_21C1C4D80((uint64_t)v56, (uint64_t)v93, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  sub_21C1C4D80(v59, v61, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  if (v47(v60, 1, v46) != 1)
  {
    v62 = v83;
    sub_21C1C4D80((uint64_t)v60, v83, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    if (v47(v61, 1, v46) != 1)
    {
      v63 = v88;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v43 + 32))(v88, v61, v46);
      sub_21C1D7404((unint64_t *)&unk_255246DF0, MEMORY[0x24BDCDB00]);
      LODWORD(v80) = sub_21C1D939C();
      v64 = v47;
      v65 = *(void (**)(_BYTE *, uint64_t))(v43 + 8);
      v65(v63, v46);
      sub_21C1CBE40(v91, (uint64_t (*)(_QWORD))sub_21C1C4C44);
      sub_21C1CBE40((uint64_t)v56, (uint64_t (*)(_QWORD))sub_21C1C4C44);
      v65((_BYTE *)v62, v46);
      v47 = v64;
      sub_21C1CBE40((uint64_t)v60, (uint64_t (*)(_QWORD))sub_21C1C4C44);
      if ((v80 & 1) == 0)
        return 0;
      goto LABEL_16;
    }
    sub_21C1CBE40(v91, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    sub_21C1CBE40((uint64_t)v56, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v62, v46);
    goto LABEL_14;
  }
  sub_21C1CBE40(v59, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  sub_21C1CBE40((uint64_t)v56, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  if (v47(v61, 1, v46) != 1)
  {
LABEL_14:
    v49 = (uint64_t)v60;
    goto LABEL_22;
  }
  sub_21C1CBE40((uint64_t)v60, (uint64_t (*)(_QWORD))sub_21C1C4C44);
LABEL_16:
  v66 = v90;
  v67 = (uint64_t)v55 + *(int *)(v90 + 28);
  v68 = v85;
  sub_21C1C4D80(v67, v85, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v69 = v84;
  sub_21C1C4D80((uint64_t)v57 + *(int *)(v66 + 28), v84, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v70 = (uint64_t)v82;
  v71 = (uint64_t)&v82[*(int *)(v89 + 48)];
  sub_21C1C4D80(v68, (uint64_t)v82, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  sub_21C1C4D80(v69, v71, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  if (v47(v70, 1, v46) == 1)
  {
    sub_21C1CBE40(v69, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    sub_21C1CBE40(v68, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    if (v47(v71, 1, v46) == 1)
    {
      sub_21C1CBE40(v70, (uint64_t (*)(_QWORD))sub_21C1C4C44);
      return 1;
    }
    goto LABEL_21;
  }
  v72 = v81;
  sub_21C1C4D80(v70, v81, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  if (v47(v71, 1, v46) == 1)
  {
    sub_21C1CBE40(v84, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    sub_21C1CBE40(v85, (uint64_t (*)(_QWORD))sub_21C1C4C44);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v72, v46);
LABEL_21:
    v49 = v70;
    goto LABEL_22;
  }
  v74 = v88;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v43 + 32))(v88, v71, v46);
  sub_21C1D7404((unint64_t *)&unk_255246DF0, MEMORY[0x24BDCDB00]);
  v75 = sub_21C1D939C();
  v76 = v70;
  v77 = *(void (**)(_BYTE *, uint64_t))(v43 + 8);
  v77(v74, v46);
  sub_21C1CBE40(v84, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  sub_21C1CBE40(v85, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  v77((_BYTE *)v72, v46);
  sub_21C1CBE40(v76, (uint64_t (*)(_QWORD))sub_21C1C4C44);
  return (v75 & 1) != 0;
}

uint64_t type metadata accessor for NewsChannelLogoCollection()
{
  uint64_t result;

  result = qword_253F4B098;
  if (!qword_253F4B098)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_21C1D62D4()
{
  unint64_t result;

  result = qword_255246F38;
  if (!qword_255246F38)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DB224, &type metadata for NewsChannelLogoCollection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246F38);
  }
  return result;
}

void sub_21C1D6318(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_21C1D62D4();
    v7 = a3(a1, &type metadata for NewsChannelLogoCollection.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_21C1D6374(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C1C4C44();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21C1D63BC()
{
  unint64_t result;

  result = qword_255246F48;
  if (!qword_255246F48)
  {
    result = MEMORY[0x220774CC4](&protocol conformance descriptor for NewsChannelLogoCollection.LogoTheme, &type metadata for NewsChannelLogoCollection.LogoTheme);
    atomic_store(result, (unint64_t *)&qword_255246F48);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NewsChannelLogoCollection(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_21C1D8CE8();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      sub_21C1C4C44();
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = a3[6];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    if (v12((char *)a2 + v15, 1, v10))
    {
      sub_21C1C4C44();
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    v19 = a3[7];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    if (v12(v21, 1, v10))
    {
      sub_21C1C4C44();
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v20, v21, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t destroy for NewsChannelLogoCollection(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v4 = a1 + a2[5];
  v5 = sub_21C1D8CE8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + a2[6];
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  v9 = a1 + a2[7];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v9, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return result;
}

_QWORD *initializeWithCopy for NewsChannelLogoCollection(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *a1 = *(_QWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[7];
  v18 = (char *)a1 + v17;
  v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *assignWithCopy for NewsChannelLogoCollection(char *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;

  *(_QWORD *)a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = v11(&a1[v21], 1, v9);
  v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    sub_21C1C4C44();
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v22, v23, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

_QWORD *initializeWithTake for NewsChannelLogoCollection(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *a1 = *(_QWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[7];
  v18 = (char *)a1 + v17;
  v19 = &a2[v17];
  if (v11(v19, 1, v9))
  {
    sub_21C1C4C44();
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v19, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  return a1;
}

char *assignWithTake for NewsChannelLogoCollection(char *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;

  *(_QWORD *)a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_21C1D8CE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_21C1C4C44();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v17, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    sub_21C1C4C44();
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v16, v17, v9);
LABEL_13:
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = v11(&a1[v21], 1, v9);
  v25 = v11(v23, 1, v9);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v22, v23, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v22, v9);
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    sub_21C1C4C44();
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v22, v23, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsChannelLogoCollection()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1D6ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_21C1C4C44();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v6);
}

uint64_t storeEnumTagSinglePayload for NewsChannelLogoCollection()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C1D6F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  sub_21C1C4C44();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1 + *(int *)(a4 + 20), a2, a2, v7);
}

void sub_21C1D6F80()
{
  unint64_t v0;

  sub_21C1C4C44();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t storeEnumTagSinglePayload for NewsChannelLogoCollection.LogoTheme(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1D7048 + 4 * byte_21C1DB039[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C1D707C + 4 * byte_21C1DB034[v4]))();
}

uint64_t sub_21C1D707C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D7084(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1D708CLL);
  return result;
}

uint64_t sub_21C1D7098(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1D70A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C1D70A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D70AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannelLogoCollection.LogoTheme()
{
  return &type metadata for NewsChannelLogoCollection.LogoTheme;
}

uint64_t storeEnumTagSinglePayload for NewsChannelLogoCollection.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C1D7114 + 4 * byte_21C1DB043[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C1D7148 + 4 * byte_21C1DB03E[v4]))();
}

uint64_t sub_21C1D7148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D7150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C1D7158);
  return result;
}

uint64_t sub_21C1D7164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C1D716CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C1D7170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C1D7178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsChannelLogoCollection.CodingKeys()
{
  return &type metadata for NewsChannelLogoCollection.CodingKeys;
}

unint64_t sub_21C1D7198()
{
  unint64_t result;

  result = qword_255246F50;
  if (!qword_255246F50)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DB1FC, &type metadata for NewsChannelLogoCollection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246F50);
  }
  return result;
}

unint64_t sub_21C1D71E0()
{
  unint64_t result;

  result = qword_255246F58;
  if (!qword_255246F58)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DB16C, &type metadata for NewsChannelLogoCollection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246F58);
  }
  return result;
}

unint64_t sub_21C1D7228()
{
  unint64_t result;

  result = qword_255246F60;
  if (!qword_255246F60)
  {
    result = MEMORY[0x220774CC4](&unk_21C1DB194, &type metadata for NewsChannelLogoCollection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255246F60);
  }
  return result;
}

uint64_t sub_21C1D726C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656C616373 && a2 == 0xE500000000000000;
  if (v3 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C1DBE90 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C1DBEB0 || (sub_21C1D9594() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B73614D726F66 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21C1D9594();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_21C1D7404(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21C1D8CE8();
    result = MEMORY[0x220774CC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for WebViewControllerFactory()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for EngagementUpsellBannerPropertiesProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PostPurchaseOnboardingPresenter()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for ToolbarNavigationArticleViewerFeatureVisibilityProvider()
{
  return &type metadata for ToolbarNavigationArticleViewerFeatureVisibilityProvider;
}

id sub_21C1D757C(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
  {
    v17 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v18 = a2;
    v19 = a3;
    v20 = a4;
    v21 = a5;
  }
  else
  {
    v17 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v18 = a6;
    v19 = a7;
    v20 = a8;
    v21 = a9;
  }
  return objc_msgSend(v17, sel_initWithRed_green_blue_alpha_, v18, v19, v20, v21);
}

uint64_t sub_21C1D7630@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = sub_21C1D9144();
  swift_allocObject();
  result = sub_21C1D9138();
  v4 = MEMORY[0x24BEB4860];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

unint64_t sub_21C1D7684@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  v2 = type metadata accessor for EngagementUpsellBannerPropertiesProvider();
  v3 = swift_allocObject();
  a1[3] = v2;
  result = sub_21C1D7838();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t type metadata accessor for ProviderAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1D76F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21C1D900C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B3A0);
  sub_21C1D9000();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEB4658], v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_21C1D8FAC();
  sub_21C1C42EC(0, (unint64_t *)&unk_253F4B350);
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

unint64_t sub_21C1D7838()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552470C8;
  if (!qword_2552470C8)
  {
    v1 = type metadata accessor for EngagementUpsellBannerPropertiesProvider();
    result = MEMORY[0x220774CC4](&unk_21C1DB2DC, v1);
    atomic_store(result, (unint64_t *)&qword_2552470C8);
  }
  return result;
}

uint64_t sub_21C1D7880@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for ArticleViewerRouter, &qword_2552470E0, (uint64_t)&unk_21C1DAFD4, a1);
}

uint64_t sub_21C1D789C@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for ArticleRouter, &qword_2552470D8, (uint64_t)&unk_21C1DA640, a1);
}

uint64_t sub_21C1D78B8@<X0>(uint64_t *a1@<X8>)
{
  return sub_21C1C4144((uint64_t (*)(uint64_t))type metadata accessor for SubscriptionsRouter, &qword_2552470D0, (uint64_t)&unk_21C1DABF4, a1);
}

uint64_t type metadata accessor for RouterAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1D78F4()
{
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B2E8);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B2F0);
  sub_21C1D9000();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1C42EC(0, &qword_253F4B368);
  sub_21C1D9000();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for SceneProvidingView()
{
  return objc_opt_self();
}

uint64_t sub_21C1D7B7C(uint64_t a1)
{
  return sub_21C1D7BA8(a1, (uint64_t (*)(void))sub_21C1CD4D4);
}

id sub_21C1D7B88(id *a1)
{
  return objc_msgSend(*a1, sel_enableFlushingWithFlushingThreshold_, 2);
}

uint64_t sub_21C1D7B9C(uint64_t a1)
{
  return sub_21C1D7BA8(a1, (uint64_t (*)(void))sub_21C1CDEFC);
}

uint64_t sub_21C1D7BA8(uint64_t a1, uint64_t (*a2)(void))
{
  if (qword_253F4B548 != -1)
    swift_once();
  return a2();
}

id sub_21C1D7BF8(uint64_t a1)
{
  return sub_21C1D7EB4(a1, 0x24BE6CBC8, (SEL *)&selRef_sharedInstance);
}

uint64_t sub_21C1D7C10(_QWORD *a1)
{
  uint64_t result;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D8C24(0, &qword_253F4BC38);
  result = sub_21C1D8F7C();
  if (!result)
    __break(1u);
  return result;
}

id sub_21C1D7C70()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedNetworkReachability);
  if (!result)
    __break(1u);
  return result;
}

id sub_21C1D7CA8(_QWORD *a1)
{
  id result;
  id v2;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BC40);
  result = (id)sub_21C1D8F7C();
  if (result)
  {
    v2 = objc_msgSend(result, sel_news_core_ConfigurationManager);
    swift_unknownObjectRelease();
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_21C1D7D30(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_readingHistory);
}

id sub_21C1D7D3C(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_readingList);
}

id sub_21C1D7D48(_QWORD *a1, SEL *a2)
{
  id result;
  void *v4;
  id v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D8C24(0, &qword_253F4BC38);
  result = (id)sub_21C1D8F7C();
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(result, *a2);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21C1D7DCC(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_subscriptionController);
}

void sub_21C1D7DD8(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_notificationController);
}

void sub_21C1D7DE4(_QWORD *a1, SEL *a2)
{
  void *v3;
  void *v4;
  id v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C1D8C24(0, &qword_253F4BC38);
  v3 = (void *)sub_21C1D8F7C();
  if (!v3)
  {
    __break(1u);
    goto LABEL_5;
  }
  v4 = v3;
  v5 = objc_msgSend(v3, *a2);

  if (!v5)
LABEL_5:
    __break(1u);
}

id sub_21C1D7E70(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_flintResourceManager);
}

id sub_21C1D7E7C(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_issueReadingHistory);
}

void sub_21C1D7E88(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_paidAccessChecker);
}

id sub_21C1D7E94(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_assetManager);
}

id sub_21C1D7EA0(uint64_t a1)
{
  return sub_21C1D7EB4(a1, 0x24BE6CCB8, (SEL *)&selRef_defaultAvailability);
}

id sub_21C1D7EB4(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend((id)objc_opt_self(), *a3);
}

id sub_21C1D7EE4()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6CCF8]), sel_init);
}

void sub_21C1D7F08(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_entitlementService);
}

void sub_21C1D7F14(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_purchaseController);
}

void sub_21C1D7F24(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_purchaseManager);
}

void sub_21C1D7F30(_QWORD *a1)
{
  sub_21C1D7DE4(a1, (SEL *)&selRef_bundleSubscriptionManager);
}

uint64_t sub_21C1D7F3C(void **a1, _QWORD *a2)
{
  void *v2;

  v2 = *a1;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_21C1D8C5C(0, &qword_255247308);
  objc_msgSend(v2, sel_setEntitlementsOverrideProvider_, sub_21C1D8F7C());
  return swift_unknownObjectRelease();
}

id sub_21C1D7FB8(_QWORD *a1)
{
  return sub_21C1D7D48(a1, (SEL *)&selRef_tagSettings);
}

id sub_21C1D7FC4()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StubAppActivityMonitor()), sel_init);
}

uint64_t type metadata accessor for NewsCoreAssembly()
{
  return objc_opt_self();
}

uint64_t sub_21C1D800C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t);
  void (*v6)(char *, uint64_t);
  uint64_t v8;

  v0 = sub_21C1D900C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BC38);
  sub_21C1D8FF4();
  swift_release();
  v4 = *MEMORY[0x24BEB4660];
  v5 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  sub_21C1D8F4C();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BD00);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FB8();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BC78);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BC40);
  sub_21C1D8FF4();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BC88);
  sub_21C1D8FF4();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C24(0, (unint64_t *)&unk_253F4BCA0);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&qword_253F4BD10);
  sub_21C1D8FF4();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C24(0, (unint64_t *)&unk_253F4BC50);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, (unint64_t *)&unk_253F4BC08);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BCF0);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BCE8);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BCC0);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, &qword_253F4BCF8);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, &qword_253F4BCE0);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, (unint64_t *)&unk_253F4BC28);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BD20);
  sub_21C1D8FF4();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, &qword_253F4BCD8);
  sub_21C1D8FF4();
  swift_release();
  swift_release();
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BC70);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, &qword_253F4BC98);
  sub_21C1D8FF4();
  swift_release();
  sub_21C1D8F4C();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BCB0);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BCC8);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C5C(0, &qword_253F4BD30);
  sub_21C1D8FF4();
  swift_release();
  sub_21C1D8F4C();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FAC();
  sub_21C1D8C24(0, (unint64_t *)&unk_253F4BC18);
  sub_21C1D8FF4();
  swift_release();
  v5(v3, v4, v0);
  sub_21C1D8F58();
  swift_release();
  swift_release();
  v6(v3, v0);
  sub_21C1D8FB8();
  sub_21C1D8C5C(0, (unint64_t *)&unk_253F4BC60);
  sub_21C1D8FF4();
  swift_release();
  return swift_release();
}

uint64_t sub_21C1D8C24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21C1D8C5C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21C1D8CAC()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_21C1D8CB8()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_21C1D8CC4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21C1D8CD0()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_21C1D8CDC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21C1D8CE8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21C1D8CF4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_21C1D8D00()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21C1D8D0C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21C1D8D18()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21C1D8D24()
{
  return MEMORY[0x24BE6CE50]();
}

uint64_t sub_21C1D8D30()
{
  return MEMORY[0x24BEB47D8]();
}

uint64_t sub_21C1D8D3C()
{
  return MEMORY[0x24BEB47E0]();
}

uint64_t sub_21C1D8D48()
{
  return MEMORY[0x24BEB47F0]();
}

uint64_t sub_21C1D8D54()
{
  return MEMORY[0x24BE03AE8]();
}

uint64_t sub_21C1D8D60()
{
  return MEMORY[0x24BE03AF0]();
}

uint64_t sub_21C1D8D6C()
{
  return MEMORY[0x24BE03AF8]();
}

uint64_t sub_21C1D8D78()
{
  return MEMORY[0x24BE03B00]();
}

uint64_t sub_21C1D8D84()
{
  return MEMORY[0x24BE03B08]();
}

uint64_t sub_21C1D8D90()
{
  return MEMORY[0x24BE03B10]();
}

uint64_t sub_21C1D8D9C()
{
  return MEMORY[0x24BE03B18]();
}

uint64_t sub_21C1D8DA8()
{
  return MEMORY[0x24BE03B20]();
}

uint64_t sub_21C1D8DB4()
{
  return MEMORY[0x24BE03B28]();
}

uint64_t sub_21C1D8DC0()
{
  return MEMORY[0x24BE03B70]();
}

uint64_t sub_21C1D8DCC()
{
  return MEMORY[0x24BE03B80]();
}

uint64_t sub_21C1D8DD8()
{
  return MEMORY[0x24BE03BD0]();
}

uint64_t sub_21C1D8DE4()
{
  return MEMORY[0x24BE03BD8]();
}

uint64_t sub_21C1D8DF0()
{
  return MEMORY[0x24BE03C08]();
}

uint64_t sub_21C1D8DFC()
{
  return MEMORY[0x24BE03C10]();
}

uint64_t sub_21C1D8E08()
{
  return MEMORY[0x24BE03C18]();
}

uint64_t sub_21C1D8E14()
{
  return MEMORY[0x24BE03C30]();
}

uint64_t sub_21C1D8E20()
{
  return MEMORY[0x24BE03C38]();
}

uint64_t sub_21C1D8E2C()
{
  return MEMORY[0x24BE03C58]();
}

uint64_t sub_21C1D8E38()
{
  return MEMORY[0x24BE03C68]();
}

uint64_t sub_21C1D8E44()
{
  return MEMORY[0x24BE03C70]();
}

uint64_t sub_21C1D8E50()
{
  return MEMORY[0x24BE03D08]();
}

uint64_t sub_21C1D8E5C()
{
  return MEMORY[0x24BE03D10]();
}

uint64_t sub_21C1D8E68()
{
  return MEMORY[0x24BE03D20]();
}

uint64_t sub_21C1D8E74()
{
  return MEMORY[0x24BE03D28]();
}

uint64_t sub_21C1D8E80()
{
  return MEMORY[0x24BE03D58]();
}

uint64_t sub_21C1D8E8C()
{
  return MEMORY[0x24BE6C570]();
}

uint64_t sub_21C1D8E98()
{
  return MEMORY[0x24BE6C580]();
}

uint64_t sub_21C1D8EA4()
{
  return MEMORY[0x24BE6C588]();
}

uint64_t sub_21C1D8EB0()
{
  return MEMORY[0x24BE6C590]();
}

uint64_t sub_21C1D8EBC()
{
  return MEMORY[0x24BE6C598]();
}

uint64_t sub_21C1D8EC8()
{
  return MEMORY[0x24BE6C5A8]();
}

uint64_t sub_21C1D8ED4()
{
  return MEMORY[0x24BE6C5B8]();
}

uint64_t sub_21C1D8EE0()
{
  return MEMORY[0x24BE6C5C0]();
}

uint64_t sub_21C1D8EEC()
{
  return MEMORY[0x24BE6C5C8]();
}

uint64_t sub_21C1D8EF8()
{
  return MEMORY[0x24BE6C5D8]();
}

uint64_t sub_21C1D8F04()
{
  return MEMORY[0x24BE6C5E0]();
}

uint64_t sub_21C1D8F10()
{
  return MEMORY[0x24BE6C5F0]();
}

uint64_t sub_21C1D8F1C()
{
  return MEMORY[0x24BE6C600]();
}

uint64_t sub_21C1D8F28()
{
  return MEMORY[0x24BE6C610]();
}

uint64_t sub_21C1D8F34()
{
  return MEMORY[0x24BE6C620]();
}

uint64_t sub_21C1D8F40()
{
  return MEMORY[0x24BE6C650]();
}

uint64_t sub_21C1D8F4C()
{
  return MEMORY[0x24BEB42F8]();
}

uint64_t sub_21C1D8F58()
{
  return MEMORY[0x24BEB4300]();
}

uint64_t sub_21C1D8F64()
{
  return MEMORY[0x24BEB4340]();
}

uint64_t sub_21C1D8F70()
{
  return MEMORY[0x24BEB43A0]();
}

uint64_t sub_21C1D8F7C()
{
  return MEMORY[0x24BEB43A8]();
}

uint64_t sub_21C1D8F88()
{
  return MEMORY[0x24BEB43B0]();
}

uint64_t sub_21C1D8F94()
{
  return MEMORY[0x24BEB43F0]();
}

uint64_t sub_21C1D8FA0()
{
  return MEMORY[0x24BEB43F8]();
}

uint64_t sub_21C1D8FAC()
{
  return MEMORY[0x24BEB4430]();
}

uint64_t sub_21C1D8FB8()
{
  return MEMORY[0x24BEB4438]();
}

uint64_t sub_21C1D8FC4()
{
  return MEMORY[0x24BEB44C8]();
}

uint64_t sub_21C1D8FD0()
{
  return MEMORY[0x24BEB4548]();
}

uint64_t sub_21C1D8FDC()
{
  return MEMORY[0x24BEB4550]();
}

uint64_t sub_21C1D8FE8()
{
  return MEMORY[0x24BEB4558]();
}

uint64_t sub_21C1D8FF4()
{
  return MEMORY[0x24BEB4560]();
}

uint64_t sub_21C1D9000()
{
  return MEMORY[0x24BEB4568]();
}

uint64_t sub_21C1D900C()
{
  return MEMORY[0x24BEB4668]();
}

uint64_t sub_21C1D9018()
{
  return MEMORY[0x24BEB4670]();
}

uint64_t sub_21C1D9024()
{
  return MEMORY[0x24BEB4698]();
}

uint64_t sub_21C1D9030()
{
  return MEMORY[0x24BEB46B0]();
}

uint64_t sub_21C1D903C()
{
  return MEMORY[0x24BEB46D0]();
}

uint64_t sub_21C1D9048()
{
  return MEMORY[0x24BEB46D8]();
}

uint64_t sub_21C1D9054()
{
  return MEMORY[0x24BEB46F0]();
}

uint64_t sub_21C1D9060()
{
  return MEMORY[0x24BEB4738]();
}

uint64_t sub_21C1D906C()
{
  return MEMORY[0x24BEB4748]();
}

uint64_t sub_21C1D9078()
{
  return MEMORY[0x24BEB4750]();
}

uint64_t sub_21C1D9084()
{
  return MEMORY[0x24BEB4758]();
}

uint64_t sub_21C1D9090()
{
  return MEMORY[0x24BE6CE00]();
}

uint64_t sub_21C1D909C()
{
  return MEMORY[0x24BE6CE08]();
}

uint64_t sub_21C1D90A8()
{
  return MEMORY[0x24BE6CE10]();
}

uint64_t sub_21C1D90B4()
{
  return MEMORY[0x24BE6CE18]();
}

uint64_t sub_21C1D90C0()
{
  return MEMORY[0x24BE6CE28]();
}

uint64_t sub_21C1D90CC()
{
  return MEMORY[0x24BE6CE30]();
}

uint64_t sub_21C1D90D8()
{
  return MEMORY[0x24BE6CE38]();
}

uint64_t sub_21C1D90E4()
{
  return MEMORY[0x24BE6CE48]();
}

uint64_t sub_21C1D90F0()
{
  return MEMORY[0x24BE6D1D8]();
}

uint64_t sub_21C1D90FC()
{
  return MEMORY[0x24BE6D1E0]();
}

uint64_t sub_21C1D9108()
{
  return MEMORY[0x24BE6D200]();
}

uint64_t sub_21C1D9114()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21C1D9120()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21C1D912C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21C1D9138()
{
  return MEMORY[0x24BEB4868]();
}

uint64_t sub_21C1D9144()
{
  return MEMORY[0x24BEB4870]();
}

uint64_t sub_21C1D9150()
{
  return MEMORY[0x24BEB4878]();
}

uint64_t sub_21C1D915C()
{
  return MEMORY[0x24BEB4888]();
}

uint64_t sub_21C1D9168()
{
  return MEMORY[0x24BEB4890]();
}

uint64_t sub_21C1D9174()
{
  return MEMORY[0x24BEB4898]();
}

uint64_t sub_21C1D9180()
{
  return MEMORY[0x24BEB48B0]();
}

uint64_t sub_21C1D918C()
{
  return MEMORY[0x24BEB48C0]();
}

uint64_t sub_21C1D9198()
{
  return MEMORY[0x24BEB48D8]();
}

uint64_t sub_21C1D91A4()
{
  return MEMORY[0x24BEB48E0]();
}

uint64_t sub_21C1D91B0()
{
  return MEMORY[0x24BE6C4D8]();
}

uint64_t sub_21C1D91BC()
{
  return MEMORY[0x24BE6C4E8]();
}

uint64_t sub_21C1D91C8()
{
  return MEMORY[0x24BE6C4F8]();
}

uint64_t sub_21C1D91D4()
{
  return MEMORY[0x24BE6C508]();
}

uint64_t sub_21C1D91E0()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_21C1D91EC()
{
  return MEMORY[0x24BDEAF68]();
}

uint64_t sub_21C1D91F8()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_21C1D9204()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_21C1D9210()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21C1D921C()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_21C1D9228()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_21C1D9234()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_21C1D9240()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_21C1D924C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_21C1D9258()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_21C1D9264()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_21C1D9270()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_21C1D927C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_21C1D9288()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_21C1D9294()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21C1D92A0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21C1D92AC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21C1D92B8()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_21C1D92C4()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_21C1D92D0()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_21C1D92DC()
{
  return MEMORY[0x24BE6CE98]();
}

uint64_t sub_21C1D92E8()
{
  return MEMORY[0x24BE6CEA0]();
}

uint64_t sub_21C1D92F4()
{
  return MEMORY[0x24BE6CEB0]();
}

uint64_t sub_21C1D9300()
{
  return MEMORY[0x24BE6CEC0]();
}

uint64_t sub_21C1D930C()
{
  return MEMORY[0x24BE6CED0]();
}

uint64_t sub_21C1D9318()
{
  return MEMORY[0x24BE6CEE0]();
}

uint64_t sub_21C1D9324()
{
  return MEMORY[0x24BE6CEF8]();
}

uint64_t sub_21C1D9330()
{
  return MEMORY[0x24BE6CF00]();
}

uint64_t sub_21C1D933C()
{
  return MEMORY[0x24BE6CF08]();
}

uint64_t sub_21C1D9348()
{
  return MEMORY[0x24BE6CF10]();
}

uint64_t sub_21C1D9354()
{
  return MEMORY[0x24BE6CF18]();
}

uint64_t sub_21C1D9360()
{
  return MEMORY[0x24BE6CF20]();
}

uint64_t sub_21C1D936C()
{
  return MEMORY[0x24BE6CF28]();
}

uint64_t sub_21C1D9378()
{
  return MEMORY[0x24BE6CF30]();
}

uint64_t sub_21C1D9384()
{
  return MEMORY[0x24BE6CF40]();
}

uint64_t sub_21C1D9390()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21C1D939C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21C1D93A8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21C1D93B4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21C1D93C0()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21C1D93CC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C1D93D8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C1D93E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21C1D93F0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21C1D93FC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21C1D9408()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21C1D9414()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21C1D9420()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_21C1D942C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21C1D9438()
{
  return MEMORY[0x24BEB48F0]();
}

uint64_t sub_21C1D9444()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21C1D9450()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21C1D945C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21C1D9468()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21C1D9474()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21C1D9480()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21C1D948C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21C1D9498()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C1D94A4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21C1D94B0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21C1D94BC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21C1D94C8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21C1D94D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21C1D94E0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21C1D94EC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21C1D94F8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21C1D9504()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_21C1D9510()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21C1D951C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21C1D9528()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21C1D9534()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21C1D9540()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_21C1D954C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21C1D9558()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21C1D9564()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21C1D9570()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_21C1D957C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21C1D9588()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_21C1D9594()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C1D95A0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21C1D95AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21C1D95B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21C1D95C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21C1D95D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21C1D95DC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C1D95E8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21C1D95F4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21C1D9600()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21C1D960C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21C1D9618()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21C1D9624()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t FCArticleCloudKitIDFromUUID()
{
  return MEMORY[0x24BE6C670]();
}

uint64_t FCBundle()
{
  return MEMORY[0x24BE6C678]();
}

uint64_t FCURLForContainerizedUserAccountCachesDirectory()
{
  return MEMORY[0x24BE6CA40]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}


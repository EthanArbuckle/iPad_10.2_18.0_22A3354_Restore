uint64_t sub_235DE55FC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235DE566C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18AccountsUISettings12AccountGroup__accounts;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_235DE56D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountGroup(0);
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

uint64_t sub_235DE570C()
{
  uint64_t v0;

  v0 = sub_235E18770();
  __swift_allocate_value_buffer(v0, qword_25429C098);
  __swift_project_value_buffer(v0, (uint64_t)qword_25429C098);
  return sub_235E18764();
}

uint64_t static AccountsUIModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25429C0B0 != -1)
    swift_once();
  v2 = sub_235E18770();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25429C098);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static AccountsUIModel.logger.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25429C0B0 != -1)
    swift_once();
  v2 = sub_235E18770();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25429C098);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static AccountsUIModel.logger.modify())()
{
  uint64_t v0;

  if (qword_25429C0B0 != -1)
    swift_once();
  v0 = sub_235E18770();
  __swift_project_value_buffer(v0, (uint64_t)qword_25429C098);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DE5994()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_235DE5A40(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_235DE5A90@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_235DE5AE4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_235DE5B4C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_235DE5B94()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AccountsUIModel(0)), sel_init);
  qword_25429C0B8 = (uint64_t)result;
  return result;
}

id AccountsUIModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AccountsUIModel.shared.getter()
{
  if (qword_25429BC90 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_25429C0B8;
}

void static AccountsUIModel.shared.setter(uint64_t a1)
{
  void *v2;

  if (qword_25429BC90 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_25429C0B8;
  qword_25429C0B8 = a1;

}

uint64_t (*static AccountsUIModel.shared.modify())()
{
  if (qword_25429BC90 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_235DE5D2C(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  _BYTE v16[40];
  id v17[2];
  __int128 v18;
  uint64_t v19;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v3 = v17[0];
  if (!v17[0])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v5 = v1;
    sub_235E187C4();
    v19 = 0;
    *(_OWORD *)v17 = 0u;
    v18 = 0u;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235DEFA8C((uint64_t)v17, (uint64_t)v16);
    v6 = v5;
    sub_235E187C4();
    sub_235DF0DA4((uint64_t)v17, (uint64_t *)&unk_25429C200);
    return;
  }
  v4 = objc_msgSend(v17[0], sel_accountPropertyForKey_, *MEMORY[0x24BDB3EE8]);
  if (v4)
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v17 = 0u;
    v18 = 0u;
  }
  sub_235DF0DA4((uint64_t)v17, &qword_25429C2E0);
  *((_BYTE *)v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile) = v4 != 0;
  sub_235DEB81C(v3);
  v8 = v7;
  swift_getKeyPath();
  swift_getKeyPath();
  v17[0] = v8;
  v9 = v1;
  sub_235E187C4();
  v10 = objc_msgSend(a1, sel_identifier);
  v11 = objc_msgSend(v3, sel_identifier);
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      sub_235DF2A90(0, &qword_256381BF0);
      v13 = v10;
      v14 = sub_235E18E90();

      if ((v14 & 1) != 0)
        goto LABEL_15;
      goto LABEL_14;
    }
    v12 = v10;
  }
  else if (!v11)
  {
    goto LABEL_15;
  }

LABEL_14:
  sub_235DEBA7C(v3, (uint64_t)v17);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235DEFA8C((uint64_t)v17, (uint64_t)v16);
  v15 = v9;
  sub_235E187C4();
  sub_235DF0DA4((uint64_t)v17, (uint64_t *)&unk_25429C200);
LABEL_15:

}

uint64_t sub_235DE6008()
{
  return sub_235DE66CC();
}

void sub_235DE601C(void *a1)
{
  void *v1;
  id v3;
  id v4;
  void *v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = a1;
  v4 = v1;
  sub_235E187C4();
  sub_235DE5D2C(v5);

}

uint64_t sub_235DE60F0@<X0>(_BYTE *a1@<X8>)
{
  return sub_235DEC610(a1);
}

uint64_t sub_235DE6104(_BYTE *a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  if (*a1 == 1)
  {
    sub_235DE9040();
    sub_235E18704();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_235E187C4();
}

uint64_t sub_235DE6190()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE61A4(char a1)
{
  void *v1;
  id v2;

  if ((a1 & 1) != 0)
  {
    sub_235DE9040();
    sub_235E18704();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  return sub_235E187C4();
}

uint64_t (*sub_235DE6230(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 9);
  return sub_235DE62BC;
}

uint64_t sub_235DE62BC(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(void **)a1;
  if (v2 == 1)
  {
    sub_235DE9040();
    sub_235E18704();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(_BYTE *)(a1 + 9) = v2;
  v4 = v3;
  return sub_235E187C4();
}

uint64_t sub_235DE6348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE635C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE6378()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE638C(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown, &qword_25429C1C8);
}

uint64_t (*sub_235DE63A8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381BB0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1C8);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235DE6474()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE6488@<X0>(_BYTE *a1@<X8>)
{
  return sub_235DEC610(a1);
}

uint64_t sub_235DE649C(uint64_t a1, void **a2)
{
  return sub_235DEC69C(a1, a2);
}

uint64_t sub_235DE64B0()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE64C4()
{
  return sub_235DE6850();
}

uint64_t (*sub_235DE64D8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235DE6554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE6568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE6584()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, &qword_25429C1C8);
}

uint64_t sub_235DE6598(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, &qword_25429C1C8);
}

uint64_t (*sub_235DE65B4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381BB0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1C8);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235DE667C()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE6690()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE66A4()
{
  return sub_235DE66CC();
}

uint64_t sub_235DE66B8()
{
  return sub_235DE66CC();
}

uint64_t sub_235DE66CC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235DE6734()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  return swift_release();
}

uint64_t sub_235DE6798@<X0>(_BYTE *a1@<X8>)
{
  return sub_235DEC610(a1);
}

uint64_t sub_235DE67AC(uint64_t a1, void **a2)
{
  return sub_235DEC69C(a1, a2);
}

uint64_t sub_235DE67C0()
{
  return sub_235DE67D4();
}

uint64_t sub_235DE67D4()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235DE683C()
{
  return sub_235DE6850();
}

uint64_t sub_235DE6850()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_235E187C4();
}

uint64_t (*sub_235DE68B4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

void sub_235DE692C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_235DE6978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, &qword_25429C1C8);
}

uint64_t sub_235DE698C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, &qword_25429C1C8);
}

uint64_t sub_235DE69A8()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, &qword_25429C1C8);
}

uint64_t sub_235DE69BC(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256381BB0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, &qword_25429C1C8);
}

uint64_t (*sub_235DE69D8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381BB0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1C8);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235DE6AA0()
{
  return sub_235DE66CC();
}

void sub_235DE6AB4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  if (!v9[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v1 = sub_235DE91E4();
  v2 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_monitoredAccountWithIdentifier_, v2);

  if (!v3)
  {
LABEL_5:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235E187B8();
    swift_release();
    swift_release();
    v5 = v9;
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = v0;
    sub_235E187C4();
    sub_235DE5D2C(v9);
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v3;
  sub_235E187B8();
  swift_release();
  swift_release();
  v5 = v9;
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v4;
  v7 = v0;
  sub_235E187C4();
  sub_235DE5D2C(v9);

LABEL_6:
}

uint64_t sub_235DE6CE8()
{
  return sub_235DE66CC();
}

void sub_235DE6CFC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile) & 1) == 0)
  {
    if (!sub_235DEF9A0())
    {
      v5 = (void *)sub_235E18D10();
      v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v5);

      if (v3)
      {
LABEL_13:
        v6 = (void *)sub_235E18D10();
        v7 = (void *)sub_235E18D10();
        v8 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v6, v7, 0);

        sub_235E18D40();
        return;
      }
      goto LABEL_15;
    }
    if (*(_BYTE *)(v0 + v1) != 1)
      return;
  }
  if (!sub_235DEF9A0())
  {
    v4 = (void *)sub_235E18D10();
    v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v4);

    if (v3)
      goto LABEL_13;
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  if (*(_BYTE *)(v0 + v1) == 1 && sub_235DEF9A0())
  {
    v2 = (void *)sub_235E18D10();
    v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

    if (v3)
      goto LABEL_13;
    goto LABEL_16;
  }
}

uint64_t sub_235DE6F58()
{
  uint64_t result;

  result = sub_235E18D10();
  qword_256382B38 = result;
  return result;
}

uint64_t sub_235DE6F8C()
{
  uint64_t result;

  result = sub_235E18D10();
  qword_256382B40 = result;
  return result;
}

id AccountsUIModel.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v19;
  char *v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t *v43;
  uint64_t v44;
  objc_class *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 aBlock;
  __int128 v71;
  uint64_t (*v72)(uint8_t *, void *);
  uint64_t v73;
  objc_super v74;
  char v75[48];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1B8);
  v68 = *(_QWORD *)(v1 - 8);
  v69 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v67 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1A0);
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C188);
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v61 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C160);
  v59 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v58 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C148);
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v55 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C170);
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1C8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C1E8);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost] = 0;
  v19 = &v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__selectedAccount];
  *(_QWORD *)&aBlock = 0;
  v20 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2B8);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v18, v15);
  *(_QWORD *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_toDeleteAccount] = 0;
  v21 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown];
  LOBYTE(aBlock) = 0;
  sub_235E18788();
  v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v22(v21, v14, v11);
  v23 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addOtherShown];
  LOBYTE(aBlock) = 0;
  sub_235E18788();
  v22(v23, v14, v11);
  v24 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown];
  LOBYTE(aBlock) = 0;
  sub_235E18788();
  v22(v24, v14, v11);
  v25 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__contactMergeAlertShown];
  LOBYTE(aBlock) = 0;
  sub_235E18788();
  v22(v25, v14, v11);
  v26 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__detailsPaneShown];
  LOBYTE(aBlock) = 0;
  sub_235E18788();
  v22(v26, v14, v11);
  v27 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountSetupView];
  *(_QWORD *)&aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C210);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v27, v10, v54);
  v28 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__persistentDetailModel];
  *(_QWORD *)&aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C110);
  v29 = v55;
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v28, v29, v57);
  v30 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountView];
  v72 = 0;
  aBlock = 0u;
  v71 = 0u;
  sub_235DEFA8C((uint64_t)&aBlock, (uint64_t)v75);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C200);
  v31 = v58;
  sub_235E18788();
  sub_235DF0DA4((uint64_t)&aBlock, (uint64_t *)&unk_25429C200);
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v30, v31, v60);
  v32 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView];
  LOBYTE(aBlock) = 1;
  sub_235E18788();
  v22(v32, v14, v11);
  v33 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountGroups];
  v34 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C230);
  v35 = v61;
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v33, v35, v63);
  v36 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountPath];
  *(_QWORD *)&aBlock = v34;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C260);
  v37 = v64;
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v36, v37, v66);
  v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_accountInstalledByProfile] = 0;
  v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter] = 0;
  *(_QWORD *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore] = 0;
  *(_QWORD *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore] = 0;
  v38 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accounts];
  *(_QWORD *)&aBlock = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C270);
  v39 = v67;
  sub_235E18788();
  v40 = v69;
  v41 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
  v41(v38, v39, v69);
  v42 = &v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts];
  *(_QWORD *)&aBlock = v34;
  sub_235E18788();
  v41(v42, v39, v40);
  v43 = (uint64_t *)&v20[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager];
  *v43 = sub_235DEFBEC();
  v43[1] = v44;

  v45 = (objc_class *)type metadata accessor for AccountsUIModel(0);
  v74.receiver = v20;
  v74.super_class = v45;
  v46 = objc_msgSendSuper2(&v74, sel_init);
  v47 = sub_235DE91E4();
  v48 = swift_allocObject();
  *(_QWORD *)(v48 + 16) = v46;
  v72 = sub_235DF0890;
  v73 = v48;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v71 = sub_235DEA3F4;
  *((_QWORD *)&v71 + 1) = &block_descriptor;
  v49 = _Block_copy(&aBlock);
  v50 = v46;
  swift_release();
  objc_msgSend(v47, sel_registerWithCompletion_, v49);
  _Block_release(v49);

  return v50;
}

uint64_t sub_235DE770C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_235DE7784(unint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  _BYTE v28[16];
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33[5];
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v3 = v2;
  v36 = *MEMORY[0x24BDAC8D0];
  if ((sub_235E18D94() & 1) != 0)
  {
    sub_235DE7BC0(0);
    sub_235DE9040();
    sub_235E18704();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v33[0]) = 1;
    v6 = v3;
    sub_235E187C4();
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  v7 = swift_release();
  MEMORY[0x24BDAC7A8](v7);
  v29 = a1;
  v30 = a2;
  v8 = sub_235DE9CC0((uint64_t (*)(id *))sub_235DF08B0, (uint64_t)v28, (unint64_t)v33[0]);
  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = v8;
    sub_235DE7BC0(v8);

    return;
  }
  v10 = sub_235E186A4();
  if (v11 >> 60 != 15)
  {
    v12 = v10;
    v13 = v11;
    v14 = (void *)objc_opt_self();
    v15 = (void *)sub_235E186B0();
    v33[0] = 0;
    v16 = objc_msgSend(v14, sel_propertyListWithData_options_format_error_, v15, 0, 0, v33);

    if (!v16)
    {
      v21 = v33[0];
      v22 = (void *)sub_235E18674();

      swift_willThrow();
      sub_235DF08CC(v12, v13);

      return;
    }
    v17 = v33[0];
    sub_235E18EF0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256381BB8);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_16:
      sub_235DF08CC(v12, v13);
      return;
    }
    v18 = v34;
    v31 = 0xD000000000000014;
    v32 = 0x8000000235E1E390;
    sub_235E18F20();
    if (*(_QWORD *)(v18 + 16) && (v19 = sub_235DECFD0((uint64_t)v33), (v20 & 1) != 0))
    {
      sub_235DF0958(*(_QWORD *)(v18 + 56) + 32 * v19, (uint64_t)&v34);
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_235DF0924((uint64_t)v33);
    if (*((_QWORD *)&v35 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v24 = v31;
        v23 = v32;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_235E187B8();
        swift_release();
        v25 = swift_release();
        v26 = v33[0];
        MEMORY[0x24BDAC7A8](v25);
        v29 = v24;
        v30 = v23;
        v27 = sub_235DE9CC0((uint64_t (*)(id *))sub_235DF2C78, (uint64_t)v28, (unint64_t)v26);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_235DE7BC0(v27);
        sub_235DF08CC(v12, v13);

        return;
      }
      goto LABEL_16;
    }
    sub_235DF08CC(v12, v13);
    sub_235DF0DA4((uint64_t)&v34, &qword_25429C2E0);
  }
}

void sub_235DE7BC0(id a1)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v3 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v5 = v16[2];
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_getKeyPath();
    KeyPath = swift_getKeyPath();
    sub_235E187B8();
    swift_release();
    swift_release();
    v7 = (uint64_t)v16;
    if (v16[2])
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v8 = v16[2];
        if (v8)
        {
LABEL_5:
          *(_QWORD *)(v7 + 16) = v8 - 1;
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          swift_getKeyPath();
          v16 = (_QWORD *)v7;
          v9 = v3;
          sub_235E187C4();
          sub_235DE6AB4();
          goto LABEL_6;
        }
LABEL_15:
        __break(1u);
LABEL_16:
        v2 = sub_235DF4494(0, v2[2] + 1, 1, v2);
        goto LABEL_9;
      }
    }
    else
    {
      __break(1u);
    }
    v7 = (uint64_t)sub_235DEF8F8(v16);
    v8 = *(_QWORD *)(v7 + 16);
    if (v8)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_6:
  if (!a1)
    return;
  a1 = a1;
  v10 = objc_msgSend(a1, sel_identifier);
  if (!v10)
  {
    __break(1u);
    return;
  }
  v11 = v10;
  v7 = sub_235E18D40();
  KeyPath = v12;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v2 = v16;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_16;
LABEL_9:
  v14 = v2[2];
  v13 = v2[3];
  if (v14 >= v13 >> 1)
    v2 = sub_235DF4494((_QWORD *)(v13 > 1), v14 + 1, 1, v2);
  v2[2] = v14 + 1;
  v15 = &v2[2 * v14];
  v15[4] = v7;
  v15[5] = KeyPath;
  swift_getKeyPath();
  swift_getKeyPath();
  v3;
  sub_235E187C4();
  sub_235DE6AB4();

}

void sub_235DE7E64(id a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  uint8_t *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  v3 = v2;
  v6 = sub_235E18770();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v10 = v26;
  if (!v26)
    goto LABEL_8;
  v11 = objc_msgSend(v26, sel_identifier);

  if (!v11)
    goto LABEL_8;
  v26 = 0;
  v27 = 0;
  sub_235E18D34();

  if (!v27)
    goto LABEL_8;
  if (v26 == a1 && v27 == a2)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v12 = sub_235E19028();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
LABEL_8:
    v13 = sub_235DE91E4();
    v14 = (void *)sub_235E18D10();
    v15 = objc_msgSend(v13, sel_accountWithIdentifier_, v14);

    if (v15)
    {
      if (qword_25429C0B0 != -1)
        swift_once();
      v16 = __swift_project_value_buffer(v6, (uint64_t)qword_25429C098);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
      v17 = sub_235E18E3C();
      v18 = sub_235E18758();
      if (os_log_type_enabled(v18, v17))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_235DE3000, v18, v17, "selecting added account!", v19, 2u);
        MEMORY[0x23B7E29C4](v19, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_getKeyPath();
      swift_getKeyPath();
      v20 = v15;
      sub_235E187B8();
      swift_release();
      swift_release();
      v21 = v25;
      swift_getKeyPath();
      swift_getKeyPath();
      v25 = v15;
      v22 = v20;
      v23 = v3;
      sub_235E187C4();
      sub_235DE5D2C(v21);

      v24 = v22;
      sub_235DE7BC0(v15);

    }
  }
}

void sub_235DE81A0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;
  void (*v11)(void **, _QWORD);
  BOOL *v12;
  void *v13;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v0 = v13;
  if (v13)
  {
    v1 = sub_235DE91E4();
    v2 = objc_msgSend(v1, sel_dataclassActionsForAccountDeletion_, v13);

    if (!v2)
      goto LABEL_10;
    type metadata accessor for Dataclass(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381BC8);
    sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
    v3 = sub_235E18D04();

    if (*(_QWORD *)(v3 + 16))
    {
      v4 = (id)*MEMORY[0x24BDB3DE8];
      v5 = sub_235DED000((uint64_t)v4);
      if ((v6 & 1) != 0)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        v8 = objc_msgSend((id)objc_opt_self(), sel_actionWithType_, 2);
        if (!v8)
        {
          __break(1u);
          return;
        }
        v9 = v8;
        v10 = sub_235DE83BC((uint64_t)v8, v7);

        swift_bridgeObjectRelease();
        if ((v10 & 1) != 0)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          v11 = (void (*)(void **, _QWORD))sub_235E187AC();
          *v12 = !*v12;
          v11(&v13, 0);
          swift_release();
          swift_release();
LABEL_11:

          return;
        }
LABEL_10:
        sub_235DE8694(0);
        goto LABEL_11;
      }

    }
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
}

uint64_t sub_235DE83BC(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_235E18FC8())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x23B7E2484](0, a2);
LABEL_5:
      v6 = v5;
      sub_235DF2A90(0, &qword_256381CE0);
      v7 = sub_235E18E90();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_235E18E90();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x23B7E2484](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_235E18E90();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_235DE8540(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_235E18D40();
  v5 = v4;
  if (v3 == sub_235E18D40() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_235E19028();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_235E18D40();
    v14 = v13;
    if (v12 == sub_235E18D40() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_235E19028();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

void sub_235DE8694(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  const void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id aBlock;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  void (*v39)();
  _QWORD *v40;

  v2 = v1;
  v4 = sub_235E18CA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235E18CC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v12 = aBlock;
  if (aBlock)
  {
    v13 = objc_msgSend(aBlock, sel_identifier);

    if (v13)
    {
      aBlock = 0;
      v36 = 0;
      sub_235E18D34();

      if (v36)
      {
        v34 = a1;
        v14 = sub_235DE91E4();
        v15 = v9;
        v16 = v8;
        v17 = v5;
        v18 = (void *)sub_235E18D10();
        swift_bridgeObjectRelease();
        v19 = objc_msgSend(v14, sel_accountWithIdentifier_, v18);

        v20 = v17;
        v21 = v16;
        v22 = v15;
        v23 = v34;

        if (v19)
        {
          sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
          v24 = sub_235E18E6C();
          v33 = v21;
          v25 = (void *)v24;
          v26 = (_QWORD *)swift_allocObject();
          v26[2] = v2;
          v26[3] = v19;
          v26[4] = v23;
          v39 = sub_235DF2AFC;
          v40 = v26;
          aBlock = (id)MEMORY[0x24BDAC760];
          v36 = 1107296256;
          v37 = sub_235DFD288;
          v38 = &block_descriptor_79;
          v27 = _Block_copy(&aBlock);
          v32 = v20;
          v28 = v27;
          swift_bridgeObjectRetain();
          v29 = v2;
          v30 = v19;
          swift_release();
          sub_235E18CBC();
          aBlock = (id)MEMORY[0x24BEE4AF8];
          sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
          sub_235DF1D50();
          sub_235E18EFC();
          MEMORY[0x23B7E23A0](0, v11, v7, v28);
          _Block_release(v28);

          (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v4);
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v33);
        }
      }
    }
  }
}

void sub_235DE89AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  sub_235DE7BC0(0);
  v5 = sub_235DE91E4();
  if (a3)
  {
    type metadata accessor for Dataclass(0);
    sub_235DF2A90(0, &qword_256381CE0);
    sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
    v6 = (void *)sub_235E18CF8();
  }
  else
  {
    v6 = 0;
  }
  v8[4] = sub_235DE8AD4;
  v8[5] = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_235E07A48;
  v8[3] = &block_descriptor_82;
  v7 = _Block_copy(v8);
  objc_msgSend(v5, sel_removeAccount_withDataclassActions_completion_, a2, v6, v7);
  _Block_release(v7);

}

uint64_t sub_235DE8AD4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  os_log_type_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_235E18770();
  v4 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v8 = a2;
    if (qword_25429C0B0 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v3, (uint64_t)qword_25429C098);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v9, v3);
    v10 = sub_235E18E48();
    v11 = a2;
    v12 = a2;
    v13 = sub_235E18758();
    v14 = v10;
    if (os_log_type_enabled(v13, v10))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v21 = (uint64_t)a2;
      v22 = v16;
      *(_DWORD *)v15 = 136315138;
      v20 = v15 + 4;
      v17 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381CC8);
      v18 = sub_235E18D4C();
      v21 = sub_235E0A4D0(v18, v19, &v22);
      sub_235E18EB4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235DE3000, v13, v14, "Failed removal with error: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E29C4](v16, -1, -1);
      MEMORY[0x23B7E29C4](v15, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

BOOL static AccountsUIModel.FilterType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountsUIModel.FilterType.hash(into:)()
{
  return sub_235E19064();
}

uint64_t AccountsUIModel.FilterType.hashValue.getter()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

BOOL sub_235DE8DA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235DE8DB8()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

uint64_t sub_235DE8DFC()
{
  return sub_235E19064();
}

uint64_t sub_235DE8E24()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

uint64_t sub_235DE8E64@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_235DE8EB4(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_235DE8F00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_235DE8F4C(char *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*sub_235DE8F9C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DE8FE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235DE9040();
  *a1 = result;
  return result;
}

uint64_t sub_235DE9008(_QWORD *a1, _QWORD *a2)
{
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_235DE9040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore);
  }
  else
  {
    v3 = v0;
    sub_235E18740();
    swift_allocObject();
    v2 = sub_235E18734();
    sub_235E1871C();
    *(_QWORD *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E2904]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235DE9110()
{
  return sub_235DEA278();
}

uint64_t sub_235DE911C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = a1;
  return swift_release();
}

uint64_t (*sub_235DE9134(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_235DE9040();
  return sub_235DE9168;
}

uint64_t sub_235DE9168(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___suggestionStore) = *a1;
  return swift_release();
}

id sub_235DE9180@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_235DE91E4();
  *a1 = result;
  return result;
}

void sub_235DE91A8(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore);
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = *a1;
  v3 = v2;

}

id sub_235DE91E4()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v1 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore;
  v2 = *(void **)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore];
  }
  else
  {
    if (qword_25429BC98 != -1)
      swift_once();
    v4 = swift_bridgeObjectRetain();
    sub_235DEF90C(v4);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C8);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_235E19610;
    *(_QWORD *)(v5 + 32) = sub_235E18D40();
    *(_QWORD *)(v5 + 40) = v6;
    *(_QWORD *)(v5 + 48) = sub_235E18D40();
    *(_QWORD *)(v5 + 56) = v7;
    v8 = objc_allocWithZone(MEMORY[0x24BDB43D0]);
    v9 = v0;
    v10 = (void *)sub_235E18E18();
    swift_bridgeObjectRelease();
    v11 = (void *)sub_235E18DB8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v8, sel_initWithAccountTypes_propertiesToPrefetch_delegate_, v10, v11, v9);

    v13 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v12;
    v3 = v12;

    v2 = 0;
  }
  v14 = v2;
  return v3;
}

void sub_235DE9368(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = a1;

}

void (*sub_235DE937C(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_235DE91E4();
  return sub_235DE93B0;
}

void sub_235DE93B0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore) = v2;

}

uint64_t sub_235DE93CC()
{
  return sub_235DE66CC();
}

uint64_t sub_235DE93E0(unint64_t a1)
{
  void *v1;
  char *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned __int8 v7;
  unint64_t v8;

  swift_getKeyPath();
  swift_getKeyPath();
  v8 = a1;
  v3 = v1;
  sub_235E187C4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v4 = (unsigned __int8 *)&v3[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  v7 = *v4;
  v5 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(a1, &v7);
  swift_bridgeObjectRelease();
  return sub_235DE9534(v5);
}

uint64_t sub_235DE94E4@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235DE94F8()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_235DE9534(v0);
}

uint64_t sub_235DE9520()
{
  return sub_235DE66CC();
}

uint64_t sub_235DE9534(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v1;
  sub_235E187C4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  sub_235DEA480(a1);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v3;
  return sub_235E187C4();
}

uint64_t (*sub_235DE9640(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[2] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  *a1 = a1[1];
  return sub_235DE96CC;
}

uint64_t sub_235DE96CC(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
    return sub_235DE9534(*a1);
  v2 = swift_bridgeObjectRetain();
  sub_235DE9534(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DE9714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, &qword_25429C1B8);
}

uint64_t sub_235DE9728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_235E18794();
  return swift_endAccess();
}

uint64_t sub_235DE9794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256381BE0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, &qword_25429C1B8);
}

uint64_t sub_235DE97B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_235E187A0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_235DE98C8()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, &qword_25429C1B8);
}

uint64_t sub_235DE98DC(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_235E18794();
  return swift_endAccess();
}

uint64_t sub_235DE9940(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256381BE0, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, &qword_25429C1B8);
}

uint64_t sub_235DE995C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_235E187A0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_235DE9A34(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381BE0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1B8);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

void sub_235DE9AFC(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_235E187A0();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_235E187A0();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id sub_235DE9C14(id *a1, uint64_t a2, uint64_t a3)
{
  id result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = objc_msgSend(*a1, sel_identifier);
  if (result)
  {
    v6 = result;
    v7 = sub_235E18D40();
    v9 = v8;

    if (a3)
    {
      if (v7 == a2 && v9 == a3)
        LOBYTE(a3) = 1;
      else
        LOBYTE(a3) = sub_235E19028();
    }
    swift_bridgeObjectRelease();
    return (id)(a3 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_235DE9CC0(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_235E18FC8())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E2484](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_235DE9DE0(uint8_t *a1, void *a2, void *a3)
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
  uint64_t result;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t aBlock[7];

  v44 = a3;
  v45 = (unint64_t)a1;
  v4 = sub_235E18CA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235E18CC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235E18770();
  v13 = *(_QWORD *)(v12 - 8);
  result = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v17 = v16;
    v18 = a2;
    if (qword_25429C0B0 != -1)
      swift_once();
    v19 = v12;
    v20 = __swift_project_value_buffer(v12, (uint64_t)qword_25429C098);
    swift_beginAccess();
    v21 = v13;
    v22 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v17, v20, v19);
    v23 = sub_235E18E48();
    v24 = a2;
    v25 = a2;
    v26 = sub_235E18758();
    v27 = v23;
    if (os_log_type_enabled(v26, v23))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v46 = (uint64_t)a2;
      v47 = v29;
      *(_DWORD *)v28 = 136315138;
      v45 = (unint64_t)(v28 + 4);
      v30 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381CC8);
      v31 = sub_235E18D4C();
      v46 = sub_235E0A4D0(v31, v32, &v47);
      sub_235E18EB4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235DE3000, v26, v27, "error retrieving accounts %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E29C4](v29, -1, -1);
      MEMORY[0x23B7E29C4](v28, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v22, v19);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v17, v19);
    }
  }
  else
  {
    v33 = v44;
    v43 = v8;
    if (v45)
    {
      v42 = v5;
      if (v45 >> 62)
      {
        v40 = swift_bridgeObjectRetain();
        v34 = (uint64_t)sub_235DF45A0(v40);
        swift_bridgeObjectRelease();
      }
      else
      {
        v34 = v45 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      aBlock[0] = v34;
      sub_235DEDF0C(aBlock);
      v35 = aBlock[0];
      sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
      v36 = (void *)sub_235E18E6C();
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = v33;
      *(_QWORD *)(v37 + 24) = v35;
      aBlock[4] = (uint64_t)sub_235DF2B70;
      aBlock[5] = v37;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_235DFD288;
      aBlock[3] = (uint64_t)&block_descriptor_88;
      v38 = _Block_copy(aBlock);
      v39 = v33;
      swift_release();
      sub_235E18CBC();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
      sub_235DF1D50();
      sub_235E18EFC();
      MEMORY[0x23B7E23A0](0, v11, v7, v38);
      _Block_release(v38);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v4);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v43);
    }
  }
  return result;
}

uint64_t sub_235DEA278()
{
  sub_235E18C80();
  sub_235E18848();
  return swift_release();
}

uint64_t sub_235DEA2D4(void *a1, unint64_t a2)
{
  char *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v8;
  unsigned __int8 v9;

  swift_getKeyPath();
  swift_getKeyPath();
  v8 = a2;
  swift_bridgeObjectRetain();
  v4 = a1;
  sub_235E187C4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v5 = (unsigned __int8 *)&v4[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  v9 = *v5;
  v6 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(v8, &v9);
  swift_bridgeObjectRelease();
  return sub_235DE9534(v6);
}

uint64_t sub_235DEA3F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
    v4 = sub_235E18DC4();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235DEA480(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v26[3];
  uint64_t v27;
  unint64_t v28;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235E19620;
  *(_QWORD *)(inited + 32) = 0x616E616D5F746F6ELL;
  *(_QWORD *)(inited + 40) = 0xEB00000000646567;
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(inited + 48) = MEMORY[0x24BEE4AF8];
  v6 = sub_235E0104C(inited);
  v28 = v6;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    v13 = swift_bridgeObjectRetain();
    v7 = sub_235DF45A0(v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  v26[0] = v7;
  sub_235DEDF0C((uint64_t *)v26);
  v8 = (unint64_t)v26[0];
  if (((unint64_t)v26[0] & 0x8000000000000000) != 0 || ((unint64_t)v26[0] & 0x4000000000000000) != 0)
  {
    swift_retain();
    v9 = sub_235E18FC8();
    if (v9)
      goto LABEL_7;
LABEL_16:
    swift_release_n();
    goto LABEL_17;
  }
  v9 = *((_QWORD *)v26[0] + 2);
  swift_retain();
  if (!v9)
    goto LABEL_16;
LABEL_7:
  if (v9 < 1)
  {
    __break(1u);
    goto LABEL_25;
  }
  v10 = 0;
  do
  {
    if ((v8 & 0xC000000000000001) != 0)
      v11 = (id)MEMORY[0x23B7E2484](v10, v8);
    else
      v11 = *(id *)(v8 + 8 * v10 + 32);
    v12 = v11;
    ++v10;
    v26[0] = v11;
    sub_235DEA7D0(v26, (uint64_t *)&v28);

  }
  while (v9 != v10);
  swift_release_n();
  v6 = v28;
LABEL_17:
  v27 = v5;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_27;
  v14 = sub_235DECF6C(0x616E616D5F746F6ELL, 0xEB00000000646567);
  if ((v15 & 1) == 0)
    goto LABEL_27;
  v16 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v14);
  if (v16 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain_n();
    v20 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (v20 >= 1)
      goto LABEL_21;
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v17 < 1)
    goto LABEL_26;
LABEL_21:
  type metadata accessor for AccountGroup(0);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0x616E616D5F746F6ELL;
  v18[3] = 0xEB00000000646567;
  v18[4] = 0;
  v18[5] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C270);
  sub_235E18788();
  swift_endAccess();
  v19 = swift_bridgeObjectRelease();
  MEMORY[0x23B7E22D4](v19);
  if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E18DDC();
  sub_235E18DF4();
  sub_235E18DD0();
LABEL_27:
  v21 = v2;
  v22 = swift_bridgeObjectRetain();
  v23 = sub_235DF2484(v22);
  swift_bridgeObjectRelease();

  sub_235DEAD38(v23);
  v24 = v27;
  swift_bridgeObjectRelease();
  return v24;
}

id sub_235DEA7D0(id *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id result;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = 0xEB00000000646567;
  v4 = 0x616E616D5F746F6ELL;
  v5 = *a1;
  v6 = objc_msgSend(*a1, sel_managingOwnerIdentifier);
  if (v6)
  {

    if (objc_msgSend(v5, sel_accountPropertyForKey_, *MEMORY[0x24BDB3F70]))
    {
      sub_235E18EF0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v38, 0, sizeof(v38));
    }
    sub_235DF2A24((uint64_t)v38, (uint64_t)&v39, &qword_25429C2E0);
    if (v41)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v4 = v36;
        v3 = v37;
      }
    }
    else
    {
      sub_235DF0DA4((uint64_t)&v39, &qword_25429C2E0);
    }
  }
  result = objc_msgSend(v5, sel_accountType);
  if (result)
  {
    v8 = result;
    v9 = objc_msgSend(result, sel_identifier);

    if (v9)
    {
      v10 = sub_235E18D40();
      v12 = v11;

      v13 = sub_235E18D40();
      if (v12)
      {
        if (v10 == v13 && v12 == v14)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v16 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v16 & 1) == 0)
            goto LABEL_20;
        }
        v28 = objc_msgSend(v5, sel_identifier);
        if (v28)
        {
          v29 = v28;
          v39 = 0;
          v40 = 0;
          sub_235E18D34();

          v30 = v40;
          if (v40)
          {
            v4 = v39;
            swift_bridgeObjectRelease();
            v17 = 1;
            v3 = v30;
LABEL_21:
            v18 = *a2;
            if (*(_QWORD *)(*a2 + 16))
            {
              swift_bridgeObjectRetain();
              v19 = sub_235DECF6C(v4, v3);
              if ((v20 & 1) != 0)
              {
                v21 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v19);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                v39 = v21;
                if ((v17 & 1) != 0)
                {
                  if (!(v21 >> 62))
                  {
                    v22 = v5;
LABEL_26:
                    sub_235DEEA28(0, 0, (uint64_t)v5);
LABEL_35:
                    v32 = v39;
                    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    *(_QWORD *)&v38[0] = *a2;
                    *a2 = 0x8000000000000000;
                    sub_235DEF348(v32, v4, v3, isUniquelyReferenced_nonNull_native);
                    v27 = *(_QWORD *)&v38[0];
                    goto LABEL_36;
                  }
                  swift_bridgeObjectRetain();
                  v34 = v5;
                  v35 = sub_235E18FC8();
                  swift_bridgeObjectRelease();
                  if ((v35 & 0x8000000000000000) == 0)
                    goto LABEL_26;
                  __break(1u);
                }
                else
                {
                  v31 = v5;
                  MEMORY[0x23B7E22D4]();
                  if (*(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  {
LABEL_34:
                    sub_235E18DF4();
                    sub_235E18DD0();
                    goto LABEL_35;
                  }
                }
                sub_235E18DDC();
                goto LABEL_34;
              }
              swift_bridgeObjectRelease();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2D8);
            v23 = swift_allocObject();
            *(_OWORD *)(v23 + 16) = xmmword_235E19630;
            *(_QWORD *)(v23 + 32) = v5;
            v39 = v23;
            sub_235E18DD0();
            v24 = v39;
            v25 = v5;
            v26 = swift_isUniquelyReferenced_nonNull_native();
            v39 = *a2;
            *a2 = 0x8000000000000000;
            sub_235DEF348(v24, v4, v3, v26);
            v27 = v39;
LABEL_36:
            *a2 = v27;
            swift_bridgeObjectRelease();
            return (id)swift_bridgeObjectRelease();
          }
        }
LABEL_20:
        v17 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      sub_235E18D40();
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_235DEABE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_235DF4494(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t sub_235DEAD38(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_235E18FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B7E2490](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_235DF6CEC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_235E18FC8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_235E18DD0();
  }
  __break(1u);
  return result;
}

uint64_t sub_235DEAEF0(void *a1, char a2)
{
  void *v2;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v5 = sub_235E18CA4();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_235E18CC8();
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
  v12 = (void *)sub_235E18E6C();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v2;
  *(_BYTE *)(v13 + 24) = a2;
  *(_QWORD *)(v13 + 32) = a1;
  aBlock[4] = sub_235DF1D40;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DFD288;
  aBlock[3] = &block_descriptor_73;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  v16 = a1;
  swift_release();
  sub_235E18CBC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235DF1B80(&qword_25429C220, v6, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
  sub_235DF1D50();
  sub_235E18EFC();
  MEMORY[0x23B7E23A0](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_235DEB100()
{
  sub_235E18C80();
  sub_235E18848();
  return swift_release();
}

void sub_235DEB164(void *a1, char a2, void *a3)
{
  uint64_t v3;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  id v24;
  char *v25;
  void *v26;
  id v27;
  id v28;
  char *v29;
  unint64_t v30;
  uint64_t v31[3];
  id v32;

  v7 = sub_235DE91E4();
  v8 = objc_msgSend(v7, sel_monitoredAccounts);

  sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
  v9 = sub_235E18DC4();

  if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
  {
    v30 = swift_bridgeObjectRetain();
    v10 = (uint64_t)sub_235DF45A0(v30);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v31[0] = v10;
  sub_235DEDF0C(v31);
  if (v3)
  {
    swift_release();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
  v11 = v31[0];
  swift_getKeyPath();
  swift_getKeyPath();
  v31[0] = v11;
  v12 = a1;
  sub_235E187C4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v13 = v31[0];
  v14 = &v12[OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_filter];
  swift_beginAccess();
  LOBYTE(v32) = *v14;
  v15 = _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(v13, (unsigned __int8 *)&v32);
  swift_bridgeObjectRelease();
  sub_235DE9534(v15);
  v16 = objc_msgSend(a3, sel_identifier);
  swift_getKeyPath();
  swift_getKeyPath();
  if ((a2 & 1) == 0)
  {
    sub_235E187B8();
    swift_release();
    swift_release();
    v21 = v32;
    v18 = objc_msgSend(v32, sel_identifier);

    if (v16)
    {
      if (!v18)
        goto LABEL_14;
      sub_235DF2A90(0, &qword_256381BF0);
      v22 = v16;
      v23 = sub_235E18E90();

      if ((v23 & 1) == 0)
        return;
    }
    else if (v18)
    {
LABEL_18:

      return;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235E187B8();
    swift_release();
    swift_release();
    v24 = v32;
    v25 = v12;
    v26 = sub_235DF2828((unint64_t)v24);

    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235E187B8();
    swift_release();
    swift_release();
    v27 = v32;
    swift_getKeyPath();
    swift_getKeyPath();
    v32 = v26;
    v28 = v26;
    v29 = v25;
    sub_235E187C4();
    sub_235DE5D2C(v27);

    return;
  }
  sub_235E187B8();
  swift_release();
  swift_release();
  v17 = v32;
  v18 = objc_msgSend(v32, sel_identifier);

  if (!v16)
  {
    if (!v18)
    {
LABEL_16:
      sub_235DE7BC0(0);
      return;
    }
    goto LABEL_18;
  }
  if (!v18)
  {
LABEL_14:

    return;
  }
  sub_235DF2A90(0, &qword_256381BF0);
  v19 = v16;
  v20 = sub_235E18E90();

  if ((v20 & 1) != 0)
    goto LABEL_16;
}

uint64_t sub_235DEB5D0(void *a1)
{
  return sub_235DEAEF0(a1, 0);
}

uint64_t sub_235DEB620(void *a1)
{
  return sub_235DEAEF0(a1, 1);
}

uint64_t sub_235DEB670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  char v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v5 = (uint64_t *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_pluginManager + 8);
  if (*(_QWORD *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v10 = sub_235DECF6C(a1, a2);
    if ((v11 & 1) != 0)
    {
      sub_235DF0DF8(*(_QWORD *)(v6 + 56) + 40 * v10, (uint64_t)&v13);
    }
    else
    {
      v15 = 0;
      v13 = 0u;
      v14 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v14 + 1))
      return sub_235DF0DE0(&v13, (uint64_t)a3);
    v7 = *v5;
  }
  else
  {
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
  }
  a3[3] = type metadata accessor for GenericAccountsUIPlugin();
  a3[4] = &off_250735CC0;
  *a3 = v7;
  swift_retain();
  return sub_235DF0DA4((uint64_t)&v13, &qword_256381BE8);
}

void sub_235DEB784(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(a1, sel_accountType);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_identifier);

    if (v5)
    {
      v6 = sub_235E18D40();
      v8 = v7;

      sub_235DEB670(v6, v8, a2);
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235DEB81C(void *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18[3];
  uint64_t v19;
  uint64_t v20;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  v2 = v18[0];
  if (v18[0])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235E187B8();
    swift_release();
    swift_release();
    v3 = objc_msgSend(v18[0], sel_identifier);

    v4 = objc_msgSend(a1, sel_identifier);
    v5 = v4;
    if (v3)
    {
      if (v4)
      {
        sub_235DF2A90(0, &qword_256381BF0);
        v6 = v3;
        v7 = sub_235E18E90();

        if ((v7 & 1) == 0)
          goto LABEL_10;
LABEL_7:
        swift_getKeyPath();
        swift_getKeyPath();
        v18[0] = a1;
        v8 = a1;
        v9 = v2;
        sub_235E187C4();
        return;
      }
      v5 = v3;
    }
    else if (!v4)
    {
      goto LABEL_7;
    }

    v2 = v5;
LABEL_10:

  }
  v10 = objc_msgSend(a1, sel_accountType);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, sel_identifier);

    if (v12)
    {
      v13 = sub_235E18D40();
      v15 = v14;

      sub_235DEB670(v13, v15, v18);
      swift_bridgeObjectRelease();
      v16 = v19;
      v17 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(void *, uint64_t, uint64_t))(v17 + 24))(a1, v16, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235DEBA7C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ValueMetadata *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ValueMetadata *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  ValueMetadata *v28;
  unint64_t v29;
  _QWORD v30[3];
  ValueMetadata *v31;
  unint64_t v32;

  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  if (v30[0])
  {
    v31 = &type metadata for AccountSettingsDetailModelView;
    v32 = sub_235DF1CC8();
    type metadata accessor for AccountsUISettingsDetailModel(0);
    sub_235DF1B80(&qword_256381CC0, type metadata accessor for AccountsUISettingsDetailModel, (uint64_t)&protocol conformance descriptor for AccountsUISettingsDetailModel);
    v30[0] = sub_235E18854();
    v30[1] = v4;
    sub_235DF0DA4(a2, (uint64_t *)&unk_25429C200);
    sub_235DF2A24((uint64_t)v30, a2, (uint64_t *)&unk_25429C200);
    return;
  }
  v5 = objc_msgSend(a1, sel_accountType);
  if (!v5)
  {
    __break(1u);
    goto LABEL_13;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, sel_identifier);

  if (!v7)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v8 = sub_235E18D40();
  v10 = v9;

  sub_235DEB670(v8, v10, v30);
  swift_bridgeObjectRelease();
  v11 = v31;
  v12 = v32;
  __swift_project_boxed_opaque_existential_1(v30, (uint64_t)v31);
  v13 = (*(uint64_t (**)(void *, ValueMetadata *, unint64_t))(v12 + 32))(a1, v11, v12);
  if (v13)
  {
    v14 = v13;
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    v28 = &type metadata for AccountSettingsDetailView;
    v27[0] = sub_235E188A8();
    v27[1] = v15;
    v29 = sub_235DF1C84();
    v27[2] = v14;
  }
  else
  {
    v16 = v31;
    v17 = v32;
    __swift_project_boxed_opaque_existential_1(v30, (uint64_t)v31);
    v18 = (*(uint64_t (**)(void *, ValueMetadata *, unint64_t))(v17 + 40))(a1, v16, v17);
    if (v18)
    {
      v28 = (ValueMetadata *)MEMORY[0x24BDF4780];
      v29 = MEMORY[0x24BDF4760];
      v27[0] = v18;
    }
    else
    {
      sub_235E18944();
      v19 = sub_235E18A34();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v28 = (ValueMetadata *)MEMORY[0x24BDF1FA8];
      v29 = MEMORY[0x24BDF1F80];
      v26 = swift_allocObject();
      v27[0] = v26;
      *(_QWORD *)(v26 + 16) = v19;
      *(_QWORD *)(v26 + 24) = v21;
      *(_BYTE *)(v26 + 32) = v23 & 1;
      *(_QWORD *)(v26 + 40) = v25;
    }
  }
  sub_235DF0DA4(a2, (uint64_t *)&unk_25429C200);
  sub_235DF2A24((uint64_t)v27, a2, (uint64_t *)&unk_25429C200);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

void sub_235DEBD84(uint64_t a1, void *a2, void *a3, uint64_t a4, void (*a5)(id, void (*)(_QWORD), uint64_t), uint64_t a6, void (*a7)(BOOL), uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  id v27;
  uint64_t v28;
  os_log_type_t v29;
  NSObject *v30;
  uint8_t *v31;
  uint8_t *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void (*v39)(id, void (*)(_QWORD), uint64_t);
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;

  v15 = sub_235E18770();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    goto LABEL_20;
  v41 = a4;
  v45 = a2;
  v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CC8);
  sub_235DF2A90(0, &qword_256381CD0);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_20;
  v39 = a5;
  v40 = a6;
  v42 = v43;
  v20 = objc_msgSend(v43, sel_domain);
  v21 = sub_235E18D40();
  v23 = v22;

  if (v21 == sub_235E18D40() && v23 == v24)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {

LABEL_20:
      a7(a2 == 0);
      return;
    }
  }
  v27 = v42;
  if (objc_msgSend(v42, sel_code) != (id)3)
  {

    goto LABEL_20;
  }
  if (qword_25429C0B0 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v15, (uint64_t)qword_25429C098);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v28, v15);
  v29 = sub_235E18E48();
  v30 = sub_235E18758();
  if (os_log_type_enabled(v30, v29))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_235DE3000, v30, v29, "Failed to verify credential. Prompting", v31, 2u);
    v32 = v31;
    v27 = v42;
    MEMORY[0x23B7E29C4](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v33 = objc_msgSend(a3, sel_identifier);
  if (!v33)
    goto LABEL_21;
  v34 = v33;
  v43 = 0;
  v44 = 0;
  sub_235E18D34();

  if (!v44)
    goto LABEL_21;
  v35 = sub_235DE91E4();
  v36 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v35, sel_accountWithIdentifier_, v36);

  v27 = v42;
  if (v37)
  {
    v39(v37, (void (*)(_QWORD))a7, a8);

  }
  else
  {
LABEL_21:
    a7(0);

  }
}

id AccountsUIModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountsUIModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235DEC378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountsUIModel(0);
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

uint64_t sub_235DEC3B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235DEC430(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_235E187C4();
}

uint64_t sub_235DEC4A0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235DEC51C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235DEC594@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

void sub_235DEC5A8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_235DE601C(v1);
}

uint64_t sub_235DEC5D4@<X0>(_BYTE *a1@<X8>)
{
  return sub_235DEC610(a1);
}

uint64_t sub_235DEC5E8(uint64_t a1, void **a2)
{
  return sub_235DEC69C(a1, a2);
}

uint64_t sub_235DEC5FC@<X0>(_BYTE *a1@<X8>)
{
  return sub_235DEC610(a1);
}

uint64_t sub_235DEC610@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235DEC688(uint64_t a1, void **a2)
{
  return sub_235DEC69C(a1, a2);
}

uint64_t sub_235DEC69C(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_235E187C4();
}

uint64_t sub_235DEC704@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235DEC718(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v3 = v2;
  return sub_235E187C4();
}

uint64_t sub_235DEC78C@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235DEC7A0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235DEC818(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_235E187C4();
}

uint64_t sub_235DEC888()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  return swift_release();
}

uint64_t sub_235DEC8F0(uint64_t a1, void **a2)
{
  void *v3;
  id v4;
  uint64_t v6;
  _BYTE v7[40];

  sub_235DEFA8C(a1, (uint64_t)v7);
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235DEFA8C((uint64_t)v7, (uint64_t)&v6);
  v4 = v3;
  sub_235E187C4();
  return sub_235DF0DA4((uint64_t)v7, (uint64_t *)&unk_25429C200);
}

uint64_t sub_235DEC97C@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235DEC990(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_235E187C4();
}

uint64_t sub_235DECA04@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

void sub_235DECA18(uint64_t a1, void **a2)
{
  void *v2;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v2;
  sub_235E187C4();
  sub_235DE6AB4();
}

uint64_t sub_235DECA98@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235DECAAC()
{
  unint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_235DE93E0(v0);
}

uint64_t sub_235DECAD4(uint64_t a1, uint64_t a2)
{
  return sub_235DECB9C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0CD8]);
}

uint64_t sub_235DECAE0()
{
  sub_235E18D40();
  sub_235E18D70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DECB20()
{
  uint64_t v0;

  sub_235E18D40();
  sub_235E19058();
  sub_235E18D70();
  v0 = sub_235E19070();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_235DECB90(uint64_t a1, uint64_t a2)
{
  return sub_235DECB9C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_235DECB9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_235E18D40();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_235DECBD8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_235E18D28();
  *a2 = 0;
  return result;
}

uint64_t sub_235DECC4C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_235E18D34();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_235DECCC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_235E18D40();
  v2 = sub_235E18D10();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_235DECD08(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_235DECD14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_235E18D40();
  v2 = v1;
  if (v0 == sub_235E18D40() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_235E19028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_235DECD9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235E18D10();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_235DECDE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235E18D40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_QWORD *sub_235DECE08@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_235DECE18()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

uint64_t sub_235DECE5C()
{
  return sub_235E19064();
}

uint64_t sub_235DECE84()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

BOOL sub_235DECEC4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235DECED8()
{
  sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
  sub_235DF1B80(&qword_256381CA0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19B84);
  return sub_235E19004();
}

uint64_t sub_235DECF5C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_235DECF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235E19058();
  sub_235E18D70();
  v4 = sub_235E19070();
  return sub_235DED0D8(a1, a2, v4);
}

unint64_t sub_235DECFD0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235E18F08();
  return sub_235DED1B8(a1, v2);
}

unint64_t sub_235DED000(uint64_t a1)
{
  uint64_t v2;

  sub_235E18D40();
  sub_235E19058();
  sub_235E18D70();
  v2 = sub_235E19070();
  swift_bridgeObjectRelease();
  return sub_235DED27C(a1, v2);
}

unint64_t sub_235DED080(unsigned __int8 a1)
{
  uint64_t v2;

  sub_235E19058();
  sub_235E19064();
  v2 = sub_235E19070();
  return sub_235DED3F0(a1, v2);
}

unint64_t sub_235DED0D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235E19028() & 1) == 0)
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
      while (!v14 && (sub_235E19028() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_235DED1B8(uint64_t a1, uint64_t a2)
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
      sub_235DF2B08(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7E243C](v9, a1);
      sub_235DF0924((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_235DED27C(uint64_t a1, uint64_t a2)
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
    v6 = sub_235E18D40();
    v8 = v7;
    if (v6 == sub_235E18D40() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_235E19028();
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
          v13 = sub_235E18D40();
          v15 = v14;
          if (v13 == sub_235E18D40() && v15 == v16)
            break;
          v18 = sub_235E19028();
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

unint64_t sub_235DED3F0(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_235DED490(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_235E19058();
  swift_bridgeObjectRetain();
  sub_235E18D70();
  v8 = sub_235E19070();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_235E19028() & 1) != 0)
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
      if (v19 || (sub_235E19028() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_235DED918(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_235DED63C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CD8);
  v3 = sub_235E18F38();
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
      sub_235E19058();
      sub_235E18D70();
      result = sub_235E19070();
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

uint64_t sub_235DED918(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_235DED63C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_235DEDAB0();
      goto LABEL_22;
    }
    sub_235DEDC60();
  }
  v11 = *v4;
  sub_235E19058();
  sub_235E18D70();
  result = sub_235E19070();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_235E19028(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_235E19040();
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
          result = sub_235E19028();
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

void *sub_235DEDAB0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CD8);
  v2 = *v0;
  v3 = sub_235E18F2C();
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

uint64_t sub_235DEDC60()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CD8);
  v3 = sub_235E18F38();
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
    sub_235E19058();
    swift_bridgeObjectRetain();
    sub_235E18D70();
    result = sub_235E19070();
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

uint64_t sub_235DEDF0C(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_235DF70B0();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_235DEDF84(v6);
  return sub_235E18F8C();
}

void sub_235DEDF84(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  int v19;
  id *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  char v39;
  char v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  char v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  char *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;

  v3 = a1[1];
  v4 = sub_235E1901C();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_235DEE698(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_140;
  v6 = v4;
  v103 = a1;
  if (v3 < 2)
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
    v112 = MEMORY[0x24BEE4AF8];
    v111 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_98:
      if (v12 >= 2)
      {
        v96 = *v103;
        do
        {
          v97 = v12 - 2;
          if (v12 < 2)
            goto LABEL_127;
          if (!v96)
            goto LABEL_139;
          v98 = *(_QWORD *)&v9[16 * v97 + 32];
          v99 = *(_QWORD *)&v9[16 * v12 + 24];
          sub_235DEE768((id *)(v96 + 8 * v98), (id *)(v96 + 8 * *(_QWORD *)&v9[16 * v12 + 16]), v96 + 8 * v99, v111);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_128;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v9 = sub_235DF6AC4((uint64_t)v9);
          if (v97 >= *((_QWORD *)v9 + 2))
            goto LABEL_129;
          v100 = &v9[16 * v97 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v9 + 2);
          if (v12 > v101)
            goto LABEL_130;
          memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v101 - v12));
          *((_QWORD *)v9 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v112 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_235E18DD0();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v7 = v5 >> 1;
    sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
    v8 = sub_235E18DE8();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v111 = (char *)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v112 = v8;
  }
  v106 = v6;
  v10 = 0;
  v11 = *a1;
  v104 = *a1 - 8;
  v105 = *a1 + 16;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v108 = v3;
  while (1)
  {
    v13 = v10++;
    v109 = v13;
    if (v10 < v3)
    {
      v14 = v9;
      v15 = *(void **)(v11 + 8 * v13);
      v16 = *(id *)(v11 + 8 * v10);
      v17 = v15;
      _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v16, v17);
      v19 = v18;

      v10 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v20 = (id *)(v105 + 8 * v13);
        while (1)
        {
          v21 = *(v20 - 1);
          v22 = *v20;
          v23 = v21;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v22, v23);
          v25 = v24;

          if (((v19 ^ v25) & 1) != 0)
            break;
          ++v10;
          ++v20;
          v3 = v108;
          if (v108 == v10)
          {
            v10 = v108;
            goto LABEL_22;
          }
        }
        v3 = v108;
LABEL_22:
        v13 = v109;
      }
      v9 = v14;
      if ((v19 & 1) != 0)
      {
        if (v10 < v13)
          goto LABEL_133;
        if (v13 < v10)
        {
          v26 = (uint64_t *)(v104 + 8 * v10);
          v27 = v10;
          v28 = v13;
          v29 = (uint64_t *)(v11 + 8 * v13);
          do
          {
            if (v28 != --v27)
            {
              if (!v11)
                goto LABEL_138;
              v30 = *v29;
              *v29 = *v26;
              *v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v13))
        goto LABEL_131;
      if (v10 - v13 < v106)
        break;
    }
LABEL_48:
    if (v10 < v13)
      goto LABEL_126;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_235DF6924(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v43 = *((_QWORD *)v9 + 2);
    v42 = *((_QWORD *)v9 + 3);
    v12 = v43 + 1;
    if (v43 >= v42 >> 1)
      v9 = sub_235DF6924((char *)(v42 > 1), v43 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v12;
    v44 = v9 + 32;
    v45 = &v9[16 * v43 + 32];
    *(_QWORD *)v45 = v13;
    *((_QWORD *)v45 + 1) = v10;
    if (v43)
    {
      v110 = v10;
      while (1)
      {
        v46 = v12 - 1;
        if (v12 >= 4)
        {
          v51 = &v44[16 * v12];
          v52 = *((_QWORD *)v51 - 8);
          v53 = *((_QWORD *)v51 - 7);
          v57 = __OFSUB__(v53, v52);
          v54 = v53 - v52;
          if (v57)
            goto LABEL_115;
          v56 = *((_QWORD *)v51 - 6);
          v55 = *((_QWORD *)v51 - 5);
          v57 = __OFSUB__(v55, v56);
          v49 = v55 - v56;
          v50 = v57;
          if (v57)
            goto LABEL_116;
          v58 = v12 - 2;
          v59 = &v44[16 * v12 - 32];
          v61 = *(_QWORD *)v59;
          v60 = *((_QWORD *)v59 + 1);
          v57 = __OFSUB__(v60, v61);
          v62 = v60 - v61;
          if (v57)
            goto LABEL_118;
          v57 = __OFADD__(v49, v62);
          v63 = v49 + v62;
          if (v57)
            goto LABEL_121;
          if (v63 >= v54)
          {
            v81 = &v44[16 * v46];
            v83 = *(_QWORD *)v81;
            v82 = *((_QWORD *)v81 + 1);
            v57 = __OFSUB__(v82, v83);
            v84 = v82 - v83;
            if (v57)
              goto LABEL_125;
            v74 = v49 < v84;
            goto LABEL_86;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v75 = *((_QWORD *)v9 + 4);
            v76 = *((_QWORD *)v9 + 5);
            v57 = __OFSUB__(v76, v75);
            v68 = v76 - v75;
            v69 = v57;
            goto LABEL_80;
          }
          v48 = *((_QWORD *)v9 + 4);
          v47 = *((_QWORD *)v9 + 5);
          v57 = __OFSUB__(v47, v48);
          v49 = v47 - v48;
          v50 = v57;
        }
        if ((v50 & 1) != 0)
          goto LABEL_117;
        v58 = v12 - 2;
        v64 = &v44[16 * v12 - 32];
        v66 = *(_QWORD *)v64;
        v65 = *((_QWORD *)v64 + 1);
        v67 = __OFSUB__(v65, v66);
        v68 = v65 - v66;
        v69 = v67;
        if (v67)
          goto LABEL_120;
        v70 = &v44[16 * v46];
        v72 = *(_QWORD *)v70;
        v71 = *((_QWORD *)v70 + 1);
        v57 = __OFSUB__(v71, v72);
        v73 = v71 - v72;
        if (v57)
          goto LABEL_123;
        if (__OFADD__(v68, v73))
          goto LABEL_124;
        if (v68 + v73 >= v49)
        {
          v74 = v49 < v73;
LABEL_86:
          if (v74)
            v46 = v58;
          goto LABEL_88;
        }
LABEL_80:
        if ((v69 & 1) != 0)
          goto LABEL_119;
        v77 = &v44[16 * v46];
        v79 = *(_QWORD *)v77;
        v78 = *((_QWORD *)v77 + 1);
        v57 = __OFSUB__(v78, v79);
        v80 = v78 - v79;
        if (v57)
          goto LABEL_122;
        if (v80 < v68)
          goto LABEL_14;
LABEL_88:
        v85 = v46 - 1;
        if (v46 - 1 >= v12)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
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
          goto LABEL_135;
        }
        v86 = v11;
        if (!v11)
          goto LABEL_137;
        v87 = v9;
        v88 = &v44[16 * v85];
        v89 = *(_QWORD *)v88;
        v90 = v44;
        v91 = v46;
        v92 = &v44[16 * v46];
        v93 = *((_QWORD *)v92 + 1);
        v94 = v86;
        sub_235DEE768((id *)(v86 + 8 * *(_QWORD *)v88), (id *)(v86 + 8 * *(_QWORD *)v92), v86 + 8 * v93, v111);
        if (v1)
          goto LABEL_109;
        if (v93 < v89)
          goto LABEL_112;
        if (v91 > *((_QWORD *)v87 + 2))
          goto LABEL_113;
        *(_QWORD *)v88 = v89;
        *(_QWORD *)&v90[16 * v85 + 8] = v93;
        v95 = *((_QWORD *)v87 + 2);
        if (v91 >= v95)
          goto LABEL_114;
        v9 = v87;
        v12 = v95 - 1;
        memmove(v92, v92 + 16, 16 * (v95 - 1 - v91));
        v44 = v90;
        *((_QWORD *)v87 + 2) = v95 - 1;
        v11 = v94;
        v10 = v110;
        if (v95 <= 2)
          goto LABEL_14;
      }
    }
    v12 = 1;
LABEL_14:
    v3 = v108;
    if (v10 >= v108)
      goto LABEL_98;
  }
  if (__OFADD__(v13, v106))
    goto LABEL_134;
  if (v13 + v106 >= v3)
    v31 = v3;
  else
    v31 = v13 + v106;
  if (v31 >= v13)
  {
    if (v10 != v31)
    {
      v102 = v9;
      v32 = v104 + 8 * v10;
      v107 = v31;
      do
      {
        v33 = *(void **)(v11 + 8 * v10);
        v34 = v13;
        v35 = v32;
        do
        {
          v36 = *(void **)v35;
          v37 = v33;
          v38 = v36;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v37, v38);
          v40 = v39;

          if ((v40 & 1) == 0)
            break;
          if (!v11)
            goto LABEL_136;
          v41 = *(void **)v35;
          v33 = *(void **)(v35 + 8);
          *(_QWORD *)v35 = v33;
          *(_QWORD *)(v35 + 8) = v41;
          v35 -= 8;
          ++v34;
        }
        while (v10 != v34);
        ++v10;
        v32 += 8;
        v13 = v109;
      }
      while (v10 != v107);
      v10 = v107;
      v9 = v102;
    }
    goto LABEL_48;
  }
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
  sub_235E18FBC();
  __break(1u);
}

void sub_235DEE698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  char v15;
  void *v16;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = *a4;
    v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    v8 = *(void **)(v6 + 8 * v4);
    v9 = a1;
    v10 = v7;
    while (1)
    {
      v11 = *(void **)v10;
      v12 = v8;
      v13 = v11;
      _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v12, v13);
      v15 = v14;

      if ((v15 & 1) == 0)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v6)
        break;
      v16 = *(void **)v10;
      v8 = *(void **)(v10 + 8);
      *(_QWORD *)v10 = v8;
      *(_QWORD *)(v10 + 8) = v16;
      v10 -= 8;
      if (v4 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_235DEE768(id *a1, id *__src, unint64_t a3, char *a4)
{
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  char v19;
  id *v20;
  char *v21;
  id *v22;
  id *v23;
  id *v24;
  void *v25;
  id v26;
  id v27;
  char v28;
  char v29;
  uint64_t result;
  char *v33;
  void **v34;
  id *v35;

  v35 = a1;
  v5 = __src;
  v6 = (char *)__src - (char *)a1;
  v7 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0)
    v7 = (char *)__src - (char *)a1;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)__src;
  v10 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v10 = a3 - (_QWORD)__src;
  v11 = v10 >> 3;
  v34 = (void **)a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != (char *)__src || &__src[v11] <= (id *)a4)
        memmove(a4, __src, 8 * v11);
      v21 = &a4[8 * v11];
      v33 = v21;
      v35 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        v22 = (id *)(a3 - 8);
        v23 = v5;
        do
        {
          v24 = v22 + 1;
          v25 = *--v23;
          v26 = *((id *)v21 - 1);
          v27 = v25;
          _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v26, v27);
          v29 = v28;

          if ((v29 & 1) != 0)
          {
            if (v24 != v5 || v22 >= v5)
              *v22 = *v23;
            v35 = v23;
          }
          else
          {
            v33 = v21 - 8;
            if (v24 < (id *)v21 || v22 >= (id *)v21 || v24 != (id *)v21)
              *v22 = (id)*((_QWORD *)v21 - 1);
            v23 = v5;
            v21 -= 8;
          }
          if (v23 <= a1)
            break;
          --v22;
          v5 = v23;
        }
        while (v21 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v8] <= (id *)a4)
      memmove(a4, a1, 8 * v8);
    v12 = (void **)&a4[8 * v8];
    v33 = (char *)v12;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      v13 = (void **)a4;
      v14 = a1;
      do
      {
        v15 = *v13;
        v16 = *v5;
        v17 = v15;
        _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(v16, v17);
        v19 = v18;

        if ((v19 & 1) != 0)
        {
          v20 = v5 + 1;
          if (v14 < v5 || v14 >= v20 || v14 != v5)
            *v14 = *v5;
        }
        else
        {
          if (v14 != v13)
            *v14 = *v13;
          v34 = ++v13;
          v20 = v5;
        }
        ++v14;
        if (v13 >= v12)
          break;
        v5 = v20;
      }
      while ((unint64_t)v20 < a3);
      v35 = v14;
    }
LABEL_43:
    sub_235DF6A1C((void **)&v35, (const void **)&v34, &v33);
    return 1;
  }
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t sub_235DEEA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v5 = a2;
    v7 = a1;
    v6 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v23 = sub_235E18FC8();
  swift_bridgeObjectRelease();
  if (v23 < v5)
    goto LABEL_31;
LABEL_4:
  v9 = v5 - v7;
  if (__OFSUB__(v5, v7))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v10 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v11 = v10 + v8;
    if (!__OFADD__(v10, v8))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v14 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v6 = *v4;
  if (*v4 >> 62)
    goto LABEL_34;
  v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v11 = v10 + v8;
  if (__OFADD__(v10, v8))
    goto LABEL_36;
LABEL_8:
  v6 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v6;
  v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v13 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v10 = 1;
  }
  if (v6 >> 62)
    goto LABEL_37;
  v14 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11)
    v14 = v11;
  swift_bridgeObjectRetain();
  v6 = MEMORY[0x23B7E2490](v10, v14, 1, v6);
  swift_bridgeObjectRelease();
  *v4 = v6;
  v13 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = (_QWORD *)(v13 + 32 + 8 * v7);
  sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
  swift_arrayDestroy();
  if (!v8)
  {
LABEL_28:
    *v15 = v3;
    return sub_235E18DD0();
  }
  if (!(v6 >> 62))
  {
    v16 = *(_QWORD *)(v13 + 16);
    v17 = v16 - v5;
    if (!__OFSUB__(v16, v5))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v24 = sub_235E18FC8();
  swift_bridgeObjectRelease();
  v17 = v24 - v5;
  if (__OFSUB__(v24, v5))
    goto LABEL_40;
LABEL_21:
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = (char *)(v15 + 1);
    v19 = (char *)(v13 + 32 + 8 * v5);
    if (v15 + 1 != (_QWORD *)v19 || v18 >= &v19[8 * v17])
      memmove(v18, v19, 8 * v17);
    if (!(v6 >> 62))
    {
      v20 = *(_QWORD *)(v13 + 16);
      v21 = v20 + v8;
      if (!__OFADD__(v20, v8))
      {
LABEL_27:
        *(_QWORD *)(v13 + 16) = v21;
        goto LABEL_28;
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v25 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v21 = v25 + v8;
    if (!__OFADD__(v25, v8))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t sub_235DEED10(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
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
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CE8);
  v37 = a2;
  v6 = sub_235E18FE0();
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
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_235DF0DE0(v25, (uint64_t)v38);
    }
    else
    {
      sub_235DF0DF8((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_235E19058();
    sub_235E18D70();
    result = sub_235E19070();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_235DF0DE0(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235DEF034(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C0);
  v36 = a2;
  v6 = sub_235E18FE0();
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
    sub_235E19058();
    sub_235E18D70();
    result = sub_235E19070();
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

uint64_t sub_235DEF348(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235DECF6C(a2, a3);
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
    sub_235DEF68C();
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
  sub_235DEF034(v15, a4 & 1);
  v21 = sub_235DECF6C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_235E1904C();
  __break(1u);
  return result;
}

void *sub_235DEF4A4()
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
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CE8);
  v2 = *v0;
  v3 = sub_235E18FD4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
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
    v20 = 40 * v15;
    sub_235DF0DF8(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_235DF0DE0(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
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

void *sub_235DEF68C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C0);
  v2 = *v0;
  v3 = sub_235E18FD4();
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

uint64_t sub_235DEF840(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v14;
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a6;
  v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v14 = (_QWORD *)(a5[6] + 16 * a1);
  *v14 = a2;
  v14[1] = a3;
  result = sub_235DF0DE0(&v19, a5[7] + 40 * a1);
  v16 = a5[2];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    a5[2] = v18;
  return result;
}

_QWORD *sub_235DEF8F8(_QWORD *a1)
{
  return sub_235DF4494(0, a1[2], 0, a1);
}

uint64_t sub_235DEF90C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_235E18E30();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_235DED490(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

BOOL sub_235DEF9A0()
{
  const __CFString *v0;
  const __CFString *v1;
  int IsForced;
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  if (qword_256381B90 != -1)
    swift_once();
  v0 = (const __CFString *)qword_256382B38;
  if (qword_256381B98 != -1)
    swift_once();
  v1 = (const __CFString *)qword_256382B40;
  IsForced = CFPreferencesAppValueIsForced(v0, (CFStringRef)qword_256382B40);
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)qword_256382B38, v1, &keyExistsAndHasValidFormat);
  if (IsForced)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  return !v4 || keyExistsAndHasValidFormat == 0;
}

uint64_t sub_235DEFA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_235DEFAD4()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  if (!sub_235DEF9A0())
  {
    v0 = (void *)sub_235E18D10();
    v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

    if (v1)
    {
      v2 = (void *)sub_235E18D10();
      v3 = (void *)sub_235E18D10();
      v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, 0);

      sub_235E18D40();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_235DEFBEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  uint64_t ObjCClassMetadata;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isUniquelyReferenced_nonNull_native;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  uint64_t *v56;
  os_log_type_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  os_log_type_t v76;
  NSObject *v77;
  uint8_t *v78;
  uint64_t result;
  _QWORD v80[2];
  char *v81;
  char *v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  id v88;
  char *v89;
  unint64_t v90;
  void *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  _QWORD *v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v0 = sub_235E18770();
  v85 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v80 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v81 = (char *)v80 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v82 = (char *)v80 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v86 = (char *)v80 - v8;
  v96 = sub_235E18698();
  v95 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v94 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GenericAccountsUIPlugin();
  v80[0] = swift_allocObject();
  v10 = (_QWORD *)sub_235E00F0C(MEMORY[0x24BEE4AF8]);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = (void *)sub_235E18D10();
  v102 = 0;
  v13 = objc_msgSend(v11, sel_contentsOfDirectoryAtPath_error_, v12, &v102);

  v14 = v102;
  if (!v13)
  {
    v74 = v102;
    v18 = (uint64_t *)sub_235E18674();

    swift_willThrow();
    if (qword_25429C0B0 == -1)
    {
LABEL_53:
      v75 = __swift_project_value_buffer(v0, (uint64_t)qword_25429C098);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v3, v75, v0);
      v76 = sub_235E18E48();
      v77 = sub_235E18758();
      if (os_log_type_enabled(v77, v76))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_235DE3000, v77, v76, "caught error trying to load contents of directory at /System/Library/Accounts/SwiftUI", v78, 2u);
        MEMORY[0x23B7E29C4](v78, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v85 + 8))(v3, v0);
      return v80[0];
    }
LABEL_59:
    swift_once();
    goto LABEL_53;
  }
  v3 = (char *)sub_235E18DC4();
  v15 = v14;

  v93 = *((_QWORD *)v3 + 2);
  if (!v93)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    return v80[0];
  }
  v17 = 0;
  v92 = v3 + 32;
  v91 = (void *)0xD000000000000021;
  v90 = 0x8000000235E1E9F0;
  *(_QWORD *)&v16 = 136315138;
  v83 = v16;
  v80[1] = MEMORY[0x24BEE4AD8] + 8;
  v87 = v0;
  v18 = (uint64_t *)v85;
  v89 = v3;
  while (1)
  {
    if (v17 >= *((_QWORD *)v3 + 2))
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    v97 = v17;
    v102 = 0;
    v103 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_235E18F44();
    swift_bridgeObjectRelease();
    v102 = v91;
    v103 = v90;
    sub_235E18D7C();
    swift_bridgeObjectRelease();
    v20 = (uint64_t)v102;
    v19 = v103;
    v21 = v94;
    sub_235E1868C();
    v22 = sub_235E18680();
    v24 = v23;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v21, v96);
    if (v22 == 0x656C646E7562 && v24 == 0xE600000000000000)
      break;
    v25 = sub_235E19028();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_11;
    swift_bridgeObjectRelease();
LABEL_5:
    v3 = v89;
    v17 = v97 + 1;
    if (v97 + 1 == v93)
      goto LABEL_51;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  v26 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  swift_bridgeObjectRetain();
  v27 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v26, sel_initWithPath_, v27);

  if (!v28)
  {
    if (qword_25429C0B0 != -1)
      swift_once();
    v53 = __swift_project_value_buffer(v0, (uint64_t)qword_25429C098);
    swift_beginAccess();
    v54 = v86;
    ((void (*)(char *, uint64_t, uint64_t))v18[2])(v86, v53, v0);
    LOBYTE(v53) = sub_235E18E48();
    swift_bridgeObjectRetain();
    v55 = sub_235E18758();
    v56 = v18;
    v57 = v53;
    if (os_log_type_enabled(v55, (os_log_type_t)v53))
    {
      v58 = swift_slowAlloc();
      v59 = (void *)swift_slowAlloc();
      v102 = v59;
      *(_DWORD *)v58 = v83;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v58 + 4) = sub_235E0A4D0(v20, v19, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_235DE3000, v55, v57, "Item at %s didn't return a bundle", (uint8_t *)v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E29C4](v59, -1, -1);
      MEMORY[0x23B7E29C4](v58, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(char *, uint64_t))v56[1])(v54, v0);
    v18 = v56;
    goto LABEL_5;
  }
  if (!objc_msgSend(v28, sel_principalClass))
  {
    v60 = v28;
    if (qword_25429C0B0 != -1)
      swift_once();
    v61 = __swift_project_value_buffer(v0, (uint64_t)qword_25429C098);
    swift_beginAccess();
    v62 = v82;
    ((void (*)(char *, uint64_t, uint64_t))v18[2])(v82, v61, v0);
    LOBYTE(v61) = sub_235E18E48();
    swift_bridgeObjectRetain();
    v63 = sub_235E18758();
    v64 = v61;
    if (os_log_type_enabled(v63, (os_log_type_t)v61))
    {
      v65 = swift_slowAlloc();
      v66 = (void *)swift_slowAlloc();
      v102 = v66;
      *(_DWORD *)v65 = v83;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v65 + 4) = sub_235E0A4D0(v20, v19, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_235DE3000, v63, v64, "Item at %s doesn't have a principle class", (uint8_t *)v65, 0xCu);
      swift_arrayDestroy();
      v67 = v66;
      v0 = v87;
      MEMORY[0x23B7E29C4](v67, -1, -1);
      MEMORY[0x23B7E29C4](v65, -1, -1);

LABEL_50:
      ((void (*)(char *, uint64_t))v18[1])(v62, v0);
      goto LABEL_5;
    }

LABEL_49:
    swift_bridgeObjectRelease_n();
    goto LABEL_50;
  }
  v88 = v28;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v30 = swift_conformsToProtocol2();
  if (v30)
    v31 = v30;
  else
    v31 = 0;
  if (v30)
    v32 = ObjCClassMetadata;
  else
    v32 = 0;
  if (!v32)
  {
    if (qword_25429C0B0 != -1)
      swift_once();
    v0 = v87;
    v68 = __swift_project_value_buffer(v87, (uint64_t)qword_25429C098);
    swift_beginAccess();
    v62 = v81;
    ((void (*)(char *, uint64_t, uint64_t))v18[2])(v81, v68, v0);
    LOBYTE(v68) = sub_235E18E48();
    swift_bridgeObjectRetain();
    v69 = sub_235E18758();
    v70 = v68;
    if (os_log_type_enabled(v69, (os_log_type_t)v68))
    {
      v71 = swift_slowAlloc();
      v72 = (void *)swift_slowAlloc();
      v102 = v72;
      *(_DWORD *)v71 = v83;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v71 + 4) = sub_235E0A4D0(v20, v19, (uint64_t *)&v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_235DE3000, v69, v70, "Plugin %s doesn't conform to the AccountsUISettingsPlugin protocol", (uint8_t *)v71, 0xCu);
      swift_arrayDestroy();
      v73 = v72;
      v0 = v87;
      MEMORY[0x23B7E29C4](v73, -1, -1);
      MEMORY[0x23B7E29C4](v71, -1, -1);

      goto LABEL_50;
    }

    goto LABEL_49;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v88, sel_load);
  v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  v104 = v32;
  v105 = v31;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v102);
  v33(v32, v31);
  v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 16))(v32, v31);
  v35 = *(_QWORD *)(v34 + 16);
  v84 = v34;
  if (!v35)
  {
LABEL_36:

    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v102);
    v0 = v87;
    v18 = (uint64_t *)v85;
    goto LABEL_5;
  }
  v18 = (uint64_t *)(v34 + 40);
  while (1)
  {
    v43 = *(v18 - 1);
    v42 = *v18;
    sub_235DF0DF8((uint64_t)&v102, (uint64_t)&v99);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v98 = v10;
    v3 = (char *)v10;
    v0 = sub_235DECF6C(v43, v42);
    v46 = v10[2];
    v47 = (v45 & 1) == 0;
    v48 = v46 + v47;
    if (__OFADD__(v46, v47))
    {
      __break(1u);
      goto LABEL_58;
    }
    v49 = v45;
    if (v10[3] >= v48)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_235DEF4A4();
      goto LABEL_30;
    }
    sub_235DEED10(v48, isUniquelyReferenced_nonNull_native);
    v50 = sub_235DECF6C(v43, v42);
    if ((v49 & 1) != (v51 & 1))
      break;
    v0 = v50;
LABEL_30:
    v10 = v98;
    if ((v49 & 1) != 0)
    {
      v52 = v98[7] + 40 * v0;
      __swift_destroy_boxed_opaque_existential_1(v52);
      sub_235DF0DE0(&v99, v52);
    }
    else
    {
      v36 = v100;
      v37 = v101;
      v38 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v99, v100);
      MEMORY[0x24BDAC7A8](v38);
      v40 = (char *)v80 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v41 + 16))(v40);
      sub_235DEF840(v0, v43, v42, (uint64_t)v40, v10, v36, v37);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v99);
      swift_bridgeObjectRetain();
    }
    v18 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v35)
      goto LABEL_36;
  }
  result = sub_235E1904C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AccountsUIModel(uint64_t a1)
{
  return sub_235DF0EF0(a1, (uint64_t *)&unk_25429C0D8);
}

uint64_t sub_235DF086C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235DF0890(uint8_t *a1, void *a2)
{
  uint64_t v2;

  return sub_235DE9DE0(a1, a2, *(void **)(v2 + 16));
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

unint64_t sub_235DF08B0(id *a1)
{
  uint64_t v1;

  return (unint64_t)sub_235DE9C14(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t sub_235DF08CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_235DF08E0(a1, a2);
  return a1;
}

uint64_t sub_235DF08E0(uint64_t a1, unint64_t a2)
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

uint64_t sub_235DF0924(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_235DF0958(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for Dataclass(uint64_t a1)
{
  sub_235DF1B10(a1, &qword_256381C78, (uint64_t)&unk_250734CA8, MEMORY[0x24BEE4D40]);
}

uint64_t _s18AccountsUISettings0A7UIModelC6filter_ADSaySo9ACAccountCGAG_AC10FilterTypeOtFZ_0(unint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  unsigned __int8 v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = a1;
  v30 = *a2;
  v34 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_45;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      if (v3 < 1)
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        JUMPOUT(0x235DF0D8CLL);
      }
      v4 = 0;
      v33 = v2 & 0xC000000000000001;
      v31 = v2 + 32;
      v27 = (void *)*MEMORY[0x24BDB3E88];
      v26 = (void *)*MEMORY[0x24BDB3DD8];
      v25 = (void *)*MEMORY[0x24BDB3DE8];
      v24 = (void *)*MEMORY[0x24BDB3E68];
      v29 = (void *)*MEMORY[0x24BDB3E38];
      v28 = *MEMORY[0x24BDB3DF0];
      v32 = v3;
      while (1)
      {
        if (v33)
          v5 = (id)MEMORY[0x23B7E2484](v4, v2);
        else
          v5 = *(id *)(v31 + 8 * v4);
        v6 = v5;
        if (qword_25429BC98 != -1)
          swift_once();
        v7 = off_25429C280;
        swift_bridgeObjectRetain();
        v8 = objc_msgSend(v6, sel_accountType);
        if (!v8)
          goto LABEL_48;
        v9 = v8;
        v10 = objc_msgSend(v8, sel_identifier);

        if (!v10)
          goto LABEL_49;
        v11 = sub_235E18D40();
        v13 = v12;

        v14 = v7[2];
        if (v14)
          break;
        swift_bridgeObjectRelease();
LABEL_32:
        swift_bridgeObjectRelease();

LABEL_6:
        if (++v4 == v3)
        {
          swift_bridgeObjectRelease();
          return v34;
        }
      }
      v15 = v2;
      if (v7[4] == v11 && v7[5] == v13 || (sub_235E19028() & 1) != 0)
      {
LABEL_18:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v16 = objc_msgSend(v6, sel_parentAccount);

        if (v16)
        {

          v2 = v15;
          v3 = v32;
        }
        else
        {
          v2 = v15;
          v17 = v29;
          v3 = v32;
          switch(v30)
          {
            case 0:
              goto LABEL_41;
            case 1:
              goto LABEL_37;
            case 2:
              v17 = v24;
              goto LABEL_37;
            case 3:
              v17 = v25;
              goto LABEL_37;
            case 4:
              v17 = v26;
              goto LABEL_37;
            case 5:
              v17 = v27;
LABEL_37:
              v21 = v17;
              break;
            default:
              v21 = 0;
              v3 = v32;
              break;
          }
          v22 = objc_msgSend(v6, sel_isProvisionedForDataclass_, v21);

          if ((v22 & 1) != 0
            || v30 == 3 && (objc_msgSend(v6, sel_isProvisionedForDataclass_, v28) & 1) != 0)
          {
LABEL_41:
            sub_235E18F80();
            sub_235E18FA4();
            sub_235E18FB0();
            sub_235E18F8C();
          }
          else
          {

          }
        }
        goto LABEL_6;
      }
      if (v14 == 1)
        break;
      v18 = v7 + 7;
      v2 = 1;
      while (1)
      {
        v19 = v2 + 1;
        if (__OFADD__(v2, 1))
          break;
        v20 = *(v18 - 1) == v11 && *v18 == v13;
        if (v20 || (sub_235E19028() & 1) != 0)
          goto LABEL_18;
        v18 += 2;
        ++v2;
        if (v19 == v14)
          goto LABEL_31;
      }
      __break(1u);
LABEL_45:
      swift_bridgeObjectRetain();
      v3 = sub_235E18FC8();
      if (!v3)
        goto LABEL_46;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    v2 = v15;
    v3 = v32;
    goto LABEL_32;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_235DF0DA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235DF0DE0(__int128 *a1, uint64_t a2)
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

uint64_t sub_235DF0DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

unint64_t sub_235DF0E84()
{
  unint64_t result;

  result = qword_256381BF8;
  if (!qword_256381BF8)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountsUIModel.FilterType, &type metadata for AccountsUIModel.FilterType);
    atomic_store(result, (unint64_t *)&qword_256381BF8);
  }
  return result;
}

uint64_t sub_235DF0EC8()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_235DF0ED4()
{
  return type metadata accessor for AccountGroup(0);
}

uint64_t type metadata accessor for AccountGroup(uint64_t a1)
{
  return sub_235DF0EF0(a1, qword_25429C130);
}

uint64_t sub_235DF0EF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235DF0F24()
{
  unint64_t v0;

  sub_235DF1794(319, &qword_25429C1C0, &qword_25429C270);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E2910](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235DF0FF8()
{
  return type metadata accessor for AccountsUIModel(0);
}

void sub_235DF1000()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  sub_235DF1794(319, &qword_25429C1F8, &qword_25429C2B8);
  if (v0 <= 0x3F)
  {
    sub_235DF1B10(319, &qword_25429C1D0, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
    if (v1 <= 0x3F)
    {
      sub_235DF1794(319, (unint64_t *)&unk_25429C178, (uint64_t *)&unk_25429C210);
      if (v2 <= 0x3F)
      {
        sub_235DF1794(319, (unint64_t *)&unk_25429C150, (uint64_t *)&unk_25429C110);
        if (v3 <= 0x3F)
        {
          sub_235DF1794(319, &qword_25429C168, (uint64_t *)&unk_25429C200);
          if (v4 <= 0x3F)
          {
            sub_235DF1794(319, &qword_25429C190, &qword_25429C230);
            if (v5 <= 0x3F)
            {
              sub_235DF1794(319, (unint64_t *)&unk_25429C1A8, (uint64_t *)&unk_25429C260);
              if (v6 <= 0x3F)
              {
                sub_235DF1794(319, &qword_25429C1C0, &qword_25429C270);
                if (v7 <= 0x3F)
                  swift_updateClassMetadata2();
              }
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for AccountsUIModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AccountsUIModel.settingsHost.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AccountsUIModel.addAccountShown.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AccountsUIModel.$addAccountShown.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AccountsUIModel.deleteAccountShown.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AccountsUIModel.$deleteAccountShown.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of AccountsUIModel.showsAccountFooterView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of AccountsUIModel.$showsAccountFooterView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of AccountsUIModel.allowAccountModification.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of AccountsUIModel.willSelect(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of AccountsUIModel.revealElement(forKey:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of AccountsUIModel.selectAddedAccount(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of AccountsUIModel.didSelect()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of AccountsUIModel.didUnselect()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of AccountsUIModel.open(url:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of AccountsUIModel.selectedDeleteAccount()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of AccountsUIModel.filter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of AccountsUIModel.suggestionStore.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of AccountsUIModel.monitoredStore.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of AccountsUIModel.filteredAccounts.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of AccountsUIModel.$filteredAccounts.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x498))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasAdded(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasModified(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4D8))();
}

uint64_t dispatch thunk of AccountsUIModel.accountWasRemoved(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4E0))();
}

uint64_t dispatch thunk of AccountsUIModel.accountCredentialChanged(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x4E8))();
}

uint64_t dispatch thunk of AccountsUIModel.plugin(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x508))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x510))();
}

uint64_t dispatch thunk of AccountsUIModel.detailModel(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x518))();
}

void sub_235DF1794(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_235E187D0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountsUIModel.FilterType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountsUIModel.FilterType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235DF18CC + 4 * byte_235E19645[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_235DF1900 + 4 * byte_235E19640[v4]))();
}

uint64_t sub_235DF1900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DF1908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235DF1910);
  return result;
}

uint64_t sub_235DF191C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235DF1924);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_235DF1928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DF1930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DF193C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235DF1944(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountsUIModel.FilterType()
{
  return &type metadata for AccountsUIModel.FilterType;
}

uint64_t destroy for AccountsUIModel.PluginManager()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18AccountsUISettings15AccountsUIModelC13PluginManagerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AccountsUIModel.PluginManager(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AccountsUIModel.PluginManager(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountsUIModel.PluginManager(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AccountsUIModel.PluginManager(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AccountsUIModel.PluginManager()
{
  return &type metadata for AccountsUIModel.PluginManager;
}

void type metadata accessor for ACDataclassActionType(uint64_t a1)
{
  sub_235DF1B10(a1, &qword_256381C70, (uint64_t)&unk_250734C88, MEMORY[0x24BEE4D40]);
}

void sub_235DF1B10(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_235DF1B54()
{
  return sub_235DF1B80(&qword_256381C80, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19B4C);
}

uint64_t sub_235DF1B80(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7E291C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235DF1BC0()
{
  return sub_235DF1B80(&qword_256381C88, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19B24);
}

uint64_t sub_235DF1BEC()
{
  return sub_235DF1B80(&qword_256381C90, (uint64_t (*)(uint64_t))type metadata accessor for ACDataclassActionType, (uint64_t)&unk_235E19C64);
}

uint64_t sub_235DF1C18()
{
  return sub_235DF1B80(&qword_256381C98, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19BB4);
}

uint64_t sub_235DF1C44()
{
  uint64_t v0;

  sub_235DF1C74(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DF1C74(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_235DF1C84()
{
  unint64_t result;

  result = qword_256381CB0;
  if (!qword_256381CB0)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1AEB4, &type metadata for AccountSettingsDetailView);
    atomic_store(result, (unint64_t *)&qword_256381CB0);
  }
  return result;
}

unint64_t sub_235DF1CC8()
{
  unint64_t result;

  result = qword_256381CB8;
  if (!qword_256381CB8)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountSettingsDetailModelView, &type metadata for AccountSettingsDetailModelView);
    atomic_store(result, (unint64_t *)&qword_256381CB8);
  }
  return result;
}

uint64_t sub_235DF1D14()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235DF1D40()
{
  return sub_235DEB100();
}

unint64_t sub_235DF1D50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25429C250;
  if (!qword_25429C250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25429C248);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25429C250);
  }
  return result;
}

void sub_235DF1D9C()
{
  uint64_t v0;

  sub_235DEB164(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_235DF1DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_235E18FC8();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B7E2490](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
  swift_arrayDestroy();
  if (!v5)
    return sub_235E18DD0();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_235E18FC8();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_235E18DD0();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t sub_235DF20C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t result;
  void *v28;
  uint64_t v29;

  if (!a3)
  {
    swift_bridgeObjectRetain();
    v3 = 0;
    v4 = 0;
    v20 = 0xEB00000000646567;
    a2 = 0x616E616D5F746F6ELL;
LABEL_30:
    type metadata accessor for AccountGroup(0);
    v26 = (_QWORD *)swift_allocObject();
    v26[2] = a2;
    v26[3] = v20;
    v26[4] = v3;
    v26[5] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429C270);
    sub_235E18788();
    swift_endAccess();
    return (uint64_t)v26;
  }
  v8 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_4;
LABEL_26:
    v3 = 0;
    v4 = 0;
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  if (!sub_235E18FC8())
    goto LABEL_26;
LABEL_4:
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      v10 = *(id *)(a1 + 32);
      v3 = ACAccount.displayUserName.getter();
      v4 = v11;

      if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        v12 = *(id *)(a1 + 32);
        goto LABEL_8;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_34;
  }
  v28 = (void *)MEMORY[0x23B7E2484](0, a1);
  v3 = ACAccount.displayUserName.getter();
  v4 = v29;

  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x23B7E2484](0, a1);
  swift_bridgeObjectRelease();
LABEL_8:
  v13 = objc_msgSend(v12, sel_accountType);

  if (v13)
  {
    v14 = objc_msgSend(v13, sel_identifier);

    if (v14)
    {
      v15 = sub_235E18D40();
      v17 = v16;

      v18 = sub_235E18D40();
      if (v17)
      {
        if (v15 == v18 && v17 == v19)
        {
          swift_bridgeObjectRelease_n();
LABEL_16:
          if (!v8)
          {
            if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
LABEL_21:
              if ((a1 & 0xC000000000000001) == 0)
              {
                if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  v24 = *(id *)(a1 + 32);
                  if (!v8)
                  {
LABEL_24:
                    v25 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
                    goto LABEL_37;
                  }
LABEL_36:
                  swift_bridgeObjectRetain();
                  v25 = sub_235E18FC8();
                  swift_bridgeObjectRelease();
LABEL_37:
                  if (v25)
                  {
                    sub_235DF1DBC(0, 1);

                    goto LABEL_29;
                  }
                  goto LABEL_41;
                }
                __break(1u);
LABEL_40:
                __break(1u);
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_35:
              v24 = (id)MEMORY[0x23B7E2484](0, a1);
              if (!v8)
                goto LABEL_24;
              goto LABEL_36;
            }
            __break(1u);
          }
          swift_bridgeObjectRetain();
          v22 = sub_235E18FC8();
          swift_bridgeObjectRelease();
          if (!v22)
            goto LABEL_40;
          swift_bridgeObjectRetain();
          v23 = sub_235E18FC8();
          swift_bridgeObjectRelease();
          if (v23)
            goto LABEL_21;
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
        v21 = sub_235E19028();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v21 & 1) != 0)
          goto LABEL_16;
LABEL_29:
        v20 = a3;
        goto LABEL_30;
      }
LABEL_28:
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
LABEL_27:
    sub_235E18D40();
    goto LABEL_28;
  }
LABEL_42:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_235DF2484(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;

  v23 = MEMORY[0x24BEE4AF8];
  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v21 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (v5)
  {
    v8 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v9 = v8 | (v7 << 6);
LABEL_23:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v15 = *v13;
    v14 = v13[1];
    if (*v13 != 0x616E616D5F746F6ELL || v14 != 0xEB00000000646567)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v9);
      result = sub_235E19028();
      if ((result & 1) == 0)
      {
        if (v17 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (sub_235E18FC8() < 1)
            goto LABEL_4;
LABEL_30:
          sub_235DF20C4(v17, v15, v14);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_235E187B8();
          swift_release();
          swift_release();
          if (v22 >> 62)
          {
            swift_bridgeObjectRetain();
            v19 = sub_235E18FC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            v19 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v20 = swift_bridgeObjectRelease();
          if (v19)
          {
            MEMORY[0x23B7E22D4](v20);
            if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_235E18DDC();
            sub_235E18DF4();
            result = sub_235E18DD0();
          }
          else
          {
            result = swift_release();
          }
        }
        else
        {
          v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v18 >= 1)
            goto LABEL_30;
LABEL_4:
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
        }
      }
    }
  }
  v10 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v10 >= v21)
    goto LABEL_40;
  v11 = *(_QWORD *)(v2 + 8 * v10);
  ++v7;
  if (v11)
    goto LABEL_22;
  v7 = v10 + 1;
  if (v10 + 1 >= v21)
    goto LABEL_40;
  v11 = *(_QWORD *)(v2 + 8 * v7);
  if (v11)
    goto LABEL_22;
  v7 = v10 + 2;
  if (v10 + 2 >= v21)
    goto LABEL_40;
  v11 = *(_QWORD *)(v2 + 8 * v7);
  if (v11)
    goto LABEL_22;
  v7 = v10 + 3;
  if (v10 + 3 >= v21)
    goto LABEL_40;
  v11 = *(_QWORD *)(v2 + 8 * v7);
  if (v11)
  {
LABEL_22:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v7 << 6);
    goto LABEL_23;
  }
  v12 = v10 + 4;
  if (v12 >= v21)
  {
LABEL_40:
    swift_release();
    return v23;
  }
  v11 = *(_QWORD *)(v2 + 8 * v12);
  if (v11)
  {
    v7 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v7 >= v21)
      goto LABEL_40;
    v11 = *(_QWORD *)(v2 + 8 * v7);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_42:
  __break(1u);
  return result;
}

void *sub_235DF2828(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  char v10;
  unint64_t v12;
  unint64_t v13;
  id v14;

  v1 = a1;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v2 = sub_235E18FC8();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v12 = v1;
      v13 = v1 & 0xC000000000000001;
      v3 = 4;
      while (1)
      {
        if (v13)
          v4 = (id)MEMORY[0x23B7E2484](v3 - 4, v1);
        else
          v4 = *(id *)(v1 + 8 * v3);
        v5 = v4;
        v6 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
          goto LABEL_19;
        }
        v7 = objc_msgSend(v4, sel_identifier);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_235E187B8();
        swift_release();
        swift_release();
        v8 = objc_msgSend(v14, sel_identifier);

        if (!v7)
          break;
        if (!v8)
        {
          v8 = v7;
LABEL_5:

          goto LABEL_6;
        }
        sub_235DF2A90(0, &qword_256381BF0);
        v9 = v7;
        v10 = sub_235E18E90();

        v1 = v12;
        if ((v10 & 1) != 0)
        {
LABEL_17:
          swift_bridgeObjectRelease();
          return v5;
        }
LABEL_6:

        ++v3;
        if (v6 == v2)
          goto LABEL_20;
      }
      if (!v8)
        goto LABEL_17;
      goto LABEL_5;
    }
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_235DF2A24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_235DF2A68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235DF2A90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235DF2AC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235DF2AFC()
{
  uint64_t *v0;

  sub_235DE89AC(v0[2], v0[3], v0[4]);
}

uint64_t sub_235DF2B08(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_235DF2B44()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DF2B70()
{
  return sub_235DEA278();
}

uint64_t sub_235DF2B90()
{
  uint64_t v0;

  return sub_235DEA2D4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
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

unint64_t sub_235DF2C78(id *a1)
{
  return sub_235DF08B0(a1) & 1;
}

Swift::Bool __swiftcall ACAccount.appearsActive()()
{
  void *v0;
  unsigned __int8 v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v8;
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;

  if (objc_getAssociatedObject(v0, "appearsActive"))
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_235DF2E14((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_235DF2E5C((uint64_t)v10);
LABEL_8:
    v2 = objc_msgSend(v0, sel_enabledDataclasses);
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, sel_count);

      if ((uint64_t)v4 > 0)
      {
        v1 = 1;
        goto LABEL_15;
      }
      v2 = objc_msgSend(v0, sel_provisionedDataclasses);
      if (v2)
      {
        v5 = v2;
        v6 = objc_msgSend(v2, sel_count);

        if (v6)
          v1 = 0;
        else
          v1 = objc_msgSend(v0, sel_isActive);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return (char)v2;
  }
  sub_235DF2A90(0, &qword_256381D50);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_8;
  v1 = objc_msgSend(v8, sel_BOOLValue);

LABEL_15:
  LOBYTE(v2) = v1;
  return (char)v2;
}

uint64_t sub_235DF2E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235DF2E5C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ACAccount.displayUserName.getter()
{
  void *v0;
  id v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  id v17;
  id v18;
  uint64_t v19;

  v1 = objc_msgSend(v0, sel_username);
  if (v1)
  {

    result = (uint64_t)objc_msgSend(v0, sel_username);
    if (!result)
    {
      __break(1u);
      goto LABEL_25;
    }
    v3 = (void *)result;
    v4 = sub_235E18D40();
    v6 = v5;

    swift_bridgeObjectRelease();
    v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v7 = v4 & 0xFFFFFFFFFFFFLL;
    if (v7)
      goto LABEL_17;
  }
  result = (uint64_t)objc_msgSend(v0, sel_accountType);
  if (!result)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  v8 = (void *)result;
  v9 = objc_msgSend((id)result, sel_identifier);

  if (!v9)
  {
    sub_235E18D40();
    goto LABEL_16;
  }
  v10 = sub_235E18D40();
  v12 = v11;

  v13 = sub_235E18D40();
  if (!v12)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v10 == v13 && v12 == v14)
  {
    swift_bridgeObjectRelease_n();
LABEL_23:
    v17 = objc_msgSend(v0, sel_accountDescription);
    goto LABEL_18;
  }
  v16 = sub_235E19028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
    goto LABEL_23;
LABEL_17:
  v17 = objc_msgSend(v0, sel_username);
LABEL_18:
  v18 = v17;
  if (!v18)
    return 0x4E574F4E4B4E55;
  v19 = sub_235E18D40();

  return v19;
}

uint64_t sub_235DF3074(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_235E19028() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_235E19028();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

id ACAccount.id.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(v0, sel_identifier);
  if (result)
  {
    v2 = result;
    v3 = sub_235E18D40();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ACAccount.sortedProvisionedDataclasses.getter()
{
  void *v0;
  uint64_t result;
  uint64_t v2;

  if (objc_msgSend(v0, sel_provisionedDataclasses))
  {
    v2 = 0;
    type metadata accessor for Dataclass(0);
    sub_235DF7A34();
    sub_235E18E24();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

void sub_235DF32A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v15 = sub_235E18D40();
  v16 = v0;
  sub_235DF807C();
  v1 = sub_235E18ECC();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v2 = sub_235E18D64();
    v4 = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = 0xE700000000000000;
    v2 = 0x4E574F4E4B4E55;
  }
  v5 = (void *)sub_235E18D10();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v5, 46, 0xE100000000000000, v15, v16);

  if (!v6)
  {
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  sub_235E18D7C();
  v7 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  sub_235E18ED8();
  v8 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

  v10 = sub_235E18D40();
  v12 = v11;

  v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v13 = v10 & 0xFFFFFFFFFFFFLL;
  if (!v13 || v10 == v2 && v12 == v4)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v14 = sub_235E19028();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
LABEL_13:
    swift_bridgeObjectRelease();
}

uint64_t ACAccountDataclass.icon.getter()
{
  return 0;
}

Swift::String_optional __swiftcall ACAccount.formattedDataclassString()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  Swift::String_optional result;
  void *v48;
  _OWORD v49[2];
  _QWORD *v50[5];

  v1 = 0;
  v2 = 0;
  if (!ACAccount.appearsActive()())
  {
    v3 = (void *)sub_235E18D10();
    v4 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v3);

    if (!v4)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v5 = (void *)sub_235E18D10();
    v6 = (void *)sub_235E18D10();
    v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, v6, 0);

    v1 = sub_235E18D40();
    v2 = v8;

  }
  v9 = objc_msgSend(v0, sel_enabledDataclasses);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_36;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_count);

  if ((uint64_t)v11 > 0)
  {
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v0, sel_enabledDataclasses);
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(v12, sel_count);

      if (v14 == (id)1)
      {
        v15 = objc_msgSend(v0, sel_enabledDataclasses);
        if (!v15)
        {
LABEL_40:
          __break(1u);
          v42 = swift_release();
          __break(1u);
          goto LABEL_41;
        }
        v16 = v15;
        v17 = objc_msgSend(v15, sel_anyObject);

        if (v17)
        {
          sub_235E18EF0();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v49, 0, sizeof(v49));
        }
        sub_235DF2E14((uint64_t)v49, (uint64_t)v50);
        if (v50[3])
        {
          type metadata accessor for Dataclass(0);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v18 = sub_235E18D40();
            v20 = v19;
            if (v18 == sub_235E18D40() && v20 == v21)
            {
              swift_bridgeObjectRelease_n();
LABEL_33:
              sub_235DF32A8();
              v1 = v45;
              v2 = v46;

              goto LABEL_31;
            }
            v44 = sub_235E19028();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v44 & 1) != 0)
              goto LABEL_33;

          }
        }
        else
        {
          sub_235DF2E5C((uint64_t)v50);
        }
      }
      v22 = objc_msgSend(v0, sel_enabledDataclasses);
      if (v22)
      {
        v23 = v22;
        v50[0] = 0;
        type metadata accessor for Dataclass(0);
        sub_235DF7A34();
        sub_235E18E24();
        if (v50[0])
        {

          v24 = swift_bridgeObjectRetain();
          v25 = sub_235DF4694(v24);
          swift_bridgeObjectRelease();
          v50[0] = v25;
          sub_235DF48FC(v50);
          swift_bridgeObjectRelease();
          v26 = v50[0];
          v27 = v50[0][2];
          if (v27)
          {
            swift_retain();
            v28 = 0;
            v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
            do
            {
              v31 = (id)v26[v28 + 4];
              sub_235DF32A8();
              v33 = v32;
              v35 = v34;

              if (v35)
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v29 = sub_235DF4494(0, v29[2] + 1, 1, v29);
                v37 = v29[2];
                v36 = v29[3];
                if (v37 >= v36 >> 1)
                  v29 = sub_235DF4494((_QWORD *)(v36 > 1), v37 + 1, 1, v29);
                v29[2] = v37 + 1;
                v30 = &v29[2 * v37];
                v30[4] = v33;
                v30[5] = v35;
              }
              ++v28;
            }
            while (v27 != v28);
            swift_release();
          }
          swift_release();
          v38 = (void *)objc_opt_self();
          v39 = (void *)sub_235E18DB8();
          swift_bridgeObjectRelease();
          v40 = objc_msgSend(v38, sel_localizedStringByJoiningStrings_, v39);

          v1 = sub_235E18D40();
          v2 = v41;

          goto LABEL_31;
        }
        goto LABEL_38;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_31:
  v42 = v1;
  v43 = v2;
LABEL_41:
  result.value._object = v43;
  result.value._countAndFlagsBits = v42;
  return result;
}

uint64_t ACAccount.userFullName.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[24];
  uint64_t v12;

  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x24BDB3EF8]))
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_235DF2E14((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
    goto LABEL_14;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_15;
  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x24BDB3F38]))
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_235DF2E14((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    sub_235DF2E5C((uint64_t)v11);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1730]), sel_init);
    v2 = (void *)sub_235E18D10();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setGivenName_, v2);

    if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x24BDB3F50]))
    {
      sub_235E18EF0();
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
    }
    sub_235DF2E14((uint64_t)&v9, (uint64_t)v11);
    if (v12)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v4 = (void *)sub_235E18D10();
        swift_bridgeObjectRelease();
LABEL_30:
        objc_msgSend(v1, sel_setMiddleName_, v4);

        v5 = (void *)sub_235E18D10();
        swift_bridgeObjectRelease();
        objc_msgSend(v1, sel_setFamilyName_, v5);

        v6 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromPersonNameComponents_style_options_, v1, 2, 0);
        v3 = sub_235E18D40();

        return v3;
      }
    }
    else
    {
      sub_235DF2E5C((uint64_t)v11);
    }
    v4 = 0;
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  if (objc_msgSend(v0, sel_accountPropertyForKey_, *MEMORY[0x24BDB3F00]))
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_235DF2E14((uint64_t)&v9, (uint64_t)v11);
  if (v12)
  {
    if (swift_dynamicCast())
      return v8;
    else
      return 0;
  }
  else
  {
    sub_235DF2E5C((uint64_t)v11);
    return 0;
  }
}

uint64_t ACAccount.enabledDataclassesLocalized()()
{
  return MEMORY[0x24BEE4AF8];
}

void sub_235DF3D60(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*v1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_235E18D40();
    v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

id sub_235DF3DBC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D58);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_235E19F00;
  v1 = (void *)*MEMORY[0x24BDB3EC8];
  v2 = (void *)*MEMORY[0x24BDB3E38];
  *(_QWORD *)(v0 + 32) = *MEMORY[0x24BDB3EC8];
  *(_QWORD *)(v0 + 40) = v2;
  v3 = (void *)*MEMORY[0x24BDB3DE8];
  v4 = (void *)*MEMORY[0x24BDB3DD8];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x24BDB3DE8];
  *(_QWORD *)(v0 + 56) = v4;
  v5 = (void *)*MEMORY[0x24BDB3DB0];
  v6 = (void *)*MEMORY[0x24BDB3E88];
  *(_QWORD *)(v0 + 64) = *MEMORY[0x24BDB3DB0];
  *(_QWORD *)(v0 + 72) = v6;
  v7 = (void *)*MEMORY[0x24BDB3E48];
  v8 = (void *)*MEMORY[0x24BDB3E68];
  *(_QWORD *)(v0 + 80) = *MEMORY[0x24BDB3E48];
  *(_QWORD *)(v0 + 88) = v8;
  v9 = (void *)*MEMORY[0x24BDB3E60];
  v10 = (void *)*MEMORY[0x24BDB3E18];
  *(_QWORD *)(v0 + 96) = *MEMORY[0x24BDB3E60];
  *(_QWORD *)(v0 + 104) = v10;
  v11 = (void *)*MEMORY[0x24BDB3E40];
  v35 = (void *)*MEMORY[0x24BDB3EA8];
  v12 = *MEMORY[0x24BDB3EA8];
  *(_QWORD *)(v0 + 112) = *MEMORY[0x24BDB3E40];
  *(_QWORD *)(v0 + 120) = v12;
  v34 = (void *)*MEMORY[0x24BDB3EB0];
  v37 = (void *)*MEMORY[0x24BDB3DF0];
  v13 = *MEMORY[0x24BDB3DF0];
  *(_QWORD *)(v0 + 128) = *MEMORY[0x24BDB3EB0];
  *(_QWORD *)(v0 + 136) = v13;
  v36 = (void *)*MEMORY[0x24BDB3E00];
  v39 = (void *)*MEMORY[0x24BDB3DA8];
  v14 = *MEMORY[0x24BDB3DA8];
  *(_QWORD *)(v0 + 144) = *MEMORY[0x24BDB3E00];
  *(_QWORD *)(v0 + 152) = v14;
  v38 = (void *)*MEMORY[0x24BDB3E58];
  v40 = (id)*MEMORY[0x24BDB3EC0];
  v15 = *MEMORY[0x24BDB3EC0];
  *(_QWORD *)(v0 + 160) = *MEMORY[0x24BDB3E58];
  *(_QWORD *)(v0 + 168) = v15;
  qword_256382B48 = v0;
  v16 = v1;
  v17 = v2;
  v18 = v3;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = v35;
  v28 = v34;
  v29 = v37;
  v30 = v36;
  v31 = v39;
  v32 = v38;
  return v40;
}

_QWORD *sub_235DF3FA4()
{
  _QWORD *result;

  result = sub_235DF3FC0();
  off_25429C280 = result;
  return result;
}

_QWORD *sub_235DF3FC0()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_235E19F10;
  *(_QWORD *)(v0 + 32) = sub_235E18D40();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_235E18D40();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_235E18D40();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = sub_235E18D40();
  *(_QWORD *)(v0 + 88) = v4;
  *(_QWORD *)(v0 + 96) = sub_235E18D40();
  *(_QWORD *)(v0 + 104) = v5;
  *(_QWORD *)(v0 + 112) = sub_235E18D40();
  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = sub_235E18D40();
  *(_QWORD *)(v0 + 136) = v7;
  *(_QWORD *)(v0 + 144) = sub_235E18D40();
  *(_QWORD *)(v0 + 152) = v8;
  v18 = (_QWORD *)v0;
  if (qword_25429C290 != -1)
    swift_once();
  v9 = swift_bridgeObjectRetain();
  sub_235DEABE8(v9);
  v10 = sub_235E18D40();
  v12 = v11;
  v13 = v18;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_235DF4494(0, v18[2] + 1, 1, v18);
  v15 = v13[2];
  v14 = v13[3];
  if (v15 >= v14 >> 1)
    v13 = sub_235DF4494((_QWORD *)(v14 > 1), v15 + 1, 1, v13);
  v13[2] = v15 + 1;
  v16 = &v13[2 * v15];
  v16[4] = v10;
  v16[5] = v12;
  return v13;
}

uint64_t static ACAccountType.internetAccountTypes.getter()
{
  if (qword_25429BC98 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_235DF41C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_235E19F20;
  *(_QWORD *)(v0 + 32) = sub_235E18D40();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_235E18D40();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_235E18D40();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = sub_235E18D40();
  *(_QWORD *)(v0 + 88) = v4;
  result = sub_235E18D40();
  *(_QWORD *)(v0 + 96) = result;
  *(_QWORD *)(v0 + 104) = v6;
  qword_25429C300 = v0;
  return result;
}

uint64_t sub_235DF426C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(v0, sel_type);
  v1 = (void *)sub_235E18D10();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v1);

  if (!v2)
  {
    __break(1u);
    JUMPOUT(0x235DF4470);
  }
  v3 = (void *)sub_235E18D10();
  v4 = (void *)sub_235E18D10();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, 0);

  v6 = sub_235E18D40();
  return v6;
}

_QWORD *sub_235DF4494(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C8);
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
    sub_235DF72D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_235DF45A0(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2D8);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_235DF6AD8((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_235DF4694(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D58);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_235DF70D8(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235DF814C();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_235DF4778(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D58);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for Dataclass(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

void sub_235DF48FC(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_235DF70C4(v2);
  v3 = v2[2];
  v4[0] = (uint64_t)(v2 + 4);
  v4[1] = v3;
  sub_235DF4964(v4);
  *a1 = v2;
}

void sub_235DF4964(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  char *v151;
  char *v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  BOOL v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  BOOL v174;
  uint64_t v175;
  char v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  BOOL v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char *v193;
  uint64_t v194;
  unint64_t v195;
  char *v196;
  uint64_t v197;
  unint64_t v198;
  char *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  char *v204;
  unint64_t v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void **__dst;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  int v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  uint64_t v224;

  v3 = a1[1];
  v4 = sub_235E1901C();
  if (v4 < v3)
  {
    v209 = v4;
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
    {
LABEL_292:
      sub_235E18FBC();
      __break(1u);
      return;
    }
    v211 = v3;
    v207 = a1;
    if (v3 < 2)
    {
      v8 = (char *)MEMORY[0x24BEE4AF8];
      __dst = (void **)(MEMORY[0x24BEE4AF8] + 32);
      v208 = MEMORY[0x24BEE4AF8];
      if (v3 != 1)
      {
        v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_251:
        if (v12 >= 2)
        {
          v200 = *v207;
          do
          {
            v201 = v12 - 2;
            if (v12 < 2)
              goto LABEL_279;
            if (!v200)
              goto LABEL_291;
            v202 = *(_QWORD *)&v8[16 * v201 + 32];
            v203 = *(_QWORD *)&v8[16 * v12 + 24];
            sub_235DF5F28((void **)(v200 + 8 * v202), (id *)(v200 + 8 * *(_QWORD *)&v8[16 * v12 + 16]), (id *)(v200 + 8 * v203), __dst);
            if (v1)
              break;
            if (v203 < v202)
              goto LABEL_280;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v8 = sub_235DF6AC4((uint64_t)v8);
            if (v201 >= *((_QWORD *)v8 + 2))
              goto LABEL_281;
            v204 = &v8[16 * v201 + 32];
            *(_QWORD *)v204 = v202;
            *((_QWORD *)v204 + 1) = v203;
            v205 = *((_QWORD *)v8 + 2);
            if (v12 > v205)
              goto LABEL_282;
            memmove(&v8[16 * v12 + 16], &v8[16 * v12 + 32], 16 * (v205 - v12));
            *((_QWORD *)v8 + 2) = v205 - 1;
            v12 = v205 - 1;
          }
          while (v205 > 2);
        }
LABEL_262:
        swift_bridgeObjectRelease();
        *(_QWORD *)(v208 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      v6 = v5 >> 1;
      type metadata accessor for Dataclass(0);
      v7 = sub_235E18DE8();
      *(_QWORD *)(v7 + 16) = v6;
      v208 = v7;
      __dst = (void **)(v7 + 32);
    }
    v9 = 0;
    v10 = *a1;
    v206 = *a1 - 8;
    v8 = (char *)MEMORY[0x24BEE4AF8];
    v11 = v211;
    v219 = *a1;
    while (1)
    {
      v13 = v9++;
      v216 = v8;
      v218 = v13;
      if (v9 >= v11)
        goto LABEL_134;
      v14 = *(void **)(v10 + 8 * v13);
      v15 = qword_256381BA0;
      v222 = *(id *)(v10 + 8 * v9);
      v16 = v14;
      if (v15 != -1)
        swift_once();
      v17 = *(_QWORD *)(qword_256382B48 + 16);
      v213 = v9;
      if (!v17)
      {
        v24 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_29;
      }
      v18 = sub_235E18D40();
      v20 = v19;
      if (v18 == sub_235E18D40() && v20 == v21)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v23 = sub_235E19028();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0)
        {
          v24 = 0;
          while (1)
          {
            if (v17 - 1 == v24)
            {
              swift_bridgeObjectRelease();
              v24 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_28;
            }
            v33 = sub_235E18D40();
            v35 = v34;
            if (v33 == sub_235E18D40() && v35 == v36)
              break;
            v38 = sub_235E19028();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ++v24;
            v10 = v219;
            if ((v38 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          ++v24;
          v10 = v219;
          goto LABEL_28;
        }
        swift_bridgeObjectRelease();
      }
      v24 = 0;
LABEL_28:
      v9 = v213;
LABEL_29:
      v25 = *(_QWORD *)(qword_256382B48 + 16);
      if (v25)
      {
        v26 = sub_235E18D40();
        v28 = v27;
        if (v26 == sub_235E18D40() && v28 == v29)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_37;
        }
        v31 = sub_235E19028();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) != 0)
        {

          swift_bridgeObjectRelease();
LABEL_37:
          v32 = 0;
          v9 = v213;
          goto LABEL_69;
        }
        v39 = 0;
        v40 = v25 - 1;
        while (1)
        {
          if (v40 == v39)
          {
            swift_bridgeObjectRelease();
            v9 = v213;
            goto LABEL_56;
          }
          v41 = v39;
          v42 = sub_235E18D40();
          v44 = v43;
          if (v42 == sub_235E18D40() && v44 == v45)
            break;
          v47 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v39 = v41 + 1;
          v10 = v219;
          if ((v47 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_65;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v10 = v219;
LABEL_65:
        v9 = v213;
        v32 = v41 + 1;
        if (v24 == 0x7FFFFFFFFFFFFFFFLL && v41 == 0x7FFFFFFFFFFFFFFELL)
        {
          v48 = v222;
LABEL_57:
          v49 = sub_235E18D40();
          v51 = v50;
          v8 = v216;
          if (v49 == sub_235E18D40() && v51 == v52)
            v220 = 0;
          else
            v220 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          goto LABEL_70;
        }

      }
      else
      {
LABEL_56:
        v48 = v222;
        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_57;

        v32 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_69:
      v220 = v24 < v32;
      v8 = v216;
LABEL_70:
      v53 = v218 + 2;
      if (v218 + 2 < v211)
      {
        while (1)
        {
          v54 = *(void **)(v10 + 8 * v53);
          v55 = *(void **)(v10 + 8 * v9);
          v56 = *(_QWORD *)(qword_256382B48 + 16);
          v223 = v53;
          if (v56)
          {
            v57 = sub_235E18D40();
            v59 = v58;
            if (v57 == sub_235E18D40() && v59 == v60)
            {
              v68 = v54;
              v69 = v55;
              swift_bridgeObjectRelease_n();
              v65 = 0;
            }
            else
            {
              v62 = sub_235E19028();
              v63 = v54;
              v64 = v55;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v62 & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v65 = 0;
              }
              else
              {
                v65 = 0;
                while (1)
                {
                  if (v56 - 1 == v65)
                  {
                    swift_bridgeObjectRelease();
                    v65 = 0x7FFFFFFFFFFFFFFFLL;
                    goto LABEL_90;
                  }
                  v70 = sub_235E18D40();
                  v72 = v71;
                  if (v70 == sub_235E18D40() && v72 == v73)
                    break;
                  v75 = sub_235E19028();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  ++v65;
                  if ((v75 & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_90;
                  }
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                ++v65;
LABEL_90:
                v10 = v219;
              }
            }
          }
          else
          {
            v66 = v54;
            v67 = v55;
            v65 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v76 = *(_QWORD *)(qword_256382B48 + 16);
          if (v76)
          {
            v77 = sub_235E18D40();
            v79 = v78;
            if (v77 == sub_235E18D40() && v79 == v80)
            {

              swift_bridgeObjectRelease_n();
              v83 = 0;
            }
            else
            {
              v82 = sub_235E19028();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v82 & 1) != 0)
              {

                swift_bridgeObjectRelease();
                v83 = 0;
              }
              else
              {
                v84 = 0;
                v85 = v76 - 1;
                while (1)
                {
                  if (v85 == v84)
                  {
                    swift_bridgeObjectRelease();
                    v10 = v219;
                    goto LABEL_108;
                  }
                  v86 = v84;
                  v87 = sub_235E18D40();
                  v89 = v88;
                  if (v87 == sub_235E18D40() && v89 == v90)
                    break;
                  v92 = sub_235E19028();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v84 = v86 + 1;
                  if ((v92 & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_116;
                  }
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
LABEL_116:
                v83 = v86 + 1;
                if (v65 == 0x7FFFFFFFFFFFFFFFLL && v86 == 0x7FFFFFFFFFFFFFFELL)
                {
                  v10 = v219;
LABEL_109:
                  v93 = sub_235E18D40();
                  v95 = v94;
                  v53 = v223;
                  if (v93 == sub_235E18D40() && v95 == v96)
                    v97 = 0;
                  else
                    v97 = sub_235E19028();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  v8 = v216;
                  goto LABEL_121;
                }

                v10 = v219;
              }
            }
          }
          else
          {
LABEL_108:
            if (v65 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_109;

            v83 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v97 = v65 < v83;
          v8 = v216;
          v53 = v223;
LABEL_121:
          if (((v220 ^ v97) & 1) != 0)
            break;
          v9 = v53++;
          if (v53 == v211)
          {
            v53 = v211;
            break;
          }
        }
      }
      if ((v220 & 1) != 0)
      {
        v13 = v218;
        if (v53 < v218)
          goto LABEL_285;
        if (v218 < v53)
        {
          v98 = (uint64_t *)(v206 + 8 * v53);
          v99 = v53;
          v100 = v218;
          v101 = (uint64_t *)(v10 + 8 * v218);
          while (1)
          {
            if (v100 != --v99)
            {
              if (!v10)
                goto LABEL_290;
              v102 = *v101;
              *v101 = *v98;
              *v98 = v102;
            }
            ++v100;
            --v98;
            ++v101;
            if (v100 >= v99)
              goto LABEL_132;
          }
        }
        v9 = v53;
      }
      else
      {
LABEL_132:
        v9 = v53;
        v13 = v218;
      }
LABEL_134:
      if (v9 >= v211)
        goto LABEL_200;
      if (__OFSUB__(v9, v13))
        goto LABEL_283;
      if (v9 - v13 >= v209)
        goto LABEL_200;
      if (__OFADD__(v218, v209))
        goto LABEL_286;
      v103 = v211;
      if (v218 + v209 < v211)
        v103 = v218 + v209;
      if (v103 < v218)
      {
LABEL_287:
        __break(1u);
LABEL_288:
        __break(1u);
LABEL_289:
        __break(1u);
LABEL_290:
        __break(1u);
LABEL_291:
        __break(1u);
        goto LABEL_292;
      }
      v210 = v103;
      if (v9 != v103)
      {
        while (1)
        {
          v104 = *(void **)(v10 + 8 * v9);
          v214 = v9;
LABEL_146:
          v224 = v9;
          v221 = v9 - 1;
          v105 = *(void **)(v10 + 8 * (v9 - 1));
          v106 = qword_256381BA0;
          v107 = v104;
          v108 = v105;
          if (v106 != -1)
            swift_once();
          v109 = *(_QWORD *)(qword_256382B48 + 16);
          if (!v109)
          {
            v116 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_158;
          }
          v110 = sub_235E18D40();
          v112 = v111;
          if (v110 == sub_235E18D40() && v112 == v113)
            break;
          v115 = sub_235E19028();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v115 & 1) != 0)
          {
            swift_bridgeObjectRelease();
LABEL_157:
            v116 = 0;
            goto LABEL_158;
          }
          v116 = 0;
          v125 = v109 - 1;
          while (1)
          {
            if (v125 == v116)
            {
              swift_bridgeObjectRelease();
              v116 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_158;
            }
            v126 = sub_235E18D40();
            v128 = v127;
            if (v126 == sub_235E18D40() && v128 == v129)
              break;
            v131 = sub_235E19028();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ++v116;
            if ((v131 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_158;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          ++v116;
LABEL_158:
          v117 = *(_QWORD *)(qword_256382B48 + 16);
          if (!v117)
            goto LABEL_184;
          v118 = sub_235E18D40();
          v120 = v119;
          if (v118 == sub_235E18D40() && v120 == v121)
          {

            swift_bridgeObjectRelease_n();
            v124 = 0;
            goto LABEL_195;
          }
          v123 = sub_235E19028();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v123 & 1) != 0)
          {

            swift_bridgeObjectRelease();
            v124 = 0;
            goto LABEL_195;
          }
          v132 = 0;
          v133 = v117 - 1;
          while (v133 != v132)
          {
            v134 = v132;
            v135 = sub_235E18D40();
            v137 = v136;
            if (v135 == sub_235E18D40() && v137 == v138)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              goto LABEL_192;
            }
            v140 = sub_235E19028();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v132 = v134 + 1;
            if ((v140 & 1) != 0)
            {
              swift_bridgeObjectRelease();
LABEL_192:
              v124 = v134 + 1;
              v8 = v216;
              if (v116 == 0x7FFFFFFFFFFFFFFFLL && v134 == 0x7FFFFFFFFFFFFFFELL)
                goto LABEL_185;

LABEL_195:
              v10 = v219;
              v146 = v224;
              if (v116 >= v124)
                goto LABEL_144;
LABEL_196:
              if (!v10)
                goto LABEL_288;
              v147 = 8 * v146;
              v104 = *(void **)(v10 + 8 * v146);
              *(_QWORD *)(v10 + v147) = *(_QWORD *)(v10 + 8 * v221);
              *(_QWORD *)(v10 + 8 * v221) = v104;
              v9 = v221;
              if (v221 == v218)
                goto LABEL_144;
              goto LABEL_146;
            }
          }
          swift_bridgeObjectRelease();
          v8 = v216;
LABEL_184:
          if (v116 != 0x7FFFFFFFFFFFFFFFLL)
          {

            v124 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_195;
          }
LABEL_185:
          v141 = sub_235E18D40();
          v143 = v142;
          if (v141 == sub_235E18D40() && v143 == v144)
          {

            swift_bridgeObjectRelease_n();
            v10 = v219;
          }
          else
          {
            v145 = sub_235E19028();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v10 = v219;
            v146 = v224;
            if ((v145 & 1) != 0)
              goto LABEL_196;
          }
LABEL_144:
          v9 = v214 + 1;
          if (v214 + 1 == v210)
          {
            v9 = v210;
            goto LABEL_200;
          }
        }
        swift_bridgeObjectRelease_n();
        goto LABEL_157;
      }
LABEL_200:
      if (v9 < v218)
        goto LABEL_278;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_235DF6924(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v149 = *((_QWORD *)v8 + 2);
      v148 = *((_QWORD *)v8 + 3);
      v12 = v149 + 1;
      v150 = v218;
      if (v149 >= v148 >> 1)
      {
        v199 = sub_235DF6924((char *)(v148 > 1), v149 + 1, 1, v8);
        v150 = v218;
        v8 = v199;
      }
      *((_QWORD *)v8 + 2) = v12;
      v217 = v8;
      v151 = v8 + 32;
      v152 = &v8[16 * v149 + 32];
      *(_QWORD *)v152 = v150;
      *((_QWORD *)v152 + 1) = v9;
      if (v149)
      {
        v215 = v9;
        while (1)
        {
          v153 = v12 - 1;
          if (v12 >= 4)
          {
            v158 = &v151[16 * v12];
            v159 = *((_QWORD *)v158 - 8);
            v160 = *((_QWORD *)v158 - 7);
            v164 = __OFSUB__(v160, v159);
            v161 = v160 - v159;
            if (v164)
              goto LABEL_267;
            v163 = *((_QWORD *)v158 - 6);
            v162 = *((_QWORD *)v158 - 5);
            v164 = __OFSUB__(v162, v163);
            v156 = v162 - v163;
            v157 = v164;
            if (v164)
              goto LABEL_268;
            v165 = v12 - 2;
            v166 = &v151[16 * v12 - 32];
            v168 = *(_QWORD *)v166;
            v167 = *((_QWORD *)v166 + 1);
            v164 = __OFSUB__(v167, v168);
            v169 = v167 - v168;
            if (v164)
              goto LABEL_270;
            v164 = __OFADD__(v156, v169);
            v170 = v156 + v169;
            if (v164)
              goto LABEL_273;
            if (v170 >= v161)
            {
              v188 = &v151[16 * v153];
              v190 = *(_QWORD *)v188;
              v189 = *((_QWORD *)v188 + 1);
              v164 = __OFSUB__(v189, v190);
              v191 = v189 - v190;
              if (v164)
                goto LABEL_277;
              v181 = v156 < v191;
              goto LABEL_238;
            }
          }
          else
          {
            if (v12 != 3)
            {
              v182 = *((_QWORD *)v217 + 4);
              v183 = *((_QWORD *)v217 + 5);
              v164 = __OFSUB__(v183, v182);
              v175 = v183 - v182;
              v176 = v164;
              goto LABEL_232;
            }
            v155 = *((_QWORD *)v217 + 4);
            v154 = *((_QWORD *)v217 + 5);
            v164 = __OFSUB__(v154, v155);
            v156 = v154 - v155;
            v157 = v164;
          }
          if ((v157 & 1) != 0)
            goto LABEL_269;
          v165 = v12 - 2;
          v171 = &v151[16 * v12 - 32];
          v173 = *(_QWORD *)v171;
          v172 = *((_QWORD *)v171 + 1);
          v174 = __OFSUB__(v172, v173);
          v175 = v172 - v173;
          v176 = v174;
          if (v174)
            goto LABEL_272;
          v177 = &v151[16 * v153];
          v179 = *(_QWORD *)v177;
          v178 = *((_QWORD *)v177 + 1);
          v164 = __OFSUB__(v178, v179);
          v180 = v178 - v179;
          if (v164)
            goto LABEL_275;
          if (__OFADD__(v175, v180))
            goto LABEL_276;
          if (v175 + v180 >= v156)
          {
            v181 = v156 < v180;
LABEL_238:
            if (v181)
              v153 = v165;
            goto LABEL_240;
          }
LABEL_232:
          if ((v176 & 1) != 0)
            goto LABEL_271;
          v184 = &v151[16 * v153];
          v186 = *(_QWORD *)v184;
          v185 = *((_QWORD *)v184 + 1);
          v164 = __OFSUB__(v185, v186);
          v187 = v185 - v186;
          if (v164)
            goto LABEL_274;
          if (v187 < v175)
            goto LABEL_14;
LABEL_240:
          v192 = v153 - 1;
          if (v153 - 1 >= v12)
          {
            __break(1u);
LABEL_264:
            __break(1u);
LABEL_265:
            __break(1u);
LABEL_266:
            __break(1u);
LABEL_267:
            __break(1u);
LABEL_268:
            __break(1u);
LABEL_269:
            __break(1u);
LABEL_270:
            __break(1u);
LABEL_271:
            __break(1u);
LABEL_272:
            __break(1u);
LABEL_273:
            __break(1u);
LABEL_274:
            __break(1u);
LABEL_275:
            __break(1u);
LABEL_276:
            __break(1u);
LABEL_277:
            __break(1u);
LABEL_278:
            __break(1u);
LABEL_279:
            __break(1u);
LABEL_280:
            __break(1u);
LABEL_281:
            __break(1u);
LABEL_282:
            __break(1u);
LABEL_283:
            __break(1u);
LABEL_284:
            __break(1u);
LABEL_285:
            __break(1u);
LABEL_286:
            __break(1u);
            goto LABEL_287;
          }
          if (!v10)
            goto LABEL_289;
          v193 = &v151[16 * v192];
          v194 = *(_QWORD *)v193;
          v195 = v153;
          v196 = &v151[16 * v153];
          v197 = *((_QWORD *)v196 + 1);
          sub_235DF5F28((void **)(v10 + 8 * *(_QWORD *)v193), (id *)(v10 + 8 * *(_QWORD *)v196), (id *)(v10 + 8 * v197), __dst);
          if (v1)
            goto LABEL_262;
          if (v197 < v194)
            goto LABEL_264;
          if (v195 > *((_QWORD *)v217 + 2))
            goto LABEL_265;
          *(_QWORD *)v193 = v194;
          *(_QWORD *)&v151[16 * v192 + 8] = v197;
          v198 = *((_QWORD *)v217 + 2);
          if (v195 >= v198)
            goto LABEL_266;
          v12 = v198 - 1;
          memmove(v196, v196 + 16, 16 * (v198 - 1 - v195));
          *((_QWORD *)v217 + 2) = v198 - 1;
          v9 = v215;
          if (v198 <= 2)
            goto LABEL_14;
        }
      }
      v12 = 1;
LABEL_14:
      v11 = v211;
      v8 = v217;
      if (v9 >= v211)
        goto LABEL_251;
    }
  }
  if (v3 < 0)
    goto LABEL_284;
  if (v3)
    sub_235DF5AC8(0, v3, 1, a1);
}

void sub_235DF5AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  if (a3 != a2)
  {
    v4 = a1;
    v5 = *a4;
    v52 = *a4;
LABEL_6:
    v6 = *(void **)(v5 + 8 * a3);
    v50 = a3;
    while (1)
    {
      v53 = a3 - 1;
      v54 = a3;
      v7 = *(void **)(v5 + 8 * (a3 - 1));
      v8 = qword_256381BA0;
      v9 = v6;
      v55 = v7;
      if (v8 != -1)
        swift_once();
      v10 = *(_QWORD *)(qword_256382B48 + 16);
      if (!v10)
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_19;
      }
      v11 = sub_235E18D40();
      v13 = v12;
      if (v11 == sub_235E18D40() && v13 == v14)
        break;
      v16 = sub_235E19028();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        v17 = 0;
        goto LABEL_19;
      }
      v17 = 0;
      v26 = v10 - 1;
      while (1)
      {
        if (v26 == v17)
        {
          swift_bridgeObjectRelease();
          v17 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_19;
        }
        v27 = sub_235E18D40();
        v29 = v28;
        if (v27 == sub_235E18D40() && v29 == v30)
          break;
        v32 = sub_235E19028();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v17;
        if ((v32 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      ++v17;
LABEL_19:
      v18 = *(_QWORD *)(qword_256382B48 + 16);
      if (v18)
      {
        v19 = sub_235E18D40();
        v21 = v20;
        if (v19 == sub_235E18D40() && v21 == v22)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_27;
        }
        v24 = sub_235E19028();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) != 0)
        {

          swift_bridgeObjectRelease();
LABEL_27:
          v25 = 0;
          v5 = v52;
          goto LABEL_57;
        }
        v33 = 0;
        v34 = v18 - 1;
        v5 = v52;
        while (1)
        {
          if (v34 == v33)
          {
            swift_bridgeObjectRelease();
            v4 = a1;
            goto LABEL_46;
          }
          v35 = v33;
          v36 = sub_235E18D40();
          v38 = v37;
          if (v36 == sub_235E18D40() && v38 == v39)
            break;
          v41 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v33 = v35 + 1;
          if ((v41 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_54;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_54:
        v25 = v35 + 1;
        v4 = a1;
        if (v17 != 0x7FFFFFFFFFFFFFFFLL || v35 != 0x7FFFFFFFFFFFFFFELL)
        {

LABEL_57:
          v47 = v54;
          if (v17 >= v25)
            goto LABEL_5;
          goto LABEL_58;
        }
      }
      else
      {
LABEL_46:
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {

          v25 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_57;
        }
      }
      v42 = sub_235E18D40();
      v44 = v43;
      if (v42 == sub_235E18D40() && v44 == v45)
      {

        swift_bridgeObjectRelease_n();
LABEL_5:
        a3 = v50 + 1;
        if (v50 + 1 == a2)
          return;
        goto LABEL_6;
      }
      v46 = sub_235E19028();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v47 = v54;
      if ((v46 & 1) == 0)
        goto LABEL_5;
LABEL_58:
      if (!v5)
      {
        __break(1u);
        return;
      }
      v48 = 8 * v47;
      v6 = *(void **)(v5 + 8 * v47);
      *(_QWORD *)(v5 + v48) = *(_QWORD *)(v5 + 8 * v53);
      *(_QWORD *)(v5 + 8 * v53) = v6;
      a3 = v53;
      if (v53 == v4)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
}

uint64_t sub_235DF5F28(void **__src, id *a2, id *a3, void **__dst)
{
  void **v4;
  id *v5;
  id *v6;
  void **v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id *v53;
  void **v54;
  id *v55;
  char v56;
  void **v57;
  id *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void **v99;
  unint64_t v100;
  unint64_t v101;
  char v102;
  BOOL v103;
  uint64_t result;
  void **v105;
  void **v106;
  id *v107;
  void **v108;
  void **v109;
  void **v110;
  void **v111;
  void **v112;
  id *v113;
  id *v114;
  id *v115;
  id *v116;
  void **v117;
  void **v118;
  id *v119;

  v4 = __dst;
  v5 = a3;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 3;
  v11 = (char *)a3 - (char *)a2;
  v12 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0)
    v12 = (char *)a3 - (char *)a2;
  v13 = v12 >> 3;
  v119 = __src;
  v118 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 < -7)
      goto LABEL_145;
    if (__dst != a2 || &a2[v13] <= __dst)
      memmove(__dst, a2, 8 * v13);
    v57 = &v4[v13];
    v117 = v57;
    v119 = v6;
    if (v7 >= v6 || v11 < 8)
    {
LABEL_144:
      sub_235DF6A1C((void **)&v119, (const void **)&v118, &v117);
      return 1;
    }
    v58 = v6;
    v106 = v4;
    v112 = v7;
    while (1)
    {
      v114 = v5;
      v116 = v6;
      v59 = *(v58 - 1);
      v107 = v58 - 1;
      v108 = v57 - 1;
      v60 = qword_256381BA0;
      v61 = *(v57 - 1);
      v62 = v59;
      if (v60 != -1)
        swift_once();
      v63 = *(_QWORD *)(qword_256382B48 + 16);
      v110 = v57;
      if (!v63)
      {
        v70 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_95;
      }
      v64 = sub_235E18D40();
      v66 = v65;
      if (v64 == sub_235E18D40() && v66 == v67)
        break;
      v69 = sub_235E19028();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v69 & 1) != 0)
      {
        swift_bridgeObjectRelease();
LABEL_94:
        v70 = 0;
        goto LABEL_95;
      }
      v70 = 0;
      v79 = v63 - 1;
      while (1)
      {
        if (v79 == v70)
        {
          swift_bridgeObjectRelease();
          v70 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_95;
        }
        v80 = sub_235E18D40();
        v82 = v81;
        if (v80 == sub_235E18D40() && v82 == v83)
          break;
        v85 = sub_235E19028();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v70;
        if ((v85 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_95;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      ++v70;
LABEL_95:
      v71 = *(_QWORD *)(qword_256382B48 + 16);
      if (v71)
      {
        v72 = sub_235E18D40();
        v74 = v73;
        if (v72 == sub_235E18D40() && v74 == v75)
        {

          swift_bridgeObjectRelease_n();
          v78 = 0;
          goto LABEL_138;
        }
        v77 = sub_235E19028();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v77 & 1) != 0)
        {

          swift_bridgeObjectRelease();
          v78 = 0;
          goto LABEL_138;
        }
        v86 = 0;
        v87 = v71 - 1;
        while (1)
        {
          if (v87 == v86)
          {
            swift_bridgeObjectRelease();
            v4 = v106;
            goto LABEL_121;
          }
          v88 = v86;
          v89 = sub_235E18D40();
          v91 = v90;
          if (v89 == sub_235E18D40() && v91 == v92)
            break;
          v94 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v86 = v88 + 1;
          if ((v94 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_135;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_135:
        v78 = v88 + 1;
        v4 = v106;
        if (v70 != 0x7FFFFFFFFFFFFFFFLL || v88 != 0x7FFFFFFFFFFFFFFELL)
        {

LABEL_138:
          v100 = (unint64_t)v112;
          v99 = v114;
          v5 = v114 - 1;
          v103 = v70 < v78;
          v101 = (unint64_t)v116;
          v57 = v110;
          if (!v103)
            goto LABEL_127;
          goto LABEL_140;
        }
      }
      else
      {
LABEL_121:
        if (v70 != 0x7FFFFFFFFFFFFFFFLL)
        {

          v78 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_138;
        }
      }
      v95 = sub_235E18D40();
      v97 = v96;
      if (v95 == sub_235E18D40() && v97 == v98)
      {

        swift_bridgeObjectRelease_n();
        v100 = (unint64_t)v112;
        v99 = v114;
        v5 = v114 - 1;
        v101 = (unint64_t)v116;
        v57 = v110;
LABEL_127:
        v117 = v108;
        if (v99 < v57 || v5 >= v57 || v99 != v57)
          *v5 = *v108;
        v58 = (id *)v101;
        v57 = v108;
        if (v101 <= v100)
          goto LABEL_144;
        goto LABEL_82;
      }
      v102 = sub_235E19028();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v100 = (unint64_t)v112;
      v99 = v114;
      v5 = v114 - 1;
      v101 = (unint64_t)v116;
      v57 = v110;
      if ((v102 & 1) == 0)
        goto LABEL_127;
LABEL_140:
      v58 = v107;
      if (v99 != (void **)v101 || (unint64_t)v5 >= v101)
        *v5 = *v107;
      v119 = v107;
      if ((unint64_t)v107 <= v100)
        goto LABEL_144;
LABEL_82:
      v6 = v58;
      if (v57 <= v4)
        goto LABEL_144;
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_94;
  }
  if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v109 = &v4[v10];
    v117 = v109;
    if (v6 < v5 && v8 >= 8)
    {
      v113 = v5;
      while (1)
      {
        v111 = v7;
        v115 = v6;
        v14 = *v4;
        v15 = qword_256381BA0;
        v16 = *v6;
        v17 = v14;
        if (v15 != -1)
          swift_once();
        v18 = *(_QWORD *)(qword_256382B48 + 16);
        if (v18)
        {
          v19 = sub_235E18D40();
          v21 = v20;
          v23 = v19 == sub_235E18D40() && v21 == v22;
          if (v23)
          {
            swift_bridgeObjectRelease_n();
            v25 = 0;
          }
          else
          {
            v24 = sub_235E19028();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v24 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              v25 = 0;
            }
            else
            {
              v25 = 0;
              while (1)
              {
                if (v18 - 1 == v25)
                {
                  swift_bridgeObjectRelease();
                  v25 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_34;
                }
                v26 = sub_235E18D40();
                v28 = v27;
                if (v26 == sub_235E18D40() && v28 == v29)
                  break;
                v31 = sub_235E19028();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                ++v25;
                if ((v31 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_34;
                }
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              ++v25;
            }
          }
        }
        else
        {
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_34:
        v32 = *(_QWORD *)(qword_256382B48 + 16);
        if (v32)
        {
          v33 = sub_235E18D40();
          v35 = v34;
          if (v33 == sub_235E18D40() && v35 == v36)
          {

            swift_bridgeObjectRelease_n();
            v39 = 0;
            goto LABEL_56;
          }
          v38 = sub_235E19028();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v38 & 1) != 0)
          {

            swift_bridgeObjectRelease();
            v39 = 0;
            goto LABEL_56;
          }
          v105 = v4;
          v40 = 0;
          v41 = v32 - 1;
          while (1)
          {
            if (v41 == v40)
            {
              swift_bridgeObjectRelease();
              v4 = v105;
              goto LABEL_51;
            }
            v42 = v40;
            v43 = sub_235E18D40();
            v45 = v44;
            if (v43 == sub_235E18D40() && v45 == v46)
              break;
            v48 = sub_235E19028();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v40 = v42 + 1;
            if ((v48 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_69;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
LABEL_69:
          v39 = v42 + 1;
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {

            v4 = v105;
LABEL_56:
            v53 = v113;
            v54 = v115;
            if (v25 >= v39)
              goto LABEL_62;
            goto LABEL_57;
          }
          v23 = v42 == 0x7FFFFFFFFFFFFFFELL;
          v4 = v105;
          if (!v23)
          {

            goto LABEL_56;
          }
        }
        else
        {
LABEL_51:
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {

            v39 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_56;
          }
        }
        v49 = sub_235E18D40();
        v51 = v50;
        if (v49 == sub_235E18D40() && v51 == v52)
        {

          swift_bridgeObjectRelease_n();
          v7 = v111;
          v53 = v113;
          v54 = v115;
LABEL_62:
          if (v7 != v4)
            *v7 = *v4;
          v118 = ++v4;
          v55 = v54;
          goto LABEL_65;
        }
        v56 = sub_235E19028();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v7 = v111;
        v53 = v113;
        v54 = v115;
        if ((v56 & 1) == 0)
          goto LABEL_62;
LABEL_57:
        v55 = v54 + 1;
        if (v7 < v54 || v7 >= v55 || v7 != v54)
          *v7 = *v54;
LABEL_65:
        ++v7;
        if (v4 < v109)
        {
          v6 = v55;
          if (v55 < v53)
            continue;
        }
        v119 = v7;
        goto LABEL_144;
      }
    }
    goto LABEL_144;
  }
LABEL_145:
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

char *sub_235DF6924(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D60);
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

char *sub_235DF6A1C(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_235E18FF8();
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

char *sub_235DF6AC4(uint64_t a1)
{
  return sub_235DF6924(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235DF6AD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235DF8154(&qword_25429C278, &qword_25429C270);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25429C270);
          v12 = sub_235DF6EF0(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t sub_235DF6CEC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_235E18FC8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235DF8154(&qword_256381D68, &qword_25429C230);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25429C230);
          v12 = sub_235DF6F48(v16, i, a3);
          v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for AccountGroup(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

uint64_t (*sub_235DF6EF0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_235DF6FC8(v6, a2, a3);
  return sub_235DF6F44;
}

uint64_t (*sub_235DF6F48(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_235DF703C(v6, a2, a3);
  return sub_235DF6F44;
}

void sub_235DF6F9C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_235DF6FC8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B7E2484](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for DataclassTable;
  }
  __break(1u);
  return result;
}

void destroy for DataclassTable(id *a1)
{

}

uint64_t (*sub_235DF703C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x23B7E2484](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_235DF70A8;
  }
  __break(1u);
  return result;
}

uint64_t sub_235DF70A8()
{
  return swift_release();
}

void sub_235DF70B0()
{
  JUMPOUT(0x23B7E2538);
}

uint64_t sub_235DF70C4(_QWORD *a1)
{
  return sub_235DF4778(0, a1[2], 0, a1);
}

_QWORD *sub_235DF70D8(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  id v21;

  v5 = result;
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
    return (_QWORD *)v10;
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
    v20 = *(void **)(*(_QWORD *)(a4 + 48) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
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

uint64_t sub_235DF72D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

void _sSo9ACAccountC18AccountsUISettingsE1loiySbAB_ABtFZ_0(void *a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  void *v50;
  id v51;
  unsigned __int8 v52;
  void *v53;
  id v54;
  unsigned __int8 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[3];
  uint64_t v60;

  if (ACAccount.appearsActive()() && !ACAccount.appearsActive()()
    || !ACAccount.appearsActive()() && ACAccount.appearsActive()())
  {
    return;
  }
  v4 = objc_msgSend(a1, sel_accountType);
  if (!v4)
  {
    __break(1u);
LABEL_65:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_66;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_identifier);

  if (v6)
  {
    v7 = sub_235E18D40();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = objc_msgSend(a2, sel_accountType);
  if (!v10)
    goto LABEL_65;
  v11 = v10;
  v12 = objc_msgSend(v10, sel_identifier);

  if (!v12)
  {
    if (!v9)
      goto LABEL_29;
    goto LABEL_20;
  }
  v13 = sub_235E18D40();
  v15 = v14;

  if (!v9)
  {
    if (!v15)
      goto LABEL_29;
    goto LABEL_20;
  }
  if (!v15)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v7 == v13 && v9 == v15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  v30 = sub_235E19028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0)
  {
LABEL_21:
    if (qword_25429BC98 != -1)
      swift_once();
    v16 = off_25429C280;
    swift_bridgeObjectRetain();
    v17 = objc_msgSend(a1, sel_accountType);
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend(v17, sel_identifier);

      if (v19)
      {
        v20 = sub_235E18D40();
        v22 = v21;

        sub_235DF3074(v20, v22, v16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v23 = off_25429C280;
        swift_bridgeObjectRetain();
        v24 = objc_msgSend(a2, sel_accountType);
        if (v24)
        {
          v25 = v24;
          v26 = objc_msgSend(v24, sel_identifier);

          if (v26)
          {
            v27 = sub_235E18D40();
            v29 = v28;

            sub_235DF3074(v27, v29, v23);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return;
          }
          goto LABEL_69;
        }
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
LABEL_29:
  v31 = objc_msgSend(a1, sel_accountType);
  if (!v31)
  {
LABEL_70:
    __break(1u);
    return;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_identifier);

  if (!v33)
  {
    sub_235E18D40();
    goto LABEL_36;
  }
  v34 = sub_235E18D40();
  v36 = v35;

  v37 = sub_235E18D40();
  if (!v36)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v34 == v37 && v36 == v38)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_43;
  }
  v49 = sub_235E19028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v49 & 1) != 0)
  {
LABEL_43:
    v50 = (void *)sub_235E18D10();
    v51 = objc_msgSend(a1, sel_accountPropertyForKey_, v50);

    if (v51)
    {
      sub_235E18EF0();
      swift_unknownObjectRelease();
    }
    else
    {
      v57 = 0u;
      v58 = 0u;
    }
    sub_235DF2E14((uint64_t)&v57, (uint64_t)v59);
    if (v60)
    {
      sub_235DF2A90(0, &qword_256381D50);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v52 = objc_msgSend(v56, sel_BOOLValue);

        goto LABEL_51;
      }
    }
    else
    {
      sub_235DF2E5C((uint64_t)v59);
    }
    v52 = 0;
LABEL_51:
    v53 = (void *)sub_235E18D10();
    v54 = objc_msgSend(a2, sel_accountPropertyForKey_, v53);

    if (v54)
    {
      sub_235E18EF0();
      swift_unknownObjectRelease();
    }
    else
    {
      v57 = 0u;
      v58 = 0u;
    }
    sub_235DF2E14((uint64_t)&v57, (uint64_t)v59);
    if (v60)
    {
      sub_235DF2A90(0, &qword_256381D50);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v55 = objc_msgSend(v56, sel_BOOLValue);

        if ((v52 & 1) != 0)
        {
          if ((v55 & 1) == 0)
            return;
        }
        else if ((v55 & 1) != 0)
        {
          return;
        }
        goto LABEL_37;
      }
    }
    else
    {
      sub_235DF2E5C((uint64_t)v59);
    }
    if ((v52 & 1) != 0)
      return;
  }
LABEL_37:
  v39 = objc_msgSend(a1, sel_accountDescription);
  if (v39)
  {
    v40 = v39;
    v41 = sub_235E18D40();
    v43 = v42;

    v44 = objc_msgSend(a2, sel_accountDescription);
    if (v44)
    {
      v45 = v44;
      v46 = sub_235E18D40();
      v48 = v47;

      v59[0] = v41;
      v59[1] = v43;
      *(_QWORD *)&v57 = v46;
      *((_QWORD *)&v57 + 1) = v48;
      sub_235DF807C();
      sub_235E18EE4();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_235DF7A34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256381BD0;
  if (!qword_256381BD0)
  {
    type metadata accessor for Dataclass(255);
    result = MEMORY[0x23B7E291C](&unk_235E19CFC, v1);
    atomic_store(result, (unint64_t *)&qword_256381BD0);
  }
  return result;
}

id sub_235DF7A7C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id result;
  id *i;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;

  v3 = *(_QWORD *)(a1 + 16);
  result = (id)MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v34 = MEMORY[0x24BEE4AF8];
    sub_235E18F98();
    for (i = (id *)(a1 + 32); ; ++i)
    {
      v24 = v3;
      v7 = *i;
      result = objc_msgSend(a2, sel_identifier);
      if (!result)
        break;
      v8 = result;
      v9 = sub_235E18D40();
      v22 = v10;
      v23 = v9;

      v11 = v7;
      sub_235DF32A8();
      if (v13)
        v14 = v12;
      else
        v14 = 0x4E574F4E4B4E55;
      v15 = 0xE700000000000000;
      if (v13)
        v15 = v13;
      v20 = (void *)v15;
      v21 = v14;
      v16 = (_QWORD *)swift_allocObject();
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = a2;
      v16[5] = v11;
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = 0;
      *(_QWORD *)(v17 + 24) = 0;
      v18 = v11;
      v19 = a2;
      sub_235E18C14();
      LOBYTE(v25) = 1;
      sub_235E18C20();
      sub_235E18C20();
      type metadata accessor for AccountUISetting.CustomDataclass(0);
      swift_allocObject();
      AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(v23, v22, v18, v21, v20, 0, v31, v32, v33, v28, v29, v30, v25, v26, v27, 0, 0, 0);

      sub_235E18F80();
      sub_235E18FA4();
      sub_235E18FB0();
      sub_235E18F8C();
      v3 = v24 - 1;
      if (v24 == 1)
        return (id)v34;
    }
    __break(1u);
  }
  return result;
}

void _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  if (a2)
  {
    v7[0] = a1;
    v7[1] = a2;
    sub_235DF807C();
    if (*(_QWORD *)(sub_235E18ECC() + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_235E18D64();
      swift_bridgeObjectRelease();
      strcpy((char *)v7, "ACCOUNT_TYPE_");
      HIWORD(v7[1]) = -4864;
      sub_235E18D7C();
      swift_bridgeObjectRelease();
      v2 = (void *)sub_235E18D10();
      v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2, 46, 0xE100000000000000, v7[0], v7[1]);

      if (v3)
      {
        v4 = (void *)sub_235E18D10();
        swift_bridgeObjectRelease();
        v5 = (void *)sub_235E18D10();
        v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

        sub_235E18D40();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_235DF7E90()
{
  return MEMORY[0x24BEE0D10];
}

void sub_235DF7E9C()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  sub_235DF807C();
  if (*(_QWORD *)(sub_235E18ECC() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_235E18D64();
    swift_bridgeObjectRelease();
    sub_235E18F44();
    swift_bridgeObjectRelease();
    sub_235E18D7C();
    swift_bridgeObjectRelease();
    v0 = (void *)sub_235E18D10();
    v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0, 46, 0xE100000000000000, 0xD000000000000012, 0x8000000235E1ED50);

    if (v1)
    {
      v2 = (void *)sub_235E18D10();
      swift_bridgeObjectRelease();
      v3 = (void *)sub_235E18D10();
      v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, 0);

      sub_235E18D40();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_235DF807C()
{
  unint64_t result;

  result = qword_25429C228;
  if (!qword_25429C228)
  {
    result = MEMORY[0x23B7E291C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25429C228);
  }
  return result;
}

uint64_t sub_235DF80C4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

id sub_235DF80F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  id result;

  result = objc_msgSend(*(id *)(v1 + 32), sel_isEnabledForDataclass_, *(_QWORD *)(v1 + 40));
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_235DF8128()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DF814C()
{
  return swift_release();
}

uint64_t sub_235DF8154(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235DF8194()
{
  sub_235DF807C();
  if (*(_QWORD *)(sub_235E18ECC() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_235E18D58();
  }
  swift_bridgeObjectRelease();
  sub_235E18D7C();
  swift_bridgeObjectRelease();
  sub_235E18D7C();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_235DF82B8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

BOOL sub_235DF832C(id a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  BOOL v11;

  if (a2 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_235E18FC8())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E2484](v5 - 4, a2) : *(id *)(a2 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, sel_type);

      v11 = v9 == a1;
      v10 = v9 == a1;
      ++v5;
      v11 = v11 || v8 == v4;
      if (v11)
        goto LABEL_17;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  v10 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_235DF8424(id a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (a2 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_235E18FC8())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E2484](v5 - 4, a2) : *(id *)(a2 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if (objc_msgSend(v6, sel_type) == a1)
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_235DF851C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t result;
  uint64_t v21;
  _QWORD *v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381F18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381F20);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
LABEL_10:
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    sub_235E18890();
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = a1;
  sub_235E187B8();

  swift_release();
  swift_release();
  v12 = v22;
  if (v22)
  {
    v13 = objc_msgSend(v22, sel_provisionedDataclasses);
    if (v13)
    {
      v14 = v13;
      v22 = 0;
      type metadata accessor for Dataclass(0);
      sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
      sub_235E18E24();
      if (v22)
      {
        v21 = a2;

        v15 = swift_bridgeObjectRetain();
        v16 = sub_235DF4694(v15);
        swift_bridgeObjectRelease();
        v22 = v16;
        sub_235DF48FC(&v22);
        swift_bridgeObjectRelease();
        v17 = v22;
        v18 = v12;
        v19 = sub_235DF7A7C((uint64_t)v17, v18);
        swift_release();

        v22 = v19;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381F38);
        sub_235E009C4(&qword_256381F40, &qword_256381F38, MEMORY[0x24BEE12D8]);
        sub_235E00980();
        sub_235DF1B80(&qword_256381F48, type metadata accessor for AccountUISetting.CustomDataclass, (uint64_t)&protocol conformance descriptor for AccountUISetting.CustomDataclass);
        sub_235E18C38();
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
        swift_storeEnumTagMultiPayload();
        sub_235DFE174(&qword_256381F28, &qword_256381F20, (uint64_t (*)(void))sub_235E00980, MEMORY[0x24BDF4A08]);
        sub_235E18980();

        return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_10;
  }
  swift_storeEnumTagMultiPayload();
  sub_235DFE174(&qword_256381F28, &qword_256381F20, (uint64_t (*)(void))sub_235E00980, MEMORY[0x24BDF4A08]);
  return sub_235E18980();
}

uint64_t sub_235DF88D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  uint64_t v6;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  *(_QWORD *)a1 = sub_235E188A8();
  *(_QWORD *)(a1 + 8) = v2;
  type metadata accessor for AccountUISetting.CustomDataclass(0);
  sub_235DF1B80(&qword_256381EF0, type metadata accessor for AccountUISetting.CustomDataclass, (uint64_t)&protocol conformance descriptor for AccountUISetting.CustomDataclass);
  *(_QWORD *)(a1 + 16) = sub_235E18854();
  *(_QWORD *)(a1 + 24) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2B8);
  sub_235E18B78();
  *(_OWORD *)(a1 + 32) = v5;
  sub_235E18B78();
  *(_BYTE *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *((_QWORD *)&v5 + 1);
  sub_235E18B78();
  *(_BYTE *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 72) = *((_QWORD *)&v5 + 1);
  sub_235E18B78();
  *(_BYTE *)(a1 + 80) = v5;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)&v5 + 1);
  sub_235E18B78();
  *(_BYTE *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 104) = *((_QWORD *)&v5 + 1);
  sub_235E18B78();
  *(_BYTE *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 120) = *((_QWORD *)&v5 + 1);
  sub_235E18B78();
  *(_OWORD *)(a1 + 128) = v5;
  *(_QWORD *)(a1 + 144) = v6;
  sub_235E18B78();
  *(_OWORD *)(a1 + 152) = v5;
  *(_QWORD *)(a1 + 168) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381BC8);
  result = sub_235E18B78();
  *(_OWORD *)(a1 + 176) = v5;
  return result;
}

uint64_t sub_235DF8B3C@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_235DF851C(*v1, a1);
}

double sub_235DF8B44@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double result;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  swift_retain();
  sub_235DF88D4((uint64_t)v9);
  v2 = v17;
  a1[8] = v16;
  a1[9] = v2;
  v3 = v19;
  a1[10] = v18;
  a1[11] = v3;
  v4 = v13;
  a1[4] = v12;
  a1[5] = v4;
  v5 = v15;
  a1[6] = v14;
  a1[7] = v5;
  v6 = v9[1];
  *a1 = v9[0];
  a1[1] = v6;
  result = *(double *)&v10;
  v8 = v11;
  a1[2] = v10;
  a1[3] = v8;
  return result;
}

uint64_t sub_235DF8BD8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  sub_235E187B8();

  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F38);
  sub_235E009C4(&qword_256381F40, &qword_256381F38, MEMORY[0x24BEE12D8]);
  sub_235E00980();
  sub_235DF1B80(&qword_256381F48, type metadata accessor for AccountUISetting.CustomDataclass, (uint64_t)&protocol conformance descriptor for AccountUISetting.CustomDataclass);
  return sub_235E18C38();
}

void sub_235DF8CE8(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  __int128 v10;

  v10 = *(_OWORD *)(a1 + 16);
  v4 = (_QWORD *)(*((_QWORD *)&v10 + 1)
                + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_235E187B8();
    swift_release();
    swift_release();
    sub_235E00130((uint64_t)&v10);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381EE8);
    MEMORY[0x23B7E2124](v5);
    swift_release();
    swift_release();
  }
  else
  {
    v6 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v7 = v6;
      sub_235E187B8();

      swift_release();
      swift_release();
      if (v9)
      {
        swift_beginAccess();
        v8 = objc_msgSend(v9, sel_isEnabledForDataclass_, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 32));

        *a2 = v8;
      }
      else
      {
        *a2 = 0;
      }
    }
    else
    {
      sub_235DF9AB8(a1);
      type metadata accessor for AccountsUIModel(0);
      sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
      sub_235E18890();
      __break(1u);
    }
  }
}

uint64_t DataclassRow.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t OpaqueTypeConformance2;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  __int128 *v52;
  __int128 *v53;
  __int128 *v54;
  __int128 *v55;
  __int128 *v56;
  __int128 v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;

  v48 = a1;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381D70);
  MEMORY[0x24BDAC7A8](v49);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = v3;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381D78);
  v45 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381D80);
  v6 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  v47 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[9];
  v79 = v1[8];
  v80 = v8;
  v9 = v1[11];
  v81 = v1[10];
  v82 = v9;
  v10 = v1[5];
  v75 = v1[4];
  v76 = v10;
  v11 = v1[7];
  v77 = v1[6];
  v78 = v11;
  v12 = v1[1];
  v71 = *v1;
  v72 = v12;
  v13 = v1[3];
  v73 = v1[2];
  v74 = v13;
  sub_235DF9478(&v71, (uint64_t)v3);
  v67 = v79;
  v68 = v80;
  v69 = v81;
  v70 = v82;
  v63 = v75;
  v64 = v76;
  v65 = v77;
  v66 = v78;
  v59 = v71;
  v60 = v72;
  v61 = v73;
  v62 = v74;
  v57 = v82;
  sub_235DF9AB8((uint64_t)&v71);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D88);
  sub_235E18B84();
  v14 = (unint64_t)v58;
  v57 = v73;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
  sub_235E18B84();
  sub_235DF9BAC((uint64_t)&v71);
  v15 = v58;
  sub_235DFDAC4(v14);
  v17 = v16;
  v19 = v18;
  swift_bridgeObjectRelease();

  *(_QWORD *)&v59 = v17;
  *((_QWORD *)&v59 + 1) = v19;
  v43 = sub_235DF807C();
  v20 = sub_235E18A40();
  v22 = v21;
  v40 = v23;
  LOBYTE(v15) = v24 & 1;
  v57 = v75;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
  sub_235E18B9C();
  v56 = &v71;
  v55 = &v71;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381DA0);
  v39 = sub_235DFE174(&qword_256381DA8, &qword_256381D70, (uint64_t (*)(void))sub_235DFDFA4, MEMORY[0x24BDF3F50]);
  v25 = sub_235DFE174(&qword_256381E08, &qword_256381DA0, (uint64_t (*)(void))sub_235DFE1D8, MEMORY[0x24BDF4A08]);
  v26 = v44;
  v27 = (uint64_t)v42;
  sub_235E18AB8();
  swift_release();
  swift_release();
  sub_235DF1C74(v20, v22, (char)v15);
  swift_bridgeObjectRelease();
  sub_235DF0DA4(v27, &qword_256381D70);
  v57 = v76;
  sub_235E18B9C();
  v54 = &v71;
  *(_QWORD *)&v59 = v49;
  *((_QWORD *)&v59 + 1) = v38;
  *(_QWORD *)&v60 = MEMORY[0x24BDF1FA8];
  *((_QWORD *)&v60 + 1) = v39;
  *(_QWORD *)&v61 = v25;
  *((_QWORD *)&v61 + 1) = MEMORY[0x24BDF1F80];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v29 = v50;
  sub_235E18AAC();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v26, v29);
  v59 = v79;
  *(_QWORD *)&v60 = v80;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  v59 = v57;
  v30 = sub_235E18A40();
  v32 = v31;
  v34 = v33 & 1;
  v57 = v77;
  sub_235E18B9C();
  LODWORD(v49) = v60;
  v53 = &v71;
  v52 = &v71;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E48);
  *(_QWORD *)&v59 = v50;
  *((_QWORD *)&v59 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_235E009C4(&qword_256381E50, &qword_256381E48, MEMORY[0x24BDF5428]);
  v35 = v46;
  v36 = v51;
  sub_235E18AB8();
  swift_release();
  swift_release();
  sub_235DF1C74(v30, v32, v34);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v36, v35);
}

uint64_t sub_235DF9478@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;

  v61 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381EE0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381DE8);
  v57 = *(_QWORD *)(v6 - 8);
  v58 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381DD8);
  MEMORY[0x24BDAC7A8](v55);
  v60 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381DC8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v59 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v50 - v12;
  v63 = a1[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235E187B8();
  swift_release();
  swift_release();
  sub_235E00130((uint64_t)&v63);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381EE8);
  MEMORY[0x23B7E2124](&v62);
  swift_release();
  swift_release();
  if (v62 == 1)
  {
    v52 = v5;
    v53 = v13;
    v51 = v9;
    v54 = v3;
    sub_235E18E0C();
    sub_235DF9AB8((uint64_t)a1);
    sub_235DF9AB8((uint64_t)a1);
    v15 = sub_235E18E00();
    v16 = swift_allocObject();
    v17 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v16 + 16) = v15;
    *(_QWORD *)(v16 + 24) = v17;
    v18 = a1[9];
    *(_OWORD *)(v16 + 160) = a1[8];
    *(_OWORD *)(v16 + 176) = v18;
    v19 = a1[11];
    *(_OWORD *)(v16 + 192) = a1[10];
    *(_OWORD *)(v16 + 208) = v19;
    v20 = a1[5];
    *(_OWORD *)(v16 + 96) = a1[4];
    *(_OWORD *)(v16 + 112) = v20;
    v21 = a1[7];
    *(_OWORD *)(v16 + 128) = a1[6];
    *(_OWORD *)(v16 + 144) = v21;
    v22 = a1[1];
    *(_OWORD *)(v16 + 32) = *a1;
    *(_OWORD *)(v16 + 48) = v22;
    v23 = a1[3];
    *(_OWORD *)(v16 + 64) = a1[2];
    *(_OWORD *)(v16 + 80) = v23;
    sub_235DF9AB8((uint64_t)a1);
    v24 = sub_235E18E00();
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v24;
    *(_QWORD *)(v25 + 24) = v17;
    v26 = a1[9];
    *(_OWORD *)(v25 + 160) = a1[8];
    *(_OWORD *)(v25 + 176) = v26;
    v27 = a1[11];
    *(_OWORD *)(v25 + 192) = a1[10];
    *(_OWORD *)(v25 + 208) = v27;
    v28 = a1[5];
    *(_OWORD *)(v25 + 96) = a1[4];
    *(_OWORD *)(v25 + 112) = v28;
    v29 = a1[7];
    *(_OWORD *)(v25 + 128) = a1[6];
    *(_OWORD *)(v25 + 144) = v29;
    v30 = a1[1];
    *(_OWORD *)(v25 + 32) = *a1;
    *(_OWORD *)(v25 + 48) = v30;
    v31 = a1[3];
    *(_OWORD *)(v25 + 64) = a1[2];
    *(_OWORD *)(v25 + 80) = v31;
    sub_235E18C14();
    v32 = sub_235DF9BAC((uint64_t)a1);
    MEMORY[0x24BDAC7A8](v32);
    *(&v50 - 2) = (uint64_t)a1;
    sub_235DFE130();
    v33 = v14;
    v34 = v56;
    sub_235E18BD8();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_235E187B8();
    swift_release();
    swift_release();
    sub_235E00130((uint64_t)&v63);
    MEMORY[0x23B7E2124](&v62, v33);
    swift_release();
    swift_release();
    v35 = v62;
    KeyPath = swift_getKeyPath();
    v37 = swift_allocObject();
    *(_BYTE *)(v37 + 16) = (v35 & 1) == 0;
    v39 = v57;
    v38 = v58;
    v40 = (uint64_t)v60;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v60, v34, v58);
    v41 = (uint64_t *)(v40 + *(int *)(v55 + 36));
    *v41 = KeyPath;
    v41[1] = (uint64_t)sub_235E00278;
    v41[2] = v37;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v38);
    if (*(_QWORD *)a1)
    {
      v42 = sub_235DEF9A0();
      v43 = swift_getKeyPath();
      v44 = swift_allocObject();
      *(_BYTE *)(v44 + 16) = !v42;
      v45 = v59;
      sub_235E00290(v40, v59, &qword_256381DD8);
      v46 = (uint64_t *)(v45 + *(int *)(v51 + 36));
      *v46 = v43;
      v46[1] = (uint64_t)sub_235E00AD4;
      v46[2] = v44;
      sub_235DF0DA4(v40, &qword_256381DD8);
      v47 = (uint64_t)v53;
      sub_235DF2A24(v45, (uint64_t)v53, &qword_256381DC8);
      sub_235E00290(v47, (uint64_t)v52, &qword_256381DC8);
      swift_storeEnumTagMultiPayload();
      sub_235DFE010();
      sub_235E18980();
      return sub_235DF0DA4(v47, &qword_256381DC8);
    }
    else
    {
      sub_235DF9AB8((uint64_t)a1);
      type metadata accessor for AccountsUIModel(0);
      sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
      result = sub_235E18890();
      __break(1u);
    }
  }
  else
  {
    type metadata accessor for AccountUISetting.CustomDataclass(0);
    sub_235DF1B80(&qword_256381EF0, type metadata accessor for AccountUISetting.CustomDataclass, (uint64_t)&protocol conformance descriptor for AccountUISetting.CustomDataclass);
    swift_retain();
    *v5 = sub_235E18854();
    v5[1] = v49;
    swift_storeEnumTagMultiPayload();
    sub_235DFE010();
    sub_235DFE130();
    return sub_235E18980();
  }
  return result;
}

uint64_t sub_235DF9AB8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 32);
  swift_retain();
  v4 = v2;
  swift_retain();
  v5 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235DF9BAC(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_235DF9C9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountUISetting.CustomDataclass(0);
  sub_235DF1B80(&qword_256381EF0, type metadata accessor for AccountUISetting.CustomDataclass, (uint64_t)&protocol conformance descriptor for AccountUISetting.CustomDataclass);
  swift_retain();
  result = sub_235E18854();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235DF9D08(_OWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D88);
  sub_235E18B84();
  swift_getKeyPath();
  v2 = (_OWORD *)swift_allocObject();
  v3 = a1[9];
  v2[9] = a1[8];
  v2[10] = v3;
  v4 = a1[11];
  v2[11] = a1[10];
  v2[12] = v4;
  v5 = a1[5];
  v2[5] = a1[4];
  v2[6] = v5;
  v6 = a1[7];
  v2[7] = a1[6];
  v2[8] = v6;
  v7 = a1[1];
  v2[1] = *a1;
  v2[2] = v7;
  v8 = a1[3];
  v2[3] = a1[2];
  v2[4] = v8;
  sub_235DF9AB8((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381BC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E18);
  sub_235E009C4(&qword_256381EB0, &qword_256381BC8, MEMORY[0x24BEE12D8]);
  sub_235DF1B80(&qword_256381EB8, (uint64_t (*)(uint64_t))type metadata accessor for ACDataclassActionType, (uint64_t)&unk_235E19C24);
  sub_235DFE1D8();
  return sub_235E18C2C();
}

uint64_t sub_235DF9E5C@<X0>(void **a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v57 = a3;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381EC0);
  MEMORY[0x24BDAC7A8](v55);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E38);
  MEMORY[0x24BDAC7A8](v56);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381EC8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E80);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  if (objc_msgSend(v19, sel_isDestructive))
  {
    v58 = sub_235DF426C();
    v59 = v20;
    sub_235E187DC();
    v21 = sub_235E187F4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v14, 0, 1, v21);
    v22 = swift_allocObject();
    v23 = a2[9];
    *(_OWORD *)(v22 + 144) = a2[8];
    *(_OWORD *)(v22 + 160) = v23;
    v24 = a2[11];
    *(_OWORD *)(v22 + 176) = a2[10];
    *(_OWORD *)(v22 + 192) = v24;
    v25 = a2[5];
    *(_OWORD *)(v22 + 80) = a2[4];
    *(_OWORD *)(v22 + 96) = v25;
    v26 = a2[7];
    *(_OWORD *)(v22 + 112) = a2[6];
    *(_OWORD *)(v22 + 128) = v26;
    v27 = a2[1];
    *(_OWORD *)(v22 + 16) = *a2;
    *(_OWORD *)(v22 + 32) = v27;
    v28 = a2[3];
    *(_OWORD *)(v22 + 48) = a2[2];
    *(_OWORD *)(v22 + 64) = v28;
    *(_QWORD *)(v22 + 208) = v19;
    sub_235DF9AB8((uint64_t)a2);
    sub_235DF807C();
    v29 = v19;
    sub_235E18BC0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    sub_235DFE25C();
    sub_235E18980();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    v52 = v18;
    v53 = v16;
    v54 = v9;
    v31 = objc_msgSend(v19, sel_type);
    v58 = sub_235DF426C();
    v59 = v32;
    if (v31)
    {
      v33 = swift_allocObject();
      v34 = a2[9];
      *(_OWORD *)(v33 + 144) = a2[8];
      *(_OWORD *)(v33 + 160) = v34;
      v35 = a2[11];
      *(_OWORD *)(v33 + 176) = a2[10];
      *(_OWORD *)(v33 + 192) = v35;
      v36 = a2[5];
      *(_OWORD *)(v33 + 80) = a2[4];
      *(_OWORD *)(v33 + 96) = v36;
      v37 = a2[7];
      *(_OWORD *)(v33 + 112) = a2[6];
      *(_OWORD *)(v33 + 128) = v37;
      v38 = a2[1];
      *(_OWORD *)(v33 + 16) = *a2;
      *(_OWORD *)(v33 + 32) = v38;
      v39 = a2[3];
      *(_OWORD *)(v33 + 48) = a2[2];
      *(_OWORD *)(v33 + 64) = v39;
      *(_QWORD *)(v33 + 208) = v19;
      sub_235DF9AB8((uint64_t)a2);
      sub_235DF807C();
      v40 = v19;
      v41 = v52;
      sub_235E18BCC();
    }
    else
    {
      sub_235E187E8();
      v43 = sub_235E187F4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v14, 0, 1, v43);
      v44 = swift_allocObject();
      v45 = a2[9];
      *(_OWORD *)(v44 + 144) = a2[8];
      *(_OWORD *)(v44 + 160) = v45;
      v46 = a2[11];
      *(_OWORD *)(v44 + 176) = a2[10];
      *(_OWORD *)(v44 + 192) = v46;
      v47 = a2[5];
      *(_OWORD *)(v44 + 80) = a2[4];
      *(_OWORD *)(v44 + 96) = v47;
      v48 = a2[7];
      *(_OWORD *)(v44 + 112) = a2[6];
      *(_OWORD *)(v44 + 128) = v48;
      v49 = a2[1];
      *(_OWORD *)(v44 + 16) = *a2;
      *(_OWORD *)(v44 + 32) = v49;
      v50 = a2[3];
      *(_OWORD *)(v44 + 48) = a2[2];
      *(_OWORD *)(v44 + 64) = v50;
      *(_QWORD *)(v44 + 208) = v19;
      sub_235DF9AB8((uint64_t)a2);
      sub_235DF807C();
      v51 = v19;
      v41 = v52;
      sub_235E18BC0();
    }
    v42 = v53;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v6, v41, v15);
    swift_storeEnumTagMultiPayload();
    sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    sub_235E18980();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v15);
    sub_235E00290((uint64_t)v8, (uint64_t)v11, &qword_256381E38);
    swift_storeEnumTagMultiPayload();
    sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    sub_235DFE25C();
    sub_235E18980();
    return sub_235DF0DA4((uint64_t)v8, &qword_256381E38);
  }
}

void sub_235DFA38C(void *a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t *p_align;
  uint8_t *v18;
  uint8_t *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t inited;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  __int128 v39;
  void (*v40)(uint64_t, uint64_t, void *);
  void *v41;
  uint64_t (*v42)(int, void *);
  _OWORD *v43;
  unsigned __int8 v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v3 = sub_235E18770();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[9];
  v54 = v1[8];
  v55 = v7;
  v8 = v1[11];
  v56 = v1[10];
  v57 = v8;
  v9 = v1[5];
  v50 = v1[4];
  v51 = v9;
  v10 = v1[7];
  v52 = v1[6];
  v53 = v10;
  v11 = v1[1];
  v46 = *v1;
  v47 = v11;
  v12 = v1[3];
  v48 = v1[2];
  v49 = v12;
  if (qword_25429C0B0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_25429C098);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  v14 = a1;
  v15 = sub_235E18758();
  v16 = sub_235E18E60();
  p_align = &stru_250736FE8.align;
  if (os_log_type_enabled(v15, v16))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v18 = 134217984;
    *(_QWORD *)&v39 = -[NSObject type](v14, sel_type);
    sub_235E18EB4();

    _os_log_impl(&dword_235DE3000, v15, v16, "taking action: %ld", v18, 0xCu);
    v19 = v18;
    p_align = (_DWORD *)(&stru_250736FE8 + 24);
    MEMORY[0x23B7E29C4](v19, -1, -1);
  }
  else
  {

    v15 = v14;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (objc_msgSend(v14, *((SEL *)p_align + 423)))
  {
    v39 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
    sub_235E18B84();
    v20 = v45;
    if (v45)
    {
      if ((_QWORD)v46)
      {
        v21 = (id)v46;
        v22 = sub_235DE91E4();

        __swift_instantiateConcreteTypeFromMangledName(&qword_256381ED0);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_235E19620;
        v24 = *((_QWORD *)&v47 + 1);
        swift_beginAccess();
        v25 = *(void **)(v24 + 32);
        *(_QWORD *)(inited + 32) = v25;
        *(_QWORD *)(inited + 40) = v14;
        v26 = v14;
        v27 = v20;
        v28 = v25;
        sub_235E01164(inited);
        type metadata accessor for Dataclass(0);
        sub_235DF2A90(0, &qword_256381CE0);
        sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
        v29 = (void *)sub_235E18CF8();
        swift_bridgeObjectRelease();
        v39 = v49;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
        sub_235E18B84();
        v30 = v44;
        v31 = (_OWORD *)swift_allocObject();
        v32 = v55;
        v31[9] = v54;
        v31[10] = v32;
        v33 = v57;
        v31[11] = v56;
        v31[12] = v33;
        v34 = v51;
        v31[5] = v50;
        v31[6] = v34;
        v35 = v53;
        v31[7] = v52;
        v31[8] = v35;
        v36 = v47;
        v31[1] = v46;
        v31[2] = v36;
        v37 = v49;
        v31[3] = v48;
        v31[4] = v37;
        v42 = sub_235E000D8;
        v43 = v31;
        *(_QWORD *)&v39 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v39 + 1) = 1107296256;
        v40 = sub_235E07A48;
        v41 = &block_descriptor_0;
        v38 = _Block_copy(&v39);
        sub_235DF9AB8((uint64_t)&v46);
        swift_release();
        objc_msgSend(v22, sel_saveAccount_withDataclassActions_doVerify_completion_, v27, v29, v30, v38);
        _Block_release(v38);

      }
      else
      {
        sub_235DF9AB8((uint64_t)&v46);
        type metadata accessor for AccountsUIModel(0);
        sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
        sub_235E18890();
        __break(1u);
      }
    }
    else
    {
      v39 = v53;
      LOBYTE(v45) = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
      sub_235E18B90();
    }
  }
  else
  {
    v39 = v48;
    v45 = 0;
    sub_235DF9AB8((uint64_t)&v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
    sub_235E18B90();
    v39 = v53;
    LOBYTE(v45) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
    sub_235E18B90();
    sub_235DF9BAC((uint64_t)&v46);
  }
}

uint64_t sub_235DFA874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;

  sub_235DF9AB8(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D88);
  sub_235E18B84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
  sub_235E18B84();
  sub_235DF9BAC(a1);
  sub_235DFECDC((unint64_t)v8);
  swift_bridgeObjectRelease();

  sub_235DF807C();
  result = sub_235E18A40();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_235DFA97C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;

  v29 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E90);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *(_OWORD *)(a1 + 128);
  v31 = *(_QWORD *)(a1 + 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  v30 = v32;
  sub_235DF807C();
  v6 = sub_235E18A40();
  v27 = v7;
  v28 = v6;
  v25 = v8;
  v26 = v9;
  v30 = *(_OWORD *)(a1 + 152);
  v31 = *(_QWORD *)(a1 + 168);
  sub_235E18B84();
  v30 = v32;
  v24 = sub_235E18A40();
  sub_235E18944();
  v10 = sub_235E18A34();
  v12 = v11;
  v14 = v13 & 1;
  v15 = (_OWORD *)swift_allocObject();
  v16 = *(_OWORD *)(a1 + 144);
  v15[9] = *(_OWORD *)(a1 + 128);
  v15[10] = v16;
  v17 = *(_OWORD *)(a1 + 176);
  v15[11] = *(_OWORD *)(a1 + 160);
  v15[12] = v17;
  v18 = *(_OWORD *)(a1 + 80);
  v15[5] = *(_OWORD *)(a1 + 64);
  v15[6] = v18;
  v19 = *(_OWORD *)(a1 + 112);
  v15[7] = *(_OWORD *)(a1 + 96);
  v15[8] = v19;
  v20 = *(_OWORD *)(a1 + 16);
  v15[1] = *(_OWORD *)a1;
  v15[2] = v20;
  v21 = *(_OWORD *)(a1 + 48);
  v15[3] = *(_OWORD *)(a1 + 32);
  v15[4] = v21;
  sub_235DF9AB8(a1);
  sub_235E18B18();
  swift_release();
  sub_235DF1C74(v10, v12, v14);
  swift_bridgeObjectRelease();
  v22 = sub_235E18B24();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v5, 0, 1, v22);
  return sub_235E18B0C();
}

void sub_235DFABCC(_OWORD *a1@<X0>, char *a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void (*v35)(char *, char *, uint64_t);
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v60 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E80);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v62 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v59 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v58 = (char *)&v55 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v56 = (char *)&v55 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v57 = (char *)&v55 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v55 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v61 = (char *)&v55 - v18;
  v19 = (void *)sub_235E18D10();
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_bundleWithIdentifier_, v19);

  if (v21)
  {
    v22 = (void *)sub_235E18D10();
    v23 = (void *)sub_235E18D10();
    v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

    sub_235E18D40();
    v25 = sub_235E18D1C();
    v27 = v26;
    swift_bridgeObjectRelease();
    v63 = v25;
    v64 = v27;
    v28 = (_OWORD *)swift_allocObject();
    v29 = a1[9];
    v28[9] = a1[8];
    v28[10] = v29;
    v30 = a1[11];
    v28[11] = a1[10];
    v28[12] = v30;
    v31 = a1[5];
    v28[5] = a1[4];
    v28[6] = v31;
    v32 = a1[7];
    v28[7] = a1[6];
    v28[8] = v32;
    v33 = a1[1];
    v28[1] = *a1;
    v28[2] = v33;
    v34 = a1[3];
    v28[3] = a1[2];
    v28[4] = v34;
    sub_235DF9AB8((uint64_t)a1);
    sub_235DF807C();
    sub_235E18BCC();
    v35 = *(void (**)(char *, char *, uint64_t))(v62 + 32);
    v35(v61, v17, v6);
    v36 = (void *)sub_235E18D10();
    v37 = objc_msgSend(v20, sel_bundleWithIdentifier_, v36);

    if (v37)
    {
      v38 = (void *)sub_235E18D10();
      v39 = (void *)sub_235E18D10();
      v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

      sub_235E18D40();
      v41 = sub_235E18D1C();
      v43 = v42;
      swift_bridgeObjectRelease();
      v63 = v41;
      v64 = v43;
      sub_235E187E8();
      v44 = sub_235E187F4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v5, 0, 1, v44);
      v45 = v56;
      sub_235E18BC0();
      v46 = v57;
      v35(v57, v45, v6);
      v48 = v61;
      v47 = v62;
      v49 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
      v50 = v58;
      v49(v58, v61, v6);
      v51 = v59;
      v49(v59, v46, v6);
      v52 = v60;
      v49(v60, v50, v6);
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E88);
      v49(&v52[*(int *)(v53 + 48)], v51, v6);
      v54 = *(void (**)(char *, uint64_t))(v47 + 8);
      v54(v46, v6);
      v54(v48, v6);
      v54(v51, v6);
      v54(v50, v6);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235DFB09C(void **a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    sub_235E187B8();

    swift_release();
    swift_release();
    if (v3)
    {
      if (qword_25429BC90 != -1)
        swift_once();

    }
  }
  else
  {
    sub_235DF9AB8((uint64_t)a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    sub_235E18890();
    __break(1u);
  }
}

uint64_t sub_235DFB194@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  sub_235DF807C();
  result = sub_235E18A40();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

void sub_235DFB210(char a1, uint64_t a2)
{
  __int128 *v2;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t);
  void (*v46)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t);
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  _QWORD *v68;
  void *v69;
  id v70;
  id v71;
  id v72[2];
  __int128 v73;
  __int128 v74;
  id aBlock[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _OWORD v96[2];
  __int128 v97;
  _BYTE v98[24];

  v5 = v2[9];
  v95 = v2[8];
  v96[0] = v5;
  v6 = v2[11];
  v96[1] = v2[10];
  v97 = v6;
  v7 = v2[5];
  v91 = v2[4];
  v92 = v7;
  v8 = v2[7];
  v93 = v2[6];
  v94 = v8;
  v9 = v2[1];
  v87 = *v2;
  v88 = v9;
  v10 = v2[3];
  v89 = v2[2];
  v90 = v10;
  if ((a1 & 1) == 0)
    goto LABEL_25;
  if (!(_QWORD)v87)
  {
LABEL_39:
    sub_235DF9AB8((uint64_t)&v87);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    sub_235E18890();
    __break(1u);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = (id)v87;
  sub_235E187B8();

  swift_release();
  swift_release();
  v12 = aBlock[0];
  if (!aBlock[0])
    goto LABEL_8;
  v13 = objc_msgSend(aBlock[0], sel_accountType);

  if (!v13)
  {
    __break(1u);
    goto LABEL_37;
  }
  v14 = objc_msgSend(v13, sel_identifier);

  if (!v14)
  {
    v12 = 0;
LABEL_8:
    v16 = 0xE000000000000000;
    goto LABEL_9;
  }
  v12 = (id)sub_235E18D40();
  v16 = v15;

LABEL_9:
  if (v12 == (id)sub_235E18D40() && v16 == v17)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
      goto LABEL_25;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v19 = v11;
  sub_235E187B8();

  swift_release();
  swift_release();
  if (!v72[0])
  {
    *(_OWORD *)aBlock = 0u;
    v76 = 0u;
LABEL_24:
    sub_235DF0DA4((uint64_t)aBlock, &qword_25429C2E0);
    goto LABEL_25;
  }
  v20 = objc_msgSend(v72[0], sel_accountPropertyForKey_, *MEMORY[0x24BDB3F08]);

  if (v20)
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)v72 = 0u;
    v73 = 0u;
  }
  sub_235DF2A24((uint64_t)v72, (uint64_t)aBlock, &qword_25429C2E0);
  if (!*((_QWORD *)&v76 + 1))
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381EF8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v21 = v72[0];
    v22 = *((_QWORD *)&v88 + 1);
    swift_beginAccess();
    v23 = *(id *)(v22 + 32);
    v24 = sub_235DE8540((uint64_t)v23, (uint64_t)v21);
    swift_bridgeObjectRelease();

    if ((v24 & 1) == 0)
    {
      sub_235DF9AB8((uint64_t)&v87);
      v25 = (void *)sub_235E18D10();
      v26 = (void *)objc_opt_self();
      v27 = objc_msgSend(v26, sel_bundleWithIdentifier_, v25);

      if (v27)
      {
        v28 = (void *)sub_235E18D10();
        v29 = (void *)sub_235E18D10();
        v30 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, v29, 0);

        sub_235E18D40();
        v31 = (void *)sub_235E18D1C();
        v33 = v32;
        swift_bridgeObjectRelease();
        *(_OWORD *)aBlock = v95;
        *(_QWORD *)&v76 = *(_QWORD *)&v96[0];
        v72[0] = v31;
        v72[1] = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
        sub_235E18B90();
        v34 = (void *)sub_235E18D10();
        v35 = objc_msgSend(v26, sel_bundleWithIdentifier_, v34);

        if (v35)
        {
          v36 = (void *)sub_235E18D10();
          v37 = (void *)sub_235E18D10();
          v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, v37, 0);

          sub_235E18D40();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
          v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = xmmword_235E19620;
          swift_beginAccess();
          v41 = *(_QWORD *)(v22 + 40);
          v40 = *(_QWORD *)(v22 + 48);
          *(_QWORD *)(v39 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v39 + 64) = sub_235DFFF18();
          *(_QWORD *)(v39 + 32) = v41;
          *(_QWORD *)(v39 + 40) = v40;
          swift_bridgeObjectRetain();
          v42 = sub_235E18D1C();
          v44 = v43;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_OWORD *)v72 = *(_OWORD *)((char *)v96 + 8);
          *(_QWORD *)&v73 = *((_QWORD *)&v96[1] + 1);
          *(_QWORD *)&v74 = v42;
          *((_QWORD *)&v74 + 1) = v44;
          sub_235E18B90();
          *(_OWORD *)v72 = v93;
          sub_235DF2A24((uint64_t)&v72[1], (uint64_t)v98, &qword_256381F00);
          v74 = *(_OWORD *)v72;
          sub_235E003B8((uint64_t)v98);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
          sub_235E18B84();
          v74 = *(_OWORD *)v72;
          sub_235E18B90();
          sub_235E00130((uint64_t)v72);
          sub_235DF9BAC((uint64_t)&v87);
          return;
        }
        goto LABEL_38;
      }
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
  }
LABEL_25:
  v45 = (void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))(*((_QWORD *)&v88 + 1)
                                                                                      + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  v46 = *v45;
  if (*v45)
  {
    v47 = swift_allocObject();
    v48 = v96[0];
    *(_OWORD *)(v47 + 144) = v95;
    *(_OWORD *)(v47 + 160) = v48;
    v49 = v97;
    *(_OWORD *)(v47 + 176) = v96[1];
    *(_OWORD *)(v47 + 192) = v49;
    v50 = v92;
    *(_OWORD *)(v47 + 80) = v91;
    *(_OWORD *)(v47 + 96) = v50;
    v51 = v94;
    *(_OWORD *)(v47 + 112) = v93;
    *(_OWORD *)(v47 + 128) = v51;
    v52 = v88;
    *(_OWORD *)(v47 + 16) = v87;
    *(_OWORD *)(v47 + 32) = v52;
    v53 = v90;
    *(_OWORD *)(v47 + 48) = v89;
    *(_OWORD *)(v47 + 64) = v53;
    v54 = a1 & 1;
    *(_BYTE *)(v47 + 208) = v54;
    sub_235DF9AB8((uint64_t)&v87);
    sub_235E00398((uint64_t)v46);
    v46(a2, v54, sub_235E00364, v47);
    swift_release();
    sub_235E003A8((uint64_t)v46);
    return;
  }
  v55 = (void *)v87;
  if (!(_QWORD)v87)
    goto LABEL_39;
  swift_getKeyPath();
  swift_getKeyPath();
  v56 = v55;
  sub_235E187B8();

  swift_release();
  swift_release();
  v57 = aBlock[0];
  if (!aBlock[0])
  {
LABEL_35:
    v84 = v96[0];
    v85 = v96[1];
    v86 = v97;
    v80 = v92;
    v81 = v93;
    v82 = v94;
    v83 = v95;
    *(_OWORD *)aBlock = v87;
    v76 = v88;
    v77 = v89;
    v78 = v90;
    v79 = v91;
    sub_235DFBBB4(a1 & 1);
    return;
  }
  if (ACAccount.appearsActive()() || (a1 & 1) == 0)
  {

    goto LABEL_35;
  }
  if (qword_25429BC90 != -1)
    swift_once();
  swift_beginAccess();
  v58 = (void *)qword_25429C0B8;
  v59 = swift_allocObject();
  v60 = v96[0];
  *(_OWORD *)(v59 + 144) = v95;
  *(_OWORD *)(v59 + 160) = v60;
  v61 = v97;
  *(_OWORD *)(v59 + 176) = v96[1];
  *(_OWORD *)(v59 + 192) = v61;
  v62 = v92;
  *(_OWORD *)(v59 + 80) = v91;
  *(_OWORD *)(v59 + 96) = v62;
  v63 = v94;
  *(_OWORD *)(v59 + 112) = v93;
  *(_OWORD *)(v59 + 128) = v63;
  v64 = v88;
  *(_OWORD *)(v59 + 16) = v87;
  *(_OWORD *)(v59 + 32) = v64;
  v65 = v90;
  *(_OWORD *)(v59 + 48) = v89;
  *(_OWORD *)(v59 + 64) = v65;
  *(_BYTE *)(v59 + 208) = 1;
  sub_235DF9AB8((uint64_t)&v87);
  v66 = v58;
  v67 = sub_235DE91E4();
  v68 = (_QWORD *)swift_allocObject();
  v68[2] = v57;
  v68[3] = v66;
  v68[4] = sub_235DFBFEC;
  v68[5] = 0;
  v68[6] = sub_235E002DC;
  v68[7] = v59;
  *(_QWORD *)&v77 = sub_235E0034C;
  *((_QWORD *)&v77 + 1) = v68;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  *(_QWORD *)&v76 = sub_235DF82B8;
  *((_QWORD *)&v76 + 1) = &block_descriptor_74;
  v69 = _Block_copy(aBlock);
  v70 = v66;
  v71 = v57;
  swift_retain();
  swift_release();
  objc_msgSend(v67, sel_verifyCredentialsForAccount_saveWhenAuthorized_withHandler_, v71, 0, v69);
  _Block_release(v69);

  swift_release();
}

uint64_t sub_235DFBBB4(int a1)
{
  __int128 *v1;
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  id v19;
  uint64_t result;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  void (*v43)();
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v36 = a1;
  v2 = sub_235E18CA4();
  v39 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235E18CC8();
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235E18CB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1[9];
  v54 = v1[8];
  v55 = v12;
  v13 = v1[11];
  v56 = v1[10];
  v57 = v13;
  v14 = v1[5];
  v50 = v1[4];
  v51 = v14;
  v15 = v1[7];
  v52 = v1[6];
  v53 = v15;
  v16 = v1[1];
  v46 = *v1;
  v47 = v16;
  v17 = v1[3];
  v48 = v1[2];
  v49 = v17;
  v18 = (void *)v46;
  if ((_QWORD)v46)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v19 = v18;
    sub_235E187B8();

    swift_release();
    result = swift_release();
    v21 = v45;
    if (v45)
    {
      objc_msgSend(v45, sel_copy);

      sub_235E18EF0();
      swift_unknownObjectRelease();
      sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        v22 = v45;
        v40 = v49;
        v23 = v36;
        LOBYTE(v45) = (v36 & 1) == 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
        sub_235E18B90();
        sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
        (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5480], v8);
        v35 = sub_235E18E84();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        v24 = swift_allocObject();
        *(_QWORD *)(v24 + 16) = v22;
        *(_BYTE *)(v24 + 24) = v23 & 1;
        v25 = v55;
        *(_OWORD *)(v24 + 160) = v54;
        *(_OWORD *)(v24 + 176) = v25;
        v26 = v57;
        *(_OWORD *)(v24 + 192) = v56;
        *(_OWORD *)(v24 + 208) = v26;
        v27 = v51;
        *(_OWORD *)(v24 + 96) = v50;
        *(_OWORD *)(v24 + 112) = v27;
        v28 = v53;
        *(_OWORD *)(v24 + 128) = v52;
        *(_OWORD *)(v24 + 144) = v28;
        v29 = v47;
        *(_OWORD *)(v24 + 32) = v46;
        *(_OWORD *)(v24 + 48) = v29;
        v30 = v49;
        *(_OWORD *)(v24 + 64) = v48;
        *(_OWORD *)(v24 + 80) = v30;
        v43 = sub_235E0048C;
        v44 = v24;
        *(_QWORD *)&v40 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v40 + 1) = 1107296256;
        v41 = sub_235DFD288;
        v42 = &block_descriptor_95;
        v31 = _Block_copy(&v40);
        sub_235DF9AB8((uint64_t)&v46);
        v32 = v22;
        sub_235E18CBC();
        v45 = (id)MEMORY[0x24BEE4AF8];
        sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
        sub_235E009C4((unint64_t *)&qword_25429C250, &qword_25429C248, MEMORY[0x24BEE12C8]);
        sub_235E18EFC();
        v33 = (void *)v35;
        MEMORY[0x23B7E23A0](0, v7, v4, v31);
        _Block_release(v31);

        (*(void (**)(char *, uint64_t))(v39 + 8))(v4, v2);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v38);
        return swift_release();
      }
    }
  }
  else
  {
    sub_235DF9AB8((uint64_t)&v46);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

void sub_235DFBFEC(uint64_t a1, void (*a2)(uint64_t))
{
  id v3;

  if (qword_25429BC90 != -1)
    swift_once();
  swift_beginAccess();
  v3 = (id)qword_25429C0B8;
  a2(1);

}

uint64_t sub_235DFC078(char a1, __int128 *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 aBlock;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v11 = sub_235E18CA4();
  v36 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235E18CC8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v19 = a2[9];
    v45 = a2[8];
    v46 = v19;
    v20 = a2[11];
    v47 = a2[10];
    v48 = v20;
    v21 = a2[5];
    v41 = a2[4];
    v42 = v21;
    v22 = a2[7];
    v43 = a2[6];
    v44 = v22;
    v23 = a2[1];
    aBlock = *a2;
    v38 = v23;
    v24 = a2[3];
    v39 = a2[2];
    v40 = v24;
    return sub_235DFBBB4(a3 & 1);
  }
  else
  {
    v35 = v16;
    sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
    v26 = (void *)sub_235E18E6C();
    v27 = (_OWORD *)swift_allocObject();
    v28 = a2[9];
    v27[9] = a2[8];
    v27[10] = v28;
    v29 = a2[11];
    v27[11] = a2[10];
    v27[12] = v29;
    v30 = a2[5];
    v27[5] = a2[4];
    v27[6] = v30;
    v31 = a2[7];
    v27[7] = a2[6];
    v27[8] = v31;
    v32 = a2[1];
    v27[1] = *a2;
    v27[2] = v32;
    v33 = a2[3];
    v27[3] = a2[2];
    v27[4] = v33;
    *(_QWORD *)&v39 = a5;
    *((_QWORD *)&v39 + 1) = v27;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v38 = sub_235DFD288;
    *((_QWORD *)&v38 + 1) = a6;
    v34 = _Block_copy(&aBlock);
    sub_235DF9AB8((uint64_t)a2);
    swift_release();
    sub_235E18CBC();
    *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
    sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
    sub_235E009C4((unint64_t *)&qword_25429C250, &qword_25429C248, MEMORY[0x24BEE12C8]);
    sub_235E18EFC();
    MEMORY[0x23B7E23A0](0, v18, v13, v34);
    _Block_release(v34);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v35);
  }
}

void sub_235DFC330(void *a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id i;
  id v23;
  void *v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  id v34;
  id v35;
  uint64_t inited;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  _OWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  BOOL v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  BOOL v82;
  __int128 aBlock;
  void (*v84)(uint64_t, uint64_t, void *);
  void *v85;
  uint64_t (*v86)(int, void *);
  _OWORD *v87;
  _BYTE v88[24];

  v6 = sub_235E18770();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 24);
  v10 = (id *)(v9 + 32);
  swift_beginAccess();
  objc_msgSend(a1, sel_setEnabled_forDataclass_, a2 & 1, *(_QWORD *)(v9 + 32));
  if (!*(_QWORD *)a3)
  {
LABEL_52:
    sub_235DF9AB8(a3);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    sub_235E18890();
    __break(1u);
    return;
  }
  v11 = *(id *)a3;
  v12 = sub_235DE91E4();

  v13 = objc_msgSend(v12, sel_dataclassActionsForAccountSave_, a1);
  if (!v13)
    goto LABEL_19;
  v75 = v7;
  v76 = v6;
  type metadata accessor for Dataclass(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381BC8);
  sub_235DF1B80((unint64_t *)&qword_256381BD0, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_235E19CFC);
  v14 = sub_235E18D04();

  if (!*(_QWORD *)(v14 + 16))
    goto LABEL_18;
  v15 = *v10;
  v16 = sub_235DED000((uint64_t)v15);
  if ((v17 & 1) == 0)
  {

    goto LABEL_18;
  }
  v18 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v16);
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  if (!((unint64_t)v18 >> 62))
  {
    v19 = *(void **)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    if ((uint64_t)v19 > 0)
      goto LABEL_7;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v19 = (void *)sub_235E18FC8();
  swift_bridgeObjectRelease();
  if ((uint64_t)v19 <= 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_19:
    v23 = v11;
    v24 = sub_235DE91E4();

    aBlock = *(_OWORD *)(a3 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
    sub_235E18B84();
    v25 = v80;
    v26 = (_OWORD *)swift_allocObject();
    v27 = *(_OWORD *)(a3 + 144);
    v26[9] = *(_OWORD *)(a3 + 128);
    v26[10] = v27;
    v28 = *(_OWORD *)(a3 + 176);
    v26[11] = *(_OWORD *)(a3 + 160);
    v26[12] = v28;
    v29 = *(_OWORD *)(a3 + 80);
    v26[5] = *(_OWORD *)(a3 + 64);
    v26[6] = v29;
    v30 = *(_OWORD *)(a3 + 112);
    v26[7] = *(_OWORD *)(a3 + 96);
    v26[8] = v30;
    v31 = *(_OWORD *)(a3 + 16);
    v26[1] = *(_OWORD *)a3;
    v26[2] = v31;
    v32 = *(_OWORD *)(a3 + 48);
    v26[3] = *(_OWORD *)(a3 + 32);
    v26[4] = v32;
    v86 = sub_235E004A4;
    v87 = v26;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v84 = sub_235E07A48;
    v85 = &block_descriptor_101;
    v33 = _Block_copy(&aBlock);
    sub_235DF9AB8(a3);
    swift_release();
    objc_msgSend(v24, sel_saveAccount_withDataclassActions_doVerify_completion_, a1, 0, v25, v33);
    _Block_release(v33);
LABEL_20:

    return;
  }
LABEL_7:
  if (v19 != (void *)1)
  {
    aBlock = *(_OWORD *)(a3 + 176);
    *(_QWORD *)&v80 = v18;
    sub_235DF9AB8(a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D88);
    sub_235E18B90();
    aBlock = *(_OWORD *)(a3 + 32);
    *(_QWORD *)&v80 = a1;
    v34 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
    sub_235E18B90();
    aBlock = *(_OWORD *)(a3 + 64);
    sub_235DF2A24((uint64_t)&aBlock + 8, (uint64_t)&v79, &qword_256381F00);
    v80 = aBlock;
    sub_235E003B8((uint64_t)&v79);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
    sub_235E18B84();
    v80 = aBlock;
    v82 = (v88[0] & 1) == 0;
    sub_235E18B90();
    sub_235E00130((uint64_t)&aBlock);
LABEL_22:
    sub_235DF9BAC(a3);
    return;
  }
  if (!((unint64_t)v18 >> 62))
  {
    v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v20)
      goto LABEL_10;
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  if (v18 < 0)
    v19 = (void *)v18;
  else
    v19 = (void *)(v18 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  v20 = sub_235E18FC8();
  if (!v20)
    goto LABEL_27;
LABEL_10:
  v21 = v20 - 1;
  if (__OFSUB__(v20, 1))
    goto LABEL_46;
  if ((v18 & 0xC000000000000001) != 0)
    goto LABEL_47;
  if ((v21 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_49;
  }
  if (v21 >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
    goto LABEL_34;
  }
  for (i = *(id *)(v18 + 8 * v21 + 32); ; i = (id)MEMORY[0x23B7E2484]())
  {
    v19 = i;
    swift_bridgeObjectRelease();
    if (!objc_msgSend(v19, sel_type))
      break;

LABEL_28:
    v35 = v11;
    v11 = sub_235DE91E4();

    __swift_instantiateConcreteTypeFromMangledName(&qword_256381ED0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235E19620;
    v37 = *v10;
    *(_QWORD *)(inited + 32) = *v10;
    if (!v20)
    {
      v74 = v37;
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_52;
    }
    v38 = inited;
    if ((v18 & 0xC000000000000001) != 0)
    {
      v73 = v37;
      v41 = (id)MEMORY[0x23B7E2484](0, v18);
      goto LABEL_32;
    }
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v39 = *(void **)(v18 + 32);
      v40 = v37;
      v41 = v39;
LABEL_32:
      v42 = v41;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v38 + 40) = v42;
      sub_235E01164(v38);
      sub_235DF2A90(0, &qword_256381CE0);
      v24 = (void *)sub_235E18CF8();
      swift_bridgeObjectRelease();
      aBlock = *(_OWORD *)(a3 + 48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
      sub_235E18B84();
      v43 = v80;
      v44 = (_OWORD *)swift_allocObject();
      v45 = *(_OWORD *)(a3 + 144);
      v44[9] = *(_OWORD *)(a3 + 128);
      v44[10] = v45;
      v46 = *(_OWORD *)(a3 + 176);
      v44[11] = *(_OWORD *)(a3 + 160);
      v44[12] = v46;
      v47 = *(_OWORD *)(a3 + 80);
      v44[5] = *(_OWORD *)(a3 + 64);
      v44[6] = v47;
      v48 = *(_OWORD *)(a3 + 112);
      v44[7] = *(_OWORD *)(a3 + 96);
      v44[8] = v48;
      v49 = *(_OWORD *)(a3 + 16);
      v44[1] = *(_OWORD *)a3;
      v44[2] = v49;
      v50 = *(_OWORD *)(a3 + 48);
      v44[3] = *(_OWORD *)(a3 + 32);
      v44[4] = v50;
      v86 = sub_235E004DC;
      v87 = v44;
      *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v84 = sub_235E07A48;
      v85 = &block_descriptor_107;
      v51 = _Block_copy(&aBlock);
      sub_235DF9AB8(a3);
      swift_release();
      objc_msgSend(v11, sel_saveAccount_withDataclassActions_doVerify_completion_, a1, v24, v43, v51);
      _Block_release(v51);

      goto LABEL_20;
    }
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    ;
  }
  swift_bridgeObjectRelease();
  if (qword_25429C0B0 != -1)
    goto LABEL_50;
LABEL_34:
  v52 = v76;
  v53 = __swift_project_value_buffer(v76, (uint64_t)qword_25429C098);
  swift_beginAccess();
  v54 = v75;
  v55 = v77;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v77, v53, v52);
  sub_235DF9AB8(a3);
  sub_235DF9AB8(a3);
  v56 = v19;
  v57 = sub_235E18758();
  v58 = sub_235E18E60();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    *(_QWORD *)&v80 = v60;
    *(_DWORD *)v59 = 134218242;
    *(_QWORD *)&v79 = objc_msgSend(v56, sel_type);
    sub_235E18EB4();

    *(_WORD *)(v59 + 12) = 2080;
    *(_QWORD *)&v79 = v9;
    type metadata accessor for AccountUISetting.CustomDataclass(0);
    swift_retain();
    v61 = sub_235E18D4C();
    *(_QWORD *)&v79 = sub_235E0A4D0(v61, v62, (uint64_t *)&v80);
    sub_235E18EB4();
    swift_bridgeObjectRelease();
    sub_235DF9BAC(a3);
    sub_235DF9BAC(a3);
    _os_log_impl(&dword_235DE3000, v57, v58, "Setting action %ld for dataclass %s", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E29C4](v60, -1, -1);
    MEMORY[0x23B7E29C4](v59, -1, -1);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v77, v76);
  }
  else
  {

    sub_235DF9BAC(a3);
    sub_235DF9BAC(a3);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v52);
  }
  v63 = objc_msgSend(v56, sel_undoAlertTitle);
  if (v63)
  {
    v64 = v63;
    v65 = sub_235E18D40();
    v67 = v66;

    v68 = objc_msgSend(v56, sel_undoAlertMessage);
    if (v68)
    {
      v69 = v68;
      v70 = sub_235E18D40();
      v72 = v71;

      v80 = *(_OWORD *)(a3 + 128);
      v81 = *(_QWORD *)(a3 + 144);
      *(_QWORD *)&v79 = v65;
      *((_QWORD *)&v79 + 1) = v67;
      sub_235DF9AB8(a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
      sub_235E18B90();
      v80 = *(_OWORD *)(a3 + 152);
      v81 = *(_QWORD *)(a3 + 168);
      *(_QWORD *)&v79 = v70;
      *((_QWORD *)&v79 + 1) = v72;
      sub_235E18B90();
      v80 = *(_OWORD *)(a3 + 80);
      sub_235DF2A24((uint64_t)&v80 + 8, (uint64_t)v88, &qword_256381F00);
      v79 = v80;
      sub_235E003B8((uint64_t)v88);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
      sub_235E18B84();
      v79 = v80;
      v78 = !v82;
      sub_235E18B90();
      sub_235E00130((uint64_t)&v80);

      goto LABEL_22;
    }
    swift_bridgeObjectRelease();

  }
  else
  {

  }
}

uint64_t sub_235DFCDAC(int a1, void *a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  __int128 aBlock;
  uint64_t (*v56)(uint64_t);
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;

  v46 = a4;
  v45 = a1;
  v10 = sub_235E18CA4();
  v51 = *(_QWORD *)(v10 - 8);
  v52 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v50 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235E18CC8();
  v48 = *(_QWORD *)(v12 - 8);
  v49 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v47 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235E18770();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429C0B0 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v14, (uint64_t)qword_25429C098);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  v19 = a2;
  v20 = a2;
  v21 = sub_235E18758();
  v22 = sub_235E18E60();
  if (os_log_type_enabled(v21, v22))
  {
    v43 = a5;
    v44 = a6;
    v23 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v54 = v42;
    *(_DWORD *)v23 = 136315138;
    if ((v45 & 1) != 0)
    {
      v24 = 0xEB00000000796C6CLL;
      v25 = 0x7566736563637573;
    }
    else
    {
      *(_QWORD *)&aBlock = 0;
      *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
      sub_235E18F44();
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "with an error ");
      HIBYTE(aBlock) = -18;
      v53 = a2;
      v26 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381ED8);
      sub_235E18D4C();
      sub_235E18D7C();
      swift_bridgeObjectRelease();
      v24 = *((_QWORD *)&aBlock + 1);
      v25 = aBlock;
    }
    *(_QWORD *)&aBlock = sub_235E0A4D0(v25, v24, &v54);
    sub_235E18EB4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235DE3000, v21, v22, "save completed %s", v23, 0xCu);
    v27 = v42;
    swift_arrayDestroy();
    MEMORY[0x23B7E29C4](v27, -1, -1);
    MEMORY[0x23B7E29C4](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    a5 = v43;
    a6 = v44;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
  v28 = (void *)sub_235E18E6C();
  v29 = (_OWORD *)swift_allocObject();
  v30 = a3[9];
  v29[9] = a3[8];
  v29[10] = v30;
  v31 = a3[11];
  v29[11] = a3[10];
  v29[12] = v31;
  v32 = a3[5];
  v29[5] = a3[4];
  v29[6] = v32;
  v33 = a3[7];
  v29[7] = a3[6];
  v29[8] = v33;
  v34 = a3[1];
  v29[1] = *a3;
  v29[2] = v34;
  v35 = a3[3];
  v29[3] = a3[2];
  v29[4] = v35;
  v58 = a5;
  v59 = v29;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v56 = sub_235DFD288;
  v57 = a6;
  v36 = _Block_copy(&aBlock);
  sub_235DF9AB8((uint64_t)a3);
  swift_release();
  v37 = v47;
  sub_235E18CBC();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
  sub_235E009C4((unint64_t *)&qword_25429C250, &qword_25429C248, MEMORY[0x24BEE12C8]);
  v38 = v50;
  v39 = v52;
  sub_235E18EFC();
  MEMORY[0x23B7E23A0](0, v37, v38, v36);
  _Block_release(v36);

  (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v39);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v37, v49);
}

uint64_t sub_235DFD288(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_235DFD2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  id v37;

  v36 = *(_OWORD *)(v6 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
  sub_235E18B84();
  if (!v37)
    goto LABEL_8;
  v11 = objc_msgSend(v37, sel_accountType, v36);

  if (!v11)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = objc_msgSend(v11, sel_identifier);

  if (!v12)
  {
LABEL_8:
    sub_235E18D40();
    goto LABEL_9;
  }
  v13 = sub_235E18D40();
  v15 = v14;

  v16 = sub_235E18D40();
  if (!v15)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v13 != v16 || v15 != v17)
  {
    v25 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_14;
LABEL_10:
    v18 = (void *)sub_235E18D10();
    v19 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v18);

    if (v19)
    {
      swift_bridgeObjectRetain();
      sub_235E18D7C();
      v20 = (void *)sub_235E18D10();
      swift_bridgeObjectRelease();
      v21 = objc_msgSend(v19, sel_localizedStringForKey_value_table_, v20, 0, 0);

      sub_235E18D40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_235E19610;
      v23 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE0D00];
      v24 = sub_235DFFF18();
      *(_QWORD *)(v22 + 32) = a3;
      *(_QWORD *)(v22 + 40) = a4;
      *(_QWORD *)(v22 + 96) = v23;
      *(_QWORD *)(v22 + 104) = v24;
      *(_QWORD *)(v22 + 64) = v24;
      *(_QWORD *)(v22 + 72) = a5;
      *(_QWORD *)(v22 + 80) = a6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_12:
      sub_235E18D1C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  swift_beginAccess();
  v26 = sub_235E18D40();
  v28 = v27;
  if (v26 == sub_235E18D40() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v30 = sub_235E19028();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0)
    goto LABEL_10;
LABEL_18:
  v31 = (void *)sub_235E18D10();
  v32 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v31);

  if (v32)
  {
    swift_bridgeObjectRetain();
    sub_235E18D7C();
    v33 = (void *)sub_235E18D10();
    swift_bridgeObjectRelease();
    v34 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, 0, 0);

    sub_235E18D40();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_235E19620;
    *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v35 + 64) = sub_235DFFF18();
    *(_QWORD *)(v35 + 32) = a5;
    *(_QWORD *)(v35 + 40) = a6;
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_235DFD738()
{
  return sub_235E18A7C();
}

uint64_t sub_235DFD754@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  swift_beginAccess();
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  sub_235DF807C();
  swift_bridgeObjectRetain();
  v4 = sub_235E18A40();
  v6 = v5;
  v8 = v7;
  v10 = v9 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235E187B8();
  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v8;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v13;
  *(_QWORD *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 56) = v15;
  sub_235DFEC48(v4, v6, v10);
  swift_bridgeObjectRetain();
  sub_235DFEC58(v12, v13, v14, v15);
  sub_235DFEC88(v12, v13, v14, v15);
  sub_235DF1C74(v4, v6, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DFD8B0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_235E18CD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E78);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    v13 = v12;
    sub_235E18B3C();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE855D0], v4);
    sub_235E18B54();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v11, v8);
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, v14, 1, v8);
}

uint64_t sub_235DFDA18()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E60);
  sub_235E009C4(&qword_256381E68, &qword_256381E58, MEMORY[0x24BDF5428]);
  sub_235DFEBD0();
  return sub_235E18B6C();
}

void sub_235DFDAC4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;

  v3 = *(_QWORD *)(v1 + 24);
  if (sub_235DF832C((id)4, a1) || sub_235DF832C((id)5, a1) || sub_235DF832C((id)6, a1))
  {
    v4 = (void *)sub_235E18D10();
    v5 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v4);

    if (v5)
    {
LABEL_5:
      v6 = (void *)sub_235E18D10();
      v7 = (void *)sub_235E18D10();
      v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, v7, 0);

      sub_235E18D40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_235E19620;
      swift_beginAccess();
      v11 = *(_QWORD *)(v3 + 40);
      v10 = *(_QWORD *)(v3 + 48);
      *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v9 + 64) = sub_235DFFF18();
      *(_QWORD *)(v9 + 32) = v11;
      *(_QWORD *)(v9 + 40) = v10;
      swift_bridgeObjectRetain();
      sub_235E18D1C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_26;
  }
  if (!sub_235DF832C((id)3, a1) && !sub_235DF832C((id)2, a1))
  {
    if (!sub_235DF832C((id)8, a1))
    {
      swift_beginAccess();
      v19 = sub_235E18D40();
      v21 = v20;
      if (v19 == sub_235E18D40() && v21 == v22)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v23 = sub_235E19028();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0)
          return;
      }
    }
    v24 = (void *)sub_235E18D10();
    v25 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v24);

    if (v25)
    {
      v26 = (void *)sub_235E18D10();
      v27 = (void *)sub_235E18D10();
      v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, v27, 0);

      sub_235E18D40();
      return;
    }
    goto LABEL_27;
  }
  if (!sub_235DF832C((id)3, a1))
    goto LABEL_14;
  swift_beginAccess();
  v12 = sub_235E18D40();
  v14 = v13;
  if (v12 == sub_235E18D40() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v17 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
LABEL_14:
      v18 = (void *)sub_235E18D10();
      v5 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v18);

      if (v5)
        goto LABEL_5;
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
    }
  }
}

uint64_t sub_235DFDF94()
{
  uint64_t v0;

  return sub_235DF9D08(*(_OWORD **)(v0 + 16));
}

uint64_t sub_235DFDF9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235DFA874(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_235DFDFA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381DB0;
  if (!qword_256381DB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381DB8);
    v2[0] = sub_235DFE010();
    v2[1] = sub_235DFE130();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381DB0);
  }
  return result;
}

unint64_t sub_235DFE010()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381DC0;
  if (!qword_256381DC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381DC8);
    v2[0] = sub_235DFE094();
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381DC0);
  }
  return result;
}

unint64_t sub_235DFE094()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381DD0;
  if (!qword_256381DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381DD8);
    v2[0] = sub_235E009C4(&qword_256381DE0, &qword_256381DE8, MEMORY[0x24BDF46D0]);
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381DD0);
  }
  return result;
}

unint64_t sub_235DFE130()
{
  unint64_t result;

  result = qword_256381E00;
  if (!qword_256381E00)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1A074, &type metadata for DataclassLabelView);
    atomic_store(result, (unint64_t *)&qword_256381E00);
  }
  return result;
}

uint64_t sub_235DFE174(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x23B7E291C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235DFE1D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381E10;
  if (!qword_256381E10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E18);
    v2[0] = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    v2[1] = sub_235DFE25C();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381E10);
  }
  return result;
}

unint64_t sub_235DFE25C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381E30;
  if (!qword_256381E30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E38);
    v2[0] = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    v2[1] = v2[0];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381E30);
  }
  return result;
}

uint64_t sub_235DFE2D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235DFA97C(*(_QWORD *)(v1 + 16), a1);
}

void sub_235DFE2E0(char *a1@<X8>)
{
  uint64_t v1;

  sub_235DFABCC(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_235DFE2E8@<X0>(uint64_t a1@<X8>)
{
  return sub_235DFB194(a1);
}

uint64_t sub_235DFE2F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for DataclassRow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DataclassRow(id *a1)
{

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DataclassRow(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v11;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v5 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v5;
  v6 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v6;
  v7 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v7;
  v11 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v11;
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  v8 = v3;
  swift_retain();
  v9 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DataclassRow(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy192_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 128) = result;
  *(_OWORD *)(a1 + 144) = v9;
  return result;
}

uint64_t assignWithTake for DataclassRow(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 192))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataclassRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 192) = 1;
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
    *(_BYTE *)(result + 192) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataclassRow()
{
  return &type metadata for DataclassRow;
}

uint64_t sub_235DFE91C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381D80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381D78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381D70);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381DA0);
  sub_235DFE174(&qword_256381DA8, &qword_256381D70, (uint64_t (*)(void))sub_235DFDFA4, MEMORY[0x24BDF3F50]);
  sub_235DFE174(&qword_256381E08, &qword_256381DA0, (uint64_t (*)(void))sub_235DFE1D8, MEMORY[0x24BDF4A08]);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_235E009C4(&qword_256381E50, &qword_256381E48, MEMORY[0x24BDF5428]);
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for DataclassLabelView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for DataclassLabelView()
{
  return swift_release();
}

_QWORD *assignWithCopy for DataclassLabelView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for DataclassLabelView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassLabelView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataclassLabelView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataclassLabelView()
{
  return &type metadata for DataclassLabelView;
}

uint64_t sub_235DFEBB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235DFEBC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235DFD754(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_235DFEBC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235DFD8B0(*(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_235DFEBD0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;

  result = qword_256381E70;
  if (!qword_256381E70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E60);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF5578], v1, &OpaqueTypeConformance2);
    atomic_store(result, (unint64_t *)&qword_256381E70);
  }
  return result;
}

uint64_t sub_235DFEC48(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_235DFEC58(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_235DFEC48(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_235DFEC88(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_235DF1C74(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235DFECB8()
{
  return objectdestroyTm();
}

void sub_235DFECC0()
{
  uint64_t v0;

  sub_235DFB09C((void **)(v0 + 16));
}

uint64_t sub_235DFECD0()
{
  return objectdestroyTm();
}

uint64_t sub_235DFECDC(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  unint64_t v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  char v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;

  v3 = *(_QWORD *)(v1 + 24);
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 48);
  v130 = *(_QWORD *)(v3 + 40);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D90);
  sub_235E18B84();
  v5 = (uint64_t)v131;
  if (v131)
  {
    v6 = objc_msgSend(v131, sel_accountType);

    if (!v6)
    {
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    v7 = objc_msgSend(v6, sel_identifier);

    if (v7)
    {
      v5 = sub_235E18D40();
      v9 = v8;

      goto LABEL_7;
    }
    v5 = 0;
  }
  v9 = 0;
LABEL_7:
  _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(v5, v9);
  v11 = v10;
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = sub_235DF8424((id)8, a1);
  if (v14)
  {
    v15 = v14;
    swift_beginAccess();
    v16 = sub_235E18D40();
    v18 = v17;
    if (v16 == sub_235E18D40() && v18 == v19)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_17;
    }
    v29 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      v30 = (void *)sub_235E18D10();
      v31 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v30);

      if (v31)
      {
        v32 = (void *)sub_235E18D10();
        v33 = (void *)sub_235E18D10();
        v34 = objc_msgSend(v31, sel_localizedStringForKey_value_table_, v32, v33, 0);

        v26 = sub_235E18D40();
        v28 = v35;

        goto LABEL_51;
      }
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
      goto LABEL_86;
    }
    v36 = objc_msgSend(v15, sel_affectedContainers);
    if (v36)
    {
      v38 = v36;
      v39 = (_QWORD *)sub_235E18DC4();

    }
    else
    {
      v39 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    switch(v39[2])
    {
      case 0:
        swift_bridgeObjectRelease();
        v40 = (void *)sub_235E18D10();
        v41 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v40);

        if (!v41)
          goto LABEL_81;
        v42 = (void *)sub_235E18D10();
        v43 = (void *)sub_235E18D10();
        v44 = objc_msgSend(v41, sel_localizedStringForKey_value_table_, v42, v43, 0);

        sub_235E18D40();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
        v45 = swift_allocObject();
        *(_OWORD *)(v45 + 16) = xmmword_235E19610;
        v46 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v45 + 56) = MEMORY[0x24BEE0D00];
        v47 = sub_235DFFF18();
        *(_QWORD *)(v45 + 32) = v130;
        *(_QWORD *)(v45 + 40) = v4;
        *(_QWORD *)(v45 + 96) = v46;
        *(_QWORD *)(v45 + 104) = v47;
        *(_QWORD *)(v45 + 64) = v47;
        *(_QWORD *)(v45 + 72) = v11;
        *(_QWORD *)(v45 + 80) = v13;
        swift_bridgeObjectRetain();
        v26 = sub_235E18D1C();
        v28 = v48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_51;
      case 1:
        v69 = (void *)sub_235E18D10();
        v70 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v69);

        if (!v70)
          goto LABEL_83;
        v71 = (void *)sub_235E18D10();
        v72 = (void *)sub_235E18D10();
        v73 = objc_msgSend(v70, sel_localizedStringForKey_value_table_, v71, v72, 0);

        sub_235E18D40();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
        v74 = swift_allocObject();
        *(_OWORD *)(v74 + 16) = xmmword_235E19FC0;
        v75 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v74 + 56) = MEMORY[0x24BEE0D00];
        v76 = sub_235DFFF18();
        *(_QWORD *)(v74 + 32) = v130;
        *(_QWORD *)(v74 + 40) = v4;
        *(_QWORD *)(v74 + 96) = v75;
        *(_QWORD *)(v74 + 104) = v76;
        *(_QWORD *)(v74 + 64) = v76;
        *(_QWORD *)(v74 + 72) = v11;
        *(_QWORD *)(v74 + 80) = v13;
        *(_QWORD *)(v74 + 136) = v75;
        *(_QWORD *)(v74 + 144) = v76;
        if (!v39[2])
          goto LABEL_69;
        v77 = v39[4];
        v78 = v39[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v74 + 112) = v77;
        *(_QWORD *)(v74 + 120) = v78;
        goto LABEL_49;
      case 2:
        v79 = (void *)sub_235E18D10();
        v80 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v79);

        if (!v80)
          goto LABEL_84;
        v81 = (void *)sub_235E18D10();
        v82 = (void *)sub_235E18D10();
        v83 = objc_msgSend(v80, sel_localizedStringForKey_value_table_, v81, v82, 0);

        sub_235E18D40();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
        v84 = swift_allocObject();
        *(_OWORD *)(v84 + 16) = xmmword_235E19FB0;
        v85 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v84 + 56) = MEMORY[0x24BEE0D00];
        v86 = sub_235DFFF18();
        *(_QWORD *)(v84 + 32) = v130;
        *(_QWORD *)(v84 + 40) = v4;
        *(_QWORD *)(v84 + 96) = v85;
        *(_QWORD *)(v84 + 104) = v86;
        *(_QWORD *)(v84 + 64) = v86;
        *(_QWORD *)(v84 + 72) = v11;
        *(_QWORD *)(v84 + 80) = v13;
        *(_QWORD *)(v84 + 136) = v85;
        *(_QWORD *)(v84 + 144) = v86;
        v87 = v39[2];
        if (!v87)
          goto LABEL_70;
        v88 = v39[5];
        *(_QWORD *)(v84 + 112) = v39[4];
        *(_QWORD *)(v84 + 120) = v88;
        *(_QWORD *)(v84 + 176) = v85;
        *(_QWORD *)(v84 + 184) = v86;
        if (v87 == 1)
          goto LABEL_73;
        v89 = v39[6];
        v90 = v39[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v84 + 152) = v89;
        *(_QWORD *)(v84 + 160) = v90;
        goto LABEL_49;
      case 3:
        v91 = (void *)sub_235E18D10();
        v92 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v91);

        if (!v92)
          goto LABEL_85;
        v93 = (void *)sub_235E18D10();
        v94 = (void *)sub_235E18D10();
        v95 = objc_msgSend(v92, sel_localizedStringForKey_value_table_, v93, v94, 0);

        sub_235E18D40();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
        v96 = swift_allocObject();
        *(_OWORD *)(v96 + 16) = xmmword_235E19F20;
        v97 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v96 + 56) = MEMORY[0x24BEE0D00];
        v98 = sub_235DFFF18();
        *(_QWORD *)(v96 + 32) = v130;
        *(_QWORD *)(v96 + 40) = v4;
        *(_QWORD *)(v96 + 96) = v97;
        *(_QWORD *)(v96 + 104) = v98;
        *(_QWORD *)(v96 + 64) = v98;
        *(_QWORD *)(v96 + 72) = v11;
        *(_QWORD *)(v96 + 80) = v13;
        *(_QWORD *)(v96 + 136) = v97;
        *(_QWORD *)(v96 + 144) = v98;
        v99 = v39[2];
        if (!v99)
          goto LABEL_71;
        v100 = v39[5];
        *(_QWORD *)(v96 + 112) = v39[4];
        *(_QWORD *)(v96 + 120) = v100;
        *(_QWORD *)(v96 + 176) = v97;
        *(_QWORD *)(v96 + 184) = v98;
        if (v99 == 1)
          goto LABEL_74;
        v101 = v39[7];
        *(_QWORD *)(v96 + 152) = v39[6];
        *(_QWORD *)(v96 + 160) = v101;
        *(_QWORD *)(v96 + 216) = v97;
        *(_QWORD *)(v96 + 224) = v98;
        if (v99 < 3)
          goto LABEL_76;
        v102 = v39[8];
        v103 = v39[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v96 + 192) = v102;
        *(_QWORD *)(v96 + 200) = v103;
LABEL_49:
        v26 = sub_235E18D1C();
        v28 = v104;
        swift_bridgeObjectRelease();
        goto LABEL_50;
      default:
        v129 = v37;
        v55 = (void *)sub_235E18D10();
        v56 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v55);

        if (!v56)
          goto LABEL_82;
        v57 = (void *)sub_235E18D10();
        v58 = (void *)sub_235E18D10();
        v59 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, v58, 0);

        sub_235E18D40();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
        v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = xmmword_235E19FD0;
        v61 = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v60 + 56) = MEMORY[0x24BEE0D00];
        v62 = sub_235DFFF18();
        *(_QWORD *)(v60 + 32) = v130;
        *(_QWORD *)(v60 + 40) = v4;
        *(_QWORD *)(v60 + 96) = v61;
        *(_QWORD *)(v60 + 104) = v62;
        *(_QWORD *)(v60 + 64) = v62;
        *(_QWORD *)(v60 + 72) = v11;
        *(_QWORD *)(v60 + 80) = v13;
        *(_QWORD *)(v60 + 136) = v61;
        *(_QWORD *)(v60 + 144) = v62;
        v63 = v39[2];
        if (v63)
        {
          v64 = v39[5];
          *(_QWORD *)(v60 + 112) = v39[4];
          *(_QWORD *)(v60 + 120) = v64;
          *(_QWORD *)(v60 + 176) = v61;
          *(_QWORD *)(v60 + 184) = v62;
          if (v63 != 1)
          {
            v65 = v39[7];
            *(_QWORD *)(v60 + 152) = v39[6];
            *(_QWORD *)(v60 + 160) = v65;
            *(_QWORD *)(v60 + 216) = v61;
            *(_QWORD *)(v60 + 224) = v62;
            if (v63 >= 3)
            {
              v66 = v39[9];
              *(_QWORD *)(v60 + 192) = v39[8];
              *(_QWORD *)(v60 + 200) = v66;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v129);
              *(_QWORD *)(v60 + 256) = sub_235DF2A90(0, &qword_256381D50);
              *(_QWORD *)(v60 + 264) = sub_235DFFF5C();
              *(_QWORD *)(v60 + 232) = v67;
              v26 = sub_235E18D1C();
              v28 = v68;
              swift_bridgeObjectRelease();
LABEL_50:
              swift_bridgeObjectRelease();

              goto LABEL_51;
            }
            goto LABEL_75;
          }
        }
        else
        {
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
        }
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
    }
  }
  if (!sub_235DF832C((id)4, a1) && !sub_235DF832C((id)5, a1) && !sub_235DF832C((id)6, a1))
  {
    if (sub_235DF832C((id)3, a1) && sub_235DF832C((id)2, a1))
    {
      sub_235DFD2B4(0xD000000000000025, 0x8000000235E1F090, v11, v13, v130, v4);
      v26 = v49;
      v28 = v50;
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    if (!sub_235DF832C((id)3, a1))
    {
      swift_bridgeObjectRelease();
      v26 = 0;
      v28 = 0xE000000000000000;
      goto LABEL_51;
    }
    v128 = v3 + 32;
    swift_beginAccess();
    v51 = sub_235E18D40();
    v53 = v52;
    if (v51 == sub_235E18D40() && v53 == v54)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v113 = sub_235E19028();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v113 & 1) == 0)
      {
        v116 = sub_235E18D40();
        v118 = v117;
        if (v116 == sub_235E18D40() && v118 == v119)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v120 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v120 & 1) == 0)
          {
            sub_235DFD2B4(0xD00000000000001CLL, 0x8000000235E1EEB0, v11, v13, v130, v4);
            v26 = v126;
            v28 = v127;
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
        }
        swift_bridgeObjectRelease();
        v121 = (void *)sub_235E18D10();
        v115 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v121, v128);

        if (!v115)
        {
LABEL_87:
          __break(1u);
          JUMPOUT(0x235DFFF08);
        }
LABEL_66:
        v122 = (void *)sub_235E18D10();
        v123 = (void *)sub_235E18D10();
        v124 = objc_msgSend(v115, sel_localizedStringForKey_value_table_, v122, v123, 0);

        v26 = sub_235E18D40();
        v28 = v125;

        goto LABEL_51;
      }
    }
    swift_bridgeObjectRelease();
    v114 = (void *)sub_235E18D10();
    v115 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v114, v128);

    if (!v115)
    {
LABEL_86:
      __break(1u);
      goto LABEL_87;
    }
    goto LABEL_66;
  }
  swift_bridgeObjectRelease();
  v20 = (void *)sub_235E18D10();
  v21 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v20);

  if (!v21)
    goto LABEL_80;
  v22 = (void *)sub_235E18D10();
  v23 = (void *)sub_235E18D10();
  v24 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, 0);

  sub_235E18D40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_235E19620;
  *(_QWORD *)(v25 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v25 + 64) = sub_235DFFF18();
  *(_QWORD *)(v25 + 32) = v130;
  *(_QWORD *)(v25 + 40) = v4;
  swift_bridgeObjectRetain();
  v26 = sub_235E18D1C();
  v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_51:
  v105 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0)
    v105 = v26 & 0xFFFFFFFFFFFFLL;
  if (!v105)
  {
    swift_bridgeObjectRelease();
    v106 = (void *)sub_235E18D10();
    v107 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v106);

    if (v107)
    {
      v108 = (void *)sub_235E18D10();
      v109 = (void *)sub_235E18D10();
      v110 = objc_msgSend(v107, sel_localizedStringForKey_value_table_, v108, v109, 0);

      sub_235E18D40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
      v111 = swift_allocObject();
      *(_OWORD *)(v111 + 16) = xmmword_235E19620;
      *(_QWORD *)(v111 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v111 + 64) = sub_235DFFF18();
      *(_QWORD *)(v111 + 32) = v130;
      *(_QWORD *)(v111 + 40) = v4;
      v26 = sub_235E18D1C();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
    goto LABEL_79;
  }
LABEL_56:
  swift_bridgeObjectRelease();
  return v26;
}

unint64_t sub_235DFFF18()
{
  unint64_t result;

  result = qword_256381EA0;
  if (!qword_256381EA0)
  {
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256381EA0);
  }
  return result;
}

unint64_t sub_235DFFF5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256381EA8;
  if (!qword_256381EA8)
  {
    v1 = sub_235DF2A90(255, &qword_256381D50);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_256381EA8);
  }
  return result;
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_235DFFFC0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

uint64_t sub_235DFFFF0()
{
  return objectdestroyTm();
}

uint64_t sub_235DFFFF8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235DF9E5C(a1, (_OWORD *)(v2 + 16), a2);
}

void sub_235E00008()
{
  uint64_t v0;

  sub_235DFA38C(*(void **)(v0 + 208));
}

uint64_t objectdestroy_20Tm()
{
  id *v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235E000D0()
{
  return objectdestroyTm();
}

uint64_t sub_235E000D8(int a1, void *a2)
{
  uint64_t v2;

  return sub_235DFCDAC(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_2507351C0, (uint64_t)sub_235DFECD8, (uint64_t)&block_descriptor_36);
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

uint64_t sub_235E00120()
{
  return objectdestroyTm();
}

uint64_t sub_235E00130(uint64_t a1)
{
  swift_release();
  return a1;
}

void sub_235E0015C(unsigned __int8 *a1@<X8>)
{
  uint64_t v1;

  sub_235DF8CE8(v1 + 32, a1);
}

uint64_t objectdestroy_44Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E00208(char *a1)
{
  char v1;
  _OWORD v3[2];

  v1 = *a1;
  memset(v3, 0, sizeof(v3));
  sub_235DFB210(v1, (uint64_t)v3);
  return sub_235DF0DA4((uint64_t)v3, &qword_25429C2E0);
}

uint64_t sub_235E00250@<X0>(uint64_t *a1@<X8>)
{
  return sub_235DF9C9C(a1);
}

uint64_t sub_235E00268()
{
  return swift_deallocObject();
}

_BYTE *sub_235E00278(_BYTE *a1)
{
  uint64_t v1;

  return sub_235E117AC(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_235E00280()
{
  return swift_deallocObject();
}

uint64_t sub_235E00290(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235E002D4()
{
  return objectdestroyTm();
}

uint64_t sub_235E002DC(char a1)
{
  uint64_t v1;

  return sub_235DFC078(a1, (__int128 *)(v1 + 16), *(_BYTE *)(v1 + 208), (uint64_t)&unk_2507353A0, (uint64_t)sub_235DFECD8, (uint64_t)&block_descriptor_89);
}

uint64_t sub_235E00310()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_235E0034C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_235DEBD84(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(id, void (*)(_QWORD), uint64_t))(v2 + 32), *(_QWORD *)(v2 + 40), *(void (**)(BOOL))(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_235E0035C()
{
  return objectdestroyTm();
}

uint64_t sub_235E00364(char a1)
{
  uint64_t v1;

  return sub_235DFC078(a1, (__int128 *)(v1 + 16), *(_BYTE *)(v1 + 208), (uint64_t)&unk_250735350, (uint64_t)sub_235DFECD8, (uint64_t)&block_descriptor_83);
}

uint64_t sub_235E00398(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235E003A8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_235E003B8(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_235E003E0()
{
  return objectdestroyTm();
}

uint64_t sub_235E003E8()
{
  return objectdestroyTm();
}

uint64_t sub_235E003F0()
{
  id *v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_235E0048C()
{
  uint64_t v0;

  sub_235DFC330(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), v0 + 32);
}

uint64_t sub_235E0049C()
{
  return objectdestroyTm();
}

uint64_t sub_235E004A4(int a1, void *a2)
{
  uint64_t v2;

  return sub_235DFCDAC(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_250735530, (uint64_t)sub_235DFECD8, (uint64_t)&block_descriptor_119);
}

uint64_t sub_235E004D4()
{
  return objectdestroyTm();
}

uint64_t sub_235E004DC(int a1, void *a2)
{
  uint64_t v2;

  return sub_235DFCDAC(a1, a2, (_OWORD *)(v2 + 16), (uint64_t)&unk_2507354E0, (uint64_t)sub_235DFECD8, (uint64_t)&block_descriptor_113);
}

uint64_t sub_235E0050C()
{
  return objectdestroyTm();
}

uint64_t sub_235E00514()
{
  return objectdestroyTm();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E005BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
  return sub_235E18B90();
}

uint64_t sub_235E0060C()
{
  return sub_235E009C4(&qword_256381F08, &qword_256381F10, MEMORY[0x24BDF41A8]);
}

void destroy for CustomDataclassTable(id *a1)
{

}

uint64_t initializeWithCopy for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  return a1;
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

uint64_t assignWithTake for CustomDataclassTable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for CustomDataclassTable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomDataclassTable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomDataclassTable()
{
  return &type metadata for CustomDataclassTable;
}

_QWORD *initializeBufferWithCopyOfBuffer for DataclassTable(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DataclassTable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for DataclassTable(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for DataclassTable(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DataclassTable(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataclassTable()
{
  return &type metadata for DataclassTable;
}

uint64_t sub_235E00960()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E00970()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_235E00980()
{
  unint64_t result;

  result = qword_256381F30;
  if (!qword_256381F30)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for DataclassRow, &type metadata for DataclassRow);
    atomic_store(result, (unint64_t *)&qword_256381F30);
  }
  return result;
}

uint64_t sub_235E009C4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E291C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235E00A10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256381F50;
  if (!qword_256381F50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381F58);
    v2[0] = sub_235DFE174(&qword_256381F28, &qword_256381F20, (uint64_t (*)(void))sub_235E00980, MEMORY[0x24BDF4A08]);
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256381F50);
  }
  return result;
}

uint64_t sub_235E00A9C()
{
  return sub_235DFE174(&qword_256381F28, &qword_256381F20, (uint64_t (*)(void))sub_235E00980, MEMORY[0x24BDF4A08]);
}

uint64_t AccountSettingsRootView.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountsUIModel(0);
  sub_235E00B6C();
  result = sub_235E188A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_235E00B6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256381CA8;
  if (!qword_256381CA8)
  {
    v1 = type metadata accessor for AccountsUIModel(255);
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountsUIModel, v1);
    atomic_store(result, (unint64_t *)&qword_256381CA8);
  }
  return result;
}

uint64_t AccountSettingsRootView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_235E18944();
  result = sub_235E18A34();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_235E00C1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E00C2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_235E18944();
  result = sub_235E18A34();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

ValueMetadata *type metadata accessor for AccountSettingsRootView()
{
  return &type metadata for AccountSettingsRootView;
}

uint64_t sub_235E00CA4()
{
  return MEMORY[0x24BDF1F80];
}

BOOL static AccountsTypes.IconType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AccountsTypes.IconType.hash(into:)()
{
  return sub_235E19064();
}

uint64_t AccountsTypes.IconType.hashValue.getter()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

BOOL sub_235E00D34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_235E00D50()
{
  unint64_t result;

  result = qword_256381F60;
  if (!qword_256381F60)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountsTypes.IconType, &type metadata for AccountsTypes.IconType);
    atomic_store(result, (unint64_t *)&qword_256381F60);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountsTypes()
{
  return &type metadata for AccountsTypes;
}

uint64_t getEnumTagSinglePayload for AccountsTypes.IconType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountsTypes.IconType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E00E80 + 4 * byte_235E1A445[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235E00EB4 + 4 * asc_235E1A440[v4]))();
}

uint64_t sub_235E00EB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E00EBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E00EC4);
  return result;
}

uint64_t sub_235E00ED0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E00ED8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235E00EDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E00EE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_235E00EF0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AccountsTypes.IconType()
{
  return &type metadata for AccountsTypes.IconType;
}

unint64_t sub_235E00F0C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381CE8);
  v2 = sub_235E18FEC();
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
    sub_235E00290(v6, (uint64_t)&v15, &qword_2563821F0);
    v7 = v15;
    v8 = v16;
    result = sub_235DECF6C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_235DF0DE0(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_235E0104C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C0);
  v2 = (_QWORD *)sub_235E18FEC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_235DECF6C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_235E01164(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563821E8);
  v2 = (_QWORD *)sub_235E18FEC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_235DED000((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
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

uint64_t AccountAddView.init(_:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;

  v3 = *a1;
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  v4 = sub_235E188A8();
  v6 = v5;
  sub_235E18740();
  sub_235DF1B80(&qword_256381F68, (uint64_t (*)(uint64_t))MEMORY[0x24BE00E68], MEMORY[0x24BE00E60]);
  v7 = sub_235E188A8();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235E19620;
  *(_BYTE *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2C8);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_235E19FD0;
  *(_QWORD *)(v11 + 32) = sub_235E18D40();
  *(_QWORD *)(v11 + 40) = v12;
  *(_QWORD *)(v11 + 48) = sub_235E18D40();
  *(_QWORD *)(v11 + 56) = v13;
  *(_QWORD *)(v11 + 64) = sub_235E18D40();
  *(_QWORD *)(v11 + 72) = v14;
  *(_QWORD *)(v11 + 80) = sub_235E18D40();
  *(_QWORD *)(v11 + 88) = v15;
  *(_QWORD *)(v11 + 96) = sub_235E18D40();
  *(_QWORD *)(v11 + 104) = v16;
  *(_QWORD *)(v11 + 112) = sub_235E18D40();
  *(_QWORD *)(v11 + 120) = v17;
  *(_QWORD *)(inited + 40) = v11;
  v18 = sub_235E05C10(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F78);
  swift_arrayDestroy();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_235E19FC0;
  *(_QWORD *)(v19 + 32) = sub_235E18D40();
  *(_QWORD *)(v19 + 40) = v20;
  *(_QWORD *)(v19 + 48) = sub_235E18D40();
  *(_QWORD *)(v19 + 56) = v21;
  *(_QWORD *)(v19 + 64) = sub_235E18D40();
  *(_QWORD *)(v19 + 72) = v22;
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_235E19FB0;
  *(_QWORD *)(v23 + 32) = sub_235E18D40();
  *(_QWORD *)(v23 + 40) = v24;
  *(_QWORD *)(v23 + 48) = sub_235E18D40();
  *(_QWORD *)(v23 + 56) = v25;
  *(_QWORD *)(v23 + 64) = sub_235E18D40();
  *(_QWORD *)(v23 + 72) = v26;
  result = sub_235E18D40();
  *(_QWORD *)(v23 + 80) = result;
  *(_QWORD *)(v23 + 88) = v28;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 24) = v9;
  *(_BYTE *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = v18;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v23;
  return result;
}

BOOL static AccountAddView.AddType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountAddView.AddType.hash(into:)()
{
  return sub_235E19064();
}

uint64_t AccountAddView.AddType.hashValue.getter()
{
  sub_235E19058();
  sub_235E19064();
  return sub_235E19070();
}

void AccountAddView.body.getter(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
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
  _OWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _OWORD v38[5];

  v32 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381F80);
  v28 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381F88);
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381F90);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v1[1];
  v38[0] = *v1;
  v38[1] = v11;
  v12 = v1[3];
  v38[2] = v1[2];
  v38[3] = v12;
  v33 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F98);
  sub_235E009C4(&qword_256381FA0, &qword_256381F98, MEMORY[0x24BDF5428]);
  sub_235E18A10();
  v13 = (void *)sub_235E18D10();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v13);

  if (v14)
  {
    v15 = (void *)sub_235E18D10();
    v16 = (void *)sub_235E18D10();
    v17 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, v16, 0);

    v18 = sub_235E18D40();
    v20 = v19;

    v34 = v18;
    v35 = v20;
    v21 = sub_235E009C4(&qword_256381FA8, &qword_256381F80, MEMORY[0x24BDF1988]);
    v22 = sub_235DF807C();
    v23 = MEMORY[0x24BEE0D00];
    sub_235E18A88();
    swift_bridgeObjectRelease();
    v24 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v4, v2);
    MEMORY[0x24BDAC7A8](v24);
    *(&v27 - 2) = (uint64_t)v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381FB0);
    v34 = v2;
    v35 = v23;
    v36 = v21;
    v37 = v22;
    swift_getOpaqueTypeConformance2();
    v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381FB8);
    v26 = sub_235E009C4(&qword_256381FC0, &qword_256381FB8, MEMORY[0x24BDEB848]);
    v34 = v25;
    v35 = v26;
    swift_getOpaqueTypeConformance2();
    sub_235E18AE8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v5);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v32, v10, v30);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E0192C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t result;
  uint64_t v46;
  id v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382110);
  v52 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v46 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382118);
  v53 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v46 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382120);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v46 - v19;
  if (*(_BYTE *)(a1 + 32))
  {
    v21 = 1;
LABEL_9:
    v22 = (void **)a1;
    v25 = v9;
LABEL_10:
    v28 = v53;
    goto LABEL_11;
  }
  v48 = v14;
  v49 = v12;
  v50 = a2;
  sub_235E18740();
  if ((sub_235E18710() & 1) == 0)
  {
    v21 = 1;
    a2 = v50;
    goto LABEL_9;
  }
  v22 = (void **)a1;
  if (*(_QWORD *)(a1 + 16))
  {
    swift_retain();
    v23 = sub_235E186F8();
    swift_release();
    v24 = *(_QWORD *)(v23 + 16);
    swift_bridgeObjectRelease();
    v25 = v9;
    if (!v24)
    {
      v21 = 1;
      a2 = v50;
      goto LABEL_10;
    }
    v26 = (void *)sub_235E18D10();
    v27 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v26);

    v28 = v53;
    if (v27)
    {
      v29 = (void *)sub_235E18D10();
      v47 = v29;
      v30 = (void *)sub_235E18D10();
      v31 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v29, v30, 0);

      v32 = sub_235E18D40();
      v34 = v33;

      v46 = (uint64_t)&v46;
      v54 = v32;
      v55 = v34;
      MEMORY[0x24BDAC7A8](v35);
      *(&v46 - 2) = (uint64_t)v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256382140);
      v47 = (id)sub_235E072D0();
      sub_235DF807C();
      v36 = v49;
      sub_235E18C44();
      v37 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v38 = v48;
      v37(v48, v36, v25);
      v37(v20, v38, v25);
      v21 = 0;
      a2 = v50;
LABEL_11:
      v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v20, v21, 1, v25);
      MEMORY[0x24BDAC7A8](v39);
      *(&v46 - 2) = (uint64_t)v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256382128);
      sub_235E009C4(&qword_256382130, &qword_256382128, MEMORY[0x24BDF5428]);
      sub_235E18C5C();
      sub_235E00290((uint64_t)v20, (uint64_t)v18, &qword_256382120);
      v40 = v51;
      v41 = v52;
      v42 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
      v42(v51, v8, v4);
      sub_235E00290((uint64_t)v18, a2, &qword_256382120);
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382138);
      v42((char *)(a2 + *(int *)(v43 + 48)), v40, v4);
      v44 = *(void (**)(char *, uint64_t))(v41 + 8);
      v44(v8, v4);
      sub_235DF0DA4((uint64_t)v20, &qword_256382120);
      v44(v40, v4);
      return sub_235DF0DA4((uint64_t)v18, &qword_256382120);
    }
    __break(1u);
  }
  sub_235E07248(v22);
  sub_235DF1B80(&qword_256381F68, (uint64_t (*)(uint64_t))MEMORY[0x24BE00E68], MEMORY[0x24BE00E60]);
  result = sub_235E18890();
  __break(1u);
  return result;
}

uint64_t sub_235E01E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382140);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    swift_retain();
    v6 = sub_235E186F8();
    swift_release();
    v23 = v6;
    v15[1] = swift_getKeyPath();
    v7 = (_OWORD *)swift_allocObject();
    v8 = *(_OWORD *)(a1 + 16);
    v7[1] = *(_OWORD *)a1;
    v7[2] = v8;
    v9 = *(_OWORD *)(a1 + 48);
    v7[3] = *(_OWORD *)(a1 + 32);
    v7[4] = v9;
    sub_235E07248((void **)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382158);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382160);
    sub_235E009C4(&qword_256382168, &qword_256382158, MEMORY[0x24BEE12D8]);
    sub_235DF1B80(&qword_256382170, (uint64_t (*)(uint64_t))MEMORY[0x24BE00E18], MEMORY[0x24BE00E28]);
    v10 = type metadata accessor for ShowAddButton();
    v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E28);
    v12 = sub_235DF1B80(&qword_256382150, (uint64_t (*)(uint64_t))type metadata accessor for ShowAddButton, (uint64_t)&unk_235E1A668);
    v13 = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    swift_getOpaqueTypeConformance2();
    sub_235E18C2C();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v18, v5, v17);
  }
  else
  {
    sub_235E07248((void **)a1);
    sub_235E18740();
    sub_235DF1B80(&qword_256381F68, (uint64_t (*)(uint64_t))MEMORY[0x24BE00E68], MEMORY[0x24BE00E60]);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E02060(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;

  v4 = sub_235E186EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for ShowAddButton();
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_235E021C0((uint64_t)v7, (uint64_t)v10);
  v13 = a2;
  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  sub_235DF1B80(&qword_256382150, (uint64_t (*)(uint64_t))type metadata accessor for ShowAddButton, (uint64_t)&unk_235E1A668);
  sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
  sub_235E18A70();
  return sub_235E071BC((uint64_t)v10);
}

uint64_t sub_235E021C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  uint64_t v12;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  *(_QWORD *)a2 = sub_235E188A8();
  *(_QWORD *)(a2 + 8) = v4;
  sub_235E18B78();
  *(_OWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 32) = v12;
  sub_235E18B78();
  *(_OWORD *)(a2 + 40) = v11;
  *(_QWORD *)(a2 + 56) = v12;
  sub_235E18B78();
  *(_OWORD *)(a2 + 64) = v11;
  *(_QWORD *)(a2 + 80) = v12;
  sub_235E18B78();
  *(_BYTE *)(a2 + 88) = v11;
  *(_QWORD *)(a2 + 96) = *((_QWORD *)&v11 + 1);
  v5 = type metadata accessor for ShowAddButton();
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = 0;
  v6 = a2 + *(int *)(v5 + 40);
  v7 = sub_235E186EC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 1, 1, v7);
  *(_BYTE *)(a2 + *(int *)(v5 + 44)) = 0;
  sub_235DF0DA4(v6, &qword_256381FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, a1, v7);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v9)(v6, 0, 1, v7);
}

uint64_t sub_235E02358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v16;

  v4 = sub_235E186EC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E187DC();
  v10 = sub_235E187F4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = (char *)swift_allocObject();
  v13 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v12 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v12 + 2) = v13;
  v14 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v12 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v12 + 4) = v14;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_235E07248((void **)a1);
  return sub_235E18BA8();
}

uint64_t sub_235E024D4(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 16))
  {
    swift_retain();
    sub_235E18728();
    return swift_release();
  }
  else
  {
    sub_235E07248((void **)a1);
    sub_235E18740();
    sub_235DF1B80(&qword_256381F68, (uint64_t (*)(uint64_t))MEMORY[0x24BE00E68], MEMORY[0x24BE00E60]);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

void sub_235E02558(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = (void *)sub_235E18D10();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    v4 = (void *)sub_235E18D10();
    v5 = (void *)sub_235E18D10();
    v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_235E18D40();
    sub_235DF807C();
    *(_QWORD *)a1 = sub_235E18A40();
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = v8 & 1;
    *(_QWORD *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E02698@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t result;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382178);
  MEMORY[0x24BDAC7A8](v63);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_235E189BC();
  v58 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v57 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382180);
  v56 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v55 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382188);
  v60 = *(_QWORD *)(v65 - 8);
  v8 = MEMORY[0x24BDAC7A8](v65);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v55 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382190);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v55 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382198);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v61 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v55 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v69 = a2;
  v70 = (char *)&v55 - v25;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v67 = v5;
  v68 = v15;
  v66 = v17;
  v71 = v19;
  if (v26 && (sub_235DED080(*(_BYTE *)(a1 + 32)), (v27 & 1) != 0))
    v28 = swift_bridgeObjectRetain();
  else
    v28 = MEMORY[0x24BEE4AF8];
  v72 = v28;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C260);
  type metadata accessor for ShowAddButton();
  sub_235E009C4(&qword_2563821A0, (uint64_t *)&unk_25429C260, MEMORY[0x24BEE12D8]);
  sub_235DF1B80(&qword_256382150, (uint64_t (*)(uint64_t))type metadata accessor for ShowAddButton, (uint64_t)&unk_235E1A668);
  sub_235E18C2C();
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v24, v18);
  v29 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v30 = v29;
    sub_235E187B8();

    swift_release();
    swift_release();
    if ((v72 & 1) != 0)
    {
      v72 = *(_QWORD *)(a1 + 56);
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      v31 = v61;
      sub_235E18C2C();
      v32 = v71;
      v33 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
      v33(v67, v31, v18);
      swift_storeEnumTagMultiPayload();
      v34 = sub_235E009C4(&qword_2563821C8, &qword_256382180, MEMORY[0x24BDF43B0]);
      v35 = sub_235DF1B80(&qword_2563820F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
      v72 = v62;
      v73 = v64;
      v74 = v34;
      v75 = v35;
      swift_getOpaqueTypeConformance2();
      sub_235E07560();
      v36 = (uint64_t)v66;
      sub_235E18980();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v18);
      v37 = (uint64_t)v68;
    }
    else
    {
      v38 = (_OWORD *)swift_allocObject();
      v39 = *(_OWORD *)(a1 + 16);
      v38[1] = *(_OWORD *)a1;
      v38[2] = v39;
      v40 = *(_OWORD *)(a1 + 48);
      v38[3] = *(_OWORD *)(a1 + 32);
      v38[4] = v40;
      sub_235E07248((void **)a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563821A8);
      sub_235E074E0(&qword_2563821B0, &qword_2563821A8, &qword_2563821B8, &qword_2563821C0);
      v41 = v55;
      sub_235E18BB4();
      v42 = v57;
      sub_235E189B0();
      v43 = sub_235E009C4(&qword_2563821C8, &qword_256382180, MEMORY[0x24BDF43B0]);
      v44 = sub_235DF1B80(&qword_2563820F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
      v45 = v62;
      v46 = v64;
      sub_235E18A64();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v46);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v41, v45);
      v48 = v59;
      v47 = v60;
      v49 = v65;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v59, v10, v65);
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v67, v48, v49);
      swift_storeEnumTagMultiPayload();
      v72 = v45;
      v73 = v46;
      v74 = v43;
      v75 = v44;
      swift_getOpaqueTypeConformance2();
      sub_235E07560();
      v36 = (uint64_t)v66;
      sub_235E18980();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
      v32 = v71;
      v33 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
      v37 = (uint64_t)v68;
      v31 = v61;
    }
    v50 = v70;
    v33(v31, v70, v18);
    sub_235E00290(v36, v37, &qword_256382190);
    v51 = v69;
    v33(v69, v31, v18);
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563821D8);
    sub_235E00290(v37, (uint64_t)&v51[*(int *)(v52 + 48)], &qword_256382190);
    sub_235DF0DA4(v36, &qword_256382190);
    v53 = *(void (**)(char *, uint64_t))(v32 + 8);
    v53(v50, v18);
    sub_235DF0DA4(v37, &qword_256382190);
    return ((uint64_t (*)(char *, uint64_t))v53)(v31, v18);
  }
  else
  {
    sub_235E07248((void **)a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E02E00@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E03930(a1, 0, a2);
}

uint64_t sub_235E02E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  *(_QWORD *)a4 = sub_235E188A8();
  *(_QWORD *)(a4 + 8) = v8;
  sub_235E18B78();
  *(_OWORD *)(a4 + 16) = v14;
  *(_QWORD *)(a4 + 32) = v15;
  sub_235E18B78();
  *(_OWORD *)(a4 + 40) = v14;
  *(_QWORD *)(a4 + 56) = v15;
  sub_235E18B78();
  *(_OWORD *)(a4 + 64) = v14;
  *(_QWORD *)(a4 + 80) = v15;
  sub_235E18B78();
  *(_BYTE *)(a4 + 88) = v14;
  *(_QWORD *)(a4 + 96) = *((_QWORD *)&v14 + 1);
  v9 = type metadata accessor for ShowAddButton();
  v10 = a4 + *(int *)(v9 + 40);
  v11 = sub_235E186EC();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v13 = *(int *)(v9 + 44);
  *(_QWORD *)(a4 + 104) = a1;
  *(_QWORD *)(a4 + 112) = a2;
  *(_BYTE *)(a4 + v13) = a3;
  return result;
}

uint64_t sub_235E02F64()
{
  sub_235E18C80();
  sub_235E18848();
  return swift_release();
}

uint64_t sub_235E02FC0(void **a1)
{
  void *v1;
  id v2;
  uint64_t result;

  v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    return sub_235E187C4();
  }
  else
  {
    sub_235E07248(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

__n128 sub_235E03080@<Q0>(uint64_t a1@<X8>)
{
  __n128 v2;
  char v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;
  __n128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  sub_235E188FC();
  sub_235E031B4((uint64_t)&v12);
  v2 = v13;
  v3 = v14;
  sub_235E18C74();
  sub_235E033F8(0.0, 1, 0.0, 1, 0.0, 1, 54.0, 0, (uint64_t)&v12, 0.0, 1, 54.0, 0);
  sub_235DF1C74(v2.n128_i64[0], v2.n128_i64[1], v3);
  swift_bridgeObjectRelease();
  v4 = v21;
  v5 = v23;
  *(_OWORD *)(a1 + 160) = v22;
  *(_OWORD *)(a1 + 176) = v5;
  v6 = v17;
  v7 = v19;
  v8 = v20;
  *(_OWORD *)(a1 + 96) = v18;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v4;
  v9 = v15;
  v10 = v16;
  *(_OWORD *)(a1 + 32) = v14;
  *(_OWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 192) = v24;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v6;
  result = v13;
  *(_OWORD *)a1 = v12;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void sub_235E031B4(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  v2 = (void *)sub_235E18D10();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    v4 = (void *)sub_235E18D10();
    v5 = (void *)sub_235E18D10();
    v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_235E18D40();
    sub_235DF807C();
    v7 = sub_235E18A40();
    v9 = v8;
    LOBYTE(v6) = v10 & 1;
    sub_235E18B30();
    v11 = sub_235E18A1C();
    v13 = v12;
    v15 = v14;
    swift_release();
    v16 = v15 & 1;
    sub_235DF1C74(v7, v9, (char)v6);
    swift_bridgeObjectRelease();
    sub_235E189F8();
    v17 = sub_235E18A28();
    v19 = v18;
    LOBYTE(v6) = v20;
    v22 = v21;
    swift_release();
    sub_235DF1C74(v11, v13, v16);
    swift_bridgeObjectRelease();
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 8) = 1;
    *(_QWORD *)(a1 + 16) = v17;
    *(_QWORD *)(a1 + 24) = v19;
    *(_BYTE *)(a1 + 32) = v6 & 1;
    *(_QWORD *)(a1 + 40) = v22;
    *(_QWORD *)(a1 + 48) = 0;
    *(_BYTE *)(a1 + 56) = 1;
    sub_235DFEC48(v17, v19, v6 & 1);
    swift_bridgeObjectRetain();
    sub_235DF1C74(v17, v19, v6 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E033F8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_235E18E54();
    v23 = (void *)sub_235E189E0();
    sub_235E1874C();

  }
  sub_235E18878();
  v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 152) = v31;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 88) = v27;
  *(_OWORD *)(a9 + 104) = v28;
  *(_BYTE *)(a9 + 80) = *(_BYTE *)(v13 + 80);
  *(_OWORD *)(a9 + 120) = v29;
  return sub_235E075DC(v13);
}

uint64_t sub_235E035B8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20;
  uint64_t v21;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v20 = a16;
  v21 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_235E18E54();
    v30 = (void *)sub_235E189E0();
    sub_235E1874C();

    v20 = a16;
    v21 = a17;
  }
  sub_235E18878();
  *(_QWORD *)a9 = v20;
  *(_QWORD *)(a9 + 8) = v21;
  *(_QWORD *)(a9 + 16) = a18;
  *(_QWORD *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E03780@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_235E18E54();
    v25 = (void *)sub_235E189E0();
    sub_235E1874C();

  }
  sub_235E18878();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(_QWORD *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;
  return swift_retain();
}

uint64_t sub_235E03928@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E03930(a1, 1, a2);
}

uint64_t sub_235E03930@<X0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a1;
  v6 = a1[1];
  swift_bridgeObjectRetain();
  return sub_235E02E08(v5, v6, a2, a3);
}

uint64_t sub_235E03974(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = sub_235E189A4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FB8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_235E1898C();
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
  sub_235E1883C();
  v7 = sub_235E009C4(&qword_256381FC0, &qword_256381FB8, MEMORY[0x24BDEB848]);
  MEMORY[0x23B7E1EF0](v6, v3, v7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_235E03ABC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)sub_235E18D10();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v11);

  if (v12)
  {
    v13 = (void *)sub_235E18D10();
    v14 = (void *)sub_235E18D10();
    v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, v14, 0);

    v16 = sub_235E18D40();
    v18 = v17;

    v23[0] = v16;
    v23[1] = v18;
    sub_235E187E8();
    v19 = sub_235E187F4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 0, 1, v19);
    v20 = (_OWORD *)swift_allocObject();
    v21 = *(_OWORD *)(a1 + 16);
    v20[1] = *(_OWORD *)a1;
    v20[2] = v21;
    v22 = *(_OWORD *)(a1 + 48);
    v20[3] = *(_OWORD *)(a1 + 32);
    v20[4] = v22;
    sub_235E07248((void **)a1);
    sub_235DF807C();
    sub_235E18BC0();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E03CE4(void **a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t result;
  char v5;

  v1 = *a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    sub_235E187C4();
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = v2;
    sub_235E187C4();
    swift_getKeyPath();
    swift_getKeyPath();
    v3;
    sub_235E187B8();
    swift_release();
    swift_release();
    if ((v5 & 1) == 0)
    {
      sub_235DE9040();
      sub_235E18704();
      swift_release();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_235E187C4();
  }
  else
  {
    sub_235E07248(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E03E80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v25 = a1;
  v2 = sub_235E189BC();
  v22 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ShowAddButton();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382088);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382090);
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E06DB4(v1, (uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = swift_allocObject();
  sub_235E06DFC((uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  v28 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382098);
  sub_235E06E54();
  sub_235E18BB4();
  sub_235E189B0();
  v16 = sub_235E009C4(&qword_2563820E8, &qword_256382088, MEMORY[0x24BDF43B0]);
  v17 = sub_235DF1B80(&qword_2563820F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
  sub_235E18A64();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = *(_QWORD *)(v1 + 32);
  v29 = *(_OWORD *)(v1 + 16);
  v30 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  v19 = *(_QWORD *)(v1 + 96);
  v32 = *(_BYTE *)(v1 + 88);
  v33 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
  sub_235E18B9C();
  v27 = v1;
  v26 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E48);
  *(_QWORD *)&v29 = v8;
  *((_QWORD *)&v29 + 1) = v2;
  v30 = v16;
  v31 = v17;
  swift_getOpaqueTypeConformance2();
  sub_235DF807C();
  sub_235E009C4(&qword_256381E50, &qword_256381E48, MEMORY[0x24BDF5428]);
  v20 = v23;
  sub_235E18AC4();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v20);
}

void sub_235E04220(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;

  v2 = type metadata accessor for ShowAddButton();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v65 - v9;
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 112);
  v13 = sub_235E18D40();
  if (v12)
  {
    if (v11 == v13 && v12 == v14)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = sub_235E19028();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_235E06DB4(a1, (uint64_t)v4);
        sub_235E071BC((uint64_t)v4);
        return;
      }
    }
    sub_235E00290(a1 + *(int *)(v2 + 40), (uint64_t)v10, &qword_256381FD0);
    v19 = sub_235E186EC();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
    {
      sub_235DF0DA4((uint64_t)v10, &qword_256381FD0);
      v21 = (void *)sub_235E18D10();
      v22 = (void *)objc_opt_self();
      v23 = objc_msgSend(v22, sel_bundleWithIdentifier_, v21);

      if (!v23)
      {
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      v24 = (void *)sub_235E18D10();
      v25 = (void *)sub_235E18D10();
      v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, v25, 0);

      v27 = sub_235E18D40();
      v29 = v28;

      v30 = *(_QWORD *)(a1 + 32);
      v70 = *(_OWORD *)(a1 + 16);
      v71 = v30;
      v68 = v27;
      v69 = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
      sub_235E18B90();
      v31 = (void *)sub_235E18D10();
      v32 = objc_msgSend(v22, sel_bundleWithIdentifier_, v31);

      if (!v32)
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    else
    {
      v33 = sub_235E186E0();
      v66 = v34;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
      v35 = (void *)sub_235E18D10();
      v36 = (void *)objc_opt_self();
      v37 = objc_msgSend(v36, (SEL)&selRef_dataclassActionsForAccountDeletion_ + 7, v35);

      if (!v37)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      v38 = (void *)sub_235E18D10();
      v39 = (void *)sub_235E18D10();
      v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, v39, 0);

      sub_235E18D40();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E98);
      v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_235E19620;
      *(_QWORD *)(v41 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v41 + 64) = sub_235DFFF18();
      v42 = v66;
      *(_QWORD *)(v41 + 32) = v33;
      *(_QWORD *)(v41 + 40) = v42;
      v43 = sub_235E18D1C();
      v45 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v46 = *(_QWORD *)(a1 + 32);
      v70 = *(_OWORD *)(a1 + 16);
      v71 = v46;
      v68 = v43;
      v69 = v45;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
      sub_235E18B90();
      v47 = (void *)sub_235E18D10();
      v32 = objc_msgSend(v36, (SEL)&selRef_dataclassActionsForAccountDeletion_ + 7, v47);

      if (!v32)
      {
LABEL_24:
        __break(1u);
        return;
      }
    }
    v48 = (void *)sub_235E18D10();
    v49 = (void *)sub_235E18D10();
    v50 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v48, v49, 0);

    v51 = sub_235E18D40();
    v53 = v52;

    v54 = *(_QWORD *)(a1 + 56);
    v70 = *(_OWORD *)(a1 + 40);
    v71 = v54;
    v68 = v51;
    v69 = v53;
    sub_235E18B90();
    v55 = (void *)sub_235E18D10();
    v56 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v55);

    if (v56)
    {
      v57 = (void *)sub_235E18D10();
      v58 = (void *)sub_235E18D10();
      v59 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, v58, 0);

      v60 = sub_235E18D40();
      v62 = v61;

      v63 = *(_QWORD *)(a1 + 80);
      v70 = *(_OWORD *)(a1 + 64);
      v71 = v63;
      v68 = v60;
      v69 = v62;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
      sub_235E18B90();
      LOBYTE(v58) = *(_BYTE *)(a1 + 88);
      v64 = *(_QWORD *)(a1 + 96);
      LOBYTE(v70) = (_BYTE)v58;
      *((_QWORD *)&v70 + 1) = v64;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
      sub_235E18B84();
      LOBYTE(v70) = (_BYTE)v58;
      *((_QWORD *)&v70 + 1) = v64;
      v67 = (v68 & 1) == 0;
      sub_235E18B90();
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  sub_235E06DB4(a1, (uint64_t)v4);
  sub_235E00290((uint64_t)&v4[*(int *)(v2 + 40)], (uint64_t)v8, &qword_256381FD0);
  v17 = sub_235E186EC();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) == 1)
  {
    sub_235E071BC((uint64_t)v4);
    sub_235DF0DA4((uint64_t)v8, &qword_256381FD0);
  }
  else
  {
    sub_235E186D4();
    sub_235E071BC((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v17);
    swift_bridgeObjectRelease();
  }
}

__n128 sub_235E049F8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __n128 result;
  __int128 v29;
  uint64_t v30;
  __n128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int16 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  char v60;
  _OWORD v61[8];
  _BYTE v62[19];
  __n128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int16 v72;
  __n128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235E186EC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ShowAddButton();
  sub_235E00290(a1 + *(int *)(v11 + 40), (uint64_t)v6, &qword_256381FD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_235DF0DA4((uint64_t)v6, &qword_256381FD0);
    v12 = *(_QWORD *)(a1 + 112);
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 104);
      if ((*(_BYTE *)(a1 + *(int *)(v11 + 44)) & 1) != 0)
      {
        swift_bridgeObjectRetain();
        sub_235DF7E9C();
        v15 = v14;
        v17 = v16;
        v18 = sub_235E18C74();
        sub_235E035B8(0.0, 1, 0.0, 1, 0.0, 1, 54.0, 0, (uint64_t)&v63, 0.0, 1, 54.0, 0, v18, v19, v13, v12, v15, v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v79 = v69;
        v80 = v70;
        v81[0] = v71;
        v75 = v65;
        v76 = v66;
        v77 = v67;
        v78 = v68;
        v73 = v63;
        v74 = v64;
        sub_235E07224((uint64_t)&v73);
        sub_235DF2A24((uint64_t)&v73, (uint64_t)&v63, &qword_256382100);
      }
      else
      {
        v73.n128_u64[0] = *(_QWORD *)(a1 + 104);
        v73.n128_u64[1] = v12;
        sub_235E07204((uint64_t)&v73);
        sub_235DF2A24((uint64_t)&v73, (uint64_t)&v63, &qword_256382100);
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563820D8);
      sub_235E06FB8();
      sub_235E07024();
      sub_235E18980();
      v47 = v57;
      v48 = v58;
      v49 = v59;
      v50 = v60;
      v43 = v53;
      v44 = v54;
      v45 = v55;
      v46 = v56;
      v41 = v51;
      v42 = v52;
      sub_235E07210((uint64_t)&v41);
      sub_235DF2A24((uint64_t)&v41, (uint64_t)&v73, &qword_256382108);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563820C8);
      sub_235E06EE0();
      sub_235E06F24();
      sub_235E18980();
      v69 = v37;
      v70 = v38;
      v71 = v39;
      v72 = v40;
      v65 = v33;
      v66 = v34;
      v67 = v35;
      v68 = v36;
      v63 = v31;
      v64 = v32;
      sub_235E0721C((uint64_t)&v63);
      sub_235DF2A24((uint64_t)&v63, (uint64_t)v61, &qword_2563820F8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563820B0);
      sub_235E06F48(&qword_2563820A8, &qword_2563820B0, (uint64_t (*)(void))sub_235E06EE0, sub_235E06F24);
      sub_235E18980();
    }
    else
    {
      sub_235E071F8((uint64_t)&v63);
      sub_235DF2A24((uint64_t)&v63, (uint64_t)v61, &qword_2563820F8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563820B0);
      sub_235E06F48(&qword_2563820A8, &qword_2563820B0, (uint64_t (*)(void))sub_235E06EE0, sub_235E06F24);
      sub_235E18980();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v20 = sub_235E186D4();
    v22 = v21;
    v23 = sub_235E186E0();
    *(_QWORD *)&v41 = v20;
    *((_QWORD *)&v41 + 1) = v22;
    *(_QWORD *)&v42 = v23;
    *((_QWORD *)&v42 + 1) = v24;
    sub_235E0722C((uint64_t)&v41);
    sub_235DF2A24((uint64_t)&v41, (uint64_t)&v73, &qword_256382108);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563820C8);
    sub_235E06EE0();
    sub_235E06F24();
    sub_235E18980();
    v69 = v37;
    v70 = v38;
    v71 = v39;
    v72 = v40;
    v65 = v33;
    v66 = v34;
    v67 = v35;
    v68 = v36;
    v63 = v31;
    v64 = v32;
    sub_235E0721C((uint64_t)&v63);
    sub_235DF2A24((uint64_t)&v63, (uint64_t)&v73, &qword_2563820F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563820B0);
    sub_235E06F48(&qword_2563820A8, &qword_2563820B0, (uint64_t (*)(void))sub_235E06EE0, sub_235E06F24);
    sub_235E18980();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v79 = v61[6];
    v80 = v61[7];
    v81[0] = *(_OWORD *)v62;
    *(_DWORD *)((char *)v81 + 15) = *(_DWORD *)&v62[15];
    v75 = v61[2];
    v76 = v61[3];
    v77 = v61[4];
    v78 = v61[5];
    v73 = (__n128)v61[0];
    v74 = v61[1];
  }
  v25 = v80;
  *(_OWORD *)(a2 + 96) = v79;
  *(_OWORD *)(a2 + 112) = v25;
  *(_OWORD *)(a2 + 128) = v81[0];
  *(_DWORD *)(a2 + 143) = *(_DWORD *)((char *)v81 + 15);
  v26 = v76;
  *(_OWORD *)(a2 + 32) = v75;
  *(_OWORD *)(a2 + 48) = v26;
  v27 = v78;
  *(_OWORD *)(a2 + 64) = v77;
  *(_OWORD *)(a2 + 80) = v27;
  result = v73;
  v29 = v74;
  *(__n128 *)a2 = v73;
  *(_OWORD *)(a2 + 16) = v29;
  return result;
}

void sub_235E0500C(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  _QWORD v40[4];
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;

  v45 = a2;
  v3 = type metadata accessor for ShowAddButton();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v42 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v44 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)v40 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v41 = (char *)v40 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v40 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v40 - v17;
  v19 = *(_QWORD *)(a1 + 80);
  v46 = *(_OWORD *)(a1 + 64);
  v47 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  v46 = v48;
  sub_235E06DB4(a1, (uint64_t)v6);
  v20 = *(unsigned __int8 *)(v4 + 80);
  v21 = (v20 + 16) & ~v20;
  v40[1] = v20 | 7;
  v40[2] = v21 + v5;
  v22 = swift_allocObject();
  sub_235E06DFC((uint64_t)v6, v22 + v21);
  v40[3] = sub_235DF807C();
  sub_235E18BCC();
  v23 = (void *)sub_235E18D10();
  v24 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v23);

  if (v24)
  {
    v25 = (void *)sub_235E18D10();
    v26 = (void *)sub_235E18D10();
    v27 = objc_msgSend(v24, sel_localizedStringForKey_value_table_, v25, v26, 0);

    v28 = sub_235E18D40();
    v30 = v29;

    *(_QWORD *)&v46 = v28;
    *((_QWORD *)&v46 + 1) = v30;
    sub_235E06DB4(a1, (uint64_t)v6);
    v31 = swift_allocObject();
    sub_235E06DFC((uint64_t)v6, v31 + v21);
    v32 = v41;
    sub_235E18BCC();
    v33 = v42;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v16, v32, v7);
    v34 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v35 = v43;
    v34(v43, v18, v7);
    v36 = v44;
    v34(v44, v16, v7);
    v37 = v45;
    v34(v45, v35, v7);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E88);
    v34(&v37[*(int *)(v38 + 48)], v36, v7);
    v39 = *(void (**)(char *, uint64_t))(v33 + 8);
    v39(v16, v7);
    v39(v18, v7);
    v39(v36, v7);
    v39(v35, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E053A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8];
  char v15;
  uint64_t v16;
  char v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for ShowAddButton();
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *(_QWORD *)(a1 + 96);
  v15 = *(_BYTE *)(a1 + 88);
  v8 = v15;
  v16 = v9;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
  sub_235E18B84();
  v15 = v8;
  v16 = v9;
  v14[7] = (v17 & 1) == 0;
  sub_235E18B90();
  swift_release();
  v10 = *(_QWORD *)(a1 + 112);
  sub_235E06DB4(a1, (uint64_t)v7);
  if (v10)
    return sub_235E071BC((uint64_t)v7);
  sub_235E00290((uint64_t)&v7[*(int *)(v5 + 40)], (uint64_t)v4, &qword_256381FD0);
  v12 = sub_235E186EC();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v4, 1, v12) == 1)
  {
    sub_235E071BC((uint64_t)v7);
    return sub_235DF0DA4((uint64_t)v4, &qword_256381FD0);
  }
  else
  {
    sub_235E186D4();
    sub_235E071BC((uint64_t)v7);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v4, v12);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_235E0555C()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381D98);
  sub_235E18B84();
  sub_235E18B90();
  return swift_release();
}

uint64_t sub_235E055E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  sub_235DF807C();
  result = sub_235E18A40();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

void sub_235E05668(uint64_t a1@<X8>)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = sub_235E188FC();
  sub_235DF8194();
  v3 = (void *)sub_235E18D10();
  v4 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v3);

  if (v4)
  {
    v5 = sub_235E18B60();
    *(_QWORD *)a1 = v2;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = 1;
    *(_QWORD *)(a1 + 24) = v5;
  }
  else
  {
    __break(1u);
  }
}

void sub_235E05744(uint64_t a1@<X8>)
{
  sub_235E05668(a1);
}

uint64_t sub_235E0574C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[7];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563821F8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_235E188FC();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382200);
  sub_235E058A8(a1, a2, &v8[*(int *)(v9 + 44)]);
  sub_235E18C74();
  sub_235E18878();
  sub_235E00290((uint64_t)v8, a3, &qword_2563821F8);
  v10 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256382208) + 36));
  v11 = v15[5];
  v10[4] = v15[4];
  v10[5] = v11;
  v10[6] = v15[6];
  v12 = v15[1];
  *v10 = v15[0];
  v10[1] = v12;
  v13 = v15[3];
  v10[2] = v15[2];
  v10[3] = v13;
  return sub_235DF0DA4((uint64_t)v8, &qword_2563821F8);
}

void sub_235E058A8(uint64_t a1@<X2>, uint64_t a2@<X3>, char *a3@<X8>)
{
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
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;

  v42 = a1;
  v43 = a2;
  v44 = a3;
  v3 = sub_235E18CD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E78);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v46 = (char *)&v41 - v14;
  LOBYTE(v47) = 0;
  sub_235DF8194();
  v15 = (void *)sub_235E18D10();
  v16 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v15);

  if (v16)
  {
    sub_235E18B60();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE855F0], v3);
    sub_235E18B54();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v46, v13, v7);
    v47 = v42;
    v48 = v43;
    sub_235DF807C();
    swift_bridgeObjectRetain();
    v17 = sub_235E18A40();
    v19 = v18;
    v21 = v20 & 1;
    sub_235E189F8();
    v22 = sub_235E18A28();
    v24 = v23;
    v26 = v25;
    v43 = v8;
    swift_release();
    sub_235DF1C74(v17, v19, v21);
    swift_bridgeObjectRelease();
    sub_235E18B30();
    v27 = sub_235E18A1C();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    swift_release();
    LOBYTE(v17) = v31 & 1;
    sub_235DF1C74(v22, v24, v26 & 1);
    swift_bridgeObjectRelease();
    v34 = v43;
    v35 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
    v36 = v45;
    v37 = v46;
    v35(v45, v46, v7);
    v38 = v44;
    v35(v44, v36, v7);
    v39 = &v38[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256382210) + 48)];
    *(_QWORD *)v39 = v27;
    *((_QWORD *)v39 + 1) = v29;
    v39[16] = v17;
    *((_QWORD *)v39 + 3) = v33;
    sub_235DFEC48(v27, v29, v17);
    v40 = *(void (**)(char *, uint64_t))(v34 + 8);
    swift_bridgeObjectRetain();
    v40(v37, v7);
    sub_235DF1C74(v27, v29, v17);
    swift_bridgeObjectRelease();
    v40(v36, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E05C04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E0574C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_235E05C10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563821E0);
  v3 = (_QWORD *)sub_235E18FEC();
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  result = sub_235DED080(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = v8 + 2;
    v4 = *((_BYTE *)v8 - 8);
    v13 = *v8;
    swift_bridgeObjectRetain();
    result = sub_235DED080(v4);
    v8 = v12;
    v5 = v13;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E05D10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E0192C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_235E05D18()
{
  uint64_t v0;

  return sub_235E03974(*(_QWORD *)(v0 + 16));
}

unint64_t sub_235E05D24()
{
  unint64_t result;

  result = qword_256381FC8;
  if (!qword_256381FC8)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountAddView.AddType, &type metadata for AccountAddView.AddType);
    atomic_store(result, (unint64_t *)&qword_256381FC8);
  }
  return result;
}

uint64_t sub_235E05D68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AccountAddView(id *a1)
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccountAddView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v7 = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountAddView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AccountAddView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v5;
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountAddView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountAddView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountAddView()
{
  return &type metadata for AccountAddView;
}

uint64_t getEnumTagSinglePayload for AccountAddView.AddType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountAddView.AddType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E06100 + 4 * byte_235E1A505[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_235E06134 + 4 * byte_235E1A500[v4]))();
}

uint64_t sub_235E06134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E0613C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E06144);
  return result;
}

uint64_t sub_235E06150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E06158);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_235E0615C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E06164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccountAddView.AddType()
{
  return &type metadata for AccountAddView.AddType;
}

uint64_t sub_235E06180()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381F88);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381FB0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381F80);
  sub_235E009C4(&qword_256381FA8, &qword_256381F80, MEMORY[0x24BDF1988]);
  sub_235DF807C();
  swift_getOpaqueTypeConformance2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381FB8);
  sub_235E009C4(&qword_256381FC0, &qword_256381FB8, MEMORY[0x24BDEB848]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

char *sub_235E0628C(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  char *__dst;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v6 = a1;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    v7 = a2[4];
    *((_QWORD *)a1 + 3) = a2[3];
    *((_QWORD *)a1 + 4) = v7;
    v8 = a2[6];
    *((_QWORD *)a1 + 5) = a2[5];
    *((_QWORD *)a1 + 6) = v8;
    v9 = a2[8];
    *((_QWORD *)a1 + 7) = a2[7];
    *((_QWORD *)a1 + 8) = v9;
    v10 = a2[10];
    *((_QWORD *)a1 + 9) = a2[9];
    *((_QWORD *)a1 + 10) = v10;
    a1[88] = *((_BYTE *)a2 + 88);
    v11 = a2[13];
    *((_QWORD *)a1 + 12) = a2[12];
    *((_QWORD *)a1 + 13) = v11;
    v12 = *(int *)(a3 + 40);
    __dst = &a1[v12];
    v18 = (char *)a2 + v12;
    *((_QWORD *)a1 + 14) = a2[14];
    v13 = sub_235E186EC();
    v17 = *(_QWORD *)(v13 - 8);
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    v14 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v19(v18, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
      memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(__dst, v18, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v13);
    }
    v6[*(int *)(a3 + 44)] = *((_BYTE *)a2 + *(int *)(a3 + 44));
  }
  return v6;
}

uint64_t sub_235E06444(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 40);
  v5 = sub_235E186EC();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_235E06500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  void *__dst;

  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = *(int *)(a3 + 40);
  __dst = (void *)(a1 + v11);
  v12 = (const void *)(a2 + v11);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v13 = sub_235E186EC();
  v17 = *(_QWORD *)(v13 - 8);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  v14 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v18(v12, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(__dst, v12, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v13);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 44)) = *(_BYTE *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_235E0668C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 40);
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = sub_235E186EC();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 44)) = *(_BYTE *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_235E068AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v7 = *(int *)(a3 + 40);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v10 = sub_235E186EC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 44)) = *(_BYTE *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_235E069BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 40);
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = sub_235E186EC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 44)) = *(_BYTE *)(a2 + *(int *)(a3 + 44));
  return a1;
}

uint64_t sub_235E06B78()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235E06B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_235E06C04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235E06C10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FD0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ShowAddButton()
{
  uint64_t result;

  result = qword_256382030;
  if (!qword_256382030)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235E06CC4()
{
  unint64_t v0;

  sub_235E06D50();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_235E06D50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256382040)
  {
    sub_235E186EC();
    v0 = sub_235E18EA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256382040);
  }
}

uint64_t sub_235E06DA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E06DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E06DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E06E40()
{
  return sub_235E07180((uint64_t (*)(uint64_t))sub_235E04220);
}

double sub_235E06E4C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_235E049F8(*(_QWORD *)(v1 + 16), a1).n128_u64[0];
  return result;
}

unint64_t sub_235E06E54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563820A0;
  if (!qword_2563820A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382098);
    v2[0] = sub_235E06F48(&qword_2563820A8, &qword_2563820B0, (uint64_t (*)(void))sub_235E06EE0, sub_235E06F24);
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563820A0);
  }
  return result;
}

unint64_t sub_235E06EE0()
{
  unint64_t result;

  result = qword_2563820B8;
  if (!qword_2563820B8)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1A85C, &type metadata for AccountIconAddButtonView);
    atomic_store(result, (unint64_t *)&qword_2563820B8);
  }
  return result;
}

uint64_t sub_235E06F24()
{
  return sub_235E06F48(&qword_2563820C0, &qword_2563820C8, (uint64_t (*)(void))sub_235E06FB8, (uint64_t (*)(void))sub_235E07024);
}

uint64_t sub_235E06F48(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235E06FB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563820D0;
  if (!qword_2563820D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563820D8);
    v2[0] = sub_235E06EE0();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563820D0);
  }
  return result;
}

unint64_t sub_235E07024()
{
  unint64_t result;

  result = qword_2563820E0;
  if (!qword_2563820E0)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1A80C, &type metadata for BigImageAddButtonView);
    atomic_store(result, (unint64_t *)&qword_2563820E0);
  }
  return result;
}

void sub_235E07068(char *a1@<X8>)
{
  uint64_t v1;

  sub_235E0500C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_235E07070@<X0>(uint64_t a1@<X8>)
{
  return sub_235E055E8(a1);
}

uint64_t sub_235E0707C()
{
  return sub_235E07180(sub_235E053A4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for ShowAddButton();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (char *)v3 + *(int *)(v1 + 40);
  v5 = sub_235E186EC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_235E07174()
{
  return sub_235E07180((uint64_t (*)(uint64_t))sub_235E0555C);
}

uint64_t sub_235E07180(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShowAddButton() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_235E071BC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ShowAddButton();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235E071F8(uint64_t result)
{
  *(_BYTE *)(result + 146) = 1;
  return result;
}

uint64_t sub_235E07204(uint64_t result)
{
  *(_BYTE *)(result + 144) = 1;
  return result;
}

uint64_t sub_235E07210(uint64_t result)
{
  *(_BYTE *)(result + 145) = 1;
  return result;
}

uint64_t sub_235E0721C(uint64_t result)
{
  *(_BYTE *)(result + 146) = 0;
  return result;
}

uint64_t sub_235E07224(uint64_t result)
{
  *(_BYTE *)(result + 144) = 0;
  return result;
}

uint64_t sub_235E0722C(uint64_t result)
{
  *(_BYTE *)(result + 145) = 0;
  return result;
}

void sub_235E07234(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_235E03ABC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_235E07240()
{
  uint64_t v0;

  return sub_235E03CE4((void **)(v0 + 16));
}

void **sub_235E07248(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

uint64_t sub_235E072C0@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_235E02698(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_235E072C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E01E0C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_235E072D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[5];

  result = qword_256382148;
  if (!qword_256382148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382140);
    v2[1] = type metadata accessor for ShowAddButton();
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E28);
    v2[3] = sub_235DF1B80(&qword_256382150, (uint64_t (*)(uint64_t))type metadata accessor for ShowAddButton, (uint64_t)&unk_235E1A668);
    v2[4] = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF4A08], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382148);
  }
  return result;
}

uint64_t sub_235E073BC(uint64_t a1)
{
  uint64_t v1;

  return sub_235E02060(a1, v1 + 16);
}

uint64_t sub_235E073C4()
{
  uint64_t v0;

  return sub_235E02358(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235E073CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_235E186EC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_235E07460()
{
  uint64_t v0;

  sub_235E186EC();
  return sub_235E024D4(v0 + 16);
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235E074D8()
{
  return sub_235E02F64();
}

uint64_t sub_235E074E0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_235E009C4(a3, a4, MEMORY[0x24BDF4498]);
    v9[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235E07560()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2563821D0;
  if (!qword_2563821D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382198);
    v2 = sub_235DF1B80(&qword_256382150, (uint64_t (*)(uint64_t))type metadata accessor for ShowAddButton, (uint64_t)&unk_235E1A668);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2563821D0);
  }
  return result;
}

uint64_t sub_235E075DC(uint64_t a1)
{
  sub_235DFEC48(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235E07618()
{
  uint64_t v0;

  return sub_235E02FC0(*(void ***)(v0 + 16));
}

_QWORD *initializeBufferWithCopyOfBuffer for BigImageAddButtonView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BigImageAddButtonView()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for BigImageAddButtonView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for BigImageAddButtonView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for BigImageAddButtonView()
{
  return &type metadata for BigImageAddButtonView;
}

uint64_t destroy for AccountIconAddButtonView()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AccountIconAddButtonView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AccountIconAddButtonView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AccountIconAddButtonView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountIconAddButtonView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountIconAddButtonView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountIconAddButtonView()
{
  return &type metadata for AccountIconAddButtonView;
}

uint64_t sub_235E07890()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382090);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256381E48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382088);
  sub_235E189BC();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0];
  sub_235E009C4(&qword_2563820E8, &qword_256382088, MEMORY[0x24BDF43B0]);
  sub_235DF1B80(&qword_2563820F0, v0, MEMORY[0x24BDEF8B0]);
  swift_getOpaqueTypeConformance2();
  sub_235DF807C();
  sub_235E009C4(&qword_256381E50, &qword_256381E48, MEMORY[0x24BDF5428]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E079C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E079D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E079E4()
{
  return sub_235E074E0(&qword_256382218, &qword_256382208, &qword_256382220, &qword_2563821F8);
}

uint64_t sub_235E07A18()
{
  return sub_235E009C4(&qword_256382228, &qword_256382230, MEMORY[0x24BDF4498]);
}

void sub_235E07A48(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t GenericDetailsView.init(account:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E188A8();
  *a2 = result;
  a2[1] = v5;
  a2[2] = a1;
  a2[3] = 0;
  return result;
}

uint64_t sub_235E07B0C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_235E07B1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GenericAccountsUIPlugin();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t GenericDetailsView.body.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382238);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v0[1];
  v8 = v0[2];
  v7 = v0[3];
  v15 = *v0;
  v5 = v15;
  v16 = v6;
  v17 = v8;
  v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382240);
  sub_235E009C4(&qword_256382248, &qword_256382240, MEMORY[0x24BDF5428]);
  sub_235E18A10();
  v11 = v5;
  v12 = v6;
  v13 = v8;
  v14 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382250);
  sub_235E009C4(&qword_256382258, &qword_256382238, MEMORY[0x24BDF1988]);
  sub_235E009C4(&qword_256382260, &qword_256382250, MEMORY[0x24BDEF170]);
  sub_235E18AE8();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_235E07CB4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382290);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  if (a1)
  {
    v30 = a4;
    v17 = a2;
    v18 = sub_235DEF9A0();
    v31 = a5;
    v32 = v11;
    if ((v18 & 1) != 0)
    {
      v19 = 0;
      v20 = 1;
    }
    else
    {
      type metadata accessor for AccountsUIModel(0);
      sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
      v18 = sub_235E188A8();
      v20 = v18;
      v19 = v21;
    }
    MEMORY[0x24BDAC7A8](v18);
    *(&v29 - 4) = a1;
    *(&v29 - 3) = v17;
    v22 = v30;
    *(&v29 - 2) = (uint64_t)a3;
    *(&v29 - 1) = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382298);
    sub_235E009C4(&qword_2563822A0, &qword_256382298, MEMORY[0x24BDF5428]);
    sub_235E18C5C();
    v23 = v32;
    v24 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
    v24(v14, v16, v10);
    v25 = v31;
    *v31 = v20;
    v25[1] = v19;
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822A8);
    v24((char *)v25 + *(int *)(v26 + 48), v14, v10);
    sub_235E0B3FC((id)v20);
    v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    v27(v16, v10);
    v27(v14, v10);
    sub_235E0B40C((id)v20);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    v28 = a3;
    swift_retain();
    sub_235E18890();
    __break(1u);
  }
}

void sub_235E07EFC(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_235E07CB4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_235E07F08@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  BOOL v50;
  uint64_t KeyPath;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  id v64;
  char *v65;
  uint64_t v66;
  id v67;
  char *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  _QWORD *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  void (*v106)(char *, char *, uint64_t);
  uint64_t v107;
  void (*v108)(void);
  uint64_t v109;
  char *v110;
  uint64_t v111;
  void (*v112)(char *, char *, uint64_t);
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, uint64_t);
  void (*v118)(char *, uint64_t);
  uint64_t result;
  char v120;
  id v121;
  id v122;
  _QWORD v123[2];
  id v124;
  uint64_t v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  id v130;
  char *v131;
  char *v132;
  id v133;
  char *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  _OWORD v158[2];

  v138 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822B0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v139 = (uint64_t)v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v137 = (char *)v123 - v12;
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822B8);
  v142 = *(_QWORD *)(v145 - 8);
  v13 = MEMORY[0x24BDAC7A8](v145);
  v128 = (char *)v123 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v150 = (char *)v123 - v15;
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822C0);
  v16 = MEMORY[0x24BDAC7A8](v144);
  v129 = (char *)v123 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v141 = (char *)v123 - v18;
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822C8);
  v149 = *(_QWORD *)(v146 - 8);
  v19 = MEMORY[0x24BDAC7A8](v146);
  v136 = (char *)v123 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v127 = (char *)v123 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v126 = (char *)v123 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v140 = (char *)v123 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v151 = (char *)v123 - v27;
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822D0);
  v148 = *(_QWORD *)(v135 - 8);
  v28 = MEMORY[0x24BDAC7A8](v135);
  v134 = (char *)v123 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v152 = a1;
  v153 = a2;
  v143 = a2;
  v154 = a3;
  v155 = a4;
  v147 = (char *)v123 - v30;
  sub_235E18824();
  v131 = "h the account type";
  v31 = (void *)sub_235E18D10();
  v130 = (id)objc_opt_self();
  v32 = objc_msgSend(v130, sel_bundleWithIdentifier_, v31);

  if (!v32)
  {
    __break(1u);
    goto LABEL_20;
  }
  v33 = (void *)sub_235E18D10();
  v34 = (void *)sub_235E18D10();
  v35 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, v34, 0);

  v132 = (char *)sub_235E18D40();
  v37 = v36;

  v38 = sub_235E18E0C();
  swift_retain();
  v39 = a1;
  v40 = a3;
  v41 = sub_235E18E00();
  v42 = (_QWORD *)swift_allocObject();
  v43 = a4;
  v44 = MEMORY[0x24BEE6930];
  v42[2] = v41;
  v42[3] = v44;
  v45 = v143;
  v42[4] = a1;
  v42[5] = v45;
  v42[6] = v40;
  v42[7] = a4;
  v124 = v39;
  v46 = v40;
  swift_retain();
  v125 = v38;
  v47 = sub_235E18E00();
  v48 = (_QWORD *)swift_allocObject();
  v48[2] = v47;
  v48[3] = v44;
  v48[4] = a1;
  v48[5] = v45;
  v133 = v46;
  v48[6] = v46;
  v48[7] = a4;
  sub_235E18C14();
  v156 = v132;
  v157 = v37;
  v49 = sub_235DF807C();
  sub_235E18C8C();
  v132 = (char *)a1;
  if (a1)
  {
    v50 = sub_235DEF9A0();
    KeyPath = swift_getKeyPath();
    v52 = swift_allocObject();
    *(_BYTE *)(v52 + 16) = !v50;
    v53 = v142;
    v54 = *(void (**)(char *, char *, uint64_t))(v142 + 16);
    v55 = (uint64_t)v141;
    v56 = v150;
    v57 = v145;
    v54(v141, v150, v145);
    v58 = (uint64_t *)(v55 + *(int *)(v144 + 36));
    *v58 = KeyPath;
    v58[1] = (uint64_t)sub_235E00278;
    v58[2] = v52;
    v142 = *(_QWORD *)(v53 + 8);
    ((void (*)(char *, uint64_t))v142)(v56, v57);
    sub_235DEFAD4();
    *(_QWORD *)&v158[0] = v59;
    *((_QWORD *)&v158[0] + 1) = v60;
    v61 = sub_235E0B460();
    v62 = v140;
    v123[1] = v61;
    sub_235E18AA0();
    swift_bridgeObjectRelease();
    sub_235DF0DA4(v55, &qword_2563822C0);
    v63 = v146;
    v150 = *(char **)(v149 + 32);
    ((void (*)(char *, char *, uint64_t))v150)(v151, v62, v146);
    v64 = v133;
    *(_QWORD *)&v158[0] = v133;
    *((_QWORD *)&v158[0] + 1) = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
    sub_235E18B84();
    v65 = v156;
    *(_QWORD *)&v158[0] = sub_235E18D40();
    *((_QWORD *)&v158[0] + 1) = v66;
    v67 = objc_msgSend(v65, sel_objectForKeyedSubscript_, sub_235E19034());
    swift_unknownObjectRelease();

    if (!v67)
    {
      memset(v158, 0, sizeof(v158));
      sub_235DF0DA4((uint64_t)v158, &qword_25429C2E0);
      goto LABEL_11;
    }
    sub_235E18EF0();
    swift_unknownObjectRelease();
    sub_235DF0DA4((uint64_t)v158, &qword_25429C2E0);
    *(_QWORD *)&v158[0] = v64;
    *((_QWORD *)&v158[0] + 1) = v43;
    sub_235E18B84();
    v68 = v156;
    v69 = objc_msgSend(v156, sel_accountType);

    if (v69)
    {
      v70 = objc_msgSend(v69, sel_identifier);

      if (v70)
      {
        v71 = sub_235E18D40();
        v73 = v72;

        v74 = sub_235E18D40();
        if (v73)
        {
          if (v71 == v74 && v73 == v75)
          {
            swift_bridgeObjectRelease_n();
            v76 = 1;
            v77 = (uint64_t)v137;
            v63 = v146;
LABEL_16:
            v107 = v149;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v149 + 56))(v77, v76, 1, v63);
            v108 = *(void (**)(void))(v148 + 16);
            v109 = v63;
            v110 = v134;
            v111 = v135;
            v108();
            v112 = *(void (**)(char *, char *, uint64_t))(v107 + 16);
            v113 = v136;
            v112(v136, v151, v109);
            v114 = v139;
            sub_235E0B4FC(v77, v139);
            v115 = v138;
            ((void (*)(uint64_t, char *, uint64_t))v108)(v138, v110, v111);
            v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822E8);
            v112((char *)(v115 + *(int *)(v116 + 48)), v113, v109);
            sub_235E0B4FC(v114, v115 + *(int *)(v116 + 64));
            sub_235DF0DA4(v77, &qword_2563822B0);
            v117 = *(void (**)(char *, uint64_t))(v107 + 8);
            v117(v151, v109);
            v118 = *(void (**)(char *, uint64_t))(v148 + 8);
            v118(v147, v111);
            sub_235DF0DA4(v114, &qword_2563822B0);
            v117(v113, v109);
            return ((uint64_t (*)(char *, uint64_t))v118)(v110, v111);
          }
          v120 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v63 = v146;
          if ((v120 & 1) == 0)
            goto LABEL_14;
LABEL_11:
          v76 = 1;
          v77 = (uint64_t)v137;
          goto LABEL_16;
        }
      }
      else
      {
        sub_235E18D40();
      }
      swift_bridgeObjectRelease();
LABEL_14:
      v140 = (char *)v54;
      v141 = (char *)v49;
      v78 = (void *)sub_235E18D10();
      v79 = objc_msgSend(v130, sel_bundleWithIdentifier_, v78);

      if (v79)
      {
        v80 = (void *)sub_235E18D10();
        v81 = (void *)sub_235E18D10();
        v82 = objc_msgSend(v79, sel_localizedStringForKey_value_table_, v80, v81, 0);

        v131 = (char *)sub_235E18D40();
        v84 = v83;

        v85 = v124;
        v86 = v64;
        swift_retain();
        v87 = sub_235E18E00();
        v88 = (_QWORD *)swift_allocObject();
        v88[2] = v87;
        v89 = MEMORY[0x24BEE6930];
        v90 = v132;
        v88[3] = MEMORY[0x24BEE6930];
        v88[4] = v90;
        v91 = v143;
        v88[5] = v143;
        v88[6] = v86;
        v88[7] = v43;
        v92 = v85;
        v93 = v86;
        swift_retain();
        v94 = sub_235E18E00();
        v95 = (_QWORD *)swift_allocObject();
        v95[2] = v94;
        v95[3] = v89;
        v95[4] = v90;
        v95[5] = v91;
        v95[6] = v93;
        v95[7] = v43;
        sub_235E18C14();
        v156 = v131;
        v157 = v84;
        v96 = v128;
        sub_235E18C8C();
        LOBYTE(v89) = sub_235DEF9A0();
        v97 = swift_getKeyPath();
        v98 = swift_allocObject();
        *(_BYTE *)(v98 + 16) = (v89 & 1) == 0;
        v99 = (uint64_t)v129;
        v100 = v145;
        ((void (*)(char *, char *, uint64_t))v140)(v129, v96, v145);
        v101 = (uint64_t *)(v99 + *(int *)(v144 + 36));
        *v101 = v97;
        v101[1] = (uint64_t)sub_235E00AD4;
        v101[2] = v98;
        ((void (*)(char *, uint64_t))v142)(v96, v100);
        sub_235DEFAD4();
        *(_QWORD *)&v158[0] = v102;
        *((_QWORD *)&v158[0] + 1) = v103;
        v104 = v127;
        sub_235E18AA0();
        swift_bridgeObjectRelease();
        sub_235DF0DA4(v99, &qword_2563822C0);
        v105 = v126;
        v63 = v146;
        v106 = (void (*)(char *, char *, uint64_t))v150;
        ((void (*)(char *, char *, uint64_t))v150)(v126, v104, v146);
        v77 = (uint64_t)v137;
        v106(v137, v105, v63);
        v76 = 0;
        goto LABEL_16;
      }
      goto LABEL_21;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  v121 = v124;
  v122 = v133;
  swift_retain();
  result = sub_235E18890();
  __break(1u);
  return result;
}

uint64_t sub_235E08C14@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  id v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  v2 = objc_msgSend(v7, sel_username);

  if (v2)
  {
    sub_235E18D40();

  }
  sub_235DF807C();
  result = sub_235E18A40();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

void sub_235E08CD0(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = (void *)sub_235E18D10();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    v4 = (void *)sub_235E18D10();
    v5 = (void *)sub_235E18D10();
    v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_235E18D40();
    sub_235DF807C();
    *(_QWORD *)a1 = sub_235E18A40();
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = v8 & 1;
    *(_QWORD *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

void sub_235E08E18(uint64_t *a1@<X8>)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  v2 = objc_msgSend(v6, sel_accountDescription);

  if (v2)
  {
    v3 = sub_235E18D40();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v5;
}

void sub_235E08EAC()
{
  void *v0;
  void *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  v0 = (void *)sub_235E18D10();
  objc_msgSend(v1, sel_setAccountDescription_, v0);

}

uint64_t sub_235E08F24@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id v3;
  uint64_t result;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  *(_QWORD *)&v9[0] = sub_235E18D40();
  *((_QWORD *)&v9[0] + 1) = v2;
  v3 = objc_msgSend(v7, sel_objectForKeyedSubscript_, sub_235E19034());
  swift_unknownObjectRelease();

  if (v3)
  {
    sub_235E18EF0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_235DF2E14((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    result = sub_235DF0DA4((uint64_t)v10, &qword_25429C2E0);
    goto LABEL_8;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_8:
    v5 = 0;
    v6 = 0xE000000000000000;
    goto LABEL_9;
  }
  v5 = v7;
  v6 = v8;
LABEL_9:
  *a1 = v5;
  a1[1] = v6;
  return result;
}

void sub_235E09048()
{
  void *v0;
  void *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  v0 = (void *)sub_235E18D10();
  objc_msgSend(v1, sel_setAccountProperty_forKey_, v0, *MEMORY[0x24BDB3F00]);

}

uint64_t sub_235E090CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
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

  v23 = a1;
  v26 = a5;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382278);
  MEMORY[0x24BDAC7A8](v25);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235E189A4();
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381FB8);
  v24 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - v16;
  sub_235E1898C();
  v31 = a1;
  v32 = a2;
  v33 = a3;
  v34 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
  sub_235E1883C();
  sub_235E18998();
  v27 = v23;
  v28 = a2;
  v29 = a3;
  v30 = a4;
  sub_235E1883C();
  v18 = v24;
  v19 = &v10[*(int *)(v25 + 48)];
  v20 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v20(v10, v17, v12);
  v20(v19, v15, v12);
  sub_235E18974();
  v21 = *(void (**)(char *, uint64_t))(v18 + 8);
  v21(v15, v12);
  return ((uint64_t (*)(char *, uint64_t))v21)(v17, v12);
}

uint64_t sub_235E092E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235E090CC(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_235E092F4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_235E09304(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = a2;
  v30 = a4;
  v31 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void *)sub_235E18D10();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v14);

  if (v15)
  {
    v16 = (void *)sub_235E18D10();
    v17 = (void *)sub_235E18D10();
    v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, v17, 0);

    v19 = sub_235E18D40();
    v21 = v20;

    v32 = v19;
    v33 = v21;
    sub_235E187E8();
    v22 = sub_235E187F4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 0, 1, v22);
    v23 = (_QWORD *)swift_allocObject();
    v24 = v29;
    v25 = v30;
    v23[2] = a1;
    v23[3] = v24;
    v23[4] = a3;
    v23[5] = v25;
    sub_235DF807C();
    v26 = a1;
    v27 = a3;
    swift_retain();
    sub_235E18BC0();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v31, v13, v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E0953C(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void (*v7)(_QWORD *, _QWORD);
  BOOL *v8;
  uint64_t result;
  id v10;
  _QWORD v11[4];
  id v12;

  v11[0] = a3;
  v11[1] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  objc_msgSend(v12, sel_reload);

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v6 = a1;
    v7 = (void (*)(_QWORD *, _QWORD))sub_235E187AC();
    *v8 = !*v8;
    v7(v11, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    v10 = a3;
    swift_retain();
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

void sub_235E09674(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = a5;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v9 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)sub_235E18D10();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v12);

  if (v13)
  {
    v14 = (void *)sub_235E18D10();
    v15 = (void *)sub_235E18D10();
    v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    v17 = sub_235E18D40();
    v19 = v18;

    v25 = v17;
    v26 = v19;
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = a1;
    v20[3] = a2;
    v20[4] = a3;
    v20[5] = a4;
    sub_235DF807C();
    v21 = a1;
    v22 = a3;
    swift_retain();
    sub_235E18BCC();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v11, v23);
  }
  else
  {
    __break(1u);
  }
}

void sub_235E09830(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (*v17)(void **, _QWORD);
  BOOL *v18;
  id v19;
  void *aBlock;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  uint64_t (*v24)(int, void *);
  _QWORD *v25;
  id v26;

  aBlock = a3;
  v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382280);
  sub_235E18B84();
  v8 = objc_msgSend(v26, sel_isDirty);

  if (v8)
  {
    if (a1)
    {
      v9 = a1;
      v10 = sub_235DE91E4();

      sub_235E18B84();
      v11 = v26;
      v12 = (_QWORD *)swift_allocObject();
      v12[2] = a1;
      v12[3] = a2;
      v12[4] = a3;
      v12[5] = a4;
      v24 = sub_235E0B378;
      v25 = v12;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v21 = 1107296256;
      v22 = sub_235E07A48;
      v23 = &block_descriptor_1;
      v13 = _Block_copy(&aBlock);
      swift_retain();
      v14 = v9;
      v15 = a3;
      swift_release();
      objc_msgSend(v10, sel_saveAccount_withCompletionHandler_, v11, v13);
      _Block_release(v13);

      return;
    }
    goto LABEL_7;
  }
  if (!a1)
  {
LABEL_7:
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    v19 = a3;
    swift_retain();
    sub_235E18890();
    __break(1u);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v16 = a1;
  v17 = (void (*)(void **, _QWORD))sub_235E187AC();
  *v18 = !*v18;
  v17(&aBlock, 0);

  swift_release();
  swift_release();
}

uint64_t sub_235E09A58(int a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
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
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  char *v34;
  char *v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 aBlock;
  uint64_t (*v52)(uint64_t);
  void *v53;
  uint64_t (*v54)();
  _QWORD *v55;

  v41 = a4;
  v42 = a6;
  v43 = a3;
  v40 = a1;
  v8 = sub_235E18CA4();
  v48 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235E18CC8();
  v45 = *(_QWORD *)(v10 - 8);
  v46 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v44 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235E18770();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429C0B0 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v12, (uint64_t)qword_25429C098);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  v17 = a2;
  v18 = a2;
  v19 = sub_235E18758();
  v20 = sub_235E18E60();
  if (os_log_type_enabled(v19, v20))
  {
    v38 = a5;
    v39 = v8;
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v50 = v22;
    *(_DWORD *)v21 = 136315138;
    if ((v40 & 1) != 0)
    {
      v23 = 0xEB00000000796C6CLL;
      v24 = 0x7566736563637573;
    }
    else
    {
      *(_QWORD *)&aBlock = 0;
      *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
      sub_235E18F44();
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "with an error ");
      HIBYTE(aBlock) = -18;
      v49 = a2;
      v25 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381ED8);
      sub_235E18D4C();
      sub_235E18D7C();
      swift_bridgeObjectRelease();
      v23 = *((_QWORD *)&aBlock + 1);
      v24 = aBlock;
    }
    *(_QWORD *)&aBlock = sub_235E0A4D0(v24, v23, &v50);
    sub_235E18EB4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235DE3000, v19, v20, "save completed %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7E29C4](v22, -1, -1);
    MEMORY[0x23B7E29C4](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v8 = v39;
    a5 = v38;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_235DF2A90(0, (unint64_t *)&unk_25429C298);
  v26 = (void *)sub_235E18E6C();
  v27 = (_QWORD *)swift_allocObject();
  v29 = v42;
  v28 = v43;
  v30 = v41;
  v27[2] = v43;
  v27[3] = v30;
  v27[4] = a5;
  v27[5] = v29;
  v54 = sub_235E0B3A0;
  v55 = v27;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v52 = sub_235DFD288;
  v53 = &block_descriptor_14;
  v31 = _Block_copy(&aBlock);
  swift_retain();
  v32 = v28;
  v33 = a5;
  swift_release();
  v34 = v44;
  sub_235E18CBC();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_235DF1B80(&qword_25429C220, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C248);
  sub_235E009C4((unint64_t *)&qword_25429C250, &qword_25429C248, MEMORY[0x24BEE12C8]);
  v35 = v47;
  sub_235E18EFC();
  MEMORY[0x23B7E23A0](0, v34, v35, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v48 + 8))(v35, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v34, v46);
}

uint64_t sub_235E09F30(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void (*v5)(uint64_t *, _QWORD);
  BOOL *v6;
  uint64_t result;
  id v9;
  uint64_t v10;

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v4 = a1;
    v5 = (void (*)(uint64_t *, _QWORD))sub_235E187AC();
    *v6 = !*v6;
    v5(&v10, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    v9 = a3;
    swift_retain();
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E0A030()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382238);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v0[1];
  v8 = v0[2];
  v7 = v0[3];
  v15 = *v0;
  v5 = v15;
  v16 = v6;
  v17 = v8;
  v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382240);
  sub_235E009C4(&qword_256382248, &qword_256382240, MEMORY[0x24BDF5428]);
  sub_235E18A10();
  v11 = v5;
  v12 = v6;
  v13 = v8;
  v14 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382250);
  sub_235E009C4(&qword_256382258, &qword_256382238, MEMORY[0x24BDF1988]);
  sub_235E009C4(&qword_256382260, &qword_256382250, MEMORY[0x24BDEF170]);
  sub_235E18AE8();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t type metadata accessor for GenericAccountsUIPlugin()
{
  return objc_opt_self();
}

uint64_t destroy for GenericDetailsView(id *a1)
{

  return swift_release();
}

_QWORD *initializeWithCopy for GenericDetailsView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  v7 = v3;
  v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GenericDetailsView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a2 + 16);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GenericDetailsView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GenericDetailsView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GenericDetailsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GenericDetailsView()
{
  return &type metadata for GenericDetailsView;
}

uint64_t sub_235E0A38C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382238);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382250);
  sub_235E009C4(&qword_256382258, &qword_256382238, MEMORY[0x24BDF1988]);
  sub_235E009C4(&qword_256382260, &qword_256382250, MEMORY[0x24BDEF170]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E0A42C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_235E0A460(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_235E0A4D0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_235E18EB4();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_235E0A4D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235E0A5A0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235DF0958((uint64_t)v12, *a3);
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
      sub_235DF0958((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235E0A5A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235E18EC0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235E0A758(a5, a6);
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
  v8 = sub_235E18F74();
  if (!v8)
  {
    sub_235E18FBC();
    __break(1u);
LABEL_17:
    result = sub_235E18FF8();
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

uint64_t sub_235E0A758(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235E0A7EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235E0A9C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235E0A9C4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235E0A7EC(uint64_t a1, unint64_t a2)
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
      v3 = sub_235E0A960(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235E18F50();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235E18FBC();
      __break(1u);
LABEL_10:
      v2 = sub_235E18D88();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235E18FF8();
    __break(1u);
LABEL_14:
    result = sub_235E18FBC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235E0A960(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382288);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235E0A9C4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382288);
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
  result = sub_235E18FF8();
  __break(1u);
  return result;
}

_BYTE **sub_235E0AB10(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

id sub_235E0AB20(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id result;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  char v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];

  objc_msgSend(a1, sel_copy);
  sub_235E18EF0();
  swift_unknownObjectRelease();
  sub_235DF2A90(0, (unint64_t *)&qword_25429C2A8);
  swift_dynamicCast();
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  v2 = (void *)sub_235E188A8();
  v33[2] = v31;
  v33[3] = 0;
  sub_235E0B1E0();
  v29 = v2;
  v28 = v31;
  v3 = (void *)sub_235E18BF0();
  strcpy((char *)v33, "DETAILS_ROW_");
  BYTE5(v33[1]) = 0;
  HIWORD(v33[1]) = -5120;
  v4 = objc_msgSend(a1, sel_identifier);
  if (!v4)
  {
    sub_235DF2A90(0, &qword_256381BF0);
    v4 = (id)sub_235E18E9C();
  }
  v5 = objc_msgSend(v4, sel_description);
  sub_235E18D40();

  sub_235E18D7C();
  swift_bridgeObjectRelease();
  v6 = v33[0];
  v7 = v33[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429C2D8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_235E19630;
  strcpy((char *)v33, "ONLY_SECTION_");
  HIWORD(v33[1]) = -4864;
  swift_retain();
  v9 = objc_msgSend(a1, sel_identifier);
  v30 = a1;
  if (!v9)
  {
    sub_235DF2A90(0, &qword_256381BF0);
    v9 = (id)sub_235E18E9C();
  }
  v10 = objc_msgSend(v9, sel_description);
  sub_235E18D40();

  sub_235E18D7C();
  swift_bridgeObjectRelease();
  v12 = v33[0];
  v11 = v33[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382270);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_235E19620;
  *(_QWORD *)(v13 + 32) = v6;
  *(_QWORD *)(v13 + 40) = v7;
  *(_QWORD *)(v13 + 48) = 0x10101010001;
  *(_QWORD *)(v13 + 56) = v3;
  *(_QWORD *)(v13 + 64) = 0;
  *(_QWORD *)(v13 + 72) = 0;
  *(_BYTE *)(v13 + 80) = 0;
  *(_QWORD *)(v13 + 88) = 0;
  *(_QWORD *)(v13 + 96) = 0xE000000000000000;
  *(_BYTE *)(v13 + 104) = 1;
  type metadata accessor for AccountUISettingSection();
  v14 = (_QWORD *)swift_allocObject();
  v14[6] = 0;
  v14[7] = 0;
  v14[5] = 0;
  v14[2] = v12;
  v14[3] = v11;
  v14[4] = v13;
  swift_beginAccess();
  v14[5] = 0;
  v14[6] = 0;
  swift_bridgeObjectRetain();
  sub_235E0B224((id)0x10101010001, v3, 0, 0, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v14[7] = 0;
  swift_release();
  *(_QWORD *)(v8 + 32) = v14;
  sub_235E18DD0();
  v32 = v8;
  result = objc_msgSend(v30, sel_provisionedDataclasses);
  if (result)
  {
    v16 = result;
    v17 = (uint64_t)objc_msgSend(result, sel_count);

    if (v17 < 1)
    {
      swift_bridgeObjectRelease();
      sub_235E0B2A8((void *)0x10101010001, v3, 0, 0, 0);

      swift_release();
LABEL_19:
      swift_bridgeObjectRelease();
      return (id)v32;
    }
    result = objc_msgSend(v30, sel_accountType);
    if (result)
    {
      v18 = result;
      v19 = objc_msgSend(result, sel_identifier);

      if (v19)
      {
        v20 = sub_235E18D40();
        v22 = v21;

        v23 = sub_235E18D40();
        if (v22)
        {
          if (v20 == v23 && v22 == v24)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
LABEL_23:
            sub_235E0B2A8((void *)0x10101010001, v3, 0, 0, 0);
            swift_release();
            swift_bridgeObjectRelease();

            return (id)v32;
          }
          v27 = sub_235E19028();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
          goto LABEL_16;
        }
      }
      else
      {
        sub_235E18D40();
      }
      swift_bridgeObjectRelease();
LABEL_16:
      v25 = (_QWORD *)swift_allocObject();
      v25[6] = 0;
      v25[7] = 0;
      v25[5] = 0;
      v25[2] = 0xD000000000000011;
      v25[3] = 0x8000000235E1F980;
      v25[4] = &unk_250734900;
      swift_beginAccess();
      v25[5] = 0;
      v25[6] = 0;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v25[7] = 0;
      v26 = swift_release();
      MEMORY[0x23B7E22D4](v26);
      if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_235E18DDC();
      sub_235E18DF4();
      sub_235E18DD0();
      swift_bridgeObjectRelease();
      swift_release();

      sub_235E0B2A8((void *)0x10101010001, v3, 0, 0, 0);
      goto LABEL_19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_235E0B1E0()
{
  unint64_t result;

  result = qword_256382268;
  if (!qword_256382268)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for GenericDetailsView, &type metadata for GenericDetailsView);
    atomic_store(result, (unint64_t *)&qword_256382268);
  }
  return result;
}

id sub_235E0B224(id result, id a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 6:
      goto LABEL_4;
    case 1:
      result = result;
      break;
    case 2:
    case 3:
      swift_retain();
      swift_retain();
      result = (id)swift_bridgeObjectRetain();
      break;
    case 4:
    case 5:
      swift_retain();
LABEL_4:
      result = (id)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_235E0B2A8(void *a1, id a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 6:
      goto LABEL_4;
    case 1:

      return;
    case 2:
    case 3:
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 4:
    case 5:
      swift_release();
LABEL_4:
      swift_release();
      break;
    default:
      return;
  }
}

void sub_235E0B344(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_235E09304(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

void sub_235E0B350(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_235E09674(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

void sub_235E0B360()
{
  uint64_t v0;

  sub_235E09830(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_235E0B378(int a1, void *a2)
{
  uint64_t v2;

  return sub_235E09A58(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_235E0B3A0()
{
  uint64_t v0;

  return sub_235E09F30(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E0B3E4()
{
  uint64_t v0;

  return sub_235E0953C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_235E0B3F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E07F08(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

id sub_235E0B3FC(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

void sub_235E0B40C(id a1)
{
  if (a1 != (id)1)

}

uint64_t sub_235E0B41C@<X0>(uint64_t a1@<X8>)
{
  return sub_235E08C14(a1);
}

uint64_t sub_235E0B42C()
{
  return sub_235E0B554((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E08E18);
}

uint64_t sub_235E0B43C(uint64_t a1)
{
  return sub_235E0B5B4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E08EAC);
}

uint64_t sub_235E0B450()
{
  return swift_deallocObject();
}

unint64_t sub_235E0B460()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563822D8;
  if (!qword_2563822D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563822C0);
    v2[0] = sub_235E009C4(&qword_2563822E0, &qword_2563822B8, MEMORY[0x24BDF53E0]);
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563822D8);
  }
  return result;
}

uint64_t sub_235E0B4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E0B548()
{
  return sub_235E0B554((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E08F24);
}

uint64_t sub_235E0B554(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t objectdestroy_19Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E0B5A8(uint64_t a1)
{
  return sub_235E0B5B4(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E09048);
}

uint64_t sub_235E0B5B4(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_235E0B5C8()
{
  return swift_deallocObject();
}

uint64_t AccountSettingsDetailModelView.init(detailModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountsUISettingsDetailModel(0);
  sub_235DF1B80(&qword_256381CC0, type metadata accessor for AccountsUISettingsDetailModel, (uint64_t)&protocol conformance descriptor for AccountsUISettingsDetailModel);
  result = sub_235E18854();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AccountSettingsDetailModelView.body.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563822F0);
  sub_235DFE174(&qword_2563822F8, &qword_2563822F0, (uint64_t (*)(void))sub_235E0B810, MEMORY[0x24BDF4A08]);
  sub_235E0B854();
  return sub_235E18A04();
}

uint64_t sub_235E0B6F0(uint64_t a1, void *a2)
{
  id v3;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = a2;
  sub_235E187B8();

  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C238);
  sub_235E009C4(&qword_2563824B8, (uint64_t *)&unk_25429C238, MEMORY[0x24BEE12D8]);
  sub_235E0B810();
  sub_235DF1B80(&qword_2563824C0, (uint64_t (*)(uint64_t))type metadata accessor for AccountUISettingSection, (uint64_t)&protocol conformance descriptor for AccountUISettingSection);
  return sub_235E18C38();
}

uint64_t sub_235E0B800()
{
  uint64_t v0;

  return sub_235E0B6F0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_235E0B810()
{
  unint64_t result;

  result = qword_256382300;
  if (!qword_256382300)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1AD1C, &type metadata for SettingSectionWrapperView);
    atomic_store(result, (unint64_t *)&qword_256382300);
  }
  return result;
}

unint64_t sub_235E0B854()
{
  unint64_t result;

  result = qword_256382308;
  if (!qword_256382308)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1ACCC, &type metadata for AccountFooterView);
    atomic_store(result, (unint64_t *)&qword_256382308);
  }
  return result;
}

uint64_t sub_235E0B898()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563822F0);
  sub_235DFE174(&qword_2563822F8, &qword_2563822F0, (uint64_t (*)(void))sub_235E0B810, MEMORY[0x24BDF4A08]);
  sub_235E0B854();
  return sub_235E18A04();
}

uint64_t sub_235E0B93C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382438);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382460);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235E18938();
  MEMORY[0x24BDAC7A8](v9);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382428);
  MEMORY[0x24BDAC7A8](v30);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382418);
  MEMORY[0x24BDAC7A8](v31);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382400);
  MEMORY[0x24BDAC7A8](v32);
  v33 = (uint64_t)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E1892C();
  sub_235E18920();
  sub_235E18B48();
  sub_235E18908();
  swift_release();
  sub_235E18920();
  if (a1)
  {
    v15 = a1;
    sub_235DE6CFC();

    sub_235E18914();
    swift_bridgeObjectRelease();
    sub_235E18920();
    sub_235E18950();
    v16 = sub_235E18A34();
    v18 = v17;
    v20 = v19;
    v22 = v21 & 1;
    sub_235E1895C();
    v23 = sub_235E18968();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 0, 1, v23);
    KeyPath = swift_getKeyPath();
    sub_235E00290((uint64_t)v8, (uint64_t)v5 + *(int *)(v3 + 28), &qword_256382460);
    *v5 = KeyPath;
    sub_235E00290((uint64_t)v5, (uint64_t)&v11[*(int *)(v30 + 36)], &qword_256382438);
    *(_QWORD *)v11 = v16;
    *((_QWORD *)v11 + 1) = v18;
    v11[16] = v22;
    *((_QWORD *)v11 + 3) = v20;
    sub_235DFEC48(v16, v18, v22);
    swift_bridgeObjectRetain();
    sub_235DF0DA4((uint64_t)v5, &qword_256382438);
    sub_235DF0DA4((uint64_t)v8, &qword_256382460);
    sub_235DF1C74(v16, v18, v22);
    swift_bridgeObjectRelease();
    LODWORD(KeyPath) = sub_235E189D4();
    sub_235E00290((uint64_t)v11, (uint64_t)v13, &qword_256382428);
    *(_DWORD *)&v13[*(int *)(v31 + 36)] = KeyPath;
    sub_235DF0DA4((uint64_t)v11, &qword_256382428);
    v25 = sub_235E189EC();
    v26 = swift_getKeyPath();
    v27 = v33;
    sub_235E00290((uint64_t)v13, v33, &qword_256382418);
    v28 = (uint64_t *)(v27 + *(int *)(v32 + 36));
    *v28 = v26;
    v28[1] = v25;
    sub_235DF0DA4((uint64_t)v13, &qword_256382418);
    return sub_235DF2A24(v27, v34, &qword_256382400);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E0BD74()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382400);
  sub_235E1222C();
  return sub_235E18C5C();
}

void sub_235E0BDD0(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
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
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  _QWORD v19[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822F0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v19 - v11;
  if (a1)
  {
    if (sub_235DEF9A0())
    {
      v13 = 0;
      v14 = 1;
    }
    else
    {
      type metadata accessor for AccountsUIModel(0);
      sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
      v14 = sub_235E188A8();
      v13 = v15;
    }
    v19[1] = a2;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C238);
    sub_235E009C4(&qword_2563824B8, (uint64_t *)&unk_25429C238, MEMORY[0x24BEE12D8]);
    sub_235E0B810();
    sub_235DF1B80(&qword_2563824C0, (uint64_t (*)(uint64_t))type metadata accessor for AccountUISettingSection, (uint64_t)&protocol conformance descriptor for AccountUISettingSection);
    sub_235E18C38();
    v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v16(v10, v12, v6);
    *a3 = v14;
    a3[1] = v13;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382660);
    v16((char *)a3 + *(int *)(v17 + 48), v10, v6);
    sub_235E0B3FC((id)v14);
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v12, v6);
    v18(v10, v6);
    sub_235E0B40C((id)v14);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    sub_235E18890();
    __break(1u);
  }
}

uint64_t sub_235E0C014@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountUISettingSection();
  sub_235DF1B80(&qword_2563823F8, (uint64_t (*)(uint64_t))type metadata accessor for AccountUISettingSection, (uint64_t)&protocol conformance descriptor for AccountUISettingSection);
  swift_retain();
  result = sub_235E18854();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235E0C080@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E188A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235E0C0D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382650);
  sub_235E009C4(&qword_256382658, &qword_256382650, MEMORY[0x24BDF5428]);
  sub_235E0B854();
  return sub_235E18A04();
}

uint64_t sub_235E0C178@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v4 = a1;
    sub_235E187B8();

    swift_release();
    swift_release();
    if ((v10 & 1) != 0)
    {
      v5 = sub_235E188FC();
      type metadata accessor for AccountsUIModel(0);
      sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
      result = sub_235E188A8();
      v8 = 1;
      v9 = 1;
    }
    else
    {
      v5 = 0;
      v8 = 0;
      v7 = 0;
      v9 = 0;
      result = 1;
    }
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = result;
    *(_QWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 40) = 0;
    *(_BYTE *)(a2 + 48) = v9;
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t DeleteButtonView.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E188A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235E0C300@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_235E0C178(*v1, a1);
}

uint64_t DeleteButtonView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  BOOL v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382310);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382318);
  v9 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  sub_235E18BB4();
  if (v12)
  {
    v13 = sub_235DEF9A0();
    KeyPath = swift_getKeyPath();
    v15 = swift_allocObject();
    *(_BYTE *)(v15 + 16) = !v13;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
    v16 = (uint64_t *)&v8[*(int *)(v6 + 36)];
    *v16 = KeyPath;
    v16[1] = (uint64_t)sub_235E118A0;
    v16[2] = v15;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_235DEFAD4();
    v22 = v17;
    v23 = v18;
    sub_235E118B8();
    sub_235DF807C();
    sub_235E18AA0();
    swift_bridgeObjectRelease();
    sub_235DF0DA4((uint64_t)v8, &qword_256382310);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21, v11, v20);
  }
  else
  {
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

void sub_235E0C554(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = (void *)sub_235E18D10();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

  if (v3)
  {
    v4 = (void *)sub_235E18D10();
    v5 = (void *)sub_235E18D10();
    v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, 0);

    sub_235E18D40();
    sub_235DF807C();
    *(_QWORD *)a1 = sub_235E18A40();
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = v8 & 1;
    *(_QWORD *)(a1 + 24) = v9;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235E0C6A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
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
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v25 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563823B8);
  v3 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563823C0);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563823C8);
  v8 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_beginAccess();
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    MEMORY[0x24BDAC7A8](v11);
    v29 = v13;
    v30 = v12;
    sub_235DF807C();
    swift_bridgeObjectRetain_n();
    v29 = sub_235E18A40();
    v30 = v14;
    v31 = v15 & 1;
    v32 = v16;
    swift_beginAccess();
    if (*(_QWORD *)(a1 + 56))
    {
      v27 = *(_QWORD *)(a1 + 56);
      v28 = 0;
      swift_retain();
    }
    else
    {
      v27 = 0;
      v28 = 1;
    }
    sub_235E18980();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563823D0);
    sub_235E120E4();
    v17 = MEMORY[0x24BDF5138];
    sub_235E12128(&qword_2563823E0, &qword_2563823D0, MEMORY[0x24BDF5138], MEMORY[0x24BDEF3E0]);
    v18 = MEMORY[0x24BDF1F80];
    sub_235E18C50();
    swift_bridgeObjectRelease();
    v19 = v24;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v7, v10, v24);
    swift_storeEnumTagMultiPayload();
    sub_235E1218C(&qword_2563823E8, &qword_2563823C8, v18);
    sub_235E1218C(&qword_2563823F0, &qword_2563823B8, v17);
    sub_235E18980();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v11);
    swift_beginAccess();
    if (*(_QWORD *)(a1 + 56))
    {
      v33 = *(_QWORD *)(a1 + 56);
      v34 = 0;
      swift_retain();
    }
    else
    {
      v33 = 0;
      v34 = 1;
    }
    sub_235E18980();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563823D0);
    sub_235E120E4();
    v21 = MEMORY[0x24BDF5138];
    sub_235E12128(&qword_2563823E0, &qword_2563823D0, MEMORY[0x24BDF5138], MEMORY[0x24BDEF3E0]);
    sub_235E18C68();
    v22 = v26;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v7, v5, v26);
    swift_storeEnumTagMultiPayload();
    sub_235E1218C(&qword_2563823E8, &qword_2563823C8, MEMORY[0x24BDF1F80]);
    sub_235E1218C(&qword_2563823F0, &qword_2563823B8, v21);
    sub_235E18980();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  }
}

__n128 sub_235E0CB38@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __n128 result;
  __n128 v9;
  unint64_t v10;

  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  swift_retain();
  v2 = sub_235E188A8();
  v4 = v3;
  type metadata accessor for AccountUISettingSection();
  sub_235DF1B80(&qword_2563823F8, (uint64_t (*)(uint64_t))type metadata accessor for AccountUISettingSection, (uint64_t)&protocol conformance descriptor for AccountUISettingSection);
  v5 = sub_235E18854();
  v7 = v6;
  sub_235E18B78();
  result = v9;
  a1->n128_u64[0] = v2;
  a1->n128_u64[1] = v4;
  a1[1].n128_u64[0] = v5;
  a1[1].n128_u64[1] = v7;
  a1[2] = v9;
  a1[3].n128_u64[0] = v10;
  return result;
}

uint64_t sub_235E0CC2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E0C6A0(*(_QWORD *)(v1 + 8), a1);
}

void sub_235E0CC34(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;

  v50 = a2;
  v68 = a3;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825E8);
  MEMORY[0x24BDAC7A8](v51);
  v54 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825B8);
  MEMORY[0x24BDAC7A8](v64);
  v56 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825D8);
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v37 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825C0);
  MEMORY[0x24BDAC7A8](v49);
  v40 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825F0);
  v44 = *(_QWORD *)(v55 - 8);
  v8 = MEMORY[0x24BDAC7A8](v55);
  v36 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)v28 - v10;
  v11 = sub_235E186C8();
  MEMORY[0x24BDAC7A8](v11);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825F8);
  MEMORY[0x24BDAC7A8](v29);
  v28[4] = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822B8);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v32 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822C0);
  MEMORY[0x24BDAC7A8](v52);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822C8);
  v42 = *(_QWORD *)(v57 - 8);
  v14 = MEMORY[0x24BDAC7A8](v57);
  v31 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v41 = (char *)v28 - v16;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382600);
  MEMORY[0x24BDAC7A8](v60);
  v62 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382608);
  MEMORY[0x24BDAC7A8](v47);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563825A8);
  MEMORY[0x24BDAC7A8](v61);
  v53 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382598);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822D0);
  MEMORY[0x24BDAC7A8](v30);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382610);
  MEMORY[0x24BDAC7A8](v20);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382578);
  MEMORY[0x24BDAC7A8](v46);
  v35 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382618);
  MEMORY[0x24BDAC7A8](v45);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382560);
  MEMORY[0x24BDAC7A8](v59);
  v48 = (char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382620);
  MEMORY[0x24BDAC7A8](v65);
  v66 = (char *)v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382628);
  MEMORY[0x24BDAC7A8](v58);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382530);
  MEMORY[0x24BDAC7A8](v24);
  v25 = a1[3];
  v71 = a1[2];
  v72 = v25;
  *(_OWORD *)(v26 + 57) = *(__int128 *)((char *)a1 + 57);
  v27 = a1[1];
  v69 = *a1;
  v70 = v27;
  __asm { BR              X10 }
}

uint64_t sub_235E0D2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char v17;
  __int128 v18;

  v9 = v4;
  v11 = v5;
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  swift_retain_n();
  v13 = (void *)sub_235E188A8();
  *(_QWORD *)(v8 - 288) = v9 & 0x10101010101;
  *(_QWORD *)(v8 - 280) = v7;
  *(_QWORD *)(v8 - 272) = 0;
  *(_QWORD *)(v8 - 264) = v13;
  *(_QWORD *)(v8 - 256) = v14;
  *(_BYTE *)(v8 - 248) = 0;
  sub_235E12BFC();
  sub_235E12C40();
  swift_retain();
  v15 = v13;
  sub_235E18980();
  v16 = *(_QWORD *)(v8 - 208);
  v17 = *(_BYTE *)(v8 - 200);
  v18 = *(_OWORD *)(v8 - 224);
  *(_OWORD *)v6 = *(_OWORD *)(v8 - 240);
  *(_OWORD *)(v6 + 16) = v18;
  *(_QWORD *)(v6 + 32) = v16;
  *(_BYTE *)(v6 + 40) = v17;
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382540);
  sub_235E12BD8();
  sub_235E12C84();
  sub_235E18980();
  sub_235E00290(v11, *(_QWORD *)(v8 - 312), &qword_256382530);
  swift_storeEnumTagMultiPayload();
  sub_235E12BB4();
  sub_235E12DB4();
  sub_235E18980();
  sub_235E0B2A8((void *)v9, v7, a3, a4, 0);
  sub_235DF0DA4(v11, &qword_256382530);

  return swift_release();
}

uint64_t DetailsHeader.init(detailsConfig:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = *((_QWORD *)a1 + 1);
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E188A8();
  *(_BYTE *)a2 = v3;
  *(_BYTE *)(a2 + 1) = v4;
  *(_BYTE *)(a2 + 2) = v5;
  *(_BYTE *)(a2 + 3) = v6;
  *(_BYTE *)(a2 + 4) = v7;
  *(_BYTE *)(a2 + 5) = v8;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = result;
  *(_QWORD *)(a2 + 32) = v11;
  return result;
}

uint64_t sub_235E0EAA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382640);
  MEMORY[0x23B7E2124](&v7, v2);
  sub_235DF807C();
  result = sub_235E18A40();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_235E0EB1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_235DF807C();
  swift_bridgeObjectRetain();
  result = sub_235E18A40();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_235E0EB84()
{
  __int128 *v0;
  __int128 v1;
  uint64_t v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v1 = v0[1];
  v5 = *v0;
  v6 = v1;
  v7 = v0[2];
  v8 = *((_QWORD *)v0 + 6);
  swift_beginAccess();
  v2 = swift_allocObject();
  v3 = v6;
  *(_OWORD *)(v2 + 16) = v5;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = v7;
  *(_QWORD *)(v2 + 64) = v8;
  swift_bridgeObjectRetain();
  sub_235E12B68((void **)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382508);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382510);
  sub_235E009C4(&qword_256382518, &qword_256382508, MEMORY[0x24BEE12D8]);
  sub_235E06F48(&qword_256382520, &qword_256382510, sub_235E12BB4, sub_235E12DB4);
  sub_235E12FD4();
  return sub_235E18C38();
}

uint64_t sub_235E0ECD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t OpaqueTypeConformance2;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char *v107;
  char *v108;
  uint64_t v109;
  BOOL v110;
  uint64_t KeyPath;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t result;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  void (**v127)(char *, char *, uint64_t);
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  __int128 v153;
  char v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  char v159;

  v2 = v1;
  v150 = a1;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563822B8);
  v129 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132);
  v4 = (char *)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382688);
  v134 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v133 = (char *)&v119 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382690);
  v137 = *(_QWORD *)(v139 - 8);
  MEMORY[0x24BDAC7A8](v139);
  v136 = (char *)&v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382698);
  v141 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v140 = (char *)&v119 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826A0);
  MEMORY[0x24BDAC7A8](v138);
  v142 = (uint64_t)&v119 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826A8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (void (**)(char *, char *, uint64_t))((char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826B0);
  v13 = MEMORY[0x24BDAC7A8](v149);
  v15 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v119 - v16;
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826B8);
  MEMORY[0x24BDAC7A8](v147);
  v148 = (uint64_t)&v119 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_235E1886C();
  v144 = *(_QWORD *)(v19 - 8);
  v145 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v143 = (char *)&v119 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826C0);
  v120 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v119 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826C8);
  v121 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v25 = (char *)&v119 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826D0);
  v124 = *(_QWORD *)(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v123 = (char *)&v119 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826D8);
  v127 = *(void (***)(char *, char *, uint64_t))(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v126 = (char *)&v119 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826E0);
  MEMORY[0x24BDAC7A8](v130);
  v131 = (char *)&v119 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563826E8);
  v29 = MEMORY[0x24BDAC7A8](v146);
  MEMORY[0x24BDAC7A8](v29);
  v32 = *(_BYTE *)(v2 + 112);
  v33 = *(_QWORD *)(v2 + 104);
  v151 = *(_QWORD *)(v2 + 96);
  v152 = v33;
  if ((v32 & 1) != 0)
  {
    v141 = v31;
    v142 = (uint64_t)&v119 - v30;
    sub_235E18E0C();
    v81 = v152;
    swift_bridgeObjectRetain();
    sub_235E13564((void **)v2);
    v82 = sub_235E18E00();
    v83 = swift_allocObject();
    v84 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v83 + 16) = v82;
    *(_QWORD *)(v83 + 24) = v84;
    v85 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v83 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v83 + 112) = v85;
    *(_OWORD *)(v83 + 128) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v83 + 144) = *(_BYTE *)(v2 + 112);
    v86 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v83 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v83 + 48) = v86;
    v87 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v83 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v83 + 80) = v87;
    sub_235E13564((void **)v2);
    v88 = sub_235E18E00();
    v89 = swift_allocObject();
    *(_QWORD *)(v89 + 16) = v88;
    *(_QWORD *)(v89 + 24) = v84;
    v90 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v89 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v89 + 112) = v90;
    *(_OWORD *)(v89 + 128) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v89 + 144) = *(_BYTE *)(v2 + 112);
    v91 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v89 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v89 + 48) = v91;
    v92 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v89 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v89 + 80) = v92;
    sub_235E18C14();
    *(_QWORD *)&v155 = v151;
    *((_QWORD *)&v155 + 1) = v81;
    sub_235DF807C();
    sub_235E18830();
    v158 = *(_OWORD *)(v2 + 72);
    v159 = *(_BYTE *)(v2 + 88);
    v153 = *(_OWORD *)(v2 + 72);
    v154 = *(_BYTE *)(v2 + 88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563826F0);
    sub_235E1880C();
    v93 = sub_235E009C4(&qword_256382718, &qword_2563826C0, MEMORY[0x24BDEB760]);
    sub_235E18ADC();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v23, v21);
    v155 = v158;
    LOBYTE(v156) = v159;
    sub_235E18800();
    v94 = swift_allocObject();
    v95 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v94 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v94 + 96) = v95;
    *(_OWORD *)(v94 + 112) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v94 + 128) = *(_BYTE *)(v2 + 112);
    v96 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v94 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v94 + 32) = v96;
    v97 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v94 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v94 + 64) = v97;
    sub_235E13564((void **)v2);
    *(_QWORD *)&v155 = v21;
    *((_QWORD *)&v155 + 1) = v93;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v99 = MEMORY[0x24BEE1328];
    v100 = MEMORY[0x24BEE1340];
    v101 = v123;
    v102 = v122;
    sub_235E18AF4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v121 + 8))(v25, v102);
    v103 = swift_allocObject();
    v104 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v103 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v103 + 96) = v104;
    *(_OWORD *)(v103 + 112) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v103 + 128) = *(_BYTE *)(v2 + 112);
    v105 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v103 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v103 + 32) = v105;
    v106 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v103 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v103 + 64) = v106;
    sub_235E13564((void **)v2);
    v107 = v143;
    sub_235E18860();
    *(_QWORD *)&v155 = v102;
    *((_QWORD *)&v155 + 1) = v99;
    v156 = OpaqueTypeConformance2;
    v157 = v100;
    swift_getOpaqueTypeConformance2();
    v108 = v126;
    v109 = v125;
    sub_235E18B00();
    swift_release();
    (*(void (**)(char *, uint64_t))(v144 + 8))(v107, v145);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v101, v109);
    if (*(_QWORD *)v2)
    {
      v110 = sub_235DEF9A0();
      KeyPath = swift_getKeyPath();
      v112 = swift_allocObject();
      *(_BYTE *)(v112 + 16) = !v110;
      v113 = (uint64_t)v127;
      v114 = (uint64_t)v131;
      v115 = v128;
      v127[2](v131, v108, v128);
      v116 = (uint64_t *)(v114 + *(int *)(v130 + 36));
      *v116 = KeyPath;
      v116[1] = (uint64_t)sub_235E13B6C;
      v116[2] = v112;
      (*(void (**)(char *, uint64_t))(v113 + 8))(v108, v115);
      *(_QWORD *)&v155 = 0;
      *((_QWORD *)&v155 + 1) = 0xE000000000000000;
      sub_235E18F44();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v155 = 0x6554657275636553;
      *((_QWORD *)&v155 + 1) = 0xEF646C6569467478;
      swift_bridgeObjectRetain();
      sub_235E18D7C();
      swift_bridgeObjectRelease();
      sub_235E13868();
      v117 = v141;
      sub_235E18A94();
      swift_bridgeObjectRelease();
      sub_235DF0DA4(v114, &qword_2563826E0);
      v79 = &qword_2563826E8;
      v80 = v142;
      sub_235DF2A24(v117, v142, &qword_2563826E8);
      sub_235E00290(v80, v148, &qword_2563826E8);
      goto LABEL_6;
    }
  }
  else
  {
    v128 = (uint64_t)v15;
    v130 = v10;
    v127 = v12;
    v131 = v17;
    sub_235E18E0C();
    sub_235E13564((void **)v2);
    v34 = v7;
    v35 = v152;
    swift_bridgeObjectRetain();
    v36 = sub_235E18E00();
    v37 = swift_allocObject();
    v38 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v37 + 16) = v36;
    *(_QWORD *)(v37 + 24) = v38;
    v39 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v37 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v37 + 112) = v39;
    *(_OWORD *)(v37 + 128) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v37 + 144) = *(_BYTE *)(v2 + 112);
    v40 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v37 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v37 + 48) = v40;
    v41 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v37 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v37 + 80) = v41;
    sub_235E13564((void **)v2);
    v42 = sub_235E18E00();
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = v42;
    *(_QWORD *)(v43 + 24) = v38;
    v44 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v43 + 96) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v43 + 112) = v44;
    *(_OWORD *)(v43 + 128) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v43 + 144) = *(_BYTE *)(v2 + 112);
    v45 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v43 + 32) = *(_OWORD *)v2;
    *(_OWORD *)(v43 + 48) = v45;
    v46 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v43 + 64) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v43 + 80) = v46;
    sub_235E18C14();
    *(_QWORD *)&v155 = v151;
    *((_QWORD *)&v155 + 1) = v35;
    sub_235DF807C();
    sub_235E18C8C();
    v158 = *(_OWORD *)(v2 + 72);
    v159 = *(_BYTE *)(v2 + 88);
    v153 = *(_OWORD *)(v2 + 72);
    v154 = *(_BYTE *)(v2 + 88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563826F0);
    sub_235E1880C();
    v47 = sub_235E009C4(&qword_2563822E0, &qword_2563822B8, MEMORY[0x24BDF53E0]);
    v48 = v133;
    v49 = v132;
    sub_235E18ADC();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v129 + 8))(v4, v49);
    v155 = v158;
    LOBYTE(v156) = v159;
    sub_235E18800();
    v50 = swift_allocObject();
    v51 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v50 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v50 + 96) = v51;
    *(_OWORD *)(v50 + 112) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v50 + 128) = *(_BYTE *)(v2 + 112);
    v52 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v50 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v50 + 32) = v52;
    v53 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v50 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v50 + 64) = v53;
    sub_235E13564((void **)v2);
    *(_QWORD *)&v155 = v49;
    *((_QWORD *)&v155 + 1) = v47;
    v54 = swift_getOpaqueTypeConformance2();
    v55 = MEMORY[0x24BEE1328];
    v56 = MEMORY[0x24BEE1340];
    v57 = v136;
    v58 = v135;
    sub_235E18AF4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v48, v58);
    v59 = swift_allocObject();
    v60 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v59 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v59 + 96) = v60;
    *(_OWORD *)(v59 + 112) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v59 + 128) = *(_BYTE *)(v2 + 112);
    v61 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v59 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v59 + 32) = v61;
    v62 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v59 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v59 + 64) = v62;
    sub_235E13564((void **)v2);
    v63 = v143;
    sub_235E18860();
    *(_QWORD *)&v155 = v58;
    *((_QWORD *)&v155 + 1) = v55;
    v156 = v54;
    v157 = v56;
    swift_getOpaqueTypeConformance2();
    v64 = v140;
    v65 = v139;
    sub_235E18B00();
    swift_release();
    (*(void (**)(char *, uint64_t))(v144 + 8))(v63, v145);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v57, v65);
    v66 = swift_allocObject();
    v67 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v66 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v66 + 96) = v67;
    *(_OWORD *)(v66 + 112) = *(_OWORD *)(v2 + 96);
    *(_BYTE *)(v66 + 128) = *(_BYTE *)(v2 + 112);
    v68 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v66 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v66 + 32) = v68;
    v69 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v66 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v66 + 64) = v69;
    v70 = v141;
    v71 = v142;
    (*(void (**)(uint64_t, char *, uint64_t))(v141 + 16))(v142, v64, v34);
    v72 = (_QWORD *)(v71 + *(int *)(v138 + 36));
    *v72 = 0;
    v72[1] = 0;
    v72[2] = sub_235E13B64;
    v72[3] = v66;
    sub_235E13564((void **)v2);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v64, v34);
    if (*(_QWORD *)v2)
    {
      v73 = sub_235DEF9A0();
      v74 = swift_getKeyPath();
      v75 = swift_allocObject();
      *(_BYTE *)(v75 + 16) = !v73;
      v76 = (uint64_t)v127;
      sub_235E00290(v71, (uint64_t)v127, &qword_2563826A0);
      v77 = (uint64_t *)(v76 + *(int *)(v130 + 36));
      *v77 = v74;
      v77[1] = (uint64_t)sub_235E13B6C;
      v77[2] = v75;
      sub_235DF0DA4(v71, &qword_2563826A0);
      *(_QWORD *)&v155 = 0x6C65694674786554;
      *((_QWORD *)&v155 + 1) = 0xE900000000000064;
      swift_bridgeObjectRetain();
      sub_235E18D7C();
      swift_bridgeObjectRelease();
      sub_235E13640();
      v78 = v128;
      sub_235E18A94();
      swift_bridgeObjectRelease();
      sub_235DF0DA4(v76, &qword_2563826A8);
      v79 = &qword_2563826B0;
      v80 = (uint64_t)v131;
      sub_235DF2A24(v78, (uint64_t)v131, &qword_2563826B0);
      sub_235E00290(v80, v148, &qword_2563826B0);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      sub_235E137E4();
      sub_235E139A0();
      sub_235E18980();
      return sub_235DF0DA4(v80, v79);
    }
  }
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E18890();
  __break(1u);
  return result;
}

uint64_t sub_235E0FD2C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382640);
  return sub_235E18C08();
}

uint64_t sub_235E0FDA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
  sub_235E18B84();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382640);
  return sub_235E18C08();
}

_QWORD *sub_235E0FE1C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563826F0);
  sub_235E18800();
  if (LOBYTE(v5[0]) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
    result = (_QWORD *)sub_235E18B84();
  }
  else
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382640);
    result = MEMORY[0x23B7E2124](v5, v3);
  }
  v4 = v5[1];
  *a1 = v5[0];
  a1[1] = v4;
  return result;
}

uint64_t sub_235E0FED4()
{
  char v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563826F0);
  sub_235E18800();
  swift_bridgeObjectRetain();
  if (v1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381E40);
    return sub_235E18B90();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382640);
    return sub_235E18C08();
  }
}

uint64_t sub_235E0FFA4@<X0>(uint64_t a1@<X8>)
{
  return sub_235E0ECD0(a1);
}

uint64_t DetailsHeader.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382328);
  MEMORY[0x24BDAC7A8](v48);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_256382330);
  v45 = *(v5 - 1);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382338);
  v47 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v46 = (char *)&v40 - v11;
  v55 = *((_QWORD *)v1 + 4);
  v12 = v1[1];
  v53 = *v1;
  v54 = v12;
  v13 = (void *)*((_QWORD *)&v12 + 1);
  if (!*((_QWORD *)&v12 + 1))
    goto LABEL_9;
  swift_getKeyPath();
  swift_getKeyPath();
  v14 = v13;
  sub_235E187B8();

  swift_release();
  swift_release();
  v15 = v49;
  if (v49)
  {
    v16 = objc_msgSend(v49, sel_accountType);

    if (v16)
    {
      v17 = objc_msgSend(v16, sel_identifier);

      if (v17)
      {
        sub_235E18D40();

        v40 = (uint64_t)&v40;
        v19 = MEMORY[0x24BDAC7A8](v18);
        MEMORY[0x24BDAC7A8](v19);
        v41 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256382378);
        v42 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256382380);
        v43 = a1;
        sub_235E009C4(&qword_256382388, &qword_256382378, MEMORY[0x24BDF41A8]);
        sub_235E11AAC();
        sub_235E18824();
        swift_bridgeObjectRelease();
        sub_235E11954((uint64_t)&v53);
        type metadata accessor for AccountsUIModel(0);
        sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
        v20 = (void *)sub_235E18884();
        sub_235E11B28((uint64_t)&v53);
        swift_getKeyPath();
        sub_235E1889C();
        swift_release();

        v21 = swift_allocObject();
        v22 = v54;
        *(_OWORD *)(v21 + 16) = v53;
        *(_OWORD *)(v21 + 32) = v22;
        *(_QWORD *)(v21 + 48) = v55;
        sub_235E11954((uint64_t)&v53);
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382340);
        v38 = sub_235E009C4(&qword_256382348, &qword_256382330, MEMORY[0x24BDEB610]);
        v39 = sub_235E119A0();
        v24 = v44;
        v25 = v7;
        v26 = v41;
        sub_235E18AD0();
        swift_release();
        swift_release();
        swift_release();
        (*(void (**)(char *, void *))(v45 + 8))(v25, v26);
        v28 = v46;
        v27 = v47;
        v29 = v24;
        v30 = v42;
        (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v29, v42);
        (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v4, v28, v30);
        swift_storeEnumTagMultiPayload();
        v49 = v26;
        v50 = v23;
        v51 = v38;
        v52 = v39;
        swift_getOpaqueTypeConformance2();
        sub_235E18980();
        return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v28, v30);
      }
      goto LABEL_6;
    }
    __break(1u);
LABEL_9:
    sub_235E11954((uint64_t)&v53);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
    return result;
  }
LABEL_6:
  sub_235E18944();
  *(_QWORD *)v4 = sub_235E18A34();
  *((_QWORD *)v4 + 1) = v32;
  v4[16] = v33 & 1;
  *((_QWORD *)v4 + 3) = v34;
  swift_storeEnumTagMultiPayload();
  v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382340);
  v36 = sub_235E009C4(&qword_256382348, &qword_256382330, MEMORY[0x24BDEB610]);
  v37 = sub_235E119A0();
  v49 = v5;
  v50 = v35;
  v51 = v36;
  v52 = v37;
  swift_getOpaqueTypeConformance2();
  return sub_235E18980();
}

void sub_235E105E0(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  unsigned __int8 v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E28);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - v9;
  v24 = *(_OWORD *)a1;
  v25 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382468);
  sub_235E18B84();
  v11 = v26;
  swift_release();
  if (v11 != 1)
  {
    v23 = 1;
    goto LABEL_5;
  }
  v12 = (void *)sub_235E18D10();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v12);

  if (v13)
  {
    v14 = (void *)sub_235E18D10();
    v15 = (void *)sub_235E18D10();
    v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, v15, 0);

    v17 = sub_235E18D40();
    v19 = v18;

    *(_QWORD *)&v24 = v17;
    *((_QWORD *)&v24 + 1) = v19;
    v20 = swift_allocObject();
    v21 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v20 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v20 + 32) = v21;
    *(_QWORD *)(v20 + 48) = *(_QWORD *)(a1 + 32);
    sub_235E11954(a1);
    sub_235DF807C();
    sub_235E18BCC();
    v22 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v22(v10, v8, v4);
    v22(a2, v10, v4);
    v23 = 0;
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v23, 1, v4);
    return;
  }
  __break(1u);
}

uint64_t sub_235E1083C(uint64_t a1)
{
  void *v1;
  id v2;
  void (*v3)(uint64_t *, _QWORD);
  BOOL *v4;
  uint64_t result;
  uint64_t v6;

  v1 = *(void **)(a1 + 24);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    v3 = (void (*)(uint64_t *, _QWORD))sub_235E187AC();
    *v4 = !*v4;
    v3(&v6, 0);

    swift_release();
    return swift_release();
  }
  else
  {
    sub_235E11954(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
  }
  return result;
}

uint64_t sub_235E10924()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382478);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382480);
  sub_235E009C4(&qword_256382488, &qword_256382478, MEMORY[0x24BDF5428]);
  sub_235DFE174(&qword_256382490, &qword_256382480, (uint64_t (*)(void))sub_235E12458, MEMORY[0x24BDF5578]);
  return sub_235E18B6C();
}

uint64_t sub_235E109FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42[2];
  char v43;
  char v44;
  char v45;
  __int128 v46;

  v46 = *(_OWORD *)a1;
  *(_OWORD *)v42 = *(_OWORD *)a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382468);
  sub_235E18B84();
  swift_release();
  if (v44 != 1)
    goto LABEL_6;
  v8 = *(void **)(a1 + 24);
  if (!v8)
    goto LABEL_22;
  swift_getKeyPath();
  swift_getKeyPath();
  v9 = v8;
  sub_235E187B8();

  swift_release();
  swift_release();
  if (v42[0])
  {
    ACAccount.userFullName.getter();
    v11 = v10;

    if (v11)
    {
      sub_235DF807C();
      v11 = sub_235E18A40();
      v13 = v12;
      v15 = v14;
      v41 = v16 & 1;
      goto LABEL_8;
    }
  }
  else
  {
LABEL_6:
    v11 = 0;
  }
  v13 = 0;
  v41 = 0;
  v15 = 0;
LABEL_8:
  sub_235E18B84();
  swift_release();
  v40 = v15;
  v36 = a2;
  if (v45 != 1)
  {
LABEL_13:
    v19 = a3;
    v20 = v13;
    v21 = v11;
    goto LABEL_14;
  }
  v17 = *(void **)(a1 + 24);
  if (!v17)
  {
LABEL_22:
    sub_235E11954(a1);
    type metadata accessor for AccountsUIModel(0);
    sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
    result = sub_235E18890();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v18 = v17;
  sub_235E187B8();

  swift_release();
  swift_release();
  if (!(_QWORD)v46)
    goto LABEL_13;
  v19 = a3;
  v20 = v13;
  v21 = v11;
  v22 = objc_msgSend((id)v46, sel_username, v36);

  if (v22)
  {
    sub_235E18D40();

    sub_235DF807C();
    v23 = sub_235E18A40();
    v38 = v24;
    v39 = v23;
    v37 = v25;
    v27 = v26 & 1;
    goto LABEL_15;
  }
LABEL_14:
  v38 = 0;
  v39 = 0;
  v27 = 0;
  v37 = 0;
LABEL_15:
  sub_235E18B84();
  swift_release();
  if ((v44 & 1) != 0 || (sub_235E18B84(), swift_release(), (v45 & 1) != 0))
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 1;
  }
  else
  {
    sub_235E18B84();
    swift_release();
    if (v43 == 1)
    {
      _sSo13ACAccountTypeC18AccountsUISettingsE09localizedB4Name3forS2SSg_tFZ_0(v36, v19);
      sub_235DF807C();
      v28 = sub_235E18A40();
      v29 = v33;
      v31 = v34;
      v30 = v35 & 1;
    }
    else
    {
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = 0;
    }
  }
  *a4 = v21;
  a4[1] = v20;
  a4[2] = v41;
  a4[3] = v40;
  a4[4] = v39;
  a4[5] = v38;
  a4[6] = v27;
  a4[7] = v37;
  a4[8] = v28;
  a4[9] = v29;
  a4[10] = v30;
  a4[11] = v31;
  sub_235DFEC58(v21, v20, v41, v40);
  sub_235DFEC58(v39, v38, v27, v37);
  sub_235E124E8(v28, v29, v30, v31);
  sub_235E124F8(v28, v29, v30, v31);
  sub_235DFEC88(v39, v38, v27, v37);
  return sub_235DFEC88(v21, v20, v41, v40);
}

uint64_t sub_235E10E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55[8];

  v48 = a3;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381E78);
  v43 = *(_QWORD *)(v47 - 8);
  v7 = MEMORY[0x24BDAC7A8](v47);
  v41 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v42 = (char *)&v39 - v9;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563824B0);
  MEMORY[0x24BDAC7A8](v45);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_235E18CD4();
  v12 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235E18CEC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563824A0);
  v49 = *(_QWORD *)(v19 - 8);
  v50 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v46 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = *(_OWORD *)a1;
  v52 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382468);
  sub_235E18B84();
  v21 = v55[0];
  swift_release();
  if (v21 != 1)
  {
    v23 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(a4, v23, 1, v50);
  }
  v40 = a4;
  if (sub_235E18D40() == a2 && v22 == v48)
    goto LABEL_4;
  v24 = sub_235E19028();
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
    goto LABEL_7;
  if (sub_235E18D40() == a2 && v27 == v48)
  {
LABEL_4:
    swift_bridgeObjectRelease();
LABEL_7:
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE855F0], v44);
    sub_235E18CE0();
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v18, v15);
    swift_storeEnumTagMultiPayload();
    sub_235DF1B80(&qword_2563824A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85618], MEMORY[0x24BE85610]);
    swift_getOpaqueTypeConformance2();
    v25 = (uint64_t)v46;
    sub_235E18980();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    a4 = v40;
LABEL_8:
    sub_235DF2A24(v25, a4, &qword_2563824A0);
    v23 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(a4, v23, 1, v50);
  }
  v28 = sub_235E19028();
  swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    goto LABEL_7;
  v29 = *(void **)(a1 + 24);
  if (v29)
  {
    v30 = v29;
    v31 = v48;
    sub_235DEB670(a2, v48, &v51);

    v32 = v53;
    v33 = v54;
    __swift_project_boxed_opaque_existential_1(&v51, v53);
    v55[0] = 0;
    if ((*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(v33 + 48))(a2, v31, v55, v32, v33))
      sub_235E18B3C();
    else
      sub_235E18B48();
    a4 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
    v34 = v44;
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE855F0], v44);
    v35 = v41;
    sub_235E18B54();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v34);
    v37 = v42;
    v36 = v43;
    v38 = v47;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v35, v47);
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v11, v37, v38);
    swift_storeEnumTagMultiPayload();
    sub_235DF1B80(&qword_2563824A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85618], MEMORY[0x24BE85610]);
    swift_getOpaqueTypeConformance2();
    v25 = (uint64_t)v46;
    sub_235E18980();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
    goto LABEL_8;
  }
  sub_235E11954(a1);
  type metadata accessor for AccountsUIModel(0);
  sub_235DF1B80((unint64_t *)&qword_256381CA8, type metadata accessor for AccountsUIModel, (uint64_t)&protocol conformance descriptor for AccountsUIModel);
  result = sub_235E18890();
  __break(1u);
  return result;
}

uint64_t sub_235E113AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235E11428(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_235E187C4();
}

double sub_235E11494@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[26];
  _OWORD v19[6];
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];

  v29 = *a1;
  *(_QWORD *)&v30 = *((_QWORD *)a1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382468);
  sub_235E18B84();
  if (v28)
  {
    v3 = sub_235E18C74();
    sub_235E03780(0.0, 1, 0.0, 1, 480.0, 0, 0.0, 1, (uint64_t)&v29, 0.0, 1, 0.0, 1, v3, v4, v28);
    v12 = v29;
    LOBYTE(v13) = v30;
    *((_QWORD *)&v13 + 1) = *((_QWORD *)&v30 + 1);
    LOBYTE(v14) = v31;
    *((_QWORD *)&v14 + 1) = *((_QWORD *)&v31 + 1);
    LOBYTE(v15) = v32;
    *((_QWORD *)&v15 + 1) = *((_QWORD *)&v32 + 1);
    LOBYTE(v16) = v33;
    *((_QWORD *)&v16 + 1) = *((_QWORD *)&v33 + 1);
    LOBYTE(v17) = v34;
    *((_QWORD *)&v17 + 1) = *((_QWORD *)&v34 + 1);
    v18[0] = v35[0];
    *(_OWORD *)&v18[8] = *(_OWORD *)((char *)v35 + 8);
    *(_WORD *)&v18[24] = 257;
    v23 = v14;
    v24 = v15;
    v21 = v29;
    v22 = v13;
    *(_OWORD *)((char *)v27 + 10) = *(_OWORD *)&v18[10];
    v26 = v17;
    v27[0] = *(_OWORD *)v18;
    v25 = v16;
    sub_235E12438((uint64_t)&v21);
    sub_235DF2A24((uint64_t)&v21, (uint64_t)&v29, &qword_256382470);
    swift_retain();
    sub_235E003B8((uint64_t)&v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382360);
    sub_235E11A0C();
    sub_235E18980();
    swift_release_n();
    swift_release();
    v33 = v19[4];
    v34 = v19[5];
    v35[0] = v20[0];
    *(_OWORD *)((char *)v35 + 11) = *(_OWORD *)((char *)v20 + 11);
    v29 = v19[0];
    v30 = v19[1];
    v31 = v19[2];
    v32 = v19[3];
  }
  else
  {
    sub_235E18944();
    *(_QWORD *)&v21 = sub_235E18A34();
    *((_QWORD *)&v21 + 1) = v5;
    LOBYTE(v22) = v6 & 1;
    *((_QWORD *)&v22 + 1) = v7;
    sub_235E1242C((uint64_t)&v21);
    sub_235DF2A24((uint64_t)&v21, (uint64_t)v19, &qword_256382470);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256382360);
    sub_235E11A0C();
    sub_235E18980();
  }
  v8 = v34;
  a2[4] = v33;
  a2[5] = v8;
  a2[6] = v35[0];
  *(_OWORD *)((char *)a2 + 107) = *(_OWORD *)((char *)v35 + 11);
  v9 = v30;
  *a2 = v29;
  a2[1] = v9;
  result = *(double *)&v31;
  v11 = v32;
  a2[2] = v31;
  a2[3] = v11;
  return result;
}

uint64_t sub_235E1175C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_235E188E4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_235E11788()
{
  return sub_235E188F0();
}

_BYTE *sub_235E117AC(_BYTE *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_235E117C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382460);
  MEMORY[0x24BDAC7A8](v2);
  sub_235E00290(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256382460);
  return sub_235E188C0();
}

uint64_t sub_235E11840@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_235E188E4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_235E1186C()
{
  return sub_235E188F0();
}

uint64_t sub_235E11890()
{
  return swift_deallocObject();
}

_BYTE *sub_235E118A0(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_235E118B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382320;
  if (!qword_256382320)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382310);
    v2[0] = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382320);
  }
  return result;
}

uint64_t sub_235E11954(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_235E119A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382350;
  if (!qword_256382350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382340);
    v2[0] = sub_235E11A0C();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382350);
  }
  return result;
}

unint64_t sub_235E11A0C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256382358;
  if (!qword_256382358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382360);
    v2 = MEMORY[0x24BDED308];
    v3[0] = sub_235E12128(&qword_256382368, &qword_256382370, MEMORY[0x24BDEDBB8], MEMORY[0x24BDED308]);
    v3[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x23B7E291C](v2, v1, v3);
    atomic_store(result, (unint64_t *)&qword_256382358);
  }
  return result;
}

void sub_235E11A98(char *a1@<X8>)
{
  uint64_t v1;

  sub_235E105E0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_235E11AA0()
{
  return sub_235E10924();
}

unint64_t sub_235E11AAC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256382390;
  if (!qword_256382390)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382380);
    v2 = sub_235E009C4(&qword_256381E20, &qword_256381E28, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256382390);
  }
  return result;
}

uint64_t sub_235E11B28(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  swift_release();
  swift_release();

  return a1;
}

double sub_235E11B74@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_235E11494((__int128 *)(v1 + 16), a1);
}

uint64_t sub_235E11B7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E11B8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E11B9C()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for AccountSettingsDetailModelView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for AccountSettingsDetailModelView(uint64_t a1)
{

}

_QWORD *assignWithCopy for AccountSettingsDetailModelView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for AccountSettingsDetailModelView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

ValueMetadata *type metadata accessor for AccountSettingsDetailModelView()
{
  return &type metadata for AccountSettingsDetailModelView;
}

ValueMetadata *type metadata accessor for DeleteButtonView()
{
  return &type metadata for DeleteButtonView;
}

void destroy for DetailsHeader(uint64_t a1)
{
  swift_release();
  swift_release();

}

uint64_t initializeWithCopy for DetailsHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v5 = *(void **)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  v6 = v5;
  return a1;
}

uint64_t assignWithCopy for DetailsHeader(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(a1 + 3) = *(_BYTE *)(a2 + 3);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
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

uint64_t assignWithTake for DetailsHeader(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(a1 + 3) = *(_BYTE *)(a2 + 3);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetailsHeader(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DetailsHeader(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DetailsHeader()
{
  return &type metadata for DetailsHeader;
}

uint64_t sub_235E11F0C()
{
  return sub_235E009C4(&qword_256382398, &qword_2563823A0, MEMORY[0x24BDF1988]);
}

uint64_t sub_235E11F38()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382310);
  sub_235E118B8();
  sub_235DF807C();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_235E11F9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2563823A8;
  if (!qword_2563823A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563823B0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382330);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382340);
    v2[4] = sub_235E009C4(&qword_256382348, &qword_256382330, MEMORY[0x24BDEB610]);
    v2[5] = sub_235E119A0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563823A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountFooterView()
{
  return &type metadata for AccountFooterView;
}

ValueMetadata *type metadata accessor for SettingSectionWrapperView()
{
  return &type metadata for SettingSectionWrapperView;
}

ValueMetadata *type metadata accessor for DisabledSettingsIconLabel()
{
  return &type metadata for DisabledSettingsIconLabel;
}

uint64_t sub_235E1209C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E120AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E120BC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_235E120CC@<D0>(__n128 *a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_235E0CB38(a1).n128_u64[0];
  return result;
}

unint64_t sub_235E120E4()
{
  unint64_t result;

  result = qword_2563823D8;
  if (!qword_2563823D8)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1AF04, &type metadata for SettingSectionView);
    atomic_store(result, (unint64_t *)&qword_2563823D8);
  }
  return result;
}

uint64_t sub_235E12128(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = MEMORY[0x24BDF4760];
    v9[1] = a3;
    result = MEMORY[0x23B7E291C](a4, v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235E1218C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[3];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3;
    v7[1] = sub_235E120E4();
    v7[2] = sub_235E12128(&qword_2563823E0, &qword_2563823D0, MEMORY[0x24BDF5138], MEMORY[0x24BDEF3E0]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF4AF8], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235E12224@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E0B93C(*(void **)(v1 + 16), a1);
}

unint64_t sub_235E1222C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382408;
  if (!qword_256382408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382400);
    v2[0] = sub_235E122B0();
    v2[1] = sub_235E009C4(&qword_256382450, &qword_256382458, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382408);
  }
  return result;
}

unint64_t sub_235E122B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382410;
  if (!qword_256382410)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382418);
    v2[0] = sub_235E12334();
    v2[1] = sub_235E009C4(&qword_256382440, &qword_256382448, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382410);
  }
  return result;
}

unint64_t sub_235E12334()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256382420;
  if (!qword_256382420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382428);
    v2 = sub_235E009C4(&qword_256382430, &qword_256382438, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256382420);
  }
  return result;
}

uint64_t sub_235E123B8()
{
  return sub_235E188B4();
}

uint64_t sub_235E123DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235E188CC();
  *a1 = result;
  return result;
}

uint64_t sub_235E12404()
{
  swift_retain();
  return sub_235E188D8();
}

uint64_t sub_235E1242C(uint64_t result)
{
  *(_BYTE *)(result + 122) = 1;
  return result;
}

uint64_t sub_235E12438(uint64_t result)
{
  *(_BYTE *)(result + 122) = 0;
  return result;
}

uint64_t sub_235E12440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_235E109FC(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_235E1244C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235E10E54(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_235E12458()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382498;
  if (!qword_256382498)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563824A0);
    v2[0] = sub_235DF1B80(&qword_2563824A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE85618], MEMORY[0x24BE85610]);
    v2[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382498);
  }
  return result;
}

uint64_t sub_235E124E8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_235DFEC58(result, a2, a3, a4);
  return result;
}

uint64_t sub_235E124F8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1)
    return sub_235DFEC88(result, a2, a3, a4);
  return result;
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235E12540()
{
  uint64_t v0;

  return sub_235E1083C(v0 + 16);
}

uint64_t destroy for AccountSettingsDetailView(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s18AccountsUISettings25AccountSettingsDetailViewVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountSettingsDetailView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AccountSettingsDetailView(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountSettingsDetailView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountSettingsDetailView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountSettingsDetailView()
{
  return &type metadata for AccountSettingsDetailView;
}

uint64_t destroy for SettingSectionView(id *a1)
{

  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SettingSectionView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SettingSectionView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
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

uint64_t assignWithTake for SettingSectionView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingSectionView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingSectionView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingSectionView()
{
  return &type metadata for SettingSectionView;
}

unint64_t sub_235E12974()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563824C8;
  if (!qword_2563824C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563824D0);
    v2[0] = sub_235E1218C(&qword_2563823E8, &qword_2563823C8, MEMORY[0x24BDF1F80]);
    v2[1] = sub_235E1218C(&qword_2563823F0, &qword_2563823B8, MEMORY[0x24BDF5138]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563824C8);
  }
  return result;
}

unint64_t sub_235E12A14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2563824D8;
  if (!qword_2563824D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563824E0);
    v2 = sub_235E009C4(&qword_2563824E8, &qword_2563824F0, MEMORY[0x24BDF4498]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2563824D8);
  }
  return result;
}

unint64_t sub_235E12A94()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_2563824F8;
  if (!qword_2563824F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382500);
    v2 = sub_235E1222C();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2563824F8);
  }
  return result;
}

uint64_t sub_235E12B04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E12B14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E12B24()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_235E12B60(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_235E0CC34(a1, v2 + 16, a2);
}

void **sub_235E12B68(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_retain();
  v3 = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235E12BB4()
{
  return sub_235E06F48(&qword_256382528, &qword_256382530, sub_235E12BD8, sub_235E12C84);
}

uint64_t sub_235E12BD8()
{
  return sub_235E06F48(&qword_256382538, &qword_256382540, (uint64_t (*)(void))sub_235E12BFC, (uint64_t (*)(void))sub_235E12C40);
}

unint64_t sub_235E12BFC()
{
  unint64_t result;

  result = qword_256382548;
  if (!qword_256382548)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for DetailsHeader, &type metadata for DetailsHeader);
    atomic_store(result, (unint64_t *)&qword_256382548);
  }
  return result;
}

unint64_t sub_235E12C40()
{
  unint64_t result;

  result = qword_256382550;
  if (!qword_256382550)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1A304, &type metadata for DataclassTable);
    atomic_store(result, (unint64_t *)&qword_256382550);
  }
  return result;
}

uint64_t sub_235E12C84()
{
  return sub_235E06F48(&qword_256382558, &qword_256382560, (uint64_t (*)(void))sub_235E12CA8, (uint64_t (*)(void))sub_235E12CEC);
}

unint64_t sub_235E12CA8()
{
  unint64_t result;

  result = qword_256382568;
  if (!qword_256382568)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1A2B4, &type metadata for CustomDataclassTable);
    atomic_store(result, (unint64_t *)&qword_256382568);
  }
  return result;
}

unint64_t sub_235E12CEC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382570;
  if (!qword_256382570)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382578);
    v2[0] = sub_235E12D70();
    v2[1] = sub_235E009C4(&qword_256382588, &qword_2563822D0, MEMORY[0x24BDEB610]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382570);
  }
  return result;
}

unint64_t sub_235E12D70()
{
  unint64_t result;

  result = qword_256382580;
  if (!qword_256382580)
  {
    result = MEMORY[0x23B7E291C](&unk_235E1AF74, &type metadata for DelayedTextField);
    atomic_store(result, (unint64_t *)&qword_256382580);
  }
  return result;
}

uint64_t sub_235E12DB4()
{
  return sub_235E06F48(&qword_256382590, &qword_256382598, (uint64_t (*)(void))sub_235E12DD8, (uint64_t (*)(void))sub_235E12E88);
}

unint64_t sub_235E12DD8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[6];

  result = qword_2563825A0;
  if (!qword_2563825A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563825A8);
    v2 = sub_235E12D70();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563822C0);
    v4 = sub_235E0B460();
    v5 = sub_235DF807C();
    v6[2] = v3;
    v6[3] = MEMORY[0x24BEE0D00];
    v6[4] = v4;
    v6[5] = v5;
    v6[0] = v2;
    v6[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2563825A0);
  }
  return result;
}

unint64_t sub_235E12E88()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[6];

  result = qword_2563825B0;
  if (!qword_2563825B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563825B8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563825C0);
    v3 = sub_235E12F38();
    v4 = sub_235DF807C();
    v5[2] = v2;
    v5[3] = MEMORY[0x24BEE0D00];
    v5[4] = v3;
    v5[5] = v4;
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2563825B0);
  }
  return result;
}

unint64_t sub_235E12F38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563825C8;
  if (!qword_2563825C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563825C0);
    v2[0] = sub_235E009C4(&qword_2563825D0, &qword_2563825D8, MEMORY[0x24BDF46D0]);
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563825C8);
  }
  return result;
}

unint64_t sub_235E12FD4()
{
  unint64_t result;

  result = qword_2563825E0;
  if (!qword_2563825E0)
  {
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountUISetting, &type metadata for AccountUISetting);
    atomic_store(result, (unint64_t *)&qword_2563825E0);
  }
  return result;
}

uint64_t sub_235E13018(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235E13040()
{
  return swift_deallocObject();
}

unint64_t sub_235E13050()
{
  unint64_t result;

  result = qword_256382630;
  if (!qword_256382630)
  {
    result = MEMORY[0x23B7E291C](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256382630);
  }
  return result;
}

uint64_t sub_235E13094()
{
  return swift_deallocObject();
}

uint64_t sub_235E130A4@<X0>(uint64_t a1@<X8>)
{
  return sub_235E0EAA8(a1);
}

uint64_t sub_235E130B0@<X0>(uint64_t a1@<X8>)
{
  return sub_235E0EB1C(a1);
}

void sub_235E130B8(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_235E0BDD0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), a1);
}

uint64_t destroy for DelayedTextField(id *a1)
{

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedTextField(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v9 = v3;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DelayedTextField(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy113_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_BYTE *)(a1 + 112) = *((_BYTE *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for DelayedTextField(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedTextField(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 113))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DelayedTextField(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 112) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 113) = 1;
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
    *(_BYTE *)(result + 113) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedTextField()
{
  return &type metadata for DelayedTextField;
}

unint64_t sub_235E134A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256382668;
  if (!qword_256382668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382670);
    v2 = sub_235E06F48(&qword_256382520, &qword_256382510, sub_235E12BB4, sub_235E12DB4);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256382668);
  }
  return result;
}

uint64_t sub_235E13528()
{
  return sub_235E009C4(&qword_256382678, &qword_256382680, MEMORY[0x24BDF1988]);
}

uint64_t sub_235E13554()
{
  return swift_getOpaqueTypeConformance2();
}

void **sub_235E13564(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_retain();
  swift_bridgeObjectRetain();
  v3 = v2;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_235E135F0@<X0>(_QWORD *a1@<X8>)
{
  return sub_235E0FE1C(a1);
}

uint64_t sub_235E13600()
{
  return sub_235E0FED4();
}

uint64_t sub_235E13610()
{
  return sub_235E0FD2C();
}

uint64_t sub_235E13630()
{
  return swift_deallocObject();
}

unint64_t sub_235E13640()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563826F8;
  if (!qword_2563826F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826A8);
    v2[0] = sub_235E136C4();
    v2[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563826F8);
  }
  return result;
}

unint64_t sub_235E136C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = qword_256382700;
  if (!qword_256382700)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826A0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382690);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256382688);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563822B8);
    sub_235E009C4(&qword_2563822E0, &qword_2563822B8, MEMORY[0x24BDF53E0]);
    v3[4] = swift_getOpaqueTypeConformance2();
    v3[5] = MEMORY[0x24BEE1340];
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256382700);
  }
  return result;
}

unint64_t sub_235E137E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382708;
  if (!qword_256382708)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826E8);
    v2[0] = sub_235E13868();
    v2[1] = sub_235DF1B80(&qword_256382720, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382708);
  }
  return result;
}

unint64_t sub_235E13868()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = qword_256382710;
  if (!qword_256382710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826E0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826D0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826C0);
    sub_235E009C4(&qword_256382718, &qword_2563826C0, MEMORY[0x24BDEB760]);
    v3[4] = swift_getOpaqueTypeConformance2();
    v3[5] = MEMORY[0x24BEE1340];
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = sub_235E009C4(&qword_256381DF0, &qword_256381DF8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256382710);
  }
  return result;
}

unint64_t sub_235E139A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256382728;
  if (!qword_256382728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563826B0);
    v2[0] = sub_235E13640();
    v2[1] = sub_235DF1B80(&qword_256382720, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7E291C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256382728);
  }
  return result;
}

uint64_t objectdestroy_60Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_66Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235E13AF4()
{
  return sub_235E0FDA4();
}

uint64_t sub_235E13B0C()
{
  return swift_deallocObject();
}

uint64_t sub_235E13B1C()
{
  return sub_235E06F48(&qword_256382730, &qword_256382738, (uint64_t (*)(void))sub_235E137E4, (uint64_t (*)(void))sub_235E139A0);
}

uint64_t AccountUISetting.CustomDataclass.__allocating_init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, unsigned __int8 a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19;

  v19 = swift_allocObject();
  AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
  return v19;
}

uint64_t sub_235E13C40(uint64_t a1, unsigned __int8 *a2, uint64_t *a3, void (*a4)(uint64_t, uint64_t, uint64_t (*)(char a1), uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *a2;
  v8 = *a3;
  v7 = a3[1];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v7;
  swift_retain();
  a4(a1, v6, sub_235E185EC, v9);
  return swift_release();
}

uint64_t AccountUISetting.DetailsConfiguration.init(iconShown:logoShown:serviceNameShown:fullNameShown:usernameShown:detailsButtonShown:detailsView:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_BYTE *)a8 = result;
  *(_BYTE *)(a8 + 1) = a2;
  *(_BYTE *)(a8 + 2) = a3;
  *(_BYTE *)(a8 + 3) = a4;
  *(_BYTE *)(a8 + 4) = a5;
  *(_BYTE *)(a8 + 5) = a6;
  *(_QWORD *)(a8 + 8) = a7;
  return result;
}

__n128 AccountUISetting.init(id:type:label:editable:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  char v7;
  __n128 result;
  __int128 v9;

  v7 = *(_BYTE *)(a3 + 32);
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  result = *(__n128 *)a3;
  v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a7 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(a7 + 32) = v9;
  *(_BYTE *)(a7 + 48) = v7;
  *(_QWORD *)(a7 + 56) = a4;
  *(_QWORD *)(a7 + 64) = a5;
  *(_BYTE *)(a7 + 72) = a6;
  return result;
}

_QWORD *AccountUISettingSection.__allocating_init(id:settings:title:footer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;

  v12 = (_QWORD *)swift_allocObject();
  v12[6] = 0;
  v12[7] = 0;
  v12[5] = 0;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  swift_beginAccess();
  v12[5] = a4;
  v12[6] = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v12[7] = a6;
  swift_release();
  return v12;
}

uint64_t sub_235E13DD4()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t AccountsUISettingsPlugin.supportedAccountTypes.getter()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_235E13DEC()
{
  return 0;
}

uint64_t AccountsUISettingsPlugin.detailModel(for:)()
{
  return 0;
}

uint64_t AccountsUISettingsPlugin.topLevelView(for:)()
{
  return 0;
}

UIImage_optional __swiftcall AccountsUISettingsPlugin.image(_:iconType:)(Swift::String _, AccountsUISettings::AccountsTypes::IconType iconType)
{
  _._countAndFlagsBits = 0;
  return *(UIImage_optional *)&_._countAndFlagsBits;
}

UIImage_optional __swiftcall AccountsUISettingsPlugin.dataclassImage(for:)(Swift::String a1)
{
  a1._countAndFlagsBits = 0;
  return *(UIImage_optional *)&a1._countAndFlagsBits;
}

uint64_t AccountUISetting.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountUISetting.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AccountUISetting.id.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.iconShown.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AccountUISetting.DetailsConfiguration.iconShown.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.iconShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.logoShown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t AccountUISetting.DetailsConfiguration.logoShown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.logoShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.serviceNameShown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t AccountUISetting.DetailsConfiguration.serviceNameShown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.serviceNameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.fullNameShown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t AccountUISetting.DetailsConfiguration.fullNameShown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 3) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.fullNameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.usernameShown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t AccountUISetting.DetailsConfiguration.usernameShown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 4) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.usernameShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.detailsButtonShown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t AccountUISetting.DetailsConfiguration.detailsButtonShown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 5) = result;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.detailsButtonShown.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.DetailsConfiguration.detailsView.getter()
{
  return swift_retain();
}

uint64_t AccountUISetting.DetailsConfiguration.detailsView.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AccountUISetting.DetailsConfiguration.detailsView.modify())()
{
  return nullsub_1;
}

_QWORD *AccountUISetting.CustomDataclass.init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, uint64_t a14, unsigned __int8 a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void **v29;
  char *v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;

  v19 = (_QWORD *)v18;
  v46 = a8;
  v45 = a7;
  v47 = a6;
  v48 = a5;
  v43 = a4;
  v42 = a2;
  v41 = a1;
  v56 = a17;
  v57 = a18;
  v55 = a16;
  v54 = a15;
  v52 = a13;
  v53 = a14;
  v51 = a12;
  v49 = a10;
  v50 = a11;
  v44 = a9;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382740);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C170);
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v18 + 56) = 0;
  v29 = (void **)(v18 + 56);
  v30 = (char *)v19 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  *(_QWORD *)&v62 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C210);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v30, v28, v25);
  v31 = (char *)v19 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  v62 = 0u;
  v63 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256382758);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v31, v24, v21);
  v32 = (_QWORD *)((char *)v19
                 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  *v32 = 0;
  v32[1] = 0;
  v33 = v42;
  v19[2] = v41;
  v19[3] = v33;
  v34 = v43;
  v19[4] = a3;
  v19[5] = v34;
  v19[6] = v48;
  swift_beginAccess();
  v35 = *v29;
  v36 = v47;
  *v29 = v47;
  v48 = a3;
  v47 = v36;

  swift_beginAccess();
  v58 = v45;
  v59 = v46;
  v60 = v44;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381EE8);
  sub_235E18788();
  swift_endAccess();
  swift_beginAccess();
  v58 = v49;
  v59 = v50;
  v60 = v51;
  swift_retain();
  swift_retain();
  sub_235E18788();
  swift_endAccess();
  swift_beginAccess();
  v58 = v52;
  v59 = v53;
  v60 = v54;
  swift_retain();
  swift_retain();
  sub_235E18788();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  v61 = v55;
  swift_retain();
  sub_235E187C4();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_beginAccess();
  v37 = *v32;
  v38 = v57;
  *v32 = v56;
  v32[1] = v38;
  sub_235E003A8(v37);
  return v19;
}

uint64_t sub_235E14398()
{
  return sub_235E143D4();
}

uint64_t sub_235E143AC()
{
  return sub_235E143D4();
}

uint64_t sub_235E143C0()
{
  return sub_235E143D4();
}

uint64_t sub_235E143D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235E14450()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235E144BC()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_beginAccess();
  sub_235E18D40();
  swift_bridgeObjectRetain();
  sub_235E18D7C();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t (*sub_235E1455C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_235E14598(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;
  v5 = v2;

}

id sub_235E145EC()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 32);
}

void sub_235E1461C(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

uint64_t (*sub_235E14660())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_235E1469C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 40) = v3;
  *(_QWORD *)(v4 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E146F8()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235E14740(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_235E14790())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_235E147CC(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;
  v5 = v2;

}

void *sub_235E14820()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  v1 = *(void **)(v0 + 56);
  v2 = v1;
  return v1;
}

void sub_235E14860(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = a1;

}

uint64_t (*sub_235E148A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235E148E0@<X0>(uint64_t a1@<X8>)
{
  return sub_235E14C4C(a1);
}

uint64_t sub_235E148F4()
{
  return sub_235E14CE0();
}

uint64_t sub_235E14908()
{
  return sub_235E14D80();
}

uint64_t (*sub_235E1491C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E14994()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_256382778);
}

uint64_t sub_235E149A8(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_256382778);
}

uint64_t (*sub_235E149C4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382780);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256382778);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235E14A8C@<X0>(uint64_t a1@<X8>)
{
  return sub_235E14C4C(a1);
}

uint64_t sub_235E14AA0()
{
  return sub_235E14CE0();
}

uint64_t sub_235E14AB4()
{
  return sub_235E14D80();
}

uint64_t (*sub_235E14AC8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E14B40()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_256382778);
}

uint64_t sub_235E14B54(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_256382778);
}

uint64_t (*sub_235E14B70(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382780);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256382778);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235E14C38@<X0>(uint64_t a1@<X8>)
{
  return sub_235E14C4C(a1);
}

uint64_t sub_235E14C4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  char v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_235E14CCC()
{
  return sub_235E14CE0();
}

uint64_t sub_235E14CE0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235E14D6C()
{
  return sub_235E14D80();
}

uint64_t sub_235E14D80()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t (*sub_235E14DEC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E14E64()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_256382778);
}

uint64_t sub_235E14E78(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_256382778);
}

uint64_t (*sub_235E14E94(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382780);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256382778);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235E14F5C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235E14FD8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235E15050()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t (*sub_235E150C0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E15138()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_25429C170);
}

uint64_t sub_235E1514C(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256382788, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_25429C170);
}

uint64_t (*sub_235E15168(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382788);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C170);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

double sub_235E15230@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_235E152AC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235DFEC58(v1, v2, v3, v4);
  swift_retain();
  return sub_235E187C4();
}

uint64_t sub_235E15348()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235E153BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235E187C4();
}

uint64_t (*sub_235E15448(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E154C0()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_256382740);
}

uint64_t sub_235E154D4(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_256382790, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_256382740);
}

uint64_t (*sub_235E154F0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382790);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256382740);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235E155B8@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, unsigned __int8 *, uint64_t *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_235E185E4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t, unsigned __int8 *, uint64_t *))v6;
  return sub_235E00398(v4);
}

uint64_t sub_235E1564C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, char, uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_235E185B8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_235E00398(v3);
  return sub_235E003A8(v8);
}

uint64_t sub_235E15704(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, _QWORD *))
{
  uint64_t v9;
  _QWORD v11[2];
  char v12;

  v12 = a2;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v11[0] = sub_235E185C0;
  v11[1] = v9;
  swift_retain();
  a5(a1, &v12, v11);
  return swift_release();
}

uint64_t sub_235E15790()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  v2 = *v1;
  sub_235E00398(*v1);
  return v2;
}

uint64_t sub_235E157E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_235E003A8(v6);
}

uint64_t (*sub_235E15844())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235E15888()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  swift_beginAccess();
  v1 = *(void **)(v0 + 32);
  sub_235E18D40();
  v2 = v1;
  v3 = sub_235E18DA0();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v4 = sub_235E18DA0();
  swift_bridgeObjectRelease();
  result = v3 + v4;
  if (__OFADD__(v3, v4))
    __break(1u);
  return result;
}

uint64_t sub_235E15940()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235E18D70();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1 = *(void **)(v0 + 32);
  sub_235E18D40();
  v2 = v1;
  sub_235E18D70();

  return swift_bridgeObjectRelease();
}

uint64_t AccountUISetting.CustomDataclass.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382778);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, v2);
  v3(v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, v2);
  v4 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C170);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v0 + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256382740);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  sub_235E003A8(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass_stateChangeBlock));
  return v0;
}

uint64_t AccountUISetting.CustomDataclass.__deallocating_deinit()
{
  AccountUISetting.CustomDataclass.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_235E15B1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountUISetting.CustomDataclass(0);
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

uint64_t sub_235E15B58()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(void **)(v1 + 32);
  sub_235E18D40();
  v3 = v2;
  v4 = sub_235E18DA0();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = sub_235E18DA0();
  swift_bridgeObjectRelease();
  result = v4 + v5;
  if (__OFADD__(v4, v5))
    __break(1u);
  return result;
}

uint64_t sub_235E15C14()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *v0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235E18D70();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v2 = *(void **)(v1 + 32);
  sub_235E18D40();
  v3 = v2;
  sub_235E18D70();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235E15CC8()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  id v3;

  sub_235E19058();
  v1 = *v0;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235E18D70();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v2 = *(void **)(v1 + 32);
  sub_235E18D40();
  v3 = v2;
  sub_235E18D70();

  swift_bridgeObjectRelease();
  return sub_235E19070();
}

uint64_t sub_235E15D88@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *v1;
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  v4 = *(_QWORD *)(v3 + 24);
  swift_beginAccess();
  sub_235E18D40();
  swift_bridgeObjectRetain();
  sub_235E18D7C();
  result = swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v4;
  return result;
}

uint64_t sub_235E15E28(uint64_t *a1, uint64_t *a2)
{
  return _s18AccountsUISettings16AccountUISettingV15CustomDataclassC2eeoiySbAE_AEtFZ_0(*a1, *a2);
}

id AccountUISetting.CustomDataclassTableConfig.__allocating_init(customDataclasses:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  id v4;
  objc_super v6;
  uint64_t v7;

  v3 = objc_allocWithZone(v1);
  swift_beginAccess();
  v7 = a1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F38);
  sub_235E18788();
  swift_endAccess();

  v6.receiver = v4;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id AccountUISetting.CustomDataclassTableConfig.init(customDataclasses:)(uint64_t a1)
{
  void *v1;
  id v3;
  objc_super v5;
  uint64_t v6;

  swift_beginAccess();
  v6 = a1;
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381F38);
  sub_235E18788();
  swift_endAccess();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_235E15F70()
{
  return sub_235E16AC0();
}

uint64_t sub_235E15F84@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235E15F98(uint64_t a1, void **a2)
{
  return sub_235E16A28(a1, a2);
}

uint64_t sub_235E15FAC()
{
  return sub_235DE66CC();
}

uint64_t (*sub_235E15FC0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E16038()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_2563827A0);
}

uint64_t sub_235E1604C(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_2563827A8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_2563827A0);
}

uint64_t (*sub_235E16068(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827A8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827A0);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

void AccountUISetting.CustomDataclassTableConfig.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccountUISetting.CustomDataclassTableConfig.__deallocating_deinit()
{
  return sub_235E16E88(type metadata accessor for AccountUISetting.CustomDataclassTableConfig);
}

uint64_t sub_235E161D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

id AccountUISetting.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(void **)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 48);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_235E0B224(v2, v3, v4, v5, v6);
}

__n128 AccountUISetting.type.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u8[0];
  sub_235E0B2A8(*(void **)(v1 + 16), *(id *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48));
  result = v6;
  *(__n128 *)(v1 + 16) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  *(_BYTE *)(v1 + 48) = v4;
  return result;
}

uint64_t (*AccountUISetting.type.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountUISetting.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*AccountUISetting.label.modify())()
{
  return nullsub_1;
}

uint64_t AccountUISetting.editable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t AccountUISetting.editable.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 72) = result;
  return result;
}

uint64_t (*AccountUISetting.editable.modify())()
{
  return nullsub_1;
}

uint64_t sub_235E16324@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *AccountUISettingSection.init(id:settings:title:footer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = 0;
  v6[7] = 0;
  v6[5] = 0;
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_beginAccess();
  v6[5] = a4;
  v6[6] = a5;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v6[7] = a6;
  swift_release();
  return v6;
}

uint64_t sub_235E163F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E1644C()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_235E16494(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E164E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E16540()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E16574(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_235E165B8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235E165F4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 56) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_235E16650()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_235E16684(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_release();
}

uint64_t AccountUISettingSection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AccountUISettingSection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_235E16738@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a1 = *(_QWORD *)(v3 + 16);
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E16780@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountUISettingSection();
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

uint64_t sub_235E167B8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235E187B8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235E16828()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_235E187C4();
}

uint64_t (*sub_235E16890(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E16908()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_2563827B0);
}

uint64_t sub_235E1691C(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_2563827B8, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_2563827B0);
}

uint64_t (*sub_235E16938(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827B8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827B0);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

uint64_t sub_235E16A00@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DEC7A0(a1);
}

uint64_t sub_235E16A14(uint64_t a1, void **a2)
{
  return sub_235E16A28(a1, a2);
}

uint64_t sub_235E16A28(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_235E187C4();
}

uint64_t sub_235E16A98()
{
  return sub_235DE66CC();
}

uint64_t sub_235E16AAC()
{
  return sub_235E16AC0();
}

uint64_t sub_235E16AC0()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_235E187C4();
}

uint64_t (*sub_235E16B24(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235E187AC();
  return sub_235DE6550;
}

uint64_t sub_235E16B9C()
{
  return sub_235DE98DC((uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_2563827C0);
}

uint64_t sub_235E16BB0(uint64_t a1)
{
  return sub_235DE995C(a1, &qword_2563827C8, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_2563827C0);
}

uint64_t (*sub_235E16BCC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827C8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827C0);
  sub_235E18794();
  swift_endAccess();
  return sub_235DE6470;
}

id AccountsUISettingsDetailModel.__allocating_init(with:)(void *a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  objc_super v13;
  void *v14;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)objc_allocWithZone(v1);
  v8 = &v7[OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections];
  v15 = MEMORY[0x24BEE4AF8];
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C238);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v8, v6, v3);
  swift_beginAccess();
  v14 = a1;
  sub_235E17204();
  v10 = a1;
  sub_235E18788();
  swift_endAccess();

  v13.receiver = v9;
  v13.super_class = v1;
  v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

id AccountsUISettingsDetailModel.init(with:)(void *a1)
{
  id v2;

  v2 = sub_235E170D8(a1);

  return v2;
}

id AccountsUISettingsDetailModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AccountsUISettingsDetailModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AccountsUISettingsDetailModel.__deallocating_deinit()
{
  return sub_235E16E88(type metadata accessor for AccountsUISettingsDetailModel);
}

id sub_235E16E88(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_235E16F30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountsUISettingsDetailModel(0);
  result = sub_235E1877C();
  *a1 = result;
  return result;
}

Swift::OpaquePointer_optional __swiftcall AccountsUISettingsPlugin.sections(for:)(ACAccount a1)
{
  void *v1;
  Swift::OpaquePointer_optional result;

  v1 = 0;
  result.value._rawValue = v1;
  return result;
}

uint64_t _s18AccountsUISettings16AccountUISettingV15CustomDataclassC2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  swift_beginAccess();
  swift_beginAccess();
  v4 = sub_235E18D40();
  v6 = v5;
  if (v4 == sub_235E18D40() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = sub_235E19028();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = 0;
    if ((v9 & 1) == 0)
      return v10 & 1;
  }
  swift_beginAccess();
  v12 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  swift_beginAccess();
  if (v12 == *(_QWORD *)(a2 + 16) && v11 == *(_QWORD *)(a2 + 24))
    v10 = 1;
  else
    v10 = sub_235E19028();
  return v10 & 1;
}

uint64_t type metadata accessor for AccountUISetting.CustomDataclassTableConfig(uint64_t a1)
{
  return sub_235DF0EF0(a1, (uint64_t *)&unk_256382A88);
}

id sub_235E170D8(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  objc_class *v10;
  objc_super v12;
  void *v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563827C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v1[OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections];
  v14 = MEMORY[0x24BEE4AF8];
  v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C238);
  sub_235E18788();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  swift_beginAccess();
  v13 = a1;
  sub_235E17204();
  v9 = a1;
  sub_235E18788();
  swift_endAccess();

  v10 = (objc_class *)type metadata accessor for AccountsUISettingsDetailModel(0);
  v12.receiver = v8;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t sub_235E17204()
{
  unint64_t result;

  result = qword_25429C2A8;
  if (!qword_25429C2A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25429C2A8);
  }
  return result;
}

uint64_t type metadata accessor for AccountsUISettingsDetailModel(uint64_t a1)
{
  return sub_235DF0EF0(a1, qword_25429C0F8);
}

unint64_t sub_235E17258()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563827D0;
  if (!qword_2563827D0)
  {
    v1 = type metadata accessor for AccountUISetting.CustomDataclass(255);
    result = MEMORY[0x23B7E291C](&protocol conformance descriptor for AccountUISetting.CustomDataclass, v1);
    atomic_store(result, (unint64_t *)&qword_2563827D0);
  }
  return result;
}

uint64_t type metadata accessor for AccountUISetting.CustomDataclass(uint64_t a1)
{
  return sub_235DF0EF0(a1, (uint64_t *)&unk_256382800);
}

uint64_t sub_235E172B8(uint64_t *a1, uint64_t *a2)
{
  return sub_235E163F0(a1, a2);
}

id sub_235E172CC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 32);
  *a2 = v4;
  return v4;
}

uint64_t sub_235E17314@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 48);
  *a2 = *(_QWORD *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id sub_235E17360@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 56);
  *a2 = v4;
  return v4;
}

uint64_t sub_235E173A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_256382778);
}

uint64_t sub_235E173CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__state, &qword_256382778);
}

uint64_t sub_235E173F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_256382778);
}

uint64_t sub_235E1741C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__showsToggle, &qword_256382778);
}

uint64_t sub_235E17448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_256382778);
}

uint64_t sub_235E1746C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256382780, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__toggleEnabled, &qword_256382778);
}

uint64_t sub_235E17498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_25429C170);
}

uint64_t sub_235E174BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256382788, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__accessoryView, &qword_25429C170);
}

uint64_t sub_235E174E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_256382740);
}

uint64_t sub_235E1750C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_256382790, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting15CustomDataclass__subtext, &qword_256382740);
}

uint64_t sub_235E17540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_2563827A0);
}

uint64_t sub_235E17564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_2563827A8, (uint64_t)&OBJC_IVAR____TtCV18AccountsUISettings16AccountUISetting26CustomDataclassTableConfig__customDataclasses, &qword_2563827A0);
}

uint64_t keypath_get_45Tm@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E175DC(uint64_t *a1, uint64_t *a2)
{
  return sub_235E163F0(a1, a2);
}

uint64_t sub_235E175F0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E1763C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 48);
  *a2 = *(_QWORD *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235E17688@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 56);
  return swift_retain();
}

uint64_t sub_235E176DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_2563827B0);
}

uint64_t sub_235E17700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_2563827B8, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__account, &qword_2563827B0);
}

uint64_t sub_235E1772C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235DE9728(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_2563827C0);
}

uint64_t sub_235E17750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235DE97B0(a1, a2, a3, a4, &qword_2563827C8, (uint64_t)&OBJC_IVAR____TtC18AccountsUISettings29AccountsUISettingsDetailModel__sections, &qword_2563827C0);
}

uint64_t destroy for AccountUISetting(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_235E0B2A8(*(void **)(a1 + 16), *(id *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AccountUISetting(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_235E0B224(v5, v6, v7, v8, v9);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AccountUISetting(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_BYTE *)(a2 + 48);
  sub_235E0B224(v4, v5, v6, v7, v8);
  v9 = *(void **)(a1 + 16);
  v10 = *(void **)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  v13 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v8;
  sub_235E0B2A8(v9, v10, v11, v12, v13);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AccountUISetting(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 48);
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v10;
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v5;
  sub_235E0B2A8(v6, v7, v8, v9, v11);
  v12 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v12;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 73))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountUISetting(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 73) = 1;
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
    *(_BYTE *)(result + 73) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountUISetting()
{
  return &type metadata for AccountUISetting;
}

uint64_t sub_235E17A44(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountUISetting.DetailsConfiguration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(a1 + 3) = *(_BYTE *)(a2 + 3);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AccountUISetting.DetailsConfiguration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(a1 + 3) = *(_BYTE *)(a2 + 3);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting.DetailsConfiguration(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountUISetting.DetailsConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AccountUISetting.DetailsConfiguration()
{
  return &type metadata for AccountUISetting.DetailsConfiguration;
}

uint64_t sub_235E17C04()
{
  return type metadata accessor for AccountUISetting.CustomDataclass(0);
}

void sub_235E17C0C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_235DF1794(319, &qword_256382810, &qword_256381EE8);
  if (v0 <= 0x3F)
  {
    sub_235DF1794(319, (unint64_t *)&unk_25429C178, (uint64_t *)&unk_25429C210);
    if (v1 <= 0x3F)
    {
      sub_235DF1794(319, qword_256382818, &qword_256382758);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AccountUISetting.CustomDataclass()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.__allocating_init(accountID:identifier:localizedName:icon:state:showsToggle:toggleEnabled:accessoryView:stateChangeBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.id.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accountID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.identifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.localizedName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.icon.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.showsToggle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$showsToggle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.toggleEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$toggleEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.accessoryView.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$accessoryView.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.subtext.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.$subtext.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.stateChangeBlock.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclass.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t sub_235E17FA0()
{
  return type metadata accessor for AccountUISetting.CustomDataclassTableConfig(0);
}

void sub_235E17FA8()
{
  unint64_t v0;

  sub_235DF1794(319, &qword_256382A98, &qword_256381F38);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AccountUISetting.CustomDataclassTableConfig()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountUISetting.CustomDataclassTableConfig.__allocating_init(customDataclasses:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

void destroy for AccountUISetting.SettingType(uint64_t a1)
{
  sub_235E0B2A8(*(void **)a1, *(id *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_235E0B224(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_235E0B224(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(void **)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_235E0B2A8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AccountUISetting.SettingType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(void **)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_235E0B2A8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountUISetting.SettingType(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountUISetting.SettingType(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_235E18208(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 6u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_235E18220(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for AccountUISetting.SettingType()
{
  return &type metadata for AccountUISetting.SettingType;
}

uint64_t type metadata accessor for AccountUISettingSection()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccountUISettingSection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountUISettingSection.__allocating_init(id:settings:title:footer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of AccountUISettingSection.id.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AccountUISettingSection.settings.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of AccountUISettingSection.title.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AccountUISettingSection.title.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AccountUISettingSection.footer.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_235E18304()
{
  return type metadata accessor for AccountsUISettingsDetailModel(0);
}

void sub_235E1830C()
{
  unint64_t v0;
  unint64_t v1;

  sub_235E18508();
  if (v0 <= 0x3F)
  {
    sub_235DF1794(319, &qword_25429C198, (uint64_t *)&unk_25429C238);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AccountsUISettingsDetailModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.account.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$account.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.sections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.$sections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AccountsUISettingsDetailModel.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

void sub_235E18508()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25429C1D8)
  {
    sub_235E17204();
    v0 = sub_235E187D0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25429C1D8);
  }
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.supportedAccountTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.detailModel(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.sections(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.topLevelView(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.image(_:iconType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of AccountsUISettingsPlugin.dataclassImage(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_235E18594()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E185B8(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_235E15704(a1, a2, a3, a4, *(void (**)(uint64_t, char *, _QWORD *))(v4 + 16));
}

uint64_t sub_235E185C0(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_235E185E4(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_235E13C40(a1, a2, a3, *(void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))(v3 + 16));
}

uint64_t sub_235E185EC(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_235E18668()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_235E18674()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235E18680()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_235E1868C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_235E18698()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235E186A4()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_235E186B0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_235E186BC()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_235E186C8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_235E186D4()
{
  return MEMORY[0x24BE00E08]();
}

uint64_t sub_235E186E0()
{
  return MEMORY[0x24BE00E10]();
}

uint64_t sub_235E186EC()
{
  return MEMORY[0x24BE00E18]();
}

uint64_t sub_235E186F8()
{
  return MEMORY[0x24BE00E30]();
}

uint64_t sub_235E18704()
{
  return MEMORY[0x24BE00E38]();
}

uint64_t sub_235E18710()
{
  return MEMORY[0x24BE00E40]();
}

uint64_t sub_235E1871C()
{
  return MEMORY[0x24BE00E48]();
}

uint64_t sub_235E18728()
{
  return MEMORY[0x24BE00E50]();
}

uint64_t sub_235E18734()
{
  return MEMORY[0x24BE00E58]();
}

uint64_t sub_235E18740()
{
  return MEMORY[0x24BE00E68]();
}

uint64_t sub_235E1874C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_235E18758()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235E18764()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235E18770()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235E1877C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_235E18788()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_235E18794()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_235E187A0()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_235E187AC()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_235E187B8()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_235E187C4()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_235E187D0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_235E187DC()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_235E187E8()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_235E187F4()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_235E18800()
{
  return MEMORY[0x24BDEB0A8]();
}

uint64_t sub_235E1880C()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_235E18818()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_235E18824()
{
  return MEMORY[0x24BDEB600]();
}

uint64_t sub_235E18830()
{
  return MEMORY[0x24BDEB750]();
}

uint64_t sub_235E1883C()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_235E18848()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_235E18854()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_235E18860()
{
  return MEMORY[0x24BDECB20]();
}

uint64_t sub_235E1886C()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_235E18878()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_235E18884()
{
  return MEMORY[0x24BDEDE40]();
}

uint64_t sub_235E18890()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_235E1889C()
{
  return MEMORY[0x24BDEDE58]();
}

uint64_t sub_235E188A8()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_235E188B4()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_235E188C0()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_235E188CC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_235E188D8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_235E188E4()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_235E188F0()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_235E188FC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_235E18908()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_235E18914()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_235E18920()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_235E1892C()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_235E18938()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_235E18944()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_235E18950()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_235E1895C()
{
  return MEMORY[0x24BDEF0B8]();
}

uint64_t sub_235E18968()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_235E18974()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_235E18980()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_235E1898C()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_235E18998()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_235E189A4()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_235E189B0()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_235E189BC()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_235E189C8()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_235E189D4()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_235E189E0()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_235E189EC()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_235E189F8()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_235E18A04()
{
  return MEMORY[0x24BDF1958]();
}

uint64_t sub_235E18A10()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_235E18A1C()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_235E18A28()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_235E18A34()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_235E18A40()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_235E18A4C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_235E18A58()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_235E18A64()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_235E18A70()
{
  return MEMORY[0x24BDF2330]();
}

uint64_t sub_235E18A7C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_235E18A88()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_235E18A94()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_235E18AA0()
{
  return MEMORY[0x24BDF34A8]();
}

uint64_t sub_235E18AAC()
{
  return MEMORY[0x24BDF3510]();
}

uint64_t sub_235E18AB8()
{
  return MEMORY[0x24BDF35A0]();
}

uint64_t sub_235E18AC4()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_235E18AD0()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_235E18ADC()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_235E18AE8()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_235E18AF4()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_235E18B00()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_235E18B0C()
{
  return MEMORY[0x24BDF3B20]();
}

uint64_t sub_235E18B18()
{
  return MEMORY[0x24BDF3B60]();
}

uint64_t sub_235E18B24()
{
  return MEMORY[0x24BDF3B70]();
}

uint64_t sub_235E18B30()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_235E18B3C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_235E18B48()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_235E18B54()
{
  return MEMORY[0x24BE85548]();
}

uint64_t sub_235E18B60()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_235E18B6C()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_235E18B78()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_235E18B84()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235E18B90()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_235E18B9C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_235E18BA8()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_235E18BB4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_235E18BC0()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_235E18BCC()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_235E18BD8()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_235E18BE4()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_235E18BF0()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_235E18BFC()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_235E18C08()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_235E18C14()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_235E18C20()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_235E18C2C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_235E18C38()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_235E18C44()
{
  return MEMORY[0x24BDF4A90]();
}

uint64_t sub_235E18C50()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_235E18C5C()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_235E18C68()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_235E18C74()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_235E18C80()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_235E18C8C()
{
  return MEMORY[0x24BDF5388]();
}

uint64_t sub_235E18C98()
{
  return MEMORY[0x24BDF53B8]();
}

uint64_t sub_235E18CA4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235E18CB0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_235E18CBC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235E18CC8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235E18CD4()
{
  return MEMORY[0x24BE855F8]();
}

uint64_t sub_235E18CE0()
{
  return MEMORY[0x24BE85608]();
}

uint64_t sub_235E18CEC()
{
  return MEMORY[0x24BE85618]();
}

uint64_t sub_235E18CF8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235E18D04()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235E18D10()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235E18D1C()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_235E18D28()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_235E18D34()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_235E18D40()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235E18D4C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_235E18D58()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_235E18D64()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_235E18D70()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235E18D7C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235E18D88()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235E18D94()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_235E18DA0()
{
  return MEMORY[0x24BEE0CD8]();
}

uint64_t sub_235E18DAC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_235E18DB8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235E18DC4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235E18DD0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_235E18DDC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_235E18DE8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235E18DF4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_235E18E00()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_235E18E0C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_235E18E18()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_235E18E24()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_235E18E30()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_235E18E3C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_235E18E48()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235E18E54()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_235E18E60()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235E18E6C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235E18E78()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235E18E84()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_235E18E90()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_235E18E9C()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_235E18EA8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235E18EB4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235E18EC0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235E18ECC()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_235E18ED8()
{
  return MEMORY[0x24BDD0538]();
}

uint64_t sub_235E18EE4()
{
  return MEMORY[0x24BDD05A0]();
}

uint64_t sub_235E18EF0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235E18EFC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235E18F08()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235E18F14()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235E18F20()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235E18F2C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_235E18F38()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_235E18F44()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235E18F50()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235E18F5C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235E18F68()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_235E18F74()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235E18F80()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_235E18F8C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_235E18F98()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_235E18FA4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_235E18FB0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_235E18FBC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235E18FC8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235E18FD4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235E18FE0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235E18FEC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235E18FF8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235E19004()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_235E19010()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_235E1901C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_235E19028()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235E19034()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_235E19040()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_235E1904C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235E19058()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235E19064()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235E19070()
{
  return MEMORY[0x24BEE4328]();
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x24BDBC158](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}


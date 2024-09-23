uint64_t HealthBalancePluginDelegate.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23DC3FE00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 80))();
  *a1 = result;
  return result;
}

uint64_t sub_23DC3FE28()
{
  return 1;
}

uint64_t sub_23DC3FE30()
{
  sub_23DC713C4();
  sub_23DC713D0();
  return sub_23DC713DC();
}

uint64_t sub_23DC3FE70()
{
  return sub_23DC713D0();
}

uint64_t sub_23DC3FE94()
{
  sub_23DC713C4();
  sub_23DC713D0();
  return sub_23DC713DC();
}

unint64_t sub_23DC3FED0()
{
  return 0xD000000000000010;
}

uint64_t sub_23DC3FEEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC44148(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DC3FF14()
{
  return 0;
}

void sub_23DC3FF20(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23DC3FF2C()
{
  sub_23DC449FC();
  return sub_23DC71418();
}

uint64_t sub_23DC3FF54()
{
  sub_23DC449FC();
  return sub_23DC71424();
}

uint64_t sub_23DC3FF7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v17 = a2;
  v19 = sub_23DC706B0();
  v4 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC44A84(0, &qword_256CF48A8, MEMORY[0x24BEE33E0]);
  v18 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - v8;
  type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC449FC();
  sub_23DC713F4();
  if (!v2)
  {
    v12 = (uint64_t)v11;
    sub_23DC44574(&qword_256CF48B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE407A0], MEMORY[0x24BE407B8]);
    v14 = v18;
    v13 = v19;
    sub_23DC7134C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v12, v20, v13);
    sub_23DC44A40(v12, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_23DC40160@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23DC3FF7C(a1, a2);
}

uint64_t sub_23DC40174(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_23DC44A84(0, &qword_256CF48C0, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC449FC();
  sub_23DC71400();
  sub_23DC706B0();
  sub_23DC44574(&qword_256CF48C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE407A0], MEMORY[0x24BE407B0]);
  sub_23DC71370();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t static SleepingSampleChangesAlertTileViewController.bundleClassName.getter()
{
  uint64_t v1;

  v1 = sub_23DC70284();
  sub_23DC70FB0();
  sub_23DC71430();
  sub_23DC70FB0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_23DC402EC()
{
  void *v0;
  void *v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  objc_super v24;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = sub_23DC70D04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v8 = sub_23DC70CF8();
  v9 = sub_23DC71088();
  if (os_log_type_enabled(v8, v9))
  {
    v22[0] = v3;
    v10 = swift_slowAlloc();
    v22[1] = ObjectType;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v23 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = sub_23DC71430();
    v22[2] = sub_23DC43878(v13, v14, &v23);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v8, v9, "%{public}s loaded", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v12, -1, -1);
    MEMORY[0x24263FD98](v11, -1, -1);

    (*(void (**)(char *, _QWORD))(v4 + 8))(v7, v22[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  v15 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v24.receiver = v1;
  v24.super_class = v15;
  objc_msgSendSuper2(&v24, sel_viewDidLoad);
  sub_23DC40A98();
  v16 = sub_23DC4200C();
  v17 = (void *)sub_23DC7080C();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_23DC7098C();

  swift_release();
  sub_23DC440A8(0, &qword_256CF4750, (uint64_t (*)(uint64_t))sub_23DC420C0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23DC71BC0;
  v19 = sub_23DC70D10();
  v20 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 40) = v20;
  sub_23DC710E8();
  sub_23DC70AE8();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SleepingSampleChangesAlertTileViewController(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_256CF4810);
}

void sub_23DC405B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24263FE4C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_23DC40604();

  }
}

uint64_t sub_23DC40604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[3];
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  _QWORD v39[3];
  uint64_t v40;
  _OWORD v41[3];

  v1 = v0;
  sub_23DC440A8(0, (unint64_t *)&qword_256CF48E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)v34 - v2;
  sub_23DC709C8();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC710D0();
  v6 = v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  result = sub_23DC43EE4(v6, (uint64_t)v39);
  v8 = v40;
  if (!v40)
  {
    __break(1u);
    goto LABEL_7;
  }
  v9 = __swift_project_boxed_opaque_existential_1(v39, v40);
  v34[3] = v34;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v9, v9);
  v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v34[2] = sub_23DC70A04();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  result = sub_23DC43EE4(v6, (uint64_t)v37);
  v13 = v38;
  if (!v38)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v34[1] = v1;
  v14 = __swift_project_boxed_opaque_existential_1(v37, v38);
  v15 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v14, v14);
  v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v17);
  v18 = (void *)sub_23DC70A04();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
  v19 = objc_msgSend(v18, sel_profileIdentifier);

  result = sub_23DC43EE4(v6, (uint64_t)v35);
  v20 = v36;
  if (!v36)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v21 = __swift_project_boxed_opaque_existential_1(v35, v36);
  v22 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v21, v21);
  v24 = (char *)v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v24);
  sub_23DC70A10();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v20);
  v25 = sub_23DC708B4();
  v26 = MEMORY[0x24BE42678];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v3, 0, 1, v25);
  sub_23DC708CC();

  sub_23DC44B58((uint64_t)v3, (uint64_t)&qword_256CF48E0, (uint64_t)v26, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  result = sub_23DC43EE4(v6, (uint64_t)v35);
  v27 = v36;
  if (v36)
  {
    v28 = __swift_project_boxed_opaque_existential_1(v35, v36);
    v29 = *(_QWORD *)(v27 - 8);
    MEMORY[0x24BDAC7A8](v28, v28);
    v31 = (char *)v34 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v29 + 16))(v31);
    sub_23DC70A1C();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v27);
    sub_23DC709BC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
    v32 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    v33 = BalanceRoomViewController.init(context:)((uint64_t)v5);
    memset(v41, 0, 32);
    sub_23DC710F4();

    return sub_23DC44B58((uint64_t)v41, (uint64_t)&unk_256CF48E8, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC44FD0);
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_23DC40A98()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
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
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  double v68;
  double v69;
  id v70;
  void *v71;
  id v72;
  id v73;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = v2;
  objc_msgSend(v2, sel_directionalLayoutMargins);
  objc_msgSend(v3, sel_setDirectionalLayoutMargins_);

  v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = v4;
  v6 = sub_23DC4200C();
  objc_msgSend(v5, sel_addSubview_, v6);

  v7 = objc_msgSend(v1, sel_view);
  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = v7;
  v9 = sub_23DC41560();
  objc_msgSend(v8, sel_addSubview_, v9);

  v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_layoutMarginsGuide);

  v13 = objc_msgSend(v12, sel_bottomAnchor);
  v14 = sub_23DC41560();
  v15 = objc_msgSend(v14, sel_bottomAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, sel_setPriority_, v17);
  v18 = sub_23DC41560();
  v19 = objc_msgSend(v18, sel_heightAnchor);

  v20 = objc_msgSend(v19, sel_constraintEqualToConstant_, 106.0);
  v21 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint;
  v22 = *(void **)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = v20;
  v72 = v20;

  sub_23DC44FD0(0, (unint64_t *)&qword_254322ED8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_23DC71BD0;
  v24 = sub_23DC4200C();
  v25 = objc_msgSend(v24, sel_topAnchor);

  v26 = objc_msgSend(v1, sel_view);
  if (!v26)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, sel_topAnchor);

  v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
  *(_QWORD *)(v23 + 32) = v29;
  v30 = sub_23DC4200C();
  v31 = objc_msgSend(v30, sel_leadingAnchor);

  v32 = objc_msgSend(v1, sel_view);
  if (!v32)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v33 = v32;
  v71 = v16;
  v34 = objc_msgSend(v32, sel_leadingAnchor);

  v35 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v34);
  *(_QWORD *)(v23 + 40) = v35;
  v36 = objc_msgSend(v1, sel_view);
  if (!v36)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v37 = v36;
  v70 = (id)objc_opt_self();
  v38 = objc_msgSend(v37, sel_trailingAnchor);

  v39 = sub_23DC4200C();
  v40 = objc_msgSend(v39, sel_trailingAnchor);

  v41 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v40);
  *(_QWORD *)(v23 + 48) = v41;
  v42 = sub_23DC41560();
  v43 = objc_msgSend(v42, sel_topAnchor);

  v44 = sub_23DC4200C();
  v45 = objc_msgSend(v44, sel_bottomAnchor);

  v46 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v45, 4.0);
  *(_QWORD *)(v23 + 56) = v46;
  v47 = sub_23DC41560();
  v48 = objc_msgSend(v47, sel_leadingAnchor);

  v49 = sub_23DC4200C();
  v50 = (void *)sub_23DC7080C();

  v51 = objc_msgSend(v50, sel_layoutMarginsGuide);
  v52 = objc_msgSend(v51, sel_leadingAnchor);

  v53 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v52);
  *(_QWORD *)(v23 + 64) = v53;
  v54 = sub_23DC4200C();
  v55 = (void *)sub_23DC7080C();

  v56 = objc_msgSend(v55, sel_layoutMarginsGuide);
  v57 = objc_msgSend(v56, sel_trailingAnchor);

  v58 = sub_23DC41560();
  v59 = objc_msgSend(v58, sel_trailingAnchor);

  v60 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v59);
  *(_QWORD *)(v23 + 72) = v60;
  *(_QWORD *)(v23 + 80) = v72;
  *(_QWORD *)(v23 + 88) = v71;
  sub_23DC70FEC();
  sub_23DC44CF0(0, (unint64_t *)&qword_256CF4900);
  v61 = v72;
  v62 = v71;
  v63 = (void *)sub_23DC70FD4();
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_activateConstraints_, v63);

  v64 = *(void **)&v1[v21];
  if (v64)
  {
    v65 = *MEMORY[0x24BEBE1D0];
    v66 = objc_allocWithZone(MEMORY[0x24BEBD5F0]);
    v73 = v64;
    v67 = objc_msgSend(v66, sel_initForTextStyle_, v65);
    objc_msgSend(v67, sel_scaledValueForValue_, 106.0);
    v69 = v68;

    objc_msgSend(v73, sel_setConstant_, v69);
    return;
  }
LABEL_17:
  __break(1u);
}

uint64_t sub_23DC411A0()
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
  char *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t ObjCClassFromMetadata;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0;
  v2 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v4, v5);
  v6 = sub_23DC70824();
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DC440A8(0, &qword_256CF4780, (uint64_t (*)(uint64_t))MEMORY[0x24BE407A0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v31 - v13;
  sub_23DC440A8(0, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, v10);
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v31 - v17;
  v19 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
  swift_beginAccess();
  sub_23DC4442C(v24, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
    return sub_23DC44B58((uint64_t)v18, (uint64_t)&qword_256CF47B8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
  sub_23DC44A40((uint64_t)v18, (uint64_t)v23);
  v26 = sub_23DC706B0();
  v27 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v14, v23, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v14, 0, 1, v26);
  sub_23DC7065C();
  v28 = sub_23DC4200C();
  sub_23DC41640();
  sub_23DC7068C();
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  objc_msgSend((id)objc_opt_self(), sel_clearColor);
  sub_23DC70818();
  sub_23DC70830();

  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v32);
  return sub_23DC44C54((uint64_t)v23);
}

id sub_23DC41560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  Class v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = v0;
  sub_23DC70650();
  MEMORY[0x24BDAC7A8]();
  v2 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView;
  v3 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView);
  if (v3)
  {
    v4 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView);
  }
  else
  {
    swift_retain();
    sub_23DC70644();
    sub_23DC44AE0();
    v6 = objc_allocWithZone(v5);
    v7 = (void *)sub_23DC70E3C();
    objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v8 = *(void **)(v1 + v2);
    *(_QWORD *)(v1 + v2) = v7;
    v4 = v7;

    v3 = 0;
  }
  v9 = v3;
  return v4;
}

id sub_23DC41640()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph);
  }
  else
  {
    v4 = sub_23DC4169C();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_23DC4169C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_configurationWithPointSize_, 28.0);
  v2 = objc_msgSend((id)objc_opt_self(), sel_hk_vitalsKeyColor);
  v3 = objc_msgSend(v0, sel_configurationWithHierarchicalColor_, v2);

  v4 = objc_msgSend(v1, sel_configurationByApplyingConfiguration_, v3);
  v5 = (void *)sub_23DC70F38();
  v6 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v5, v4);

  if (!v6)
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);

  return v6;
}

uint64_t sub_23DC417E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  return sub_23DC43EE4(v3, a2);
}

uint64_t sub_23DC41834(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_23DC43EE4(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_23DC43FE8((uint64_t)v5, v3);
  swift_endAccess();
  sub_23DC418A4();
  return sub_23DC4404C((uint64_t)v5);
}

uint64_t sub_23DC418A4()
{
  uint64_t v0;
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
  _QWORD *v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[5];

  v1 = v0;
  v30[3] = swift_getObjectType();
  v2 = sub_23DC70D04();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v30 - v6;
  sub_23DC440A8(0, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)v30 - v10;
  v12 = (_QWORD *)(v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context);
  result = swift_beginAccess();
  v14 = v12[3];
  if (v14)
  {
    v15 = __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    v16 = *(_QWORD *)(v14 - 8);
    MEMORY[0x24BDAC7A8](v15, v15);
    v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v18);
    v19 = sub_23DC70A28();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    if (v21 >> 60 == 15)
    {
      sub_23DC70CE0();
      v22 = sub_23DC70CF8();
      v23 = sub_23DC71070();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        v25 = swift_slowAlloc();
        v33[0] = v25;
        *(_DWORD *)v24 = 136446210;
        v26 = sub_23DC71430();
        v33[4] = sub_23DC43878(v26, v27, v33);
        sub_23DC71184();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v22, v23, "[%{public}s] Could not find userData", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v25, -1, -1);
        MEMORY[0x24263FD98](v24, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v7, v32);
    }
    else
    {
      sub_23DC700EC();
      swift_allocObject();
      sub_23DC700E0();
      v28 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
      sub_23DC44574(&qword_256CF48F0, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t)&unk_23DC71F10);
      sub_23DC700D4();
      swift_release();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v11, 0, 1, v28);
      v29 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
      swift_beginAccess();
      sub_23DC44BF8((uint64_t)v11, v29);
      swift_endAccess();
      sub_23DC411A0();
      sub_23DC44B58((uint64_t)v11, (uint64_t)&qword_256CF47B8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
      return sub_23DC44BA0(v19, v21);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DC41E74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  return sub_23DC43EE4(v3, a1);
}

uint64_t sub_23DC41EC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_23DC43FE8(a1, v3);
  swift_endAccess();
  sub_23DC418A4();
  return sub_23DC4404C(a1);
}

uint64_t (*sub_23DC41F30(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23DC41F78;
}

uint64_t sub_23DC41F78(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_23DC418A4();
  return result;
}

id sub_23DC41FA8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_23DC4200C();
  *a1 = result;
  return result;
}

void sub_23DC41FD0(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2
             + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(*a2
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = *a1;
  v3 = v2;

}

id sub_23DC4200C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  }
  else
  {
    sub_23DC7083C();
    v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_23DC42094()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23DC420B8()
{
  uint64_t v0;

  sub_23DC405B4(v0);
}

unint64_t sub_23DC420C0()
{
  unint64_t result;

  result = qword_256CF4758;
  if (!qword_256CF4758)
  {
    sub_23DC43F9C(255, &qword_256CF4760);
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4758);
  }
  return result;
}

void sub_23DC42108(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = a1;

}

void (*sub_23DC4211C(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_23DC4200C();
  return sub_23DC42150;
}

void sub_23DC42150(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = v2;

}

id SleepingSampleChangesAlertTileViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SleepingSampleChangesAlertTileViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  objc_class *v18;
  id v19;
  objc_super v21;

  v4 = v3;
  sub_23DC440A8(0, &qword_256CF4780, (uint64_t (*)(uint64_t))MEMORY[0x24BE407A0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v21 - v9;
  *(_QWORD *)&v4[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = 0;
  v11 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewModelProvider;
  v12 = sub_23DC706B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  sub_23DC70674();
  swift_allocObject();
  v13 = v4;
  *(_QWORD *)&v4[v11] = sub_23DC70668();
  v14 = &v13[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel];
  v15 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(_QWORD *)&v13[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView] = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph] = 0;
  v16 = &v13[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context];
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_QWORD *)v16 + 4) = 0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView] = 0;

  if (a2)
  {
    v17 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  v18 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v21.receiver = v13;
  v21.super_class = v18;
  v19 = objc_msgSendSuper2(&v21, sel_initWithNibName_bundle_, v17, a3);

  return v19;
}

id SleepingSampleChangesAlertTileViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SleepingSampleChangesAlertTileViewController.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  objc_class *v14;
  id v15;
  objc_super v17;

  v2 = v1;
  sub_23DC440A8(0, &qword_256CF4780, (uint64_t (*)(uint64_t))MEMORY[0x24BE407A0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v17 - v6;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = 0;
  v8 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewModelProvider;
  v9 = sub_23DC706B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_23DC70674();
  swift_allocObject();
  v10 = v2;
  *(_QWORD *)&v2[v8] = sub_23DC70668();
  v11 = &v10[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel];
  v12 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)&v10[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph] = 0;
  v13 = &v10[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_QWORD *)v13 + 4) = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView] = 0;

  v14 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v17.receiver = v10;
  v17.super_class = v14;
  v15 = objc_msgSendSuper2(&v17, sel_initWithCoder_, a1);

  return v15;
}

id SleepingSampleChangesAlertTileViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23DC426B4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_23DC4200C();
  *a1 = result;
  return result;
}

void sub_23DC426DC(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v3 = *(void **)(*v1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(_QWORD *)(*v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = v2;

}

uint64_t (*sub_23DC426F8(id **a1))()
{
  id *v2;

  v2 = (id *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23DC4211C(v2);
  return sub_23DC42740;
}

uint64_t sub_23DC42754(uint64_t a1)
{
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a1);
  return sub_23DC70B6C();
}

uint64_t sub_23DC42788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a3);
  return sub_23DC70B78();
}

uint64_t (*sub_23DC427D4(_QWORD *a1, uint64_t a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a2);
  v4[4] = sub_23DC70B60();
  return sub_23DC42740;
}

void sub_23DC42838(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_23DC42864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a3);
  return sub_23DC70B84();
}

uint64_t sub_23DC428C0()
{
  return _s22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewControllerC13didSelectCell_2inySo6UIViewC_So0pK0CtF_0();
}

uint64_t SleepingSampleChangesAlertTileViewController.glyph.getter()
{
  id v0;
  uint64_t v1;

  sub_23DC44CF0(0, &qword_256CF47B0);
  v0 = (id)*MEMORY[0x24BEBE1D0];
  v1 = sub_23DC71130();

  return v1;
}

uint64_t SleepingSampleChangesAlertTileViewController.title.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  return sub_23DC70F74();
}

uint64_t SleepingSampleChangesAlertTileViewController.title.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t SleepingSampleChangesAlertTileViewController.detail.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;

  v3 = sub_23DC706B0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DC440A8(0, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v33 - v11;
  sub_23DC440A8(0, &qword_254322A40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], v8);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v33 - v15;
  v17 = sub_23DC70188();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
  swift_beginAccess();
  sub_23DC4442C(v22, (uint64_t)v12);
  v23 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v12, 1, v23))
  {
    sub_23DC44B58((uint64_t)v12, (uint64_t)&qword_256CF47B8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v12, v3);
    sub_23DC44B58((uint64_t)v12, (uint64_t)&qword_256CF47B8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
    sub_23DC70680();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
    {
      v25 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      v25(v21, v16, v17);
      sub_23DC44488();
      v27 = &a1[*(int *)(v26 + 48)];
      v25(a1, v21, v17);
      v28 = *MEMORY[0x24BE43120];
      v29 = sub_23DC708F0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v28, v29);
      v24 = (unsigned int *)MEMORY[0x24BE43130];
      goto LABEL_6;
    }
  }
  sub_23DC44B58((uint64_t)v16, (uint64_t)&qword_254322A40, (uint64_t)MEMORY[0x24BDCE900], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
  v24 = (unsigned int *)MEMORY[0x24BE43138];
LABEL_6:
  v30 = *v24;
  v31 = sub_23DC708FC();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(a1, v30, v31);
}

id SleepingSampleChangesAlertTileViewController.backgroundColor.getter()
{
  return sub_23DC42ED8((SEL *)&selRef_hk_alertHeaderBackgroundColor);
}

id SleepingSampleChangesAlertTileViewController.foregroundColor.getter()
{
  return sub_23DC42ED8((SEL *)&selRef_hk_alertHeaderForegroundColor);
}

id sub_23DC42ED8(SEL *a1)
{
  return objc_msgSend((id)objc_opt_self(), *a1);
}

uint64_t SleepingSampleChangesAlertTileViewController.showsSeparator.getter()
{
  return 0;
}

id sub_23DC42F14(uint64_t a1, uint64_t a2)
{
  return sub_23DC42F2C(a1, a2, (SEL *)&selRef_hk_alertHeaderBackgroundColor);
}

id sub_23DC42F20(uint64_t a1, uint64_t a2)
{
  return sub_23DC42F2C(a1, a2, (SEL *)&selRef_hk_alertHeaderForegroundColor);
}

id sub_23DC42F2C(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend((id)objc_opt_self(), *a3);
}

uint64_t sub_23DC42F60()
{
  return 0;
}

uint64_t sub_23DC42F68(uint64_t a1)
{
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a1);
  return sub_23DC70A94();
}

uint64_t sub_23DC42FB0()
{
  id v0;
  uint64_t v1;

  sub_23DC44CF0(0, &qword_256CF47B0);
  v0 = (id)*MEMORY[0x24BEBE1D0];
  v1 = sub_23DC71130();

  return v1;
}

uint64_t sub_23DC43028()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_title);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23DC70F5C();

  return v3;
}

uint64_t sub_23DC4308C@<X0>(char *a1@<X8>)
{
  return SleepingSampleChangesAlertTileViewController.detail.getter(a1);
}

uint64_t sub_23DC430AC(uint64_t a1)
{
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a1);
  MEMORY[0x24263FCFC](&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController, a1);
  return sub_23DC70A88() & 1;
}

Swift::Void __swiftcall SleepingSampleChangesAlertTileViewController.didTapDismiss()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35[3];
  uint64_t v36;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_23DC70188();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DC70D04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v12 = sub_23DC70CF8();
  v13 = sub_23DC71088();
  if (os_log_type_enabled(v12, v13))
  {
    v31 = v8;
    v14 = swift_slowAlloc();
    v32 = v1;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v33 = v6;
    v17 = v16;
    v35[0] = v16;
    v30 = v7;
    *(_DWORD *)v15 = 136446210;
    v18 = sub_23DC71430();
    v34 = sub_23DC43878(v18, v19, v35);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v12, v13, "[%{public}s] Dismissing", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v6 = v33;
    MEMORY[0x24263FD98](v20, -1, -1);
    v21 = v15;
    v1 = v32;
    MEMORY[0x24263FD98](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  v22 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_23DC43EE4(v22, (uint64_t)v35);
  v23 = v36;
  if (v36)
  {
    sub_23DC44CF0(0, (unint64_t *)&qword_254322E68);
    v24 = __swift_project_boxed_opaque_existential_1(v35, v23);
    v25 = *(_QWORD *)(v23 - 8);
    MEMORY[0x24BDAC7A8](v24, v24);
    v27 = (char *)&v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v27);
    v28 = (void *)sub_23DC70A04();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
    v29 = (void *)sub_23DC71094();

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
    sub_23DC7017C();
    sub_23DC710A0();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DC4342C(uint64_t a1, uint64_t a2)
{
  return sub_23DC4378C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23DC43448(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23DC70F44();
  *a2 = 0;
  return result;
}

uint64_t sub_23DC434BC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23DC70F50();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23DC43538@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23DC70F5C();
  v2 = sub_23DC70F38();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23DC43578(uint64_t a1, uint64_t a2)
{
  return sub_23DC4378C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23DC43590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23DC70F5C();
  v2 = v1;
  if (v0 == sub_23DC70F5C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23DC71394();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23DC43618()
{
  sub_23DC44574(&qword_256CF4958, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_23DC722D8);
  sub_23DC44574(&qword_256CF4960, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_23DC72280);
  return sub_23DC7131C();
}

uint64_t sub_23DC4369C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23DC70F38();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23DC436E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23DC70F5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23DC43708()
{
  sub_23DC44574(&qword_254322E78, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC721AC);
  sub_23DC44574(&qword_256CF4930, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC72004);
  return sub_23DC7131C();
}

uint64_t sub_23DC4378C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23DC70F5C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23DC437C8()
{
  sub_23DC70F5C();
  sub_23DC70FA4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DC43808()
{
  uint64_t v0;

  sub_23DC70F5C();
  sub_23DC713C4();
  sub_23DC70FA4();
  v0 = sub_23DC713DC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23DC43878(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DC43948(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DC44CB0((uint64_t)v12, *a3);
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
      sub_23DC44CB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23DC43948(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DC71190();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DC43B00(a5, a6);
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
  v8 = sub_23DC71298();
  if (!v8)
  {
    sub_23DC712D4();
    __break(1u);
LABEL_17:
    result = sub_23DC71310();
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

uint64_t sub_23DC43B00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DC43B94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DC43D80(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DC43D80(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DC43B94(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DC43D08(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DC71250();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DC712D4();
      __break(1u);
LABEL_10:
      v2 = sub_23DC70FBC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DC71310();
    __break(1u);
LABEL_14:
    result = sub_23DC712D4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DC43D08(uint64_t a1, uint64_t a2)
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
  sub_23DC44FD0(0, &qword_256CF48F8, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DC43D80(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DC44FD0(0, &qword_256CF48F8, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_23DC71310();
  __break(1u);
  return result;
}

uint64_t sub_23DC43EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC43F48(0, &qword_256CF4768, (uint64_t)&qword_256CF4770, MEMORY[0x24BE443C0], (void (*)(uint64_t, uint64_t, uint64_t))sub_23DC43F9C);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DC43F48(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a5(255, a3, a4);
    v6 = sub_23DC71178();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_23DC43F9C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23DC43FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC43F48(0, &qword_256CF4768, (uint64_t)&qword_256CF4770, MEMORY[0x24BE443C0], (void (*)(uint64_t, uint64_t, uint64_t))sub_23DC43F9C);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC4404C(uint64_t a1)
{
  uint64_t v2;

  sub_23DC43F48(0, &qword_256CF4768, (uint64_t)&qword_256CF4770, MEMORY[0x24BE443C0], (void (*)(uint64_t, uint64_t, uint64_t))sub_23DC43F9C);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DC440A8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for SleepingSampleChangesAlertTileViewModel(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322BD0);
}

uint64_t sub_23DC44114(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DC44148(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023DC74830)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23DC71394();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void sub_23DC441CC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  double v5;
  double v6;
  id v7;

  v1 = *(void **)(a1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint);
  if (v1)
  {
    v2 = *MEMORY[0x24BEBE1D0];
    v3 = objc_allocWithZone(MEMORY[0x24BEBD5F0]);
    v7 = v1;
    v4 = objc_msgSend(v3, sel_initForTextStyle_, v2);
    objc_msgSend(v4, sel_scaledValueForValue_, 106.0);
    v6 = v5;

    objc_msgSend(v7, sel_setConstant_, v6);
  }
  else
  {
    __break(1u);
  }
}

uint64_t _s22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewControllerC13didSelectCell_2inySo6UIViewC_So0pK0CtF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v15[3];
  uint64_t v16;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_23DC70D04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v7 = sub_23DC70CF8();
  v8 = sub_23DC71088();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v15[1] = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_23DC71430();
    v15[2] = sub_23DC43878(v12, v13, &v16);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v7, v8, "[%{public}s] Cell selected", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v11, -1, -1);
    MEMORY[0x24263FD98](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return sub_23DC40604();
}

uint64_t sub_23DC4442C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC440A8(0, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DC44488()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF47C0)
  {
    sub_23DC70188();
    sub_23DC708F0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF47C0);
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23DC4451C()
{
  return sub_23DC44574(&qword_256CF47C8, type metadata accessor for SleepingSampleChangesAlertTileViewController, (uint64_t)&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_23DC44548()
{
  return sub_23DC44574(&qword_256CF47D0, type metadata accessor for SleepingSampleChangesAlertTileViewController, (uint64_t)&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_23DC44574(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24263FCFC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DC445B4()
{
  return sub_23DC44574(&qword_256CF47D8, type metadata accessor for SleepingSampleChangesAlertTileViewController, (uint64_t)&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_23DC445E0()
{
  return MEMORY[0x24BE42038];
}

uint64_t sub_23DC445EC()
{
  return sub_23DC44574(&qword_256CF47E0, type metadata accessor for SleepingSampleChangesAlertTileViewController, (uint64_t)&protocol conformance descriptor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_23DC44618()
{
  return type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
}

void sub_23DC44620()
{
  unint64_t v0;

  sub_23DC440A8(319, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SleepingSampleChangesAlertTileViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t sub_23DC44780(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23DC447BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23DC706B0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23DC447F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23DC44834(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23DC44878(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23DC448BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23DC44900()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC4490C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23DC44948()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC44954(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC706B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23DC44994()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC706B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23DC449FC()
{
  unint64_t result;

  result = qword_256CF48B0;
  if (!qword_256CF48B0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC7215C, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF48B0);
  }
  return result;
}

uint64_t sub_23DC44A40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23DC44A84(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DC449FC();
    v7 = a3(a1, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_23DC44AE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF48D0)
  {
    sub_23DC70650();
    sub_23DC44574(&qword_256CF48D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE40740], MEMORY[0x24BE40730]);
    v0 = sub_23DC70E48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF48D0);
  }
}

uint64_t sub_23DC44B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_23DC44BA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23DC44BB4(a1, a2);
  return a1;
}

uint64_t sub_23DC44BB4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23DC44BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC440A8(0, &qword_256CF47B8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC44C54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23DC44CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23DC44CF0(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for SleepingSampleChangesAlertTileViewModel.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SleepingSampleChangesAlertTileViewModel.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DC44DC0 + 4 * byte_23DC71BE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DC44DE0 + 4 * byte_23DC71BE5[v4]))();
}

_BYTE *sub_23DC44DC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DC44DE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC44DE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC44DF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC44DF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC44E00(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleChangesAlertTileViewModel.CodingKeys()
{
  return &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys;
}

void type metadata accessor for HKFeatureIdentifier(uint64_t a1)
{
  sub_23DC44FD0(a1, &qword_254322E88, (uint64_t)&unk_250E8FA28, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_23DC44FD0(a1, &qword_254322E70, (uint64_t)&unk_250E8FA50, MEMORY[0x24BEE4D40]);
}

uint64_t sub_23DC44E58()
{
  return sub_23DC44574(&qword_256CF4908, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC71FCC);
}

uint64_t sub_23DC44E84()
{
  return sub_23DC44574(&qword_256CF4910, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC71FA4);
}

unint64_t sub_23DC44EB4()
{
  unint64_t result;

  result = qword_256CF4918;
  if (!qword_256CF4918)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72134, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4918);
  }
  return result;
}

unint64_t sub_23DC44EFC()
{
  unint64_t result;

  result = qword_256CF4920;
  if (!qword_256CF4920)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC720A4, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4920);
  }
  return result;
}

unint64_t sub_23DC44F44()
{
  unint64_t result;

  result = qword_256CF4928;
  if (!qword_256CF4928)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC720CC, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4928);
  }
  return result;
}

uint64_t sub_23DC44F88()
{
  return sub_23DC44574(&qword_254322E80, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC72034);
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
  sub_23DC44FD0(a1, &qword_256CF4938, (uint64_t)&unk_250E8FA78, MEMORY[0x24BEE4D40]);
}

void sub_23DC44FD0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_23DC45014()
{
  return sub_23DC44574(&qword_256CF4940, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_23DC72248);
}

uint64_t sub_23DC45040()
{
  return sub_23DC44574(&qword_256CF4948, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_23DC72220);
}

uint64_t sub_23DC4506C()
{
  return sub_23DC44574(&qword_256CF4950, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureAvailabilityRequirementIdentifier, (uint64_t)&unk_23DC722B0);
}

BOOL sub_23DC450A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23DC450B4()
{
  sub_23DC713C4();
  sub_23DC713D0();
  return sub_23DC713DC();
}

uint64_t sub_23DC450F8()
{
  return sub_23DC713D0();
}

uint64_t sub_23DC45120()
{
  sub_23DC713C4();
  sub_23DC713D0();
  return sub_23DC713DC();
}

void sub_23DC45160(_QWORD *a1@<X8>)
{
  *a1 = &unk_250E8F798;
}

id sub_23DC45170(unsigned __int8 a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[3];
  ValueMetadata *v17;
  char **v18;
  _BYTE v19[24];
  uint64_t v20;

  if (a1 - 2 < 2)
    return 0;
  if (a1)
  {
    v14 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingNotificationsViewController());
    return sub_23DC66B7C();
  }
  else
  {
    sub_23DC45304(v1, (uint64_t)v19);
    v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    MEMORY[0x24BDAC7A8](v3, v3);
    v5 = (_OWORD *)((char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(_OWORD *))(v6 + 16))(v5);
    v17 = &type metadata for BalanceOnboardingManager;
    v18 = &off_250E90688;
    v7 = (_OWORD *)swift_allocObject();
    v16[0] = v7;
    v8 = v5[1];
    v7[1] = *v5;
    v7[2] = v8;
    v7[3] = v5[2];
    v9 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingIntroViewController());
    v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, (uint64_t)v17);
    MEMORY[0x24BDAC7A8](v10, v10);
    v12 = (_OWORD *)((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(_OWORD *))(v13 + 16))(v12);
    v2 = sub_23DC4539C(v12, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  }
  return v2;
}

uint64_t sub_23DC45304(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_23DC45370()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return swift_deallocObject();
}

id sub_23DC4539C(_OWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[5];

  v4 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v4, v5);
  v6 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v6, v7);
  v17[3] = &type metadata for BalanceOnboardingManager;
  v17[4] = &off_250E90688;
  v8 = (_OWORD *)swift_allocObject();
  v17[0] = v8;
  v9 = a1[1];
  v8[1] = *a1;
  v8[2] = v9;
  v8[3] = a1[2];
  sub_23DC45304((uint64_t)v17, (uint64_t)a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController_model);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v12 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  sub_23DC5F998();
  v13 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v16.receiver = a2;
  v16.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  v14 = objc_msgSendSuper2(&v16, sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, 0, 1);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return v14;
}

uint64_t initializeBufferWithCopyOfBuffer for BalanceOnboardingModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for BalanceOnboardingModel(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for BalanceOnboardingModel(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for BalanceOnboardingModel(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BalanceOnboardingModel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingModel()
{
  return &type metadata for BalanceOnboardingModel;
}

uint64_t storeEnumTagSinglePayload for BalanceOnboardingCannotProgressReason(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DC458B0 + 4 * byte_23DC72370[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DC458D0 + 4 * byte_23DC72375[v4]))();
}

_BYTE *sub_23DC458B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DC458D0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC458D8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC458E0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC458E8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC458F0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingCannotProgressReason()
{
  return &type metadata for BalanceOnboardingCannotProgressReason;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingStage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BalanceOnboardingStage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DC459F4 + 4 * byte_23DC7237F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DC45A28 + 4 * byte_23DC7237A[v4]))();
}

uint64_t sub_23DC45A28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC45A30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DC45A38);
  return result;
}

uint64_t sub_23DC45A44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DC45A4CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DC45A50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC45A58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC45A64(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DC45A6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingStage()
{
  return &type metadata for BalanceOnboardingStage;
}

unint64_t sub_23DC45A88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4968;
  if (!qword_256CF4968)
  {
    sub_23DC45AD0();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4968);
  }
  return result;
}

void sub_23DC45AD0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4970)
  {
    v0 = sub_23DC71010();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4970);
  }
}

unint64_t sub_23DC45B28()
{
  unint64_t result;

  result = qword_256CF4978;
  if (!qword_256CF4978)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72490, &type metadata for BalanceOnboardingStage);
    atomic_store(result, (unint64_t *)&qword_256CF4978);
  }
  return result;
}

unint64_t sub_23DC45B70()
{
  unint64_t result;

  result = qword_256CF4980;
  if (!qword_256CF4980)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC724B8, &type metadata for BalanceOnboardingCannotProgressReason);
    atomic_store(result, (unint64_t *)&qword_256CF4980);
  }
  return result;
}

id BalanceRoomViewController.__allocating_init(context:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return BalanceRoomViewController.init(context:)(a1);
}

id BalanceRoomViewController.init(context:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id result;
  void *v12;
  uint64_t v13;
  _OWORD v15[2];
  uint64_t v16;

  v2 = sub_23DC709C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DC709D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)objc_opt_self();
  result = objc_msgSend(v10, sel_appleBalanceMetricsType);
  if (result)
  {
    v12 = result;
    sub_23DC709A4();

    sub_23DC709B0();
    v16 = 0;
    memset(v15, 0, sizeof(v15));
    sub_23DC70B30();
    swift_bridgeObjectRelease();
    sub_23DC45D88((uint64_t)v15);
    sub_23DC70998();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    result = objc_msgSend(v10, sel_appleBalanceMetricsType);
    if (result)
    {
      v13 = sub_23DC709E0();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
      return (id)v13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23DC45D88(uint64_t a1)
{
  uint64_t v2;

  sub_23DC45DC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DC45DC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4988)
  {
    sub_23DC45E18();
    v0 = sub_23DC71178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4988);
  }
}

unint64_t sub_23DC45E18()
{
  unint64_t result;

  result = qword_256CF4990;
  if (!qword_256CF4990)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4990);
  }
  return result;
}

void sub_23DC45E6C()
{
  sub_23DC712E0();
  __break(1u);
}

uint64_t sub_23DC45EC4(int a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  objc_class *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v9 = sub_23DC70CF8();
  v10 = sub_23DC71088();
  if (os_log_type_enabled(v9, v10))
  {
    v19 = a1;
    v11 = swift_slowAlloc();
    v18 = v4;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v21 = v13;
    *(_DWORD *)v12 = 136446210;
    v14 = sub_23DC71430();
    v20 = sub_23DC43878(v14, v15, &v21);
    LOBYTE(a1) = v19;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v9, v10, "[%{public}s] view did appear", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v13, -1, -1);
    MEMORY[0x24263FD98](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v16 = (objc_class *)type metadata accessor for BalanceRoomViewController();
  v22.receiver = v2;
  v22.super_class = v16;
  objc_msgSendSuper2(&v22, sel_viewDidAppear_, a1 & 1);
  return sub_23DC46124();
}

uint64_t type metadata accessor for BalanceRoomViewController()
{
  uint64_t result;

  result = qword_256CF4998;
  if (!qword_256CF4998)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DC460E4(void *a1, uint64_t a2, int a3)
{
  id v4;

  v4 = a1;
  sub_23DC45EC4(a3);

}

uint64_t sub_23DC46124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  swift_getObjectType();
  v0 = sub_23DC70D04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v5 = sub_23DC70CF8();
  v6 = sub_23DC71088();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v16 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_23DC71430();
    v15 = sub_23DC43878(v9, v10, &v16);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v5, v6, "[%{public}s] reloading widgets", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v8, -1, -1);
    MEMORY[0x24263FD98](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v11 = sub_23DC70278();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    sub_23DC70E9C();
    swift_bridgeObjectRetain();
    v13 = v11 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23DC70E90();
      sub_23DC70E84();
      swift_bridgeObjectRelease();
      swift_release();
      v13 += 16;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void BalanceRoomViewController.__allocating_init(dataSource:context:hkType:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void BalanceRoomViewController.init(dataSource:context:hkType:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BalanceRoomViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceRoomViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DC463BC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for BalanceRoomViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BalanceRoomViewController.__allocating_init(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + class metadata base offset for BalanceRoomViewController))();
}

uint64_t sub_23DC46414()
{
  return type metadata accessor for BalanceRoomViewController();
}

uint64_t sub_23DC4641C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _BYTE v12[40];

  sub_23DC46550();
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DC70950();
  sub_23DC7095C();
  v6 = (void *)sub_23DC7095C();
  v7 = objc_msgSend(v6, sel_profileIdentifier);

  v8 = (void *)sub_23DC70974();
  sub_23DC710DC();

  v9 = sub_23DC708B4();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 0, 1, v9);
  sub_23DC708CC();

  sub_23DC465A4((uint64_t)v5);
  sub_23DC70968();
  v10 = a1;
  return sub_23DC709BC();
}

void sub_23DC46550()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF48E0)
  {
    sub_23DC708B4();
    v0 = sub_23DC71178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF48E0);
  }
}

uint64_t sub_23DC465A4(uint64_t a1)
{
  uint64_t v2;

  sub_23DC46550();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for SleepingSampleAnalysisHealthChecklistConfigurationProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SleepingSampleAnalysisHealthChecklistConfigurationProvider()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SleepingSampleAnalysisHealthChecklistConfigurationProvider(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
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

_QWORD *assignWithTake for SleepingSampleAnalysisHealthChecklistConfigurationProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistConfigurationProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistConfigurationProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistConfigurationProvider()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider;
}

unint64_t sub_23DC46728()
{
  unint64_t result;

  result = qword_254322AB8;
  if (!qword_254322AB8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72614, &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider);
    atomic_store(result, (unint64_t *)&qword_254322AB8);
  }
  return result;
}

uint64_t sub_23DC4676C()
{
  return sub_23DC44574(&qword_254322A98, type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler, (uint64_t)&protocol conformance descriptor for SleepingSampleAnalysisHealthChecklistActionHandler);
}

uint64_t sub_23DC46798()
{
  return sub_23DC44574(&qword_256CF49E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE41550], MEMORY[0x24BE41548]);
}

uint64_t sub_23DC467C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v2 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v15 - v8;
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  sub_23DC70158();
  swift_bridgeObjectRelease();
  v12 = sub_23DC70164();
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v9, v12);
  __break(1u);
  return result;
}

uint64_t sub_23DC4697C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v38;
  char v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t ObjCClassFromMetadata;
  id v60;
  id v61;
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
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  char v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  uint64_t v103;
  id v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t);
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  char v117;
  id v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  char v127;
  id v128;
  id v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  id v136;
  char v137;
  id v138;
  id v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  char v147;
  id v148;
  id v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  id v156;
  char v157;
  id v158;
  id v159;
  id v160;
  NSObject *v161;
  os_log_type_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  id v170;
  char *v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;

  v6 = sub_23DC70D04();
  v175 = *(_QWORD *)(v6 - 8);
  v176 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v177 = (char *)&v168 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DC70734();
  v10 = *(_QWORD *)(v9 - 8);
  v178 = v9;
  v179 = v10;
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v168 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v14, v15);
  v16 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v16, v17);
  v18 = (id)*MEMORY[0x24BDD2CA8];
  v19 = (void *)sub_23DC70C38();

  v20 = objc_msgSend(v19, sel_highestPriorityUnsatisfiedRequirement);
  if (!v20)
  {
    sub_23DC485C0(a3);
    v36 = sub_23DC707E8();
    v37 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
    v38 = a3;
    return v37(v38, 0, 1, v36);
  }
  v174 = a1;
  v180 = a3;
  v21 = sub_23DC70F5C();
  v23 = v22;
  if (v21 == sub_23DC70F5C() && v23 == v24)
    goto LABEL_10;
  v173 = a2;
  v26 = sub_23DC71394();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
  {
LABEL_11:

    v34 = sub_23DC707E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v180, 1, 1, v34);
  }
  v27 = (void *)*MEMORY[0x24BDD2CC0];
  v28 = sub_23DC70F5C();
  v30 = v29;
  if (v28 == sub_23DC70F5C() && v30 == v31)
    goto LABEL_9;
  v39 = sub_23DC71394();
  v40 = v27;
  v41 = v20;
  v171 = v13;
  v42 = v41;

  v172 = v42;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v39 & 1) != 0)
    goto LABEL_11;
  v27 = (void *)*MEMORY[0x24BDD2CE0];
  v43 = sub_23DC70F5C();
  v45 = v44;
  if (v43 == sub_23DC70F5C() && v45 == v46)
  {
LABEL_9:
    v32 = v27;
    v33 = v20;

LABEL_10:
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  v47 = sub_23DC71394();
  v48 = v27;
  v49 = v172;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_11;
  v50 = (void *)*MEMORY[0x24BDD2DB0];
  v51 = sub_23DC70F5C();
  v53 = v52;
  if (v51 == sub_23DC70F5C() && v53 == v54)
  {
    v55 = v50;
    v56 = v49;

    swift_bridgeObjectRelease_n();
LABEL_23:

    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v60 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
LABEL_24:
    v61 = v60;
    sub_23DC70194();
    v62 = sub_23DC70F74();
    v64 = v63;
    v65 = v178;
    v66 = (uint64_t)v171;
    (*(void (**)(char *, _QWORD, uint64_t))(v179 + 104))(v171, *MEMORY[0x24BE41280], v178);
    sub_23DC4A5C4(0, &qword_256CF49F0);
    v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_23DC71BC0;
    *(_QWORD *)(v67 + 32) = v62;
    *(_QWORD *)(v67 + 40) = v64;
    swift_bridgeObjectRetain();
    v68 = sub_23DC70794();
    v70 = v69;
    v71 = MEMORY[0x24263ECA0](v62, v64);
    v73 = v72;
    v74 = sub_23DC70794();
    v75 = v180;
    sub_23DC489C0(v66, v67, v68, v70, v71, v73, v74, v76, v180);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v66, v65);
    swift_bridgeObjectRelease();
    v77 = sub_23DC707E8();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))(v75, 0, 1, v77);
  }
  LODWORD(v172) = sub_23DC71394();
  v57 = v50;
  v58 = v49;

  v170 = v58;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v172 & 1) != 0)
    goto LABEL_23;
  v78 = (void *)*MEMORY[0x24BDD2D48];
  v79 = sub_23DC70F5C();
  v81 = v80;
  if (v79 == sub_23DC70F5C() && v81 == v82)
  {
    v83 = v78;
    v84 = v170;
    v85 = v170;

    swift_bridgeObjectRelease_n();
LABEL_30:

    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    v88 = swift_getObjCClassFromMetadata();
    v60 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v88);
    goto LABEL_24;
  }
  LODWORD(v172) = sub_23DC71394();
  v86 = v78;
  v84 = v170;
  v87 = v170;

  v169 = v87;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v172 & 1) != 0)
    goto LABEL_30;
  v89 = (void *)*MEMORY[0x24BDD2D80];
  v90 = sub_23DC70F5C();
  v92 = v91;
  if (v90 == sub_23DC70F5C() && v92 == v93)
  {
    v94 = v89;
    v95 = v169;
    v96 = v169;

    swift_bridgeObjectRelease_n();
    goto LABEL_35;
  }
  v97 = sub_23DC71394();
  v98 = v89;
  v95 = v169;
  v99 = v169;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v97 & 1) != 0)
  {
LABEL_35:

    v100 = v18;
    v101 = (void *)sub_23DC70C38();

    v102 = objc_msgSend(v101, sel_unsatisfiedRequirementIdentifiers);
    type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
    v103 = sub_23DC70FE0();

    v104 = (id)*MEMORY[0x24BDD2D88];
    v105 = sub_23DC49D7C((uint64_t)v104, v103);
    swift_bridgeObjectRelease();

    if ((v105 & 1) == 0)
    {
      v106 = 0xD000000000000045;
      v107 = 0x800000023DC74A70;
      v108 = (uint64_t (*)(uint64_t))MEMORY[0x24BE41580];
LABEL_37:
      v109 = v180;
      sub_23DC481B0(v108, v106, v107, v180);
LABEL_44:
      v36 = sub_23DC707E8();
      v37 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
      v38 = v109;
      return v37(v38, 0, 1, v36);
    }
LABEL_43:
    v109 = v180;
    sub_23DC477D4(v180);
    goto LABEL_44;
  }
  v110 = (void *)*MEMORY[0x24BDD2D88];
  v111 = sub_23DC70F5C();
  v113 = v112;
  if (v111 == sub_23DC70F5C() && v113 == v114)
  {
    v115 = v110;
    v116 = v99;

    swift_bridgeObjectRelease_n();
LABEL_42:

    goto LABEL_43;
  }
  v117 = sub_23DC71394();
  v118 = v110;
  v119 = v99;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v117 & 1) != 0)
    goto LABEL_42;
  v120 = (void *)*MEMORY[0x24BDD2D90];
  v121 = sub_23DC70F5C();
  v123 = v122;
  if (v121 == sub_23DC70F5C() && v123 == v124)
  {
    v125 = v120;
    v126 = v119;

    swift_bridgeObjectRelease_n();
LABEL_49:

    v109 = v180;
    sub_23DC47EA0(v174, v173, 52, 0xD000000000000034, 0x800000023DC74B70, v180);
    goto LABEL_44;
  }
  v127 = sub_23DC71394();
  v128 = v120;
  v129 = v119;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v127 & 1) != 0)
    goto LABEL_49;
  v130 = (void *)*MEMORY[0x24BDD2DB8];
  v131 = sub_23DC70F5C();
  v133 = v132;
  if (v131 == sub_23DC70F5C() && v133 == v134)
  {
    v135 = v130;
    v136 = v129;

    swift_bridgeObjectRelease_n();
LABEL_54:

    v109 = v180;
    sub_23DC47BEC(v174, v180);
    goto LABEL_44;
  }
  v137 = sub_23DC71394();
  v138 = v130;
  v139 = v129;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v137 & 1) != 0)
    goto LABEL_54;
  v140 = (void *)*MEMORY[0x24BDD2D60];
  v141 = sub_23DC70F5C();
  v143 = v142;
  if (v141 == sub_23DC70F5C() && v143 == v144)
  {
    v145 = v140;
    v146 = v139;

    swift_bridgeObjectRelease_n();
LABEL_59:

    v109 = v180;
    sub_23DC47EA0(v174, v173, 87, 0xD000000000000057, 0x800000023DC74C10, v180);
    goto LABEL_44;
  }
  v147 = sub_23DC71394();
  v148 = v140;
  v149 = v139;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v147 & 1) != 0)
    goto LABEL_59;
  v150 = (void *)*MEMORY[0x24BDD2D68];
  v151 = sub_23DC70F5C();
  v153 = v152;
  if (v151 == sub_23DC70F5C() && v153 == v154)
  {
    v155 = v150;
    v156 = v149;

    swift_bridgeObjectRelease_n();
LABEL_64:

    v106 = 0xD000000000000028;
    v107 = 0x800000023DC74C70;
    v108 = (uint64_t (*)(uint64_t))MEMORY[0x24BE41588];
    goto LABEL_37;
  }
  v157 = sub_23DC71394();
  v158 = v150;
  v159 = v149;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v157 & 1) != 0)
    goto LABEL_64;
  sub_23DC70CE0();
  v160 = v159;
  v161 = sub_23DC70CF8();
  v162 = sub_23DC7107C();
  if (os_log_type_enabled(v161, v162))
  {
    v163 = swift_slowAlloc();
    v164 = swift_slowAlloc();
    v182 = v164;
    *(_DWORD *)v163 = 136446466;
    v181 = sub_23DC43878(0xD00000000000003ALL, 0x800000023DC72550, &v182);
    sub_23DC71184();
    *(_WORD *)(v163 + 12) = 2082;
    v165 = sub_23DC70F5C();
    v181 = sub_23DC43878(v165, v166, &v182);
    sub_23DC71184();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v161, v162, "[%{public}s] Unexpected failing requirement %{public}s; hiding tile",
      (uint8_t *)v163,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v164, -1, -1);
    MEMORY[0x24263FD98](v163, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v175 + 8))(v177, v176);
  v167 = sub_23DC707E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v167 - 8) + 56))(v180, 1, 1, v167);
}

uint64_t sub_23DC477D4@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[5];
  char *v34;
  uint64_t v35;

  v35 = a1;
  sub_23DC4A608(0, &qword_256CF4A08, (void (*)(uint64_t))MEMORY[0x24BE47FD0]);
  MEMORY[0x24BDAC7A8](v1, v2);
  v34 = (char *)v33 - v3;
  sub_23DC4A608(0, &qword_256CF4A00, (void (*)(uint64_t))MEMORY[0x24BE413B0]);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v33 - v6;
  v8 = sub_23DC70734();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v13, v14);
  v15 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v15, v16);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v20 = sub_23DC70F74();
  v33[3] = v21;
  v33[4] = v20;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE412A0], v8);
  v22 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70740();
  v23 = sub_23DC7074C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v7, 0, 1, v23);
  v24 = sub_23DC70788();
  v33[1] = v25;
  v33[2] = v24;
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_23DC72550;
  sub_23DC70ED8();
  v27 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v26 + 32) = sub_23DC70F74();
  *(_QWORD *)(v26 + 40) = v28;
  sub_23DC70ED8();
  v29 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v26 + 48) = sub_23DC70F74();
  *(_QWORD *)(v26 + 56) = v30;
  sub_23DC707A0();
  v31 = sub_23DC705FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v34, 1, 1, v31);
  return sub_23DC707DC();
}

uint64_t sub_23DC47BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t ObjCClassFromMetadata;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;

  v25[1] = a1;
  v26 = a2;
  v2 = sub_23DC70734();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v7, v8);
  v9 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v9, v10);
  v11 = sub_23DC70F14();
  MEMORY[0x24BDAC7A8](v11, v12);
  v13 = sub_23DC707C4();
  v15 = v14;
  sub_23DC70F08();
  sub_23DC70EFC();
  sub_23DC70EF0();
  sub_23DC70EFC();
  sub_23DC70F20();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v18 = sub_23DC70F74();
  v20 = v19;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE41288], v2);
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_23DC71BC0;
  *(_QWORD *)(v21 + 32) = v18;
  *(_QWORD *)(v21 + 40) = v20;
  swift_bridgeObjectRetain();
  v22 = sub_23DC707AC();
  sub_23DC489C0((uint64_t)v6, v21, v22, v23, v18, v20, v13, v15, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_23DC47EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
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
  uint64_t ObjCClassFromMetadata;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v32 = a4;
  v33 = a5;
  v31 = a3;
  v35 = a2;
  v36 = a1;
  v37 = a6;
  v34 = sub_23DC70734();
  v6 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34, v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC70F14();
  MEMORY[0x24BDAC7A8](v10, v11);
  v12 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v12, v13);
  v14 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = (void *)objc_opt_self();
  v18 = objc_msgSend(v17, sel_bundleForClass_, ObjCClassFromMetadata, v31, v32, v33);
  sub_23DC70194();
  v19 = sub_23DC70F74();
  v21 = v20;
  sub_23DC70F08();
  sub_23DC70EFC();
  sub_23DC70EF0();
  sub_23DC70EFC();
  sub_23DC70F20();
  v22 = objc_msgSend(v17, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v23 = sub_23DC70F74();
  v25 = v24;
  v26 = v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BE41288], v34);
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23DC71BC0;
  *(_QWORD *)(v27 + 32) = v23;
  *(_QWORD *)(v27 + 40) = v25;
  swift_bridgeObjectRetain();
  v28 = sub_23DC707AC();
  sub_23DC489C0((uint64_t)v9, v27, v28, v29, v23, v25, v19, v21, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v26);
}

uint64_t sub_23DC481B0@<X0>(uint64_t (*a1)(uint64_t)@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjCClassFromMetadata;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;

  v37 = a2;
  v38 = a3;
  v36 = a1;
  v40 = a4;
  sub_23DC4A608(0, &qword_256CF4A08, (void (*)(uint64_t))MEMORY[0x24BE47FD0]);
  MEMORY[0x24BDAC7A8](v4, v5);
  v39 = (char *)v35 - v6;
  sub_23DC4A608(0, &qword_256CF4A00, (void (*)(uint64_t))MEMORY[0x24BE413B0]);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v35 - v9;
  v11 = sub_23DC70734();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v16, v17);
  v18 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v18, v19);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v23 = sub_23DC70F74();
  v35[0] = v24;
  v35[1] = v23;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v15, *MEMORY[0x24BE412A0], v11);
  v25 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70740();
  v26 = sub_23DC7074C();
  v27 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v10, 0, 1, v26);
  v36 = (uint64_t (*)(uint64_t))v36(v27);
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_23DC72550;
  sub_23DC70ED8();
  v29 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v28 + 32) = sub_23DC70F74();
  *(_QWORD *)(v28 + 40) = v30;
  sub_23DC70ED8();
  v31 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v28 + 48) = sub_23DC70F74();
  *(_QWORD *)(v28 + 56) = v32;
  sub_23DC707A0();
  v33 = sub_23DC705FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v39, 1, 1, v33);
  return sub_23DC707DC();
}

uint64_t sub_23DC485C0@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[3];
  char *v32;
  uint64_t v33;

  v33 = a1;
  sub_23DC4A608(0, &qword_256CF4A08, (void (*)(uint64_t))MEMORY[0x24BE47FD0]);
  MEMORY[0x24BDAC7A8](v1, v2);
  v32 = (char *)v31 - v3;
  sub_23DC4A608(0, &qword_256CF4A00, (void (*)(uint64_t))MEMORY[0x24BE413B0]);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v31 - v6;
  v8 = sub_23DC70734();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v13, v14);
  v15 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v15, v16);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v20 = sub_23DC70F74();
  v31[1] = v21;
  v31[2] = v20;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE41298], v8);
  v22 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70740();
  v23 = sub_23DC7074C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v7, 0, 1, v23);
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_23DC72550;
  sub_23DC70ED8();
  v25 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v24 + 32) = sub_23DC70F74();
  *(_QWORD *)(v24 + 40) = v26;
  sub_23DC70ED8();
  v27 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v24 + 48) = sub_23DC70F74();
  *(_QWORD *)(v24 + 56) = v28;
  sub_23DC707A0();
  v29 = sub_23DC705FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v32, 1, 1, v29);
  return sub_23DC707DC();
}

uint64_t sub_23DC489C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjCClassFromMetadata;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v36 = a8;
  v37 = a4;
  v38 = a6;
  v39 = a7;
  v40 = a5;
  v41 = a9;
  v42 = a3;
  v35 = a2;
  v33 = a1;
  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v9, v10);
  v34 = (char *)&v32 - v11;
  sub_23DC4A608(0, &qword_256CF4A00, (void (*)(uint64_t))MEMORY[0x24BE413B0]);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v32 - v14;
  v16 = sub_23DC70734();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v21, v22);
  v23 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v23, v24);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v26 = (void *)objc_opt_self();
  v27 = objc_msgSend(v26, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v33, v16);
  v28 = objc_msgSend(v26, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70740();
  v29 = sub_23DC7074C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v15, 0, 1, v29);
  v30 = sub_23DC70164();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v34, 1, 1, v30);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23DC707D0();
}

uint64_t sub_23DC48D00(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE v17[16];

  sub_23DC4A608(0, &qword_256CF4A10, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = &v17[-v8];
  v10 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = &v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DC48EA8(a3, a4, (uint64_t)v9);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_23DC4A654((uint64_t)v9);
    return 0;
  }
  else
  {
    sub_23DC4A6DC((uint64_t)v9, (uint64_t)v14, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    sub_23DC700B0();
    swift_allocObject();
    sub_23DC700A4();
    sub_23DC44574(&qword_256CF4A18, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData, (uint64_t)&protocol conformance descriptor for SleepingSampleAnalysisHealthChecklistUserData);
    v15 = sub_23DC70098();
    sub_23DC4A6A0((uint64_t)v14);
    swift_release();
  }
  return v15;
}

uint64_t sub_23DC48EA8@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  char *v23;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  char v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  char v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  id v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  char v123;
  id v124;
  id v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;
  char v134;
  id v135;
  id v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  char v147;
  id v148;
  id v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  id v163;
  char v164;
  id v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  id v177;
  char v178;
  id v179;
  id v180;
  uint64_t v181;
  id v182;
  NSObject *v183;
  os_log_type_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  id v190;
  char *v191;
  id v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  char *v196;
  char *v197;
  char *v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208[2];

  v204 = a1;
  v205 = a2;
  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v195 = (char *)&v190 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC7071C();
  v201 = *(_QWORD *)(v8 - 8);
  v202 = v8;
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v197 = (char *)&v190 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v12);
  v200 = (char *)&v190 - v13;
  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  v16 = MEMORY[0x24BDAC7A8](v14, v15);
  v198 = (char *)&v190 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16, v18);
  v203 = (char *)&v190 - v20;
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)&v190 - v22;
  v24 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  v26 = MEMORY[0x24BDAC7A8](v24, v25);
  v196 = (char *)&v190 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v26, v28);
  v199 = (char *)&v190 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29, v31);
  v34 = (char *)&v190 - v33;
  MEMORY[0x24BDAC7A8](v32, v35);
  v37 = (char *)&v190 - v36;
  v38 = (id)*MEMORY[0x24BDD2CA8];
  v39 = (void *)sub_23DC70C38();

  v40 = objc_msgSend(v39, sel_highestPriorityUnsatisfiedRequirement);
  if (!v40)
  {
    v55 = sub_23DC70164();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(a3, 3, 4, v55);
    v56 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    v57 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56);
    v58 = a3;
    return v57(v58, 0, 1, v56);
  }
  v193 = v5;
  v194 = v4;
  v206 = a3;
  v41 = sub_23DC70F5C();
  v43 = v42;
  if (v41 == sub_23DC70F5C() && v43 == v44)
    goto LABEL_8;
  v45 = sub_23DC71394();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) != 0)
  {
LABEL_9:

    v53 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v206, 1, 1, v53);
  }
  v46 = (void *)*MEMORY[0x24BDD2CC0];
  v47 = sub_23DC70F5C();
  v49 = v48;
  if (v47 == sub_23DC70F5C() && v49 == v50)
    goto LABEL_7;
  v59 = sub_23DC71394();
  v60 = v46;
  v61 = v40;
  v191 = v23;
  v62 = v61;

  v192 = v62;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v59 & 1) != 0)
    goto LABEL_9;
  v46 = (void *)*MEMORY[0x24BDD2CE0];
  v63 = sub_23DC70F5C();
  v65 = v64;
  if (v63 == sub_23DC70F5C() && v65 == v66)
  {
LABEL_7:
    v51 = v46;
    v52 = v40;

LABEL_8:
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  v67 = sub_23DC71394();
  v68 = v46;
  v69 = v192;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v67 & 1) != 0)
    goto LABEL_9;
  v70 = v69;
  v71 = (void *)*MEMORY[0x24BDD2DB0];
  v72 = sub_23DC70F5C();
  v74 = v73;
  if (v72 == sub_23DC70F5C() && v74 == v75)
  {
    v76 = v71;
    v77 = v70;

    swift_bridgeObjectRelease_n();
LABEL_21:

LABEL_22:
    v80 = v206;
    sub_23DC467C4(v206);
    v81 = sub_23DC70164();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v80, 0, 4, v81);
LABEL_23:
    v56 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    v57 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56);
    v58 = v80;
    return v57(v58, 0, 1, v56);
  }
  LODWORD(v192) = sub_23DC71394();
  v78 = v71;
  v79 = v70;

  v190 = v79;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v192 & 1) != 0)
    goto LABEL_21;
  v82 = (void *)*MEMORY[0x24BDD2D48];
  v83 = sub_23DC70F5C();
  v85 = v84;
  if (v83 == sub_23DC70F5C() && v85 == v86)
  {
    v87 = v82;
    v88 = v190;
    v89 = v190;

    swift_bridgeObjectRelease_n();
LABEL_28:

    goto LABEL_22;
  }
  v90 = sub_23DC71394();
  v91 = v82;
  v192 = v85;
  v92 = v190;
  v93 = v190;

  swift_bridgeObjectRelease();
  v88 = v92;
  swift_bridgeObjectRelease();
  if ((v90 & 1) != 0)
    goto LABEL_28;
  v94 = v93;
  v95 = (void *)*MEMORY[0x24BDD2D80];
  v96 = sub_23DC70F5C();
  v98 = v97;
  if (v96 == sub_23DC70F5C() && v98 == v99)
  {
    v100 = v95;
    v101 = v94;

    swift_bridgeObjectRelease_n();
LABEL_33:

    v104 = v38;
    v105 = (void *)sub_23DC70C38();

    v106 = objc_msgSend(v105, sel_unsatisfiedRequirementIdentifiers);
    type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
    v107 = sub_23DC70FE0();

    v108 = (id)*MEMORY[0x24BDD2D88];
    v109 = sub_23DC49D7C((uint64_t)v108, v107);
    swift_bridgeObjectRelease();

    v110 = sub_23DC70164();
    if ((v109 & 1) != 0)
      v111 = 1;
    else
      v111 = 2;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v110 - 8) + 56))(v37, v111, 4, v110);
    v112 = (uint64_t)v37;
    goto LABEL_37;
  }
  LODWORD(v205) = sub_23DC71394();
  v102 = v95;
  v103 = v94;

  v204 = v103;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v205 & 1) != 0)
    goto LABEL_33;
  v115 = (void *)*MEMORY[0x24BDD2D88];
  v116 = sub_23DC70F5C();
  v118 = v117;
  if (v116 == sub_23DC70F5C() && v118 == v119)
  {
    v120 = v115;
    v121 = v204;
    v122 = v204;

    swift_bridgeObjectRelease_n();
LABEL_43:

    v126 = sub_23DC70164();
    v80 = v206;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 56))(v206, 1, 4, v126);
    goto LABEL_23;
  }
  v123 = sub_23DC71394();
  v124 = v115;
  v121 = v204;
  v125 = v204;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v123 & 1) != 0)
    goto LABEL_43;
  v127 = (void *)*MEMORY[0x24BDD2D90];
  v128 = sub_23DC70F5C();
  v130 = v129;
  if (v128 == sub_23DC70F5C() && v130 == v131)
  {
    v132 = v127;
    v133 = v125;

    swift_bridgeObjectRelease_n();
LABEL_48:

    v137 = v191;
    sub_23DC70158();
    v138 = sub_23DC70164();
    v139 = *(_QWORD *)(v138 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v139 + 48))(v137, 1, v138);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v139 + 32))(v34, v191, v138);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v139 + 56))(v34, 0, 4, v138);
      v112 = (uint64_t)v34;
LABEL_37:
      v113 = v206;
      sub_23DC4A6DC(v112, v206, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
      v114 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v114 - 8) + 56))(v113, 0, 1, v114);
    }
    __break(1u);
    goto LABEL_73;
  }
  v134 = sub_23DC71394();
  v135 = v127;
  v136 = v125;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v134 & 1) != 0)
    goto LABEL_48;
  v140 = (void *)*MEMORY[0x24BDD2DB8];
  v141 = sub_23DC70F5C();
  v143 = v142;
  if (v141 == sub_23DC70F5C() && v143 == v144)
  {
    v145 = v140;
    v146 = v136;

    swift_bridgeObjectRelease_n();
LABEL_54:

    v150 = v200;
    v151 = v201;
    v152 = v202;
    (*(void (**)(char *, _QWORD, uint64_t))(v201 + 104))(v200, *MEMORY[0x24BE41200], v202);
    v153 = v203;
    sub_23DC70704();
    (*(void (**)(char *, uint64_t))(v151 + 8))(v150, v152);
    v154 = sub_23DC70164();
    v155 = *(_QWORD *)(v154 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v155 + 48))(v153, 1, v154);
    if ((_DWORD)result == 1)
    {
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    v156 = v199;
    (*(void (**)(char *, char *, uint64_t))(v155 + 32))(v199, v203, v154);
LABEL_62:
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v155 + 56))(v156, 0, 4, v154);
    v112 = (uint64_t)v156;
    goto LABEL_37;
  }
  v147 = sub_23DC71394();
  v148 = v140;
  v149 = v136;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v147 & 1) != 0)
    goto LABEL_54;
  v157 = (void *)*MEMORY[0x24BDD2D60];
  v158 = sub_23DC70F5C();
  v160 = v159;
  if (v158 == sub_23DC70F5C() && v160 == v161)
  {
    v162 = v157;
    v163 = v149;

    swift_bridgeObjectRelease_n();
LABEL_60:

    v168 = v201;
    v167 = v202;
    v169 = v197;
    (*(void (**)(char *, _QWORD, uint64_t))(v201 + 104))(v197, *MEMORY[0x24BE411F0], v202);
    v170 = v198;
    sub_23DC70704();
    (*(void (**)(char *, uint64_t))(v168 + 8))(v169, v167);
    v154 = sub_23DC70164();
    v155 = *(_QWORD *)(v154 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v155 + 48))(v170, 1, v154);
    if ((_DWORD)result == 1)
    {
LABEL_74:
      __break(1u);
      return result;
    }
    v156 = v196;
    (*(void (**)(char *, char *, uint64_t))(v155 + 32))(v196, v198, v154);
    goto LABEL_62;
  }
  v164 = sub_23DC71394();
  v165 = v157;
  v166 = v149;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v164 & 1) != 0)
    goto LABEL_60;
  v171 = (void *)*MEMORY[0x24BDD2D68];
  v172 = sub_23DC70F5C();
  v174 = v173;
  if (v172 == sub_23DC70F5C() && v174 == v175)
  {
    v176 = v171;
    v177 = v166;

    swift_bridgeObjectRelease_n();
LABEL_67:

    v181 = sub_23DC70164();
    v80 = v206;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v181 - 8) + 56))(v206, 4, 4, v181);
    goto LABEL_23;
  }
  v178 = sub_23DC71394();
  v179 = v171;
  v180 = v166;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v178 & 1) != 0)
    goto LABEL_67;
  sub_23DC70CE0();
  v182 = v180;
  v183 = sub_23DC70CF8();
  v184 = sub_23DC7107C();
  if (os_log_type_enabled(v183, v184))
  {
    v185 = swift_slowAlloc();
    v186 = swift_slowAlloc();
    v208[0] = v186;
    *(_DWORD *)v185 = 136446466;
    v207 = sub_23DC43878(0xD00000000000003ALL, 0x800000023DC72550, v208);
    sub_23DC71184();
    *(_WORD *)(v185 + 12) = 2082;
    v187 = sub_23DC70F5C();
    v207 = sub_23DC43878(v187, v188, v208);
    sub_23DC71184();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v183, v184, "[%{public}s] Unexpected failing requirement %{public}s; hiding tile",
      (uint8_t *)v185,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v186, -1, -1);
    MEMORY[0x24263FD98](v185, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v193 + 8))(v195, v194);
  v189 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v189 - 8) + 56))(v206, 1, 1, v189);
}

uint64_t sub_23DC49D7C(uint64_t a1, uint64_t a2)
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
  v3 = sub_23DC70F5C();
  v5 = v4;
  if (v3 == sub_23DC70F5C() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_23DC71394();
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
    v12 = sub_23DC70F5C();
    v14 = v13;
    if (v12 == sub_23DC70F5C() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_23DC71394();
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

uint64_t sub_23DC49ED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE41530];
  v3 = sub_23DC70770();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_23DC49F14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DC48D00(a1, a2, *(void **)v2, *(_QWORD *)(v2 + 8));
}

uint64_t sub_23DC49F1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_23DC4697C(*v1, v1[1], a1);
}

uint64_t sub_23DC49F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23DC7086C();
  v2 = sub_23DC70554();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
    sub_23DC524C0();
    return sub_23DC7053C();
  }
  return result;
}

uint64_t sub_23DC49F98()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23DC49FC8()
{
  sub_23DC4A05C();
  return sub_23DC70878();
}

uint64_t sub_23DC4A000()
{
  sub_23DC4A05C();
  return sub_23DC70860();
}

unint64_t sub_23DC4A040()
{
  return 0xD000000000000016;
}

unint64_t sub_23DC4A05C()
{
  unint64_t result;

  result = qword_254322AB0;
  if (!qword_254322AB0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC725AC, &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider);
    atomic_store(result, (unint64_t *)&qword_254322AB0);
  }
  return result;
}

void sub_23DC4A0A0(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23DC712EC();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_23DC4A4FC();
      v3 = sub_23DC7122C();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_23DC712EC();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x24263F744](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_23DC71154();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_23DC44CF0(0, (unint64_t *)&qword_254322E10);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_23DC71160();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_23DC71160();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      sub_23DC70AE8();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_23DC71154();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_23DC44CF0(0, (unint64_t *)&qword_254322E10);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_23DC71160();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_23DC71160();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

id sub_23DC4A3F8()
{
  unint64_t inited;
  id result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23DC4A5C4(0, (unint64_t *)&qword_254322ED8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DC72560;
  sub_23DC44CF0(0, &qword_254322E20);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(_QWORD *)(inited + 32) = result;
    sub_23DC70FEC();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_23DC712EC();
      swift_bridgeObjectRelease();
      if (v4)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_23DC4A0A0(inited);
      v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void sub_23DC4A4FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322E98)
  {
    sub_23DC44CF0(255, (unint64_t *)&qword_254322E10);
    sub_23DC4A56C();
    v0 = sub_23DC71238();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322E98);
  }
}

unint64_t sub_23DC4A56C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254322E18;
  if (!qword_254322E18)
  {
    v1 = sub_23DC44CF0(255, (unint64_t *)&qword_254322E10);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254322E18);
  }
  return result;
}

void sub_23DC4A5C4(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23DC71388();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_23DC4A608(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DC71178();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DC4A654(uint64_t a1)
{
  uint64_t v2;

  sub_23DC4A608(0, &qword_256CF4A10, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DC4A6A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DC4A6DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id HealthBalanceAppDelegate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HealthBalanceAppDelegate.init()()
{
  void *v0;
  objc_super v2;

  sub_23DC70224();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HealthBalanceAppDelegate()
{
  uint64_t result;

  result = qword_256CF4A58;
  if (!qword_256CF4A58)
    return swift_getSingletonMetadata();
  return result;
}

id HealthBalanceAppDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23DC4A900()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t HealthBalanceAppDelegate.navigationPolicy(opening:currentViewController:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;

  v4 = sub_23DC4A978(a1, a2);
  v5 = sub_23DC708C0();
  v6 = (unsigned int *)MEMORY[0x24BE42A38];
  if ((v4 & 1) == 0)
    v6 = (unsigned int *)MEMORY[0x24BE42A30];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a3, *v6, v5);
}

uint64_t sub_23DC4A978(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;

  v41[1] = swift_getObjectType();
  v3 = sub_23DC70D04();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)v41 - v10;
  sub_23DC440A8(0, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)v41 - v18;
  v20 = objc_msgSend(a2, sel_tabBarController);
  if (v20)
  {
    v21 = v20;
    v22 = v3;
    v23 = objc_msgSend(v20, sel_selectedIndex);

    v33 = v23 == (id)1;
    v3 = v22;
    if (v33)
    {
      sub_23DC70CE0();
      v24 = sub_23DC70CF8();
      v25 = sub_23DC71088();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        v43 = v27;
        *(_DWORD *)v26 = 136446210;
        v28 = sub_23DC71430();
        v42 = sub_23DC43878(v28, v29, &v43);
        sub_23DC71184();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v24, v25, "[%{public}s] on the Sharing tab, using reset to navigate to the default view instead", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v27, -1, -1);
        MEMORY[0x24263FD98](v26, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v22);
      return 0;
    }
  }
  sub_23DC701F4();
  v30 = sub_23DC701E8();
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v19, 1, v30) != 1)
  {
    sub_23DC4D890((uint64_t)v19, (uint64_t)v16);
    v32 = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v16, v30);
    v33 = v32 == *MEMORY[0x24BE3FA90] || v32 == *MEMORY[0x24BE3FA88];
    if (!v33)
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
      goto LABEL_17;
    }
    sub_23DC4D448((uint64_t)v19, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0]);
    sub_23DC70CE0();
    v34 = sub_23DC70CF8();
    v35 = sub_23DC71088();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v43 = v37;
      *(_DWORD *)v36 = 136446210;
      v38 = sub_23DC71430();
      v42 = sub_23DC43878(v38, v39, &v43);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v34, v35, "[%{public}s] opening a time scope url, using reset for a clean stack", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v37, -1, -1);
      MEMORY[0x24263FD98](v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v3);
    return 0;
  }
LABEL_17:
  sub_23DC4D448((uint64_t)v19, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0]);
  return 1;
}

uint64_t sub_23DC4ADC0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;

  v4 = sub_23DC4A978(a1, a2);
  v5 = sub_23DC708C0();
  v6 = (unsigned int *)MEMORY[0x24BE42A38];
  if ((v4 & 1) == 0)
    v6 = (unsigned int *)MEMORY[0x24BE42A30];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(a3, *v6, v5);
}

uint64_t HealthBalanceAppDelegate.openNSUA(activity:context:navigator:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = v2;
  swift_getObjectType();
  v6 = sub_23DC70D04();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v11 = a1;
  v12 = sub_23DC70CF8();
  v13 = sub_23DC71088();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v29 = v7;
    v15 = v14;
    v28 = swift_slowAlloc();
    v33 = v28;
    *(_DWORD *)v15 = 136446466;
    v30 = a2;
    v16 = sub_23DC71430();
    v31 = v3;
    v32 = sub_23DC43878(v16, v17, &v33);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    v26 = v15 + 14;
    v18 = v11;
    v19 = objc_msgSend(v18, sel_description);
    v27 = v6;
    v20 = v19;
    v21 = sub_23DC70F5C();
    v23 = v22;

    v32 = sub_23DC43878(v21, v23, &v33);
    sub_23DC71184();

    a2 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v12, v13, "[%{public}s] received request to open user activity: [%{public}s]]", (uint8_t *)v15, 0x16u);
    v24 = v28;
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v24, -1, -1);
    MEMORY[0x24263FD98](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return sub_23DC4B088(v11, a2);
}

uint64_t sub_23DC4B088(void *a1, uint64_t a2)
{
  uint64_t ObjectType;
  uint64_t (*v4)(uint64_t, uint64_t);
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
  _BYTE *v23;
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
  _BYTE *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _BYTE *v59;
  void (*v60)(_BYTE *, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_BYTE *, uint64_t);
  id v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v77[12];
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  _BYTE *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  _BYTE *v96;
  _BYTE *v97;
  _BYTE *v98;
  _BYTE *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102[2];

  v89 = a2;
  ObjectType = swift_getObjectType();
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_23DC440A8(0, &qword_256CF4A68, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5, v6);
  v97 = &v77[-v7];
  v8 = sub_23DC70980();
  v91 = *(_QWORD *)(v8 - 8);
  v92 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v90 = &v77[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DC440A8(0, &qword_256CF4A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAF0], v4);
  MEMORY[0x24BDAC7A8](v11, v12);
  v87 = &v77[-v13];
  v14 = sub_23DC7020C();
  v100 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14, v15);
  v96 = &v77[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v93 = v17;
  MEMORY[0x24BDAC7A8](v16, v18);
  v98 = &v77[-v19];
  sub_23DC440A8(0, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0], v4);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = &v77[-v22];
  v24 = sub_23DC701E8();
  v25 = *(_QWORD *)(v24 - 8);
  v27 = MEMORY[0x24BDAC7A8](v24, v26);
  v95 = &v77[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v88 = v28;
  MEMORY[0x24BDAC7A8](v27, v29);
  v99 = &v77[-v30];
  v31 = sub_23DC70D04();
  v86 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31, v32);
  v34 = &v77[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DC70CE0();
  v35 = a1;
  v36 = sub_23DC70CF8();
  v37 = sub_23DC71088();
  v38 = v37;
  v85 = v36;
  v39 = os_log_type_enabled(v36, v37);
  v94 = ObjectType;
  if (v39)
  {
    v40 = swift_slowAlloc();
    v84 = v14;
    v41 = v40;
    v81 = swift_slowAlloc();
    v102[0] = v81;
    *(_DWORD *)v41 = 136446466;
    v83 = v24;
    v42 = sub_23DC71430();
    v82 = v25;
    v101 = sub_23DC43878(v42, v43, v102);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2082;
    v79 = v41 + 14;
    v44 = v35;
    v45 = objc_msgSend(v44, sel_description);
    v80 = v31;
    v78 = v38;
    v46 = v45;
    v47 = sub_23DC70F5C();
    v49 = v48;

    v50 = v47;
    v24 = v83;
    v101 = sub_23DC43878(v50, v49, v102);
    sub_23DC71184();

    v25 = v82;
    swift_bridgeObjectRelease();
    v51 = v85;
    _os_log_impl(&dword_23DC3D000, v85, (os_log_type_t)v78, "[%{public}s] navigating to activity: %{public}s", (uint8_t *)v41, 0x16u);
    v52 = v81;
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v52, -1, -1);
    v53 = v41;
    v14 = v84;
    MEMORY[0x24263FD98](v53, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v86 + 8))(v34, v80);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v86 + 8))(v34, v31);
  }
  sub_23DC70200();
  v54 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24);
  v55 = (uint64_t)v87;
  if (v54 == 1)
  {
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v25 + 104))(v99, *MEMORY[0x24BE3FA80], v24);
    sub_23DC4D448((uint64_t)v23, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0]);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v25 + 32))(v99, v23, v24);
  }
  sub_23DC70218();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v55, 1, v14) == 1)
  {
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v100 + 104))(v98, *MEMORY[0x24BE3FAE8], v14);
    sub_23DC4D448(v55, &qword_256CF4A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAF0]);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v100 + 32))(v98, v55, v14);
  }
  sub_23DC4D48C();
  v56 = swift_allocObject();
  *(_DWORD *)(v56 + 24) = 0;
  *(_QWORD *)(v56 + 16) = v35;
  v87 = (_BYTE *)v56;
  v57 = v35;
  v59 = v90;
  v58 = v91;
  v60 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v91 + 16);
  v61 = v92;
  v60(v90, v89, v92);
  sub_23DC4D500();
  v62 = swift_allocObject();
  *(_DWORD *)(v62 + ((*(unsigned int *)(*(_QWORD *)v62 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  v60((_BYTE *)(v62 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v62 + 16)), (uint64_t)v59, v61);
  v63 = *(void (**)(_BYTE *, uint64_t))(v58 + 8);
  v64 = v57;
  v63(v59, v61);
  v65 = sub_23DC71058();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v97, 1, 1, v65);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v25 + 16))(v95, v99, v24);
  v66 = v100;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v100 + 16))(v96, v98, v14);
  sub_23DC71040();
  swift_retain();
  swift_retain();
  v92 = sub_23DC71034();
  v67 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v68 = (v88 + v67 + 7) & 0xFFFFFFFFFFFFFFF8;
  v69 = (v68 + 15) & 0xFFFFFFFFFFFFFFF8;
  v70 = (*(unsigned __int8 *)(v66 + 80) + v69 + 8) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  v71 = (v93 + v70 + 7) & 0xFFFFFFFFFFFFFFF8;
  v72 = v14;
  v73 = swift_allocObject();
  v74 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v73 + 16) = v92;
  *(_QWORD *)(v73 + 24) = v74;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v25 + 32))(v73 + v67, v95, v24);
  *(_QWORD *)(v73 + v68) = v87;
  *(_QWORD *)(v73 + v69) = v62;
  v75 = v100;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v100 + 32))(v73 + v70, v96, v72);
  *(_QWORD *)(v73 + v71) = v94;
  sub_23DC4D17C((uint64_t)v97, (uint64_t)&unk_256CF4A98, v73);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v75 + 8))(v98, v72);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v25 + 8))(v99, v24);
}

uint64_t HealthBalanceAppDelegate.openURL(url:context:navigator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ObjectType;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a2;
  ObjectType = swift_getObjectType();
  v5 = sub_23DC70164();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC70D04();
  v30 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v31 = a1;
  v14(v9, a1, v5);
  v15 = sub_23DC70CF8();
  v16 = sub_23DC71088();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v34 = v28;
    *(_DWORD *)v17 = 136446466;
    v18 = sub_23DC71430();
    ObjectType = a3;
    v33 = sub_23DC43878(v18, v19, &v34);
    v27 = v10;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    sub_23DC44574(&qword_256CF4A28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v20 = sub_23DC7137C();
    v33 = sub_23DC43878(v20, v21, &v34);
    a3 = ObjectType;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    _os_log_impl(&dword_23DC3D000, v15, v16, "[%{public}s] received request to open url: [%{public}s]]", (uint8_t *)v17, 0x16u);
    v22 = v28;
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v22, -1, -1);
    MEMORY[0x24263FD98](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v27);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v10);
  }
  sub_23DC70284();
  v23 = (void *)sub_23DC70800();
  swift_bridgeObjectRelease();
  sub_23DC701D0();
  sub_23DC4B088(v23, v32);

  v24 = sub_23DC70AA0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a3, 1, 1, v24);
}

uint64_t sub_23DC4BB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  v9 = sub_23DC70D04();
  v8[11] = v9;
  v8[12] = *(_QWORD *)(v9 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = sub_23DC70884();
  v8[15] = swift_task_alloc();
  sub_23DC440A8(0, &qword_256CF4AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v8[16] = swift_task_alloc();
  v10 = sub_23DC70188();
  v8[17] = v10;
  v8[18] = *(_QWORD *)(v10 - 8);
  v8[19] = swift_task_alloc();
  v8[20] = swift_task_alloc();
  v8[21] = swift_task_alloc();
  v11 = sub_23DC701E8();
  v8[22] = v11;
  v8[23] = *(_QWORD *)(v11 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  sub_23DC71040();
  v8[27] = sub_23DC71034();
  sub_23DC71028();
  return swift_task_switch();
}

uint64_t sub_23DC4BCE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v6 == *MEMORY[0x24BE3FA98])
  {
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 64);
    v9 = sub_23DC4C334(*(_QWORD *)(v0 + 56), v8, 0);
    sub_23DC4CE0C(v9, v8, v7);

  }
  else if (v6 == *MEMORY[0x24BE3FA80])
  {

  }
  else if (v6 == *MEMORY[0x24BE3FA90])
  {
    v10 = *(_QWORD *)(v0 + 168);
    v11 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 128);
    v13 = *(_QWORD *)(v0 + 136);
    v54 = *(_QWORD *)(v0 + 64);
    v51 = *(_QWORD *)(v0 + 56);
    sub_23DC7017C();
    sub_23DC7089C();
    sub_23DC70170();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v12, v10, v13);
    sub_23DC700BC();
    v15 = sub_23DC700C8();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
    *(_QWORD *)(v0 + 32) = MEMORY[0x24BEE4AF8];
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BE42510];
    sub_23DC44574(&qword_256CF4AB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42510], MEMORY[0x24BE42520]);
    sub_23DC440A8(0, &qword_256CF4AC0, v16, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DC4D830();
    sub_23DC711C0();
    v17 = (void *)sub_23DC70890();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v13);
  }
  else if (v6 == *MEMORY[0x24BE3FA88])
  {
    v19 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 168);
    v20 = *(_QWORD *)(v0 + 144);
    v21 = *(_QWORD *)(v0 + 152);
    v23 = *(_QWORD *)(v0 + 128);
    v22 = *(_QWORD *)(v0 + 136);
    v57 = v20;
    v52 = *(_QWORD *)(v0 + 56);
    v55 = *(_QWORD *)(v0 + 64);
    sub_23DC7017C();
    sub_23DC7089C();
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v24(v19, v18, v22);
    v24(v21, v18, v22);
    sub_23DC700BC();
    v25 = sub_23DC700C8();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 0, 1, v25);
    *(_QWORD *)(v0 + 40) = MEMORY[0x24BEE4AF8];
    v26 = (uint64_t (*)(uint64_t))MEMORY[0x24BE42510];
    sub_23DC44574(&qword_256CF4AB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE42510], MEMORY[0x24BE42520]);
    sub_23DC440A8(0, &qword_256CF4AC0, v26, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DC4D830();
    sub_23DC711C0();
    v27 = (void *)sub_23DC70890();

    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v18, v22);
  }
  else
  {
    v28 = *(_QWORD *)(v0 + 200);
    v29 = *(_QWORD *)(v0 + 176);
    v30 = *(_QWORD *)(v0 + 48);
    sub_23DC70CE0();
    v5(v28, v30, v29);
    v31 = sub_23DC70CF8();
    v32 = sub_23DC71070();
    v33 = os_log_type_enabled(v31, v32);
    v34 = *(_QWORD *)(v0 + 200);
    if (v33)
    {
      v35 = *(_QWORD *)(v0 + 192);
      v48 = *(_QWORD *)(v0 + 176);
      v50 = *(_QWORD *)(v0 + 184);
      v53 = *(_QWORD *)(v0 + 96);
      v56 = *(_QWORD *)(v0 + 88);
      v58 = *(_QWORD *)(v0 + 104);
      v36 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v59 = v49;
      *(_DWORD *)v36 = 136446466;
      v37 = sub_23DC71430();
      *(_QWORD *)(v0 + 16) = sub_23DC43878(v37, v38, &v59);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2082;
      v5(v35, v34, v48);
      v39 = sub_23DC70F80();
      *(_QWORD *)(v0 + 24) = sub_23DC43878(v39, v40, &v59);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      v41 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v41(v34, v48);
      _os_log_impl(&dword_23DC3D000, v31, v32, "[%{public}s] asked to navigate with unsupported route: %{public}s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v49, -1, -1);
      MEMORY[0x24263FD98](v36, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v58, v56);
    }
    else
    {
      v43 = *(_QWORD *)(v0 + 96);
      v42 = *(_QWORD *)(v0 + 104);
      v44 = *(_QWORD *)(v0 + 88);
      v41 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 184) + 8);
      v41(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176));

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    }
    v45 = *(_QWORD *)(v0 + 208);
    v46 = *(_QWORD *)(v0 + 176);

    v41(v45, v46);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_23DC4C334(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
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
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  os_unfair_lock_s *v42;
  _QWORD *v43;
  void (*v44)(char *, uint64_t, uint64_t);
  void (*v45)(char *, uint64_t);
  void *v46;
  id v47;
  void *v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  unint64_t v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  char *v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  id v97;
  void *v98;
  os_unfair_lock_s *v99;
  id v100;
  id v101;
  uint64_t v103;
  void *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  v4 = v3;
  v113 = a2;
  v110 = a1;
  v6 = sub_23DC70980();
  v114 = *(_QWORD **)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC709C8();
  v111 = *(_QWORD *)(v10 - 8);
  v112 = v10;
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v109 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v103 - v15;
  v17 = sub_23DC70D04();
  v18 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v106 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v108 = (char *)&v103 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23, v25);
  v105 = (char *)&v103 - v27;
  MEMORY[0x24BDAC7A8](v26, v28);
  v30 = (char *)&v103 - v29;
  sub_23DC70CE0();
  v31 = sub_23DC70CF8();
  v32 = sub_23DC71088();
  v33 = os_log_type_enabled(v31, v32);
  v115 = v16;
  v116 = v17;
  v107 = v4;
  if (v33)
  {
    v34 = swift_slowAlloc();
    v103 = v18;
    v35 = (uint8_t *)v34;
    v36 = swift_slowAlloc();
    v118 = v36;
    v104 = a3;
    *(_DWORD *)v35 = 136446210;
    v37 = sub_23DC71430();
    v117 = sub_23DC43878(v37, v38, &v118);
    a3 = v104;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v31, v32, "[%{public}s] navigating to balance room", v35, 0xCu);
    swift_arrayDestroy();
    v39 = v36;
    v16 = v115;
    MEMORY[0x24263FD98](v39, -1, -1);
    MEMORY[0x24263FD98](v35, -1, -1);

    v40 = *(void (**)(char *, uint64_t))(v103 + 8);
    v40(v30, v116);
  }
  else
  {

    v40 = *(void (**)(char *, uint64_t))(v18 + 8);
    v40(v30, v17);
  }
  v41 = v113 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v113 + 16);
  v42 = (os_unfair_lock_s *)(v113 + ((*(unsigned int *)(*(_QWORD *)v113 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v42);
  v43 = v114;
  v44 = (void (*)(char *, uint64_t, uint64_t))v114[2];
  v44(v9, v41, v6);
  os_unfair_lock_unlock(v42);
  sub_23DC4641C(a3);
  v45 = (void (*)(char *, uint64_t))v43[1];
  v45(v9, v6);
  os_unfair_lock_lock(v42);
  v44(v9, v41, v6);
  os_unfair_lock_unlock(v42);
  v46 = (void *)sub_23DC70974();
  v45(v9, v6);
  v47 = objc_msgSend(v46, sel_navigationController);
  v114 = v46;
  if (!v47)
  {
    v65 = v106;
    sub_23DC70CE0();
    v66 = sub_23DC70CF8();
    v67 = sub_23DC71088();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = swift_slowAlloc();
      v118 = v69;
      *(_DWORD *)v68 = 136446210;
      v70 = sub_23DC71430();
      v117 = sub_23DC43878(v70, v71, &v118);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v66, v67, "[%{public}s] showing balance room", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v69, -1, -1);
      MEMORY[0x24263FD98](v68, -1, -1);
    }

    v40(v65, v116);
    v72 = v110;
    v73 = v111;
    v74 = (uint64_t)v109;
    v75 = v112;
    (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v109, v16, v112);
    v76 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    v77 = BalanceRoomViewController.init(context:)(v74);
    os_unfair_lock_lock((os_unfair_lock_t)(v72 + 24));
    v78 = *(id *)(v72 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)(v72 + 24));
    v79 = v114;
    objc_msgSend(v114, sel_showViewController_sender_, v77, v78);

    goto LABEL_41;
  }
  v48 = v47;
  v49 = objc_msgSend(v47, sel_viewControllers);
  sub_23DC44CF0(0, (unint64_t *)&qword_256CF4AD0);
  v50 = sub_23DC70FE0();

  if (!(v50 >> 62))
  {
    v51 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v51)
      goto LABEL_7;
LABEL_14:
    swift_bridgeObjectRelease_n();
    v57 = v108;
    sub_23DC70CE0();
    v58 = sub_23DC70CF8();
    v59 = sub_23DC71088();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v61 = swift_slowAlloc();
      v118 = v61;
      *(_DWORD *)v60 = 136446210;
      v62 = sub_23DC71430();
      v117 = sub_23DC43878(v62, v63, &v118);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v58, v59, "[%{public}s] adding balance room to navigation stack", v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v61, -1, -1);
      MEMORY[0x24263FD98](v60, -1, -1);

      v64 = v108;
    }
    else
    {

      v64 = v57;
    }
    v40(v64, v116);
    v73 = v111;
    v75 = v112;
    v80 = (uint64_t)v109;
    v16 = v115;
    (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v109, v115, v112);
    v81 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    v82 = BalanceRoomViewController.init(context:)(v80);
    v83 = objc_msgSend(v48, sel_viewControllers);
    v84 = sub_23DC70FE0();

    if (v84 >> 62)
    {
      swift_bridgeObjectRetain();
      v85 = (id)sub_23DC712EC();
      swift_bridgeObjectRelease();
      if (v85)
        goto LABEL_22;
    }
    else
    {
      v85 = *(id *)((v84 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v85)
      {
LABEL_22:
        if ((v84 & 0xC000000000000001) != 0)
        {
          v86 = (id)MEMORY[0x24263F744](0, v84);
        }
        else
        {
          if (!*(_QWORD *)((v84 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_44;
          }
          v86 = *(id *)(v84 + 32);
        }
        v87 = v86;
        swift_bridgeObjectRelease();
        v118 = MEMORY[0x24BEE4AF8];
        if (v87)
        {
          v88 = v82;
          v85 = v87;
          MEMORY[0x24263F4B0]();
          if (*(_QWORD *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          {
LABEL_27:
            sub_23DC71004();
            sub_23DC70FEC();
LABEL_38:
            v77 = v82;
            MEMORY[0x24263F4B0]();
            if (*(_QWORD *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_23DC70FF8();
            sub_23DC71004();
            sub_23DC70FEC();

            v98 = (void *)sub_23DC70FD4();
            swift_bridgeObjectRelease();
            objc_msgSend(v48, sel_setViewControllers_animated_, v98, 0);

            v72 = v110;
            v79 = v114;
            goto LABEL_41;
          }
LABEL_44:
          sub_23DC70FF8();
          goto LABEL_27;
        }
LABEL_37:
        v97 = v82;
        v85 = 0;
        goto LABEL_38;
      }
    }
    swift_bridgeObjectRelease();
    v118 = MEMORY[0x24BEE4AF8];
    goto LABEL_37;
  }
LABEL_33:
  swift_bridgeObjectRetain();
  v51 = sub_23DC712EC();
  if (!v51)
    goto LABEL_14;
LABEL_7:
  v52 = 4;
  while (1)
  {
    if ((v50 & 0xC000000000000001) != 0)
      v53 = (id)MEMORY[0x24263F744](v52 - 4, v50);
    else
      v53 = *(id *)(v50 + 8 * v52);
    v54 = v53;
    v55 = v52 - 3;
    if (__OFADD__(v52 - 4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    type metadata accessor for BalanceRoomViewController();
    v56 = swift_dynamicCastClass();
    if (v56)
      break;

    ++v52;
    if (v55 == v51)
      goto LABEL_14;
  }
  v77 = (id)v56;
  swift_bridgeObjectRelease_n();
  v89 = v105;
  sub_23DC70CE0();
  v90 = sub_23DC70CF8();
  v91 = sub_23DC71088();
  if (os_log_type_enabled(v90, v91))
  {
    v92 = (uint8_t *)swift_slowAlloc();
    v93 = swift_slowAlloc();
    v118 = v93;
    *(_DWORD *)v92 = 136446210;
    v94 = sub_23DC71430();
    v117 = sub_23DC43878(v94, v95, &v118);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v90, v91, "[%{public}s] found existing balance room", v92, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v93, -1, -1);
    MEMORY[0x24263FD98](v92, -1, -1);

    v96 = v105;
  }
  else
  {

    v96 = v89;
  }
  v40(v96, v116);
  v73 = v111;
  v75 = v112;
  v72 = v110;
  v79 = v114;
  v16 = v115;
LABEL_41:
  v99 = (os_unfair_lock_s *)(v72 + 24);
  v100 = v77;
  os_unfair_lock_lock((os_unfair_lock_t)(v72 + 24));
  v101 = *(id *)(v72 + 16);
  os_unfair_lock_unlock(v99);
  objc_msgSend(v100, sel_restoreUserActivityState_, v101);

  (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v75);
  return v100;
}

void sub_23DC4CE0C(void *a1, uint64_t a2, uint64_t a3)
{
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
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  objc_class *v35;
  _BYTE *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;

  v6 = sub_23DC7020C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DC70980();
  v46 = *(_QWORD *)(v11 - 8);
  v47 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23DC70D04();
  v44 = *(_QWORD *)(v15 - 8);
  v45 = v15;
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v19 = sub_23DC70CF8();
  v20 = sub_23DC71088();
  if (os_log_type_enabled(v19, v20))
  {
    v40 = v10;
    v21 = swift_slowAlloc();
    v41 = v6;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v42 = a1;
    v24 = v23;
    v49 = v23;
    v39 = a3;
    *(_DWORD *)v22 = 136446210;
    v25 = sub_23DC71430();
    v43 = a2;
    v48 = sub_23DC43878(v25, v26, &v49);
    a3 = v39;
    v10 = v40;
    sub_23DC71184();
    a2 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v19, v20, "[%{public}s] presenting balance onboarding", v22, 0xCu);
    swift_arrayDestroy();
    v27 = v24;
    a1 = v42;
    MEMORY[0x24263FD98](v27, -1, -1);
    v28 = v22;
    v6 = v41;
    MEMORY[0x24263FD98](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v45);
  v29 = a2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a2 + 16);
  v30 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(_QWORD *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v30);
  v32 = v46;
  v31 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v14, v29, v47);
  os_unfair_lock_unlock(v30);
  v33 = sub_23DC7095C();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a3, v6);
  sub_23DC6C43C(v10, (char *)&v49);
  v34 = v49;
  v35 = (objc_class *)type metadata accessor for BalanceOnboardingNavigationController();
  v36 = objc_allocWithZone(v35);
  *(_QWORD *)&v36[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(_QWORD *)&v36[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = v33;
  v36[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v34;
  v50.receiver = v36;
  v50.super_class = v35;
  v37 = objc_msgSendSuper2(&v50, sel_initWithNibName_bundle_, 0, 0);
  sub_23DC6BC58();
  sub_23DC6D7DC();
  swift_release();
  objc_msgSend(v37, sel_setModalPresentationStyle_, 2);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v37, 1, 0);

}

uint64_t sub_23DC4D17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23DC71058();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23DC7104C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23DC4D448(a1, &qword_256CF4A68, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990]);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23DC71028();
    sub_23DC70AE8();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23DC4D2D0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23DC4D334;
  return v6(a1);
}

uint64_t sub_23DC4D334()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23DC4D380()
{
  return sub_23DC44574((unint64_t *)&qword_256CF4E70, (uint64_t (*)(uint64_t))type metadata accessor for HealthBalanceAppDelegate, (uint64_t)&protocol conformance descriptor for HealthBalanceAppDelegate);
}

uint64_t sub_23DC4D3AC()
{
  return type metadata accessor for HealthBalanceAppDelegate();
}

uint64_t sub_23DC4D3B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC70230();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for HealthBalanceAppDelegate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthBalanceAppDelegate.open(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t sub_23DC4D448(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DC440A8(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_23DC4D48C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4A78)
  {
    sub_23DC44CF0(255, &qword_256CF4A80);
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DC7128C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4A78);
  }
}

void sub_23DC4D500()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4A88)
  {
    sub_23DC70980();
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DC7128C();
    if (!v1)
      atomic_store(v0, &qword_256CF4A88);
  }
}

uint64_t sub_23DC4D564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_23DC701E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_23DC7020C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + v4 + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  sub_23DC70AE8();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23DC4D65C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(sub_23DC701E8() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(sub_23DC7020C() - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + v7 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  v12 = *(_QWORD *)(v1 + v6);
  v13 = *(_QWORD *)(v1 + v7);
  v14 = v1 + v5;
  v15 = v1 + v9;
  v16 = *(_QWORD *)(v1 + ((*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFF8));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = sub_23DC4D754;
  return sub_23DC4BB64(a1, v10, v11, v14, v12, v13, v15, v16);
}

uint64_t sub_23DC4D754()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23DC4D79C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DC4D7C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23DC4D754;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256CF4AA0 + dword_256CF4AA0))(a1, v4);
}

unint64_t sub_23DC4D830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4AC8;
  if (!qword_256CF4AC8)
  {
    sub_23DC440A8(255, &qword_256CF4AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BE42510], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4AC8);
  }
  return result;
}

uint64_t sub_23DC4D890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC440A8(0, (unint64_t *)&unk_256CF4F20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FAA0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for AboutBalanceArticleDataProvider()
{
  return &type metadata for AboutBalanceArticleDataProvider;
}

unint64_t sub_23DC4D900()
{
  return 0xD00000000000002ELL;
}

id sub_23DC4D92C()
{
  unint64_t inited;
  id result;
  uint64_t v2;

  sub_23DC50194();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DC72560;
  result = objc_msgSend((id)objc_opt_self(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(_QWORD *)(inited + 32) = result;
    sub_23DC70FEC();
    v2 = sub_23DC4F58C(inited);
    swift_bridgeObjectRelease();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DC4D9CC(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_23DC711F0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23DC501EC();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      sub_23DC70AE8();
      return 0;
    }
    result = sub_23DC711E4();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_23DC4DDF4(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_23DC4DFD4();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_23DC4E544((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_23DC71154();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_23DC501EC();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_23DC71160();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_23DC71160();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_23DC4E5C4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23DC4DC48(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23DC713C4();
  swift_bridgeObjectRetain();
  sub_23DC70FA4();
  v8 = sub_23DC713DC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23DC71394() & 1) != 0)
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
      if (v19 || (sub_23DC71394() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23DC4E738(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23DC4DDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    sub_23DC4A4FC();
    v2 = sub_23DC71220();
    v14 = v2;
    sub_23DC711D8();
    if (sub_23DC711FC())
    {
      sub_23DC501EC();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_23DC4DFD4();
          v2 = v14;
        }
        result = sub_23DC71154();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23DC711FC());
    }
    swift_release();
  }
  else
  {
    sub_23DC70AE8();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_23DC4DFD4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  sub_23DC4A4FC();
  v3 = sub_23DC71214();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_23DC71154();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23DC4E26C()
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
  sub_23DC50228();
  v3 = sub_23DC71214();
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
      sub_23DC713C4();
      sub_23DC70FA4();
      result = sub_23DC713DC();
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

unint64_t sub_23DC4E544(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_23DC71154();
  result = sub_23DC711CC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_23DC4E5C4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23DC4DFD4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23DC4E8D0();
      goto LABEL_14;
    }
    sub_23DC4EC20();
  }
  v8 = *v3;
  v9 = sub_23DC71154();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_23DC501EC();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_23DC71160();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_23DC713A0();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_23DC71160();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_23DC4E738(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23DC4E26C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23DC4EA74();
      goto LABEL_22;
    }
    sub_23DC4EE94();
  }
  v11 = *v4;
  sub_23DC713C4();
  sub_23DC70FA4();
  result = sub_23DC713DC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23DC71394(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23DC713A0();
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
          result = sub_23DC71394();
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

id sub_23DC4E8D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_23DC4A4FC();
  v2 = *v0;
  v3 = sub_23DC71208();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23DC4EA74()
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
  sub_23DC50228();
  v2 = *v0;
  v3 = sub_23DC71208();
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

uint64_t sub_23DC4EC20()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  sub_23DC4A4FC();
  v3 = sub_23DC71214();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_23DC71154();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23DC4EE94()
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
  sub_23DC50228();
  v3 = sub_23DC71214();
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
    sub_23DC713C4();
    swift_bridgeObjectRetain();
    sub_23DC70FA4();
    result = sub_23DC713DC();
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

uint64_t sub_23DC4F13C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  return sub_23DC70F68();
}

uint64_t sub_23DC4F264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  return sub_23DC70F68();
}

uint64_t sub_23DC4F38C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  return sub_23DC70F68();
}

id sub_23DC4F4B4()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  id v3;

  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_23DC70F38();
  v3 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v2, v1, 0);

  if (v3)
    return v3;
  else
    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
}

uint64_t sub_23DC4F58C(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23DC712EC();
    swift_bridgeObjectRelease();
  }
  sub_23DC501EC();
  sub_23DC4A56C();
  result = sub_23DC71064();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_23DC712EC();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x24263F744](i, a1);
        sub_23DC4D9CC(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_23DC4D9CC(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DC4F6D4()
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
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t ObjCClassFromMetadata;
  void *v16;
  id v17;
  char *v18;
  uint64_t v19;
  void (*v20)(unint64_t, uint64_t, uint64_t);
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  void (*v29)(unint64_t, uint64_t, uint64_t);
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(unint64_t, uint64_t, uint64_t);
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(unint64_t, uint64_t, uint64_t);
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(unint64_t, uint64_t, uint64_t);
  unint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void (*v75)(unint64_t, uint64_t, uint64_t);
  unint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  id v86;
  uint64_t v87;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  id v95;
  unint64_t v96;
  void (*v97)(unint64_t, uint64_t, uint64_t);
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = (char *)&v89 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_23DC50140();
  v6 = sub_23DC706BC();
  v7 = *(_QWORD *)(v6 - 8);
  v99 = v6;
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  v90 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_23DC72750;
  v11 = v10 + v9;
  *(_QWORD *)v11 = sub_23DC4F4B4();
  *(_BYTE *)(v11 + 8) = 0;
  v12 = *MEMORY[0x24BE3F908];
  v97 = *(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 104);
  v13 = v11;
  v97(v11, v12, v6);
  v14 = (uint64_t *)(v11 + v8);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v16 = (void *)objc_opt_self();
  v100 = ObjCClassFromMetadata;
  v17 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v96 = 0x800000023DC74DC0;
  v18 = v3;
  *v14 = sub_23DC70F68();
  v14[1] = v19;
  v20 = v97;
  v97(v11 + v8, *MEMORY[0x24BE3F910], v99);
  v92 = 2 * v8;
  v21 = v11 + 2 * v8;
  sub_23DC70ED8();
  v22 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)v21 = sub_23DC70F68();
  *(_QWORD *)(v21 + 8) = v23;
  *(_BYTE *)(v21 + 16) = 0;
  v98 = *MEMORY[0x24BE3F930];
  v24 = v98;
  v25 = v99;
  v20(v21, v98, v99);
  v26 = v11 + v92 + v8;
  sub_23DC70ED8();
  v27 = objc_msgSend(v16, sel_bundleForClass_, v100);
  sub_23DC70194();
  *(_QWORD *)v26 = sub_23DC70F68();
  *(_QWORD *)(v26 + 8) = v28;
  *(_BYTE *)(v26 + 16) = 0;
  v29 = v97;
  v97(v26, v24, v25);
  v30 = v11 + 4 * v8;
  v94 = v13;
  sub_23DC70ED8();
  v31 = objc_msgSend(v16, sel_bundleForClass_, v100);
  sub_23DC70194();
  *(_QWORD *)v30 = sub_23DC70F68();
  *(_QWORD *)(v30 + 8) = v32;
  *(_BYTE *)(v30 + 16) = 0;
  v29(v13 + 4 * v8, v98, v99);
  v33 = (uint64_t *)(v13 + 5 * v8);
  sub_23DC70ED8();
  v95 = v16;
  v34 = v100;
  v35 = objc_msgSend(v16, sel_bundleForClass_, v100);
  sub_23DC70194();
  *v33 = sub_23DC70F68();
  v33[1] = v36;
  v33[2] = 0;
  LODWORD(v92) = *MEMORY[0x24BE3F8D0];
  v37 = v99;
  v38 = v97;
  ((void (*)(uint64_t *))v97)(v33);
  v39 = v94 + 6 * v8;
  sub_23DC70ED8();
  v40 = objc_msgSend(v16, sel_bundleForClass_, v34);
  sub_23DC70194();
  *(_QWORD *)v39 = sub_23DC70F68();
  *(_QWORD *)(v39 + 8) = v41;
  *(_BYTE *)(v39 + 16) = 0;
  v42 = v98;
  v38(v39, v98, v37);
  v93 = v8;
  v91 = 8 * v8;
  v43 = v94;
  v44 = v94 + 7 * v8;
  sub_23DC70ED8();
  v45 = v95;
  v46 = v100;
  v47 = objc_msgSend(v95, sel_bundleForClass_, v100);
  sub_23DC70194();
  *(_QWORD *)v44 = sub_23DC70F68();
  *(_QWORD *)(v44 + 8) = v48;
  *(_BYTE *)(v44 + 16) = 0;
  v49 = v42;
  v50 = v99;
  v38(v44, v49, v99);
  v51 = (uint64_t *)(v43 + v91);
  v52 = v43;
  sub_23DC70ED8();
  v53 = objc_msgSend(v45, sel_bundleForClass_, v46);
  sub_23DC70194();
  *v51 = sub_23DC70F68();
  v51[1] = v54;
  v51[2] = 0;
  v55 = v50;
  v56 = v97;
  v97((unint64_t)v51, v92, v50);
  v57 = v93;
  v58 = v52 + v91 + v93;
  sub_23DC70ED8();
  v59 = v95;
  v60 = objc_msgSend(v95, sel_bundleForClass_, v100);
  sub_23DC70194();
  v89 = v18;
  *(_QWORD *)v58 = sub_23DC70F68();
  *(_QWORD *)(v58 + 8) = v61;
  *(_BYTE *)(v58 + 16) = 0;
  v62 = v98;
  v56(v58, v98, v55);
  v63 = v56;
  v64 = v94;
  v65 = v94 + 10 * v57;
  sub_23DC70ED8();
  v66 = objc_msgSend(v59, sel_bundleForClass_, v100);
  sub_23DC70194();
  *(_QWORD *)v65 = sub_23DC70F68();
  *(_QWORD *)(v65 + 8) = v67;
  *(_BYTE *)(v65 + 16) = 0;
  v68 = v99;
  v63(v65, v62, v99);
  v69 = v93;
  v70 = (uint64_t *)(v64 + 11 * v93);
  sub_23DC70ED8();
  v71 = v95;
  v72 = v100;
  v73 = objc_msgSend(v95, sel_bundleForClass_, v100);
  sub_23DC70194();
  *v70 = sub_23DC70F68();
  v70[1] = v74;
  v70[2] = 0;
  v75 = v97;
  v97(v64 + 11 * v69, v92, v68);
  v76 = v64 + 12 * v69;
  sub_23DC70ED8();
  v77 = objc_msgSend(v71, sel_bundleForClass_, v72);
  sub_23DC70194();
  *(_QWORD *)v76 = sub_23DC70F68();
  *(_QWORD *)(v76 + 8) = v78;
  *(_BYTE *)(v76 + 16) = 0;
  v79 = v99;
  v75(v76, v98, v99);
  v80 = v64 + 13 * v69;
  sub_23DC70ED8();
  v81 = v100;
  v82 = objc_msgSend(v71, sel_bundleForClass_, v100);
  sub_23DC70194();
  *(_QWORD *)v80 = sub_23DC70F68();
  *(_QWORD *)(v80 + 8) = v83;
  *(_BYTE *)(v80 + 16) = 0;
  v84 = v98;
  v75(v80, v98, v79);
  v85 = v64 + 14 * v93;
  sub_23DC70ED8();
  v86 = objc_msgSend(v95, sel_bundleForClass_, v81);
  sub_23DC70194();
  *(_QWORD *)v85 = sub_23DC70F68();
  *(_QWORD *)(v85 + 8) = v87;
  *(_BYTE *)(v85 + 16) = 0;
  v75(v85, v84, v79);
  return v90;
}

void sub_23DC50140()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4AD8)
  {
    sub_23DC706BC();
    v0 = sub_23DC71388();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4AD8);
  }
}

void sub_23DC50194()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322ED8)
  {
    v0 = sub_23DC71388();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322ED8);
  }
}

unint64_t sub_23DC501EC()
{
  unint64_t result;

  result = qword_254322E10;
  if (!qword_254322E10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254322E10);
  }
  return result;
}

void sub_23DC50228()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4AE0)
  {
    v0 = sub_23DC71238();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4AE0);
  }
}

uint64_t HealthBalancePluginDelegate.__allocating_init()()
{
  return swift_allocObject();
}

void sub_23DC50294(uint64_t a1)
{
  uint64_t *v1;
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
  char *v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  id v36;
  void *v37;
  id v38;
  unsigned int v39;
  char *v40;
  void *v41;
  id v42;
  void *v43;
  char v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(uint64_t *, uint64_t, uint64_t);
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  int *v72;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t *, uint64_t, uint64_t);
  __int128 v126;
  uint64_t v127[5];
  uint64_t v128;

  v124 = a1;
  v121 = *v1;
  v120 = sub_23DC705C0();
  v118 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120, v2);
  v119 = (char *)&v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_23DC70188();
  v115 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110, v4);
  v114 = (char *)&v108 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_23DC70308();
  v112 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113, v6);
  v111 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  MEMORY[0x24BDAC7A8](v116, v8);
  v117 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC70D04();
  v125 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v10 - 8);
  *(_QWORD *)&v126 = v10;
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = (char *)&v108 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v12, v15);
  v18 = (char *)&v108 - v17;
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v108 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v108 - v24;
  v26 = sub_23DC701AC();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26, v28);
  v30 = (char *)&v108 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_23DC701C4();
  v32 = *(_QWORD *)(v31 - 8);
  v122 = v31;
  v123 = v32;
  MEMORY[0x24BDAC7A8](v31, v33);
  v35 = (char *)&v108 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v36)
  {
    __break(1u);
    goto LABEL_19;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, sel_features);

  if (!v38)
  {
LABEL_19:
    __break(1u);
    return;
  }
  v39 = objc_msgSend(v38, sel_harmonia);

  if (v39)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v30, *MEMORY[0x24BDCEF70], v26);
    v40 = v35;
    sub_23DC701B8();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    v41 = (void *)sub_23DC705A8();
    v42 = v41;
    v43 = (void *)sub_23DC70500();
    v44 = sub_23DC704F4();

    if ((v44 & 1) != 0)
    {

      sub_23DC70CE0();
      v45 = sub_23DC70CF8();
      v46 = sub_23DC71088();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = swift_slowAlloc();
        v127[0] = v48;
        *(_DWORD *)v47 = 136446210;
        v49 = sub_23DC71430();
        v128 = sub_23DC43878(v49, v50, v127);
        sub_23DC71184();
        v40 = v35;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v45, v46, "[%{public}s] submitting primary pipelines", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v48, -1, -1);
        MEMORY[0x24263FD98](v47, -1, -1);
      }

      (*((void (**)(char *, _QWORD))v125 + 1))(v25, v126);
      v51 = v118;
      v52 = v119;
      v53 = v113;
      v54 = v112;
      v55 = v111;
      v56 = v110;
      v109 = v40;
      v57 = v124;
      v58 = (void *)sub_23DC7059C();
      *(_QWORD *)&v126 = sub_23DC61484(v58);
      v59 = sub_23DC7059C();
      v60 = v114;
      sub_23DC7017C();
      sub_23DC702F0();
      (*(void (**)(char *, uint64_t))(v115 + 8))(v60, v56);
      sub_23DC70590();
      LOBYTE(v60) = sub_23DC70608();
      v61 = (uint64_t)v117;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v117, v55, v53);
      v62 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
      *(_BYTE *)(v61 + *(int *)(v62 + 20)) = (v60 & 1) == 0;
      v63 = (_QWORD *)(v61 + *(int *)(v62 + 24));
      *v63 = 0xD000000000000032;
      v63[1] = 0x800000023DC74F90;
      *(_QWORD *)(v61 + *(int *)(v116 + 20)) = v59;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v53);
      sub_23DC51054(0, &qword_254322EC0, (void (*)(uint64_t))sub_23DC51000);
      v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_23DC72810;
      v65 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
      v66 = v120;
      v65(v52, v57, v120);
      v67 = (void (*)(uint64_t *, uint64_t, uint64_t))v65;
      v125 = (void (*)(uint64_t *, uint64_t, uint64_t))v65;
      v68 = (void *)*MEMORY[0x24BDD2E80];
      v127[3] = (uint64_t)&type metadata for BalancePromotionFeedItemProvider;
      v127[4] = sub_23DC51220();
      v69 = sub_23DC70620();
      v70 = MEMORY[0x24BE48388];
      *(_QWORD *)(v64 + 56) = v69;
      *(_QWORD *)(v64 + 64) = v70;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v64 + 32));
      v71 = v68;
      sub_23DC70614();
      sub_23DC50E6C(v57, (uint64_t *)(v64 + 72));
      v72 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator(0);
      *(_QWORD *)(v64 + 136) = v72;
      *(_QWORD *)(v64 + 144) = sub_23DC44574(&qword_254322BA8, type metadata accessor for SleepingSampleChangesAlertGenerator, (uint64_t)&unk_23DC7326C);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v64 + 112));
      v67(boxed_opaque_existential_1, v57, v66);
      sub_23DC512A0();
      v74 = v126;
      swift_retain();
      v75 = (void *)sub_23DC7059C();
      v76 = sub_23DC71094();

      sub_23DC70464();
      v77 = sub_23DC70458();
      sub_23DC512DC(v61, (uint64_t)boxed_opaque_existential_1 + v72[8]);
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v72[5]) = v74;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v72[6]) = v76;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v72[7]) = v77;
      v78 = type metadata accessor for SleepingSampleHelpTileGenerator(0);
      *(_QWORD *)(v64 + 176) = v78;
      *(_QWORD *)(v64 + 184) = sub_23DC44574(&qword_254322B60, type metadata accessor for SleepingSampleHelpTileGenerator, (uint64_t)&unk_23DC73438);
      v79 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v64 + 152));
      v125(v79, v57, v66);
      v80 = *(_QWORD *)(v74 + 16);
      sub_23DC512DC(v61, (uint64_t)v79 + *(int *)(v78 + 24));
      *(uint64_t *)((char *)v79 + *(int *)(v78 + 20)) = v80;
      swift_unknownObjectRetain();
      swift_release();
      sub_23DC51320(v61);
      (*(void (**)(char *, uint64_t))(v123 + 8))(v109, v122);
    }
    else if (v41)
    {

      sub_23DC70CE0();
      v87 = sub_23DC70CF8();
      v88 = sub_23DC71088();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        v90 = swift_slowAlloc();
        v127[0] = v90;
        *(_DWORD *)v89 = 136446210;
        v91 = sub_23DC71430();
        v128 = sub_23DC43878(v91, v92, v127);
        sub_23DC71184();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v87, v88, "[%{public}s] submitting default pipelines", v89, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v90, -1, -1);
        MEMORY[0x24263FD98](v89, -1, -1);
      }

      (*((void (**)(char *, _QWORD))v125 + 1))(v18, v126);
      (*(void (**)(char *, uint64_t))(v123 + 8))(v40, v122);
    }
    else
    {
      sub_23DC70CE0();
      v93 = sub_23DC70CF8();
      v94 = sub_23DC71088();
      if (os_log_type_enabled(v93, v94))
      {
        v95 = (uint8_t *)swift_slowAlloc();
        v96 = swift_slowAlloc();
        v127[0] = v96;
        *(_DWORD *)v95 = 136446210;
        v97 = sub_23DC71430();
        v128 = sub_23DC43878(v97, v98, v127);
        sub_23DC71184();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v93, v94, "[%{public}s] submitting agnostic pipelines", v95, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v96, -1, -1);
        MEMORY[0x24263FD98](v95, -1, -1);
      }

      (*((void (**)(char *, _QWORD))v125 + 1))(v22, v126);
      v99 = v122;
      v100 = v123;
      v101 = v120;
      v102 = v118;
      sub_23DC51054(0, &qword_254322EC0, (void (*)(uint64_t))sub_23DC51000);
      v103 = swift_allocObject();
      v126 = xmmword_23DC71BC0;
      *(_OWORD *)(v103 + 16) = xmmword_23DC71BC0;
      sub_23DC51054(0, &qword_254322EC8, (void (*)(uint64_t))sub_23DC510A0);
      v104 = swift_allocObject();
      *(_OWORD *)(v104 + 16) = v126;
      *(_QWORD *)(v104 + 56) = &type metadata for AboutBalanceArticleDataProvider;
      *(_QWORD *)(v104 + 64) = sub_23DC510FC();
      *(_QWORD *)(v104 + 72) = sub_23DC51140();
      (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v119, v124, v101);
      sub_23DC51184();
      v106 = v105;
      swift_allocObject();
      v107 = sub_23DC70CC8();
      *(_QWORD *)(v103 + 56) = v106;
      *(_QWORD *)(v103 + 64) = sub_23DC44574(&qword_254322BE0, (uint64_t (*)(uint64_t))sub_23DC51184, MEMORY[0x24BE3F870]);
      *(_QWORD *)(v103 + 32) = v107;
      (*(void (**)(char *, uint64_t))(v100 + 8))(v40, v99);
    }
  }
  else
  {
    sub_23DC70CE0();
    v81 = sub_23DC70CF8();
    v82 = sub_23DC71088();
    if (os_log_type_enabled(v81, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc();
      v84 = swift_slowAlloc();
      v127[0] = v84;
      *(_DWORD *)v83 = 136446210;
      v85 = sub_23DC71430();
      v128 = sub_23DC43878(v85, v86, v127);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v81, v82, "[%{public}s] feature flag off, returning empty", v83, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v84, -1, -1);
      MEMORY[0x24263FD98](v83, -1, -1);
    }

    (*((void (**)(char *, _QWORD))v125 + 1))(v14, v126);
  }
}

uint64_t sub_23DC50E6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  ValueMetadata *v20;
  unint64_t v21;

  v4 = sub_23DC705C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_23DC71244();
  swift_bridgeObjectRelease();
  v18 = 0xD000000000000025;
  v19 = 0x800000023DC75010;
  v9 = (void *)sub_23DC705A8();
  sub_23DC704E8();

  sub_23DC70FB0();
  swift_bridgeObjectRelease();
  v10 = v18;
  v11 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  v12 = (void *)*MEMORY[0x24BDD2E80];
  v20 = &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider;
  v21 = sub_23DC46728();
  v18 = v10;
  v19 = v11;
  v13 = sub_23DC70620();
  v14 = MEMORY[0x24BE48388];
  a2[3] = v13;
  a2[4] = v14;
  __swift_allocate_boxed_opaque_existential_1(a2);
  v15 = v12;
  return sub_23DC70614();
}

uint64_t HealthBalancePluginDelegate.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HealthBalancePluginDelegate.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_23DC50FDC(uint64_t a1)
{
  sub_23DC50294(a1);
}

unint64_t sub_23DC51000()
{
  unint64_t result;

  result = qword_254322300[0];
  if (!qword_254322300[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_254322300);
  }
  return result;
}

void sub_23DC51054(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DC71388();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_23DC510A0()
{
  unint64_t result;

  result = qword_254322A78;
  if (!qword_254322A78)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254322A78);
  }
  return result;
}

unint64_t sub_23DC510FC()
{
  unint64_t result;

  result = qword_254322AC0;
  if (!qword_254322AC0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC727E8, &type metadata for AboutBalanceArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254322AC0);
  }
  return result;
}

unint64_t sub_23DC51140()
{
  unint64_t result;

  result = qword_254322AC8;
  if (!qword_254322AC8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72780, &type metadata for AboutBalanceArticleDataProvider);
    atomic_store(result, (unint64_t *)&qword_254322AC8);
  }
  return result;
}

void sub_23DC51184()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322BE8)
  {
    sub_23DC511DC();
    v0 = sub_23DC70CD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322BE8);
  }
}

unint64_t sub_23DC511DC()
{
  unint64_t result;

  result = qword_254322AD0;
  if (!qword_254322AD0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC737D4, &type metadata for BalanceArticleTileDataController);
    atomic_store(result, (unint64_t *)&qword_254322AD0);
  }
  return result;
}

unint64_t sub_23DC51220()
{
  unint64_t result;

  result = qword_254322AE8;
  if (!qword_254322AE8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73B0C, &type metadata for BalancePromotionFeedItemProvider);
    atomic_store(result, (unint64_t *)&qword_254322AE8);
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

unint64_t sub_23DC512A0()
{
  unint64_t result;

  result = qword_254322E68;
  if (!qword_254322E68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254322E68);
  }
  return result;
}

uint64_t sub_23DC512DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC51320(uint64_t a1)
{
  uint64_t v2;

  v2 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for HealthBalancePluginDelegate()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthBalancePluginDelegate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthBalancePluginDelegate.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HealthBalancePluginDelegate.makeGeneratorPipelines(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_23DC5139C(void *a1)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  int v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unsigned int *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;

  v42 = a1;
  v40 = sub_23DC704B8();
  v36 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40, v2);
  v41 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_23DC70470();
  v4 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39, v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23DC70488();
  v8 = *(_QWORD *)(v37 - 8);
  v10 = MEMORY[0x24BDAC7A8](v37, v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v36 - v14;
  v16 = *(void **)v1;
  v17 = *(void **)(v1 + 8);
  v18 = *(unsigned __int8 *)(v1 + 16);
  LOBYTE(v43) = *(_BYTE *)(v1 + 16);
  sub_23DC6C788();
  v38 = v19;
  v20 = *MEMORY[0x24BDD2E70];
  v21 = objc_allocWithZone(MEMORY[0x24BEA9888]);
  v22 = v16;
  v23 = v17;
  v24 = objc_msgSend(v21, sel_initWithFeatureIdentifier_sleepStore_, v20, v22);
  sub_23DC516F0();
  LOBYTE(v21) = sub_23DC71124();

  v25 = (unsigned int *)MEMORY[0x24BEA9BE8];
  if ((v21 & 1) == 0)
    v25 = (unsigned int *)MEMORY[0x24BEA9BE0];
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v25, v39);

  v26 = v37;
  sub_23DC7047C();
  v27 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v38 = v12;
  v39 = (uint64_t)v15;
  v27(v12, v15, v26);
  if (v18 && v18 != 3)
  {
    sub_23DC517CC(0, &qword_256CF4B08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_23DC71BC0;
    v32 = v23;
    v33 = v22;
    v34 = v42;
    sub_23DC704AC();
    v43 = v31;
    sub_23DC5172C();
    sub_23DC517CC(0, &qword_256CF4AF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DC51774();
  }
  else
  {
    v43 = MEMORY[0x24BEE4AF8];
    sub_23DC5172C();
    sub_23DC517CC(0, &qword_256CF4AF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DC51774();
    v28 = v23;
    v29 = v22;
    v30 = v42;
  }
  sub_23DC711C0();
  sub_23DC704C4();
  sub_23DC704A0();
  sub_23DC70494();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v39, v26);
}

unint64_t sub_23DC516F0()
{
  unint64_t result;

  result = qword_256CF4AE8;
  if (!qword_256CF4AE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4AE8);
  }
  return result;
}

unint64_t sub_23DC5172C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4AF0;
  if (!qword_256CF4AF0)
  {
    v1 = sub_23DC704B8();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEA9D38], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4AF0);
  }
  return result;
}

unint64_t sub_23DC51774()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4B00;
  if (!qword_256CF4B00)
  {
    sub_23DC517CC(255, &qword_256CF4AF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4B00);
  }
  return result;
}

void sub_23DC517CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DC704B8();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_23DC51824(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unsigned int *v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v32[3];
  int v33;
  void (**v34)(char *, _QWORD, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v38 = a1;
  v36 = sub_23DC704B8();
  v32[1] = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36, v2);
  v37 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23DC70470();
  v34 = *(void (***)(char *, _QWORD, uint64_t))(v4 - 8);
  v35 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC70488();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)v32 - v15;
  v17 = *(void **)v1;
  v18 = *(void **)(v1 + 8);
  v33 = *(unsigned __int8 *)(v1 + 16);
  LOBYTE(v39) = v33;
  sub_23DC6C788();
  v32[2] = v19;
  v20 = *MEMORY[0x24BDD2E70];
  v21 = objc_allocWithZone(MEMORY[0x24BEA9888]);
  v22 = v17;
  v23 = v18;
  v24 = objc_msgSend(v21, sel_initWithFeatureIdentifier_sleepStore_, v20, v22);
  sub_23DC516F0();
  LOBYTE(v21) = sub_23DC71124();

  v25 = (unsigned int *)MEMORY[0x24BEA9BE8];
  v26 = (v21 & 1) == 0;
  v27 = v8;
  if (v26)
    v25 = (unsigned int *)MEMORY[0x24BEA9BE0];
  v34[13](v7, *v25, v35);

  sub_23DC7047C();
  v28 = objc_allocWithZone(MEMORY[0x24BE4A728]);
  v34 = (void (**)(char *, _QWORD, uint64_t))v23;
  v29 = v22;
  objc_msgSend(v28, sel_init);
  v35 = v9;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v27);
  if (v33 && v33 != 3)
  {
    sub_23DC517CC(0, &qword_256CF4B08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_23DC71BC0;
    sub_23DC704AC();
    v39 = v30;
  }
  else
  {
    v39 = MEMORY[0x24BEE4AF8];
  }
  sub_23DC5172C();
  sub_23DC517CC(0, &qword_256CF4AF8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23DC51774();
  sub_23DC711C0();
  sub_23DC704C4();
  sub_23DC704A0();
  sub_23DC70494();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v27);
}

void sub_23DC51B58()
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
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
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;

  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v3, v2);

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v4);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 1);
  v6 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v6, sel_addSubview_, v5);

  v7 = objc_msgSend(v0, sel_contentView);
  v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  sub_23DC50194();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23DC72890;
  v10 = objc_msgSend(v5, sel_leadingAnchor);
  v11 = objc_msgSend(v0, sel_contentView);
  v12 = objc_msgSend(v11, sel_leadingAnchor);

  v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(_QWORD *)(v9 + 32) = v13;
  v14 = objc_msgSend(v5, sel_trailingAnchor);
  v15 = objc_msgSend(v0, sel_contentView);
  v16 = objc_msgSend(v15, sel_trailingAnchor);

  v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(_QWORD *)(v9 + 40) = v17;
  v18 = objc_msgSend(v5, sel_topAnchor);
  v19 = objc_msgSend(v0, sel_contentView);
  v20 = objc_msgSend(v19, sel_topAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v9 + 48) = v21;
  v22 = objc_msgSend(v5, sel_bottomAnchor);
  v23 = objc_msgSend(v0, sel_contentView);
  v24 = objc_msgSend(v23, sel_bottomAnchor);

  v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v24, -9.0);
  *(_QWORD *)(v9 + 56) = v25;
  v26 = objc_msgSend(v5, sel_heightAnchor);
  v27 = objc_msgSend(v0, sel_view);
  if (v27)
  {
    v28 = v27;
    v29 = (void *)objc_opt_self();
    v30 = objc_msgSend(v28, sel_heightAnchor);

    v31 = objc_msgSend(v26, sel_constraintEqualToAnchor_multiplier_, v30, 0.22);
    *(_QWORD *)(v9 + 64) = v31;
    sub_23DC70FEC();
    sub_23DC51FE8();
    v32 = (id)sub_23DC70FD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_activateConstraints_, v32);

  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_23DC51FE8()
{
  unint64_t result;

  result = qword_256CF4900;
  if (!qword_256CF4900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4900);
  }
  return result;
}

void sub_23DC52024()
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v3, v2);

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v4);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 2);
  v6 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v6, sel_addSubview_, v5);

  v7 = objc_msgSend(v0, sel_contentView);
  v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  sub_23DC50194();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23DC72890;
  v10 = objc_msgSend(v5, sel_leadingAnchor);
  v11 = objc_msgSend(v0, sel_contentView);
  v12 = objc_msgSend(v11, sel_leadingAnchor);

  v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(_QWORD *)(v9 + 32) = v13;
  v14 = objc_msgSend(v5, sel_trailingAnchor);
  v15 = objc_msgSend(v0, sel_contentView);
  v16 = objc_msgSend(v15, sel_trailingAnchor);

  v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(_QWORD *)(v9 + 40) = v17;
  v18 = objc_msgSend(v5, sel_topAnchor);
  v19 = objc_msgSend(v0, sel_contentView);
  v20 = objc_msgSend(v19, sel_topAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v9 + 48) = v21;
  v22 = objc_msgSend(v5, sel_heightAnchor);
  v23 = objc_msgSend(v0, sel_view);
  if (v23)
  {
    v24 = v23;
    v25 = (void *)objc_opt_self();
    v26 = objc_msgSend(v24, sel_heightAnchor);

    v27 = objc_msgSend(v22, sel_constraintEqualToAnchor_multiplier_, v26, 0.3);
    *(_QWORD *)(v9 + 56) = v27;
    v28 = objc_msgSend(v5, sel_bottomAnchor);
    v29 = objc_msgSend(v0, sel_contentView);
    v30 = objc_msgSend(v29, sel_bottomAnchor);

    v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_constant_, v30, 35.0);
    *(_QWORD *)(v9 + 64) = v31;
    sub_23DC70FEC();
    sub_23DC51FE8();
    v32 = (id)sub_23DC70FD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_activateConstraints_, v32);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DC524C0()
{
  uint64_t v1;

  v1 = sub_23DC70284();
  sub_23DC70FB0();
  sub_23DC71430();
  sub_23DC70FB0();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_23DC52520()
{
  void *v0;
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
  uint64_t v12;
  char *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char v29;
  uint64_t v30;
  objc_class *v31;
  _BYTE *v32;
  id v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;
  _QWORD v45[3];
  uint64_t v46;

  ObjectType = swift_getObjectType();
  v1 = sub_23DC708B4();
  v39 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DC70A70();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC70D04();
  v42 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v14 = v0;
  v15 = sub_23DC70CF8();
  v16 = sub_23DC71088();
  v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    v18 = swift_slowAlloc();
    v41 = v5;
    v19 = v18;
    v38 = swift_slowAlloc();
    v43 = v38;
    *(_DWORD *)v19 = 136446722;
    v36 = v17;
    v20 = sub_23DC71430();
    ObjectType = v6;
    v45[0] = sub_23DC43878(v20, v21, &v43);
    v37 = v10;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    v45[0] = sub_23DC43878(0x2928706154646964, 0xE800000000000000, &v43);
    sub_23DC71184();
    *(_WORD *)(v19 + 22) = 2082;
    v35 = v19 + 24;
    sub_23DC70B18();
    sub_23DC70A4C();
    (*(void (**)(char *, uint64_t))(ObjectType + 8))(v9, v41);
    __swift_project_boxed_opaque_existential_1(v45, v46);
    sub_23DC70A10();
    sub_23DC44574((unint64_t *)&qword_256CF4B10, (uint64_t (*)(uint64_t))MEMORY[0x24BE42678], MEMORY[0x24BE42690]);
    v22 = sub_23DC7137C();
    v24 = v23;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v4, v1);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
    v25 = v22;
    v6 = ObjectType;
    v45[0] = sub_23DC43878(v25, v24, &v43);
    sub_23DC71184();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v15, (os_log_type_t)v36, "[%{public}s.%{public}s] promo tile tapped from %{public}s", (uint8_t *)v19, 0x20u);
    v26 = v38;
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v26, -1, -1);
    v27 = v19;
    v5 = v41;
    MEMORY[0x24263FD98](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v37);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v10);
  }
  sub_23DC70B18();
  sub_23DC70A4C();
  v28 = *(void (**)(char *, uint64_t))(v6 + 8);
  v28(v9, v5);
  __swift_project_boxed_opaque_existential_1(v45, v46);
  sub_23DC70A10();
  sub_23DC6CA14(v4, (char *)&v43);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  v29 = v43;
  sub_23DC70B18();
  sub_23DC70A4C();
  v28(v9, v5);
  __swift_project_boxed_opaque_existential_1(v45, v46);
  v30 = sub_23DC70A04();
  v31 = (objc_class *)type metadata accessor for BalanceOnboardingNavigationController();
  v32 = objc_allocWithZone(v31);
  *(_QWORD *)&v32[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(_QWORD *)&v32[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = v30;
  v32[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v29;
  v44.receiver = v32;
  v44.super_class = v31;
  v33 = objc_msgSendSuper2(&v44, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  sub_23DC6BC58();
  sub_23DC6D7DC();
  swift_release();
  objc_msgSend(v33, sel_setModalPresentationStyle_, 2);
  sub_23DC70B18();
  v34 = (void *)sub_23DC70A58();
  v28(v9, v5);
  objc_msgSend(v34, sel_presentViewController_animated_completion_, v33, 1, 0);

}

uint64_t BalancePromotionFeedItemViewActionHandler.__allocating_init(context:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v3 = sub_23DC70A70();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  v9 = sub_23DC70B24();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v9;
}

uint64_t BalancePromotionFeedItemViewActionHandler.init(context:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_23DC70A70();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v6 = sub_23DC70B24();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

id BalancePromotionFeedItemViewActionHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalancePromotionFeedItemViewActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalancePromotionFeedItemViewActionHandler()
{
  uint64_t result;

  result = qword_254322AF8;
  if (!qword_254322AF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DC52BE0()
{
  return sub_23DC44574((unint64_t *)&qword_254322AF0, (uint64_t (*)(uint64_t))type metadata accessor for BalancePromotionFeedItemViewActionHandler, (uint64_t)&protocol conformance descriptor for BalancePromotionFeedItemViewActionHandler);
}

uint64_t sub_23DC52C0C()
{
  return sub_23DC44574(&qword_254322A80, MEMORY[0x24BE42BF8], MEMORY[0x24BE42BE8]);
}

uint64_t sub_23DC52C38()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for BalancePromotionFeedItemViewActionHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BalancePromotionFeedItemViewActionHandler.didTap()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0)
                              + class metadata base offset for BalancePromotionFeedItemViewActionHandler))();
}

uint64_t sub_23DC52CA4()
{
  return type metadata accessor for BalancePromotionFeedItemViewActionHandler();
}

uint64_t sub_23DC52CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC55D20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DC52CE0()
{
  sub_23DC52E60();
  return sub_23DC71418();
}

uint64_t sub_23DC52D08()
{
  sub_23DC52E60();
  return sub_23DC71424();
}

uint64_t SleepingSampleAnalysisHealthChecklistUserData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  sub_23DC55F48(0, &qword_256CF4B30, (uint64_t (*)(void))sub_23DC52E60, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v5);
  v7 = (char *)&v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC52E60();
  sub_23DC71400();
  type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  sub_23DC44574(&qword_256CF4B40, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction, (uint64_t)&unk_23DC72BE8);
  sub_23DC71370();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_23DC52E60()
{
  unint64_t result;

  result = qword_256CF4B38;
  if (!qword_256CF4B38)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72C10, &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4B38);
  }
  return result;
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_256CF4C78);
}

uint64_t SleepingSampleAnalysisHealthChecklistUserData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v20 = a2;
  v21 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x24BDAC7A8](v21, v3);
  v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC55F48(0, &qword_256CF4B48, (uint64_t (*)(void))sub_23DC52E60, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v19 - v9;
  v11 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC52E60();
  v15 = v23;
  sub_23DC713F4();
  if (!v15)
  {
    v16 = v20;
    sub_23DC44574(&qword_256CF4B50, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction, (uint64_t)&unk_23DC72BC0);
    v17 = (uint64_t)v22;
    sub_23DC7134C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_23DC4A6DC(v17, (uint64_t)v14, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
    sub_23DC4A6DC((uint64_t)v14, v16, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(uint64_t a1)
{
  return sub_23DC44114(a1, qword_256CF4BB8);
}

uint64_t sub_23DC530C0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DC530F8 + 4 * byte_23DC72950[a1]))(0xD000000000000010, 0x800000023DC75140);
}

uint64_t sub_23DC530F8(uint64_t a1)
{
  return a1 + 5;
}

uint64_t sub_23DC53130()
{
  return 0x4C52556E65706FLL;
}

void sub_23DC53148(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD v28[17];
  uint64_t v29;
  uint64_t v30;

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE3520];
  sub_23DC55F48(0, &qword_256CF4CA0, (uint64_t (*)(void))sub_23DC55DB0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys, MEMORY[0x24BEE3520]);
  v28[13] = *(_QWORD *)(v3 - 8);
  v28[14] = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v28[12] = (char *)v28 - v5;
  v29 = sub_23DC70164();
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v7);
  v28[11] = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC55F48(0, &qword_256CF4CB0, (uint64_t (*)(void))sub_23DC55DF4, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys, v2);
  v28[9] = *(_QWORD *)(v9 - 8);
  v28[10] = v9;
  MEMORY[0x24BDAC7A8](v9, v10);
  v28[8] = (char *)v28 - v11;
  sub_23DC55F48(0, &qword_256CF4CC0, (uint64_t (*)(void))sub_23DC55E38, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys, v2);
  v28[6] = *(_QWORD *)(v12 - 8);
  v28[7] = v12;
  MEMORY[0x24BDAC7A8](v12, v13);
  v28[5] = (char *)v28 - v14;
  sub_23DC55F48(0, &qword_256CF4CD0, (uint64_t (*)(void))sub_23DC55E7C, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys, v2);
  v28[3] = *(_QWORD *)(v15 - 8);
  v28[4] = v15;
  MEMORY[0x24BDAC7A8](v15, v16);
  v28[2] = (char *)v28 - v17;
  sub_23DC55F48(0, &qword_256CF4CE0, (uint64_t (*)(void))sub_23DC55EC0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys, v2);
  v28[1] = v18;
  MEMORY[0x24BDAC7A8](v18, v19);
  v20 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC55F48(0, &qword_256CF4CF0, (uint64_t (*)(void))sub_23DC55F04, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys, v2);
  v28[15] = *(_QWORD *)(v24 - 8);
  v28[16] = v24;
  MEMORY[0x24BDAC7A8](v24, v25);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC55F04();
  v26 = v29;
  sub_23DC71400();
  sub_23DC54F8C(v30, (uint64_t)v23);
  v27 = (char *)sub_23DC53454
      + 4 * byte_23DC72955[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v23, 4, v26)];
  __asm { BR              X10 }
}

uint64_t sub_23DC53454()
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

  v5 = *(_QWORD *)(v4 - 152);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v5, v0, v1);
  *(_BYTE *)(v4 - 65) = 4;
  sub_23DC55DB0();
  v6 = *(_QWORD *)(v4 - 144);
  v7 = *(_QWORD *)(v4 - 112);
  sub_23DC71364();
  sub_23DC44574(&qword_256CF4D00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
  v8 = *(_QWORD *)(v4 - 128);
  sub_23DC71370();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 136) + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v2, v7);
}

uint64_t sub_23DC53678@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD v40[16];
  uint64_t v41;
  char *v42;
  char *v43;
  _QWORD *v44;

  v40[15] = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE33E0];
  sub_23DC55F48(0, &qword_256CF4D08, (uint64_t (*)(void))sub_23DC55DB0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys, MEMORY[0x24BEE33E0]);
  v5 = *(_QWORD *)(v4 - 8);
  v40[10] = v4;
  v40[11] = v5;
  MEMORY[0x24BDAC7A8](v4, v6);
  v43 = (char *)v40 - v7;
  sub_23DC55F48(0, &qword_256CF4D10, (uint64_t (*)(void))sub_23DC55DF4, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys, v3);
  v40[8] = *(_QWORD *)(v8 - 8);
  v40[9] = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  v40[14] = (char *)v40 - v10;
  sub_23DC55F48(0, &qword_256CF4D18, (uint64_t (*)(void))sub_23DC55E38, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys, v3);
  v40[6] = *(_QWORD *)(v11 - 8);
  v40[7] = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v42 = (char *)v40 - v13;
  sub_23DC55F48(0, &qword_256CF4D20, (uint64_t (*)(void))sub_23DC55E7C, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys, v3);
  v40[4] = *(_QWORD *)(v14 - 8);
  v40[5] = v14;
  MEMORY[0x24BDAC7A8](v14, v15);
  v40[13] = (char *)v40 - v16;
  sub_23DC55F48(0, &qword_256CF4D28, (uint64_t (*)(void))sub_23DC55EC0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys, v3);
  v40[2] = *(_QWORD *)(v17 - 8);
  v40[3] = v17;
  MEMORY[0x24BDAC7A8](v17, v18);
  v40[12] = (char *)v40 - v19;
  sub_23DC55F48(0, &qword_256CF4D30, (uint64_t (*)(void))sub_23DC55F04, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys, v3);
  v21 = v20;
  v41 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)v40 - v23;
  v25 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  v27 = MEMORY[0x24BDAC7A8](v25, v26);
  v29 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27, v30);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC55F04();
  v31 = v44;
  sub_23DC713F4();
  v32 = (uint64_t)a1;
  if (!v31)
  {
    v40[1] = v29;
    v44 = a1;
    v33 = sub_23DC71358();
    if (*(_QWORD *)(v33 + 16) == 1)
      __asm { BR              X10 }
    v34 = sub_23DC71280();
    swift_allocError();
    v35 = v24;
    v36 = v21;
    v38 = v37;
    sub_23DC55FA4();
    *v38 = v25;
    sub_23DC71340();
    sub_23DC71268();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v38, *MEMORY[0x24BEE26D0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v36);
    v32 = (uint64_t)v44;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm(v32);
}

uint64_t sub_23DC53E1C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SleepingSampleAnalysisHealthChecklistUserData.init(from:)(a1, a2);
}

uint64_t sub_23DC53E30(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  sub_23DC55F48(0, &qword_256CF4B30, (uint64_t (*)(void))sub_23DC52E60, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v5);
  v7 = (char *)&v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC52E60();
  sub_23DC71400();
  type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  sub_23DC44574(&qword_256CF4B40, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction, (uint64_t)&unk_23DC72BE8);
  sub_23DC71370();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_23DC53F60()
{
  unsigned __int8 *v0;

  return sub_23DC530C0(*v0);
}

uint64_t sub_23DC53F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC56674(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DC53F8C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23DC53F98()
{
  sub_23DC55F04();
  return sub_23DC71418();
}

uint64_t sub_23DC53FC0()
{
  sub_23DC55F04();
  return sub_23DC71424();
}

uint64_t sub_23DC53FE8()
{
  return 0;
}

uint64_t sub_23DC53FF4()
{
  sub_23DC55E38();
  return sub_23DC71418();
}

uint64_t sub_23DC5401C()
{
  sub_23DC55E38();
  return sub_23DC71424();
}

uint64_t sub_23DC54044()
{
  sub_23DC55DF4();
  return sub_23DC71418();
}

uint64_t sub_23DC5406C()
{
  sub_23DC55DF4();
  return sub_23DC71424();
}

uint64_t sub_23DC54094@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23DC540C0()
{
  sub_23DC55EC0();
  return sub_23DC71418();
}

uint64_t sub_23DC540E8()
{
  sub_23DC55EC0();
  return sub_23DC71424();
}

uint64_t sub_23DC54110()
{
  sub_23DC55E7C();
  return sub_23DC71418();
}

uint64_t sub_23DC54138()
{
  sub_23DC55E7C();
  return sub_23DC71424();
}

uint64_t sub_23DC54164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC56870(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DC5418C()
{
  sub_23DC55DB0();
  return sub_23DC71418();
}

uint64_t sub_23DC541B4()
{
  sub_23DC55DB0();
  return sub_23DC71424();
}

uint64_t sub_23DC541DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23DC53678(a1, a2);
}

void sub_23DC541F0(_QWORD *a1)
{
  sub_23DC53148(a1);
}

uint64_t sub_23DC54204()
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v44;
  char *v45;
  _QWORD v46[9];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[7];

  v46[7] = swift_getObjectType();
  v0 = sub_23DC70D04();
  v51 = *(_QWORD *)(v0 - 8);
  v52 = v0;
  MEMORY[0x24BDAC7A8](v0, v1);
  v50 = (char *)v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23DC70164();
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v46[1] = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DC708B4();
  v46[5] = *(_QWORD *)(v6 - 8);
  v46[6] = v6;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v46[3] = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v10);
  v46[4] = (char *)v46 - v11;
  v12 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v47 = (uint64_t)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23DC70854();
  v53 = *(_QWORD *)(v15 - 8);
  v54 = v15;
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v46[2] = (char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v19);
  v46[8] = (char *)v46 - v20;
  v21 = sub_23DC70A70();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v23);
  v25 = (char *)v46 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC4A608(0, &qword_256CF4A10, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  MEMORY[0x24BDAC7A8](v26, v27);
  v29 = (char *)v46 - v28;
  v30 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30, v32);
  v34 = (char *)v46 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70B18();
  sub_23DC44574(&qword_256CF4B58, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData, (uint64_t)&protocol conformance descriptor for SleepingSampleAnalysisHealthChecklistUserData);
  sub_23DC44574(&qword_256CF4A18, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData, (uint64_t)&protocol conformance descriptor for SleepingSampleAnalysisHealthChecklistUserData);
  sub_23DC70A64();
  v35 = *(void (**)(char *, uint64_t))(v22 + 8);
  v35(v25, v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) != 1)
  {
    sub_23DC4A6DC((uint64_t)v29, (uint64_t)v34, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    sub_23DC70B18();
    v52 = sub_23DC70A58();
    v35(v25, v21);
    sub_23DC70B18();
    sub_23DC70A4C();
    v35(v25, v21);
    __swift_project_boxed_opaque_existential_1(v55, v55[3]);
    v51 = sub_23DC70A04();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
    sub_23DC70B18();
    sub_23DC70764();
    v35(v25, v21);
    sub_23DC70464();
    sub_23DC70458();
    v44 = v47;
    sub_23DC54F8C((uint64_t)v34, v47);
    v45 = (char *)&loc_23DC54728
        + 4 * word_23DC72960[(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v44, 4, v49)];
    __asm { BR              X10 }
  }
  sub_23DC55024((uint64_t)v29, &qword_256CF4A10, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  v36 = v50;
  sub_23DC70CE0();
  v37 = sub_23DC70CF8();
  v38 = sub_23DC7107C();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v55[0] = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = sub_23DC71430();
    v55[5] = sub_23DC43878(v41, v42, v55);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v37, v38, "[%s] Could not access action handler user data", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v40, -1, -1);
    MEMORY[0x24263FD98](v39, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v36, v52);
}

uint64_t sub_23DC54C2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v21;

  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)&v21 - v8;
  sub_23DC54FD0(a1, (uint64_t)&v21 - v8);
  v10 = sub_23DC70164();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10) == 1)
  {
    sub_23DC55024((uint64_t)v9, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    sub_23DC70F98();
  }
  else
  {
    v13 = sub_23DC70128();
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    v16 = sub_23DC70F98();
    if (v15)
    {
      if (v13 == v16 && v15 == v17)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v19 = sub_23DC71394();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
          goto LABEL_11;
      }
      return sub_23DC54204();
    }
  }
  swift_bridgeObjectRelease();
LABEL_11:
  sub_23DC54FD0(a1, (uint64_t)v6);
  if (v12(v6, 1, v10) == 1)
    return sub_23DC55024((uint64_t)v6, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  sub_23DC70134();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v6, v10);
}

uint64_t SleepingSampleAnalysisHealthChecklistActionHandler.__allocating_init(context:)(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v3 = sub_23DC70A70();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  v9 = sub_23DC70B24();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v9;
}

uint64_t SleepingSampleAnalysisHealthChecklistActionHandler.init(context:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_23DC70A70();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v6 = sub_23DC70B24();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

id SleepingSampleAnalysisHealthChecklistActionHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DC54F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC54FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC55024(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_23DC4A608(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322AA0);
}

uint64_t sub_23DC55074()
{
  return sub_23DC44574(&qword_254322A98, type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler, (uint64_t)&protocol conformance descriptor for SleepingSampleAnalysisHealthChecklistActionHandler);
}

uint64_t sub_23DC550A0()
{
  return sub_23DC44574(&qword_254322A88, MEMORY[0x24BE448E0], MEMORY[0x24BE448D8]);
}

uint64_t *initializeBufferWithCopyOfBuffer for SleepingSampleAnalysisHealthChecklistUserData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_23DC70164();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
    }
  }
  return a1;
}

void *initializeWithCopy for SleepingSampleAnalysisHealthChecklistUserData(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC70164();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 4, v4))
  {
    v6 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  }
  return a1;
}

void *assignWithCopy for SleepingSampleAnalysisHealthChecklistUserData(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23DC70164();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 4, v4);
  v8 = v6(a2, 4, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  return a1;
}

void *initializeWithTake for SleepingSampleAnalysisHealthChecklistUserData(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC70164();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 4, v4))
  {
    v6 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  }
  return a1;
}

void *assignWithTake for SleepingSampleAnalysisHealthChecklistUserData(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23DC70164();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 4, v4);
  v8 = v6(a2, 4, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistUserData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC554C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistUserData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5550C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23DC5554C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23DC555B4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for SleepingSampleAnalysisHealthChecklistActionHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SleepingSampleAnalysisHealthChecklistActionHandler.didSelect()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for SleepingSampleAnalysisHealthChecklistActionHandler
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 8))();
}

uint64_t dispatch thunk of SleepingSampleAnalysisHealthChecklistActionHandler.didSelectFooterLink(url:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for SleepingSampleAnalysisHealthChecklistActionHandler
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 16))();
}

uint64_t sub_23DC5564C()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
}

uint64_t *sub_23DC55654(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    v7 = sub_23DC70164();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

uint64_t _s22HealthBalanceAppPlugin45SleepingSampleAnalysisHealthChecklistUserDataVwxx_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_23DC70164();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 4, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_23DC55784(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC70164();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_23DC55828(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_23DC70164();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

void *sub_23DC55918(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC70164();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_23DC559BC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_23DC70164();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

uint64_t sub_23DC55AAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC55AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_23DC70164();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 5)
    return v5 - 4;
  else
    return 0;
}

uint64_t sub_23DC55B04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC55B10(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 4);
  else
    v5 = 0;
  v6 = sub_23DC70164();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23DC55B64(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23DC70164();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 4, v2);
}

uint64_t sub_23DC55B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC70164();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 4, v4);
}

uint64_t sub_23DC55BDC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC70164();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys;
}

unint64_t sub_23DC55C4C()
{
  unint64_t result;

  result = qword_256CF4C88;
  if (!qword_256CF4C88)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72B98, &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4C88);
  }
  return result;
}

unint64_t sub_23DC55C94()
{
  unint64_t result;

  result = qword_256CF4C90;
  if (!qword_256CF4C90)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72B08, &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4C90);
  }
  return result;
}

unint64_t sub_23DC55CDC()
{
  unint64_t result;

  result = qword_256CF4C98;
  if (!qword_256CF4C98)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72B30, &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4C98);
  }
  return result;
}

uint64_t sub_23DC55D20(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23DC71394();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23DC55D9C()
{
  return 0x6E6F69746361;
}

unint64_t sub_23DC55DB0()
{
  unint64_t result;

  result = qword_256CF4CA8;
  if (!qword_256CF4CA8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73154, &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CA8);
  }
  return result;
}

unint64_t sub_23DC55DF4()
{
  unint64_t result;

  result = qword_256CF4CB8;
  if (!qword_256CF4CB8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73104, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CB8);
  }
  return result;
}

unint64_t sub_23DC55E38()
{
  unint64_t result;

  result = qword_256CF4CC8;
  if (!qword_256CF4CC8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC730B4, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CC8);
  }
  return result;
}

unint64_t sub_23DC55E7C()
{
  unint64_t result;

  result = qword_256CF4CD8;
  if (!qword_256CF4CD8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73064, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CD8);
  }
  return result;
}

unint64_t sub_23DC55EC0()
{
  unint64_t result;

  result = qword_256CF4CE8;
  if (!qword_256CF4CE8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73014, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CE8);
  }
  return result;
}

unint64_t sub_23DC55F04()
{
  unint64_t result;

  result = qword_256CF4CF8;
  if (!qword_256CF4CF8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72FC4, &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4CF8);
  }
  return result;
}

void sub_23DC55F48(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

void sub_23DC55FA4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF4D38)
  {
    sub_23DC56010();
    sub_23DC71274();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF4D38);
  }
}

unint64_t sub_23DC56010()
{
  unint64_t result;

  result = qword_256CF4D40;
  if (!qword_256CF4D40)
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4D40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistAction.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23DC56128 + 4 * byte_23DC7296F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23DC5615C + 4 * byte_23DC7296A[v4]))();
}

uint64_t sub_23DC5615C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC56164(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DC5616CLL);
  return result;
}

uint64_t sub_23DC56178(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DC56180);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23DC56184(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC5618C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.CodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys;
}

uint64_t _s22HealthBalanceAppPlugin45SleepingSampleAnalysisHealthChecklistUserDataV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DC56228 + 4 * byte_23DC72974[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DC56248 + 4 * byte_23DC72979[v4]))();
}

_BYTE *sub_23DC56228(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DC56248(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC56250(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC56258(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC56260(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC56268(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys;
}

unint64_t sub_23DC56288()
{
  unint64_t result;

  result = qword_256CF4D50;
  if (!qword_256CF4D50)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72DA4, &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D50);
  }
  return result;
}

unint64_t sub_23DC562D0()
{
  unint64_t result;

  result = qword_256CF4D58;
  if (!qword_256CF4D58)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72F9C, &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D58);
  }
  return result;
}

unint64_t sub_23DC56318()
{
  unint64_t result;

  result = qword_256CF4D60;
  if (!qword_256CF4D60)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72F0C, &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D60);
  }
  return result;
}

unint64_t sub_23DC56360()
{
  unint64_t result;

  result = qword_256CF4D68;
  if (!qword_256CF4D68)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72F34, &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D68);
  }
  return result;
}

unint64_t sub_23DC563A8()
{
  unint64_t result;

  result = qword_256CF4D70;
  if (!qword_256CF4D70)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72EBC, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D70);
  }
  return result;
}

unint64_t sub_23DC563F0()
{
  unint64_t result;

  result = qword_256CF4D78;
  if (!qword_256CF4D78)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72EE4, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D78);
  }
  return result;
}

unint64_t sub_23DC56438()
{
  unint64_t result;

  result = qword_256CF4D80;
  if (!qword_256CF4D80)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72E6C, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D80);
  }
  return result;
}

unint64_t sub_23DC56480()
{
  unint64_t result;

  result = qword_256CF4D88;
  if (!qword_256CF4D88)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72E94, &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D88);
  }
  return result;
}

unint64_t sub_23DC564C8()
{
  unint64_t result;

  result = qword_256CF4D90;
  if (!qword_256CF4D90)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72E1C, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D90);
  }
  return result;
}

unint64_t sub_23DC56510()
{
  unint64_t result;

  result = qword_256CF4D98;
  if (!qword_256CF4D98)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72E44, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4D98);
  }
  return result;
}

unint64_t sub_23DC56558()
{
  unint64_t result;

  result = qword_256CF4DA0;
  if (!qword_256CF4DA0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72DCC, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4DA0);
  }
  return result;
}

unint64_t sub_23DC565A0()
{
  unint64_t result;

  result = qword_256CF4DA8;
  if (!qword_256CF4DA8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72DF4, &type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4DA8);
  }
  return result;
}

unint64_t sub_23DC565E8()
{
  unint64_t result;

  result = qword_256CF4DB0;
  if (!qword_256CF4DB0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72D14, &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4DB0);
  }
  return result;
}

unint64_t sub_23DC56630()
{
  unint64_t result;

  result = qword_256CF4DB8;
  if (!qword_256CF4DB8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC72D3C, &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF4DB8);
  }
  return result;
}

uint64_t sub_23DC56674(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023DC75140 || (sub_23DC71394() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000023DC75160 || (sub_23DC71394() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000023DC75180 || (sub_23DC71394() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x800000023DC751A0 || (sub_23DC71394() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4C52556E65706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_23DC71394();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23DC56870(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23DC71394();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23DC568DC()
{
  return 12383;
}

uint64_t *sub_23DC568F0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC705C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_23DC70308();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_retain();
    v15 = v9;
    swift_retain();
    v14(v11, v12, v13);
    v16 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    v11[*(int *)(v16 + 20)] = v12[*(int *)(v16 + 20)];
    v17 = *(int *)(v16 + 24);
    v18 = &v11[v17];
    v19 = &v12[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
    v22 = *(void **)&v12[v21];
    *(_QWORD *)&v11[v21] = v22;
    swift_bridgeObjectRetain();
    v23 = v22;
  }
  return a1;
}

void sub_23DC56A24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();

  swift_release();
  v5 = a1 + *(int *)(a2 + 32);
  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();

}

uint64_t sub_23DC56AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23DC70308();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_retain();
  v14 = v8;
  swift_retain();
  v13(v10, v11, v12);
  v15 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v10 + *(int *)(v15 + 20)) = *(_BYTE *)(v11 + *(int *)(v15 + 20));
  v16 = *(int *)(v15 + 24);
  v17 = (_QWORD *)(v10 + v16);
  v18 = (_QWORD *)(v11 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v21 = *(void **)(v11 + v20);
  *(_QWORD *)(v10 + v20) = v21;
  swift_bridgeObjectRetain();
  v22 = v21;
  return a1;
}

uint64_t sub_23DC56BD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  v7 = a3[6];
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  v11 = a3[8];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v12 + *(int *)(v15 + 20)) = *(_BYTE *)(v13 + *(int *)(v15 + 20));
  v16 = *(int *)(v15 + 24);
  v17 = (_QWORD *)(v12 + v16);
  v18 = (_QWORD *)(v13 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v20 = *(void **)(v13 + v19);
  v21 = *(void **)(v12 + v19);
  *(_QWORD *)(v12 + v19) = v20;
  v22 = v20;

  return a1;
}

uint64_t sub_23DC56D04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v9 + *(int *)(v12 + 20)) = *(_BYTE *)(v10 + *(int *)(v12 + 20));
  *(_OWORD *)(v9 + *(int *)(v12 + 24)) = *(_OWORD *)(v10 + *(int *)(v12 + 24));
  v13 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  *(_QWORD *)(v9 + *(int *)(v13 + 20)) = *(_QWORD *)(v10 + *(int *)(v13 + 20));
  return a1;
}

uint64_t sub_23DC56DD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_release();
  v7 = a3[6];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  v9 = a3[8];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v10 + *(int *)(v13 + 20)) = *(_BYTE *)(v11 + *(int *)(v13 + 20));
  v14 = *(int *)(v13 + 24);
  v15 = (_QWORD *)(v10 + v14);
  v16 = (uint64_t *)(v11 + v14);
  v18 = *v16;
  v17 = v16[1];
  *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  v19 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v20 = *(void **)(v10 + v19);
  *(_QWORD *)(v10 + v19) = *(_QWORD *)(v11 + v19);

  return a1;
}

uint64_t sub_23DC56ED4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC56EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23DC705C0();
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
    v8 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    v10 = a1 + *(int *)(a3 + 32);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_23DC56F88()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC56F94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23DC705C0();
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
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322BB0);
}

uint64_t sub_23DC5704C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23DC705C0();
  if (v1 <= 0x3F)
  {
    result = _s43SleepingSampleDaySummaryCollectionPublisherVMa(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23DC570EC()
{
  return sub_23DC44574(&qword_254322BA8, type metadata accessor for SleepingSampleChangesAlertGenerator, (uint64_t)&unk_23DC7326C);
}

uint64_t sub_23DC57118()
{
  return sub_23DC58FA8(&qword_254322D30, &qword_254322D38, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator.Change);
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator.Change(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B88);
}

uint64_t sub_23DC57158()
{
  return sub_23DC44574(&qword_254322DC0, (uint64_t (*)(uint64_t))sub_23DC57184, MEMORY[0x24BDB9E90]);
}

void sub_23DC57184()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322DC8)
  {
    sub_23DC571FC(255);
    sub_23DC44574(&qword_254322D68, (uint64_t (*)(uint64_t))sub_23DC571FC, MEMORY[0x24BDB9DF8]);
    v0 = sub_23DC70DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322DC8);
  }
}

void sub_23DC571FC(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322D70, (uint64_t (*)(uint64_t))sub_23DC57218, MEMORY[0x24BDB9DE0]);
}

void sub_23DC57218(uint64_t a1)
{
  sub_23DC440A8(a1, (unint64_t *)&unk_254322DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
}

id sub_23DC57234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  _QWORD v12[2];

  v0 = sub_23DC70560();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC705A8();
  v5 = MEMORY[0x24BEE3598];
  sub_23DC440A8(0, &qword_254322EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v6 = sub_23DC704DC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23DC71BC0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v7 + 104))(v9 + v8, *MEMORY[0x24BE47480], v6);
  sub_23DC44FD0(0, (unint64_t *)&qword_254322ED8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))v5);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23DC72560;
  result = objc_msgSend((id)objc_opt_self(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(_QWORD *)(v10 + 32) = result;
    v12[1] = v10;
    sub_23DC70FEC();
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE47910], v0);
    return (id)sub_23DC7056C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DC573E8()
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
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[2];
  char *v41;
  char *v42;
  char *v43;
  char *v44;
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

  sub_23DC44FD0(0, (unint64_t *)&unk_254322D80, MEMORY[0x24BEE1768], MEMORY[0x24BDB9DE0]);
  v53 = v0;
  MEMORY[0x24BDAC7A8](v0, v1);
  v44 = (char *)v40 - v2;
  sub_23DC58C2C(0, (unint64_t *)&qword_254322DD8, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (unint64_t *)&unk_254322E40, (uint64_t)&unk_23DC7388C);
  v52 = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v40[1] = (char *)v40 - v5;
  v6 = sub_23DC710B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58C2C(0, &qword_254322DD0, (uint64_t (*)(uint64_t))sub_23DC58CC0, &qword_254322D00, MEMORY[0x24BDB9AF8]);
  v47 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v40[0] = (char *)v40 - v13;
  sub_23DC58D80();
  v15 = *(_QWORD *)(v14 - 8);
  v45 = v14;
  v46 = v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  v42 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC59048();
  v48 = v18;
  v50 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v19);
  v41 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC590C0();
  v49 = v21;
  v51 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v22);
  v43 = (char *)v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleChangesAlertGenerator(0);
  sub_23DC70590();
  v24 = sub_23DC70608();
  v56 = sub_23DC60418((v24 & 1) == 0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BE40700], v6);
  sub_23DC710AC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_23DC70590();
  sub_23DC70608();
  sub_23DC70188();
  sub_23DC44574(&qword_254322A38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v25 = sub_23DC710C4();
  swift_bridgeObjectRelease();
  v54 = v25;
  sub_23DC58CC0();
  v27 = v26;
  v28 = sub_23DC44574(&qword_254322D00, (uint64_t (*)(uint64_t))sub_23DC58CC0, MEMORY[0x24BDB9AF8]);
  sub_23DC70E00();
  swift_release();
  v29 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  v30 = sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
  sub_23DC70E00();
  v54 = sub_23DC7044C();
  sub_23DC70DD0();
  v31 = (void (*)(uint64_t))MEMORY[0x24BE40438];
  sub_23DC58F4C(0, &qword_254322D18, (void (*)(uint64_t))MEMORY[0x24BE40438]);
  sub_23DC58FA8(&qword_254322D10, &qword_254322D18, v31);
  v54 = v27;
  v55 = v28;
  swift_getOpaqueTypeConformance2();
  v54 = v29;
  v55 = v30;
  swift_getOpaqueTypeConformance2();
  sub_23DC58FE8();
  v32 = v42;
  sub_23DC70D64();
  sub_23DC705B4();
  v33 = v41;
  v34 = v45;
  sub_23DC70D4C();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v32, v34);
  type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_23DC44574(&qword_254322CB8, (uint64_t (*)(uint64_t))sub_23DC59048, MEMORY[0x24BDB97E0]);
  v35 = v43;
  v36 = v48;
  sub_23DC70E18();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v33, v36);
  sub_23DC44574(&qword_254322C78, (uint64_t (*)(uint64_t))sub_23DC590C0, MEMORY[0x24BDB96C0]);
  v37 = v49;
  v38 = sub_23DC70E0C();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v37);
  return v38;
}

uint64_t sub_23DC57970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  sub_23DC59154();
  v5 = a1 + v4[12];
  v6 = a1 + v4[16];
  v7 = *(_QWORD *)(a1 + v4[20]);
  v8 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  v9 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_23DC58B70(v5, a2 + v9[5], (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v10 = a2 + v9[6];
  v11 = sub_23DC703B0();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v6, v11);
  *(_QWORD *)(a2 + v9[7]) = v7;
  return result;
}

uint64_t sub_23DC57A34(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v2 = sub_23DC704DC();
  v47 = *(_QWORD *)(v2 - 8);
  v48 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v49 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DC70554();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v50 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC70D04();
  v54 = *(_QWORD *)(v8 - 8);
  v55 = v8;
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v53 = (char *)&v47 - v14;
  v15 = sub_23DC703D4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, a1, v15);
  v24 = (void *)sub_23DC703E0();
  if (v24)
  {
    v25 = v24;
    v26 = objc_msgSend(v24, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2CB0]);

    v27 = objc_msgSend(v26, sel_areAllRequirementsSatisfied);
  }
  else
  {
    v27 = 0;
  }
  v28 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_23DC62FC8(*(_QWORD *)(a1 + *(int *)(v28 + 28)), (uint64_t)&v23[v20[6]]);
  sub_23DC58B70(a1 + *(int *)(v28 + 20), (uint64_t)&v23[v20[7]], (uint64_t (*)(_QWORD))sub_23DC58AD8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v23, v19, v15);
  v23[v20[5]] = v27;
  v29 = sub_23DC58030();
  if (v30 >> 60 == 15)
  {
    sub_23DC70CE0();
    v31 = sub_23DC70CF8();
    v32 = sub_23DC71088();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v57 = v34;
      *(_DWORD *)v33 = 136446210;
      v56 = sub_23DC43878(0xD000000000000023, 0x800000023DC73190, &v57);
      sub_23DC71184();
      _os_log_impl(&dword_23DC3D000, v31, v32, "[%{public}s] Not submitting a feed item", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v34, -1, -1);
      MEMORY[0x24263FD98](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v55);
    v35 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v36 = v29;
    v37 = v30;
    v38 = v53;
    sub_23DC70CE0();
    v39 = sub_23DC70CF8();
    v40 = sub_23DC71088();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v57 = v42;
      *(_DWORD *)v41 = 136446210;
      v56 = sub_23DC43878(0xD000000000000023, 0x800000023DC73190, &v57);
      sub_23DC71184();
      _os_log_impl(&dword_23DC3D000, v39, v40, "[%{public}s] Submitting a feed item", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v42, -1, -1);
      MEMORY[0x24263FD98](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v55);
    }
    type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
    static SleepingSampleChangesAlertTileViewController.bundleClassName.getter();
    (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v49, *MEMORY[0x24BE47480], v48);
    sub_23DC58AF4(v36, v37);
    sub_23DC705A8();
    v43 = v50;
    sub_23DC70524();
    sub_23DC5859C();
    sub_23DC7050C();
    sub_23DC440A8(0, &qword_256CF4DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v44 = v51;
    v45 = (*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_23DC71BC0;
    (*(void (**)(unint64_t, char *, uint64_t))(v44 + 32))(v35 + v45, v43, v52);
    sub_23DC44BA0(v36, v37);
  }
  sub_23DC58BB4((uint64_t)v23, type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel);
  return v35;
}

uint64_t sub_23DC58030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[6];
  char *v30;

  v1 = v0;
  v2 = sub_23DC70D04();
  v29[3] = *(_QWORD *)(v2 - 8);
  v29[4] = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v29[5] = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC440A8(0, &qword_254322A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE40438], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)v29 - v7;
  v9 = sub_23DC70308();
  MEMORY[0x24BDAC7A8](v9, v10);
  v11 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v30 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58B38(0);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23DC703B0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (char *)v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  sub_23DC58B70(v1 + *(int *)(v23 + 24), (uint64_t)v17, (uint64_t (*)(_QWORD))sub_23DC58B38);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_23DC58BB4((uint64_t)v17, (uint64_t (*)(_QWORD))sub_23DC58B38);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v17, v18);
  if (*(_BYTE *)(v1 + *(int *)(v23 + 20)) != 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    return 0;
  }
  sub_23DC70398();
  sub_23DC703A4();
  v24 = sub_23DC703D4();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v8, v1, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v8, 0, 1, v24);
  v26 = (uint64_t)v30;
  sub_23DC706A4();
  sub_23DC70110();
  swift_allocObject();
  sub_23DC70104();
  sub_23DC44574(&qword_256CF4DD0, type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t)&unk_23DC71EE8);
  v27 = sub_23DC700F8();
  swift_release();
  sub_23DC58BB4(v26, type metadata accessor for SleepingSampleChangesAlertTileViewModel);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  return v27;
}

uint64_t sub_23DC5859C()
{
  uint64_t v0;
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
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;

  sub_23DC58B38(0);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58B54(0);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58AD8(0);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v44 - v15;
  v17 = sub_23DC70188();
  v18 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v46 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v22);
  v47 = (char *)&v44 - v23;
  v24 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  sub_23DC58B70(v0 + *(int *)(v24 + 24), (uint64_t)v4, (uint64_t (*)(_QWORD))sub_23DC58B38);
  v25 = sub_23DC703B0();
  v26 = *(_QWORD *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v4, 1, v25) == 1)
  {
    v27 = sub_23DC58B38;
    v28 = (uint64_t)v4;
LABEL_8:
    sub_23DC58BB4(v28, (uint64_t (*)(_QWORD))v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
LABEL_9:
    v35 = (uint64_t)v16;
    goto LABEL_10;
  }
  v44 = v13;
  v45 = v0;
  v29 = sub_23DC703A4();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v25);
  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    v31 = v30 - 1;
    v32 = sub_23DC70344();
    v33 = *(_QWORD *)(v32 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(v8, v29+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(_QWORD *)(v33 + 72) * v31, v32);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v8, 0, 1, v32);
  }
  else
  {
    v32 = sub_23DC70344();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v8, 1, 1, v32);
  }
  swift_bridgeObjectRelease();
  sub_23DC70344();
  v34 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v8, 1, v32) == 1)
  {
    v27 = sub_23DC58B54;
    v28 = (uint64_t)v8;
    goto LABEL_8;
  }
  sub_23DC70404();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v32);
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v38(v16, 1, v17) == 1)
    goto LABEL_9;
  v39 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v40 = v47;
  v39(v47, v16, v17);
  v41 = (uint64_t)v44;
  sub_23DC58B70(v45 + *(int *)(v24 + 28), (uint64_t)v44, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  if (v38((char *)v41, 1, v17) != 1)
  {
    v42 = v46;
    v39(v46, (char *)v41, v17);
    sub_23DC44574(&qword_256CF4DC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v36 = sub_23DC70EB4() ^ 1;
    v43 = *(void (**)(char *, uint64_t))(v18 + 8);
    v43(v42, v17);
    v43(v40, v17);
    return v36 & 1;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v40, v17);
  v35 = v41;
LABEL_10:
  sub_23DC58BB4(v35, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v36 = 0;
  return v36 & 1;
}

uint64_t sub_23DC58980@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23DC705C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23DC589B8()
{
  return sub_23DC705CC();
}

uint64_t sub_23DC589D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DC573E8();
  *a1 = result;
  return result;
}

uint64_t sub_23DC589F8()
{
  sub_23DC44574(&qword_254322BA0, type metadata accessor for SleepingSampleChangesAlertGenerator, (uint64_t)&unk_23DC7323C);
  return sub_23DC70638();
}

uint64_t sub_23DC58A50()
{
  return sub_23DC44574(&qword_254322B98, type metadata accessor for SleepingSampleChangesAlertGenerator, (uint64_t)&unk_23DC731D4);
}

uint64_t sub_23DC58A7C()
{
  sub_23DC44574(&qword_254322B98, type metadata accessor for SleepingSampleChangesAlertGenerator, (uint64_t)&unk_23DC731D4);
  return sub_23DC7062C();
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B78);
}

void sub_23DC58AD8(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322A40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_23DC58AF4(uint64_t a1, unint64_t a2)
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

void sub_23DC58B38(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322A60, (uint64_t (*)(uint64_t))MEMORY[0x24BE403D8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

void sub_23DC58B54(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322A50, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_23DC58B70(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23DC58BB4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23DC58BF0()
{
  unint64_t result;

  result = qword_2543222C0;
  if (!qword_2543222C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543222C0);
  }
  return result;
}

void sub_23DC58C2C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  if (!*a2)
  {
    v12[0] = a3(255);
    v12[1] = sub_23DC44574(a4, a3, a5);
    v10 = MEMORY[0x24263FCCC](a1, v12, MEMORY[0x24BE48560], 0);
    if (!v11)
      atomic_store(v10, a2);
  }
}

void sub_23DC58CC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322D08)
  {
    sub_23DC58AD8(255);
    sub_23DC58D2C();
    v0 = sub_23DC70DC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322D08);
  }
}

unint64_t sub_23DC58D2C()
{
  unint64_t result;

  result = qword_254322EE0;
  if (!qword_254322EE0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254322EE0);
  }
  return result;
}

void sub_23DC58D80()
{
  void (*v0)(uint64_t);
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  if (!qword_254322C30)
  {
    v0 = (void (*)(uint64_t))MEMORY[0x24BE40438];
    sub_23DC58F4C(255, &qword_254322D18, (void (*)(uint64_t))MEMORY[0x24BE40438]);
    v1 = MEMORY[0x24BDB9AF8];
    sub_23DC58C2C(255, &qword_254322DD0, (uint64_t (*)(uint64_t))sub_23DC58CC0, &qword_254322D00, MEMORY[0x24BDB9AF8]);
    sub_23DC58C2C(255, (unint64_t *)&qword_254322DD8, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (unint64_t *)&unk_254322E40, (uint64_t)&unk_23DC7388C);
    sub_23DC44FD0(255, (unint64_t *)&unk_254322D80, MEMORY[0x24BEE1768], MEMORY[0x24BDB9DE0]);
    sub_23DC58FA8(&qword_254322D10, &qword_254322D18, v0);
    sub_23DC58CC0();
    sub_23DC44574(&qword_254322D00, (uint64_t (*)(uint64_t))sub_23DC58CC0, v1);
    swift_getOpaqueTypeConformance2();
    _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
    swift_getOpaqueTypeConformance2();
    sub_23DC58FE8();
    v2 = sub_23DC70D58();
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_254322C30);
  }
}

void sub_23DC58F4C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23DC70DC4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23DC58FA8(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_23DC58F4C(255, a2, a3);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BDB9AF8], v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DC58FE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254322D78;
  if (!qword_254322D78)
  {
    sub_23DC44FD0(255, (unint64_t *)&unk_254322D80, MEMORY[0x24BEE1768], MEMORY[0x24BDB9DE0]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BDB9DF8], v1);
    atomic_store(result, (unint64_t *)&qword_254322D78);
  }
  return result;
}

void sub_23DC59048()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322CC0)
  {
    sub_23DC58D80();
    sub_23DC44574(&qword_254322C28, (uint64_t (*)(uint64_t))sub_23DC58D80, MEMORY[0x24BDB9490]);
    v0 = sub_23DC70D88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322CC0);
  }
}

void sub_23DC590C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C80)
  {
    sub_23DC59048();
    type metadata accessor for SleepingSampleChangesAlertGenerator.Change(255);
    sub_23DC44574(&qword_254322CB8, (uint64_t (*)(uint64_t))sub_23DC59048, MEMORY[0x24BDB97E0]);
    v0 = sub_23DC70D7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C80);
  }
}

void sub_23DC59154()
{
  unint64_t TupleTypeMetadata;
  uint64_t v1;

  if (!qword_254322A70)
  {
    sub_23DC703D4();
    sub_23DC58AD8(255);
    sub_23DC703B0();
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1)
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_254322A70);
  }
}

_QWORD *sub_23DC591E0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC703D4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23DC703B0();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_23DC58B38(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[7];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_23DC70188();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      sub_23DC58AD8(0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t sub_23DC59374(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_23DC703B0();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 28);
  v9 = sub_23DC70188();
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return result;
}

uint64_t sub_23DC59450(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_23DC703B0();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_23DC58B38(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_23DC70188();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    sub_23DC58AD8(0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_23DC595B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_23DC703B0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_23DC58B38(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = a3[7];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_23DC70188();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_23DC58AD8(0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_23DC597B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_23DC703B0();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_23DC58B38(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_23DC70188();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    sub_23DC58AD8(0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_23DC5991C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_23DC703B0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_23DC58B38(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[7];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_23DC70188();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_23DC58AD8(0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_23DC59B14()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC59B20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_23DC703D4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + a3[5]);
    if (v9 >= 2)
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    else
      return 0;
  }
  else
  {
    sub_23DC58B38(0);
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_DWORD *)(v11 + 84) == (_DWORD)a2)
    {
      v12 = v10;
      v13 = a3[6];
    }
    else
    {
      sub_23DC58AD8(0);
      v12 = v14;
      v11 = *(_QWORD *)(v14 - 8);
      v13 = a3[7];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1 + v13, a2, v12);
  }
}

uint64_t sub_23DC59BF8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC59C04(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_23DC703D4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + a4[5]) = a2 + 1;
      return result;
    }
    sub_23DC58B38(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      sub_23DC58AD8(0);
      v10 = v16;
      v14 = *(_QWORD *)(v16 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23DC59CC8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23DC703D4();
  if (v0 <= 0x3F)
  {
    sub_23DC58B38(319);
    if (v1 <= 0x3F)
    {
      sub_23DC58AD8(319);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *sub_23DC59D70(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC703D4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23DC70188();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_23DC58AD8(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[6];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_23DC703B0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_23DC59EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23DC70188();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 24);
  v9 = sub_23DC703B0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_23DC59F60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_23DC70188();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_23DC58AD8(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_23DC703B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23DC5A078(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_23DC70188();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_23DC58AD8(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_23DC703B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23DC5A1DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_23DC70188();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_23DC58AD8(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_23DC703B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23DC5A2F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_23DC703D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_23DC70188();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_23DC58AD8(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_23DC703B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23DC5A458()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5A464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_23DC703D4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    sub_23DC58AD8(0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = sub_23DC703B0();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_23DC5A4FC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5A508(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23DC703D4();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_23DC58AD8(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_23DC703B0();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23DC5A5A8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23DC703D4();
  if (v0 <= 0x3F)
  {
    sub_23DC58AD8(319);
    if (v1 <= 0x3F)
    {
      sub_23DC703B0();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

BOOL sub_23DC5A654(uint64_t a1, uint64_t a2)
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  void (*v51)(uint64_t);
  uint64_t v52;
  char *v53;
  char v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char *v66;
  char v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v4 = sub_23DC70188();
  v80 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v75 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5AC7C(0);
  v77 = v7;
  MEMORY[0x24BDAC7A8](v7, v8);
  v81 = (uint64_t)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58AD8(0);
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v76 = (uint64_t)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v78 = (uint64_t)&v69 - v16;
  MEMORY[0x24BDAC7A8](v15, v17);
  v79 = (uint64_t)&v69 - v18;
  v19 = sub_23DC703B0();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5AC90(0);
  v25 = v24;
  MEMORY[0x24BDAC7A8](v24, v26);
  v28 = (char *)&v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58B38(0);
  v31 = MEMORY[0x24BDAC7A8](v29, v30);
  v82 = (uint64_t)&v69 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v31, v33);
  v36 = (char *)&v69 - v35;
  MEMORY[0x24BDAC7A8](v34, v37);
  v39 = (char *)&v69 - v38;
  if ((sub_23DC703C8() & 1) == 0)
    return 0;
  v40 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  if (*(unsigned __int8 *)(a1 + *(int *)(v40 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v40 + 20)))
    return 0;
  v70 = v23;
  v74 = v4;
  v41 = *(int *)(v40 + 24);
  v72 = a1;
  v42 = v19;
  v43 = v20;
  v44 = v40;
  sub_23DC58B70(a1 + v41, (uint64_t)v39, (uint64_t (*)(_QWORD))sub_23DC58B38);
  v71 = v44;
  v45 = *(int *)(v44 + 24);
  v46 = v43;
  v47 = v42;
  v73 = a2;
  sub_23DC58B70(a2 + v45, (uint64_t)v36, (uint64_t (*)(_QWORD))sub_23DC58B38);
  v48 = (uint64_t)&v28[*(int *)(v25 + 48)];
  sub_23DC58B70((uint64_t)v39, (uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DC58B38);
  sub_23DC58B70((uint64_t)v36, v48, (uint64_t (*)(_QWORD))sub_23DC58B38);
  v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48);
  if (v49((uint64_t)v28, 1, v42) != 1)
  {
    v50 = v82;
    sub_23DC58B70((uint64_t)v28, v82, (uint64_t (*)(_QWORD))sub_23DC58B38);
    if (v49(v48, 1, v42) != 1)
    {
      v53 = v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v70, v48, v47);
      sub_23DC44574(&qword_256CF4DE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE403D8], MEMORY[0x24BE403E8]);
      v54 = sub_23DC70ECC();
      v55 = *(void (**)(char *, uint64_t))(v46 + 8);
      v55(v53, v47);
      sub_23DC58BB4((uint64_t)v36, (uint64_t (*)(_QWORD))sub_23DC58B38);
      sub_23DC58BB4((uint64_t)v39, (uint64_t (*)(_QWORD))sub_23DC58B38);
      v55((char *)v50, v47);
      sub_23DC58BB4((uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DC58B38);
      if ((v54 & 1) == 0)
        return 0;
      goto LABEL_10;
    }
    sub_23DC58BB4((uint64_t)v36, (uint64_t (*)(_QWORD))sub_23DC58B38);
    sub_23DC58BB4((uint64_t)v39, (uint64_t (*)(_QWORD))sub_23DC58B38);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v50, v42);
LABEL_8:
    v51 = sub_23DC5AC90;
    v52 = (uint64_t)v28;
LABEL_16:
    sub_23DC58BB4(v52, (uint64_t (*)(_QWORD))v51);
    return 0;
  }
  sub_23DC58BB4((uint64_t)v36, (uint64_t (*)(_QWORD))sub_23DC58B38);
  sub_23DC58BB4((uint64_t)v39, (uint64_t (*)(_QWORD))sub_23DC58B38);
  if (v49(v48, 1, v42) != 1)
    goto LABEL_8;
  sub_23DC58BB4((uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DC58B38);
LABEL_10:
  v56 = v71;
  v57 = v79;
  sub_23DC58B70(v72 + *(int *)(v71 + 28), v79, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v58 = v78;
  sub_23DC58B70(v73 + *(int *)(v56 + 28), v78, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v59 = v81;
  v60 = v81 + *(int *)(v77 + 48);
  sub_23DC58B70(v57, v81, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  sub_23DC58B70(v58, v60, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v61 = v80;
  v62 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
  v63 = v74;
  if (v62(v59, 1, v74) == 1)
  {
    sub_23DC58BB4(v58, (uint64_t (*)(_QWORD))sub_23DC58AD8);
    sub_23DC58BB4(v57, (uint64_t (*)(_QWORD))sub_23DC58AD8);
    if (v62(v60, 1, v63) == 1)
    {
      sub_23DC58BB4(v59, (uint64_t (*)(_QWORD))sub_23DC58AD8);
      return 1;
    }
    goto LABEL_15;
  }
  v64 = v76;
  sub_23DC58B70(v59, v76, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  if (v62(v60, 1, v63) == 1)
  {
    sub_23DC58BB4(v58, (uint64_t (*)(_QWORD))sub_23DC58AD8);
    sub_23DC58BB4(v57, (uint64_t (*)(_QWORD))sub_23DC58AD8);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v64, v63);
LABEL_15:
    v51 = sub_23DC5AC7C;
    v52 = v59;
    goto LABEL_16;
  }
  v66 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 32))(v75, v60, v63);
  sub_23DC44574(&qword_254322A38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v67 = sub_23DC70ECC();
  v68 = *(void (**)(char *, uint64_t))(v61 + 8);
  v68(v66, v63);
  sub_23DC58BB4(v58, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  sub_23DC58BB4(v57, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  v68((char *)v64, v63);
  sub_23DC58BB4(v59, (uint64_t (*)(_QWORD))sub_23DC58AD8);
  return (v67 & 1) != 0;
}

void sub_23DC5AC7C(uint64_t a1)
{
  sub_23DC5ACA4(a1, &qword_256CF4DD8, sub_23DC58AD8);
}

void sub_23DC5AC90(uint64_t a1)
{
  sub_23DC5ACA4(a1, &qword_256CF4DE0, sub_23DC58B38);
}

void sub_23DC5ACA4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t TupleTypeMetadata2;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t sub_23DC5ACFC()
{
  return sub_23DC5AD14(MEMORY[0x24BDD2D60]);
}

uint64_t sub_23DC5AD08()
{
  return sub_23DC5AD14(MEMORY[0x24BDD2D80]);
}

uint64_t sub_23DC5AD14(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;

  sub_23DC440A8(0, &qword_254322A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE40438], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v13 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_23DC70428();
  v7 = sub_23DC703D4();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23DC5BBEC((uint64_t)v6);
    return 1;
  }
  v9 = (void *)sub_23DC703E0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  if (!v9)
    return 1;
  v10 = objc_msgSend(v9, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2CA8]);
  v11 = objc_msgSend(v10, sel_isRequirementSatisfiedWithIdentifier_, *a1);

  return (uint64_t)v11;
}

uint64_t sub_23DC5AE64(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v2 = sub_23DC70D04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v7 = sub_23DC70CF8();
  v8 = sub_23DC71088();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136446466;
    v14 = sub_23DC43878(0xD000000000000018, 0x800000023DC73310, &v15);
    sub_23DC71184();
    *(_WORD *)(v9 + 12) = 2082;
    LOBYTE(v14) = a1;
    sub_23DC5BB98();
    v11 = sub_23DC70F80();
    v14 = sub_23DC43878(v11, v12, &v15);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v7, v8, "[%{public}s] updating notification state: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v10, -1, -1);
    MEMORY[0x24263FD98](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_23DC70464();
  sub_23DC70458();
  sub_23DC70440();
  return swift_release();
}

void sub_23DC5B060()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_23DC70D04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v5 = sub_23DC70CF8();
  v6 = sub_23DC71088();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136446210;
    v11 = sub_23DC43878(0xD000000000000018, 0x800000023DC73310, &v12);
    sub_23DC71184();
    _os_log_impl(&dword_23DC3D000, v5, v6, "[%{public}s] favoriting balance type", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v8, -1, -1);
    MEMORY[0x24263FD98](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_appleBalanceMetricsType);
  if (v9)
  {
    v10 = v9;
    sub_23DC705F0();
    sub_23DC705E4();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DC5B234@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
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
  char *v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unsigned __int8 v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(uint64_t, uint64_t);
  id v49;
  unsigned int v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75[3];

  v72 = a1;
  v2 = sub_23DC70D04();
  v69 = *(_QWORD *)(v2 - 8);
  v70 = v2;
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v68 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  v65 = (char *)&v62 - v7;
  v71 = sub_23DC70368();
  v66 = *(_QWORD *)(v71 - 8);
  v9 = MEMORY[0x24BDAC7A8](v71, v8);
  v67 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v62 - v13;
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)&v62 - v16;
  sub_23DC440A8(0, &qword_254322A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE40438], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v62 - v24;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_23DC70428();
  v26 = sub_23DC703D4();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v25, 1, v26) == 1)
  {
    v29 = (uint64_t)v25;
LABEL_6:
    sub_23DC5BBEC(v29);
    goto LABEL_7;
  }
  v63 = v14;
  v64 = v17;
  v30 = (char *)sub_23DC703E0();
  v31 = *(void (**)(char *, uint64_t))(v27 + 8);
  v31(v25, v26);
  if (!v30)
  {
LABEL_7:
    v32 = v68;
    sub_23DC70CE0();
    v33 = sub_23DC70CF8();
    v34 = sub_23DC71070();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v75[0] = v36;
      *(_DWORD *)v35 = 136446210;
      v74 = sub_23DC43878(0xD000000000000018, 0x800000023DC73310, v75);
      sub_23DC71184();
      _os_log_impl(&dword_23DC3D000, v33, v34, "[%{public}s] nil feature status for watch capabilities", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v36, -1, -1);
      MEMORY[0x24263FD98](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v69 + 8))(v32, v70);
    v75[0] = MEMORY[0x24BEE4AF8];
    sub_23DC5BD08((unint64_t *)&qword_256CF4DF8, MEMORY[0x24BE40070]);
    sub_23DC440A8(0, &qword_256CF4E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE40058], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DC5BC40();
    return sub_23DC711C0();
  }
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_23DC70428();
  if (v28(v22, 1, v26) == 1)
  {

    v29 = (uint64_t)v22;
    goto LABEL_6;
  }
  v38 = sub_23DC703E0();
  v31(v22, v26);
  if (!v38)
  {

    goto LABEL_7;
  }
  v39 = (void *)v38;
  v75[0] = MEMORY[0x24BEE4AF8];
  sub_23DC5BD08((unint64_t *)&qword_256CF4DF8, MEMORY[0x24BE40070]);
  sub_23DC440A8(0, &qword_256CF4E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE40058], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23DC5BC40();
  v40 = v64;
  v41 = v71;
  sub_23DC711C0();
  v42 = *MEMORY[0x24BDD2C38];
  v68 = v30;
  v43 = objc_msgSend(v30, sel_objectForKeyedSubscript_, v42);
  v44 = objc_msgSend(v43, sel_areAllRequirementsSatisfied);

  v45 = v66;
  if ((v44 & 1) != 0)
  {
    v46 = (uint64_t)v67;
    sub_23DC7035C();
    v47 = v63;
    sub_23DC5B97C(v63, v46);
    v48 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v48(v46, v41);
    v48((uint64_t)v47, v41);
  }
  v49 = objc_msgSend(v39, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2CA8]);
  v50 = objc_msgSend(v49, sel_areAllRequirementsSatisfied);

  v51 = v65;
  v52 = v63;
  v53 = (uint64_t)v67;
  if (v50)
  {
    sub_23DC70350();
    sub_23DC5B97C(v52, v53);
    v54 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v54(v53, v41);
    v54((uint64_t)v52, v41);
  }
  sub_23DC70CE0();
  v55 = sub_23DC70CF8();
  v56 = sub_23DC71088();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v75[0] = v58;
    *(_DWORD *)v57 = 136446466;
    v74 = sub_23DC43878(0xD000000000000018, 0x800000023DC73310, v75);
    sub_23DC71184();
    *(_WORD *)(v57 + 12) = 2080;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v52, v64, v41);
    v59 = sub_23DC70F80();
    v73 = sub_23DC43878(v59, v60, v75);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v55, v56, "[%{public}s] returning capabilities %s", (uint8_t *)v57, 0x16u);
    swift_arrayDestroy();
    v61 = v58;
    v40 = v64;
    MEMORY[0x24263FD98](v61, -1, -1);
    MEMORY[0x24263FD98](v57, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v69 + 8))(v51, v70);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v72, v40, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v40, v41);
}

uint64_t sub_23DC5B97C(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  char v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;

  v33 = a1;
  sub_23DC5BCA0();
  v5 = v4;
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v31 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v28 - v10;
  v12 = sub_23DC70368();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v28 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v30 = v2;
  v21(v17, v2, v12);
  sub_23DC5BD08((unint64_t *)&qword_256CF4DF8, MEMORY[0x24BE40070]);
  sub_23DC711A8();
  sub_23DC5BD08(&qword_256CF4E18, MEMORY[0x24BE40060]);
  v29 = a2;
  v22 = sub_23DC70ECC() ^ 1;
  v32 = v5;
  v23 = &v11[*(int *)(v5 + 48)];
  *v11 = v22 & 1;
  if ((v22 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    v25 = v29;
    v21(v23, v29, v12);
    v21(v17, v25, v12);
    sub_23DC711B4();
    v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  }
  else
  {
    v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v24(v23, v20, v12);
  }
  v26 = &v31[*(int *)(v32 + 48)];
  v24(v26, v23, v12);
  v24(v33, v26, v12);
  return v22 & 1;
}

void sub_23DC5BB98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4DF0)
  {
    v0 = sub_23DC71178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4DF0);
  }
}

uint64_t sub_23DC5BBEC(uint64_t a1)
{
  uint64_t v2;

  sub_23DC440A8(0, &qword_254322A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE40438], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23DC5BC40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4E08;
  if (!qword_256CF4E08)
  {
    sub_23DC440A8(255, &qword_256CF4E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE40058], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4E08);
  }
  return result;
}

void sub_23DC5BCA0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF4E10)
  {
    sub_23DC70368();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF4E10);
  }
}

uint64_t sub_23DC5BD08(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23DC70368();
    result = MEMORY[0x24263FCFC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void destroy for BalanceOnboardingManager(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);

}

uint64_t initializeWithCopy for BalanceOnboardingManager(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  id v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for BalanceOnboardingManager(uint64_t *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  id v6;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = (void *)a2[5];
  v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  v6 = v4;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BalanceOnboardingManager(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BalanceOnboardingManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingManager()
{
  return &type metadata for BalanceOnboardingManager;
}

uint64_t *sub_23DC5BEE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC705C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23DC70308();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_unknownObjectRetain();
    v12(v9, v10, v11);
    v13 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    v9[*(int *)(v13 + 20)] = v10[*(int *)(v13 + 20)];
    v14 = *(int *)(v13 + 24);
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
    v19 = *(void **)&v10[v18];
    *(_QWORD *)&v9[v18] = v19;
    swift_bridgeObjectRetain();
    v20 = v19;
  }
  return a1;
}

void sub_23DC5BFF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_23DC70AE8();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();

}

uint64_t sub_23DC5C088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DC70308();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_unknownObjectRetain();
  v11(v8, v9, v10);
  v12 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v8 + *(int *)(v12 + 20)) = *(_BYTE *)(v9 + *(int *)(v12 + 20));
  v13 = *(int *)(v12 + 24);
  v14 = (_QWORD *)(v8 + v13);
  v15 = (_QWORD *)(v9 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v18 = *(void **)(v9 + v17);
  *(_QWORD *)(v8 + v17) = v18;
  swift_bridgeObjectRetain();
  v19 = v18;
  return a1;
}

uint64_t sub_23DC5C168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  sub_23DC70AE8();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v8 + *(int *)(v11 + 20)) = *(_BYTE *)(v9 + *(int *)(v11 + 20));
  v12 = *(int *)(v11 + 24);
  v13 = (_QWORD *)(v8 + v12);
  v14 = (_QWORD *)(v9 + v12);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v16 = *(void **)(v9 + v15);
  v17 = *(void **)(v8 + v15);
  *(_QWORD *)(v8 + v15) = v16;
  v18 = v16;

  return a1;
}

uint64_t sub_23DC5C260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v8 + *(int *)(v11 + 20)) = *(_BYTE *)(v9 + *(int *)(v11 + 20));
  *(_OWORD *)(v8 + *(int *)(v11 + 24)) = *(_OWORD *)(v9 + *(int *)(v11 + 24));
  v12 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  *(_QWORD *)(v8 + *(int *)(v12 + 20)) = *(_QWORD *)(v9 + *(int *)(v12 + 20));
  return a1;
}

uint64_t sub_23DC5C318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = sub_23DC705C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  sub_23DC70AE8();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(v8 + *(int *)(v11 + 20)) = *(_BYTE *)(v9 + *(int *)(v11 + 20));
  v12 = *(int *)(v11 + 24);
  v13 = (_QWORD *)(v8 + v12);
  v14 = (uint64_t *)(v9 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  v18 = *(void **)(v8 + v17);
  *(_QWORD *)(v8 + v17) = *(_QWORD *)(v9 + v17);

  return a1;
}

uint64_t sub_23DC5C3F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5C400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23DC705C0();
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
    v8 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_23DC5C4A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5C4B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23DC705C0();
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
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B68);
}

uint64_t sub_23DC5C56C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23DC705C0();
  if (v1 <= 0x3F)
  {
    result = _s43SleepingSampleDaySummaryCollectionPublisherVMa(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23DC5C5F8()
{
  return sub_23DC44574(&qword_254322B60, type metadata accessor for SleepingSampleHelpTileGenerator, (uint64_t)&unk_23DC73438);
}

uint64_t sub_23DC5C624()
{
  return sub_23DC44574(&qword_254322D20, (uint64_t (*)(uint64_t))sub_23DC5C650, MEMORY[0x24BDB9AF8]);
}

void sub_23DC5C650()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322D28)
  {
    type metadata accessor for SleepingSampleHelpTileGenerator.Change(255);
    v0 = sub_23DC70DC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322D28);
  }
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator.Change(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B40);
}

id sub_23DC5C6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  _QWORD v11[2];

  v0 = sub_23DC70560();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC705A8();
  sub_23DC440A8(0, &qword_254322EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v5 = sub_23DC704DC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_23DC71BC0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v6 + 104))(v8 + v7, *MEMORY[0x24BE47498], v5);
  sub_23DC50194();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23DC72560;
  result = objc_msgSend((id)objc_opt_self(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(_QWORD *)(v9 + 32) = result;
    v11[1] = v9;
    sub_23DC70FEC();
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE47910], v0);
    return (id)sub_23DC7056C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DC5C860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  char *v14;
  uint64_t ObjectType;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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

  sub_23DC5DC7C(0);
  v25 = v0;
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_23DC5DD08();
  v3 = v2;
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5DE64();
  v26 = v7;
  v28 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5DEDC();
  v27 = v11;
  v29 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleHelpTileGenerator(0);
  ObjectType = swift_getObjectType();
  sub_23DC70590();
  v16 = sub_23DC70608();
  v32 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)((v16 & 1) == 0, ObjectType);
  v17 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  v18 = sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
  sub_23DC70E00();
  sub_23DC5DDF0();
  sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
  v30 = v17;
  v31 = v18;
  swift_getOpaqueTypeConformance2();
  sub_23DC70D40();
  sub_23DC705B4();
  sub_23DC70D28();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v3);
  type metadata accessor for SleepingSampleHelpTileGenerator.Change(0);
  sub_23DC44574(&qword_254322C98, (uint64_t (*)(uint64_t))sub_23DC5DE64, MEMORY[0x24BDB97E0]);
  v19 = v26;
  sub_23DC70E18();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v19);
  sub_23DC44574(&qword_254322C68, (uint64_t (*)(uint64_t))sub_23DC5DEDC, MEMORY[0x24BDB96C0]);
  v20 = v27;
  v21 = sub_23DC70E0C();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v20);
  return v21;
}

id sub_23DC5CB64@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  id v9;

  v9 = *a1;
  sub_23DC5DF70();
  v5 = (char *)a1 + *(int *)(v4 + 48);
  v6 = (char *)a2 + *(int *)(type metadata accessor for SleepingSampleHelpTileGenerator.Change(0) + 20);
  v7 = sub_23DC703B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, v5, v7);
  *a2 = v9;
  return v9;
}

id sub_23DC5CBE4(id *a1)
{
  uint64_t v2;
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
  uint64_t v27;
  char *v28;
  id v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t *, _QWORD);
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id result;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80[4];
  uint64_t v81;

  v73 = sub_23DC70560();
  v70 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73, v2);
  v72 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_23DC70584();
  v71 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74, v4);
  v69 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_23DC704DC();
  v76 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79, v6);
  v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DC70554();
  v75 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DC70D04();
  v77 = *(_QWORD *)(v13 - 8);
  *(_QWORD *)&v78 = v13;
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v63 - v19;
  sub_23DC5D908(0);
  MEMORY[0x24BDAC7A8](v21, v22);
  v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel(0);
  MEMORY[0x24BDAC7A8](v25, v26);
  v28 = (char *)&v63 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = objc_msgSend(*a1, sel_objectForKeyedSubscript_, *MEMORY[0x24BDD2C38]);
  v30 = objc_msgSend(v29, sel_areAllRequirementsSatisfied);

  if (v30)
  {
    sub_23DC5D93C((uint64_t)v24);
  }
  else
  {
    v31 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v24, 1, 1, v31);
  }
  sub_23DC4A6DC((uint64_t)v24, (uint64_t)v28, (uint64_t (*)(_QWORD))sub_23DC5D908);
  v32 = sub_23DC5D398();
  if (v33 >> 60 == 15)
  {
    sub_23DC70CE0();
    v34 = sub_23DC70CF8();
    v35 = sub_23DC71088();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = v28;
      v38 = swift_slowAlloc();
      v80[0] = v38;
      *(_DWORD *)v36 = 136446210;
      v81 = sub_23DC43878(0xD00000000000001FLL, 0x800000023DC73340, v80);
      sub_23DC71184();
      _os_log_impl(&dword_23DC3D000, v34, v35, "[%{public}s] Not submitting a feed item", v36, 0xCu);
      swift_arrayDestroy();
      v39 = v38;
      v28 = v37;
      MEMORY[0x24263FD98](v39, -1, -1);
      MEMORY[0x24263FD98](v36, -1, -1);
    }

    (*(void (**)(char *, _QWORD))(v77 + 8))(v17, v78);
    v40 = MEMORY[0x24BEE4AF8];
    goto LABEL_12;
  }
  v41 = v33;
  v68 = v32;
  v64 = v9;
  sub_23DC70CE0();
  v42 = sub_23DC70CF8();
  v43 = sub_23DC71088();
  v44 = os_log_type_enabled(v42, v43);
  v65 = v28;
  v67 = v41;
  v66 = v12;
  if (v44)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    v80[0] = v46;
    *(_DWORD *)v45 = 136446210;
    v81 = sub_23DC43878(0xD00000000000001FLL, 0x800000023DC73340, v80);
    sub_23DC71184();
    _os_log_impl(&dword_23DC3D000, v42, v43, "[%{public}s] Submitting a feed item", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v46, -1, -1);
    MEMORY[0x24263FD98](v45, -1, -1);
  }

  (*(void (**)(char *, _QWORD))(v77 + 8))(v20, v78);
  v47 = v79;
  type metadata accessor for SleepingSampleHelpTileViewController(0);
  static SleepingSampleHelpTileViewController.bundleClassName.getter();
  v48 = *MEMORY[0x24BE47498];
  v49 = v76;
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 104);
  v50(v8, v48, v47);
  sub_23DC58AF4(v68, v67);
  sub_23DC705A8();
  v51 = v66;
  sub_23DC70524();
  v52 = sub_23DC705D8();
  v54 = v53;
  v55 = (void (*)(uint64_t *, _QWORD))sub_23DC70548();
  sub_23DC4DC48(&v81, v52, v54);
  swift_bridgeObjectRelease();
  v55(v80, 0);
  sub_23DC705A8();
  sub_23DC440A8(0, &qword_254322EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE474E8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v56 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  v57 = swift_allocObject();
  v78 = xmmword_23DC71BC0;
  *(_OWORD *)(v57 + 16) = xmmword_23DC71BC0;
  v50((char *)(v57 + v56), v48, v79);
  sub_23DC50194();
  v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_23DC72560;
  result = objc_msgSend((id)objc_opt_self(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(_QWORD *)(v58 + 32) = result;
    v80[0] = v58;
    sub_23DC70FEC();
    (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v72, *MEMORY[0x24BE47910], v73);
    v60 = v69;
    sub_23DC7056C();
    sub_23DC70578();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v60, v74);
    sub_23DC70530();
    sub_23DC7050C();
    sub_23DC70518();
    sub_23DC440A8(0, &qword_256CF4DC0, (uint64_t (*)(uint64_t))MEMORY[0x24BE477D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v61 = v75;
    v62 = (*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v78;
    (*(void (**)(unint64_t, char *, uint64_t))(v61 + 32))(v40 + v62, v51, v64);
    sub_23DC44BA0(v68, v67);
    v28 = v65;
LABEL_12:
    sub_23DC58BB4((uint64_t)v28, type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel);
    return (id)v40;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DC5D398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD v18[4];
  uint64_t v19;

  v1 = sub_23DC70D04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v19 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  MEMORY[0x24BDAC7A8](v19, v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5D908(0);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC58B70(v0, (uint64_t)v10, (uint64_t (*)(_QWORD))sub_23DC5D908);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23DC58BB4((uint64_t)v10, (uint64_t (*)(_QWORD))sub_23DC5D908);
    return 0;
  }
  else
  {
    v18[2] = v2;
    v18[3] = v1;
    sub_23DC4A6DC((uint64_t)v10, (uint64_t)v15, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_23DC58B70((uint64_t)v15, (uint64_t)v6, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_23DC70110();
    swift_allocObject();
    sub_23DC70104();
    sub_23DC44574(qword_256CF4E20, type metadata accessor for SleepingSampleHelpTileConfiguration, (uint64_t)&unk_23DC73DB8);
    v16 = sub_23DC700F8();
    swift_release();
    sub_23DC58BB4((uint64_t)v6, type metadata accessor for SleepingSampleHelpTileConfiguration);
    sub_23DC58BB4((uint64_t)v15, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  return v16;
}

uint64_t sub_23DC5D800()
{
  return sub_23DC705CC();
}

uint64_t sub_23DC5D81C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23DC5C860();
  *a1 = result;
  return result;
}

uint64_t sub_23DC5D840()
{
  sub_23DC44574(&qword_254322B58, type metadata accessor for SleepingSampleHelpTileGenerator, (uint64_t)&unk_23DC73408);
  return sub_23DC70638();
}

uint64_t sub_23DC5D898()
{
  return sub_23DC44574(&qword_254322B50, type metadata accessor for SleepingSampleHelpTileGenerator, (uint64_t)&unk_23DC733A0);
}

uint64_t sub_23DC5D8C4()
{
  sub_23DC44574(&qword_254322B50, type metadata accessor for SleepingSampleHelpTileGenerator, (uint64_t)&unk_23DC733A0);
  return sub_23DC7062C();
}

void sub_23DC5D908(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322B28, type metadata accessor for SleepingSampleHelpTileVariant, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B30);
}

uint64_t sub_23DC5D93C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_23DC702C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC440A8(0, &qword_254322A50, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v23 - v9;
  v11 = sub_23DC70344();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleHelpTileGenerator.Change(0);
  v16 = sub_23DC703A4();
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v10, v16+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * (v17 - 1), v11);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v18, 1, v11);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23DC5DBC4((uint64_t)v10);
LABEL_6:
    v19 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a1, 1, 1, v19);
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v11);
  sub_23DC70410();
  if ((sub_23DC70290() & 1) != 0)
  {
    v21 = sub_23DC70338();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    if ((v21 & 1) == 0)
      goto LABEL_6;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v6, v2);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
  }
  v22 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a1, 0, 1, v22);
}

uint64_t sub_23DC5DBC4(uint64_t a1)
{
  uint64_t v2;

  sub_23DC440A8(0, &qword_254322A50, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FFB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23DC5DC18()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2543222C8[0])
  {
    sub_23DC44CF0(255, (unint64_t *)&qword_2543222C0);
    v0 = sub_23DC71178();
    if (!v1)
      atomic_store(v0, qword_2543222C8);
  }
}

void sub_23DC5DC7C(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  if (!qword_254322DD8)
  {
    v4[0] = _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    v4[1] = sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
    v2 = MEMORY[0x24263FCCC](a1, v4, MEMORY[0x24BE48560], 0);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_254322DD8);
  }
}

void sub_23DC5DD08()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C10)
  {
    sub_23DC5DDF0();
    sub_23DC5DC7C(255);
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
    swift_getOpaqueTypeConformance2();
    v0 = sub_23DC70D34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C10);
  }
}

void sub_23DC5DDF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322D60)
  {
    sub_23DC44CF0(255, (unint64_t *)&qword_254322E50);
    v0 = sub_23DC70DC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322D60);
  }
}

void sub_23DC5DE64()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322CA0)
  {
    sub_23DC5DD08();
    sub_23DC44574(&qword_254322C08, (uint64_t (*)(uint64_t))sub_23DC5DD08, MEMORY[0x24BDB9450]);
    v0 = sub_23DC70D88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322CA0);
  }
}

void sub_23DC5DEDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C70)
  {
    sub_23DC5DE64();
    type metadata accessor for SleepingSampleHelpTileGenerator.Change(255);
    sub_23DC44574(&qword_254322C98, (uint64_t (*)(uint64_t))sub_23DC5DE64, MEMORY[0x24BDB97E0]);
    v0 = sub_23DC70D7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C70);
  }
}

void sub_23DC5DF70()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254322E60)
  {
    sub_23DC44CF0(255, (unint64_t *)&qword_254322E50);
    sub_23DC703B0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254322E60);
  }
}

uint64_t *sub_23DC5DFEC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23DC5D908(0);
  v5 = *(_QWORD *)(v4 - 8);
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
    v7 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_23DC702C0();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        memcpy(a1, a2, *(_QWORD *)(v8 + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_23DC5E110(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_23DC702C0();
    v5 = *(_QWORD *)(v4 - 8);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  return result;
}

void *sub_23DC5E19C(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_23DC5D908(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_23DC702C0();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_23DC5E298(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      v13 = sub_23DC702C0();
      v14 = *(_QWORD *)(v13 - 8);
      v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
      v16 = v15(a1, 1, v13);
      v17 = v15(a2, 1, v13);
      if (v16)
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 16))(a1, a2, v13);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
          return a1;
        }
      }
      else
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 24))(a1, a2, v13);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v14 + 8))(a1, v13);
      }
      v12 = *(_QWORD *)(v5 + 64);
      goto LABEL_8;
    }
    sub_23DC58BB4((uint64_t)a1, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_7:
    sub_23DC5D908(0);
    v12 = *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v12);
    return a1;
  }
  if (v8)
    goto LABEL_7;
  v9 = sub_23DC702C0();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(a1, a2, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_23DC5E458(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_23DC5D908(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_23DC702C0();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_23DC5E554(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      v13 = sub_23DC702C0();
      v14 = *(_QWORD *)(v13 - 8);
      v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
      v16 = v15(a1, 1, v13);
      v17 = v15(a2, 1, v13);
      if (v16)
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 32))(a1, a2, v13);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
          return a1;
        }
      }
      else
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 40))(a1, a2, v13);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v14 + 8))(a1, v13);
      }
      v12 = *(_QWORD *)(v5 + 64);
      goto LABEL_8;
    }
    sub_23DC58BB4((uint64_t)a1, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_7:
    sub_23DC5D908(0);
    v12 = *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v12);
    return a1;
  }
  if (v8)
    goto LABEL_7;
  v9 = sub_23DC702C0();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v10 + 32))(a1, a2, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_23DC5E714()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5E720(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC5D908(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23DC5E75C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5E768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC5D908(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_23DC5E7A8()
{
  unint64_t v0;

  sub_23DC5D908(319);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void **sub_23DC5E810(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_23DC703B0();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_23DC5E8A4(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23DC703B0();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void **sub_23DC5E8EC(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  id v10;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23DC703B0();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_23DC5E958(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23DC703B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_23DC5E9C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23DC703B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_23DC5EA24(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23DC703B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_23DC5EA90()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC5EA9C(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23DC703B0();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_23DC5EB18()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23DC5EB24(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23DC703B0();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23DC5EB98()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC703B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_23DC5EC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
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
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  char v28;
  uint64_t v30;
  uint64_t v31;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v31 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5EEE0();
  v9 = v8;
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC5D908(0);
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v30 - v20;
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)&v30 - v23;
  sub_23DC58B70(a1, (uint64_t)&v30 - v23, (uint64_t (*)(_QWORD))sub_23DC5D908);
  sub_23DC58B70(a2, (uint64_t)v21, (uint64_t (*)(_QWORD))sub_23DC5D908);
  v25 = (uint64_t)&v12[*(int *)(v9 + 48)];
  sub_23DC58B70((uint64_t)v24, (uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DC5D908);
  sub_23DC58B70((uint64_t)v21, v25, (uint64_t (*)(_QWORD))sub_23DC5D908);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v26((uint64_t)v12, 1, v4) == 1)
  {
    sub_23DC58BB4((uint64_t)v21, (uint64_t (*)(_QWORD))sub_23DC5D908);
    sub_23DC58BB4((uint64_t)v24, (uint64_t (*)(_QWORD))sub_23DC5D908);
    if (v26(v25, 1, v4) == 1)
    {
      sub_23DC58BB4((uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DC5D908);
      return 1;
    }
    goto LABEL_6;
  }
  sub_23DC58B70((uint64_t)v12, (uint64_t)v17, (uint64_t (*)(_QWORD))sub_23DC5D908);
  if (v26(v25, 1, v4) == 1)
  {
    sub_23DC58BB4((uint64_t)v21, (uint64_t (*)(_QWORD))sub_23DC5D908);
    sub_23DC58BB4((uint64_t)v24, (uint64_t (*)(_QWORD))sub_23DC5D908);
    sub_23DC58BB4((uint64_t)v17, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_6:
    sub_23DC58BB4((uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DC5EEE0);
    return 0;
  }
  v27 = v31;
  sub_23DC4A6DC(v25, v31, type metadata accessor for SleepingSampleHelpTileVariant);
  v28 = sub_23DC6ABFC((uint64_t)v17, v27);
  sub_23DC58BB4(v27, type metadata accessor for SleepingSampleHelpTileVariant);
  sub_23DC58BB4((uint64_t)v21, (uint64_t (*)(_QWORD))sub_23DC5D908);
  sub_23DC58BB4((uint64_t)v24, (uint64_t (*)(_QWORD))sub_23DC5D908);
  sub_23DC58BB4((uint64_t)v17, type metadata accessor for SleepingSampleHelpTileVariant);
  sub_23DC58BB4((uint64_t)v12, (uint64_t (*)(_QWORD))sub_23DC5D908);
  return (v28 & 1) != 0;
}

void sub_23DC5EEE0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF4E50)
  {
    sub_23DC5D908(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF4E50);
  }
}

uint64_t HealthBalanceAppDelegate.notificationCenterDelegate(for:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 15)
    return 0;
  swift_unknownObjectRetain();
  return v1;
}

uint64_t sub_23DC5EF74(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 15)
    return 0;
  swift_unknownObjectRetain();
  return v1;
}

uint64_t HealthBalanceAppDelegate.userNotificationCenter(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)&dword_256CF4E68 + dword_256CF4E68);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23DC4D754;
  return v6(a2);
}

uint64_t sub_23DC5F150(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t (*v12)(id);

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v12 = (uint64_t (*)(id))((char *)&dword_256CF4E68 + dword_256CF4E68);
  v8 = a1;
  v9 = a2;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_23DC5F1F0;
  return v12(v9);
}

uint64_t sub_23DC5F1F0()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD))(*v0 + 40);
  v3 = *(void **)(*v0 + 24);
  v2 = *(void **)(*v0 + 32);
  v4 = *(void **)(*v0 + 16);
  v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_23DC5F268(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23DC5F994;
  return v6();
}

uint64_t sub_23DC5F2BC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23DC5F994;
  return v7();
}

uint64_t sub_23DC5F310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23DC71058();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23DC7104C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23DC55024(a1, &qword_256CF4A68, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23DC71028();
    sub_23DC70AE8();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23DC5F464(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_23DC7020C();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_23DC4A608(0, (unint64_t *)&unk_256CF4F20, (void (*)(uint64_t))MEMORY[0x24BE3FAA0]);
  v2[7] = swift_task_alloc();
  v4 = sub_23DC70230();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v5 = sub_23DC70164();
  v2[11] = v5;
  v2[12] = *(_QWORD *)(v5 - 8);
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23DC5F544()
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 96);
  v15 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 32);
  v11 = *(_QWORD **)(v0 + 24);
  sub_23DC70224();
  v7 = *MEMORY[0x24BE3FA80];
  v8 = sub_23DC701E8();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v3, v7, v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v3, 0, 1, v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, *MEMORY[0x24BE3FAC8], v6);
  sub_23DC701DC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_23DC55024(v3, (unint64_t *)&unk_256CF4F20, (void (*)(uint64_t))MEMORY[0x24BE3FAA0]);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v13);
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v11) + 0x58))(v1);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v15);
  sub_23DC702CC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23DC5F6D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4E70;
  if (!qword_256CF4E70)
  {
    v1 = type metadata accessor for HealthBalanceAppDelegate();
    result = MEMORY[0x24263FCFC](&protocol conformance descriptor for HealthBalanceAppDelegate, v1);
    atomic_store(result, (unint64_t *)&qword_256CF4E70);
  }
  return result;
}

uint64_t sub_23DC5F71C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_23DC5F758()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23DC5F994;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_256CF4EE0 + dword_256CF4EE0))(v2, v3, v5, v4);
}

uint64_t sub_23DC5F7D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23DC5F994;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256CF4EF0 + dword_256CF4EF0))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  sub_23DC70AE8();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DC5F87C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23DC5F994;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256CF4F00 + dword_256CF4F00))(a1, v4, v5, v6);
}

uint64_t sub_23DC5F900()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DC5F924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23DC4D754;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256CF4F10 + dword_256CF4F10))(a1, v4);
}

uint64_t sub_23DC5F998()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char v18;
  void (*v19)(_BYTE *, uint64_t);
  char v20;
  char v21;
  uint64_t ObjCClassFromMetadata;
  id v23;
  uint64_t v24;
  _BYTE v26[16];

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_23DC70368();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v14 = &v26[-v13];
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = &v26[-v16];
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  sub_23DC5B234((uint64_t)v17);
  sub_23DC7035C();
  sub_23DC603AC();
  v18 = sub_23DC7119C();
  v19 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v19(v14, v5);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(v10, v17, v5);
  if ((v18 & 1) != 0)
  {
    sub_23DC70350();
    v20 = sub_23DC7119C();
    v19(v14, v5);
    v19(v10, v5);
    if ((v20 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v19(v10, v5);
  }
  sub_23DC70350();
  v21 = sub_23DC7119C();
  v19(v14, v5);
  if ((v21 & 1) == 0)
  {
    sub_23DC7035C();
    sub_23DC7119C();
    v19(v14, v5);
  }
LABEL_7:
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v23 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v24 = sub_23DC70F74();
  v19(v17, v5);
  return v24;
}

uint64_t sub_23DC5FD64()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v1 = v0;
  v2 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v4, v5);
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  objc_msgSendSuper2(&v11, sel_viewDidLoad);
  objc_msgSend(v0, sel_hxui_addCancelButton);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v8 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_23DC70F38();

  sub_23DC5FF2C();
  sub_23DC52024();
  swift_bridgeObjectRelease();
  return sub_23DC71118();
}

uint64_t sub_23DC5FF2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  char v12;
  _QWORD v14[2];

  v1 = sub_23DC70368();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1, v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)v14 - v8;
  v14[0] = 0xD000000000000015;
  v14[1] = 0x800000023DC754F0;
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  sub_23DC5B234((uint64_t)v9);
  sub_23DC70350();
  sub_23DC603AC();
  v10 = sub_23DC7119C();
  v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v6, v1);
  if ((v10 & 1) != 0)
    sub_23DC70FB0();
  sub_23DC7035C();
  v12 = sub_23DC7119C();
  v11(v6, v1);
  if ((v12 & 1) != 0)
    sub_23DC70FB0();
  v11(v9, v1);
  return v14[0];
}

id sub_23DC6033C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingIntroViewController()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for BalanceOnboardingIntroViewControllerModel()
{
  return &type metadata for BalanceOnboardingIntroViewControllerModel;
}

unint64_t sub_23DC603AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4DF8;
  if (!qword_256CF4DF8)
  {
    v1 = sub_23DC70368();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BE40070], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4DF8);
  }
  return result;
}

uint64_t sub_23DC603F4(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return a1;
}

uint64_t sub_23DC60418(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t ObjectType;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  sub_23DC60B8C();
  v3 = v2;
  v33 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC60D9C(0, &qword_254322CB0, v7, (void (*)(void))sub_23DC60C4C);
  v35 = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  sub_23DC60C68();
  v11 = v10;
  v34 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC60D9C(0, &qword_254322CD0, v15, (void (*)(void))sub_23DC60E00);
  v36 = v16;
  v38 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v33 - v18;
  sub_23DC60E1C();
  v37 = v20;
  v39 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v44 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, ObjectType);
  v25 = swift_getObjectType();
  v43 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v25);
  v26 = swift_getObjectType();
  v42 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v26);
  v27 = swift_getObjectType();
  v41 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v27);
  v28 = swift_getObjectType();
  v40 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v28);
  sub_23DC5DDF0();
  sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
  sub_23DC70D40();
  sub_23DC705B4();
  sub_23DC70D28();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v3);
  sub_23DC60D5C(&qword_254322CA8, &qword_254322CB0, (void (*)(uint64_t))sub_23DC60B8C, (void (*)(void))sub_23DC60C4C);
  sub_23DC70D64();
  sub_23DC705B4();
  sub_23DC70D4C();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v11);
  sub_23DC703D4();
  sub_23DC60D5C(&qword_254322CC8, &qword_254322CD0, (void (*)(uint64_t))sub_23DC60C68, (void (*)(void))sub_23DC60E00);
  v29 = v36;
  sub_23DC70E18();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v29);
  sub_23DC44574(&qword_254322C88, (uint64_t (*)(uint64_t))sub_23DC60E1C, MEMORY[0x24BDB96C0]);
  v30 = v37;
  v31 = sub_23DC70E0C();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v23, v30);
  return v31;
}

uint64_t sub_23DC607EC(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t inited;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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

  sub_23DC60ED4();
  inited = swift_initStackObject();
  v11 = (void **)MEMORY[0x24BDD2E80];
  *(_OWORD *)(inited + 16) = xmmword_23DC73540;
  v12 = *v11;
  *(_QWORD *)(inited + 32) = v12;
  *(_QWORD *)(inited + 40) = a1;
  v13 = (void *)*MEMORY[0x24BDD2E78];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BDD2E78];
  *(_QWORD *)(inited + 56) = a2;
  v14 = (void *)*MEMORY[0x24BDD2E58];
  *(_QWORD *)(inited + 64) = *MEMORY[0x24BDD2E58];
  *(_QWORD *)(inited + 72) = a3;
  v15 = (void *)*MEMORY[0x24BDD2E88];
  *(_QWORD *)(inited + 80) = *MEMORY[0x24BDD2E88];
  *(_QWORD *)(inited + 88) = a4;
  v16 = (void *)*MEMORY[0x24BDD2E48];
  *(_QWORD *)(inited + 96) = *MEMORY[0x24BDD2E48];
  *(_QWORD *)(inited + 104) = a5;
  v17 = v12;
  v18 = a1;
  v19 = v13;
  v20 = a2;
  v21 = v14;
  v22 = a3;
  v23 = v15;
  v24 = a4;
  v25 = v16;
  v26 = a5;
  sub_23DC60A10(inited);
  return sub_23DC703BC();
}

unint64_t sub_23DC608EC(uint64_t a1)
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
  sub_23DC61360();
  v2 = sub_23DC712F8();
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
    sub_23DC613C8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23DC61028(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23DC61474(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23DC60A10(uint64_t a1)
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
  sub_23DC60F94();
  v2 = (_QWORD *)sub_23DC712F8();
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
    result = sub_23DC6108C((uint64_t)v6);
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

uint64_t sub_23DC60B14(void **a1)
{
  return sub_23DC607EC(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t sub_23DC60B28()
{
  sub_23DC70AE8();
  sub_23DC70AE8();
  sub_23DC70AE8();
  sub_23DC70AE8();
  sub_23DC70AE8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SleepingSampleAnalysisFeatureStatusPublisherManager()
{
  return objc_opt_self();
}

void sub_23DC60B8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C20)
  {
    sub_23DC5DDF0();
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    v0 = sub_23DC70D34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C20);
  }
}

unint64_t sub_23DC60C10()
{
  unint64_t result;

  result = qword_254322E50;
  if (!qword_254322E50)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254322E50);
  }
  return result;
}

uint64_t sub_23DC60C4C()
{
  return sub_23DC44574(&qword_254322C18, (uint64_t (*)(uint64_t))sub_23DC60B8C, MEMORY[0x24BDB9450]);
}

void sub_23DC60C68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C40)
  {
    sub_23DC5DDF0();
    sub_23DC60D9C(255, &qword_254322CB0, (void (*)(uint64_t))sub_23DC60B8C, (void (*)(void))sub_23DC60C4C);
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    sub_23DC60D5C(&qword_254322CA8, &qword_254322CB0, (void (*)(uint64_t))sub_23DC60B8C, (void (*)(void))sub_23DC60C4C);
    v0 = sub_23DC70D58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C40);
  }
}

uint64_t sub_23DC60D5C(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_23DC60D9C(255, a2, a3, a4);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BDB97E0], v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23DC60D9C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    a4();
    v6 = sub_23DC70D88();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_23DC60E00()
{
  return sub_23DC44574(&qword_254322C38, (uint64_t (*)(uint64_t))sub_23DC60C68, MEMORY[0x24BDB9490]);
}

void sub_23DC60E1C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C90)
  {
    sub_23DC60D9C(255, &qword_254322CD0, (void (*)(uint64_t))sub_23DC60C68, (void (*)(void))sub_23DC60E00);
    sub_23DC703D4();
    sub_23DC60D5C(&qword_254322CC8, &qword_254322CD0, (void (*)(uint64_t))sub_23DC60C68, (void (*)(void))sub_23DC60E00);
    v0 = sub_23DC70D7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C90);
  }
}

void sub_23DC60ED4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322ED0)
  {
    sub_23DC60F28();
    v0 = sub_23DC71388();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322ED0);
  }
}

void sub_23DC60F28()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254322E90)
  {
    type metadata accessor for HKFeatureIdentifier(255);
    sub_23DC60C10();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254322E90);
  }
}

void sub_23DC60F94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322EB0)
  {
    type metadata accessor for HKFeatureIdentifier(255);
    sub_23DC60C10();
    sub_23DC44574(&qword_254322E78, (uint64_t (*)(uint64_t))type metadata accessor for HKFeatureIdentifier, (uint64_t)&unk_23DC721AC);
    v0 = sub_23DC71304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322EB0);
  }
}

unint64_t sub_23DC61028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC713C4();
  sub_23DC70FA4();
  v4 = sub_23DC713DC();
  return sub_23DC6110C(a1, a2, v4);
}

unint64_t sub_23DC6108C(uint64_t a1)
{
  uint64_t v2;

  sub_23DC70F5C();
  sub_23DC713C4();
  sub_23DC70FA4();
  v2 = sub_23DC713DC();
  swift_bridgeObjectRelease();
  return sub_23DC611EC(a1, v2);
}

unint64_t sub_23DC6110C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23DC71394() & 1) == 0)
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
      while (!v14 && (sub_23DC71394() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23DC611EC(uint64_t a1, uint64_t a2)
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
    v6 = sub_23DC70F5C();
    v8 = v7;
    if (v6 == sub_23DC70F5C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23DC71394();
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
          v13 = sub_23DC70F5C();
          v15 = v14;
          if (v13 == sub_23DC70F5C() && v15 == v16)
            break;
          v18 = sub_23DC71394();
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

void sub_23DC61360()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF4FC0)
  {
    v0 = sub_23DC71304();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF4FC0);
  }
}

uint64_t sub_23DC613C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC6140C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DC6140C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF4FC8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF4FC8);
  }
}

_OWORD *sub_23DC61474(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *sub_23DC61484(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD *result;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2E80], a1);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2E78], a1);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2E58], a1);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3BF8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x24BDD2E88], a1);
  v6 = (void *)*MEMORY[0x24BDD2E48];
  v7 = objc_allocWithZone(MEMORY[0x24BDD3BF8]);
  v8 = v6;
  v9 = objc_msgSend(v7, sel_initWithFeatureIdentifier_healthStore_, v8, a1);

  type metadata accessor for SleepingSampleAnalysisFeatureStatusPublisherManager();
  result = (_QWORD *)swift_allocObject();
  result[2] = v2;
  result[3] = v3;
  result[4] = v4;
  result[5] = v5;
  result[6] = v9;
  return result;
}

uint64_t HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  sub_23DC617F4();
  v6 = v5;
  v21 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC618BC();
  v11 = v10;
  v20 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = v2;
  *(_BYTE *)(v15 + 32) = a1;
  sub_23DC61934(0);
  v16 = MEMORY[0x24BDB9AF8];
  sub_23DC44574((unint64_t *)&unk_254322D40, (uint64_t (*)(uint64_t))sub_23DC61934, MEMORY[0x24BDB9AF8]);
  swift_unknownObjectRetain();
  sub_23DC70DE8();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = v2;
  swift_unknownObjectRetain();
  sub_23DC70DB8();
  sub_23DC5DDF0();
  sub_23DC44574(&qword_254322DB0, (uint64_t (*)(uint64_t))sub_23DC618BC, MEMORY[0x24BDB9E90]);
  sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, v16);
  sub_23DC70E30();
  swift_release();
  sub_23DC44574(&qword_254322CD8, (uint64_t (*)(uint64_t))sub_23DC617F4, MEMORY[0x24BDB98F0]);
  v18 = sub_23DC70E0C();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v11);
  return v18;
}

void sub_23DC617F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322CE0)
  {
    sub_23DC5DDF0();
    sub_23DC618BC();
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    sub_23DC44574(&qword_254322DB0, (uint64_t (*)(uint64_t))sub_23DC618BC, MEMORY[0x24BDB9E90]);
    v0 = sub_23DC70D94();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322CE0);
  }
}

void sub_23DC618BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322DB8)
  {
    sub_23DC61934(255);
    sub_23DC44574((unint64_t *)&unk_254322D40, (uint64_t (*)(uint64_t))sub_23DC61934, MEMORY[0x24BDB9AF8]);
    v0 = sub_23DC70DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322DB8);
  }
}

void sub_23DC61934(uint64_t a1)
{
  sub_23DC61950(a1, &qword_254322D50, (uint64_t (*)(uint64_t))sub_23DC619B8, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BDB9AE0]);
}

void sub_23DC61950(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7, MEMORY[0x24BEE4078], MEMORY[0x24BEE40A8]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_23DC619B8(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322E58, (uint64_t (*)(uint64_t))sub_23DC60C10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
}

uint64_t sub_23DC619D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];

  v6 = type metadata accessor for HKFeatureStatusPublisher.Inner(0, a3, a4, a4);
  swift_unknownObjectRetain();
  v9 = sub_23DC628FC(a1, a2, v7, v8);
  sub_23DC70AE8();
  v11[3] = v6;
  v11[4] = MEMORY[0x24263FCFC](&unk_23DC7368C, v6);
  v11[0] = v9;
  sub_23DC70DAC();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
}

uint64_t sub_23DC61A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_23DC619D4(a1, *v3, a2, a3);
}

uint64_t sub_23DC61A90@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60));
  sub_23DC44FD0(0, &qword_254322C00, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE7828]);
  a1[3] = v4;
  a1[4] = sub_23DC629A4();
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_23DC61B00@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_23DC70CA4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23DC61B80(uint64_t a1)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_23DC70CA4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_23DC61C08())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_23DC61C60()
{
  return sub_23DC61C78((SEL *)&selRef_registerObserver_);
}

id sub_23DC61C6C()
{
  return sub_23DC61C78((SEL *)&selRef_unregisterObserver_);
}

id sub_23DC61C78(SEL *a1)
{
  _QWORD *v1;

  return objc_msgSend(*(id *)((char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70)), *a1, v1);
}

void sub_23DC61CA4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = a1;
  sub_23DC62A08((uint64_t)v6);
  sub_23DC70AE8();

}

void sub_23DC61D10()
{
  sub_23DC62B14();
}

id sub_23DC61D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for HKFeatureStatusPublisher.Inner(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_23DC61D78(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  swift_release();
  v3 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x68);
  v4 = sub_23DC70CA4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return sub_23DC70AE8();
}

void (*sub_23DC61E10(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23DC61C08();
  return sub_23DC42838;
}

uint64_t sub_23DC61E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for HKFeatureStatusPublisher.Inner(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_23DC70C5C();
}

uint64_t sub_23DC61EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for HKFeatureStatusPublisher.Inner(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_23DC70C68();
}

uint64_t sub_23DC61EF4()
{
  MEMORY[0x24263FCFC](&unk_23DC736C4);
  return sub_23DC70C80();
}

uint64_t sub_23DC61F3C(uint64_t a1)
{
  MEMORY[0x24263FCFC](&unk_23DC736C4, a1);
  return sub_23DC70C74();
}

uint64_t sub_23DC61F78()
{
  return sub_23DC70D1C();
}

uint64_t HKFeatureStatusProviding.publisher.getter()
{
  sub_23DC6268C();
  return sub_23DC70E0C();
}

uint64_t sub_23DC61FD4@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t result;
  id v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t *v60;
  uint64_t v61;
  id v62[2];

  v57 = a3;
  v60 = a4;
  v62[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_23DC70D04();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v59 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC62CB8(0);
  v58 = v10;
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC62CD4(0);
  v16 = v15;
  v17 = *(_QWORD *)(v15 - 8);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)&v49 - v23;
  v62[0] = 0;
  v25 = objc_msgSend(a1, sel_featureStatusWithError_, v62);
  v26 = v62[0];
  if (v25)
  {
    v62[0] = v25;
    sub_23DC619B8(0);
    v27 = v26;
    sub_23DC70DD0();
    sub_23DC44574((unint64_t *)&unk_254322D90, (uint64_t (*)(uint64_t))sub_23DC62CD4, MEMORY[0x24BDB9DF8]);
    v28 = sub_23DC70E0C();
    result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, v16);
  }
  else
  {
    v51 = v7;
    v52 = v16;
    v53 = v21;
    v54 = v6;
    v55 = v17;
    v56 = v14;
    v50 = v11;
    v30 = v62[0];
    v31 = (void *)sub_23DC7011C();

    swift_willThrow();
    v32 = v59;
    sub_23DC70CE0();
    v33 = v31;
    v34 = v31;
    v35 = sub_23DC70CF8();
    v36 = sub_23DC71070();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = (void *)swift_slowAlloc();
      v62[0] = v38;
      *(_DWORD *)v37 = 136446466;
      v39 = sub_23DC71430();
      v61 = sub_23DC43878(v39, v40, (uint64_t *)v62);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2082;
      v61 = (uint64_t)v31;
      v41 = v31;
      sub_23DC58D2C();
      v42 = sub_23DC70F8C();
      v61 = sub_23DC43878(v42, v43, (uint64_t *)v62);
      sub_23DC71184();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DC3D000, v35, v36, "[%{public}s] Failed to get initial feature status: %{public}s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v38, -1, -1);
      MEMORY[0x24263FD98](v37, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v54);
    v44 = v52;
    v45 = v53;
    v47 = v55;
    v46 = v56;
    if ((a2 & 1) != 0)
    {
      v62[0] = 0;
      sub_23DC619B8(0);
      sub_23DC70DD0();
      sub_23DC44574((unint64_t *)&unk_254322D90, (uint64_t (*)(uint64_t))sub_23DC62CD4, MEMORY[0x24BDB9DF8]);
      v28 = sub_23DC70E0C();

      result = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v45, v44);
    }
    else
    {
      sub_23DC619B8(0);
      sub_23DC70DDC();
      sub_23DC44574(&qword_256CF5038, (uint64_t (*)(uint64_t))sub_23DC62CB8, MEMORY[0x24BDB9E20]);
      v48 = v58;
      v28 = sub_23DC70E0C();

      result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v46, v48);
    }
  }
  *v60 = v28;
  return result;
}

uint64_t sub_23DC62460()
{
  sub_23DC70AE8();
  return swift_deallocObject();
}

uint64_t sub_23DC62484@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_23DC61FD4(*(void **)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_23DC62490@<X0>(id *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  sub_23DC62B40();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1)
  {
    v12 = *a1;
    v18 = a2;
    sub_23DC6268C();
    v18 = sub_23DC70E0C();
    sub_23DC44FD0(0, (unint64_t *)&qword_254322ED8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_23DC72560;
    *(_QWORD *)(v13 + 32) = v12;
    v17 = v13;
    sub_23DC70FEC();
    sub_23DC5DDF0();
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    v14 = v12;
    sub_23DC70E24();
    swift_release();
    swift_bridgeObjectRelease();
    sub_23DC44574((unint64_t *)&unk_254322C50, (uint64_t (*)(uint64_t))sub_23DC62B40, MEMORY[0x24BDB9530]);
    v15 = sub_23DC70E0C();

    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {
    v18 = a2;
    sub_23DC6268C();
    result = sub_23DC70E0C();
    v15 = result;
  }
  *a3 = v15;
  return result;
}

uint64_t sub_23DC62660()
{
  sub_23DC70AE8();
  return swift_deallocObject();
}

uint64_t sub_23DC62684@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_23DC62490(a1, *(_QWORD *)(v2 + 24), a2);
}

unint64_t sub_23DC6268C()
{
  unint64_t result;

  result = qword_254322B10;
  if (!qword_254322B10)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC7373C, &type metadata for HKFeatureStatusPublisher);
    atomic_store(result, (unint64_t *)&qword_254322B10);
  }
  return result;
}

uint64_t sub_23DC626D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC70CA4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for HKFeatureStatusPublisher.Inner(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HKFeatureStatusPublisher.Inner);
}

ValueMetadata *type metadata accessor for HKFeatureStatusPublisher()
{
  return &type metadata for HKFeatureStatusPublisher;
}

void sub_23DC62778()
{
  JUMPOUT(0x24263FCFCLL);
}

void sub_23DC62788()
{
  JUMPOUT(0x24263FCFCLL);
}

void sub_23DC62798()
{
  JUMPOUT(0x24263FCFCLL);
}

uint64_t sub_23DC627A8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_23DC627B0()
{
  return MEMORY[0x24BEE40A8];
}

id sub_23DC627BC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  objc_class *v17;
  objc_super v19;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v2);
  v6 = v5[10];
  v7 = v5[11];
  v8 = sub_23DC70CA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v19 - v11;
  v13 = v5[12];
  sub_23DC62944();
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 0;
  *(_QWORD *)((char *)v2 + v13) = v14;
  v15 = v2;
  sub_23DC70C98();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v15[*(_QWORD *)((*v4 & *(_QWORD *)v15) + 0x68)], v12, v8);
  *(_QWORD *)&v15[*(_QWORD *)((*v4 & *(_QWORD *)v15) + 0x70)] = a2;
  swift_unknownObjectRetain();

  v17 = (objc_class *)type metadata accessor for HKFeatureStatusPublisher.Inner(0, v6, v7, v16);
  v19.receiver = v15;
  v19.super_class = v17;
  return objc_msgSendSuper2(&v19, sel_init);
}

id sub_23DC628FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v7;

  v7 = objc_allocWithZone((Class)type metadata accessor for HKFeatureStatusPublisher.Inner(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_23DC627BC(a1, a2);
}

void sub_23DC62944()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322EA8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_23DC7128C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322EA8);
  }
}

unint64_t sub_23DC629A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254322BF8;
  if (!qword_254322BF8)
  {
    sub_23DC44FD0(255, &qword_254322C00, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE7828]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BE45990], v1);
    atomic_store(result, (unint64_t *)&qword_254322BF8);
  }
  return result;
}

uint64_t sub_23DC62A08(uint64_t a1)
{
  _QWORD *v1;
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
  _QWORD v14[2];

  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50);
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58);
  v5 = sub_23DC70C8C();
  MEMORY[0x24263FCFC](MEMORY[0x24BE45970], v5);
  v6 = sub_23DC713E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v14 - v9;
  v14[1] = a1;
  v12 = type metadata accessor for HKFeatureStatusPublisher.Inner(0, v3, v4, v11);
  MEMORY[0x24263FCFC](&unk_23DC736C4, v12);
  sub_23DC70C5C();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void sub_23DC62B14()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_23DC62B40()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322C60)
  {
    sub_23DC62C08();
    sub_23DC5DDF0();
    sub_23DC44574(&qword_254322CF0, (uint64_t (*)(uint64_t))sub_23DC62C08, MEMORY[0x24BDB9970]);
    sub_23DC44574(&qword_254322D58, (uint64_t (*)(uint64_t))sub_23DC5DDF0, MEMORY[0x24BDB9AF8]);
    v0 = sub_23DC70D70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322C60);
  }
}

void sub_23DC62C08()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322CF8)
  {
    sub_23DC62C9C(255);
    sub_23DC44574(&qword_254322E08, (uint64_t (*)(uint64_t))sub_23DC62C9C, MEMORY[0x24BEE12C8]);
    v0 = sub_23DC70DA0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322CF8);
  }
}

void sub_23DC62C9C(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322E00, (uint64_t (*)(uint64_t))sub_23DC60C10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
}

void sub_23DC62CB8(uint64_t a1)
{
  sub_23DC61950(a1, &qword_254322DA8, (uint64_t (*)(uint64_t))sub_23DC619B8, MEMORY[0x24BDB9E10]);
}

void sub_23DC62CD4(uint64_t a1)
{
  sub_23DC440A8(a1, &qword_254322DA0, (uint64_t (*)(uint64_t))sub_23DC619B8, MEMORY[0x24BDB9DE0]);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24263FC90](a1, v6, a5);
}

ValueMetadata *type metadata accessor for BalanceArticleTileDataController()
{
  return &type metadata for BalanceArticleTileDataController;
}

double sub_23DC62D2C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double result;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v6 = (_QWORD *)sub_23DC70D04();
  v7 = *(v6 - 1);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v11 = sub_23DC71328();
  swift_bridgeObjectRelease();
  if (v11)
  {
    sub_23DC70CE0();
    swift_bridgeObjectRetain_n();
    v12 = sub_23DC70CF8();
    v13 = sub_23DC71070();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v21 = v18;
      *(_DWORD *)v14 = 136446466;
      v15 = sub_23DC43878(0xD000000000000020, 0x800000023DC73790, &v21);
      v19 = v6;
      v20 = v15;
      sub_23DC71184();
      *(_WORD *)(v14 + 12) = 2082;
      swift_bridgeObjectRetain();
      v20 = sub_23DC43878(a1, a2, &v21);
      sub_23DC71184();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DC3D000, v12, v13, "[%{public}s] Article identifier %{public}s could not be found", (uint8_t *)v14, 0x16u);
      v16 = v18;
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v16, -1, -1);
      MEMORY[0x24263FD98](v14, -1, -1);

      (*(void (**)(char *, id))(v7 + 8))(v10, v19);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, _QWORD *))(v7 + 8))(v10, v6);
    }
    result = 0.0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }
  else
  {
    v19 = (id)sub_23DC708D8();
    *(_QWORD *)(a3 + 24) = &type metadata for AboutBalanceArticleDataProvider;
    *(_QWORD *)(a3 + 32) = sub_23DC510FC();
    *(_QWORD *)(a3 + 40) = sub_23DC51140();

  }
  return result;
}

uint64_t sub_23DC62FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v46 = a1;
  v47 = a2;
  v3 = sub_23DC701C4();
  MEMORY[0x24BDAC7A8](v3, v4);
  v44[2] = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC63384();
  MEMORY[0x24BDAC7A8](v6, v7);
  v8 = sub_23DC70308();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v44[1] = (char *)v44 - v15;
  sub_23DC6342C(0, &qword_254322A50, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)v44 - v18;
  v20 = sub_23DC70344();
  v21 = *(_QWORD *)(v20 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v25 = (char *)v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23, v26);
  v28 = (char *)v44 - v27;
  v45 = v2;
  v29 = sub_23DC703A4();
  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v19, v29+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(_QWORD *)(v21 + 72) * (v30 - 1), v20);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, v31, 1, v20);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_23DC5DBC4((uint64_t)v19);
    v32 = v47;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v28, v19, v20);
    v33 = sub_23DC70320();
    v34 = *(uint64_t (**)(char *, char *, uint64_t))(v21 + 16);
    v35 = v34(v25, v28, v20);
    if ((v33 & 1) != 0)
    {
      v44[0] = v34;
      v36 = MEMORY[0x24263E814](v35);
      v37 = *(void (**)(char *, uint64_t))(v21 + 8);
      v37(v25, v20);
      if (v36 >= v46)
      {
        sub_23DC70314();
        sub_23DC70398();
        sub_23DC702FC();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
        sub_23DC702D8();
        sub_23DC6342C(0, &qword_256CF5040, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v38 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
        v39 = swift_allocObject();
        *(_OWORD *)(v39 + 16) = xmmword_23DC71BC0;
        ((void (*)(unint64_t, char *, uint64_t))v44[0])(v39 + v38, v28, v20);
        v40 = v47;
        sub_23DC7038C();
        v37(v28, v20);
        v41 = sub_23DC703B0();
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 0, 1, v41);
      }
    }
    else
    {
      v37 = *(void (**)(char *, uint64_t))(v21 + 8);
      v37(v25, v20);
    }
    v32 = v47;
    v37(v28, v20);
  }
  v43 = sub_23DC703B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v32, 1, 1, v43);
}

void sub_23DC63384()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322DE8)
  {
    sub_23DC70E78();
    sub_23DC633E4();
    v0 = sub_23DC70EC0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322DE8);
  }
}

unint64_t sub_23DC633E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254322DE0;
  if (!qword_254322DE0)
  {
    v1 = sub_23DC70E78();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BDD24A8], v1);
    atomic_store(result, (unint64_t *)&qword_254322DE0);
  }
  return result;
}

void sub_23DC6342C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_23DC70344();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

_QWORD *sub_23DC63484(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC70308();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23DC63520(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DC63568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23DC635D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23DC63660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_23DC636C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23DC63738()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC63744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_23DC70308();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_23DC637D0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC637DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23DC70308();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322E28);
}

uint64_t sub_23DC6386C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC70308();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_23DC638E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23DC70308();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    *((_BYTE *)a1 + *(int *)(v8 + 20)) = *((_BYTE *)a2 + *(int *)(v8 + 20));
    v9 = *(int *)(v8 + 24);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = *(int *)(a3 + 20);
    v14 = *(void **)((char *)a2 + v13);
    *(_QWORD *)((char *)a1 + v13) = v14;
    swift_bridgeObjectRetain();
    v15 = v14;
  }
  return a1;
}

void sub_23DC639A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();

}

uint64_t sub_23DC639FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = *(int *)(v7 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)(a2 + v12);
  *(_QWORD *)(a1 + v12) = v13;
  swift_bridgeObjectRetain();
  v14 = v13;
  return a1;
}

uint64_t sub_23DC63A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = *(int *)(v7 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 20);
  v12 = *(void **)(a2 + v11);
  v13 = *(void **)(a1 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  v14 = v12;

  return a1;
}

uint64_t sub_23DC63B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23DC63BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(_BYTE *)(a1 + *(int *)(v7 + 20)) = *(_BYTE *)(a2 + *(int *)(v7 + 20));
  v8 = *(int *)(v7 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 20);
  v14 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);

  return a1;
}

uint64_t sub_23DC63C40()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC63C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23DC63CC8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC63CD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t _s43SleepingSampleDaySummaryCollectionPublisherVMa(uint64_t a1)
{
  return sub_23DC44114(a1, qword_254322388);
}

uint64_t sub_23DC63D60()
{
  uint64_t result;
  unint64_t v1;

  result = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23DC63DD4()
{
  return MEMORY[0x24BEE3F20];
}

uint64_t sub_23DC63DE0(uint64_t a1, void *a2, char a3, uint64_t a4, void (*a5)(void **), uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
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
  void **v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  int EnumCaseMultiPayload;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  char *v37;
  uint64_t v38;
  int v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(void **);
  uint64_t v49;
  uint64_t v50;

  v47 = a6;
  v48 = a5;
  sub_23DC64540();
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (void **)((char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_23DC703B0();
  v14 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  v46 = v14;
  MEMORY[0x24BDAC7A8](v13, v15);
  v44 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23DC70308();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC64594();
  v24 = MEMORY[0x24BDAC7A8](v22, v23);
  v26 = (void **)((char *)&v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v24, v27);
  v29 = (uint64_t *)((char *)&v43 - v28);
  if ((a3 & 1) != 0)
  {
    *v29 = a2;
    swift_storeEnumTagMultiPayload();
    v30 = a2;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, a4, v17);
    swift_bridgeObjectRetain();
    sub_23DC7038C();
    swift_storeEnumTagMultiPayload();
  }
  sub_23DC58B70((uint64_t)v29, (uint64_t)v26, (uint64_t (*)(_QWORD))sub_23DC64594);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v32 = v49;
  v33 = v46;
  if (EnumCaseMultiPayload == 1)
  {
    v34 = *v26;
    *v12 = *v26;
    v35 = v50;
    (*(void (**)(void **, _QWORD, uint64_t))(v32 + 104))(v12, *MEMORY[0x24BE45808], v50);
    v36 = v34;
    v48(v12);

    (*(void (**)(void **, uint64_t))(v32 + 8))(v12, v35);
  }
  else
  {
    v37 = v44;
    v38 = v45;
    (*(void (**)(char *, void **, uint64_t))(v46 + 32))(v44, v26, v45);
    v39 = *(unsigned __int8 *)(a4
                             + *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) + 20));
    (*(void (**)(void **, char *, uint64_t))(v33 + 16))(v12, v37, v38);
    if (v39 == 1)
      v40 = (unsigned int *)MEMORY[0x24BE45810];
    else
      v40 = (unsigned int *)MEMORY[0x24BE45800];
    v41 = v50;
    (*(void (**)(void **, _QWORD, uint64_t))(v32 + 104))(v12, *v40, v50);
    v48(v12);
    (*(void (**)(void **, uint64_t))(v32 + 8))(v12, v41);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v37, v38);
  }
  return sub_23DC64600((uint64_t)v29);
}

uint64_t sub_23DC640B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23DC58B70(v1, a1, _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa);
}

id sub_23DC640DC(uint64_t a1)
{
  uint64_t v1;

  return *(id *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_23DC640EC()
{
  sub_23DC44574(&qword_254322E38, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC738CC);
  return sub_23DC70C44();
}

uint64_t sub_23DC64154()
{
  return sub_23DC44574((unint64_t *)&unk_254322E40, _s43SleepingSampleDaySummaryCollectionPublisherVMa, (uint64_t)&unk_23DC7388C);
}

void *sub_23DC64180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  Class v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  v24 = a2;
  v5 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5, v8);
  v9 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC701C4();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_23DC63384();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_23DC702E4();
  sub_23DC702FC();
  sub_23DC58B70(a1, (uint64_t)v9, _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa);
  v14 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  sub_23DC64418((uint64_t)v9, v16 + v14);
  v17 = (_QWORD *)(v16 + v15);
  *v17 = v24;
  v17[1] = a3;
  sub_23DC644C8();
  objc_allocWithZone(v18);
  swift_retain();
  v19 = (void *)sub_23DC70374();
  v20 = *(void **)(a1 + *(int *)(v5 + 24) + 8);
  v21 = v19;
  if (v20)
    v20 = (void *)sub_23DC70F38();
  objc_msgSend(v19, sel_setDebugIdentifier_, v20);

  return v19;
}

uint64_t sub_23DC64374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) - 8)
                          + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_23DC70308();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DC64418(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DC6445C(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v6 = a3 & 1;
  v7 = *(_QWORD *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v3 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_23DC63DE0(a1, a2, v6, v3 + v8, *(void (**)(void **))v9, *(_QWORD *)(v9 + 8));
}

void sub_23DC644C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322A58)
  {
    sub_23DC70344();
    sub_23DC44574(&qword_254322A48, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FFB0], MEMORY[0x24BE3FFA8]);
    v0 = sub_23DC70380();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322A58);
  }
}

void sub_23DC64540()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322A90)
  {
    sub_23DC703B0();
    v0 = sub_23DC70C50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322A90);
  }
}

void sub_23DC64594()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254322EE8)
  {
    sub_23DC703B0();
    sub_23DC58D2C();
    v0 = sub_23DC713E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254322EE8);
  }
}

uint64_t sub_23DC64600(uint64_t a1)
{
  uint64_t v2;

  sub_23DC64594();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_256CF5068);
}

uint64_t sub_23DC64650()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23DC646A4@<X0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t v3;
  unsigned int *v4;

  v2 = sub_23DC70434();
  v3 = sub_23DC70734();
  v4 = (unsigned int *)MEMORY[0x24BE412A0];
  if ((v2 & 1) != 0)
    v4 = (unsigned int *)MEMORY[0x24BE41298];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, *v4, v3);
}

void sub_23DC64708(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  unsigned int *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v2 = sub_23DC70734();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DC70434();
  v8 = (unsigned int *)MEMORY[0x24BE412A0];
  if ((v7 & 1) != 0)
    v8 = (unsigned int *)MEMORY[0x24BE41298];
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *v8, v2);
  sub_23DC7077C();
  sub_23DC70758();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_23DC70F38();
  v12 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v11, v10);

  if (v12)
  {
    sub_23DC648C0();
    sub_23DC70AB8();
    v13 = sub_23DC70AC4();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 0, 1, v13);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DC648C0()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char v13;
  void (*v14)(_BYTE *, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(_BYTE *, uint64_t);
  uint64_t v17;
  uint64_t ObjCClassFromMetadata;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _BYTE v25[16];

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = sub_23DC70734();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = &v25[-v11];
  v13 = sub_23DC70434();
  v14 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 104);
  if ((v13 & 1) != 0)
  {
    v15 = *MEMORY[0x24BE41298];
    v14(v12, v15, v4);
  }
  else
  {
    v14(v12, *MEMORY[0x24BE412A0], v4);
    v15 = *MEMORY[0x24BE41298];
  }
  v14(v9, v15, v4);
  sub_23DC70728();
  v16 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v16(v9, v4);
  v16(v12, v4);
  sub_23DC4A5C4(0, &qword_256CF49F0);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_23DC72550;
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v17 + 32) = sub_23DC70F74();
  *(_QWORD *)(v17 + 40) = v21;
  sub_23DC70ED8();
  v22 = objc_msgSend(v19, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  *(_QWORD *)(v17 + 48) = sub_23DC70F74();
  *(_QWORD *)(v17 + 56) = v23;
  return v17;
}

uint64_t sub_23DC64C48()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_23DC65A40();
  if (v0)
  {
    v1 = v0;
    v2 = sub_23DC64CD8();
    if (v2)
    {
      v3 = v2;
      sub_23DC4A5C4(0, (unint64_t *)&qword_254322ED8);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_23DC73920;
      *(_QWORD *)(v4 + 32) = v1;
      *(_QWORD *)(v4 + 40) = v3;
      v6 = v4;
      sub_23DC70FEC();
      return v6;
    }

  }
  return MEMORY[0x24BEE4AF8];
}

id sub_23DC64CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v8, v0, sel_setNotificationsEnabled_, sel_areNotificationsEnabled, 0, 6, 0);

  if (v9)
  {
    v10 = (void *)sub_23DC70F38();
    objc_msgSend(v9, sel_setIdentifier_, v10);

    v11 = (void *)sub_23DC7101C();
    objc_msgSend(v9, sel_setProperty_forKey_, v11, *MEMORY[0x24BE75868]);

  }
  return v9;
}

id sub_23DC64EE0(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  sub_23DC70434();
  v2 = (void *)sub_23DC7101C();

  return v2;
}

uint64_t sub_23DC64F24(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v19;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_23DC70E54();
  v19 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC70E6C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_BOOLValue);
  sub_23DC70440();
  sub_23DC65960();
  v13 = (void *)sub_23DC71100();
  v14 = swift_allocObject();
  v15 = v2 + qword_256CF5050;
  swift_beginAccess();
  MEMORY[0x24263FE4C](v15);
  *(_QWORD *)(v14 + 24) = *(_QWORD *)(v15 + 8);
  swift_unknownObjectWeakInit();
  sub_23DC70AE8();
  aBlock[4] = sub_23DC659C0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DC651EC;
  aBlock[3] = &block_descriptor;
  v16 = _Block_copy(aBlock);
  swift_release();
  sub_23DC70E60();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  sub_23DC44574(&qword_256CF5110, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_23DC440A8(0, &qword_256CF5118, v17, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
  sub_23DC659E0();
  sub_23DC711C0();
  MEMORY[0x24263F5F4](0, v12, v7, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t sub_23DC65188(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x24263FE4C](v1);
  if (result)
  {
    swift_getObjectType();
    sub_23DC70AAC();
    return sub_23DC70AE8();
  }
  return result;
}

uint64_t sub_23DC651EC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23DC65218(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_23DC64F24(v4);

}

void sub_23DC6526C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23DC65298()
{
  uint64_t v0;

  swift_release();
  return sub_23DC6593C(v0 + qword_256CF5050);
}

id sub_23DC652C4()
{
  return sub_23DC658FC(type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource);
}

uint64_t sub_23DC652D0(uint64_t a1)
{
  swift_release();
  return sub_23DC6593C(a1 + qword_256CF5050);
}

uint64_t sub_23DC65308()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(0);
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_256CF50B8);
}

uint64_t sub_23DC65324()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23DC65360()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_256CF5050;
  swift_beginAccess();
  return MEMORY[0x24263FE4C](v1);
}

uint64_t sub_23DC653AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_256CF5050;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_23DC70AE8();
}

void (*sub_23DC65414(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_256CF5050;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x24263FE4C](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_23DC65488;
}

void sub_23DC65488(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    sub_23DC70AE8();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_23DC70AE8();
  }
  free(v3);
}

void (*sub_23DC65504(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_23DC70AD0();
  return sub_23DC42838;
}

id sub_23DC65568(uint64_t a1, char *a2, int a3)
{
  uint64_t v5;
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
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  id v22;
  id v23;
  uint64_t ObjCClassFromMetadata;
  id v25;
  void *v26;
  _DWORD v28[2];
  char *v29;

  v29 = a2;
  v28[1] = a3;
  v5 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v5, v6);
  v7 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v7, v8);
  sub_23DC440A8(0, &qword_256CF5128, (uint64_t (*)(uint64_t))MEMORY[0x24BE42170], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v28 - v11;
  v13 = sub_23DC70854();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v18(v17, (uint64_t)a2, v13);
  v19 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(0));
  *(_QWORD *)&v19[qword_256CF5050 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v19[qword_256CF5048] = a1;
  v18(v12, (uint64_t)v17, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  swift_retain();
  v20 = (void *)sub_23DC70848();
  v21 = *(void (**)(char *, uint64_t))(v14 + 8);
  v21(v17, v13);
  sub_23DC44574(&qword_256CF5130, type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource, (uint64_t)&unk_23DC739CC);
  v22 = v20;
  v23 = (id)sub_23DC70A40();
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v25 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v26 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setTitle_, v26);

  swift_release();
  v21(v29, v13);
  return v23;
}

void sub_23DC6586C()
{
  sub_23DC712E0();
  __break(1u);
}

void sub_23DC658C4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_23DC658F0()
{
  return sub_23DC658FC(type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController);
}

id sub_23DC658FC(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_23DC65934()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(0);
}

uint64_t sub_23DC6593C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_23DC65960()
{
  unint64_t result;

  result = qword_256CF5108;
  if (!qword_256CF5108)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF5108);
  }
  return result;
}

uint64_t sub_23DC6599C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DC659C0()
{
  uint64_t v0;

  return sub_23DC65188(v0);
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

unint64_t sub_23DC659E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF5120;
  if (!qword_256CF5120)
  {
    sub_23DC440A8(255, &qword_256CF5118, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24263FCFC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256CF5120);
  }
  return result;
}

id sub_23DC65A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  void *v9;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_23DC70F38();
  v6 = objc_msgSend(v4, sel_groupSpecifierWithID_, v5);

  if (v6)
  {
    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v8 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_23DC70194();
    sub_23DC70F74();
    v9 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setProperty_forKey_, v9, *MEMORY[0x24BE75A68]);

  }
  return v6;
}

ValueMetadata *type metadata accessor for BalancePromotionFeedItemProvider()
{
  return &type metadata for BalancePromotionFeedItemProvider;
}

unint64_t sub_23DC65C0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254322AF0;
  if (!qword_254322AF0)
  {
    v1 = type metadata accessor for BalancePromotionFeedItemViewActionHandler();
    result = MEMORY[0x24263FCFC](&protocol conformance descriptor for BalancePromotionFeedItemViewActionHandler, v1);
    atomic_store(result, (unint64_t *)&qword_254322AF0);
  }
  return result;
}

uint64_t sub_23DC65C54()
{
  return MEMORY[0x24BEE1798];
}

uint64_t sub_23DC65C60()
{
  return MEMORY[0x24BEE1770];
}

uint64_t sub_23DC65C6C@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25[2];

  v23[2] = a1;
  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_23DC7074C();
  MEMORY[0x24BDAC7A8](v5, v6);
  v23[1] = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC70D04();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v13 = sub_23DC70CF8();
  v14 = sub_23DC71088();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v25[0] = v16;
    *(_DWORD *)v15 = 136446466;
    v23[0] = v8;
    v24 = sub_23DC43878(0xD000000000000020, 0x800000023DC73A10, v25);
    sub_23DC71184();
    *(_WORD *)(v15 + 12) = 2082;
    v24 = sub_23DC43878(0xD00000000000001ALL, 0x800000023DC75AC0, v25);
    sub_23DC71184();
    _os_log_impl(&dword_23DC3D000, v13, v14, "[%{public}s.%{public}s] creating balance promo tile configuration", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v16, -1, -1);
    MEMORY[0x24263FD98](v15, -1, -1);

    (*(void (**)(char *, _QWORD))(v9 + 8))(v12, v23[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  sub_23DC66464();
  sub_23DC71148();
  sub_23DC70740();
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  sub_23DC70ED8();
  v20 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  sub_23DC70ED8();
  v21 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  return sub_23DC707F4();
}

uint64_t sub_23DC660E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v9 = sub_23DC70CF8();
  v10 = sub_23DC71088();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v18 = a1;
    v12 = v11;
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 136446466;
    v19 = sub_23DC43878(0xD000000000000020, 0x800000023DC73A10, &v20);
    sub_23DC71184();
    *(_WORD *)(v12 + 12) = 2082;
    v19 = sub_23DC43878(0xD000000000000026, 0x800000023DC75AE0, &v20);
    sub_23DC71184();
    _os_log_impl(&dword_23DC3D000, v9, v10, "[%{public}s.%{public}s] customizing promo feed item", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v13, -1, -1);
    v14 = v12;
    a1 = v18;
    MEMORY[0x24263FD98](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v15 = sub_23DC70554();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a2, a1, v15);
  type metadata accessor for BalancePromotionFeedItemViewActionHandler();
  sub_23DC524C0();
  return sub_23DC7053C();
}

uint64_t sub_23DC6630C()
{
  sub_23DC664A0();
  return sub_23DC70BB4();
}

void sub_23DC66350(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

unint64_t sub_23DC66368()
{
  unint64_t result;

  result = qword_254322AE0;
  if (!qword_254322AE0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73A54, &type metadata for BalancePromotionFeedItemProvider);
    atomic_store(result, (unint64_t *)&qword_254322AE0);
  }
  return result;
}

unint64_t sub_23DC663AC()
{
  return 0xD000000000000018;
}

uint64_t sub_23DC663C8()
{
  sub_23DC66368();
  return sub_23DC70B48();
}

uint64_t sub_23DC66400()
{
  sub_23DC66368();
  return sub_23DC70B3C();
}

uint64_t sub_23DC66444()
{
  return 0x6C61427055746553;
}

unint64_t sub_23DC66464()
{
  unint64_t result;

  result = qword_256CF5138;
  if (!qword_256CF5138)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF5138);
  }
  return result;
}

unint64_t sub_23DC664A0()
{
  unint64_t result;

  result = qword_254322AD8;
  if (!qword_254322AD8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73AC4, &type metadata for BalancePromotionFeedItemProvider);
    atomic_store(result, (unint64_t *)&qword_254322AD8);
  }
  return result;
}

id _s22HealthBalanceAppPlugin0abC8DelegateC30createDetailRoomViewController3for7contextSo06UIViewJ0CSgSo12HKObjectTypeC_0A12ExperienceUI04DataoG13ConfigurationV7ContextVtF_0(void *a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  uint64_t v25;
  char *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[2];
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[4];
  _OWORD v49[2];
  uint64_t v50;

  v45 = a2;
  v3 = sub_23DC70D04();
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v40[1] = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v7);
  v41 = (char *)v40 - v8;
  v9 = sub_23DC709D4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DC709C8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a1;
  v19 = objc_msgSend(a1, sel_identifier);
  v20 = sub_23DC70F5C();
  v22 = v21;

  if (v20 == 0xD00000000000001DLL && v22 == 0x800000023DC75B10)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v45, v14);
    v24 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    return BalanceRoomViewController.init(context:)((uint64_t)v18);
  }
  v23 = sub_23DC71394();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
    goto LABEL_5;
  v50 = 0;
  memset(v49, 0, sizeof(v49));
  sub_23DC66A80((uint64_t)v49, (uint64_t)&v46);
  if (v47)
  {
    sub_23DC66B64(&v46, (uint64_t)v48);
    __swift_project_boxed_opaque_existential_1(v48, v48[3]);
    sub_23DC70B0C();
    v34 = v45;
    sub_23DC70998();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v34, v14);
    v35 = objc_allocWithZone((Class)sub_23DC709EC());
    v36 = v44;
    v25 = sub_23DC709E0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    sub_23DC66B28((uint64_t)v49);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  }
  else
  {
    sub_23DC66B28((uint64_t)&v46);
    v26 = v41;
    sub_23DC70CEC();
    v27 = v44;
    v28 = sub_23DC70CF8();
    v29 = sub_23DC71070();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v48[0] = v27;
      v32 = v27;
      sub_23DC71184();
      *v31 = v27;

      _os_log_impl(&dword_23DC3D000, v28, v29, "[HealthBalanceAppDelegate] No custom detail view controller or configuration provided for %@", v30, 0xCu);
      sub_23DC5DC18();
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v31, -1, -1);
      v33 = v30;
      v26 = v41;
      MEMORY[0x24263FD98](v33, -1, -1);
    }
    else
    {

    }
    v38 = v42;
    v37 = v43;

    (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v37);
    sub_23DC66B28((uint64_t)v49);
    return 0;
  }
  return (id)v25;
}

uint64_t sub_23DC66A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DC66AC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DC66AC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CF5140)
  {
    sub_23DC43F9C(255, &qword_256CF5148);
    v0 = sub_23DC71178();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CF5140);
  }
}

uint64_t sub_23DC66B28(uint64_t a1)
{
  uint64_t v2;

  sub_23DC66AC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DC66B64(__int128 *a1, uint64_t a2)
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

id sub_23DC66B7C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v8 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  sub_23DC70ED8();
  v9 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v10 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  v11 = objc_msgSendSuper2(&v13, sel_initWithTitle_detailText_icon_contentLayout_, v8, v10, 0, 1);

  return v11;
}

uint64_t sub_23DC66D78()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  objc_msgSendSuper2(&v14, sel_viewDidLoad);
  objc_msgSend(v0, sel_hxui_addCancelButton);
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v8 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_23DC70F38();

  sub_23DC70ED8();
  v10 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v11 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_23DC70F38();

  sub_23DC51B58();
  return sub_23DC71118();
}

uint64_t sub_23DC67058()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  char v8;
  uint64_t result;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v1 = sub_23DC70254();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_navigationController);
  if (!v6)
    goto LABEL_10;
  v7 = v6;
  type metadata accessor for BalanceOnboardingNavigationController();
  if (!swift_dynamicCastClass())
  {

    goto LABEL_10;
  }
  sub_23DC6BC58();

  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE3FB60], v1);
  v8 = sub_23DC6D028((uint64_t)v0, v5);
  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  if ((v8 & 1) == 0)
    return result;
  v10 = objc_msgSend(v0, sel_navigationController);
  if (!v10)
  {
LABEL_10:
    result = sub_23DC712E0();
    __break(1u);
    return result;
  }
  v11 = v10;
  if (!swift_dynamicCastClass())
  {

    goto LABEL_10;
  }
  v12 = sub_23DC6BC58();

  sub_23DC45304(v12 + 16, (uint64_t)v15);
  swift_release();
  v13 = __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_23DC45304((uint64_t)v13, (uint64_t)v14);
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_23DC5AE64(1);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t sub_23DC6727C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  _QWORD v13[5];
  _QWORD v14[5];

  v1 = sub_23DC70254();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_navigationController);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for BalanceOnboardingNavigationController();
    if (swift_dynamicCastClass())
    {
      sub_23DC6BC58();

      (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE3FB50], v1);
      sub_23DC6D588((uint64_t)v0, v5);
      swift_release();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      v8 = objc_msgSend(v0, sel_navigationController);
      if (v8)
      {
        v9 = v8;
        if (swift_dynamicCastClass())
        {
          v10 = sub_23DC6BC58();

          sub_23DC45304(v10 + 16, (uint64_t)v14);
          swift_release();
          v11 = __swift_project_boxed_opaque_existential_1(v14, v14[3]);
          sub_23DC45304((uint64_t)v11, (uint64_t)v13);
          __swift_project_boxed_opaque_existential_1(v13, v13[3]);
          sub_23DC5AE64(0);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
          return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
        }

      }
    }
    else
    {

    }
  }
  result = sub_23DC712E0();
  __break(1u);
  return result;
}

uint64_t sub_23DC67498()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t result;
  _QWORD v8[5];
  _QWORD v9[5];

  v1 = v0;
  v2 = objc_msgSend(v0, sel_navigationController);
  if (!v2)
    goto LABEL_7;
  v3 = v2;
  type metadata accessor for BalanceOnboardingNavigationController();
  if (!swift_dynamicCastClass())
    goto LABEL_6;
  v4 = sub_23DC6BC58();

  sub_23DC45304(v4 + 16, (uint64_t)v9);
  swift_release();
  v5 = __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_23DC45304((uint64_t)v5, (uint64_t)v8);
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_23DC5AE64(2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  v6 = objc_msgSend(v1, sel_navigationController);
  if (v6)
  {
    v3 = v6;
    if (swift_dynamicCastClass())
    {
      sub_23DC6BC58();

      sub_23DC6D2C0();
      return swift_release();
    }
LABEL_6:

  }
LABEL_7:
  result = sub_23DC712E0();
  __break(1u);
  return result;
}

id sub_23DC67690()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingNotificationsViewController()
{
  return objc_opt_self();
}

uint64_t static SleepingSampleHelpTileViewController.bundleClassName.getter()
{
  uint64_t v1;

  v1 = sub_23DC70284();
  sub_23DC70FB0();
  sub_23DC71430();
  sub_23DC70FB0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_23DC67740(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_23DC6B1A8(a1, (uint64_t)v5, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
  v3 = *a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  sub_23DC6B15C((uint64_t)v5, v3, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
  swift_endAccess();
  sub_23DC677E0();
  return sub_23DC55024((uint64_t)v5, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
}

uint64_t sub_23DC677E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28[3] = swift_getObjectType();
  v1 = sub_23DC70D04();
  v29 = *(_QWORD *)(v1 - 8);
  v30 = v1;
  v3 = MEMORY[0x24BDAC7A8](v1, v2);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)v28 - v5;
  sub_23DC4A608(0, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v28 - v9;
  v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context);
  result = swift_beginAccess();
  v13 = v11[3];
  if (v13)
  {
    v14 = __swift_project_boxed_opaque_existential_1(v11, v11[3]);
    v15 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v14, v14);
    v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    v18 = sub_23DC70A28();
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    if (v20 >> 60 == 15)
    {
      sub_23DC70CE0();
      v21 = sub_23DC70CF8();
      v22 = sub_23DC71070();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = swift_slowAlloc();
        v32 = v24;
        *(_DWORD *)v23 = 136446210;
        v25 = sub_23DC71430();
        v31 = sub_23DC43878(v25, v26, &v32);
        sub_23DC71184();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DC3D000, v21, v22, "[%{public}s] Could not find userData", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263FD98](v24, -1, -1);
        MEMORY[0x24263FD98](v23, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v6, v30);
    }
    else
    {
      sub_23DC700EC();
      swift_allocObject();
      sub_23DC700E0();
      v27 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
      sub_23DC44574(&qword_256CF5290, type metadata accessor for SleepingSampleHelpTileConfiguration, (uint64_t)&unk_23DC73DE0);
      sub_23DC700D4();
      swift_release();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v10, 0, 1, v27);
      sub_23DC6806C((uint64_t)v10);
      return sub_23DC44BA0(v18, v20);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DC67D34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  return sub_23DC6B1A8(v3, a1, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
}

unint64_t sub_23DC67D94()
{
  unint64_t result;

  result = qword_256CF4770;
  if (!qword_256CF4770)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4770);
  }
  return result;
}

uint64_t sub_23DC67DE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  sub_23DC6B15C(a1, v3, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
  swift_endAccess();
  sub_23DC677E0();
  return sub_23DC55024(a1, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
}

uint64_t (*sub_23DC67E7C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23DC67EC4;
}

uint64_t sub_23DC67EC4(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_23DC677E0();
  return result;
}

uint64_t sub_23DC67EF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC6A258();
  sub_23DC6A694();
  sub_23DC6A9C0();
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  return sub_23DC70BD8();
}

uint64_t sub_23DC6806C(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v20;

  sub_23DC4A608(0, &qword_256CF5288, (void (*)(uint64_t))MEMORY[0x24BE45258]);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v20 - v5;
  sub_23DC4A608(0, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v20 - v9;
  v11 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  swift_beginAccess();
  sub_23DC6B15C(a1, v16, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  swift_endAccess();
  sub_23DC6B1A8(v16, (uint64_t)v10, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23DC55024((uint64_t)v10, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  else
  {
    sub_23DC4A6DC((uint64_t)v10, (uint64_t)v15, type metadata accessor for SleepingSampleHelpTileConfiguration);
    v17 = sub_23DC6827C();
    sub_23DC67EF4();
    v18 = sub_23DC70BE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 0, 1, v18);
    sub_23DC70BF0();

    sub_23DC58BB4((uint64_t)v15, type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  return sub_23DC55024(a1, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
}

id sub_23DC6827C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView);
  }
  else
  {
    v4 = v0;
    sub_23DC70BFC();
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    sub_23DC70BCC();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_23DC70938();
    swift_release();
    swift_release();
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void sub_23DC683A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24263FE4C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_23DC6B238();

  }
}

id SleepingSampleHelpTileViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SleepingSampleHelpTileViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v12;

  v6 = &v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v7 = &v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration];
  v8 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_QWORD *)&v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView] = 0;
  if (a2)
  {
    v9 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for SleepingSampleHelpTileConfiguration(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322BC0);
}

uint64_t type metadata accessor for SleepingSampleHelpTileViewController(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_256CF51C0);
}

id SleepingSampleHelpTileViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SleepingSampleHelpTileViewController.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v3 = &v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v4 = &v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration];
  v5 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id SleepingSampleHelpTileViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DC68848()
{
  return sub_23DC44574(&qword_256CF5190, type metadata accessor for SleepingSampleHelpTileViewController, (uint64_t)&protocol conformance descriptor for SleepingSampleHelpTileViewController);
}

uint64_t sub_23DC688E0(_QWORD *a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  char v38;

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE3520];
  sub_23DC55F48(0, &qword_256CF5268, (uint64_t (*)(void))sub_23DC6B090, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys, MEMORY[0x24BEE3520]);
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v28 = (char *)&v28 - v5;
  sub_23DC55F48(0, &qword_256CF5270, (uint64_t (*)(void))sub_23DC6B0D4, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys, v2);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v31 = (char *)&v28 - v8;
  v9 = sub_23DC702C0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v35 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC55F48(0, &qword_256CF5278, (uint64_t (*)(void))sub_23DC6B118, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.CodingKeys, v2);
  v36 = v17;
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v28 - v20;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC6B118();
  sub_23DC71400();
  sub_23DC6B008(v34, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v16, 1, v9) == 1)
  {
    v38 = 1;
    sub_23DC6B090();
    v22 = v28;
    v23 = v36;
    sub_23DC71364();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v22, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, v23);
  }
  else
  {
    v34 = v18;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v35, v16, v9);
    v37 = 0;
    sub_23DC6B0D4();
    v25 = v31;
    v26 = v36;
    sub_23DC71364();
    sub_23DC44574(&qword_256CF5280, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FC10], MEMORY[0x24BE3FC20]);
    v27 = v33;
    sub_23DC71370();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v27);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v35, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v21, v26);
  }
}

uint64_t sub_23DC68C28@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  char v53;
  char v54;

  v51 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE33E0];
  sub_23DC55F48(0, &qword_256CF5230, (uint64_t (*)(void))sub_23DC6B090, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys, MEMORY[0x24BEE33E0]);
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v50 = (char *)&v41 - v6;
  sub_23DC55F48(0, &qword_256CF5240, (uint64_t (*)(void))sub_23DC6B0D4, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys, v3);
  v8 = *(_QWORD *)(v7 - 8);
  v46 = v7;
  v47 = v8;
  MEMORY[0x24BDAC7A8](v7, v9);
  v49 = (char *)&v41 - v10;
  sub_23DC55F48(0, &qword_256CF5250, (uint64_t (*)(void))sub_23DC6B118, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.CodingKeys, v3);
  v12 = v11;
  v48 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v41 - v14;
  v16 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  v18 = MEMORY[0x24BDAC7A8](v16, v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18, v21);
  v23 = (char *)&v41 - v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC6B118();
  v24 = v52;
  sub_23DC713F4();
  if (v24)
    goto LABEL_7;
  v42 = v23;
  v43 = v16;
  v41 = v20;
  v25 = v49;
  v26 = v50;
  v27 = v51;
  v52 = a1;
  v28 = sub_23DC71358();
  if (*(_QWORD *)(v28 + 16) != 1)
  {
    v31 = sub_23DC71280();
    swift_allocError();
    v33 = v32;
    sub_23DC55FA4();
    *v33 = v43;
    sub_23DC71340();
    sub_23DC71268();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v33, *MEMORY[0x24BEE26D0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v12);
    a1 = v52;
LABEL_7:
    v39 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v39);
  }
  if ((*(_BYTE *)(v28 + 32) & 1) != 0)
  {
    v54 = 1;
    sub_23DC6B090();
    sub_23DC71334();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v26, v45);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v12);
    v29 = sub_23DC702C0();
    v30 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v42, 1, 1, v29);
  }
  else
  {
    v53 = 0;
    sub_23DC6B0D4();
    v34 = v25;
    sub_23DC71334();
    v35 = sub_23DC702C0();
    sub_23DC44574(&qword_256CF5260, (uint64_t (*)(uint64_t))MEMORY[0x24BE3FC10], MEMORY[0x24BE3FC30]);
    v36 = (uint64_t)v41;
    v37 = v34;
    v38 = v46;
    sub_23DC7134C();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v38);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v36, 0, 1, v35);
    v30 = (uint64_t)v42;
    sub_23DC4A6DC(v36, (uint64_t)v42, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  sub_23DC4A6DC(v30, v27, type metadata accessor for SleepingSampleHelpTileVariant);
  v39 = (uint64_t)v52;
  return __swift_destroy_boxed_opaque_existential_1Tm(v39);
}

uint64_t sub_23DC690C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v20 = a2;
  v21 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v21, v3);
  v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC55F48(0, &qword_256CF5208, (uint64_t (*)(void))sub_23DC6B04C, (uint64_t)&type metadata for SleepingSampleHelpTileConfiguration.CodingKeys, MEMORY[0x24BEE33E0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v19 - v9;
  v11 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC6B04C();
  v15 = v23;
  sub_23DC713F4();
  if (!v15)
  {
    v16 = v20;
    sub_23DC44574(&qword_256CF5218, type metadata accessor for SleepingSampleHelpTileVariant, (uint64_t)&unk_23DC73D68);
    v17 = (uint64_t)v22;
    sub_23DC7134C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_23DC4A6DC(v17, (uint64_t)v14, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_23DC4A6DC((uint64_t)v14, v16, type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_23DC692BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  return sub_23DC6B1A8(v3, a2, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
}

uint64_t sub_23DC69324()
{
  return type metadata accessor for SleepingSampleHelpTileViewController(0);
}

void sub_23DC6932C()
{
  unint64_t v0;

  sub_23DC4A608(319, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SleepingSampleHelpTileViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t *sub_23DC6941C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(type metadata accessor for SleepingSampleHelpTileVariant(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_23DC702C0();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

uint64_t type metadata accessor for SleepingSampleHelpTileVariant(uint64_t a1)
{
  return sub_23DC44114(a1, (uint64_t *)&unk_254322B18);
}

void *sub_23DC69504(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_23DC695A4(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_23DC69690(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_23DC69730(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_23DC6981C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC69828(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23DC69864()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC69870(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23DC698B0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SleepingSampleHelpTileVariant(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23DC69918(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    v7 = sub_23DC702C0();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_23DC699E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_23DC702C0();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_23DC69A48(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC702C0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_23DC69AEC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_23DC702C0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_23DC69BDC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23DC702C0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_23DC69C80(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_23DC702C0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_23DC69D70()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC69D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_23DC702C0();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_23DC69DC8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DC69DD4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = sub_23DC702C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23DC69E24(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23DC702C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23DC69E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23DC702C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23DC69E9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DC702C0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

BOOL sub_23DC69EF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_23DC69F08()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0xD000000000000014;
}

uint64_t sub_23DC69F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC6BA18(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DC69F6C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23DC69F78()
{
  sub_23DC6B118();
  return sub_23DC71418();
}

uint64_t sub_23DC69FA0()
{
  sub_23DC6B118();
  return sub_23DC71424();
}

uint64_t sub_23DC69FC8()
{
  sub_23DC6B0D4();
  return sub_23DC71418();
}

uint64_t sub_23DC69FF0()
{
  sub_23DC6B0D4();
  return sub_23DC71424();
}

uint64_t sub_23DC6A018()
{
  sub_23DC6B090();
  return sub_23DC71418();
}

uint64_t sub_23DC6A040()
{
  sub_23DC6B090();
  return sub_23DC71424();
}

uint64_t sub_23DC6A06C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23DC68C28(a1, a2);
}

uint64_t sub_23DC6A080(_QWORD *a1)
{
  return sub_23DC688E0(a1);
}

uint64_t sub_23DC6A098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DC6BB00(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DC6A0C0()
{
  sub_23DC6B04C();
  return sub_23DC71418();
}

uint64_t sub_23DC6A0E8()
{
  sub_23DC6B04C();
  return sub_23DC71424();
}

uint64_t sub_23DC6A114@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23DC690C8(a1, a2);
}

uint64_t sub_23DC6A128(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  sub_23DC55F48(0, &qword_256CF5220, (uint64_t (*)(void))sub_23DC6B04C, (uint64_t)&type metadata for SleepingSampleHelpTileConfiguration.CodingKeys, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v5);
  v7 = (char *)&v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DC6B04C();
  sub_23DC71400();
  type metadata accessor for SleepingSampleHelpTileVariant(0);
  sub_23DC44574(&qword_256CF5228, type metadata accessor for SleepingSampleHelpTileVariant, (uint64_t)&unk_23DC73D40);
  sub_23DC71370();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

id sub_23DC6A258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v22;

  v1 = v0;
  v2 = sub_23DC70CBC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DC702C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC6B008(v1, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v15, 1, v7) == 1)
  {
    sub_23DC44CF0(0, (unint64_t *)&qword_256CF5138);
    v16 = (void *)sub_23DC71148();
    v17 = (void *)sub_23DC70F38();
    v18 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v17, v16);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v15, v7);
    switch(sub_23DC702B4())
    {
      case 1:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4720 != -1)
          swift_once();
        v19 = qword_256CF5548;
        break;
      case 2:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4728 != -1)
          swift_once();
        v19 = qword_256CF5560;
        break;
      case 3:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4730 != -1)
          swift_once();
        v19 = qword_256CF5578;
        break;
      case 4:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4738 != -1)
          swift_once();
        v19 = qword_256CF5590;
        break;
      case 5:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4740 != -1)
          swift_once();
        v19 = qword_256CF55A8;
        break;
      case 6:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4748 != -1)
          swift_once();
        v19 = qword_256CF55C0;
        break;
      default:
        sub_23DC44CF0(0, &qword_256CF47B0);
        if (qword_256CF4718 != -1)
          swift_once();
        v19 = qword_256CF5530;
        break;
    }
    v20 = __swift_project_value_buffer(v2, (uint64_t)v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v2);
    v18 = (id)sub_23DC7113C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  return v18;
}

uint64_t sub_23DC6A694()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  id v22;
  _QWORD v23[4];

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_23DC70F14();
  MEMORY[0x24BDAC7A8](v5, v6);
  v7 = sub_23DC702C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC6B008(v0, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v15, 1, v7) == 1)
  {
    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_23DC70194();
    return sub_23DC70F74();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v15, v7);
  sub_23DC70F08();
  sub_23DC70EFC();
  v19 = sub_23DC7029C();
  result = sub_23DC702B4();
  if (!__OFSUB__(v19, result))
  {
    v23[2] = v19 - result;
    sub_23DC70EE4();
    sub_23DC70EFC();
    sub_23DC70F20();
    type metadata accessor for HealthBalanceAppPlugin();
    v21 = swift_getObjCClassFromMetadata();
    v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v21);
    sub_23DC70194();
    v18 = sub_23DC70F74();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DC6A9C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v1 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC6B008(v0, (uint64_t)v8);
  v9 = sub_23DC702C0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9) == 1)
  {
    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_23DC70194();
    return sub_23DC70F74();
  }
  else
  {
    sub_23DC70ED8();
    type metadata accessor for HealthBalanceAppPlugin();
    v13 = swift_getObjCClassFromMetadata();
    v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v13);
    sub_23DC70194();
    v12 = sub_23DC70F74();
    sub_23DC58BB4((uint64_t)v8, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  return v12;
}

uint64_t sub_23DC6ABFC(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
  char v20;
  uint64_t (*v21)(_QWORD);
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC6AFA8();
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_23DC6B008(a1, (uint64_t)v17);
  sub_23DC6B008(a2, v18);
  v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v19((uint64_t)v17, 1, v4) == 1)
  {
    v20 = 1;
    if (v19(v18, 1, v4) == 1)
      goto LABEL_8;
  }
  else
  {
    sub_23DC6B008((uint64_t)v17, (uint64_t)v12);
    if (v19(v18, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v8, v18, v4);
      v20 = sub_23DC702A8();
      v22 = *(void (**)(char *, uint64_t))(v5 + 8);
      v22(v8, v4);
      v22(v12, v4);
LABEL_8:
      v21 = type metadata accessor for SleepingSampleHelpTileVariant;
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  }
  v20 = 0;
  v21 = (uint64_t (*)(_QWORD))sub_23DC6AFA8;
LABEL_9:
  sub_23DC58BB4((uint64_t)v17, v21);
  return v20 & 1;
}

uint64_t sub_23DC6ADCC(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t (*v21)(_QWORD);
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v4 = sub_23DC702C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC6AFA8();
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_23DC6B008(a1, (uint64_t)v17);
  sub_23DC6B008(a2, v18);
  v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v19((uint64_t)v17, 1, v4) == 1)
  {
    if (v19(v18, 1, v4) == 1)
      goto LABEL_8;
  }
  else
  {
    sub_23DC6B008((uint64_t)v17, (uint64_t)v12);
    if (v19(v18, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v8, v18, v4);
      v22 = sub_23DC702A8();
      v23 = *(void (**)(char *, uint64_t))(v5 + 8);
      v23(v8, v4);
      v23(v12, v4);
      if ((v22 & 1) == 0)
      {
        v20 = 0;
        goto LABEL_10;
      }
LABEL_8:
      v20 = 1;
LABEL_10:
      v21 = type metadata accessor for SleepingSampleHelpTileVariant;
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  }
  v20 = 0;
  v21 = (uint64_t (*)(_QWORD))sub_23DC6AFA8;
LABEL_11:
  sub_23DC58BB4((uint64_t)v17, v21);
  return v20;
}

void sub_23DC6AFA8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_256CF5200)
  {
    type metadata accessor for SleepingSampleHelpTileVariant(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_256CF5200);
  }
}

uint64_t sub_23DC6B008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23DC6B04C()
{
  unint64_t result;

  result = qword_256CF5210;
  if (!qword_256CF5210)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC741E4, &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF5210);
  }
  return result;
}

unint64_t sub_23DC6B090()
{
  unint64_t result;

  result = qword_256CF5238;
  if (!qword_256CF5238)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC74194, &type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF5238);
  }
  return result;
}

unint64_t sub_23DC6B0D4()
{
  unint64_t result;

  result = qword_256CF5248;
  if (!qword_256CF5248)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC74144, &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF5248);
  }
  return result;
}

unint64_t sub_23DC6B118()
{
  unint64_t result;

  result = qword_256CF5258;
  if (!qword_256CF5258)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC740F4, &type metadata for SleepingSampleHelpTileVariant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF5258);
  }
  return result;
}

uint64_t sub_23DC6B15C(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DC4A608(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a2, a1, v6);
  return a2;
}

uint64_t sub_23DC6B1A8(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_23DC4A608(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23DC6B20C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23DC6B230()
{
  uint64_t v0;

  sub_23DC683A4(v0);
}

id sub_23DC6B238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  id result;
  void *v16;
  void *v17;
  void *v18;
  _BYTE v19[16];

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  sub_23DC4A608(0, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = &v19[-v6];
  v8 = sub_23DC70164();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  sub_23DC70158();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return (id)sub_23DC55024((uint64_t)v7, &qword_256CF49F8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v12, v7, v8);
  result = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v16 = result;
    v17 = (void *)sub_23DC70140();
    sub_23DC608EC(MEMORY[0x24BEE4AF8]);
    v18 = (void *)sub_23DC70EA8();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_openSensitiveURL_withOptions_, v17, v18);

    return (id)(*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SleepingSampleHelpTileVariant.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SleepingSampleHelpTileVariant.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DC6B5B4 + 4 * byte_23DC73BC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DC6B5E8 + 4 * asc_23DC73BC0[v4]))();
}

uint64_t sub_23DC6B5E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC6B5F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DC6B5F8);
  return result;
}

uint64_t sub_23DC6B604(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DC6B60CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DC6B610(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC6B618(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23DC6B624(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.CodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.CodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys;
}

uint64_t _s22HealthBalanceAppPlugin29SleepingSampleHelpTileVariantO30EstablishingBaselineCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DC6B6A4 + 4 * byte_23DC73BCA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DC6B6C4 + 4 * byte_23DC73BCF[v4]))();
}

_BYTE *sub_23DC6B6A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DC6B6C4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC6B6CC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC6B6D4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DC6B6DC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DC6B6E4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileConfiguration.CodingKeys()
{
  return &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys;
}

unint64_t sub_23DC6B704()
{
  unint64_t result;

  result = qword_256CF5298;
  if (!qword_256CF5298)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73F0C, &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF5298);
  }
  return result;
}

unint64_t sub_23DC6B74C()
{
  unint64_t result;

  result = qword_256CF52A0;
  if (!qword_256CF52A0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC74014, &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52A0);
  }
  return result;
}

unint64_t sub_23DC6B794()
{
  unint64_t result;

  result = qword_256CF52A8;
  if (!qword_256CF52A8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC740CC, &type metadata for SleepingSampleHelpTileVariant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52A8);
  }
  return result;
}

unint64_t sub_23DC6B7DC()
{
  unint64_t result;

  result = qword_256CF52B0;
  if (!qword_256CF52B0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC7403C, &type metadata for SleepingSampleHelpTileVariant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52B0);
  }
  return result;
}

unint64_t sub_23DC6B824()
{
  unint64_t result;

  result = qword_256CF52B8;
  if (!qword_256CF52B8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC74064, &type metadata for SleepingSampleHelpTileVariant.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52B8);
  }
  return result;
}

unint64_t sub_23DC6B86C()
{
  unint64_t result;

  result = qword_256CF52C0;
  if (!qword_256CF52C0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73F84, &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52C0);
  }
  return result;
}

unint64_t sub_23DC6B8B4()
{
  unint64_t result;

  result = qword_256CF52C8;
  if (!qword_256CF52C8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73FAC, &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52C8);
  }
  return result;
}

unint64_t sub_23DC6B8FC()
{
  unint64_t result;

  result = qword_256CF52D0;
  if (!qword_256CF52D0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73F34, &type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52D0);
  }
  return result;
}

unint64_t sub_23DC6B944()
{
  unint64_t result;

  result = qword_256CF52D8;
  if (!qword_256CF52D8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73F5C, &type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52D8);
  }
  return result;
}

unint64_t sub_23DC6B98C()
{
  unint64_t result;

  result = qword_256CF52E0;
  if (!qword_256CF52E0)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73E7C, &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52E0);
  }
  return result;
}

unint64_t sub_23DC6B9D4()
{
  unint64_t result;

  result = qword_256CF52E8;
  if (!qword_256CF52E8)
  {
    result = MEMORY[0x24263FCFC](&unk_23DC73EA4, &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CF52E8);
  }
  return result;
}

uint64_t sub_23DC6BA18(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000014 && a2 == 0x800000023DC75DD0 || (sub_23DC71394() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023DC75DF0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23DC71394();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23DC6BB00(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x746E6169726176 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23DC71394();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23DC6BB84()
{
  return 0x746E6169726176;
}

id BalanceOnboardingNavigationController.__allocating_init(healthStore:presentationContext:)(uint64_t a1, char *a2)
{
  objc_class *v2;
  _BYTE *v5;
  char v6;
  objc_super v8;

  v5 = objc_allocWithZone(v2);
  v6 = *a2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = a1;
  v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v6;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

Swift::Void __swiftcall BalanceOnboardingNavigationController.prepareForPresentation()()
{
  void *v0;

  sub_23DC6BC58();
  sub_23DC6D7DC();
  swift_release();
  objc_msgSend(v0, sel_setModalPresentationStyle_, 2);
}

uint64_t sub_23DC6BC58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator);
  }
  else
  {
    v2 = sub_23DC6BCBC(v0);
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_23DC6BCBC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v24;
  ValueMetadata *v25;
  char **v26;
  _QWORD v27[5];

  v2 = sub_23DC703F8();
  v3 = *(void **)(a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore);
  sub_23DC44CF0(0, (unint64_t *)&qword_256CF5108);
  v4 = v3;
  sub_23DC71100();
  v5 = sub_23DC703EC();
  v27[3] = v2;
  v27[4] = sub_23DC6C334();
  v27[0] = v5;
  v25 = &type metadata for BalanceOnboardingManager;
  v26 = &off_250E90688;
  v6 = swift_allocObject();
  *(_QWORD *)&v24 = v6;
  *(_QWORD *)(v6 + 56) = v4;
  sub_23DC45304((uint64_t)v27, v6 + 16);
  v7 = v4;
  sub_23DC7041C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  sub_23DC66B64(&v24, (uint64_t)v27);
  sub_23DC44CF0(0, &qword_256CF5338);
  v8 = (void *)sub_23DC7116C();
  v9 = objc_allocWithZone(MEMORY[0x24BDD3918]);
  v10 = objc_msgSend(v9, sel_initWithLoggingCategory_healthDataSource_, v8, v7, (_QWORD)v24);

  v11 = objc_allocWithZone(MEMORY[0x24BEA9950]);
  v12 = v7;
  v13 = (void *)sub_23DC70F38();
  v14 = objc_msgSend(v11, sel_initWithIdentifier_healthStore_, v13, v12);

  v15 = *(_BYTE *)(a1
                 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext);
  v25 = &type metadata for BalanceOnboardingModel;
  v26 = (char **)&off_250E8FEE8;
  *(_QWORD *)&v24 = swift_allocObject();
  sub_23DC6C3CC((uint64_t)v27, v24 + 16);
  type metadata accessor for BalanceOnboardingCoordinator();
  v16 = swift_allocObject();
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v24, (uint64_t)&type metadata for BalanceOnboardingModel);
  MEMORY[0x24BDAC7A8](v17, v17);
  v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  *(_QWORD *)(v16 + 40) = &type metadata for BalanceOnboardingModel;
  *(_QWORD *)(v16 + 48) = &off_250E8FEE8;
  v21 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v21;
  v22 = *((_OWORD *)v19 + 1);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v19;
  *(_OWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 48) = *((_QWORD *)v19 + 4);
  *(_QWORD *)(v16 + 56) = v10;
  *(_QWORD *)(v16 + 64) = v12;
  *(_QWORD *)(v16 + 72) = v14;
  *(_BYTE *)(v16 + 80) = v15;
  swift_unknownObjectUnownedInit();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v24);
  sub_23DC6C408((uint64_t)v27);
  return v16;
}

id BalanceOnboardingNavigationController.init(healthStore:presentationContext:)(uint64_t a1, char *a2)
{
  _BYTE *v2;
  objc_class *ObjectType;
  char v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *a2;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = a1;
  v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v6;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

id BalanceOnboardingNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;

  v3 = a2;
  if (!a1)
  {
    ObjCClassFromMetadata = 0;
    if (!a2)
      return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
    goto LABEL_3;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (v3)
LABEL_3:
    v3 = swift_getObjCClassFromMetadata();
  return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void BalanceOnboardingNavigationController.init(navigationBarClass:toolbarClass:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BalanceOnboardingNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void BalanceOnboardingNavigationController.init(rootViewController:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BalanceOnboardingNavigationController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void BalanceOnboardingNavigationController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BalanceOnboardingNavigationController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingNavigationController()
{
  return objc_opt_self();
}

uint64_t method lookup function for BalanceOnboardingNavigationController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BalanceOnboardingNavigationController.__allocating_init(healthStore:presentationContext:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

unint64_t sub_23DC6C334()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF5330;
  if (!qword_256CF5330)
  {
    v1 = sub_23DC703F8();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BE40590], v1);
    atomic_store(result, (unint64_t *)&qword_256CF5330);
  }
  return result;
}

uint64_t sub_23DC6C37C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return swift_deallocObject();
}

uint64_t sub_23DC6C3A8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23DC6C3CC(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for BalanceOnboardingModel(a2, a1);
  return a2;
}

uint64_t sub_23DC6C408(uint64_t a1)
{
  destroy for BalanceOnboardingModel();
  return a1;
}

uint64_t sub_23DC6C43C@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t result;
  char v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v42 = sub_23DC70D04();
  v4 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42, v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DC7020C();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (char *)&v35 - v16;
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v35 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v21((char *)&v35 - v19, (uint64_t)a1, v8);
  v22 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v20, v8);
  if (v22 == *MEMORY[0x24BE3FAD8])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(a1, v8);
    v24 = 2;
  }
  else if (v22 == *MEMORY[0x24BE3FAE0])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(a1, v8);
    v24 = 7;
  }
  else
  {
    v40 = v4;
    sub_23DC70CE0();
    v21(v17, (uint64_t)a1, v8);
    v25 = sub_23DC70CF8();
    v26 = sub_23DC7107C();
    v41 = v25;
    v39 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v38 = a2;
      v28 = v27;
      v37 = swift_slowAlloc();
      v44 = v37;
      *(_DWORD *)v28 = 136446466;
      v36 = v28 + 4;
      v43 = sub_23DC43878(0xD000000000000024, 0x800000023DC742E0, &v44);
      sub_23DC71184();
      *(_WORD *)(v28 + 12) = 2082;
      v36 = v28 + 14;
      v21(v13, (uint64_t)v17, v8);
      v29 = sub_23DC70F80();
      v43 = sub_23DC43878(v29, v30, &v44);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      v31 = *(void (**)(char *, uint64_t))(v9 + 8);
      v31(v17, v8);
      v32 = v41;
      _os_log_impl(&dword_23DC3D000, v41, (os_log_type_t)v39, "[%{public}s] unknown url source: %{public}s", (uint8_t *)v28, 0x16u);
      v33 = v37;
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v33, -1, -1);
      v34 = v28;
      a2 = v38;
      MEMORY[0x24263FD98](v34, -1, -1);

    }
    else
    {

      v31 = *(void (**)(char *, uint64_t))(v9 + 8);
      v31(v17, v8);
    }
    v31(a1, v8);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v42);
    result = ((uint64_t (*)(char *, uint64_t))v31)(v20, v8);
    v24 = 6;
  }
  *a2 = v24;
  return result;
}

void sub_23DC6C788()
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_23DC70D04();
  MEMORY[0x24BDAC7A8](v1, v2);
  __asm { BR              X11 }
}

id sub_23DC6C804()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;

  v0 = (id)*MEMORY[0x24BEA9480];
  v1 = (void *)*MEMORY[0x24BEA94C0];
  v2 = objc_allocWithZone(MEMORY[0x24BEA98D8]);
  v3 = v1;
  v4 = objc_msgSend(v2, sel_initWithSource_presentation_, v3, v0);

  return v4;
}

uint64_t sub_23DC6CA14@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  int v19;
  uint64_t result;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  uint8_t *v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  NSObject *v33;
  int v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DC708B4();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)v31 - v16;
  v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18((char *)v31 - v16, a1, v9);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v17, v9);
  if (v19 == *MEMORY[0x24BE425F0])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(a1, v9);
    v21 = 5;
  }
  else if (v19 == *MEMORY[0x24BE42650])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(a1, v9);
    v21 = 4;
  }
  else if (v19 == *MEMORY[0x24BE42668])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(a1, v9);
    v21 = 1;
  }
  else if (v19 == *MEMORY[0x24BE42648])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(a1, v9);
    v21 = 0;
  }
  else if (v19 == *MEMORY[0x24BE42600])
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(a1, v9);
    v21 = 3;
  }
  else
  {
    sub_23DC70CE0();
    v18(v14, a1, v9);
    v22 = sub_23DC70CF8();
    v23 = sub_23DC7107C();
    v34 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v37 = v32;
      v24 = v35;
      *(_DWORD *)v35 = 136446466;
      v33 = v22;
      v31[0] = v24 + 4;
      v25 = v24;
      v36 = sub_23DC43878(0xD000000000000024, 0x800000023DC742E0, &v37);
      v31[1] = &v37;
      sub_23DC71184();
      *((_WORD *)v25 + 6) = 2082;
      v31[0] = v25 + 14;
      sub_23DC6CFE0();
      v26 = sub_23DC7137C();
      v36 = sub_23DC43878(v26, v27, &v37);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v14, v9);
      v29 = v35;
      _os_log_impl(&dword_23DC3D000, v33, (os_log_type_t)v34, "[%{public}s] unknown presentation context: %{public}s", v35, 0x16u);
      v30 = v32;
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v30, -1, -1);
      MEMORY[0x24263FD98](v29, -1, -1);

    }
    else
    {

      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v14, v9);
    }
    v28(a1, v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v28)(v17, v9);
    v21 = 6;
  }
  *a2 = v21;
  return result;
}

BOOL static BalanceOnboardingPresentationContext.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BalanceOnboardingPresentationContext.hash(into:)()
{
  return sub_23DC713D0();
}

uint64_t BalanceOnboardingPresentationContext.hashValue.getter()
{
  sub_23DC713C4();
  sub_23DC713D0();
  return sub_23DC713DC();
}

unint64_t sub_23DC6CE40()
{
  unint64_t result;

  result = qword_256CF5340;
  if (!qword_256CF5340)
  {
    result = MEMORY[0x24263FCFC](&protocol conformance descriptor for BalanceOnboardingPresentationContext, &type metadata for BalanceOnboardingPresentationContext);
    atomic_store(result, (unint64_t *)&qword_256CF5340);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingPresentationContext(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BalanceOnboardingPresentationContext(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23DC6CF60 + 4 * byte_23DC7428D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23DC6CF94 + 4 * byte_23DC74288[v4]))();
}

uint64_t sub_23DC6CF94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC6CF9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DC6CFA4);
  return result;
}

uint64_t sub_23DC6CFB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DC6CFB8);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23DC6CFBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DC6CFC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingPresentationContext()
{
  return &type metadata for BalanceOnboardingPresentationContext;
}

unint64_t sub_23DC6CFE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CF4B10;
  if (!qword_256CF4B10)
  {
    v1 = sub_23DC708B4();
    result = MEMORY[0x24263FCFC](MEMORY[0x24BE42690], v1);
    atomic_store(result, (unint64_t *)&qword_256CF4B10);
  }
  return result;
}

uint64_t sub_23DC6D028(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v5 = sub_23DC70D04();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    v10 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass())
      v10 = 1;
    else
      v10 = 2;
  }
  sub_23DC70CE0();
  v11 = sub_23DC70CF8();
  v12 = sub_23DC71088();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v22 = v5;
    v14 = v13;
    v15 = swift_slowAlloc();
    v25 = v15;
    *(_DWORD *)v14 = 136446466;
    v23 = a2;
    v16 = sub_23DC71430();
    v24 = sub_23DC43878(v16, v17, &v25);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    LOBYTE(v24) = v10;
    v18 = sub_23DC70F80();
    v24 = sub_23DC43878(v18, v19, &v25);
    a2 = v23;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v11, v12, "[%{public}s] primary button tapped from stage %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v15, -1, -1);
    MEMORY[0x24263FD98](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  sub_23DC6DBF8(a2, v10);
  v20 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
  if (v10 == 1
    && (__swift_project_boxed_opaque_existential_1(v20, v20[3]), (sub_23DC5ACFC() & 1) == 0))
  {
    sub_23DC6E74C();
    return 0;
  }
  else
  {
    sub_23DC6E0E4(v10);
    return 1;
  }
}

void sub_23DC6D2C0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v26 = (_QWORD *)*v0;
  v2 = sub_23DC70254();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DC70D04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    v12 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass())
      v12 = 1;
    else
      v12 = 2;
  }
  sub_23DC70CE0();
  v13 = sub_23DC70CF8();
  v14 = sub_23DC71088();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v24 = v8;
    v16 = v15;
    v17 = swift_slowAlloc();
    v23 = v7;
    v18 = v17;
    v28 = v17;
    *(_DWORD *)v16 = 136446466;
    v25 = v2;
    v19 = sub_23DC71430();
    v26 = v1;
    v27 = sub_23DC43878(v19, v20, &v28);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    LOBYTE(v27) = v12;
    v21 = sub_23DC70F80();
    v27 = sub_23DC43878(v21, v22, &v28);
    sub_23DC71184();
    v2 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v13, v14, "[%{public}s] cancel button tapped from stage %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v18, -1, -1);
    MEMORY[0x24263FD98](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE3FB58], v2);
  sub_23DC6DBF8(v6, v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_23DC6EC90();
}

void sub_23DC6D588(uint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = sub_23DC70D04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    v8 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass())
      v8 = 1;
    else
      v8 = 2;
  }
  sub_23DC70CE0();
  v9 = sub_23DC70CF8();
  v10 = sub_23DC71088();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v18 = v3;
    v12 = v11;
    v13 = swift_slowAlloc();
    v21 = v13;
    *(_DWORD *)v12 = 136446466;
    v19 = a2;
    v14 = sub_23DC71430();
    v20 = sub_23DC43878(v14, v15, &v21);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    LOBYTE(v20) = v8;
    v16 = sub_23DC70F80();
    v20 = sub_23DC43878(v16, v17, &v21);
    a2 = v19;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v9, v10, "[%{public}s] secondary button tapped from stage %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v13, -1, -1);
    MEMORY[0x24263FD98](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  sub_23DC6DBF8(a2, v8);
  sub_23DC6E0E4(v8);
}

void sub_23DC6D7DC()
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
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  id v32;
  char *v33;
  void *Strong;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD v42[3];
  ValueMetadata *v43;
  char **v44;
  uint64_t v45[5];

  v1 = v0;
  v2 = sub_23DC70254();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v41 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DC70D04();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v11 = sub_23DC70CF8();
  v12 = sub_23DC71088();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v39 = v7;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v40 = v3;
    v16 = v15;
    v45[0] = v15;
    v38 = v6;
    *(_DWORD *)v14 = 136446210;
    v17 = sub_23DC71430();
    v42[0] = sub_23DC43878(v17, v18, v45);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v11, v12, "[%{public}s] setting up navigation controller", v14, 0xCu);
    swift_arrayDestroy();
    v19 = v16;
    v3 = v40;
    MEMORY[0x24263FD98](v19, -1, -1);
    MEMORY[0x24263FD98](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v20 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  sub_23DC45304((uint64_t)v20, (uint64_t)v45);
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, v45[3]);
  MEMORY[0x24BDAC7A8](v21, v21);
  v23 = (_OWORD *)((char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v24 + 16))(v23);
  v43 = &type metadata for BalanceOnboardingManager;
  v44 = &off_250E90688;
  v25 = (_OWORD *)swift_allocObject();
  v42[0] = v25;
  v26 = v23[1];
  v25[1] = *v23;
  v25[2] = v26;
  v25[3] = v23[2];
  v27 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingIntroViewController());
  v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, (uint64_t)v43);
  MEMORY[0x24BDAC7A8](v28, v28);
  v30 = (_OWORD *)((char *)&v38 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v31 + 16))(v30);
  v32 = sub_23DC4539C(v30, v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  v33 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v41, *MEMORY[0x24BE3FB68], v2);
  sub_23DC6DBF8(v33, 0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v33, v2);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  sub_23DC44FD0(0, (unint64_t *)&qword_254322ED8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_23DC72560;
  *(_QWORD *)(v35 + 32) = v32;
  v45[0] = v35;
  sub_23DC70FEC();
  sub_23DC6FE0C();
  v36 = v32;
  v37 = (void *)sub_23DC70FD4();
  swift_bridgeObjectRelease();
  objc_msgSend(Strong, sel_setViewControllers_animated_, v37, 0);

}

uint64_t sub_23DC6DBF8(char *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v17;
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
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  _QWORD *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  uint64_t aBlock[7];

  v3 = v2;
  v60 = a2;
  v5 = *v2;
  v6 = sub_23DC70248();
  v63 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DC7023C();
  v57 = *(_QWORD *)(v10 - 8);
  v58 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v62 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DC70254();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v59 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16, v18);
  v21 = (char *)&v49 - v20;
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)&v49 - v23;
  v25 = sub_23DC70D04();
  v55 = *(_QWORD *)(v25 - 8);
  v56 = v25;
  MEMORY[0x24BDAC7A8](v25, v26);
  v28 = (char *)&v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v29 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v61 = a1;
  v64 = v29;
  v29(v24, a1, v13);
  v30 = sub_23DC70CF8();
  v31 = sub_23DC71088();
  v54 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v50 = v6;
    v33 = v32;
    v49 = swift_slowAlloc();
    aBlock[0] = v49;
    *(_DWORD *)v33 = 136446722;
    v52 = v3;
    v34 = sub_23DC71430();
    v51 = v9;
    v65 = sub_23DC43878(v34, v35, aBlock);
    v53 = v5;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    v64(v21, v24, v13);
    v36 = sub_23DC70F80();
    v65 = sub_23DC43878(v36, v37, aBlock);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v13);
    *(_WORD *)(v33 + 22) = 2082;
    v9 = v51;
    v38 = v60;
    LOBYTE(v65) = v60;
    v39 = sub_23DC70F80();
    v65 = sub_23DC43878(v39, v40, aBlock);
    v5 = v53;
    sub_23DC71184();
    v3 = v52;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v30, (os_log_type_t)v54, "[%{public}s] submitting action %{public}s for stage %{public}s", (uint8_t *)v33, 0x20u);
    v41 = v49;
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v41, -1, -1);
    v42 = v33;
    v6 = v50;
    MEMORY[0x24263FD98](v42, -1, -1);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v28, v56);
    v43 = v38;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v13);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v28, v56);
    v43 = v60;
  }
  v64(v59, v61, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v62, **((unsigned int **)&unk_250E91210 + *((char *)v3 + 80)), v58);
  (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v9, **((unsigned int **)&unk_250E91250 + v43), v6);
  sub_23DC7026C();
  swift_allocObject();
  v44 = sub_23DC70260();
  v45 = (void *)v3[7];
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = v5;
  aBlock[4] = (uint64_t)sub_23DC6FD28;
  aBlock[5] = v46;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23DC6F9B0;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  v47 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v45, sel_submitEvent_completion_, v44, v47);
  _Block_release(v47);
  return swift_release_n();
}

void sub_23DC6E0E4(char a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *Strong;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  id v61;
  id v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70[2];
  char v71;
  uint64_t v72;

  v2 = v1;
  v68 = *v2;
  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v13 = (char *)&v64 - v12;
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v64 - v15;
  v17 = sub_23DC70254();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v2[5];
  v69 = v2 + 2;
  v23 = __swift_project_boxed_opaque_existential_1(v2 + 2, v22);
  v67 = v13;
  if (a1)
  {
    if (a1 != 1 || (__swift_project_boxed_opaque_existential_1(v23, v23[3]), (sub_23DC5AD08() & 1) != 0))
    {
      LODWORD(v24) = 3;
      goto LABEL_8;
    }
    v24 = 2;
  }
  else
  {
    v24 = 1;
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v21, *MEMORY[0x24BE3FB68], v17);
  sub_23DC6DBF8(v21, v24);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
LABEL_8:
  sub_23DC70CE0();
  v25 = sub_23DC70CF8();
  v26 = sub_23DC71088();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v65 = v5;
    v28 = v27;
    v29 = swift_slowAlloc();
    v70[0] = v29;
    *(_DWORD *)v28 = 136446466;
    v30 = sub_23DC71430();
    v66 = v9;
    v72 = sub_23DC43878(v30, v31, v70);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    LOBYTE(v72) = v24;
    sub_23DC44FD0(0, &qword_256CF5410, (uint64_t)&type metadata for BalanceOnboardingStage, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v32 = sub_23DC70F80();
    v72 = sub_23DC43878(v32, v33, v70);
    sub_23DC71184();
    v9 = v66;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v25, v26, "[%{public}s] navigating to next stage: %{public}s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v29, -1, -1);
    MEMORY[0x24263FD98](v28, -1, -1);

    v34 = *(void (**)(char *, uint64_t))(v65 + 8);
  }
  else
  {

    v34 = *(void (**)(char *, uint64_t))(v5 + 8);
  }
  v34(v16, v4);
  if ((_DWORD)v24 == 1)
  {
    __swift_project_boxed_opaque_existential_1(v69, v2[5]);
    v44 = sub_23DC45170(1u);
    if (v44)
    {
      v45 = v44;
      Strong = (void *)swift_unknownObjectUnownedLoadStrong();
      objc_msgSend(Strong, sel_pushViewController_animated_, v45, 1);

    }
  }
  else if ((_DWORD)v24 == 2)
  {
    v35 = v67;
    sub_23DC70CE0();
    v36 = sub_23DC70CF8();
    v37 = sub_23DC71088();
    if (os_log_type_enabled(v36, v37))
    {
      v66 = (char *)v4;
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v70[0] = v39;
      *(_DWORD *)v38 = 136446210;
      v40 = sub_23DC71430();
      v72 = sub_23DC43878(v40, v41, v70);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v36, v37, "[%{public}s] vitals onboarding complete, favoriting balance type and pushing sleep onboarding", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v39, -1, -1);
      MEMORY[0x24263FD98](v38, -1, -1);

      v42 = v35;
      v43 = (uint64_t)v66;
    }
    else
    {

      v42 = v35;
      v43 = v4;
    }
    v34(v42, v43);
    v56 = __swift_project_boxed_opaque_existential_1(v69, v2[5]);
    __swift_project_boxed_opaque_existential_1(v56, v56[3]);
    sub_23DC5B060();
    v58 = (void *)v2[8];
    v59 = *((_BYTE *)v2 + 80);
    v70[0] = v2[9];
    v57 = (void *)v70[0];
    v70[1] = (uint64_t)v58;
    v71 = v59;
    v60 = (void *)swift_unknownObjectUnownedLoadStrong();
    v61 = v57;
    v62 = v58;
    sub_23DC5139C(v60);

  }
  else
  {
    sub_23DC70CE0();
    v47 = sub_23DC70CF8();
    v48 = sub_23DC71088();
    if (os_log_type_enabled(v47, v48))
    {
      v66 = v9;
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = v4;
      v51 = swift_slowAlloc();
      v70[0] = v51;
      *(_DWORD *)v49 = 136446210;
      v52 = sub_23DC71430();
      v72 = sub_23DC43878(v52, v53, v70);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DC3D000, v47, v48, "[%{public}s] vitals onboarding complete, favoriting balance type", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v51, -1, -1);
      MEMORY[0x24263FD98](v49, -1, -1);

      v54 = v66;
      v55 = v50;
    }
    else
    {

      v54 = v9;
      v55 = v4;
    }
    v34(v54, v55);
    v63 = __swift_project_boxed_opaque_existential_1(v69, v2[5]);
    __swift_project_boxed_opaque_existential_1(v63, v63[3]);
    sub_23DC5B060();
    if (*((_BYTE *)v2 + 80) && *((_BYTE *)v2 + 80) != 3)
      sub_23DC6EF28();
    else
      sub_23DC6EC90();
  }
}

void sub_23DC6E74C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *Strong;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock[7];

  v0 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v0, v1);
  v2 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v2, v3);
  v4 = sub_23DC70D04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v9 = sub_23DC70CF8();
  v10 = sub_23DC71088();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136446466;
    v33 = v4;
    v13 = sub_23DC71430();
    v34 = sub_23DC43878(v13, v14, aBlock);
    v32 = v5;
    sub_23DC71184();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v15 = sub_23DC70F80();
    v34 = sub_23DC43878(v15, v16, aBlock);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v9, v10, "[%{public}s] presenting alert for reason: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v12, -1, -1);
    MEMORY[0x24263FD98](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v33);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  v33 = sub_23DC70F74();
  sub_23DC70ED8();
  v20 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v21 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v21, 1, 0);

  sub_23DC70ED8();
  v24 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();
  v25 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_23DC6EE9C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23DC6EE4C;
  aBlock[3] = (uint64_t)&block_descriptor_11;
  v26 = _Block_copy(aBlock);
  swift_release();
  v27 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v25, 0, v26);
  _Block_release(v26);

  v28 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  v29 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v28, 0, 1);

  objc_msgSend(v29, sel_addAction_, v23);
  objc_msgSend(v29, sel_addAction_, v27);

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  objc_msgSend(Strong, sel_presentViewController_animated_completion_, v29, 1, 0);

}

void sub_23DC6EC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *Strong;
  _QWORD v15[3];
  uint64_t v16;

  v1 = v0;
  v2 = sub_23DC70D04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v7 = sub_23DC70CF8();
  v8 = sub_23DC71088();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v15[1] = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_23DC71430();
    v15[2] = sub_23DC43878(v12, v13, &v16);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v7, v8, "[%{public}s] dismissing navigation controller", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263FD98](v11, -1, -1);
    MEMORY[0x24263FD98](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  objc_msgSend(Strong, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

void sub_23DC6EE4C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23DC6EE9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v0 = sub_23DC7071C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE411F0], v0);
  sub_23DC70710();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_23DC6EF28()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v1 = v0;
  sub_23DC4A608(0, &qword_256CF4A68, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v51 - v4;
  v6 = sub_23DC7020C();
  v61 = *(_QWORD *)(v6 - 8);
  v62 = v6;
  MEMORY[0x24BDAC7A8](v6, v7);
  v59 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC4A608(0, (unint64_t *)&unk_256CF4F20, (void (*)(uint64_t))MEMORY[0x24BE3FAA0]);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v51 - v11;
  v13 = sub_23DC70230();
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  MEMORY[0x24BDAC7A8](v13, v14);
  v56 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_23DC70164();
  v64 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60, v16);
  v63 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23DC70D04();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC70CE0();
  v23 = sub_23DC70CF8();
  v24 = sub_23DC71088();
  if (os_log_type_enabled(v23, v24))
  {
    v53 = v18;
    v25 = swift_slowAlloc();
    v54 = v5;
    v26 = (uint8_t *)v25;
    v27 = swift_slowAlloc();
    v55 = v1;
    v28 = v27;
    v66 = v27;
    *(_DWORD *)v26 = 136446210;
    v52 = v19;
    v29 = sub_23DC71430();
    v65 = sub_23DC43878(v29, v30, &v66);
    sub_23DC71184();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DC3D000, v23, v24, "[%{public}s] navigating to balance room", v26, 0xCu);
    swift_arrayDestroy();
    v31 = v28;
    v1 = v55;
    MEMORY[0x24263FD98](v31, -1, -1);
    v32 = v26;
    v5 = v54;
    MEMORY[0x24263FD98](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v22, v53);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  }
  v33 = v56;
  sub_23DC70224();
  v34 = *MEMORY[0x24BE3FA80];
  v35 = sub_23DC701E8();
  v36 = (void (*)(uint64_t))MEMORY[0x24BE3FAA0];
  v37 = *(_QWORD *)(v35 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 104))(v12, v34, v35);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v12, 0, 1, v35);
  v39 = v61;
  v38 = v62;
  v40 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v59, *MEMORY[0x24BE3FAE8], v62);
  v41 = v63;
  sub_23DC701DC();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v38);
  sub_23DC55024((uint64_t)v12, (unint64_t *)&unk_256CF4F20, v36);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v33, v58);
  v42 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v42)
  {
    v43 = v42;
    v44 = (void *)sub_23DC70140();
    sub_23DC608EC(MEMORY[0x24BEE4AF8]);
    v45 = (void *)sub_23DC70EA8();
    swift_bridgeObjectRelease();
    objc_msgSend(v43, sel_openSensitiveURL_withOptions_, v44, v45);

  }
  v46 = sub_23DC71058();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v5, 1, 1, v46);
  sub_23DC71040();
  swift_retain();
  v47 = sub_23DC71034();
  v48 = (_QWORD *)swift_allocObject();
  v49 = MEMORY[0x24BEE6930];
  v48[2] = v47;
  v48[3] = v49;
  v48[4] = v1;
  sub_23DC6F63C((uint64_t)v5, (uint64_t)&unk_256CF5420, (uint64_t)v48);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v41, v60);
}

uint64_t sub_23DC6F40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a4;
  v5 = sub_23DC712BC();
  v4[3] = v5;
  v4[4] = *(_QWORD *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_23DC71040();
  v4[6] = sub_23DC71034();
  v4[7] = sub_23DC71028();
  v4[8] = v6;
  return swift_task_switch();
}

uint64_t sub_23DC6F4A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_23DC7140C();
  v3 = v2;
  sub_23DC712B0();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256CF5428 + dword_256CF5428);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_23DC6F534;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_23DC6F534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_23DC6F5BC()
{
  uint64_t v0;

  swift_release();
  sub_23DC6EC90();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23DC6F600()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23DC6F63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23DC71058();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23DC7104C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23DC55024(a1, &qword_256CF4A68, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23DC71028();
    sub_23DC70AE8();
  }
  return swift_task_create();
}

uint64_t sub_23DC6F778(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_23DC70D04();
  v4 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3, v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v9 = a2;
    sub_23DC70CE0();
    v10 = a2;
    v11 = a2;
    v12 = sub_23DC70CF8();
    v13 = sub_23DC71070();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v22 = v15;
      *(_DWORD *)v14 = 136446466;
      v16 = sub_23DC71430();
      v21 = sub_23DC43878(v16, v17, &v22);
      sub_23DC71184();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2082;
      v21 = (uint64_t)a2;
      v18 = a2;
      sub_23DC58D2C();
      v19 = sub_23DC70F80();
      v21 = sub_23DC43878(v19, v20, &v22);
      sub_23DC71184();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DC3D000, v12, v13, "[%{public}s] error submitting: %{public}s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263FD98](v15, -1, -1);
      MEMORY[0x24263FD98](v14, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  }
  return result;
}

void sub_23DC6F9B0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_23DC6FA10()
{
  id *v0;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));

  swift_unknownObjectUnownedDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BalanceOnboardingCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_23DC6FA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_23DC712A4();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_23DC6FB18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_23DC712BC();
  sub_23DC44574(&qword_256CF5430, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_23DC713AC();
  sub_23DC44574(&qword_256CF5438, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23DC712C8();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23DC6FC30;
  return sub_23DC713B8();
}

uint64_t sub_23DC6FC30()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_23DC6FCDC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23DC6FD18()
{
  return swift_deallocObject();
}

uint64_t sub_23DC6FD28(uint64_t a1, void *a2)
{
  return sub_23DC6F778(a1, a2);
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

uint64_t sub_23DC6FD48()
{
  sub_23DC70AE8();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DC6FD74(uint64_t a1)
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
  v7[1] = sub_23DC4D754;
  return sub_23DC6F40C(a1, v4, v5, v6);
}

uint64_t sub_23DC6FDE0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return swift_deallocObject();
}

unint64_t sub_23DC6FE0C()
{
  unint64_t result;

  result = qword_256CF4AD0;
  if (!qword_256CF4AD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CF4AD0);
  }
  return result;
}

uint64_t sub_23DC6FE50()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthBalanceAppPlugin()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_23DC6FEA0()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256CF5440 = (uint64_t)result;
  return result;
}

uint64_t sub_23DC6FEF4(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF5530);
}

uint64_t sub_23DC6FF10(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF5548);
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

uint64_t sub_23DC6FF6C(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF5560);
}

uint64_t sub_23DC6FF88(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF5578);
}

uint64_t sub_23DC6FFA4(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF5590);
}

uint64_t sub_23DC6FFC0(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF55A8);
}

uint64_t sub_23DC6FFDC(uint64_t a1)
{
  return sub_23DC6FFF8(a1, qword_256CF55C0);
}

uint64_t sub_23DC6FFF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_23DC70CBC();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_256CF4710 != -1)
    swift_once();
  v4 = (id)qword_256CF5440;
  return sub_23DC70CB0();
}

uint64_t sub_23DC70098()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23DC700A4()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23DC700B0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23DC700BC()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_23DC700C8()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_23DC700D4()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23DC700E0()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23DC700EC()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23DC700F8()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23DC70104()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23DC70110()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23DC7011C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23DC70128()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23DC70134()
{
  return MEMORY[0x24BE40F08]();
}

uint64_t sub_23DC70140()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23DC7014C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23DC70158()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23DC70164()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DC70170()
{
  return MEMORY[0x24BE40F10]();
}

uint64_t sub_23DC7017C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23DC70188()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DC70194()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23DC701A0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23DC701AC()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23DC701B8()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23DC701C4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23DC701D0()
{
  return MEMORY[0x24BE3FA70]();
}

uint64_t sub_23DC701DC()
{
  return MEMORY[0x24BE3FA78]();
}

uint64_t sub_23DC701E8()
{
  return MEMORY[0x24BE3FAA0]();
}

uint64_t sub_23DC701F4()
{
  return MEMORY[0x24BE3FAB0]();
}

uint64_t sub_23DC70200()
{
  return MEMORY[0x24BE3FAB8]();
}

uint64_t sub_23DC7020C()
{
  return MEMORY[0x24BE3FAF0]();
}

uint64_t sub_23DC70218()
{
  return MEMORY[0x24BE3FB00]();
}

uint64_t sub_23DC70224()
{
  return MEMORY[0x24BE3FB08]();
}

uint64_t sub_23DC70230()
{
  return MEMORY[0x24BE3FB10]();
}

uint64_t sub_23DC7023C()
{
  return MEMORY[0x24BE3FB38]();
}

uint64_t sub_23DC70248()
{
  return MEMORY[0x24BE3FB40]();
}

uint64_t sub_23DC70254()
{
  return MEMORY[0x24BE3FB70]();
}

uint64_t sub_23DC70260()
{
  return MEMORY[0x24BE3FB78]();
}

uint64_t sub_23DC7026C()
{
  return MEMORY[0x24BE3FB80]();
}

uint64_t sub_23DC70278()
{
  return MEMORY[0x24BE3FBC0]();
}

uint64_t sub_23DC70284()
{
  return MEMORY[0x24BE3FBD0]();
}

uint64_t sub_23DC70290()
{
  return MEMORY[0x24BE3FBE8]();
}

uint64_t sub_23DC7029C()
{
  return MEMORY[0x24BE3FBF8]();
}

uint64_t sub_23DC702A8()
{
  return MEMORY[0x24BE3FC00]();
}

uint64_t sub_23DC702B4()
{
  return MEMORY[0x24BE3FC08]();
}

uint64_t sub_23DC702C0()
{
  return MEMORY[0x24BE3FC10]();
}

uint64_t sub_23DC702CC()
{
  return MEMORY[0x24BE3FC38]();
}

uint64_t sub_23DC702D8()
{
  return MEMORY[0x24BE3FCB8]();
}

uint64_t sub_23DC702E4()
{
  return MEMORY[0x24BE3FCC0]();
}

uint64_t sub_23DC702F0()
{
  return MEMORY[0x24BE3FCD0]();
}

uint64_t sub_23DC702FC()
{
  return MEMORY[0x24BE3FCD8]();
}

uint64_t sub_23DC70308()
{
  return MEMORY[0x24BE3FCF0]();
}

uint64_t sub_23DC70314()
{
  return MEMORY[0x24BE3FF60]();
}

uint64_t sub_23DC70320()
{
  return MEMORY[0x24BE3FF80]();
}

uint64_t sub_23DC7032C()
{
  return MEMORY[0x24BE3FF88]();
}

uint64_t sub_23DC70338()
{
  return MEMORY[0x24BE3FF90]();
}

uint64_t sub_23DC70344()
{
  return MEMORY[0x24BE3FFB0]();
}

uint64_t sub_23DC70350()
{
  return MEMORY[0x24BE40048]();
}

uint64_t sub_23DC7035C()
{
  return MEMORY[0x24BE40050]();
}

uint64_t sub_23DC70368()
{
  return MEMORY[0x24BE40058]();
}

uint64_t sub_23DC70374()
{
  return MEMORY[0x24BE40118]();
}

uint64_t sub_23DC70380()
{
  return MEMORY[0x24BE40120]();
}

uint64_t sub_23DC7038C()
{
  return MEMORY[0x24BE403B0]();
}

uint64_t sub_23DC70398()
{
  return MEMORY[0x24BE403B8]();
}

uint64_t sub_23DC703A4()
{
  return MEMORY[0x24BE403C0]();
}

uint64_t sub_23DC703B0()
{
  return MEMORY[0x24BE403D8]();
}

uint64_t sub_23DC703BC()
{
  return MEMORY[0x24BE40418]();
}

uint64_t sub_23DC703C8()
{
  return MEMORY[0x24BE40430]();
}

uint64_t sub_23DC703D4()
{
  return MEMORY[0x24BE40438]();
}

uint64_t sub_23DC703E0()
{
  return MEMORY[0x24BE40460]();
}

uint64_t sub_23DC703EC()
{
  return MEMORY[0x24BE40588]();
}

uint64_t sub_23DC703F8()
{
  return MEMORY[0x24BE40598]();
}

uint64_t sub_23DC70404()
{
  return MEMORY[0x24BE405A8]();
}

uint64_t sub_23DC70410()
{
  return MEMORY[0x24BE405D0]();
}

uint64_t sub_23DC7041C()
{
  return MEMORY[0x24BE40608]();
}

uint64_t sub_23DC70428()
{
  return MEMORY[0x24BE40610]();
}

uint64_t sub_23DC70434()
{
  return MEMORY[0x24BE40618]();
}

uint64_t sub_23DC70440()
{
  return MEMORY[0x24BE40620]();
}

uint64_t sub_23DC7044C()
{
  return MEMORY[0x24BE40658]();
}

uint64_t sub_23DC70458()
{
  return MEMORY[0x24BE40670]();
}

uint64_t sub_23DC70464()
{
  return MEMORY[0x24BE40678]();
}

uint64_t sub_23DC70470()
{
  return MEMORY[0x24BEA9BF0]();
}

uint64_t sub_23DC7047C()
{
  return MEMORY[0x24BEA9BF8]();
}

uint64_t sub_23DC70488()
{
  return MEMORY[0x24BEA9C00]();
}

uint64_t sub_23DC70494()
{
  return MEMORY[0x24BEA9D08]();
}

uint64_t sub_23DC704A0()
{
  return MEMORY[0x24BEA9D10]();
}

uint64_t sub_23DC704AC()
{
  return MEMORY[0x24BEA9D28]();
}

uint64_t sub_23DC704B8()
{
  return MEMORY[0x24BEA9D30]();
}

uint64_t sub_23DC704C4()
{
  return MEMORY[0x24BEA9D40]();
}

uint64_t sub_23DC704D0()
{
  return MEMORY[0x24BE47298]();
}

uint64_t sub_23DC704DC()
{
  return MEMORY[0x24BE474E8]();
}

uint64_t sub_23DC704E8()
{
  return MEMORY[0x24BE47588]();
}

uint64_t sub_23DC704F4()
{
  return MEMORY[0x24BE47598]();
}

uint64_t sub_23DC70500()
{
  return MEMORY[0x24BE475A0]();
}

uint64_t sub_23DC7050C()
{
  return MEMORY[0x24BE47678]();
}

uint64_t sub_23DC70518()
{
  return MEMORY[0x24BE47688]();
}

uint64_t sub_23DC70524()
{
  return MEMORY[0x24BE476A0]();
}

uint64_t sub_23DC70530()
{
  return MEMORY[0x24BE476C0]();
}

uint64_t sub_23DC7053C()
{
  return MEMORY[0x24BE47778]();
}

uint64_t sub_23DC70548()
{
  return MEMORY[0x24BE47798]();
}

uint64_t sub_23DC70554()
{
  return MEMORY[0x24BE477D0]();
}

uint64_t sub_23DC70560()
{
  return MEMORY[0x24BE47928]();
}

uint64_t sub_23DC7056C()
{
  return MEMORY[0x24BE47940]();
}

uint64_t sub_23DC70578()
{
  return MEMORY[0x24BE47950]();
}

uint64_t sub_23DC70584()
{
  return MEMORY[0x24BE47958]();
}

uint64_t sub_23DC70590()
{
  return MEMORY[0x24BE47978]();
}

uint64_t sub_23DC7059C()
{
  return MEMORY[0x24BE47980]();
}

uint64_t sub_23DC705A8()
{
  return MEMORY[0x24BE47988]();
}

uint64_t sub_23DC705B4()
{
  return MEMORY[0x24BE47998]();
}

uint64_t sub_23DC705C0()
{
  return MEMORY[0x24BE479B8]();
}

uint64_t sub_23DC705CC()
{
  return MEMORY[0x24BE47A70]();
}

uint64_t sub_23DC705D8()
{
  return MEMORY[0x24BE47BD0]();
}

uint64_t sub_23DC705E4()
{
  return MEMORY[0x24BE47D80]();
}

uint64_t sub_23DC705F0()
{
  return MEMORY[0x24BE47D90]();
}

uint64_t sub_23DC705FC()
{
  return MEMORY[0x24BE47FD0]();
}

uint64_t sub_23DC70608()
{
  return MEMORY[0x24BE481D8]();
}

uint64_t sub_23DC70614()
{
  return MEMORY[0x24BE48378]();
}

uint64_t sub_23DC70620()
{
  return MEMORY[0x24BE48390]();
}

uint64_t sub_23DC7062C()
{
  return MEMORY[0x24BE48398]();
}

uint64_t sub_23DC70638()
{
  return MEMORY[0x24BE483B8]();
}

uint64_t sub_23DC70644()
{
  return MEMORY[0x24BE40738]();
}

uint64_t sub_23DC70650()
{
  return MEMORY[0x24BE40740]();
}

uint64_t sub_23DC7065C()
{
  return MEMORY[0x24BE40750]();
}

uint64_t sub_23DC70668()
{
  return MEMORY[0x24BE40758]();
}

uint64_t sub_23DC70674()
{
  return MEMORY[0x24BE40760]();
}

uint64_t sub_23DC70680()
{
  return MEMORY[0x24BE40770]();
}

uint64_t sub_23DC7068C()
{
  return MEMORY[0x24BE40778]();
}

uint64_t sub_23DC70698()
{
  return MEMORY[0x24BE40790]();
}

uint64_t sub_23DC706A4()
{
  return MEMORY[0x24BE40798]();
}

uint64_t sub_23DC706B0()
{
  return MEMORY[0x24BE407A0]();
}

uint64_t sub_23DC706BC()
{
  return MEMORY[0x24BE3F938]();
}

uint64_t sub_23DC706C8()
{
  return MEMORY[0x24BE3F9B0]();
}

uint64_t sub_23DC706D4()
{
  return MEMORY[0x24BE3F9B8]();
}

uint64_t sub_23DC706E0()
{
  return MEMORY[0x24BE3F9C0]();
}

uint64_t sub_23DC706EC()
{
  return MEMORY[0x24BE3F9D8]();
}

uint64_t sub_23DC706F8()
{
  return MEMORY[0x24BE3F9E0]();
}

uint64_t sub_23DC70704()
{
  return MEMORY[0x24BE41210]();
}

uint64_t sub_23DC70710()
{
  return MEMORY[0x24BE41218]();
}

uint64_t sub_23DC7071C()
{
  return MEMORY[0x24BE41220]();
}

uint64_t sub_23DC70728()
{
  return MEMORY[0x24BE41290]();
}

uint64_t sub_23DC70734()
{
  return MEMORY[0x24BE412A8]();
}

uint64_t sub_23DC70740()
{
  return MEMORY[0x24BE413A8]();
}

uint64_t sub_23DC7074C()
{
  return MEMORY[0x24BE413B0]();
}

uint64_t sub_23DC70758()
{
  return MEMORY[0x24BE41520]();
}

uint64_t sub_23DC70764()
{
  return MEMORY[0x24BE41F40]();
}

uint64_t sub_23DC70770()
{
  return MEMORY[0x24BE41550]();
}

uint64_t sub_23DC7077C()
{
  return MEMORY[0x24BE41578]();
}

uint64_t sub_23DC70788()
{
  return MEMORY[0x24BE41580]();
}

uint64_t sub_23DC70794()
{
  return MEMORY[0x24BE41598]();
}

uint64_t sub_23DC707A0()
{
  return MEMORY[0x24BE415B0]();
}

uint64_t sub_23DC707AC()
{
  return MEMORY[0x24BE415B8]();
}

uint64_t sub_23DC707B8()
{
  return MEMORY[0x24BE415C0]();
}

uint64_t sub_23DC707C4()
{
  return MEMORY[0x24BE415D0]();
}

uint64_t sub_23DC707D0()
{
  return MEMORY[0x24BE418E0]();
}

uint64_t sub_23DC707DC()
{
  return MEMORY[0x24BE418E8]();
}

uint64_t sub_23DC707E8()
{
  return MEMORY[0x24BE418F8]();
}

uint64_t sub_23DC707F4()
{
  return MEMORY[0x24BE41A40]();
}

uint64_t sub_23DC70800()
{
  return MEMORY[0x24BE3F730]();
}

uint64_t sub_23DC7080C()
{
  return MEMORY[0x24BE41FF8]();
}

uint64_t sub_23DC70818()
{
  return MEMORY[0x24BE42008]();
}

uint64_t sub_23DC70824()
{
  return MEMORY[0x24BE42010]();
}

uint64_t sub_23DC70830()
{
  return MEMORY[0x24BE42020]();
}

uint64_t sub_23DC7083C()
{
  return MEMORY[0x24BE42040]();
}

uint64_t sub_23DC70848()
{
  return MEMORY[0x24BE420C0]();
}

uint64_t sub_23DC70854()
{
  return MEMORY[0x24BE42170]();
}

uint64_t sub_23DC70860()
{
  return MEMORY[0x24BE421F8]();
}

uint64_t sub_23DC7086C()
{
  return MEMORY[0x24BE42200]();
}

uint64_t sub_23DC70878()
{
  return MEMORY[0x24BE42208]();
}

uint64_t sub_23DC70884()
{
  return MEMORY[0x24BE42510]();
}

uint64_t sub_23DC70890()
{
  return MEMORY[0x24BE42538]();
}

uint64_t sub_23DC7089C()
{
  return MEMORY[0x24BE42558]();
}

uint64_t sub_23DC708A8()
{
  return MEMORY[0x24BE42640]();
}

uint64_t sub_23DC708B4()
{
  return MEMORY[0x24BE42678]();
}

uint64_t sub_23DC708C0()
{
  return MEMORY[0x24BE42A40]();
}

uint64_t sub_23DC708CC()
{
  return MEMORY[0x24BE42C28]();
}

uint64_t sub_23DC708D8()
{
  return MEMORY[0x24BE42F78]();
}

uint64_t sub_23DC708E4()
{
  return MEMORY[0x24BE43100]();
}

uint64_t sub_23DC708F0()
{
  return MEMORY[0x24BE43128]();
}

uint64_t sub_23DC708FC()
{
  return MEMORY[0x24BE43140]();
}

uint64_t sub_23DC70908()
{
  return MEMORY[0x24BE431A0]();
}

uint64_t sub_23DC70914()
{
  return MEMORY[0x24BE431A8]();
}

uint64_t sub_23DC70920()
{
  return MEMORY[0x24BE431B0]();
}

uint64_t sub_23DC7092C()
{
  return MEMORY[0x24BE431B8]();
}

uint64_t sub_23DC70938()
{
  return MEMORY[0x24BE43230]();
}

uint64_t sub_23DC70944()
{
  return MEMORY[0x24BE43338]();
}

uint64_t sub_23DC70950()
{
  return MEMORY[0x24BE439C0]();
}

uint64_t sub_23DC7095C()
{
  return MEMORY[0x24BE439D0]();
}

uint64_t sub_23DC70968()
{
  return MEMORY[0x24BE439D8]();
}

uint64_t sub_23DC70974()
{
  return MEMORY[0x24BE439E0]();
}

uint64_t sub_23DC70980()
{
  return MEMORY[0x24BE439E8]();
}

uint64_t sub_23DC7098C()
{
  return MEMORY[0x24BE43A98]();
}

uint64_t sub_23DC70998()
{
  return MEMORY[0x24BE43DF8]();
}

uint64_t sub_23DC709A4()
{
  return MEMORY[0x24BE43EF8]();
}

uint64_t sub_23DC709B0()
{
  return MEMORY[0x24BE43F30]();
}

uint64_t sub_23DC709BC()
{
  return MEMORY[0x24BE44098]();
}

uint64_t sub_23DC709C8()
{
  return MEMORY[0x24BE440C0]();
}

uint64_t sub_23DC709D4()
{
  return MEMORY[0x24BE440D8]();
}

uint64_t sub_23DC709E0()
{
  return MEMORY[0x24BE44270]();
}

uint64_t sub_23DC709EC()
{
  return MEMORY[0x24BE442A0]();
}

uint64_t sub_23DC709F8()
{
  return MEMORY[0x24BE44398]();
}

uint64_t sub_23DC70A04()
{
  return MEMORY[0x24BE443D0]();
}

uint64_t sub_23DC70A10()
{
  return MEMORY[0x24BE443D8]();
}

uint64_t sub_23DC70A1C()
{
  return MEMORY[0x24BE443E8]();
}

uint64_t sub_23DC70A28()
{
  return MEMORY[0x24BE443F8]();
}

uint64_t sub_23DC70A34()
{
  return MEMORY[0x24BE44408]();
}

uint64_t sub_23DC70A40()
{
  return MEMORY[0x24BE44410]();
}

uint64_t sub_23DC70A4C()
{
  return MEMORY[0x24BE44440]();
}

uint64_t sub_23DC70A58()
{
  return MEMORY[0x24BE44448]();
}

uint64_t sub_23DC70A64()
{
  return MEMORY[0x24BE44450]();
}

uint64_t sub_23DC70A70()
{
  return MEMORY[0x24BE44458]();
}

uint64_t sub_23DC70A7C()
{
  return MEMORY[0x24BE44580]();
}

uint64_t sub_23DC70A88()
{
  return MEMORY[0x24BE446C0]();
}

uint64_t sub_23DC70A94()
{
  return MEMORY[0x24BE446C8]();
}

uint64_t sub_23DC70AA0()
{
  return MEMORY[0x24BE44720]();
}

uint64_t sub_23DC70AAC()
{
  return MEMORY[0x24BE44750]();
}

uint64_t sub_23DC70AB8()
{
  return MEMORY[0x24BE44888]();
}

uint64_t sub_23DC70AC4()
{
  return MEMORY[0x24BE44890]();
}

uint64_t sub_23DC70AD0()
{
  return MEMORY[0x24BE44910]();
}

uint64_t sub_23DC70ADC()
{
  return MEMORY[0x24BE44918]();
}

uint64_t sub_23DC70AE8()
{
  return MEMORY[0x24BE44920]();
}

uint64_t sub_23DC70AF4()
{
  return MEMORY[0x24BE44AA0]();
}

uint64_t sub_23DC70B00()
{
  return MEMORY[0x24BE44AA8]();
}

uint64_t sub_23DC70B0C()
{
  return MEMORY[0x24BE44B20]();
}

uint64_t sub_23DC70B18()
{
  return MEMORY[0x24BE44BE0]();
}

uint64_t sub_23DC70B24()
{
  return MEMORY[0x24BE44BE8]();
}

uint64_t sub_23DC70B30()
{
  return MEMORY[0x24BE44C40]();
}

uint64_t sub_23DC70B3C()
{
  return MEMORY[0x24BE44D98]();
}

uint64_t sub_23DC70B48()
{
  return MEMORY[0x24BE44DA0]();
}

uint64_t sub_23DC70B54()
{
  return MEMORY[0x24BE44DA8]();
}

uint64_t sub_23DC70B60()
{
  return MEMORY[0x24BE44EA8]();
}

uint64_t sub_23DC70B6C()
{
  return MEMORY[0x24BE44EB0]();
}

uint64_t sub_23DC70B78()
{
  return MEMORY[0x24BE44EB8]();
}

uint64_t sub_23DC70B84()
{
  return MEMORY[0x24BE44EC0]();
}

uint64_t sub_23DC70B90()
{
  return MEMORY[0x24BE44ED8]();
}

uint64_t sub_23DC70B9C()
{
  return MEMORY[0x24BE45168]();
}

uint64_t sub_23DC70BA8()
{
  return MEMORY[0x24BE45170]();
}

uint64_t sub_23DC70BB4()
{
  return MEMORY[0x24BE45178]();
}

uint64_t sub_23DC70BC0()
{
  return MEMORY[0x24BE45180]();
}

uint64_t sub_23DC70BCC()
{
  return MEMORY[0x24BE45248]();
}

uint64_t sub_23DC70BD8()
{
  return MEMORY[0x24BE45250]();
}

uint64_t sub_23DC70BE4()
{
  return MEMORY[0x24BE45258]();
}

uint64_t sub_23DC70BF0()
{
  return MEMORY[0x24BE45260]();
}

uint64_t sub_23DC70BFC()
{
  return MEMORY[0x24BE45268]();
}

uint64_t sub_23DC70C08()
{
  return MEMORY[0x24BE45328]();
}

uint64_t sub_23DC70C14()
{
  return MEMORY[0x24BE45330]();
}

uint64_t sub_23DC70C20()
{
  return MEMORY[0x24BE45338]();
}

uint64_t sub_23DC70C2C()
{
  return MEMORY[0x24BE45340]();
}

uint64_t sub_23DC70C38()
{
  return MEMORY[0x24BE45768]();
}

uint64_t sub_23DC70C44()
{
  return MEMORY[0x24BE457B8]();
}

uint64_t sub_23DC70C50()
{
  return MEMORY[0x24BE45818]();
}

uint64_t sub_23DC70C5C()
{
  return MEMORY[0x24BE458C8]();
}

uint64_t sub_23DC70C68()
{
  return MEMORY[0x24BE458D0]();
}

uint64_t sub_23DC70C74()
{
  return MEMORY[0x24BE458D8]();
}

uint64_t sub_23DC70C80()
{
  return MEMORY[0x24BE458E0]();
}

uint64_t sub_23DC70C8C()
{
  return MEMORY[0x24BE45968]();
}

uint64_t sub_23DC70C98()
{
  return MEMORY[0x24BE45978]();
}

uint64_t sub_23DC70CA4()
{
  return MEMORY[0x24BE45980]();
}

uint64_t sub_23DC70CB0()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_23DC70CBC()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_23DC70CC8()
{
  return MEMORY[0x24BE3F840]();
}

uint64_t sub_23DC70CD4()
{
  return MEMORY[0x24BE3F858]();
}

uint64_t sub_23DC70CE0()
{
  return MEMORY[0x24BE40688]();
}

uint64_t sub_23DC70CEC()
{
  return MEMORY[0x24BE484D0]();
}

uint64_t sub_23DC70CF8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DC70D04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DC70D10()
{
  return MEMORY[0x24BEBCB20]();
}

uint64_t sub_23DC70D1C()
{
  return MEMORY[0x24BDB9410]();
}

uint64_t sub_23DC70D28()
{
  return MEMORY[0x24BE484F8]();
}

uint64_t sub_23DC70D34()
{
  return MEMORY[0x24BDB9438]();
}

uint64_t sub_23DC70D40()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_23DC70D4C()
{
  return MEMORY[0x24BE48508]();
}

uint64_t sub_23DC70D58()
{
  return MEMORY[0x24BDB9478]();
}

uint64_t sub_23DC70D64()
{
  return MEMORY[0x24BDB9488]();
}

uint64_t sub_23DC70D70()
{
  return MEMORY[0x24BDB9520]();
}

uint64_t sub_23DC70D7C()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_23DC70D88()
{
  return MEMORY[0x24BDB97D0]();
}

uint64_t sub_23DC70D94()
{
  return MEMORY[0x24BDB98E0]();
}

uint64_t sub_23DC70DA0()
{
  return MEMORY[0x24BDB9960]();
}

uint64_t sub_23DC70DAC()
{
  return MEMORY[0x24BDB9A30]();
}

uint64_t sub_23DC70DB8()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_23DC70DC4()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_23DC70DD0()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_23DC70DDC()
{
  return MEMORY[0x24BDB9E08]();
}

uint64_t sub_23DC70DE8()
{
  return MEMORY[0x24BDB9E78]();
}

uint64_t sub_23DC70DF4()
{
  return MEMORY[0x24BDB9E80]();
}

uint64_t sub_23DC70E00()
{
  return MEMORY[0x24BE48558]();
}

uint64_t sub_23DC70E0C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_23DC70E18()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_23DC70E24()
{
  return MEMORY[0x24BDBA080]();
}

uint64_t sub_23DC70E30()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_23DC70E3C()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_23DC70E48()
{
  return MEMORY[0x24BDECCD0]();
}

uint64_t sub_23DC70E54()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23DC70E60()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23DC70E6C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23DC70E78()
{
  return MEMORY[0x24BDD2488]();
}

uint64_t sub_23DC70E84()
{
  return MEMORY[0x24BDFAEB8]();
}

uint64_t sub_23DC70E90()
{
  return MEMORY[0x24BDFAEC0]();
}

uint64_t sub_23DC70E9C()
{
  return MEMORY[0x24BDFAEC8]();
}

uint64_t sub_23DC70EA8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DC70EB4()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23DC70EC0()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_23DC70ECC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23DC70ED8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23DC70EE4()
{
  return MEMORY[0x24BDCF908]();
}

uint64_t sub_23DC70EF0()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_23DC70EFC()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_23DC70F08()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23DC70F14()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_23DC70F20()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_23DC70F2C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23DC70F38()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DC70F44()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23DC70F50()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23DC70F5C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DC70F68()
{
  return MEMORY[0x24BDCFB08]();
}

uint64_t sub_23DC70F74()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23DC70F80()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DC70F8C()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23DC70F98()
{
  return MEMORY[0x24BE41D58]();
}

uint64_t sub_23DC70FA4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DC70FB0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DC70FBC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DC70FC8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23DC70FD4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23DC70FE0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23DC70FEC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DC70FF8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23DC71004()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23DC71010()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DC7101C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23DC71028()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23DC71034()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23DC71040()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23DC7104C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23DC71058()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23DC71064()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23DC71070()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DC7107C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23DC71088()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DC71094()
{
  return MEMORY[0x24BE406B0]();
}

uint64_t sub_23DC710A0()
{
  return MEMORY[0x24BE406C8]();
}

uint64_t sub_23DC710AC()
{
  return MEMORY[0x24BE406E0]();
}

uint64_t sub_23DC710B8()
{
  return MEMORY[0x24BE40708]();
}

uint64_t sub_23DC710C4()
{
  return MEMORY[0x24BE45B10]();
}

uint64_t sub_23DC710D0()
{
  return MEMORY[0x24BE45498]();
}

uint64_t sub_23DC710DC()
{
  return MEMORY[0x24BE454B0]();
}

uint64_t sub_23DC710E8()
{
  return MEMORY[0x24BEBCCB0]();
}

uint64_t sub_23DC710F4()
{
  return MEMORY[0x24BE49F80]();
}

uint64_t sub_23DC71100()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23DC7110C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23DC71118()
{
  return MEMORY[0x24BE45528]();
}

uint64_t sub_23DC71124()
{
  return MEMORY[0x24BEAA310]();
}

uint64_t sub_23DC71130()
{
  return MEMORY[0x24BE45610]();
}

uint64_t sub_23DC7113C()
{
  return MEMORY[0x24BEBD008]();
}

uint64_t sub_23DC71148()
{
  return MEMORY[0x24BE407D0]();
}

uint64_t sub_23DC71154()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23DC71160()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23DC7116C()
{
  return MEMORY[0x24BE40718]();
}

uint64_t sub_23DC71178()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DC71184()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DC71190()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DC7119C()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_23DC711A8()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_23DC711B4()
{
  return MEMORY[0x24BEE2270]();
}

uint64_t sub_23DC711C0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23DC711CC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23DC711D8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23DC711E4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23DC711F0()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23DC711FC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23DC71208()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DC71214()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DC71220()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23DC7122C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23DC71238()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23DC71244()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DC71250()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DC7125C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DC71268()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23DC71274()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_23DC71280()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23DC7128C()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_23DC71298()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DC712A4()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23DC712B0()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23DC712BC()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23DC712C8()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23DC712D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DC712E0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DC712EC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DC712F8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DC71304()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_23DC71310()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DC7131C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23DC71328()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DC71334()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23DC71340()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23DC7134C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23DC71358()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23DC71364()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23DC71370()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23DC7137C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DC71388()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DC71394()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DC713A0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DC713AC()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23DC713B8()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23DC713C4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DC713D0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DC713DC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DC713E8()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_23DC713F4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23DC71400()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23DC7140C()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_23DC71418()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23DC71424()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23DC71430()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}


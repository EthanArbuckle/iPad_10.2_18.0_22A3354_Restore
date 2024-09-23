uint64_t type metadata accessor for MedicationScanMultiResultsViewController()
{
  uint64_t result;

  result = qword_2552553D8;
  if (!qword_2552553D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C291950()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C2C1A00();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id sub_21C2919F4()
{
  return sub_21C291BE0(&qword_2552553C0, (uint64_t (*)(uint64_t))sub_21C291A08);
}

void *sub_21C291A08(uint64_t a1)
{
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
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;

  v2 = sub_21C2C24E0();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21C2C2504();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  sub_21C2C24F8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEBD188], v2);
  sub_21C2C24B0();
  v13 = (void *)sub_21C2C21A4();
  v14 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v13);

  sub_21C2C24EC();
  sub_21C2943A8(0, &qword_255255508);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v15 = (void *)sub_21C2C2510();
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_addTarget_action_forControlEvents_, a1, sel_tapToRadarButtonTappedWithSender_, 64);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return v15;
}

id sub_21C291BCC()
{
  return sub_21C291BE0(&qword_2552553C8, (uint64_t (*)(uint64_t))sub_21C291C3C);
}

id sub_21C291BE0(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_21C291C3C(void *a1)
{
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
  char *v12;
  id v13;
  void (*v14)(char *, _QWORD, uint64_t);
  id v15;
  id v16;
  uint64_t v18;

  sub_21C2942D4();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21C2C24E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21C2C2504();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);
  objc_msgSend(v13, sel_addTarget_action_forControlEvents_, a1, sel_onClose, 64);
  sub_21C2C24C8();
  v14 = *(void (**)(char *, _QWORD, uint64_t))(v6 + 104);
  v14(v8, *MEMORY[0x24BEBD180], v5);
  sub_21C2C24B0();
  v15 = objc_msgSend(a1, sel_traitCollection);
  v16 = objc_msgSend(v15, sel_preferredContentSizeCategory);

  LOBYTE(v15) = sub_21C2C23FC();
  if ((v15 & 1) != 0)
  {
    v14(v8, *MEMORY[0x24BEBD188], v5);
    sub_21C2C24B0();
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v4, 0, 1, v9);
  sub_21C2C2528();
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v13;
}

id sub_21C291E70()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = qword_2552553D0;
  v2 = *(void **)(v0 + qword_2552553D0);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_2552553D0);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 3);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v4);

    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

char *sub_21C291F30(void *a1, void *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  id v16;
  id v17;
  id v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  char *v24;
  void *v25;
  char *v26;
  id v27;
  void *v28;
  char *result;
  char *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v7 = sub_21C2C1CE8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C2C1A00();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v3[qword_255256850 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[qword_2552553C0] = 0;
  *(_QWORD *)&v3[qword_2552553C8] = 0;
  *(_QWORD *)&v3[qword_2552553D0] = 0;
  *(_QWORD *)&v3[qword_2552553A8] = a1;
  *(_QWORD *)&v3[qword_2552553B0] = a2;
  v37 = v12;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v15(&v3[qword_255256848], a3, v11);
  v38 = a3;
  v15(v14, a3, v11);
  v16 = objc_allocWithZone((Class)type metadata accessor for ScanResultSelectionViewController());
  v17 = a1;
  v18 = a2;
  v19 = v3;
  v36 = v17;
  v20 = (void *)sub_21C29E9F8(v17, v18, (uint64_t)v14);
  *(_QWORD *)&v19[qword_2552553B8] = v20;
  v21 = v20;

  v22 = qword_255255398;
  v23 = v21;
  if (v22 != -1)
    swift_once();
  sub_21C2C1940();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE45150], v7);
  v24 = (char *)sub_21C2C1CDC();
  v25 = *(void **)&v24[qword_2552553B8];
  v26 = v24;
  v27 = v25;
  sub_21C2C1C64();

  v28 = (void *)sub_21C2C1B68();
  swift_release();
  objc_msgSend(v28, sel_registerObserver_, v26);

  objc_msgSend(v26, sel_setModalTransitionStyle_, 2);
  objc_msgSend(v26, sel_setModalPresentationStyle_, 5);
  result = (char *)objc_msgSend(v26, sel_view);
  if (result)
  {
    v30 = result;
    v31 = (void *)objc_opt_self();
    v32 = objc_msgSend(v31, sel_clearColor);
    objc_msgSend(v30, sel_setBackgroundColor_, v32);

    v33 = objc_msgSend(v26, sel_contentView);
    v34 = objc_msgSend(v31, sel_clearColor);
    objc_msgSend(v33, sel_setBackgroundColor_, v34);

    objc_msgSend(v26, sel_setOverrideUserInterfaceStyle_, 2);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v11);
    return v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C292304()
{
  return 2;
}

id sub_21C29230C()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for MedicationScanMultiResultsViewController();
  objc_msgSendSuper2(&v14, sel_viewDidLoad);
  swift_unknownObjectWeakAssign();
  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v2 = result;
    v3 = sub_21C291E70();
    objc_msgSend(v2, sel_insertSubview_atIndex_, v3, 0);

    v4 = sub_21C291E70();
    result = objc_msgSend(v0, sel_view);
    if (result)
    {
      v5 = result;
      objc_msgSend(result, sel_bounds);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      objc_msgSend(v4, sel_setFrame_, v7, v9, v11, v13);
      sub_21C292A08();
      return (id)sub_21C292F60();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_21C292444(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C29230C();

}

uint64_t sub_21C292478(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v11;

  sub_21C2940F0();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1E68();
  v7 = *(void **)&a1[qword_2552553B8];
  type metadata accessor for ScanResultSelectionViewController();
  sub_21C293BF0(&qword_2552554E0, (uint64_t (*)(uint64_t))type metadata accessor for ScanResultSelectionViewController, (uint64_t)&unk_21C2C3BFC);
  v8 = a1;
  v9 = v7;
  sub_21C2C1CD0();

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_21C292580(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C2927F0((void (*)(void))sub_21C29B210, "[%{public}s] Primary button pressed without a delegate");

}

uint64_t sub_21C2925C8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_21C2C1D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x220779584](&v1[qword_255256850]))
  {
    sub_21C29AF18(v1);
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_21C2C1D60();
    v7 = sub_21C2C1D6C();
    v8 = sub_21C2C2354();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v14 = v10;
      *(_DWORD *)v9 = 136446210;
      v11 = sub_21C2C28AC();
      v13 = sub_21C2BE2B4(v11, v12, &v14);
      sub_21C2C2570();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C28F000, v7, v8, "[%{public}s] Secondary button pressed without a delegate", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v10, -1, -1);
      MEMORY[0x2207794E8](v9, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_21C2927A8(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C2925C8();

}

uint64_t sub_21C2927DC()
{
  return sub_21C2927F0((void (*)(void))sub_21C29B218, "[%{public}s] Secondary button pressed without a delegate");
}

uint64_t sub_21C2927F0(void (*a1)(void), const char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  v5 = v2;
  swift_getObjectType();
  v6 = sub_21C2C1D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x220779584](v5 + qword_255256850))
  {
    a1();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_21C2C1D60();
    v11 = sub_21C2C1D6C();
    v12 = sub_21C2C2354();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v18 = v14;
      *(_DWORD *)v13 = 136446210;
      v17[1] = v13 + 4;
      v15 = sub_21C2C28AC();
      v17[2] = sub_21C2BE2B4(v15, v16, &v18);
      sub_21C2C2570();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C28F000, v11, v12, a2, v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v14, -1, -1);
      MEMORY[0x2207794E8](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_21C2929D4(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C2927DC();

}

void sub_21C292A08()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v1 = v0;
  v2 = sub_21C2C1BA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_view);
  if (!v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v7 = v6;
  v8 = sub_21C291BCC();
  objc_msgSend(v7, sel_addSubview_, v8);

  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v55 = v9;
  v10 = swift_allocObject();
  v54 = xmmword_21C2C30C0;
  *(_OWORD *)(v10 + 16) = xmmword_21C2C30C0;
  v11 = sub_21C291BCC();
  v12 = objc_msgSend(v11, sel_topAnchor);

  v13 = objc_msgSend(v1, sel_view);
  if (!v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_safeAreaLayoutGuide);

  v16 = objc_msgSend(v15, sel_topAnchor);
  v17 = objc_msgSend(v1, sel_view);
  if (!v17)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v17;
  v56 = v2;
  objc_msgSend(v17, sel_layoutMargins);
  v20 = v19;

  v21 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v16, v20);
  *(_QWORD *)(v10 + 32) = v21;
  v22 = sub_21C291BCC();
  v23 = objc_msgSend(v22, sel_trailingAnchor);

  v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_safeAreaLayoutGuide);

  v27 = objc_msgSend(v26, sel_trailingAnchor);
  v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v29 = v28;
  v30 = (void *)objc_opt_self();
  objc_msgSend(v29, sel_layoutMargins);
  v32 = v31;

  v33 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v27, -v32);
  *(_QWORD *)(v10 + 40) = v33;
  v57 = v10;
  sub_21C2C2288();
  sub_21C2943A8(0, &qword_255255500);
  v34 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v34);

  sub_21C2C1B98();
  v35 = sub_21C2C1B8C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v56);
  if ((v35 & 1) == 0)
    return;
  v36 = objc_msgSend(v1, sel_view);
  if (!v36)
    goto LABEL_17;
  v37 = v36;
  v38 = sub_21C2919F4();
  objc_msgSend(v37, sel_addSubview_, v38);

  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v54;
  v40 = sub_21C2919F4();
  v41 = objc_msgSend(v40, sel_topAnchor);

  v42 = objc_msgSend(v1, sel_view);
  if (!v42)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, sel_safeAreaLayoutGuide);

  v45 = objc_msgSend(v44, sel_topAnchor);
  v46 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v45, 16.0);

  *(_QWORD *)(v39 + 32) = v46;
  v47 = sub_21C2919F4();
  v48 = objc_msgSend(v47, sel_leadingAnchor);

  v49 = objc_msgSend(v1, sel_view);
  if (!v49)
  {
LABEL_19:
    __break(1u);
    return;
  }
  v50 = v49;
  v51 = objc_msgSend(v49, sel_leadingAnchor);

  v52 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v51, 16.0);
  *(_QWORD *)(v39 + 40) = v52;
  v57 = v39;
  sub_21C2C2288();
  v53 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v53);

}

uint64_t sub_21C292F60()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  id v15;
  id v16;
  void (*v17)(uint64_t *, _QWORD);
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v34[2];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  sub_21C2942D4();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v38 = (uint64_t)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v37 = (uint64_t)v34 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v34 - v6;
  sub_21C2C1C58();
  if (qword_255255398 != -1)
    swift_once();
  sub_21C2C1940();
  v8 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v34[1] = *MEMORY[0x24BE4A178];
  v39 = sub_21C2C21C8();
  v40 = v9;
  swift_bridgeObjectRetain();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v35 = v0;
  v11 = objc_msgSend(v0, sel_hxui_addPrimaryFooterButtonWithTitle_accessibilityIdentifier_, v8, v10);

  v12 = v11;
  sub_21C2C251C();

  v13 = sub_21C2C2504();
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48);
  if (!v14(v7, 1, v13))
  {
    v15 = objc_msgSend((id)objc_opt_self(), sel_tintColor);
    sub_21C2C24D4();
  }
  if (!v14(v7, 1, v13))
  {
    v16 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    v17 = (void (*)(uint64_t *, _QWORD))sub_21C2C24A4();
    sub_21C2C1DD8();
    v17(&v39, 0);
  }
  v36 = objc_msgSend((id)objc_opt_self(), sel_configurationWithScale_, 1);
  if (!v14(v7, 1, v13))
  {
    v18 = v36;
    v19 = (void *)sub_21C2C21A4();
    v20 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v19, v18);

    sub_21C2C24EC();
  }
  if (!v14(v7, 1, v13))
    sub_21C2C24BC();
  sub_21C294328((uint64_t)v7, v37);
  v21 = v12;
  sub_21C2C2528();

  sub_21C2C1940();
  v22 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v39 = sub_21C2C21C8();
  v40 = v23;
  swift_bridgeObjectRetain();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  v24 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v25 = v35;
  v26 = objc_msgSend(v35, sel_hxui_addSecondaryFooterButtonWithTitle_bold_accessibilityIdentifier_, v22, 0, v24);

  v27 = v26;
  v28 = v38;
  sub_21C2C251C();

  if (!v14((char *)v28, 1, v13))
  {
    v29 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    sub_21C2C24D4();
  }
  v30 = v38;
  sub_21C294328(v38, v37);
  v31 = v27;
  sub_21C2C2528();

  v32 = objc_msgSend(v25, sel_buttonTray);
  objc_msgSend(v32, sel_setHidden_, 0);

  objc_msgSend(v25, sel_setOverrideUserInterfaceStyle_, 2);
  sub_21C29436C(v30);
  return sub_21C29436C((uint64_t)v7);
}

uint64_t *sub_21C293538()
{
  void *v0;
  _OWORD v2[10];
  uint64_t v3;
  uint64_t v4[21];
  _OWORD v5[10];
  uint64_t v6;

  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  swift_retain();
  sub_21C2ABD2C((uint64_t)v2);
  swift_release();
  sub_21C294178((uint64_t)v2, (uint64_t)v4);
  sub_21C294178((uint64_t)v4, (uint64_t)v5);
  if (sub_21C2941D4((uint64_t *)v5) == 1)
    return (uint64_t *)_s25HealthMedicationsVisionUI0C10TapToRadarC19medicationsTracking14viewControllerySo06UIViewK0C_tFZ_0(v0);
  v2[8] = v5[8];
  v2[9] = v5[9];
  v3 = v6;
  v2[4] = v5[4];
  v2[5] = v5[5];
  v2[6] = v5[6];
  v2[7] = v5[7];
  v2[0] = v5[0];
  v2[1] = v5[1];
  v2[2] = v5[2];
  v2[3] = v5[3];
  _s25HealthMedicationsVisionUI0C10TapToRadarC8scanning0H7Session14viewControlleryAA08ScanningI0V_So06UIViewK0CtFZ_0((uint64_t)v2, v0);
  return sub_21C2941EC(v4);
}

uint64_t sub_21C293640(void *a1)
{
  id v2;
  uint64_t v4;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_21C2C2594();
  swift_unknownObjectRelease();
  sub_21C293538();

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v4);
}

void sub_21C29369C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_21C2936C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_255256848;
  v2 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_21C294154(v0 + qword_255256850);
}

id sub_21C293774()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationScanMultiResultsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21C2937A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + qword_255256848;
  v3 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);

  sub_21C294154(a1 + qword_255256850);
}

uint64_t sub_21C293858()
{
  return type metadata accessor for MedicationScanMultiResultsViewController();
}

void type metadata accessor for HKConceptAttributeType(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255428, (uint64_t)&unk_24E027120, MEMORY[0x24BEE4D40]);
}

uint64_t initializeBufferWithCopyOfBuffer for ScanResultGroupItem(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_21C2938BC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21C2938DC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255430, (uint64_t)&unk_24E027198, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HKMedicationListOnboardingAlgorithmType(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255438, (uint64_t)&unk_24E0271C0, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255440, (uint64_t)&unk_24E0271E0, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255448, (uint64_t)&unk_24E027208, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HKMedicationListOnboardingAnalyticsStepType(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255450, (uint64_t)&unk_24E027230, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for VNBarcodeSymbology(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255458, (uint64_t)&unk_24E027250, MEMORY[0x24BEE4D40]);
}

uint64_t sub_21C2939B0(uint64_t a1, uint64_t a2)
{
  return sub_21C293E28(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21C2939D0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21C2C21B0();
  *a2 = 0;
  return result;
}

uint64_t sub_21C293A44(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21C2C21BC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21C293AC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21C2C21C8();
  v2 = sub_21C2C21A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21C293B00(uint64_t a1, uint64_t a2)
{
  return sub_21C293E28(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21C293B14()
{
  sub_21C293BF0(&qword_2552554C8, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_21C2C3368);
  sub_21C293BF0(&qword_2552554D0, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_21C2C3308);
  return sub_21C2C2720();
}

uint64_t sub_21C293B98()
{
  return sub_21C293BF0(&qword_255255460, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_21C2C32CC);
}

uint64_t sub_21C293BC4()
{
  return sub_21C293BF0(&qword_255255468, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_21C2C32A0);
}

uint64_t sub_21C293BF0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22077944C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21C293C30()
{
  sub_21C293BF0((unint64_t *)&qword_255255548, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21C2C381C);
  sub_21C293BF0(&qword_255255550, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21C2C3770);
  return sub_21C2C2720();
}

uint64_t sub_21C293CB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21C2C21C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21C293CDC()
{
  sub_21C293BF0(&qword_2552554B8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C3670);
  sub_21C293BF0(&qword_2552554C0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C346C);
  return sub_21C2C2720();
}

uint64_t sub_21C293D60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21C2C21A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21C293DA4()
{
  sub_21C293BF0(&qword_2552554A8, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_21C2C35E0);
  sub_21C293BF0(&qword_2552554B0, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_21C2C3580);
  return sub_21C2C2720();
}

uint64_t sub_21C293E28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21C2C21C8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21C293E64()
{
  sub_21C2C21C8();
  sub_21C2C2228();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C293EA4()
{
  uint64_t v0;

  sub_21C2C21C8();
  sub_21C2C284C();
  sub_21C2C2228();
  v0 = sub_21C2C2870();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21C293F14()
{
  return sub_21C293BF0(&qword_255255470, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_21C2C333C);
}

uint64_t sub_21C293F40()
{
  return sub_21C293BF0(&qword_255255478, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C3430);
}

uint64_t sub_21C293F6C()
{
  return sub_21C293BF0(&qword_255255480, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C3404);
}

uint64_t sub_21C293F98()
{
  return sub_21C293BF0(&qword_255255488, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_21C2C3544);
}

uint64_t sub_21C293FC4()
{
  return sub_21C293BF0(&qword_255255490, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_21C2C3518);
}

uint64_t sub_21C293FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21C2C21C8();
  v2 = v1;
  if (v0 == sub_21C2C21C8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21C2C2804();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21C294078()
{
  return sub_21C293BF0(&qword_255255498, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_21C2C35B4);
}

uint64_t sub_21C2940A4()
{
  return sub_21C293BF0(&qword_2552554A0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C34A0);
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

void sub_21C2940F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552554D8)
  {
    v0 = sub_21C2C1E74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552554D8);
  }
}

uint64_t sub_21C294154(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_21C294178(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2944A4(0, &qword_2552554E8, (uint64_t)&type metadata for ScanningSession, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C2941D4(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t *sub_21C2941EC(uint64_t *a1)
{
  sub_21C29424C(*a1);
  return a1;
}

uint64_t sub_21C29424C(uint64_t result)
{
  if (result)
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
  return result;
}

void sub_21C2942D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552554F0)
  {
    sub_21C2C2504();
    v0 = sub_21C2C2564();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552554F0);
  }
}

uint64_t sub_21C294328(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2942D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C29436C(uint64_t a1)
{
  uint64_t v2;

  sub_21C2942D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C2943A8(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for Key(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255510, (uint64_t)&unk_24E027278, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for CGPath(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255518, (uint64_t)&unk_24E0272A0, MEMORY[0x24BEE4D40]);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21C294424(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21C294444(uint64_t result, int a2, int a3)
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
  sub_21C2944A4(a1, &qword_255255520, (uint64_t)&unk_24E027328, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_21C2944A4(a1, &qword_255255528, (uint64_t)&unk_24E0273A8, MEMORY[0x24BEE4D40]);
}

void sub_21C2944A4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_21C2944E8()
{
  return sub_21C293BF0(&qword_255255530, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21C2C3734);
}

uint64_t sub_21C294514()
{
  return sub_21C293BF0(&qword_255255538, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21C2C3708);
}

uint64_t sub_21C294540()
{
  return sub_21C293BF0(&qword_255255540, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21C2C37A4);
}

uint64_t sub_21C29457C()
{
  uint64_t result;

  sub_21C2943A8(0, &qword_2552557B0);
  result = sub_21C2C2558();
  qword_255255558 = result;
  return result;
}

id PillBottleScanningLog.getter()
{
  if (qword_255255390 != -1)
    swift_once();
  return (id)qword_255255558;
}

uint64_t sub_21C294620()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_255255560;
  swift_beginAccess();
  return MEMORY[0x220779584](v1);
}

uint64_t sub_21C29466C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_255255560;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_21C2946D4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_255255560;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x220779584](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_21C294748;
}

void sub_21C294748(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_21C2947BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  __int128 v25;
  char *v26;

  v0 = sub_21C2C20F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v26 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFA138];
  sub_21C29CBC0(0, &qword_255255568, (uint64_t (*)(uint64_t))MEMORY[0x24BDFA138], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - v5;
  v7 = MEMORY[0x24BEE3598];
  sub_21C29CBC0(0, &qword_255255570, (uint64_t (*)(uint64_t))MEMORY[0x24BDFA0D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_21C2C20C0();
  v8 = swift_allocObject();
  v25 = xmmword_21C2C3870;
  *(_OWORD *)(v8 + 16) = xmmword_21C2C3870;
  sub_21C2944A4(0, &qword_255255578, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))v7);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21C2C3880;
  *(_QWORD *)(v9 + 32) = 28261;
  *(_QWORD *)(v9 + 40) = 0xE200000000000000;
  v10 = sub_21C2C2114();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_21C2C20A8();
  swift_bridgeObjectRelease();
  sub_21C29C534((uint64_t)v6, &qword_255255568, v3);
  sub_21C29CBC0(0, &qword_255255580, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t (*)(uint64_t, uint64_t))v7);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v25;
  v12 = (void *)*MEMORY[0x24BDF9D90];
  v13 = (void *)*MEMORY[0x24BDF9D98];
  *(_QWORD *)(v11 + 32) = *MEMORY[0x24BDF9D90];
  *(_QWORD *)(v11 + 40) = v13;
  v14 = v12;
  v15 = v13;
  sub_21C2C20B4();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v8 + 16))
    sub_21C29B324(v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v26, *MEMORY[0x24BDFA110], v0);
  v16 = (void *)objc_opt_self();
  if (objc_msgSend(v16, sel_isAppleInternalInstall))
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    sub_21C2C2210();
    v18 = (void *)sub_21C2C21A4();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_BOOLForKey_, v18);

  }
  if (objc_msgSend(v16, sel_isAppleInternalInstall))
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    sub_21C2C2210();
    v20 = (void *)sub_21C2C21A4();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_BOOLForKey_, v20);

  }
  v21 = objc_allocWithZone((Class)sub_21C2C2168());
  v22 = sub_21C2C20CC();
  sub_21C293BF0(&qword_255255588, (uint64_t (*)(uint64_t))type metadata accessor for MedicationDataScannerViewController, (uint64_t)&protocol conformance descriptor for MedicationDataScannerViewController);
  swift_unknownObjectRetain();
  sub_21C2C215C();
  sub_21C293BF0(&qword_255255590, (uint64_t (*)(uint64_t))type metadata accessor for MedicationDataScannerViewController, (uint64_t)&protocol conformance descriptor for MedicationDataScannerViewController);
  swift_unknownObjectRetain();
  sub_21C2C2120();
  sub_21C2C2138();
  sub_21C2C2150();
  return v22;
}

id sub_21C294C04()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = qword_255255618;
  v2 = *(void **)(v0 + qword_255255618);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_255255618);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_21C294C84()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = qword_255255620;
  v2 = *(void **)(v0 + qword_255255620);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_255255620);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7B8]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id MedicationDataScannerViewController.__allocating_init(healthStore:analyticsContext:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_21C29B5C4(a1, a2);

  swift_release();
  return v6;
}

id MedicationDataScannerViewController.init(healthStore:analyticsContext:)(void *a1, uint64_t a2)
{
  id v3;

  v3 = sub_21C29B5C4(a1, a2);

  swift_release();
  return v3;
}

void sub_21C294D88(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_21C29B800();
}

id static MedicationDataScannerViewController.supportsDataScanning.getter()
{
  id result;
  void *v1;
  unsigned __int8 v2;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, sel_isiPad);

    if ((v2 & 1) != 0 || (sub_21C2C1A84() & 1) == 0)
    {
      return 0;
    }
    else
    {
      sub_21C2C2168();
      return (id)(sub_21C2C20E4() & 1);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21C294E2C(void *a1)
{
  id v1;
  id v2;
  objc_super v3;

  v1 = a1;
  v2 = sub_21C294C84();
  objc_msgSend(v2, sel_prepare);

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  sub_21C295158();

}

uint64_t sub_21C294E90()
{
  uint64_t (*v0)(void);
  id v1;
  void *v2;
  unsigned int v3;

  sub_21C2C1BF8();
  v0 = (uint64_t (*)(void))sub_21C2C1C04();
  if ((v0() & 1) == 0)
    return 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  sub_21C2C221C();
  v2 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_BOOLForKey_, v2);

  return v3 ^ 1;
}

void sub_21C294F34()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v21, sel_viewDidLayoutSubviews);
  v1 = sub_21C294C04();
  v2 = (void *)sub_21C2C1BC8();
  v3 = (void *)sub_21C2C20D8();

  objc_msgSend(v3, sel_bounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
  v12 = (void *)sub_21C2C1BC8();
  v13 = sub_21C294C04();
  v14 = sub_21C2A5BF8();
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v22 = v14;
  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = 0;
  sub_21C2C212C();

}

void sub_21C295038(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C294F34();

}

uint64_t sub_21C29506C(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v2 = v1;
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  objc_msgSendSuper2(&v8, sel_viewDidDisappear_, a1 & 1);
  v4 = qword_255255598;
  v5 = *(_QWORD *)&v2[qword_255255598];
  if (v5)
  {
    swift_retain();
    sub_21C2C1A54();
    objc_msgSend(*(id *)(v5 + 64), sel_invalidate);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = 0;

    sub_21C2C1A60();
    swift_release();
  }
  *(_QWORD *)&v2[v4] = 0;
  return swift_release();
}

void sub_21C295118(void *a1, uint64_t a2, char a3)
{
  id v4;

  v4 = a1;
  sub_21C29506C(a3);

}

void sub_21C295158()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v2 = sub_21C2C2018();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - v6;
  sub_21C29CDE4();
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CE5C();
  v14 = v13;
  v27 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C298110();
  v31 = *(id *)(v0 + qword_2552555B0);
  sub_21C29C4D0();
  sub_21C293BF0(&qword_255255778, (uint64_t (*)(uint64_t))sub_21C29C4D0, MEMORY[0x24BDB9D10]);
  sub_21C2C1FE8();
  sub_21C2943A8(0, &qword_255255700);
  v31 = (id)sub_21C2C239C();
  v17 = sub_21C2C2390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 1, 1, v17);
  sub_21C293BF0(&qword_255255788, (uint64_t (*)(uint64_t))sub_21C29CDE4, MEMORY[0x24BDB9658]);
  sub_21C29C7FC();
  sub_21C2C1FD0();
  sub_21C29C534((uint64_t)v7, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0]);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = swift_allocObject();
  v20 = ObjectType;
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = v20;
  sub_21C293BF0(&qword_255255790, (uint64_t (*)(uint64_t))sub_21C29CE5C, MEMORY[0x24BDB9A08]);
  v21 = sub_21C2C2000();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v14);
  *(_QWORD *)(v1 + qword_255255610) = v21;
  swift_release();
  v22 = *(void **)(v1 + qword_2552555C8);
  v24 = v29;
  v23 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v4, *MEMORY[0x24BEE5498], v30);
  v25 = (void *)sub_21C2C23B4();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v23);
  objc_msgSend(v22, sel_registerObserver_queue_, v1, v25);

  sub_21C29570C();
}

void sub_21C2954D8(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[3];

  v4 = sub_21C2C1D78();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  sub_21C2C1D60();
  v9 = sub_21C2C1D6C();
  v10 = sub_21C2C2360();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v20 = v5;
    v12 = v11;
    v13 = swift_slowAlloc();
    v22[0] = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = sub_21C2C28AC();
    v21 = sub_21C2BE2B4(v14, v15, v22);
    v19 = v4;
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 1024;
    LODWORD(v21) = v8;
    sub_21C2C2570();
    _os_log_impl(&dword_21C28F000, v9, v10, "[%s] Updating primary button state to assetReady: %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v13, -1, -1);
    MEMORY[0x2207794E8](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v19);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  v16 = MEMORY[0x220779584](a2 + 16);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)sub_21C2C1BB0();

    if (v18)
    {
      sub_21C2C1CC4();
      if (swift_dynamicCastClass())
        sub_21C2C1CA0();

    }
  }
}

void sub_21C29570C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
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
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock[6];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = sub_21C2C1D78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1D54();
  v7 = sub_21C2C1D6C();
  v8 = sub_21C2C2360();
  if (os_log_type_enabled(v7, v8))
  {
    v19 = v1;
    v9 = swift_slowAlloc();
    v20 = ObjectType;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_21C2C28AC();
    v21 = sub_21C2BE2B4(v12, v13, aBlock);
    sub_21C2C2570();
    v1 = v19;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v7, v8, "[%{public}s] Marking vision shards as required.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v11, -1, -1);
    v14 = v10;
    ObjectType = v20;
    MEMORY[0x2207794E8](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v15 = *(void **)(v1 + qword_2552555C8);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = ObjectType;
  aBlock[4] = (uint64_t)sub_21C29CF4C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21C29AEB8;
  aBlock[3] = (uint64_t)&block_descriptor_108;
  v17 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_markMedsScanningShardAsRequiredWithCompletion_, v17);
  _Block_release(v17);
}

uint64_t sub_21C295940(int a1)
{
  char *v1;
  char *v2;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int128 v44;
  char v45;

  v2 = v1;
  v43 = a1;
  sub_21C29CBC0(0, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3);
  v39 = (char *)&v32 - v4;
  sub_21C2944A4(0, &qword_2552556F0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9ED8]);
  v38 = v5;
  v36 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - v6;
  sub_21C29C6EC();
  v9 = v8;
  v41 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21C2C1D48();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v40 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v32 - v16;
  v42 = qword_255255608;
  if (*(_QWORD *)&v1[qword_255255608])
  {
    swift_retain();
    sub_21C2C1EEC();
    swift_release();
  }
  v18 = qword_255255598;
  v19 = *(_QWORD *)&v1[qword_255255598];
  if (v19)
  {
    swift_retain();
    sub_21C2C1A54();
    objc_msgSend(*(id *)(v19 + 64), sel_invalidate);
    v20 = *(void **)(v19 + 64);
    *(_QWORD *)(v19 + 64) = 0;

    sub_21C2C1A60();
    swift_release();
  }
  *(_QWORD *)&v1[v18] = 0;
  swift_release();
  type metadata accessor for MedicationDataScanningCoordinator();
  swift_allocObject();
  *(_QWORD *)&v1[v18] = sub_21C2BA12C();
  swift_release();
  if (*(_QWORD *)&v1[v18])
    swift_unknownObjectWeakAssign();
  if (qword_255255390 != -1)
    swift_once();
  v21 = (id)qword_255255558;
  v35 = v1;
  sub_21C2C1D3C();
  if (*(_QWORD *)&v1[v18])
  {
    swift_beginAccess();
    sub_21C2944A4(0, &qword_255255718, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9EF0]);
    v33 = v9;
    v34 = v17;
    swift_retain();
    sub_21C2C1F7C();
    swift_endAccess();
    swift_release();
    sub_21C2943A8(0, &qword_255255700);
    *(_QWORD *)&v44 = sub_21C2C239C();
    v22 = sub_21C2C2390();
    v23 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v39, 1, 1, v22);
    sub_21C29C79C();
    sub_21C29C7FC();
    v24 = v38;
    v17 = v34;
    sub_21C2C1FD0();
    sub_21C29C534(v23, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0]);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v24);
    v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v26 = v40;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v40, v17, v12);
    v27 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v25;
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v28 + v27, v26, v12);
    sub_21C293BF0(&qword_255255720, (uint64_t (*)(uint64_t))sub_21C29C6EC, MEMORY[0x24BDB9A08]);
    v29 = v33;
    v30 = sub_21C2C2000();
    swift_release();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v29);
  }
  else
  {
    v30 = 0;
  }
  *(_QWORD *)&v2[v42] = v30;
  swift_release();
  if ((v43 & 1) != 0 && *(_QWORD *)&v2[v18])
  {
    swift_retain();
    sub_21C2BA6C0(1);
    swift_getKeyPath();
    swift_getKeyPath();
    v44 = xmmword_21C2C3890;
    v45 = 2;
    sub_21C2C1F94();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v12);
}

uint64_t sub_21C295E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int v21;
  uint64_t result;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  id v57;
  void (*v58)(char *, char *, uint64_t);
  void (*v59)(char *, uint64_t, uint64_t);
  char *v60;
  char *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;

  v62 = a3;
  v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_21C29CBC0(0, &qword_255255728, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6990], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v58 - v7;
  v8 = sub_21C2C19DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_2552556E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], v5);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v58 - v13;
  v15 = sub_21C2C1A00();
  v65 = *(_QWORD *)(v15 - 8);
  v16 = *(_QWORD *)(v65 + 64);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v61 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v58 - v18;
  v20 = *(_QWORD *)(a1 + 8);
  v63 = *(id *)a1;
  v64 = v20;
  v21 = *(unsigned __int8 *)(a1 + 16);
  swift_beginAccess();
  result = MEMORY[0x220779584](a2 + 16);
  if (!result)
    return result;
  v23 = (void *)result;
  v24 = *(_QWORD *)(result + qword_255255598);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v65 + 56))(v14, 1, 1, v15);
    goto LABEL_12;
  }
  v25 = v65;
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
  v59(v14, v24 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v14, 1, v15) == 1)
  {
LABEL_12:

    return sub_21C29C534((uint64_t)v14, &qword_2552556E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
  }
  v58 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  v58(v19, v14, v15);
  v26 = v15;
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  swift_retain();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v28 = v27;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_21C2AD9F0((uint64_t)v19, 0, 1, v28, 0, 0, 1);
  swift_release();
  v29 = v19;
  if (v21)
  {
    if (v21 != 1)
      __asm { BR              X9 }
    v30 = v63;
    swift_bridgeObjectRetain();
    sub_21C2C23C0();
    if (qword_255255390 != -1)
      swift_once();
    sub_21C2C1D30();
    v31 = sub_21C294C84();
    objc_msgSend(v31, sel_notificationOccurred_, 0);

    v32 = (void *)sub_21C2C1BC8();
    sub_21C2C20FC();

    v33 = sub_21C2C22F4();
    v34 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v60, 1, 1, v33);
    v35 = v61;
    v59(v61, (uint64_t)v29, v26);
    sub_21C2C22DC();
    v36 = v23;
    v37 = v30;
    v38 = sub_21C2C22D0();
    v39 = v65;
    v40 = *(unsigned __int8 *)(v65 + 80);
    v63 = v29;
    v41 = v26;
    v42 = (v40 + 56) & ~v40;
    v43 = (char *)swift_allocObject();
    v44 = MEMORY[0x24BEE6930];
    *((_QWORD *)v43 + 2) = v38;
    *((_QWORD *)v43 + 3) = v44;
    *((_QWORD *)v43 + 4) = v36;
    *((_QWORD *)v43 + 5) = v37;
    *((_QWORD *)v43 + 6) = v64;
    v58(&v43[v42], v35, v41);
    sub_21C2B9F58(v34, (uint64_t)&unk_255255738, (uint64_t)v43);

    swift_release();
    return (*(uint64_t (**)(id, uint64_t))(v39 + 8))(v63, v41);
  }
  else
  {
    v45 = v63;
    v60 = (char *)v63;
    sub_21C2C23C0();
    if (qword_255255390 != -1)
      swift_once();
    sub_21C2C1D30();
    v46 = sub_21C294C84();
    objc_msgSend(v46, sel_notificationOccurred_, 0);

    v47 = (void *)sub_21C2C1BC8();
    sub_21C2C20FC();

    v48 = sub_21C294C04();
    v49 = v61;
    v59(v61, (uint64_t)v29, v26);
    v50 = v65;
    v51 = v29;
    v52 = v26;
    v53 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
    v54 = swift_allocObject();
    v55 = v60;
    *(_QWORD *)(v54 + 16) = v23;
    *(_QWORD *)(v54 + 24) = v55;
    v58((char *)(v54 + v53), v49, v52);
    v56 = v64;
    sub_21C29CB38(v45, v64, 0);
    v57 = v23;
    sub_21C2A6790((uint64_t)sub_21C29CB08, v54, 0.8);

    swift_release();
    sub_21C29CB74(v45, v56, 0);

    return (*(uint64_t (**)(void *, uint64_t))(v50 + 8))(v51, v52);
  }
}

uint64_t sub_21C296670(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  v7 = a1;
  sub_21C298E34(a2, a3, (uint64_t)sub_21C29CBB0, v6);
  return swift_release();
}

void sub_21C2966E0()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v0 = sub_21C294C04();
  v1 = sub_21C2A60E8();
  sub_21C2A3E54((void (*)(id))nullsub_1, 0, 0.0);

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v0;
  v6[4] = sub_21C29D018;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21C2974B8;
  v6[3] = &block_descriptor_47;
  v4 = _Block_copy(v6);
  v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.0);
  _Block_release(v4);

}

uint64_t sub_21C2967E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7[48] = a6;
  v7[49] = a7;
  v7[46] = a4;
  v7[47] = a5;
  v8 = sub_21C2C1A00();
  v7[50] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[51] = v9;
  v7[52] = *(_QWORD *)(v9 + 64);
  v7[53] = swift_task_alloc();
  v10 = sub_21C2C2048();
  v7[54] = v10;
  v7[55] = *(_QWORD *)(v10 - 8);
  v7[56] = swift_task_alloc();
  v7[57] = swift_task_alloc();
  v11 = sub_21C2C200C();
  v7[58] = v11;
  v7[59] = *(_QWORD *)(v11 - 8);
  v7[60] = swift_task_alloc();
  v12 = sub_21C2C2030();
  v7[61] = v12;
  v7[62] = *(_QWORD *)(v12 - 8);
  v7[63] = swift_task_alloc();
  v13 = sub_21C2C19DC();
  v7[64] = v13;
  v7[65] = *(_QWORD *)(v13 - 8);
  v7[66] = swift_task_alloc();
  v14 = sub_21C2C1D78();
  v7[67] = v14;
  v7[68] = *(_QWORD *)(v14 - 8);
  v7[69] = swift_task_alloc();
  v7[70] = swift_task_alloc();
  sub_21C2C22DC();
  v7[71] = sub_21C2C22D0();
  v7[72] = sub_21C2C22C4();
  v7[73] = v15;
  return swift_task_switch();
}

uint64_t sub_21C296968()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  sub_21C2C1D54();
  v1 = sub_21C2C1D6C();
  v2 = sub_21C2C2360();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 134217984;
    v0[45] = 0x3FECCCCCC0000000;
    sub_21C2C2570();
    _os_log_impl(&dword_21C28F000, v1, v2, "LCS filtering criterion: %f", v3, 0xCu);
    MEMORY[0x2207794E8](v3, -1, -1);
  }

  v4 = v0[70];
  v5 = v0[67];
  v6 = v0[47];
  v7 = v0[46];
  v8 = *(void (**)(uint64_t, uint64_t))(v0[68] + 8);
  v0[74] = v8;
  v8(v4, v5);
  v9 = *(void **)(v7 + qword_2552555D0);
  v10 = sub_21C2C2324();
  v0[75] = v10;
  v0[7] = v0 + 39;
  v0[2] = v0;
  v0[3] = sub_21C296B18;
  v11 = swift_continuation_init();
  v0[28] = MEMORY[0x24BDAC760];
  v12 = v0 + 28;
  v12[1] = 0x40000000;
  v12[2] = sub_21C2B9ED0;
  v12[3] = &block_descriptor_48;
  v12[4] = v11;
  objc_msgSend(v9, sel_filter_transcripts_criterion_limit_completionHandler_, v6, v10, 10, v12, COERCE_DOUBLE(1063675494));
  return swift_continuation_await();
}

uint64_t sub_21C296B18()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 608) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21C296B78()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t (*v20)(uint64_t);
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t (*v31)(uint64_t);
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void *v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;

  v1 = (void *)v0[75];
  swift_release();
  v2 = (void *)v0[39];

  if (qword_2552553A0 != -1)
    swift_once();
  v3 = v0[66];
  v4 = v0[65];
  v5 = v0[64];
  v6 = v0[49];
  swift_beginAccess();
  swift_retain();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_21C2AD9F0(v6, v8, 0, 0, 1, 0, 1);
  swift_release();
  swift_retain();
  sub_21C2ACC3C(v6, v2);
  swift_release();
  v9 = objc_msgSend(v2, sel_resolvedIds);
  sub_21C2943A8(0, &qword_255255740);
  v10 = sub_21C2C2270();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_21C2943A8(0, &qword_255255700);
  v12 = sub_21C2C239C();
  v13 = v0[63];
  v46 = (void *)v12;
  v48 = v0[62];
  v14 = v0[60];
  v50 = v0[61];
  v15 = v0[58];
  v44 = v0[59];
  if (v11)
  {
    v16 = v0[56];
    v34 = v0[57];
    v36 = v0[55];
    v43 = v0[54];
    v41 = v0[53];
    v42 = v0[52];
    v39 = v0[50];
    v37 = v0[51];
    v38 = v0[49];
    v17 = (void *)v0[46];
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v0[14] = sub_21C29CBB8;
    v0[15] = v18;
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 1107296256;
    v0[12] = sub_21C2974B8;
    v0[13] = &block_descriptor_54;
    v40 = v2;
    v19 = _Block_copy(v0 + 10);
    v35 = v17;
    sub_21C2C2024();
    v0[40] = MEMORY[0x24BEE4AF8];
    v20 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
    sub_21C293BF0(&qword_255255748, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    sub_21C29CBC0(0, &qword_255255750, v20, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C29CC18();
    sub_21C2C25A0();
    MEMORY[0x220778B1C](0, v13, v14, v19);
    _Block_release(v19);

    v47 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v47(v14, v15);
    v49 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v49(v13, v50);
    swift_release();
    v33 = (void *)sub_21C2C239C();
    sub_21C2C203C();
    MEMORY[0x2207787C8](v16, 0.1);
    v45 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v45(v16, v43);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v41, v38, v39);
    v21 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v22 = (v42 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
    v23 = swift_allocObject();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v37 + 32))(v23 + v21, v41, v39);
    *(_QWORD *)(v23 + v22) = v35;
    *(_QWORD *)(v23 + ((v22 + 15) & 0xFFFFFFFFFFFFFFF8)) = v40;
    v0[27] = v23;
    v0[26] = sub_21C29CD04;
    v0[22] = MEMORY[0x24BDAC760];
    v0[23] = 1107296256;
    v0[24] = sub_21C2974B8;
    v0[25] = &block_descriptor_60;
    v24 = _Block_copy(v0 + 22);
    v25 = v35;
    v26 = v40;
    sub_21C2C2024();
    v0[42] = MEMORY[0x24BEE4AF8];
    sub_21C2C25A0();
    MEMORY[0x220778AF8](v34, v13, v14, v24);
    _Block_release(v24);

    v47(v14, v15);
    v49(v13, v50);
    v45(v34, v43);
  }
  else
  {
    v27 = (void *)v0[46];
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v27;
    v0[21] = v28;
    v0[20] = sub_21C29CD50;
    v0[16] = MEMORY[0x24BDAC760];
    v0[17] = 1107296256;
    v0[18] = sub_21C2974B8;
    v0[19] = &block_descriptor_66;
    v29 = _Block_copy(v0 + 16);
    v30 = v27;
    sub_21C2C2024();
    v0[44] = MEMORY[0x24BEE4AF8];
    v31 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
    sub_21C293BF0(&qword_255255748, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    sub_21C29CBC0(0, &qword_255255750, v31, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C29CC18();
    sub_21C2C25A0();
    MEMORY[0x220778B1C](0, v13, v14, v29);
    _Block_release(v29);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v13, v50);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_21C297254()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;

  v1 = *(void **)(v0 + 608);
  v2 = *(void **)(v0 + 600);
  swift_release();
  swift_willThrow();

  sub_21C2C1D54();
  v3 = v1;
  v4 = v1;
  v5 = sub_21C2C1D6C();
  v6 = sub_21C2C2354();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 608);
    v18 = *(_QWORD *)(v0 + 552);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 592);
    v17 = *(_QWORD *)(v0 + 536);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v20 = v9;
    *(_DWORD *)v8 = 136446210;
    swift_getErrorValue();
    v10 = sub_21C2C2834();
    *(_QWORD *)(v0 + 328) = sub_21C2BE2B4(v10, v11, &v20);
    sub_21C2C2570();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21C28F000, v5, v6, "Filtering medication results failed, error: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v9, -1, -1);
    MEMORY[0x2207794E8](v8, -1, -1);

    v19(v18, v17);
  }
  else
  {
    v12 = *(void **)(v0 + 608);
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 592);
    v14 = *(_QWORD *)(v0 + 552);
    v15 = *(_QWORD *)(v0 + 536);

    v13(v14, v15);
  }
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

uint64_t sub_21C2974B8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21C2974E4()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v0 = sub_21C294C04();
  v1 = sub_21C2A60E8();
  sub_21C2A1954((void (*)())nullsub_1, 0, 0.5);

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v0;
  v6[4] = sub_21C29CD78;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21C2974B8;
  v6[3] = &block_descriptor_85;
  v4 = _Block_copy(v6);
  v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.5);
  _Block_release(v4);

}

void sub_21C2975E0(uint64_t a1, char *a2, void *a3)
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
  void *v17;
  id v18;
  char *v19;
  char *v20;
  void *v21;
  _QWORD aBlock[6];

  v6 = sub_21C2C1A00();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C2C19DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  swift_retain();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_21C2AD9F0(a1, 0, 1, 0, 1, v15, 0);
  swift_release();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  v17 = *(void **)&a2[qword_2552555C0];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v18 = objc_allocWithZone((Class)type metadata accessor for MedicationScanMultiResultsViewController());
  v19 = a2;
  v20 = sub_21C291F30(v17, a3, (uint64_t)v9);
  *(_QWORD *)&v20[qword_255256850 + 8] = &off_24E0274D0;
  swift_unknownObjectWeakAssign();
  aBlock[4] = sub_21C29CD70;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C2974B8;
  aBlock[3] = &block_descriptor_72;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_presentViewController_animated_completion_, v20, 1, v21);
  _Block_release(v21);
  swift_release();

}

void sub_21C297860()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v0 = sub_21C294C04();
  v1 = sub_21C2A60E8();
  sub_21C2A3E54((void (*)(id))nullsub_1, 0, 0.0);

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v0;
  v6[4] = sub_21C29D018;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21C2974B8;
  v6[3] = &block_descriptor_79;
  v4 = _Block_copy(v6);
  v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.0);
  _Block_release(v4);

}

void sub_21C29795C()
{
  uint64_t v0;
  void *v1;

  v0 = sub_21C2C1D78();
  MEMORY[0x24BDAC7A8](v0);
  v1 = (void *)sub_21C2C1BC8();
  sub_21C2C2108();

}

id sub_21C297A9C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t ObjCClassFromMetadata;
  id v8;
  void *v9;
  id result;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  CGRect v27;

  v1 = v0;
  v2 = sub_21C2C1B44();
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v0[qword_2552555A0];
  *(_QWORD *)v5 = 2;
  v5[8] = 0;
  v6 = &v0[qword_2552555A8];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  type metadata accessor for MedicationDataScannerViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = (void *)sub_21C2C21A4();
  v26 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v9, v8);

  if (qword_255255398 != -1)
    swift_once();
  sub_21C2C1940();
  sub_21C2C1940();
  sub_21C2C1940();
  sub_21C2C1C28();
  sub_21C2C1C10();
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v11 = result;
    objc_msgSend(result, sel_bounds);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v27.origin.x = v13;
    v27.origin.y = v15;
    v27.size.width = v17;
    v27.size.height = v19;
    CGRectGetHeight(v27);
    (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v4, *MEMORY[0x24BE43858], v25);
    v20 = objc_allocWithZone((Class)sub_21C2C1CC4());
    v21 = sub_21C2C1CAC();
    sub_21C2C1F1C();
    sub_21C2C1CA0();
    v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v22;
    *(_QWORD *)(v23 + 24) = 2;
    swift_retain();
    sub_21C2C1C88();
    swift_release();

    return (id)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C297EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t, _QWORD, _QWORD);
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t result;
  void *v17;
  void *v18;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x220779584](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_21C2C1BBC();

  }
  swift_beginAccess();
  v6 = (char *)MEMORY[0x220779584](v3);
  if (v6)
  {
    v7 = &v6[qword_2552555A0];
    *(_QWORD *)v7 = 0;
    v7[8] = 1;

  }
  swift_beginAccess();
  v8 = (char *)MEMORY[0x220779584](v3);
  if (v8)
  {
    v9 = &v8[qword_2552555A8];
    *(_QWORD *)v9 = 0;
    v9[8] = 1;

  }
  swift_beginAccess();
  v10 = MEMORY[0x220779584](v3);
  if (v10)
  {
    v11 = (void *)v10;
    sub_21C2C1BF8();
    v12 = (void (*)(uint64_t, uint64_t, _QWORD, _QWORD))sub_21C2C1C04();
    v12(a1, 1, 0, 0);
    v13 = sub_21C294C04();
    objc_msgSend(v13, sel_setAccessibilityElementsHidden_, 0);

  }
  swift_beginAccess();
  v14 = MEMORY[0x220779584](v3);
  if (v14)
  {
    v15 = (void *)v14;
    sub_21C295940(1);

  }
  swift_beginAccess();
  result = MEMORY[0x220779584](v3);
  if (result)
  {
    v17 = (void *)result;
    v18 = *(void **)(result + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    v18;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();

    return swift_release();
  }
  return result;
}

void sub_21C298110()
{
  id v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v0 = sub_21C294C04();
  v1 = (void *)sub_21C2C1BC8();
  v2 = (void *)sub_21C2C20D8();

  objc_msgSend(v2, sel_bounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(v0, sel_setFrame_, v4, v6, v8, v10);
  v11 = (void *)sub_21C2C1BC8();
  v12 = (void *)sub_21C2C20D8();

  v13 = sub_21C294C04();
  v14 = (id)sub_21C2C1BD4();
  objc_msgSend(v12, sel_insertSubview_belowSubview_, v13, v14);

}

void sub_21C298200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21C298230(a1, a2, a3, a4, MEMORY[0x24BE445E8], 1);
}

void sub_21C298210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21C298230(a1, a2, a3, a4, MEMORY[0x24BE445C8], 1);
}

void sub_21C298220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21C298230(a1, a2, a3, a4, MEMORY[0x24BE445C0], 0);
}

void sub_21C298230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v12;

  sub_21C2C1BF8();
  v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21C2C1C04();
  v11(a1, a2, a3, a4);
  v12 = sub_21C294C04();
  objc_msgSend(v12, sel_setAccessibilityElementsHidden_, a6 & 1);

}

void sub_21C2982C4()
{
  void (*v0)(void);

  sub_21C2C1BF8();
  v0 = (void (*)(void))sub_21C2C1C04();
  v0();
  _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0();
}

void _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
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
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t aBlock[6];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = sub_21C2C1D78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1D54();
  v7 = sub_21C2C1D6C();
  v8 = sub_21C2C2360();
  if (os_log_type_enabled(v7, v8))
  {
    v20 = v3;
    v9 = swift_slowAlloc();
    v21 = ObjectType;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = sub_21C2C28AC();
    v22 = sub_21C2BE2B4(v12, v13, aBlock);
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v7, v8, "[%{public}s] Querying for ontology shard registry entries", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v11, -1, -1);
    v14 = v10;
    ObjectType = v21;
    MEMORY[0x2207794E8](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v15 = *(void **)(v1 + qword_2552555C8);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = ObjectType;
  aBlock[4] = (uint64_t)sub_21C29CD88;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21C29AAC8;
  aBlock[3] = (uint64_t)&block_descriptor_98;
  v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_ontologyShardRegistryEntriesWithCompletion_, v18);
  _Block_release(v18);
}

void sub_21C298554()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void (*v16)(id, uint64_t, _QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;

  v0 = sub_21C2C1B44();
  v21 = *(_QWORD *)(v0 - 8);
  v22 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend((id)objc_opt_self(), sel_configurationWithScale_, 2);
  v4 = (void *)sub_21C2C21A4();
  v5 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v4, v3);

  v24 = v3;
  if (qword_255255398 != -1)
    swift_once();
  v6 = sub_21C2C1940();
  v20[1] = v7;
  v20[2] = v6;
  sub_21C2C1940();
  sub_21C2C1940();
  v23 = v5;
  sub_21C2C1940();
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v2, *MEMORY[0x24BE43858], v22);
  v8 = objc_allocWithZone((Class)sub_21C2C1CC4());
  v9 = (void *)sub_21C2C1CAC();
  v10 = swift_allocObject();
  v11 = v20[3];
  swift_unknownObjectWeakInit();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = 11;
  swift_retain();
  sub_21C2C1C88();
  swift_release();
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v13;
  v14[3] = 11;
  v14[4] = v9;
  swift_retain();
  v15 = v9;
  sub_21C2C1C94();
  swift_release();
  sub_21C2C1BF8();
  v16 = (void (*)(id, uint64_t, _QWORD, _QWORD))sub_21C2C1C04();
  v16(v15, 1, 0, 0);
  v17 = sub_21C294C04();
  objc_msgSend(v17, sel_setAccessibilityElementsHidden_, 1);

  v18 = v11 + qword_2552555A0;
  *(_QWORD *)v18 = 11;
  *(_BYTE *)(v18 + 8) = 0;
  v19 = v11 + qword_2552555A8;
  *(_QWORD *)v19 = 0;
  *(_BYTE *)(v19 + 8) = 1;
}

uint64_t sub_21C2989A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t result;
  void *v15;
  void *v16;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (char *)MEMORY[0x220779584](v2);
  if (v3)
  {
    v4 = &v3[qword_2552555A0];
    *(_QWORD *)v4 = 0;
    v4[8] = 1;

  }
  swift_beginAccess();
  v5 = (char *)MEMORY[0x220779584](v2);
  if (v5)
  {
    v6 = &v5[qword_2552555A8];
    *(_QWORD *)v6 = 0;
    v6[8] = 1;

  }
  swift_beginAccess();
  v7 = MEMORY[0x220779584](v2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(_QWORD *)(v7 + qword_255255598);
    swift_retain();

    if (v9)
    {
      sub_21C2C1A54();
      objc_msgSend(*(id *)(v9 + 64), sel_invalidate);
      v10 = *(void **)(v9 + 64);
      *(_QWORD *)(v9 + 64) = 0;

      sub_21C2C1A60();
      swift_release();
    }
  }
  swift_beginAccess();
  v11 = (char *)MEMORY[0x220779584](v2);
  if (v11)
  {
    *(_QWORD *)&v11[qword_255255598] = 0;

    swift_release();
  }
  swift_beginAccess();
  v12 = (void *)MEMORY[0x220779584](v2);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
  swift_beginAccess();
  result = MEMORY[0x220779584](v2);
  if (result)
  {
    v15 = (void *)result;
    v16 = *(void **)(result + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    v16;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();

    return swift_release();
  }
  return result;
}

void sub_21C298C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  void *v18;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x220779584](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = *(void **)(v6 + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    v8;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();

    swift_release();
  }
  swift_beginAccess();
  v9 = (char *)MEMORY[0x220779584](v5);
  if (v9)
  {
    v10 = &v9[qword_2552555A0];
    *(_QWORD *)v10 = 0;
    v10[8] = 1;

  }
  swift_beginAccess();
  v11 = (char *)MEMORY[0x220779584](v5);
  if (v11)
  {
    v12 = &v11[qword_2552555A8];
    *(_QWORD *)v12 = 0;
    v12[8] = 1;

  }
  swift_beginAccess();
  v13 = MEMORY[0x220779584](v5);
  if (v13)
  {
    v14 = (void *)v13;
    sub_21C2C1BF8();
    v15 = (void (*)(uint64_t, uint64_t, _QWORD, _QWORD))sub_21C2C1C04();
    v15(a4, 1, 0, 0);
    v16 = sub_21C294C04();
    objc_msgSend(v16, sel_setAccessibilityElementsHidden_, 0);

  }
  swift_beginAccess();
  v17 = MEMORY[0x220779584](v5);
  if (v17)
  {
    v18 = (void *)v17;
    sub_21C295940(1);

  }
}

uint64_t sub_21C298E34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  id v42;
  void *v43;
  uint64_t v44;
  _BOOL8 v45;
  _QWORD *v46;
  void (*v47)(void *, uint64_t, uint64_t, uint64_t);
  id v48;
  uint64_t v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL8 v69;
  __int128 v70;

  v65 = a4;
  v64 = a3;
  v61 = a2;
  v5 = sub_21C2C1A00();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v67 = *(_QWORD *)(v5 - 8);
  v68 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v60 = v7;
  v62 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_21C2C1D78();
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v53 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_2552556E0, v6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v52 - v10;
  v12 = sub_21C2C1B44();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21C2C2414();
  v58 = v17;
  v59 = v16;
  v63 = a1;
  v18 = sub_21C2C2420();
  if (v19)
    v20 = v18;
  else
    v20 = 0;
  if (v19)
    v21 = v19;
  else
    v21 = 0xE000000000000000;
  v56 = v21;
  v57 = v20;
  if (qword_255255398 != -1)
    swift_once();
  sub_21C2C1940();
  sub_21C2C1940();
  sub_21C2C1C28();
  sub_21C2C1C1C();
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE43858], v12);
  v22 = objc_allocWithZone((Class)sub_21C2C1CC4());
  v59 = sub_21C2C1CAC();
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  v24 = v67;
  v23 = v68;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 16);
  v26 = v61;
  v25(v11, v61, v68);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v11, 0, 1, v23);
  swift_retain();
  v27 = v63;
  v28 = objc_msgSend(v63, sel_specificProduct);
  v29 = objc_msgSend(v28, sel_identifier);

  sub_21C2ADD58((uint64_t)v11, 0, v29, &v70);
  swift_release();

  sub_21C29C534((uint64_t)v11, &qword_2552556E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v69 = 0;
  if (BYTE8(v70) == 2)
  {
    v30 = v53;
    sub_21C2C1D60();
    v31 = sub_21C2C1D6C();
    v32 = sub_21C2C2354();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_21C28F000, v31, v32, "[MedicationsListOnboardingAnalytics] Failed to calculate algorithmType because ScanningSessionLogger returned a null value.", v33, 2u);
      MEMORY[0x2207794E8](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v55);
  }
  else
  {
    v69 = (BYTE8(v70) & 1) == 0;
  }
  v34 = swift_allocObject();
  v35 = v66;
  swift_unknownObjectWeakInit();
  v36 = v62;
  v37 = v68;
  v25(v62, v26, v68);
  v38 = v69;
  v39 = v67;
  v40 = (*(unsigned __int8 *)(v67 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  v41 = (char *)swift_allocObject();
  *((_QWORD *)v41 + 2) = v34;
  *((_QWORD *)v41 + 3) = 3;
  *((_QWORD *)v41 + 4) = v38;
  *((_QWORD *)v41 + 5) = v27;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v41[v40], v36, v37);
  swift_retain();
  v42 = v27;
  v43 = (void *)v59;
  sub_21C2C1C88();
  swift_release();
  v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v45 = v69;
  v46 = (_QWORD *)swift_allocObject();
  v46[2] = v44;
  v46[3] = 3;
  v46[4] = v45;
  swift_retain();
  sub_21C2C1C94();
  swift_release();
  sub_21C2C1BF8();
  v47 = (void (*)(void *, uint64_t, uint64_t, uint64_t))sub_21C2C1C04();
  v47(v43, 1, v64, v65);
  v48 = sub_21C294C04();
  objc_msgSend(v48, sel_setAccessibilityElementsHidden_, 1);

  v49 = v35 + qword_2552555A0;
  *(_QWORD *)v49 = 3;
  *(_BYTE *)(v49 + 8) = 0;
  result = swift_beginAccess();
  v51 = v35 + qword_2552555A8;
  *(_QWORD *)v51 = v69;
  *(_BYTE *)(v51 + 8) = 0;
  return result;
}

uint64_t sub_21C29948C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t result;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t ObjectType;
  id v19;
  void (*v20)(char *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;

  v9 = a2 + 16;
  swift_beginAccess();
  result = MEMORY[0x220779584](v9);
  if (result)
  {
    v11 = (char *)result;
    v12 = result + qword_2552555A0;
    *(_QWORD *)v12 = 0;
    *(_BYTE *)(v12 + 8) = 1;
    v13 = result + qword_2552555A8;
    *(_QWORD *)v13 = 0;
    *(_BYTE *)(v13 + 8) = 1;
    v14 = *(_QWORD *)(result + qword_2552555B8);
    v15 = *(void **)(result + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    LOBYTE(v25) = 0;
    v24 = v15;
    LOBYTE(v23) = 0;
    LOBYTE(v22) = 1;
    LOWORD(v21) = 513;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();
    v16 = &v11[qword_255255560];
    swift_beginAccess();
    if (MEMORY[0x220779584](v16))
    {
      v17 = *((_QWORD *)v16 + 1);
      ObjectType = swift_getObjectType();
      v19 = objc_msgSend(a5, sel_specificProduct, v21, 0, v22, a4, v23, v24, v25);
      v20 = *(void (**)(char *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
      swift_retain();
      v20(v11, v19, a6, v14, 2, ObjectType, v17);

      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {

      return swift_release();
    }
  }
  return result;
}

void sub_21C299680(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void (*v10)(uint64_t, _QWORD, _QWORD, _QWORD);
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD aBlock[6];

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = (char *)MEMORY[0x220779584](v3);
  if (v4)
  {
    v5 = &v4[qword_2552555A0];
    *(_QWORD *)v5 = 0;
    v5[8] = 1;

  }
  swift_beginAccess();
  v6 = (char *)MEMORY[0x220779584](v3);
  if (v6)
  {
    v7 = &v6[qword_2552555A8];
    *(_QWORD *)v7 = 0;
    v7[8] = 1;

  }
  swift_beginAccess();
  v8 = MEMORY[0x220779584](v3);
  if (v8)
  {
    v9 = (void *)v8;
    sub_21C2C1BF8();
    v10 = (void (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_21C2C1C04();
    v10(a1, 0, 0, 0);
    v11 = sub_21C294C04();
    objc_msgSend(v11, sel_setAccessibilityElementsHidden_, 0);

  }
  swift_beginAccess();
  v12 = MEMORY[0x220779584](v3);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(void **)(v12 + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    v14;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();

    swift_release();
  }
  swift_beginAccess();
  v15 = MEMORY[0x220779584](v3);
  if (v15)
  {
    v16 = (void *)v15;
    v17 = sub_21C294C04();

    v18 = sub_21C2A60E8();
    sub_21C2A3E54((void (*)(id))nullsub_1, 0, 0.3);

    v19 = (void *)objc_opt_self();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v17;
    aBlock[4] = sub_21C29C68C;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21C2974B8;
    aBlock[3] = &block_descriptor;
    v21 = _Block_copy(aBlock);
    v22 = v17;
    swift_release();
    objc_msgSend(v19, sel_animateWithDuration_animations_, v21, 0.3);
    _Block_release(v21);

  }
  swift_beginAccess();
  v23 = MEMORY[0x220779584](v3);
  if (v23)
  {
    v24 = (void *)v23;
    sub_21C295940(1);

  }
}

uint64_t sub_21C2999BC(void *a1)
{
  id v2;
  uint64_t v4;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_21C2C2594();
  swift_unknownObjectRelease();
  sub_21C293538();

  return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v4);
}

uint64_t sub_21C299A18()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t (*v7)(void);

  v1 = v0 + qword_2552555A0;
  if ((*(_BYTE *)(v0 + qword_2552555A0 + 8) & 1) == 0)
  {
    v2 = *(void **)(v0 + qword_2552555C0);
    sub_21C2C1D0C();
    swift_allocObject();
    swift_retain();
    v2;
    sub_21C2C1D00();
    sub_21C2C1D24();
    sub_21C2C1D18();
    swift_release();
  }
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
  v3 = v0 + qword_2552555A8;
  *(_QWORD *)v3 = 0;
  *(_BYTE *)(v3 + 8) = 1;
  v4 = qword_255255598;
  v5 = *(_QWORD *)(v0 + qword_255255598);
  if (v5)
  {
    swift_retain();
    sub_21C2C1A54();
    objc_msgSend(*(id *)(v5 + 64), sel_invalidate);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = 0;

    sub_21C2C1A60();
    swift_release();
  }
  *(_QWORD *)(v0 + v4) = 0;
  swift_release();
  sub_21C2C1BF8();
  v7 = (uint64_t (*)(void))sub_21C2C1C04();
  return v7();
}

void sub_21C299BBC(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C299A18();

}

id MedicationDataScannerViewController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MedicationDataScannerViewController.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_21C299C3C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_21C299C68()
{
  uint64_t v0;

  sub_21C294154(v0 + qword_255255560);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

}

id MedicationDataScannerViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21C299DB8(uint64_t a1)
{
  sub_21C294154(a1 + qword_255255560);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

}

uint64_t MedicationDataScannerViewController.ontologyStore(_:didImport:)(uint64_t a1, void *a2)
{
  uint64_t inited;
  id v4;
  unint64_t v6;

  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C2C38A0;
  *(_QWORD *)(inited + 32) = a2;
  v6 = inited;
  sub_21C2C2288();
  v4 = a2;
  sub_21C299F7C(v6);
  return swift_bridgeObjectRelease();
}

void sub_21C299F7C(unint64_t a1)
{
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  char *v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;

  ObjectType = swift_getObjectType();
  v4 = sub_21C2C1D78();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v52 - v9;
  v11 = (void *)sub_21C2C1BB0();

  if (!v11)
    return;
  v56 = v5;
  v57 = v4;
  v52 = v1;
  v53 = v10;
  v54 = ObjectType;
  v55 = v8;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    v12 = sub_21C2C26CC();
    if (v12)
      goto LABEL_4;
LABEL_29:
    swift_bridgeObjectRelease();
    v45 = v55;
    sub_21C2C1D54();
    v46 = sub_21C2C1D6C();
    v47 = sub_21C2C2360();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v61 = v49;
      *(_DWORD *)v48 = 136446210;
      v50 = sub_21C2C28AC();
      v60 = (id)sub_21C2BE2B4(v50, v51, &v61);
      sub_21C2C2570();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C28F000, v46, v47, "[%{public}s] Failed to find PBS shard in registry entries.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v49, -1, -1);
      MEMORY[0x2207794E8](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v45, v57);
    return;
  }
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v12)
    goto LABEL_29;
LABEL_4:
  v59 = a1 & 0xC000000000000001;
  v58 = *MEMORY[0x24BDD32C0];
  v13 = 4;
  while (1)
  {
    if (v59)
      v14 = (id)MEMORY[0x220778DC8](v13 - 4, a1);
    else
      v14 = *(id *)(a1 + 8 * v13);
    v15 = v14;
    v16 = v13 - 3;
    if (__OFADD__(v13 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    v17 = objc_msgSend(v14, sel_identifier, v52);
    v18 = sub_21C2C21C8();
    v20 = v19;
    if (v18 == sub_21C2C21C8() && v20 == v21)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v23 = sub_21C2C2804();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
        goto LABEL_7;
    }
    v24 = objc_msgSend(v15, sel_schemaType);
    v25 = sub_21C2C21C8();
    v27 = v26;
    if (v25 == sub_21C2C21C8() && v27 == v28)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v29 = sub_21C2C2804();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
        goto LABEL_7;
    }
    if (objc_msgSend(v15, sel_schemaVersion) == (id)2)
      break;
LABEL_7:

    ++v13;
    if (v16 == v12)
      goto LABEL_29;
  }
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v15, sel_currentVersion);
  v31 = v53;
  sub_21C2C1D54();
  v32 = v15;
  v33 = sub_21C2C1D6C();
  v34 = sub_21C2C2360();
  if (os_log_type_enabled(v33, v34))
  {
    LODWORD(v58) = (uint64_t)v30 > 0;
    v35 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v61 = v36;
    *(_DWORD *)v35 = 136446978;
    v59 = (unint64_t)v30;
    v37 = sub_21C2C28AC();
    v60 = (id)sub_21C2BE2B4(v37, v38, &v61);
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2082;
    objc_msgSend(v32, sel_availableState);
    v39 = (id)HKStringFromOntologyShardState();
    v40 = sub_21C2C21C8();
    v42 = v41;

    v60 = (id)sub_21C2BE2B4(v40, v42, &v61);
    sub_21C2C2570();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 1026;
    LODWORD(v60) = v58;
    sub_21C2C2570();
    *(_WORD *)(v35 + 28) = 2082;
    v60 = objc_msgSend(v32, sel_currentVersion);
    v43 = sub_21C2C27EC();
    v60 = (id)sub_21C2BE2B4(v43, v44, &v61);
    v30 = (id)v59;
    sub_21C2C2570();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v33, v34, "[%{public}s] Current PBS availability state: %{public}s, isImported: %{BOOL,public}d, currentVersion: %{public}s", (uint8_t *)v35, 0x26u);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v36, -1, -1);
    MEMORY[0x2207794E8](v35, -1, -1);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v57);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v56 + 8))(v31, v57);
  }
  LOBYTE(v61) = (uint64_t)v30 > 0;
  sub_21C2C1F10();

}

void sub_21C29A5F0(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t inited;
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C2C38A0;
  *(_QWORD *)(inited + 32) = a4;
  v11 = inited;
  sub_21C2C2288();
  v8 = a4;
  v9 = a3;
  v10 = a1;
  sub_21C299F7C(v11);
  swift_bridgeObjectRelease();

}

void sub_21C29A6B4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC13ontologyStore12didReconnectySo010HKOntologyK0C_tF_0();

}

void sub_21C29A700(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = sub_21C2C1D78();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  swift_beginAccess();
  v13 = MEMORY[0x220779584](a3 + 16);
  if (v13)
  {
    v14 = (void *)v13;
    if (a2)
    {
      v15 = a2;
      sub_21C2C1D54();
      v16 = a2;
      v17 = a2;
      v18 = sub_21C2C1D6C();
      v19 = sub_21C2C2354();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = swift_slowAlloc();
        v34 = swift_slowAlloc();
        v36 = v34;
        *(_DWORD *)v20 = 136446466;
        v21 = sub_21C2C28AC();
        v35 = sub_21C2BE2B4(v21, v22, &v36);
        sub_21C2C2570();
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2082;
        v35 = (uint64_t)a2;
        v23 = a2;
        sub_21C29CD90();
        v24 = sub_21C2C21EC();
        v35 = sub_21C2BE2B4(v24, v25, &v36);
        sub_21C2C2570();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21C28F000, v18, v19, "[%{public}s] Failed to get ontology shard registry entries, error: %{public}s", (uint8_t *)v20, 0x16u);
        v26 = v34;
        swift_arrayDestroy();
        MEMORY[0x2207794E8](v26, -1, -1);
        MEMORY[0x2207794E8](v20, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      sub_21C299F7C(MEMORY[0x24BEE4AF8]);

    }
    else
    {
      if (a1)
      {
        v27 = a1;
      }
      else
      {
        sub_21C2C1D54();
        v28 = sub_21C2C1D6C();
        v29 = sub_21C2C2354();
        if (os_log_type_enabled(v28, (os_log_type_t)v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          v31 = swift_slowAlloc();
          v36 = v31;
          *(_DWORD *)v30 = 136446210;
          v34 = (uint64_t)(v30 + 4);
          v32 = sub_21C2C28AC();
          v35 = sub_21C2BE2B4(v32, v33, &v36);
          sub_21C2C2570();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21C28F000, v28, (os_log_type_t)v29, "[%{public}s] Failed to get ontology shard registry entries, entries were unexpectedly nil.", v30, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207794E8](v31, -1, -1);
          MEMORY[0x2207794E8](v30, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        v27 = MEMORY[0x24BEE4AF8];
      }
      sub_21C299F7C(v27);
    }

  }
}

uint64_t sub_21C29AAC8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_21C2943A8(0, &qword_255255760);
    v4 = sub_21C2C2270();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21C29AB54(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v3 = sub_21C2C1D78();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  if (a2)
  {
    v10 = a2;
    sub_21C2C1D54();
    v11 = a2;
    v12 = a2;
    v13 = sub_21C2C1D6C();
    v14 = sub_21C2C2354();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v30 = v16;
      *(_DWORD *)v15 = 136446466;
      v17 = sub_21C2C28AC();
      v29 = sub_21C2BE2B4(v17, v18, &v30);
      sub_21C2C2570();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      v29 = (uint64_t)a2;
      v19 = a2;
      sub_21C29CD90();
      v20 = sub_21C2C21EC();
      v29 = sub_21C2BE2B4(v20, v21, &v30);
      sub_21C2C2570();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21C28F000, v13, v14, "[%{public}s] Failed to mark vision shards as required, error: %{public}s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v16, -1, -1);
      MEMORY[0x2207794E8](v15, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    sub_21C2C1D54();
    v22 = sub_21C2C1D6C();
    v23 = sub_21C2C2360();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v30 = v25;
      *(_DWORD *)v24 = 136446210;
      v26 = sub_21C2C28AC();
      v29 = sub_21C2BE2B4(v26, v27, &v30);
      sub_21C2C2570();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21C28F000, v22, v23, "[%{public}s] Marked vision shards as required", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v25, -1, -1);
      MEMORY[0x2207794E8](v24, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
}

void sub_21C29AEB8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_21C29AF18(void *a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
  sub_21C295940(1);
  v2 = *(void **)(v1 + qword_2552555C0);
  sub_21C2C1D0C();
  swift_allocObject();
  swift_retain();
  v2;
  sub_21C2C1D00();
  sub_21C2C1D24();
  sub_21C2C1D18();
  return swift_release();
}

uint64_t sub_21C29AFFC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void *v10;

  v4 = v3;
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 0, 0);
  v7 = v4 + qword_255255560;
  swift_beginAccess();
  if (MEMORY[0x220779584](v7))
  {
    v8 = *(_QWORD *)(v7 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(v8 + 8))(v4, a2, a3, *(_QWORD *)(v4 + qword_2552555B8), 3, ObjectType, v8);
    swift_unknownObjectRelease();
  }
  v10 = *(void **)(v4 + qword_2552555C0);
  sub_21C2C1D0C();
  swift_allocObject();
  swift_retain();
  v10;
  sub_21C2C1D00();
  sub_21C2C1D24();
  sub_21C2C1D18();
  return swift_release();
}

uint64_t MedicationDataScannerViewController.dataScanner(_:didAdd:allItems:)(uint64_t a1, uint64_t a2)
{
  return sub_21C29B9A0(a2, "%{public}s Item added: %{sensitive}s");
}

uint64_t MedicationDataScannerViewController.dataScanner(_:didUpdate:allItems:)(uint64_t a1, uint64_t a2)
{
  return sub_21C29B9A0(a2, "%{public}s Item updated: %{sensitive}s");
}

uint64_t sub_21C29B1B4(uint64_t a1, uint64_t a2)
{
  return sub_21C29B9A0(a2, "%{public}s Item added: %{sensitive}s");
}

uint64_t sub_21C29B1D4(uint64_t a1, uint64_t a2)
{
  return sub_21C29B9A0(a2, "%{public}s Item updated: %{sensitive}s");
}

uint64_t MedicationDataScannerViewController.dataScannerDidUpdateSceneStabilityState(_:newState:)(uint64_t a1, uint64_t a2)
{
  return sub_21C29BC14(a2);
}

uint64_t sub_21C29B204(uint64_t a1, uint64_t a2)
{
  return sub_21C29BC14(a2);
}

uint64_t sub_21C29B210()
{
  return sub_21C29B220();
}

uint64_t sub_21C29B218()
{
  return sub_21C29B220();
}

uint64_t sub_21C29B220()
{
  char *v0;
  id v1;
  void *v2;
  void *v3;

  v1 = objc_msgSend(v0, sel_presentingViewController);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
  v3 = *(void **)&v0[qword_2552555C0];
  sub_21C2C1D0C();
  swift_allocObject();
  swift_retain();
  v3;
  sub_21C2C1D00();
  sub_21C2C1D24();
  sub_21C2C1D18();
  return swift_release();
}

uint64_t sub_21C29B324(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_21C2C20C0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_21C29CF54();
    v10 = sub_21C2C2618();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_21C293BF0(&qword_2552557A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFA0D0], MEMORY[0x24BDFA0E0]);
      v14 = sub_21C2C2180();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_21C293BF0(&qword_2552557A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFA0D0], MEMORY[0x24BDFA0E8]);
          v20 = sub_21C2C2198();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t type metadata accessor for MedicationDataScannerViewController()
{
  uint64_t result;

  result = qword_255255628;
  if (!qword_255255628)
    return swift_getSingletonMetadata();
  return result;
}

id sub_21C29B5C4(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  objc_super v15;
  char v16;

  *(_QWORD *)&v2[qword_255255560 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v2[qword_255255598] = 0;
  v5 = qword_2552555B0;
  v16 = 0;
  sub_21C29C4D0();
  swift_allocObject();
  v6 = v2;
  *(_QWORD *)&v2[v5] = sub_21C2C1F34();
  v7 = qword_2552555D8;
  sub_21C2C1A78();
  swift_allocObject();
  *(_QWORD *)&v6[v7] = sub_21C2C1A6C();
  v8 = qword_2552555E0;
  *(_QWORD *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDFD70]), sel_initWithUnit_, 0);
  v9 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[qword_2552555E8] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[qword_2552555F0] = v9;
  *(_QWORD *)&v6[qword_2552555F8] = v9;
  *(_QWORD *)&v6[qword_255255600] = 0;
  *(_QWORD *)&v6[qword_255255608] = 0;
  *(_QWORD *)&v6[qword_255255610] = 0;
  v10 = &v6[qword_2552555A8];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v6[qword_2552555A0];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  *(_QWORD *)&v6[qword_255255618] = 0;
  *(_QWORD *)&v6[qword_255255620] = 0;
  *(_QWORD *)&v6[qword_2552555C0] = a1;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3DF0]), sel_initWithHealthStore_, a1);
  *(_QWORD *)&v6[qword_2552555C8] = v12;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE467F0]), sel_init);
  *(_QWORD *)&v6[qword_2552555D0] = v13;
  *(_QWORD *)&v6[qword_2552555B8] = a2;
  swift_retain();

  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for MedicationDataScannerViewController();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_21C29B7D4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21C29B7F8(uint64_t a1)
{
  uint64_t v1;

  return sub_21C297EB8(a1, *(_QWORD *)(v1 + 16));
}

void sub_21C29B800()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;

  v1 = v0;
  *(_QWORD *)&v0[qword_255255560 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[qword_255255598] = 0;
  v2 = qword_2552555B0;
  sub_21C29C4D0();
  swift_allocObject();
  *(_QWORD *)&v0[v2] = sub_21C2C1F34();
  v3 = qword_2552555D8;
  sub_21C2C1A78();
  swift_allocObject();
  *(_QWORD *)&v0[v3] = sub_21C2C1A6C();
  v4 = qword_2552555E0;
  *(_QWORD *)&v1[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDFD70]), sel_initWithUnit_, 0);
  v5 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v1[qword_2552555E8] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v1[qword_2552555F0] = v5;
  *(_QWORD *)&v1[qword_2552555F8] = v5;
  *(_QWORD *)&v1[qword_255255600] = 0;
  *(_QWORD *)&v1[qword_255255608] = 0;
  *(_QWORD *)&v1[qword_255255610] = 0;
  v6 = &v1[qword_2552555A8];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = &v1[qword_2552555A0];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(_QWORD *)&v1[qword_255255618] = 0;
  *(_QWORD *)&v1[qword_255255620] = 0;

  sub_21C2C26C0();
  __break(1u);
}

uint64_t sub_21C29B9A0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = v2;
  swift_getObjectType();
  v6 = sub_21C2C1D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1D54();
  swift_bridgeObjectRetain_n();
  v10 = sub_21C2C1D6C();
  v11 = sub_21C2C2348();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v25 = a2;
    v13 = v12;
    v14 = swift_slowAlloc();
    v29 = v14;
    *(_DWORD *)v13 = 136446467;
    v26 = v7;
    v15 = sub_21C2C28AC();
    v17 = sub_21C2BE2B4(v15, v16, &v29);
    v27 = v4;
    v28 = v17;
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2085;
    v18 = sub_21C2C209C();
    v19 = swift_bridgeObjectRetain();
    v20 = MEMORY[0x2207789F0](v19, v18);
    v24 = v6;
    v22 = v21;
    swift_bridgeObjectRelease();
    v28 = sub_21C2BE2B4(v20, v22, &v29);
    v4 = v27;
    sub_21C2C2570();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v10, v11, v25, (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v14, -1, -1);
    MEMORY[0x2207794E8](v13, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v9, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (*(_QWORD *)(v4 + qword_255255598))
  {
    swift_retain();
    sub_21C2BA7FC(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_21C29BC14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  swift_getObjectType();
  v2 = sub_21C2C2144();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v38 - v9;
  v11 = sub_21C2C1D78();
  v43 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1D54();
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v46(v10, a1, v2);
  v14 = sub_21C2C1D6C();
  v15 = sub_21C2C2348();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v42 = a1;
    v17 = v16;
    v39 = swift_slowAlloc();
    v48 = v39;
    *(_DWORD *)v17 = 136446467;
    v40 = v11;
    v18 = sub_21C2C28AC();
    v47 = sub_21C2BE2B4(v18, v19, &v48);
    v41 = v3;
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2085;
    v46(v8, (uint64_t)v10, v2);
    v20 = sub_21C2C21EC();
    v47 = sub_21C2BE2B4(v20, v21, &v48);
    v3 = v41;
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v10, v2);
    _os_log_impl(&dword_21C28F000, v14, v15, "%{public}s Camera stability updated: %{sensitive}s", (uint8_t *)v17, 0x16u);
    v23 = v39;
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v23, -1, -1);
    v24 = v17;
    a1 = v42;
    MEMORY[0x2207794E8](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v40);
  }
  else
  {
    v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v10, v2);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v11);
  }
  v25 = v44;
  v46(v44, a1, v2);
  v26 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v25, v2);
  v27 = *MEMORY[0x24BDFA178];
  v28 = *MEMORY[0x24BDFA170];
  v29 = v45;
  sub_21C294C04();
  if (v26 == v27 || v26 == v28)
  {
    if (qword_255255398 != -1)
      swift_once();
    v31 = sub_21C2C1940();
    v33 = v32;
    swift_getKeyPath();
    swift_getKeyPath();
    v48 = v31;
    v49 = v33;
    result = sub_21C2C1F94();
  }
  else
  {
    if (qword_255255398 != -1)
      swift_once();
    v35 = sub_21C2C1940();
    v37 = v36;
    swift_getKeyPath();
    swift_getKeyPath();
    v48 = v35;
    v49 = v37;
    sub_21C2C1F94();
    result = ((uint64_t (*)(char *, uint64_t))v22)(v25, v2);
  }
  if (*(_QWORD *)(v29 + qword_255255598))
  {
    swift_retain();
    sub_21C2BB314(a1);
    return swift_release();
  }
  return result;
}

uint64_t _s25HealthMedicationsVisionUI35MedicationDataScannerViewControllerC04dataG24DidUpdateSceneLuminosity_03newN0y0C3Kit0fghI0C_SdtF_0(double a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  swift_getObjectType();
  v2 = sub_21C2C1D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1D54();
  v6 = sub_21C2C1D6C();
  v7 = sub_21C2C2348();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v14 = v9;
    *(_DWORD *)v8 = 136446467;
    v10 = sub_21C2C28AC();
    v13 = sub_21C2BE2B4(v10, v11, &v14);
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2053;
    v13 = *(_QWORD *)&a1;
    sub_21C2C2570();
    _os_log_impl(&dword_21C28F000, v6, v7, "%{public}s Camera luminosity updated: %{sensitive}f", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v9, -1, -1);
    MEMORY[0x2207794E8](v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21C29C2A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + qword_255255560;
  swift_beginAccess();
  result = MEMORY[0x220779584](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_21C29C2F8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + qword_255255560;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of MedicationDataScannerDelegate.medicationDataScanner(scanner:didRecognizeSingle:fromSession:analyticsContext:analyticsEntryMode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of MedicationDataScannerDelegate.medicationDataScannerDidFinishWithoutResult(scanner:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_21C29C368()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for MedicationDataScannerViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 152))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 160))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.scannerDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 168))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.__allocating_init(healthStore:analyticsContext:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController + v0 + 448))();
}

uint64_t dispatch thunk of MedicationDataScannerViewController.startScanning()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for MedicationDataScannerViewController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 472))();
}

uint64_t sub_21C29C4C8()
{
  return type metadata accessor for MedicationDataScannerViewController();
}

void sub_21C29C4D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552556D8)
  {
    v0 = sub_21C2C1F28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552556D8);
  }
}

uint64_t sub_21C29C534(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_21C29CBC0(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_21C29C578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21C2C1A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21C29C5F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_21C2C1A00() - 8) + 80);
  return sub_21C29948C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), v1 + ((v3 + 48) & ~v3));
}

uint64_t sub_21C29C638()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21C29C65C(uint64_t a1)
{
  uint64_t v1;

  sub_21C299680(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C29C668()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21C29C68C()
{
  sub_21C2A68F8();
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

uint64_t sub_21C29C6AC(uint64_t a1)
{
  uint64_t v1;

  return sub_21C2989A4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C29C6B4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_21C29C6E0(uint64_t a1)
{
  uint64_t *v1;

  sub_21C298C08(a1, v1[2], v1[3], v1[4]);
}

void sub_21C29C6EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552556F8)
  {
    sub_21C2944A4(255, &qword_2552556F0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9ED8]);
    sub_21C2943A8(255, &qword_255255700);
    sub_21C29C79C();
    sub_21C29C7FC();
    v0 = sub_21C2C1EC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552556F8);
  }
}

unint64_t sub_21C29C79C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255708;
  if (!qword_255255708)
  {
    sub_21C2944A4(255, &qword_2552556F0, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9ED8]);
    result = MEMORY[0x22077944C](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, (unint64_t *)&qword_255255708);
  }
  return result;
}

unint64_t sub_21C29C7FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255710;
  if (!qword_255255710)
  {
    v1 = sub_21C2943A8(255, &qword_255255700);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_255255710);
  }
  return result;
}

uint64_t sub_21C29C854()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21C2C1D48();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21C29C8C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_21C2C1D48() - 8) + 80);
  return sub_21C295E78(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_21C29C910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21C2C1A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21C29C99C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_21C2C1A00() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = (uint64_t)v1 + ((v4 + 56) & ~v4);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_21C29CA44;
  return sub_21C2967E0(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_21C29CA44()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21C29CA8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21C2C1A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21C29CB08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_21C2C1A00() - 8) + 80);
  return sub_21C296670(*(void **)(v0 + 16), *(void **)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

id sub_21C29CB38(id result, uint64_t a2, char a3)
{
  id v3;

  if (a3 == 1)
  {
    v3 = result;
    return (id)swift_bridgeObjectRetain();
  }
  else if (!a3)
  {
    return result;
  }
  return result;
}

void sub_21C29CB74(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {

    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {

  }
}

void sub_21C29CBB0()
{
  sub_21C2966E0();
}

void sub_21C29CBB8()
{
  sub_21C2974E4();
}

void sub_21C29CBC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_21C29CC18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255758;
  if (!qword_255255758)
  {
    sub_21C29CBC0(255, &qword_255255750, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255255758);
  }
  return result;
}

uint64_t sub_21C29CC78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21C2C1A00();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_21C29CD04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_21C2C1A00() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_21C2975E0(v0 + v2, *(char **)(v0 + v3), *(void **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8)));
}

void sub_21C29CD50()
{
  sub_21C298554();
}

void sub_21C29CD70()
{
  sub_21C297860();
}

void sub_21C29CD78()
{
  sub_21C2A68B8();
}

void sub_21C29CD88(unint64_t a1, void *a2)
{
  uint64_t v2;

  sub_21C29A700(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_21C29CD90()
{
  unint64_t result;

  result = qword_255255768;
  if (!qword_255255768)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_255255768);
  }
  return result;
}

void sub_21C29CDE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255770)
  {
    sub_21C29C4D0();
    sub_21C293BF0(&qword_255255778, (uint64_t (*)(uint64_t))sub_21C29C4D0, MEMORY[0x24BDB9D10]);
    v0 = sub_21C2C1EA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255770);
  }
}

void sub_21C29CE5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255780)
  {
    sub_21C29CDE4();
    sub_21C2943A8(255, &qword_255255700);
    sub_21C293BF0(&qword_255255788, (uint64_t (*)(uint64_t))sub_21C29CDE4, MEMORY[0x24BDB9658]);
    sub_21C29C7FC();
    v0 = sub_21C2C1EC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255780);
  }
}

uint64_t sub_21C29CF10()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21C29CF34(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_21C2954D8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C29CF3C()
{
  return swift_deallocObject();
}

uint64_t sub_21C29CF4C(uint64_t a1, void *a2)
{
  return sub_21C29AB54(a1, a2);
}

void sub_21C29CF54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255798)
  {
    sub_21C2C20C0();
    sub_21C293BF0(&qword_2552557A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFA0D0], MEMORY[0x24BDFA0E0]);
    v0 = sub_21C2C2624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255798);
  }
}

uint64_t type metadata accessor for ScanResultSelectionViewController()
{
  uint64_t result;

  result = qword_2552557D0;
  if (!qword_2552557D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C29D084()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C2C1A00();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_21C29D128(char *a1, uint64_t a2, void *a3)
{
  id v5;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&a1[qword_2552557C8] = 0;
  v5 = a3;

  sub_21C2C26C0();
  __break(1u);
}

void sub_21C29D1B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_255256878;
  v2 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_unknownObjectWeakDestroy();

}

id sub_21C29D240()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  objc_super v6;

  v1 = v0;
  v2 = qword_2552557C8;
  v3 = *(void **)&v0[qword_2552557C8];
  if (v3)
  {
    v4 = v3;
    sub_21C2C194C();

    v3 = *(void **)&v1[v2];
  }
  *(_QWORD *)&v1[v2] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ScanResultSelectionViewController();
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

id sub_21C29D2B4(void *a1)
{
  id v1;

  v1 = a1;
  return sub_21C29D240();
}

void sub_21C29D2D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + qword_255256878;
  v3 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);

  swift_release();
  swift_unknownObjectWeakDestroy();

}

id sub_21C29D368()
{
  char *v0;
  id result;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ScanResultSelectionViewController();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2 = result;
  objc_msgSend(result, sel_setBackgroundColor_, 0);

  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v3 = result;
  objc_msgSend(result, sel_setClipsToBounds_, 0);

  result = objc_msgSend(v0, sel_collectionView);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = result;
  objc_msgSend(result, sel_setBackgroundColor_, 0);

  result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    v5 = result;
    objc_msgSend(result, sel_setClipsToBounds_, 0);

    v7 = *(void **)&v0[qword_2552557C0];
    swift_retain();
    v6 = v7;
    sub_21C2C1F10();

    return (id)swift_release();
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_21C29D4D8(void *a1)
{
  id v1;

  v1 = a1;
  sub_21C29D368();

}

void sub_21C29D50C(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = v1;
  v4 = (void *)sub_21C2C1A0C();
  objc_msgSend(a1, sel_deselectItemAtIndexPath_animated_, v4, 1);

  v5 = (void *)sub_21C2C1A0C();
  v9 = objc_msgSend(a1, sel_cellForItemAtIndexPath_, v5);

  if (v9)
  {
    v6 = sub_21C2C1A24();
    v7 = (void *)(v6 + 1);
    if (__OFADD__(v6, 1))
    {
      __break(1u);
    }
    else
    {
      type metadata accessor for ScanResultGroupCell();
      if (swift_dynamicCastClass())
      {
        v8 = v9;
        sub_21C29EC64(v2, v7);

      }
    }
  }
}

uint64_t sub_21C29D5F8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v12;

  v5 = sub_21C2C1A30();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1A18();
  v9 = a3;
  v10 = a1;
  sub_21C29D50C(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_21C29D6A8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_21C29D6D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_21C29D704()
{
  return type metadata accessor for ScanResultSelectionViewController();
}

id sub_21C29D710()
{
  uint64_t inited;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v24;

  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1688]), sel_init);
  sub_21C2C2414();
  sub_21C29CBC0(0, &qword_255255878, (uint64_t (*)(uint64_t))sub_21C29F1C0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C2C3870;
  v1 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v2 = sub_21C2943A8(0, &qword_255255888);
  v3 = v1;
  *(_QWORD *)(inited + 40) = sub_21C2C245C();
  v4 = (void *)*MEMORY[0x24BEBB368];
  *(_QWORD *)(inited + 64) = v2;
  *(_QWORD *)(inited + 72) = v4;
  v5 = (void *)objc_opt_self();
  v6 = v4;
  v7 = objc_msgSend(v5, sel_systemBlackColor);
  *(_QWORD *)(inited + 104) = sub_21C2943A8(0, &qword_255255890);
  *(_QWORD *)(inited + 80) = v7;
  sub_21C2A808C(inited);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v9 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_21C29F178();
  v10 = (void *)sub_21C2C2174();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithString_attributes_, v9, v10);

  v12 = v24;
  objc_msgSend(v24, sel_appendAttributedString_, v11);
  sub_21C2C2438();
  if (v13)
  {
    sub_21C29F03C((SEL *)&selRef_systemBlackColor);
    v14 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v15 = (void *)sub_21C2C21A4();
    v16 = (void *)sub_21C2C2174();
    swift_bridgeObjectRelease();
    v17 = v14;
    v12 = v24;
    v18 = objc_msgSend(v17, sel_initWithString_attributes_, v15, v16);

    objc_msgSend(v24, (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4, v18);
    sub_21C29F03C((SEL *)&selRef_systemBlackColor);
    v19 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v20 = (void *)sub_21C2C21A4();
    swift_bridgeObjectRelease();
    v21 = (void *)sub_21C2C2174();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v19, sel_initWithString_attributes_, v20, v21);

    objc_msgSend(v24, (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4, v22);
  }

  return v12;
}

uint64_t sub_21C29DA7C()
{
  uint64_t v0;
  id v1;

  swift_bridgeObjectRetain();
  sub_21C2C2228();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21C2C2228();
  swift_bridgeObjectRelease();
  v1 = *(id *)(v0 + 32);
  sub_21C2C2498();

  sub_21C2C2864();
  return sub_21C2C2858();
}

uint64_t sub_21C29DB24()
{
  sub_21C2C284C();
  sub_21C29DA7C();
  return sub_21C2C2870();
}

uint64_t sub_21C29DB64()
{
  sub_21C2C284C();
  sub_21C29DA7C();
  return sub_21C2C2870();
}

BOOL sub_21C29DB9C(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  uint64_t v6;
  _OWORD v7[3];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  return sub_21C29EB94((uint64_t)v5, (uint64_t)v7);
}

uint64_t sub_21C29DBF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C29DC20()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C29DD8C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(__int128 *, _QWORD);
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void (*v27)(__int128 *, _QWORD);
  id v28;
  id v29;
  void (*v30)(__int128 *, _QWORD);
  uint64_t v31;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t);
  char *v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ObjectType;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  _BYTE v74[24];
  uint64_t v75;
  _OWORD v76[3];
  uint64_t v77;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v2 = sub_21C2C1D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_21C29CBC0(0, &qword_255255860, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC408], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v59 - v8;
  v61 = sub_21C2C1DFC();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_21C2C1D84();
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_255255868, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC088], v6);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v59 - v15;
  v66 = sub_21C2C1DB4();
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v64 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_21C2C1E5C();
  v68 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (uint64_t)v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_21C29E934(v20, (uint64_t)v74);
  if (v75)
  {
    sub_21C29F290(0, &qword_255255858);
    if ((swift_dynamicCast() & 1) != 0)
    {
      ObjectType = (uint64_t)v11;
      v76[0] = v70;
      v76[1] = v71;
      v76[2] = v72;
      v77 = v73;
      sub_21C2C1E50();
      sub_21C29D710();
      sub_21C2C1E14();
      v21 = (void (*)(__int128 *, _QWORD))sub_21C2C1E20();
      sub_21C2C1E08();
      v21(&v70, 0);
      sub_21C2C242C();
      if (v22)
      {
        sub_21C29F03C((SEL *)&selRef_systemGrayColor);
        v59 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v23 = (void *)sub_21C2C21A4();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_21C29F178();
        v24 = (void *)sub_21C2C2174();
        swift_bridgeObjectRelease();
        v25 = objc_msgSend(v59, sel_initWithString_attributes_, v23, v24);

        if (v25)
        {
          v26 = v25;
          sub_21C2C1E2C();
          v27 = (void (*)(__int128 *, _QWORD))sub_21C2C1E38();
          sub_21C2C1E08();
          v27(&v70, 0);
          v28 = objc_msgSend(v1, sel_traitCollection);
          v29 = objc_msgSend(v28, sel_preferredContentSizeCategory);

          LOBYTE(v28) = sub_21C2C23FC();
          if ((v28 & 1) != 0)
          {
            v30 = (void (*)(__int128 *, _QWORD))sub_21C2C1E38();
            sub_21C2C1E08();
            v30(&v70, 0);
          }

        }
      }
      sub_21C2C1E44();
      v31 = v69;
      *((_QWORD *)&v71 + 1) = v69;
      *(_QWORD *)&v72 = MEMORY[0x24BEBC5F0];
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v70);
      (*(void (**)(uint64_t *, char *, uint64_t))(v68 + 16))(boxed_opaque_existential_1, v19, v31);
      MEMORY[0x220778B58](&v70);
      v33 = *MEMORY[0x24BEBC080];
      v34 = sub_21C2C1D90();
      v35 = *(_QWORD *)(v34 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 104))(v16, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v16, 0, 1, v34);
      v36 = (void *)objc_opt_self();
      v37 = objc_msgSend(v36, sel_systemMidGrayColor);
      v38 = v64;
      sub_21C2C1DA8();
      sub_21C29CBC0(0, &qword_255255870, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC0E0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      sub_21C2C1DC0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_21C2C3880;
      v39 = v62;
      v40 = v63;
      (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v13, *MEMORY[0x24BEBC058], v63);
      sub_21C2C1D9C();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
      sub_21C2C2444();
      v41 = ObjectType;
      sub_21C2C1DE4();
      v42 = objc_msgSend(v36, sel_whiteColor);
      sub_21C2C1DD8();
      v43 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 1);
      sub_21C2C1DCC();
      v44 = v60;
      v45 = v61;
      (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v9, v41, v61);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v9, 0, 1, v45);
      MEMORY[0x220778B64](v9);
      sub_21C29E9B4((uint64_t)v76);
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v41, v45);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v66);
      v46 = *(uint64_t (**)(char *, uint64_t))(v68 + 8);
      v47 = v19;
      goto LABEL_12;
    }
  }
  else
  {
    sub_21C29E8F8((uint64_t)v74);
  }
  sub_21C2C1D54();
  v48 = v1;
  v49 = sub_21C2C1D6C();
  v50 = sub_21C2C2354();
  if (!os_log_type_enabled(v49, v50))
  {

    v46 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    v47 = v5;
    v57 = v2;
    return v46(v47, v57);
  }
  v51 = swift_slowAlloc();
  v52 = swift_slowAlloc();
  *(_QWORD *)&v70 = v52;
  *(_DWORD *)v51 = 136315394;
  v69 = v2;
  v53 = sub_21C2C28AC();
  *(_QWORD *)&v76[0] = sub_21C2BE2B4(v53, v54, (uint64_t *)&v70);
  sub_21C2C2570();
  swift_bridgeObjectRelease();
  *(_WORD *)(v51 + 12) = 2080;
  sub_21C29E934(v20, (uint64_t)v76);
  sub_21C29E890();
  v55 = sub_21C2C21EC();
  *(_QWORD *)&v76[0] = sub_21C2BE2B4(v55, v56, (uint64_t *)&v70);
  sub_21C2C2570();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_21C28F000, v49, v50, "[%s] Expected a MedicationSearchItem, but received a %s", (uint8_t *)v51, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x2207794E8](v52, -1, -1);
  MEMORY[0x2207794E8](v51, -1, -1);

  v46 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v47 = v5;
LABEL_12:
  v57 = v69;
  return v46(v47, v57);
}

id sub_21C29E640()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScanResultGroupCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScanResultGroupCell()
{
  return objc_opt_self();
}

uint64_t sub_21C29E6A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  return sub_21C29E934(v3, a1);
}

uint64_t sub_21C29E6F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_21C29E84C(a1, v3);
  swift_endAccess();
  sub_21C29DD8C();
  return sub_21C29E8F8(a1);
}

uint64_t (*sub_21C29E75C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_21C29E7A4;
}

uint64_t sub_21C29E7A4(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_21C29DD8C();
  return result;
}

uint64_t sub_21C29E7DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22077944C](&unk_21C2C3BC4, a3);
  return sub_21C2C1ACC();
}

uint64_t sub_21C29E84C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C29E890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_21C29E890()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255850)
  {
    sub_21C29F290(255, &qword_255255858);
    v0 = sub_21C2C2564();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255850);
  }
}

uint64_t sub_21C29E8F8(uint64_t a1)
{
  uint64_t v2;

  sub_21C29E890();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C29E934(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C29E890();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_21C29E9B4(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21C29E9F8(void *a1, void *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v7 = sub_21C2C1A00();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[qword_2552557C8] = 0;
  *(_QWORD *)&v3[qword_2552557B8] = a1;
  *(_QWORD *)&v3[qword_2552557C0] = a2;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(&v3[qword_255256878], a3, v7);
  v11(v10, a3, v7);
  type metadata accessor for ScanResultSelectionDataSource();
  swift_allocObject();
  v12 = a1;
  v13 = v3;
  v14 = a2;
  v15 = sub_21C2B91A8(v12, v10);
  v16 = qword_255256880;
  *(_QWORD *)&v13[qword_255256880] = v15;

  sub_21C2C1B74();
  sub_21C29F228();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_21C2C3880;
  v18 = MEMORY[0x24BE43520];
  *(_QWORD *)(v17 + 32) = *(_QWORD *)&v13[v16];
  *(_QWORD *)(v17 + 40) = v18;
  swift_retain();
  sub_21C2C1B80();
  v19 = sub_21C2C1C70();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a3, v7);
  return v19;
}

BOOL sub_21C29EB94(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_21C2C2804(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = sub_21C2C2804(), result = 0, (v8 & 1) != 0))
    {
      sub_21C2943A8(0, &qword_2552558B0);
      return (sub_21C2C248C() & 1) != 0
          && *(float *)(a1 + 40) == *(float *)(a2 + 40)
          && *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48);
    }
  }
  return result;
}

uint64_t sub_21C29EC64(void *a1, void *a2)
{
  void *v2;
  void *v3;
  void *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33[5];
  uint64_t v34;
  _QWORD v35[7];
  uint64_t v36[6];

  v3 = v2;
  ObjectType = (void *)swift_getObjectType();
  v7 = sub_21C2C1D78();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  swift_beginAccess();
  sub_21C29E934(v11, (uint64_t)v36);
  if (v36[3])
  {
    sub_21C29F290(0, &qword_255255858);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v33[4] = ObjectType;
      v33[1] = a2;
      v12 = (void *)v35[1];
      v14 = (void *)v35[3];
      v13 = (void *)v35[4];
      type metadata accessor for ScanResultSelectionViewController();
      v15 = swift_dynamicCastClass();
      if (v15)
      {
        v16 = v15;
        v33[0] = v13;
        v33[2] = v14;
        v33[3] = v12;
        v34 = v7;
        v17 = MEMORY[0x220779584](v15 + qword_255256888);
        if (v17)
        {
          v18 = (void *)v17;
          if (MEMORY[0x220779584](v17 + qword_255256850))
          {
            v19 = a1;
            v20 = v33[0];
            v21 = objc_msgSend(v33[0], sel_specificProduct);
            sub_21C29AFFC(v18, (uint64_t)v21, v16 + qword_255256878);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return swift_unknownObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease();
            return swift_bridgeObjectRelease();
          }
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v7 = v34;
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_21C29E8F8((uint64_t)v36);
  }
  sub_21C2C1D54();
  v23 = v3;
  v24 = sub_21C2C1D6C();
  v25 = sub_21C2C2354();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v34 = v7;
    v27 = v26;
    v28 = swift_slowAlloc();
    v36[0] = v28;
    *(_DWORD *)v27 = 136315394;
    v29 = sub_21C2C28AC();
    v35[0] = sub_21C2BE2B4(v29, v30, v36);
    sub_21C2C2570();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    sub_21C29E934(v11, (uint64_t)v35);
    sub_21C29E890();
    v31 = sub_21C2C21EC();
    v35[0] = sub_21C2BE2B4(v31, v32, v36);
    sub_21C2C2570();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v24, v25, "[%s] Expected a MedicationSearchItem, but received a %s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v28, -1, -1);
    MEMORY[0x2207794E8](v27, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v34);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

unint64_t sub_21C29F03C(SEL *a1)
{
  uint64_t inited;
  void **v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  sub_21C29CBC0(0, &qword_255255878, (uint64_t (*)(uint64_t))sub_21C29F1C0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  inited = swift_initStackObject();
  v3 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_21C2C3870;
  v4 = *v3;
  *(_QWORD *)(inited + 32) = *v3;
  v5 = (void *)objc_opt_self();
  v6 = *MEMORY[0x24BEBE220];
  v7 = v4;
  v8 = objc_msgSend(v5, sel_preferredFontForTextStyle_, v6);
  v9 = sub_21C2943A8(0, &qword_255255888);
  *(_QWORD *)(inited + 40) = v8;
  v10 = (void *)*MEMORY[0x24BEBB368];
  *(_QWORD *)(inited + 64) = v9;
  *(_QWORD *)(inited + 72) = v10;
  v11 = (void *)objc_opt_self();
  v12 = v10;
  v13 = objc_msgSend(v11, *a1);
  *(_QWORD *)(inited + 104) = sub_21C2943A8(0, &qword_255255890);
  *(_QWORD *)(inited + 80) = v13;
  return sub_21C2A808C(inited);
}

unint64_t sub_21C29F178()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255548;
  if (!qword_255255548)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x22077944C](&unk_21C2C381C, v1);
    atomic_store(result, (unint64_t *)&qword_255255548);
  }
  return result;
}

void sub_21C29F1C0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255255880)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255255880);
  }
}

void sub_21C29F228()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255898)
  {
    sub_21C29F290(255, &qword_2552558A0);
    v0 = sub_21C2C27F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255898);
  }
}

uint64_t sub_21C29F290(uint64_t a1, unint64_t *a2)
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

void destroy for ScanResultGroupItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
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

uint64_t assignWithTake for ScanResultGroupItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScanResultGroupItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanResultGroupItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanResultGroupItem()
{
  return &type metadata for ScanResultGroupItem;
}

unint64_t sub_21C29F524()
{
  unint64_t result;

  result = qword_2552558A8;
  if (!qword_2552558A8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C3C44, &type metadata for ScanResultGroupItem);
    atomic_store(result, (unint64_t *)&qword_2552558A8);
  }
  return result;
}

uint64_t sub_21C29F568()
{
  return swift_deallocClassInstance();
}

uint64_t _s31HealthMedicationsVisionUIBundleCMa()
{
  return objc_opt_self();
}

id sub_21C29F598()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s31HealthMedicationsVisionUIBundleCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2552568A0 = (uint64_t)result;
  return result;
}

id sub_21C29F63C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MedicationDataScannerStatusView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MedicationDataScannerStatusView()
{
  return objc_opt_self();
}

void sub_21C29F788()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___blurView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___iconView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___detailsLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI31MedicationDataScannerStatusView____lazy_storage___secondaryButton] = 0;

  sub_21C2C26C0();
  __break(1u);
}

uint64_t sub_21C29F82C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  id v7;
  uint64_t result;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_21C2A0A4C();
  swift_allocObject();
  v7 = a1;
  swift_retain();
  result = sub_21C2C1F4C();
  *a3 = result;
  return result;
}

void sub_21C29F8B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 aBlock;
  uint64_t (*v34)(uint64_t, void *, uint64_t, void *);
  void *v35;
  void (*v36)(uint64_t, uint64_t, void *);
  uint64_t v37;
  uint64_t v38;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v38 = MEMORY[0x24BEE4AF8];
  swift_retain();
  v9 = objc_msgSend(a3, sel_resolvedIds);
  sub_21C2943A8(0, &qword_255255740);
  v10 = sub_21C2C2270();

  v11 = v10 >> 62;
  if (v10 >> 62)
    goto LABEL_21;
  if (*(uint64_t *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) >= 10)
    v12 = 10;
  else
    v12 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0 && v12 != 0)
    {
      v14 = 0;
      do
      {
        v15 = v14 + 1;
        sub_21C2C2648();
        v14 = v15;
      }
      while (v12 != v15);
    }
    if (!v11)
    {
      v16 = 0;
      v17 = (v10 & 0xFFFFFFFFFFFFFF8) + 32;
      if (!v12)
        break;
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    sub_21C2C26D8();
    v17 = v18;
    v16 = v19;
    v21 = v20;
    swift_bridgeObjectRelease_n();
    v12 = v21 >> 1;
    if (v16 == v12)
      break;
LABEL_13:
    swift_unknownObjectRetain();
    v10 = 0;
    while (v16 < v12)
    {
      *(_QWORD *)&aBlock = *(_QWORD *)(v17 + 8 * v16);
      sub_21C29FCDC((id *)&aBlock, &v38);
      v11 = ++v16;
      if (v12 == v16)
      {
        swift_unknownObjectRelease_n();
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    v29 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v30 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    if (v30 < 0)
      goto LABEL_30;
    if (v29 >= 10)
      v31 = 10;
    else
      v31 = v29;
    if (v29 >= 0)
      v12 = v31;
    else
      v12 = 10;
    swift_bridgeObjectRetain();
    v32 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    if (v32 < v12)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      return;
    }
  }
  swift_unknownObjectRelease();
LABEL_19:
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = sub_21C2A0AF4;
  *(_QWORD *)(v22 + 24) = v8;
  v23 = objc_allocWithZone(MEMORY[0x24BE45C60]);
  sub_21C2943A8(0, &qword_255255AD8);
  swift_bridgeObjectRetain();
  v24 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  v36 = sub_21C2A0B2C;
  v37 = v22;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v34 = sub_21C2BDDB0;
  v35 = &block_descriptor_0;
  v25 = _Block_copy(&aBlock);
  v26 = objc_msgSend(v23, sel_initWithScanResult_limit_resultsHandler_, v24, 10, v25);

  _Block_release(v25);
  swift_release();
  strcpy((char *)&aBlock, "scan result: ");
  HIWORD(aBlock) = -4864;
  sub_21C2A0B4C(0, (unint64_t *)&qword_255255AE0, &qword_255255AD8);
  v27 = v26;
  swift_bridgeObjectRetain();
  sub_21C2C2204();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  v28 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_setDebugIdentifier_, v28);

  objc_msgSend(v27, sel_setQualityOfService_, 33);
  objc_msgSend(*(id *)(a4 + 16), sel_executeQuery_, v27);
  swift_bridgeObjectRelease();

}

uint64_t sub_21C29FCDC(id *a1, _QWORD *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;

  v4 = *a1;
  v5 = objc_msgSend(*a1, sel_subHgIds);
  sub_21C2943A8(0, &qword_255255AE8);
  v6 = sub_21C2C2270();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v7)
  {
    v17 = objc_msgSend(v4, sel_primaryHgId);
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v17);
    MEMORY[0x2207789CC]();
    if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_18:
      sub_21C2C22AC();
      return sub_21C2C2288();
    }
LABEL_24:
    sub_21C2C2294();
    goto LABEL_18;
  }
  v8 = objc_msgSend(v4, sel_subHgIds);
  v9 = sub_21C2C2270();

  v21 = MEMORY[0x24BEE4AF8];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_21C2C26CC();
    if (v10)
      goto LABEL_6;
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_6:
      if (v10 >= 1)
      {
        v19 = a2;
        v20 = v2;
        for (i = 0; i != v10; ++i)
        {
          if ((v9 & 0xC000000000000001) != 0)
            v12 = (id)MEMORY[0x220778DC8](i, v9);
          else
            v12 = *(id *)(v9 + 8 * i + 32);
          v13 = v12;
          v14 = objc_msgSend(v12, sel_hgId, v19, v20);
          v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v14);

          if (v15)
          {
            MEMORY[0x2207789CC]();
            if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_21C2C2294();
            sub_21C2C22AC();
            sub_21C2C2288();
          }
        }
        swift_bridgeObjectRelease();
        v16 = v21;
        goto LABEL_22;
      }
      __break(1u);
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x24BEE4AF8];
LABEL_22:
  swift_bridgeObjectRelease();
  return sub_21C2A85F0(v16);
}

void sub_21C29FFB4(uint64_t a1, uint64_t a2, void *a3, void (*a4)(_QWORD, _QWORD), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[3];
  void (*v27)(_QWORD, _QWORD);
  uint64_t v28;
  uint64_t v29;

  v9 = sub_21C2C1D78();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v13 = a3;
    sub_21C2C1D54();
    v14 = a3;
    v15 = a3;
    v16 = sub_21C2C1D6C();
    v17 = sub_21C2C2354();
    if (os_log_type_enabled(v16, v17))
    {
      v27 = a4;
      v18 = swift_slowAlloc();
      v26[2] = a5;
      v19 = (uint8_t *)v18;
      v20 = swift_slowAlloc();
      v28 = (uint64_t)a3;
      v29 = v20;
      *(_DWORD *)v19 = 136446210;
      v26[1] = v19 + 4;
      v21 = a3;
      sub_21C29CD90();
      v22 = sub_21C2C21EC();
      v28 = sub_21C2BE2B4(v22, v23, &v29);
      sub_21C2C2570();
      a4 = v27;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21C28F000, v16, v17, "Failed to fetch medication clusters using the given resolver result: %{public}s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207794E8](v20, -1, -1);
      MEMORY[0x2207794E8](v19, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v25 = a3;
    a4(a3, 1);

  }
  else
  {
    if (a2)
      v24 = a2;
    else
      v24 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    a4(v24, 0);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21C2A0224@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  id *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v4 = sub_21C2C1A00();
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2943A8(0, &qword_255255A90);
  sub_21C2A0950();
  sub_21C293BF0(&qword_255255AB0, (uint64_t (*)(uint64_t))sub_21C2A0950, MEMORY[0x24BEE1708]);
  v6 = sub_21C2C22A0();
  v7 = v6 >> 62;
  if (!(v6 >> 62))
  {
    if (*(uint64_t *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3)
      v8 = 3;
    else
      v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  v23 = sub_21C2C26CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13 = sub_21C2C26CC();
  swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0)
    goto LABEL_60;
  __break(1u);
LABEL_47:
  swift_bridgeObjectRetain();
  v23 = sub_21C2C26CC();
  swift_release();
  swift_bridgeObjectRetain();
  v41 = sub_21C2C26CC();
  swift_release();
  if ((v41 & 0x8000000000000000) == 0)
  {
    if (v23 >= 3)
      v42 = 3;
    else
      v42 = v23;
    if (v23 >= 0)
      v12 = v42;
    else
      v12 = 3;
    swift_bridgeObjectRetain();
    v43 = sub_21C2C26CC();
    swift_release();
    if (v43 >= v12)
      goto LABEL_28;
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    swift_unknownObjectRelease();
LABEL_14:
    v1 = sub_21C2B22BC(v13, v1, v12, v2);
    goto LABEL_21;
  }
  while (1)
  {
    __break(1u);
LABEL_60:
    v44 = v23 >= 3 ? 3 : v23;
    v8 = v23 >= 0 ? v44 : 3;
    swift_bridgeObjectRetain();
    v45 = sub_21C2C26CC();
    result = swift_bridgeObjectRelease();
    if (v45 < v8)
      break;
LABEL_5:
    if ((v6 & 0xC000000000000001) != 0 && v8 != 0)
    {
      v10 = 0;
      do
      {
        v11 = v10 + 1;
        sub_21C2C2648();
        v10 = v11;
      }
      while (v8 != v11);
    }
    if (v7)
    {
      swift_bridgeObjectRetain();
      v13 = sub_21C2C26D8();
      v1 = v14;
      v12 = v15;
      v2 = v16;
      swift_bridgeObjectRelease_n();
      if ((v2 & 1) == 0)
        goto LABEL_14;
    }
    else
    {
      v12 = 0;
      v13 = v6 & 0xFFFFFFFFFFFFFF8;
      v1 = (v6 & 0xFFFFFFFFFFFFFF8) + 32;
      v2 = (2 * v8) | 1;
    }
    sub_21C2C2810();
    swift_unknownObjectRetain_n();
    v17 = swift_dynamicCastClass();
    if (!v17)
    {
      swift_unknownObjectRelease();
      v17 = MEMORY[0x24BEE4AF8];
    }
    v18 = *(_QWORD *)(v17 + 16);
    swift_release();
    if (__OFSUB__(v2 >> 1, v12))
      goto LABEL_56;
    if (v18 != (v2 >> 1) - v12)
      goto LABEL_57;
    v1 = swift_dynamicCastClass();
    if (!v1)
    {
      swift_unknownObjectRelease();
      v1 = MEMORY[0x24BEE4AF8];
    }
LABEL_21:
    swift_unknownObjectRelease();
    if (v1 < 0)
      v7 = 1;
    else
      v7 = ((unint64_t)v1 >> 62) & 1;
    if ((v7 & 1) != 0)
      goto LABEL_47;
    if (*(uint64_t *)(v1 + 16) >= 3)
      v12 = 3;
    else
      v12 = *(_QWORD *)(v1 + 16);
LABEL_28:
    if ((v1 & 0xC000000000000001) != 0 && v12)
    {
      v19 = 0;
      do
      {
        v20 = v19 + 1;
        sub_21C2C2648();
        v19 = v20;
      }
      while (v12 != v20);
    }
    if ((_DWORD)v7)
    {
      swift_bridgeObjectRetain();
      v21 = sub_21C2C26D8();
      v23 = v22;
      v25 = v24;
      v6 = v26;
      swift_release_n();
      v12 = v6 >> 1;
      v1 = v21;
      if (v6 >> 1 == v25)
        goto LABEL_43;
    }
    else
    {
      v25 = 0;
      v23 = v1 + 32;
      if (!v12)
      {
LABEL_43:
        result = swift_unknownObjectRelease();
        v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_44:
        *a1 = v27;
        return result;
      }
    }
    v49 = type metadata accessor for ScanResultGroupCell();
    v7 = v12 - v25;
    if (v12 > v25)
    {
      v46[1] = v1;
      v47 = a1;
      swift_unknownObjectRetain();
      v48 = sub_21C293BF0(&qword_255255AB8, (uint64_t (*)(uint64_t))type metadata accessor for ScanResultGroupCell, (uint64_t)&unk_21C2C3B9C);
      v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v28 = (id *)(v23 + 8 * v25);
      do
      {
        v29 = *v28;
        v30 = sub_21C2C1A90();
        v32 = v31;
        v33 = v50;
        sub_21C2C19F4();
        v34 = sub_21C2C19E8();
        v36 = v35;
        (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v52);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v27 = sub_21C2B17BC(0, v27[2] + 1, 1, v27);
        v38 = v27[2];
        v37 = v27[3];
        if (v38 >= v37 >> 1)
          v27 = sub_21C2B17BC((_QWORD *)(v37 > 1), v38 + 1, 1, v27);
        v27[2] = v38 + 1;
        v39 = &v27[7 * v38];
        v39[4] = v34;
        v39[5] = v36;
        v39[6] = v30;
        v39[7] = v32;
        v39[8] = v29;
        *((_DWORD *)v39 + 18) = 0;
        v39[10] = 0;
        ++v28;
        --v7;
      }
      while (v7);
      result = swift_unknownObjectRelease_n();
      a1 = v47;
      goto LABEL_44;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2A075C@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v3 = objc_msgSend(*a1, sel_clinicalProducts);
  sub_21C2943A8(0, &qword_255255AC0);
  v4 = sub_21C2C2270();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x24BEE4AF8];
LABEL_12:
    v12 = sub_21C2C1168(v11);
    result = swift_bridgeObjectRelease();
    *a2 = v12;
    return result;
  }
  swift_bridgeObjectRetain();
  v5 = sub_21C2C26CC();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_11;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_21C2C2690();
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x220778DC8](v7, v4);
      else
        v8 = *(id *)(v4 + 8 * v7 + 32);
      v9 = v8;
      ++v7;
      v10 = objc_msgSend(v8, sel_identifier);

      sub_21C2C2678();
      sub_21C2C269C();
      sub_21C2C26A8();
      sub_21C2C2684();
    }
    while (v5 != v7);
    v11 = v13;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2A090C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ScanResultDataProvider()
{
  return objc_opt_self();
}

void sub_21C2A0950()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255A98)
  {
    sub_21C2943A8(255, &qword_255255AA0);
    sub_21C2A09C0();
    v0 = sub_21C2C233C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255A98);
  }
}

unint64_t sub_21C2A09C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255AA8;
  if (!qword_255255AA8)
  {
    v1 = sub_21C2943A8(255, &qword_255255AA0);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255255AA8);
  }
  return result;
}

uint64_t sub_21C2A0A18()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21C2A0A44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21C29F8B8(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_21C2A0A4C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255AC8)
  {
    sub_21C2A0B4C(255, &qword_255255AD0, &qword_255255A90);
    sub_21C29CD90();
    v0 = sub_21C2C1F40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255AC8);
  }
}

uint64_t sub_21C2A0AD0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C2A0AF4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

void sub_21C2A0B2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_21C29FFB4(a1, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24));
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

void sub_21C2A0B4C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_21C2943A8(255, a3);
    v4 = sub_21C2C22B8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_21C2A0BA4(uint64_t a1)
{
  _BYTE *v1;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  char v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  _BYTE v32[40];
  CGRect v33;
  CGRect v34;

  sub_21C2A7280(a1, (uint64_t)v31);
  v3 = *(double *)v31;
  v4 = *(double *)&v31[1];
  v5 = *(double *)&v31[2];
  v6 = *(double *)&v31[3];
  v7 = (double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  v8 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  v9 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 8];
  v10 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 16];
  v11 = *(double *)&v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 24];
  v12 = v1[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32];
  sub_21C2A7280(a1, (uint64_t)v32);
  if ((v32[32] & 1) != 0)
  {
    if ((v12 & 1) != 0)
      return;
  }
  else if ((v12 & 1) == 0)
  {
    v33.origin.x = v3;
    v33.origin.y = v4;
    v33.size.width = v5;
    v33.size.height = v6;
    v34.origin.x = v8;
    v34.origin.y = v9;
    v34.size.width = v10;
    v34.size.height = v11;
    if (CGRectEqualToRect(v33, v34))
      return;
  }
  v13 = sub_21C2A0F58();
  if (((_BYTE)v7[4] & 1) != 0)
  {
    objc_msgSend(v1, sel_bounds);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }
  else
  {
    v19 = v7[2];
    v21 = v7[3];
    v15 = *v7;
    v17 = v7[1];
  }
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_bezierPathWithRoundedRect_cornerRadius_, v15, v17, v19, v21, 44.0);
  objc_msgSend(v1, sel_bounds);
  v24 = objc_msgSend(v22, sel_bezierPathWithRect_);
  objc_msgSend(v23, sel_appendPath_, v24);

  v25 = objc_msgSend(v23, sel_CGPath);
  objc_msgSend(v13, sel_setPath_, v25);

  v26 = sub_21C2A106C();
  if (((_BYTE)v7[4] & 1) != 0)
  {
    objc_msgSend(v1, sel_bounds);
  }
  else
  {
    v29 = v7[2];
    v30 = v7[3];
    v27 = *v7;
    v28 = v7[1];
  }
  objc_msgSend(v26, sel_setFrame_, v27, v28, v29, v30);

}

id sub_21C2A0D9C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 3);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v4);
    objc_msgSend(v5, sel_setAlpha_, 0.0);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

char *sub_21C2A0E60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  id v5;
  char *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView);
  if (v2)
  {
    v3 = *(char **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView);
  }
  else
  {
    v4 = v0;
    v5 = objc_allocWithZone((Class)type metadata accessor for MedsCompletionCheckmarkView());
    v6 = sub_21C2A4DD4(80.0);
    objc_msgSend(v6, sel_sizeToFit);
    v7 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_21C2A0EE8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_21C2A0F58()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
    objc_msgSend(v4, sel_setFillRule_, *MEMORY[0x24BDE5988]);
    v5 = (void *)objc_opt_self();
    v6 = v4;
    v7 = objc_msgSend(v5, sel_whiteColor);
    v8 = objc_msgSend(v7, sel_CGColor);

    objc_msgSend(v6, sel_setBackgroundColor_, v8);
    objc_msgSend(v6, sel_setOpaque_, 0);
    v9 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_21C2A106C()
{
  return sub_21C2A5EDC(&OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer, (uint64_t (*)(void))sub_21C2A7318);
}

char *sub_21C2A1080(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  char *v40;
  char *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double MidX;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  objc_super v57;

  v9 = &v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_borderWidth] = 0x4018000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cornerRadius] = 0x4046000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_checkmarkDiameter] = 0x4054000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_expansionAmountForOutlineBox] = 0x402C000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_animationSquishAmount] = 0x4018000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer] = 0;
  v57.receiver = v4;
  v57.super_class = (Class)type metadata accessor for CutoutView();
  v10 = (char *)objc_msgSendSuper2(&v57, sel_initWithFrame_, a1, a2, a3, a4);
  v11 = sub_21C2A0D9C();
  objc_msgSend(v10, sel_addSubview_, v11);

  v12 = sub_21C2A0D9C();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  v13 = objc_msgSend(v10, sel_layer);
  v14 = sub_21C2A0EE8();
  objc_msgSend(v13, sel_addSublayer_, v14);

  v15 = sub_21C2A0EE8();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v15, sel_setFrame_);

  v16 = objc_msgSend(v10, sel_layer);
  v17 = sub_21C2A106C();
  objc_msgSend(v16, sel_addSublayer_, v17);

  v18 = sub_21C2A106C();
  v19 = (double *)&v10[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  if ((v10[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
  {
    objc_msgSend(v10, sel_bounds);
  }
  else
  {
    v22 = v19[2];
    v23 = v19[3];
    v20 = *v19;
    v21 = v19[1];
  }
  objc_msgSend(v18, sel_setFrame_, v20, v21, v22, v23);

  v24 = sub_21C2A0EE8();
  v25 = sub_21C2A0F58();
  objc_msgSend(v24, sel_setMask_, v25);

  v26 = sub_21C2A0F58();
  if (((_BYTE)v19[4] & 1) != 0)
  {
    objc_msgSend(v10, sel_bounds);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
  }
  else
  {
    v32 = v19[2];
    v34 = v19[3];
    v28 = *v19;
    v30 = v19[1];
  }
  v35 = (void *)objc_opt_self();
  v36 = objc_msgSend(v35, sel_bezierPathWithRoundedRect_cornerRadius_, v28, v30, v32, v34, 44.0);
  objc_msgSend(v10, sel_bounds);
  v37 = objc_msgSend(v35, sel_bezierPathWithRect_);
  objc_msgSend(v36, sel_appendPath_, v37);

  v38 = objc_msgSend(v36, sel_CGPath);
  objc_msgSend(v26, sel_setPath_, v38);

  v39 = v10;
  v40 = sub_21C2A0E60();
  objc_msgSend(v39, sel_addSubview_, v40);

  v41 = sub_21C2A0E60();
  if (((_BYTE)v19[4] & 1) != 0)
  {
    objc_msgSend(v39, sel_bounds);
  }
  else
  {
    v44 = *((_QWORD *)v19 + 2);
    v45 = *((_QWORD *)v19 + 3);
    v42 = *v19;
    v43 = *((_QWORD *)v19 + 1);
  }
  MidX = CGRectGetMidX(*(CGRect *)&v42);
  if (((_BYTE)v19[4] & 1) != 0)
  {
    objc_msgSend(v39, sel_bounds);
  }
  else
  {
    v49 = *((_QWORD *)v19 + 2);
    v50 = *((_QWORD *)v19 + 3);
    v47 = *v19;
    v48 = *((_QWORD *)v19 + 1);
  }
  objc_msgSend(v41, sel_setCenter_, MidX + 3.0, CGRectGetMidY(*(CGRect *)&v47));

  v51 = sub_21C2A0E60();
  objc_msgSend(v51, sel_setAlpha_, 0.0);

  v52 = sub_21C2A0EE8();
  v53 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v54 = objc_msgSend(v53, sel_colorWithAlphaComponent_, 0.28);

  v55 = objc_msgSend(v54, sel_CGColor);
  objc_msgSend(v52, sel_setBackgroundColor_, v55);

  return v39;
}

void sub_21C2A1594()
{
  char *v0;
  id v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double MidX;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for CutoutView();
  objc_msgSendSuper2(&v14, sel_layoutSubviews);
  v1 = sub_21C2A0D9C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);

  v2 = sub_21C2A0E60();
  v3 = &v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  if ((v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
  {
    objc_msgSend(v0, sel_bounds);
  }
  else
  {
    v6 = *((_QWORD *)v3 + 2);
    v7 = *((_QWORD *)v3 + 3);
    v4 = *(_QWORD *)v3;
    v5 = *((_QWORD *)v3 + 1);
  }
  MidX = CGRectGetMidX(*(CGRect *)&v4);
  if ((v3[32] & 1) != 0)
  {
    objc_msgSend(v0, sel_bounds);
  }
  else
  {
    v11 = *((_QWORD *)v3 + 2);
    v12 = *((_QWORD *)v3 + 3);
    v9 = *(_QWORD *)v3;
    v10 = *((_QWORD *)v3 + 1);
  }
  objc_msgSend(v2, sel_setCenter_, MidX + 3.0, CGRectGetMidY(*(CGRect *)&v9));

  v13 = sub_21C2A0EE8();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v13, sel_setFrame_);

}

id sub_21C2A1778(void *a1, uint64_t a2, SEL *a3)
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for CutoutView();
  return objc_msgSendSuper2(&v5, *a3);
}

void sub_21C2A182C(SEL *a1, SEL *a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  objc_class *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  v13 = (objc_class *)type metadata accessor for CutoutView();
  v33.receiver = v6;
  v33.super_class = v13;
  objc_msgSendSuper2(&v33, *a1);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v32.receiver = v6;
  v32.super_class = v13;
  objc_msgSendSuper2(&v32, *a2, a3, a4, a5, a6);
  objc_msgSend(v6, *a1);
  v35.origin.x = v22;
  v35.origin.y = v23;
  v35.size.width = v24;
  v35.size.height = v25;
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  if (!CGRectEqualToRect(v34, v35))
  {
    v26 = sub_21C2A106C();
    v27 = (double *)&v6[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if ((v6[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
    {
      objc_msgSend(v6, sel_bounds);
    }
    else
    {
      v30 = v27[2];
      v31 = v27[3];
      v28 = *v27;
      v29 = v27[1];
    }
    objc_msgSend(v26, sel_setFrame_, v28, v29, v30, v31);

  }
}

void sub_21C2A1954(void (*a1)(), uint64_t a2, double a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  void *v9;
  void *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double *v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat *v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  id v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  char *v156;
  void *v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  double v163;
  double v164;
  double v165;
  double v166;
  __int128 v167;
  __int128 v168;
  __int128 aBlock;
  uint64_t (*v170)(uint64_t);
  void *v171;
  void (*v172)();
  uint64_t v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;

  v4 = v3;
  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21C2C3D90;
  sub_21C2943A8(0, &qword_255255AD8);
  *(_QWORD *)(v8 + 32) = sub_21C2C2474();
  *(_QWORD *)(v8 + 40) = sub_21C2C2474();
  *(_QWORD *)(v8 + 48) = sub_21C2C2474();
  *(_QWORD *)(v8 + 56) = sub_21C2C2474();
  sub_21C2C2288();
  v9 = (void *)objc_opt_self();
  objc_msgSend(v9, sel_begin);
  objc_msgSend(v9, sel_setAnimationDuration_, a3);
  v172 = a1;
  v173 = a2;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v170 = sub_21C2974B8;
  v171 = &block_descriptor_44;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_setCompletionBlock_, v10);
  _Block_release(v10);
  v11 = (double *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  v160 = v9;
  if ((v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
  {
    objc_msgSend(v4, sel_bounds);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v17 = v11[2];
    v19 = v11[3];
    v13 = *v11;
    v15 = v11[1];
  }
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v13, v15, v17, v19, 44.0);
  objc_msgSend(v4, sel_bounds);
  v22 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v21, sel_appendPath_, v22);

  v23 = objc_msgSend(v21, sel_CGPath);
  if (((_BYTE)v11[4] & 1) != 0)
  {
    objc_msgSend(v4, sel_bounds);
  }
  else
  {
    v26 = *((_QWORD *)v11 + 2);
    v27 = *((_QWORD *)v11 + 3);
    v24 = *v11;
    v25 = *((_QWORD *)v11 + 1);
  }
  v174 = CGRectInset(*(CGRect *)&v24, -14.0, -14.0);
  v28 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v174.origin.x, v174.origin.y, v174.size.width, v174.size.height, 44.0);
  objc_msgSend(v4, sel_bounds);
  v29 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v28, sel_appendPath_, v29);

  v30 = objc_msgSend(v28, sel_CGPath);
  if (((_BYTE)v11[4] & 1) != 0)
  {
    objc_msgSend(v4, sel_bounds);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
  }
  else
  {
    v36 = v11[2];
    v38 = v11[3];
    v32 = *v11;
    v34 = v11[1];
  }
  v175.origin.x = v32;
  v175.origin.y = v34;
  v175.size.width = v36;
  v175.size.height = v38;
  v39 = CGRectGetWidth(v175) * 0.5 + -0.1;
  v176.origin.x = v32;
  v176.origin.y = v34;
  v176.size.width = v36;
  v176.size.height = v38;
  v40 = CGRectGetHeight(v176) * 0.5 + -0.1;
  v177.origin.x = v32;
  v177.origin.y = v34;
  v177.size.width = v36;
  v177.size.height = v38;
  v178 = CGRectInset(v177, v39, v40);
  v41 = objc_msgSend(v20, sel_bezierPathWithRoundedRect_cornerRadius_, v178.origin.x, v178.origin.y, v178.size.width, v178.size.height, CGRectGetWidth(v178) * 0.5);
  objc_msgSend(v4, sel_bounds);
  v42 = objc_msgSend(v20, sel_bezierPathWithRect_);
  objc_msgSend(v41, sel_appendPath_, v42);

  v43 = objc_msgSend(v41, sel_CGPath);
  v44 = (void *)sub_21C2C21A4();
  v162 = (id)objc_opt_self();
  v45 = objc_msgSend(v162, sel_animationWithKeyPath_, v44);

  sub_21C2944A4(0, (unint64_t *)&qword_255255C90, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_21C2C3DA0;
  type metadata accessor for CGPath(0);
  *(_QWORD *)(v46 + 32) = v23;
  *(_QWORD *)(v46 + 56) = v47;
  *(_QWORD *)(v46 + 64) = v30;
  *(_QWORD *)(v46 + 120) = v47;
  *(_QWORD *)(v46 + 88) = v47;
  *(_QWORD *)(v46 + 96) = v43;
  v159 = v23;
  v48 = v30;
  v49 = v43;
  v50 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_setValues_, v50);

  v51 = (void *)sub_21C2C2264();
  objc_msgSend(v45, sel_setKeyTimes_, v51);

  v52 = sub_21C2A0F58();
  v161 = v45;
  v53 = objc_msgSend(v45, sel_values);
  if (!v53)
    goto LABEL_53;
  v54 = v53;
  v55 = sub_21C2C2270();

  v56 = sub_21C2B7580(v55);
  swift_bridgeObjectRelease();
  if (v56 >> 62)
  {
    swift_bridgeObjectRetain();
    v57 = (char *)sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v57 = *(char **)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v158 = v48;
  if (v57)
  {
    v58 = v57 - 1;
    if (__OFSUB__(v57, 1))
    {
      __break(1u);
    }
    else if ((v56 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)v58 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)v58 < *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v59 = (char *)*(id *)(v56 + 8 * (_QWORD)v58 + 32);
LABEL_19:
        v57 = v59;
        goto LABEL_20;
      }
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    v59 = (char *)MEMORY[0x220778DC8](v58, v56);
    goto LABEL_19;
  }
LABEL_20:
  swift_bridgeObjectRelease();
  objc_msgSend(v52, sel_setPath_, v57);

  v60 = sub_21C2A0F58();
  v61 = (void *)sub_21C2C21A4();
  objc_msgSend(v60, sel_addAnimation_forKey_, v161, v61);

  v62 = (void *)sub_21C2C21A4();
  v63 = objc_msgSend(v162, sel_animationWithKeyPath_, v62);

  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_21C2C3DA0;
  v157 = v49;
  if (*((_BYTE *)v11 + 32) == 1)
  {
    objc_msgSend(v4, sel_bounds);
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v72 = v71;
  }
  else
  {
    v70 = *((_QWORD *)v11 + 2);
    v72 = *((_QWORD *)v11 + 3);
    v66 = *v11;
    v68 = *((_QWORD *)v11 + 1);
  }
  type metadata accessor for CGRect(0);
  v74 = v73;
  *(_QWORD *)(v64 + 56) = v73;
  v75 = (double *)swift_allocObject();
  *(_QWORD *)(v64 + 32) = v75;
  v75[2] = v66;
  *((_QWORD *)v75 + 3) = v68;
  *((_QWORD *)v75 + 4) = v70;
  *((_QWORD *)v75 + 5) = v72;
  if (((_BYTE)v11[4] & 1) != 0)
  {
    objc_msgSend(v4, sel_bounds);
  }
  else
  {
    v78 = *((_QWORD *)v11 + 2);
    v79 = *((_QWORD *)v11 + 3);
    v76 = *v11;
    v77 = *((_QWORD *)v11 + 1);
  }
  v179 = CGRectInset(*(CGRect *)&v76, -14.0, -14.0);
  x = v179.origin.x;
  y = v179.origin.y;
  width = v179.size.width;
  height = v179.size.height;
  *(_QWORD *)(v64 + 88) = v74;
  v84 = (CGFloat *)swift_allocObject();
  *(_QWORD *)(v64 + 64) = v84;
  v84[2] = x;
  v84[3] = y;
  v84[4] = width;
  v84[5] = height;
  if (((_BYTE)v11[4] & 1) != 0)
  {
    objc_msgSend(v4, sel_bounds);
    v86 = v85;
    v88 = v87;
    v90 = v89;
    v92 = v91;
  }
  else
  {
    v90 = v11[2];
    v92 = v11[3];
    v86 = *v11;
    v88 = v11[1];
  }
  v180.origin.x = v86;
  v180.origin.y = v88;
  v180.size.width = v90;
  v180.size.height = v92;
  v93 = CGRectGetWidth(v180) * 0.5 + -0.1;
  v181.origin.x = v86;
  v181.origin.y = v88;
  v181.size.width = v90;
  v181.size.height = v92;
  v94 = CGRectGetHeight(v181) * 0.5 + -0.1;
  v182.origin.x = v86;
  v182.origin.y = v88;
  v182.size.width = v90;
  v182.size.height = v92;
  v183 = CGRectInset(v182, v93, v94);
  v95 = v183.origin.x;
  v96 = v183.origin.y;
  v97 = v183.size.width;
  v98 = v183.size.height;
  *(_QWORD *)(v64 + 120) = v74;
  v99 = (CGFloat *)swift_allocObject();
  *(_QWORD *)(v64 + 96) = v99;
  v99[2] = v95;
  v99[3] = v96;
  v99[4] = v97;
  v99[5] = v98;
  v100 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_setValues_, v100);

  v101 = (void *)sub_21C2C2264();
  objc_msgSend(v63, sel_setKeyTimes_, v101);

  v102 = sub_21C2A106C();
  v103 = objc_msgSend(v63, sel_values);
  if (!v103)
    goto LABEL_54;
  v104 = v103;
  v105 = sub_21C2C2270();

  v106 = *(_QWORD *)(v105 + 16);
  if (v106)
  {
    sub_21C2A77A4(v105 + 32 * v106, (uint64_t)&v167);
  }
  else
  {
    v167 = 0u;
    v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v168 + 1))
    goto LABEL_55;
  sub_21C2A77E0(&v167, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v102, sel_setBounds_, v163, v164, v165, v166);

  v107 = sub_21C2A106C();
  v108 = (void *)sub_21C2C21A4();
  objc_msgSend(v107, sel_addAnimation_forKey_, v63, v108);

  v109 = (void *)sub_21C2C21A4();
  v110 = objc_msgSend(v162, sel_animationWithKeyPath_, v109);

  v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = xmmword_21C2C3DA0;
  v112 = sub_21C2A106C();
  objc_msgSend(v112, sel_cornerRadius);
  v114 = v113;

  v115 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v111 + 56) = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v111 + 32) = v114;
  v116 = sub_21C2A106C();
  objc_msgSend(v116, sel_cornerRadius);
  v118 = v117;

  *(_QWORD *)(v111 + 88) = v115;
  *(_QWORD *)(v111 + 64) = v118;
  if (*((_BYTE *)v11 + 32) == 1)
  {
    objc_msgSend(v4, sel_bounds);
    v120 = v119;
    v122 = v121;
    v124 = v123;
    v126 = v125;
  }
  else
  {
    v124 = v11[2];
    v126 = v11[3];
    v120 = *v11;
    v122 = v11[1];
  }
  v184.origin.x = v120;
  v184.origin.y = v122;
  v184.size.width = v124;
  v184.size.height = v126;
  v127 = CGRectGetWidth(v184) * 0.5 + -0.1;
  v185.origin.x = v120;
  v185.origin.y = v122;
  v185.size.width = v124;
  v185.size.height = v126;
  v128 = CGRectGetHeight(v185) * 0.5 + -0.1;
  v186.origin.x = v120;
  v186.origin.y = v122;
  v186.size.width = v124;
  v186.size.height = v126;
  v187 = CGRectInset(v186, v127, v128);
  v129 = CGRectGetWidth(v187);
  *(_QWORD *)(v111 + 120) = v115;
  *(CGFloat *)(v111 + 96) = v129 * 0.5;
  v130 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v110, sel_setValues_, v130);

  v131 = (void *)sub_21C2C2264();
  objc_msgSend(v110, sel_setKeyTimes_, v131);

  v132 = sub_21C2A106C();
  v133 = objc_msgSend(v110, sel_values);
  if (!v133)
    goto LABEL_56;
  v134 = v133;
  v135 = sub_21C2C2270();

  v136 = *(_QWORD *)(v135 + 16);
  if (v136)
  {
    sub_21C2A77A4(v135 + 32 * v136, (uint64_t)&v167);
  }
  else
  {
    v167 = 0u;
    v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v168 + 1))
    goto LABEL_57;
  sub_21C2A77E0(&v167, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v132, sel_setCornerRadius_, v163);

  v137 = sub_21C2A106C();
  v138 = (void *)sub_21C2C21A4();
  objc_msgSend(v137, sel_addAnimation_forKey_, v110, v138);

  v139 = (void *)sub_21C2C21A4();
  v140 = objc_msgSend(v162, sel_animationWithKeyPath_, v139);

  v141 = swift_allocObject();
  *(_OWORD *)(v141 + 16) = xmmword_21C2C3DA0;
  v142 = MEMORY[0x24BEE14E8];
  *(_QWORD *)(v141 + 56) = MEMORY[0x24BEE14E8];
  *(_DWORD *)(v141 + 32) = 1065353216;
  *(_QWORD *)(v141 + 88) = v142;
  *(_DWORD *)(v141 + 64) = 1065353216;
  *(_QWORD *)(v141 + 120) = v142;
  *(_DWORD *)(v141 + 96) = 0;
  v143 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_setValues_, v143);

  v144 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v140, sel_setKeyTimes_, v144);

  v145 = sub_21C2A106C();
  v146 = objc_msgSend(v140, sel_values);
  if (!v146)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  v147 = v146;
  v148 = sub_21C2C2270();

  v149 = *(_QWORD *)(v148 + 16);
  if (v149)
  {
    sub_21C2A77A4(v148 + 32 * v149, (uint64_t)&v167);
  }
  else
  {
    v167 = 0u;
    v168 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v168 + 1))
  {
    sub_21C2A77E0(&v167, &aBlock);
    swift_dynamicCast();
    LODWORD(v150) = LODWORD(v163);
    objc_msgSend(v145, sel_setOpacity_, v150);

    v151 = sub_21C2A106C();
    v152 = (void *)sub_21C2C21A4();
    objc_msgSend(v151, sel_addAnimation_forKey_, v140, v152);

    v153 = (void *)objc_opt_self();
    v154 = swift_allocObject();
    *(_QWORD *)(v154 + 16) = v4;
    v172 = sub_21C2A77F0;
    v173 = v154;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v170 = sub_21C2974B8;
    v171 = &block_descriptor_53;
    v155 = _Block_copy(&aBlock);
    v156 = v4;
    swift_release();
    objc_msgSend(v153, sel_animateWithDuration_delay_options_animations_completion_, 0, v155, 0, (a3 + a3) / 3.0, a3 / 3.0);
    _Block_release(v155);
    objc_msgSend(v160, sel_commit);

    return;
  }
LABEL_59:
  __break(1u);
}

void sub_21C2A28F0(uint64_t a1, uint64_t a2, double a3, CGFloat a4)
{
  void *v4;
  void *v5;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  char *v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  id v47;
  id v48;
  id v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double *v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat *v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat *v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  double v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CGFloat v159;
  double v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  double v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  CGFloat v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  void *v178;
  void *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  void *v187;
  char *v188;
  id v189;
  char *v190;
  id v191;
  void *v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  void *v205;
  void *v206;
  uint64_t v207;
  void *v208;
  char *v209;
  void *v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  id v215;
  CATransform3D aBlock;
  double v217;
  double v218;
  double v219;
  double v220;
  __int128 v221;
  __int128 v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;

  v5 = v4;
  if (a4 == 0.0)
    v10 = 0.0;
  else
    v10 = 10.0;
  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21C2C3DB0;
  sub_21C2943A8(0, &qword_255255AD8);
  *(_QWORD *)(v11 + 32) = sub_21C2C2474();
  *(_QWORD *)(v11 + 40) = sub_21C2C2474();
  *(_QWORD *)(v11 + 48) = sub_21C2C2474();
  *(_QWORD *)(v11 + 56) = sub_21C2C2474();
  *(_QWORD *)(v11 + 64) = sub_21C2C2474();
  *(_QWORD *)&aBlock.m11 = v11;
  sub_21C2C2288();
  v12 = (void *)objc_opt_self();
  objc_msgSend(v12, sel_begin);
  objc_msgSend(v12, sel_setAnimationDuration_, a3);
  v13 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x24BDE5D20]);
  objc_msgSend(v12, sel_setAnimationTimingFunction_, v13);

  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v5;
  v14[3] = a1;
  v14[4] = a2;
  *(_QWORD *)&aBlock.m21 = sub_21C2A7788;
  *(_QWORD *)&aBlock.m22 = v14;
  *(_QWORD *)&aBlock.m11 = MEMORY[0x24BDAC760];
  *(_QWORD *)&aBlock.m12 = 1107296256;
  *(_QWORD *)&aBlock.m13 = sub_21C2974B8;
  *(_QWORD *)&aBlock.m14 = &block_descriptor_29;
  v15 = _Block_copy(&aBlock);
  v16 = v5;
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_setCompletionBlock_, v15);
  _Block_release(v15);
  v17 = (double *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  v214 = v12;
  if ((v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    v23 = v17[2];
    v25 = v17[3];
    v19 = *v17;
    v21 = v17[1];
  }
  v26 = (void *)objc_opt_self();
  v27 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v19, v21, v23, v25, 44.0);
  objc_msgSend(v16, sel_bounds);
  v28 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v27, sel_appendPath_, v28);

  v29 = objc_msgSend(v27, sel_CGPath);
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v32 = *((_QWORD *)v17 + 2);
    v33 = *((_QWORD *)v17 + 3);
    v30 = *v17;
    v31 = *((_QWORD *)v17 + 1);
  }
  v223 = CGRectInset(*(CGRect *)&v30, -14.0, -14.0);
  v34 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v223.origin.x, v223.origin.y, v223.size.width, v223.size.height, 44.0);
  objc_msgSend(v16, sel_bounds);
  v35 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v34, sel_appendPath_, v35);

  v36 = objc_msgSend(v34, sel_CGPath);
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v39 = *((_QWORD *)v17 + 2);
    v40 = *((_QWORD *)v17 + 3);
    v37 = *v17;
    v38 = *((_QWORD *)v17 + 1);
  }
  v41 = CGRectGetMidX(*(CGRect *)&v37) + -40.0;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v44 = *((_QWORD *)v17 + 2);
    v45 = *((_QWORD *)v17 + 3);
    v42 = *v17;
    v43 = *((_QWORD *)v17 + 1);
  }
  v224.origin.y = CGRectGetMidY(*(CGRect *)&v42) + -40.0;
  v224.size.width = 80.0;
  v224.origin.x = v41;
  v224.size.height = 80.0;
  v225 = CGRectInset(v224, 6.0, 6.0);
  v46 = v10 + a4;
  v226 = CGRectOffset(v225, 0.0, v10 + a4);
  v47 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v226.origin.x, v226.origin.y, v226.size.width, v226.size.height, CGRectGetWidth(v226) * 0.5);
  objc_msgSend(v16, sel_bounds);
  v48 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v47, sel_appendPath_, v48);

  v49 = objc_msgSend(v47, sel_CGPath);
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v52 = *((_QWORD *)v17 + 2);
    v53 = *((_QWORD *)v17 + 3);
    v50 = *v17;
    v51 = *((_QWORD *)v17 + 1);
  }
  v54 = CGRectGetMidX(*(CGRect *)&v50) + -40.0;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v57 = *((_QWORD *)v17 + 2);
    v58 = *((_QWORD *)v17 + 3);
    v55 = *v17;
    v56 = *((_QWORD *)v17 + 1);
  }
  v227.origin.y = CGRectGetMidY(*(CGRect *)&v55) + -40.0;
  v227.size.width = 80.0;
  v227.origin.x = v54;
  v227.size.height = 80.0;
  v228 = CGRectOffset(v227, 0.0, a4);
  v59 = objc_msgSend(v26, sel_bezierPathWithRoundedRect_cornerRadius_, v228.origin.x, v228.origin.y, v228.size.width, v228.size.height, CGRectGetWidth(v228) * 0.5);
  objc_msgSend(v16, sel_bounds);
  v60 = objc_msgSend(v26, sel_bezierPathWithRect_);
  objc_msgSend(v59, sel_appendPath_, v60);

  v61 = objc_msgSend(v59, sel_CGPath);
  v62 = (void *)sub_21C2C21A4();
  v215 = (id)objc_opt_self();
  v63 = objc_msgSend(v215, sel_animationWithKeyPath_, v62);

  sub_21C2944A4(0, (unint64_t *)&qword_255255C90, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_21C2C3DC0;
  type metadata accessor for CGPath(0);
  *(_QWORD *)(v64 + 32) = v29;
  *(_QWORD *)(v64 + 56) = v65;
  *(_QWORD *)(v64 + 64) = v36;
  *(_QWORD *)(v64 + 88) = v65;
  *(_QWORD *)(v64 + 96) = v49;
  *(_QWORD *)(v64 + 152) = v65;
  *(_QWORD *)(v64 + 120) = v65;
  *(_QWORD *)(v64 + 128) = v61;
  v213 = v29;
  v66 = v36;
  v67 = v49;
  v212 = v61;
  v68 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_setValues_, v68);

  v69 = (void *)sub_21C2C2264();
  objc_msgSend(v63, sel_setKeyTimes_, v69);

  v70 = sub_21C2A0F58();
  v71 = objc_msgSend(v63, sel_values);
  if (!v71)
    goto LABEL_78;
  v72 = v71;
  v73 = sub_21C2C2270();

  v74 = sub_21C2B7580(v73);
  swift_bridgeObjectRelease();
  if (v74 >> 62)
  {
    swift_bridgeObjectRetain();
    v75 = (char *)sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v75 = *(char **)((v74 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v211 = v66;
  if (v75)
  {
    v76 = v75 - 1;
    if (__OFSUB__(v75, 1))
    {
      __break(1u);
    }
    else if ((v74 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)v76 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)v76 < *(_QWORD *)((v74 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v77 = (char *)*(id *)(v74 + 8 * (_QWORD)v76 + 32);
LABEL_31:
        v75 = v77;
        goto LABEL_32;
      }
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    v77 = (char *)MEMORY[0x220778DC8](v76, v74);
    goto LABEL_31;
  }
LABEL_32:
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_setPath_, v75);

  v78 = sub_21C2A0F58();
  v79 = (void *)sub_21C2C21A4();
  objc_msgSend(v78, sel_addAnimation_forKey_, v63, v79);

  v80 = (void *)sub_21C2C21A4();
  v81 = objc_msgSend(v215, (SEL)0x24E02AF1DLL, v80);

  v82 = swift_allocObject();
  *(_OWORD *)(v82 + 16) = xmmword_21C2C3DC0;
  if (*((_BYTE *)v17 + 32) == 1)
  {
    objc_msgSend(v16, sel_bounds);
    v84 = v83;
    v86 = v85;
    v88 = v87;
    v90 = v89;
  }
  else
  {
    v88 = *((_QWORD *)v17 + 2);
    v90 = *((_QWORD *)v17 + 3);
    v84 = *v17;
    v86 = *((_QWORD *)v17 + 1);
  }
  type metadata accessor for CGRect(0);
  v92 = v91;
  *(_QWORD *)(v82 + 56) = v91;
  v93 = (double *)swift_allocObject();
  *(_QWORD *)(v82 + 32) = v93;
  v93[2] = v84;
  *((_QWORD *)v93 + 3) = v86;
  *((_QWORD *)v93 + 4) = v88;
  *((_QWORD *)v93 + 5) = v90;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v96 = *((_QWORD *)v17 + 2);
    v97 = *((_QWORD *)v17 + 3);
    v94 = *v17;
    v95 = *((_QWORD *)v17 + 1);
  }
  v229 = CGRectInset(*(CGRect *)&v94, -14.0, -14.0);
  x = v229.origin.x;
  y = v229.origin.y;
  width = v229.size.width;
  height = v229.size.height;
  *(_QWORD *)(v82 + 88) = v92;
  v102 = (CGFloat *)swift_allocObject();
  *(_QWORD *)(v82 + 64) = v102;
  v102[2] = x;
  v102[3] = y;
  v102[4] = width;
  v102[5] = height;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v105 = *((_QWORD *)v17 + 2);
    v106 = *((_QWORD *)v17 + 3);
    v103 = *v17;
    v104 = *((_QWORD *)v17 + 1);
  }
  v107 = CGRectGetMidX(*(CGRect *)&v103) + -40.0;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v110 = *((_QWORD *)v17 + 2);
    v111 = *((_QWORD *)v17 + 3);
    v108 = *v17;
    v109 = *((_QWORD *)v17 + 1);
  }
  v230.origin.y = CGRectGetMidY(*(CGRect *)&v108) + -40.0;
  v230.size.width = 80.0;
  v230.origin.x = v107;
  v230.size.height = 80.0;
  v231 = CGRectInset(v230, 6.0, 6.0);
  v232 = CGRectOffset(v231, 0.0, v46);
  v112 = v232.origin.x;
  v113 = v232.origin.y;
  v114 = v232.size.width;
  v115 = v232.size.height;
  *(_QWORD *)(v82 + 120) = v92;
  v116 = (CGFloat *)swift_allocObject();
  *(_QWORD *)(v82 + 96) = v116;
  v116[2] = v112;
  v116[3] = v113;
  v116[4] = v114;
  v116[5] = v115;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v119 = *((_QWORD *)v17 + 2);
    v120 = *((_QWORD *)v17 + 3);
    v117 = *v17;
    v118 = *((_QWORD *)v17 + 1);
  }
  v121 = CGRectGetMidX(*(CGRect *)&v117) + -40.0;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v124 = *((_QWORD *)v17 + 2);
    v125 = *((_QWORD *)v17 + 3);
    v122 = *v17;
    v123 = *((_QWORD *)v17 + 1);
  }
  v233.origin.y = CGRectGetMidY(*(CGRect *)&v122) + -40.0;
  v233.size.width = 80.0;
  v233.origin.x = v121;
  v233.size.height = 80.0;
  v234 = CGRectOffset(v233, 0.0, a4);
  v126 = v234.origin.x;
  v127 = v234.origin.y;
  v128 = v234.size.width;
  v129 = v234.size.height;
  *(_QWORD *)(v82 + 152) = v92;
  v130 = (CGFloat *)swift_allocObject();
  *(_QWORD *)(v82 + 128) = v130;
  v130[2] = v126;
  v130[3] = v127;
  v130[4] = v128;
  v130[5] = v129;
  v131 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v81, sel_setValues_, v131);

  v132 = (void *)sub_21C2C2264();
  objc_msgSend(v81, sel_setKeyTimes_, v132);

  v133 = sub_21C2A106C();
  v134 = objc_msgSend(v81, sel_values);
  if (!v134)
    goto LABEL_79;
  v135 = v134;
  v136 = sub_21C2C2270();

  v137 = *(_QWORD *)(v136 + 16);
  if (v137)
  {
    sub_21C2A77A4(v136 + 32 * v137, (uint64_t)&v221);
  }
  else
  {
    v221 = 0u;
    v222 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v222 + 1))
    goto LABEL_80;
  sub_21C2A77E0(&v221, &aBlock);
  swift_dynamicCast();
  objc_msgSend(v133, sel_setBounds_, v217, v218, v219, v220);

  v138 = sub_21C2A106C();
  v139 = (void *)sub_21C2C21A4();
  objc_msgSend(v138, sel_addAnimation_forKey_, v81, v139);

  v140 = (void *)sub_21C2C21A4();
  v141 = objc_msgSend(v215, (SEL)0x24E02AF1DLL, v140);

  v142 = swift_allocObject();
  *(_OWORD *)(v142 + 16) = xmmword_21C2C3DC0;
  v143 = sub_21C2A106C();
  objc_msgSend(v143, sel_cornerRadius);
  v145 = v144;

  v146 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v142 + 56) = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v142 + 32) = v145;
  v147 = sub_21C2A106C();
  objc_msgSend(v147, sel_cornerRadius);
  v149 = v148;

  *(_QWORD *)(v142 + 88) = v146;
  *(_QWORD *)(v142 + 64) = v149;
  if (*((_BYTE *)v17 + 32) == 1)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v152 = *((_QWORD *)v17 + 2);
    v153 = *((_QWORD *)v17 + 3);
    v150 = *v17;
    v151 = *((_QWORD *)v17 + 1);
  }
  v154 = CGRectGetMidX(*(CGRect *)&v150) + -40.0;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v157 = *((_QWORD *)v17 + 2);
    v158 = *((_QWORD *)v17 + 3);
    v155 = *v17;
    v156 = *((_QWORD *)v17 + 1);
  }
  v235.origin.y = CGRectGetMidY(*(CGRect *)&v155) + -40.0;
  v235.size.width = 80.0;
  v235.origin.x = v154;
  v235.size.height = 80.0;
  v236 = CGRectInset(v235, 6.0, 6.0);
  v159 = CGRectGetWidth(v236);
  *(_QWORD *)(v142 + 120) = v146;
  *(CGFloat *)(v142 + 96) = v159 * 0.5;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v162 = *((_QWORD *)v17 + 2);
    v163 = *((_QWORD *)v17 + 3);
    v160 = *v17;
    v161 = *((_QWORD *)v17 + 1);
  }
  v164 = CGRectGetMidX(*(CGRect *)&v160) + -40.0;
  v210 = v81;
  if (((_BYTE)v17[4] & 1) != 0)
  {
    objc_msgSend(v16, sel_bounds);
  }
  else
  {
    v167 = *((_QWORD *)v17 + 2);
    v168 = *((_QWORD *)v17 + 3);
    v165 = *v17;
    v166 = *((_QWORD *)v17 + 1);
  }
  v237.origin.y = CGRectGetMidY(*(CGRect *)&v165) + -40.0;
  v237.size.width = 80.0;
  v237.origin.x = v164;
  v237.size.height = 80.0;
  v169 = CGRectGetWidth(v237);
  *(_QWORD *)(v142 + 152) = v146;
  *(CGFloat *)(v142 + 128) = v169 * 0.5;
  v170 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  objc_msgSend(v141, sel_setValues_, v170);

  v171 = (void *)sub_21C2C2264();
  objc_msgSend(v141, sel_setKeyTimes_, v171);

  v172 = sub_21C2A106C();
  v173 = objc_msgSend(v141, sel_values);
  if (!v173)
    goto LABEL_81;
  v174 = v173;
  v175 = sub_21C2C2270();

  v176 = *(_QWORD *)(v175 + 16);
  if (v176)
  {
    sub_21C2A77A4(v175 + 32 * v176, (uint64_t)&v221);
  }
  else
  {
    v221 = 0u;
    v222 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v222 + 1))
  {
    sub_21C2A77E0(&v221, &aBlock);
    swift_dynamicCast();
    objc_msgSend(v172, sel_setCornerRadius_, v217);

    v177 = sub_21C2A106C();
    v178 = (void *)sub_21C2C21A4();
    objc_msgSend(v177, (SEL)0x24E02AEC8, v141, v178);

    v179 = (void *)sub_21C2C21A4();
    v180 = objc_msgSend(v215, (SEL)0x24E02AF1DLL, v179);

    v181 = swift_allocObject();
    *(_OWORD *)(v181 + 16) = xmmword_21C2C3DC0;
    v182 = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v181 + 32) = 0;
    *(_QWORD *)(v181 + 88) = v182;
    *(_QWORD *)(v181 + 56) = v182;
    *(_QWORD *)(v181 + 64) = 0;
    *(_QWORD *)(v181 + 120) = v182;
    *(double *)(v181 + 96) = v46;
    *(_QWORD *)(v181 + 152) = v146;
    *(CGFloat *)(v181 + 128) = a4;
    v183 = (void *)sub_21C2C2264();
    swift_bridgeObjectRelease();
    objc_msgSend(v180, sel_setValues_, v183);

    v184 = (void *)sub_21C2C2264();
    swift_bridgeObjectRelease();
    objc_msgSend(v180, sel_setKeyTimes_, v184);

    v185 = sub_21C2A106C();
    CATransform3DMakeTranslation(&aBlock, 0.0, a4, 0.0);
    objc_msgSend(v185, sel_setTransform_, &aBlock);

    v186 = sub_21C2A106C();
    v187 = (void *)sub_21C2C21A4();
    objc_msgSend(v186, (SEL)0x24E02AEC8, v180, v187);

    v188 = sub_21C2A0E60();
    v189 = objc_msgSend(v188, sel_layer);

    CATransform3DMakeTranslation(&aBlock, 0.0, a4, 0.0);
    objc_msgSend(v189, sel_setTransform_, &aBlock);

    v190 = sub_21C2A0E60();
    v191 = objc_msgSend(v190, sel_layer);

    v192 = (void *)sub_21C2C21A4();
    objc_msgSend(v191, (SEL)0x24E02AEC8, v180, v192);

    v193 = (void *)sub_21C2C21A4();
    v194 = objc_msgSend((id)objc_opt_self(), (SEL)0x24E02AF1DLL, v193);

    v195 = (void *)objc_opt_self();
    v196 = objc_msgSend(v195, sel_clearColor);
    v197 = objc_msgSend(v196, sel_CGColor);

    objc_msgSend(v194, sel_setFromValue_, v197);
    v198 = objc_msgSend(v195, sel_whiteColor);
    v199 = objc_msgSend(v198, sel_CGColor);

    objc_msgSend(v194, sel_setToValue_, v199);
    objc_msgSend(v194, sel_setDuration_, a3 / 3.0);
    v200 = v194;
    objc_msgSend(v200, sel_setBeginTime_, a3 * 0.5 + CACurrentMediaTime());

    objc_msgSend(v200, sel_setFillMode_, *MEMORY[0x24BDE5968]);
    v201 = sub_21C2A106C();
    v202 = objc_msgSend(v195, sel_whiteColor);
    v203 = objc_msgSend(v202, sel_CGColor);

    objc_msgSend(v201, sel_setBackgroundColor_, v203);
    v204 = sub_21C2A106C();
    v205 = (void *)sub_21C2C21A4();
    objc_msgSend(v204, (SEL)0x24E02AEC8, v200, v205);

    objc_msgSend(v214, sel_commit);
    v206 = (void *)objc_opt_self();
    v207 = swift_allocObject();
    *(_QWORD *)(v207 + 16) = v16;
    *(_QWORD *)&aBlock.m21 = sub_21C2A77F0;
    *(_QWORD *)&aBlock.m22 = v207;
    *(_QWORD *)&aBlock.m11 = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock.m12 = 1107296256;
    *(_QWORD *)&aBlock.m13 = sub_21C2974B8;
    *(_QWORD *)&aBlock.m14 = &block_descriptor_41;
    v208 = _Block_copy(&aBlock);
    v209 = v16;
    swift_release();
    objc_msgSend(v206, sel_animateWithDuration_delay_options_animations_completion_, 0, v208, 0, (a3 + a3) / 3.0, a3 / 3.0);

    _Block_release(v208);
    return;
  }
LABEL_82:
  __break(1u);
}

void sub_21C2A3DDC(uint64_t a1, void *a2, uint64_t a3)
{
  char *v5;
  char *v6;

  v5 = sub_21C2A0E60();
  objc_msgSend(v5, sel_setAlpha_, 1.0);

  v6 = sub_21C2A0E60();
  sub_21C2A531C(1, a2, a3, 1.0);

}

void sub_21C2A3E54(void (*a1)(id), uint64_t a2, double a3)
{
  char *v3;
  void *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char *v17;
  char *v18;
  id v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  char *v61;
  id v62;
  id v63;
  id v64;
  double v65;
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  id v72;
  double v73;
  double v74;
  double v75;
  double v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  double v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  CGFloat v112;
  void *v113;
  char *v114;
  uint64_t v115;
  void *v116;
  char *v117;
  void *v118;
  void *v119;
  CATransform3D aBlock;

  v7 = (void *)objc_opt_self();
  objc_msgSend(v7, sel_begin);
  if (a3 <= 0.0)
  {
    objc_msgSend(v7, sel_setDisableActions_, 1);
    objc_msgSend(v7, sel_setAnimationDuration_, 0.0);
    v17 = sub_21C2A0E60();
    objc_msgSend(v17, sel_setAlpha_, 0.0);

    v18 = sub_21C2A0E60();
    objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer], sel_setStrokeEnd_, 0.0);

    v19 = sub_21C2A0F58();
    v20 = (double *)&v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if ((v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
    {
      objc_msgSend(v3, sel_bounds);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
    }
    else
    {
      v26 = v20[2];
      v28 = v20[3];
      v22 = *v20;
      v24 = v20[1];
    }
    v57 = (void *)objc_opt_self();
    v58 = objc_msgSend(v57, sel_bezierPathWithRoundedRect_cornerRadius_, v22, v24, v26, v28, 44.0);
    objc_msgSend(v3, sel_bounds);
    v59 = objc_msgSend(v57, sel_bezierPathWithRect_);
    objc_msgSend(v58, sel_appendPath_, v59);

    v60 = objc_msgSend(v58, sel_CGPath);
    objc_msgSend(v19, sel_setPath_, v60);

    v61 = sub_21C2A0E60();
    v62 = objc_msgSend(v61, sel_layer);

    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v62, sel_setTransform_, &aBlock);

    v63 = sub_21C2A106C();
    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v63, sel_setTransform_, &aBlock);

    v64 = sub_21C2A106C();
    LODWORD(v65) = 1.0;
    objc_msgSend(v64, sel_setOpacity_, v65);

    v66 = sub_21C2A106C();
    if (((_BYTE)v20[4] & 1) != 0)
    {
      objc_msgSend(v3, sel_bounds);
    }
    else
    {
      v69 = v20[2];
      v70 = v20[3];
      v67 = *v20;
      v68 = v20[1];
    }
    objc_msgSend(v66, sel_setFrame_, v67, v68, v69, v70);

    v77 = sub_21C2A106C();
    objc_msgSend(v77, sel_setCornerRadius_, 44.0);

    v78 = sub_21C2A106C();
    v79 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v80 = objc_msgSend(v79, sel_CGColor);

    objc_msgSend(v78, sel_setBackgroundColor_, v80);
    v81 = sub_21C2A0D9C();
    objc_msgSend(v81, sel_setAlpha_, 0.0);

    v82 = objc_msgSend(v7, sel_commit);
    if (a1)
      a1(v82);
  }
  else
  {
    objc_msgSend(v7, sel_setAnimationDuration_, a3);
    if (a1)
    {
      *(_QWORD *)&aBlock.m21 = a1;
      *(_QWORD *)&aBlock.m22 = a2;
      *(_QWORD *)&aBlock.m11 = MEMORY[0x24BDAC760];
      *(_QWORD *)&aBlock.m12 = 1107296256;
      *(_QWORD *)&aBlock.m13 = sub_21C2974B8;
      *(_QWORD *)&aBlock.m14 = &block_descriptor_23;
      a1 = (void (*)(id))_Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v7, sel_setCompletionBlock_, a1);
    _Block_release(a1);
    v8 = (double *)&v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    if ((v3[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame + 32] & 1) != 0)
    {
      objc_msgSend(v3, sel_bounds);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
    }
    else
    {
      v14 = v8[2];
      v16 = v8[3];
      v10 = *v8;
      v12 = v8[1];
    }
    v29 = (void *)objc_opt_self();
    v30 = objc_msgSend(v29, sel_bezierPathWithRoundedRect_cornerRadius_, v10, v12, v14, v16, 44.0);
    objc_msgSend(v3, sel_bounds);
    v31 = objc_msgSend(v29, sel_bezierPathWithRect_);
    objc_msgSend(v30, sel_appendPath_, v31);

    v32 = objc_msgSend(v30, sel_CGPath);
    v33 = (void *)sub_21C2C21A4();
    v34 = (void *)objc_opt_self();
    v35 = objc_msgSend(v34, sel_animationWithKeyPath_, v33);

    v36 = sub_21C2A0F58();
    v37 = objc_msgSend(v36, sel_path);

    objc_msgSend(v35, sel_setFromValue_, v37);
    objc_msgSend(v35, sel_setToValue_, v32);
    v38 = sub_21C2A0F58();
    v119 = v32;
    objc_msgSend(v38, sel_setPath_, v32);

    v39 = sub_21C2A0F58();
    v40 = (void *)sub_21C2C21A4();
    v118 = v35;
    objc_msgSend(v39, sel_addAnimation_forKey_, v35, v40);

    v41 = (void *)sub_21C2C21A4();
    v42 = objc_msgSend(v34, (SEL)0x24E02AF1DLL, v41);

    v43 = sub_21C2A106C();
    v44 = objc_msgSend(v43, sel_backgroundColor);

    objc_msgSend(v42, (SEL)&selRef_initWithScanResult_limit_resultsHandler_ + 5, v44);
    v45 = (void *)objc_opt_self();
    v46 = objc_msgSend(v45, sel_clearColor);
    v47 = objc_msgSend(v46, sel_CGColor);

    objc_msgSend(v42, sel_setToValue_, v47);
    v48 = sub_21C2A106C();
    v49 = objc_msgSend(v45, sel_clearColor);
    v50 = objc_msgSend(v49, sel_CGColor);

    objc_msgSend(v48, sel_setBackgroundColor_, v50);
    v51 = sub_21C2A106C();
    v52 = (void *)sub_21C2C21A4();
    objc_msgSend(v51, sel_addAnimation_forKey_, v42, v52);

    v53 = (void *)sub_21C2C21A4();
    v54 = objc_msgSend(v34, sel_animationWithKeyPath_, v53);

    v55 = sub_21C2A106C();
    objc_msgSend(v55, sel_bounds);

    v56 = (void *)sub_21C2C2450();
    objc_msgSend(v54, sel_setFromValue_, v56);

    if (*((_BYTE *)v8 + 32) == 1)
      objc_msgSend(v3, sel_bounds);
    v71 = (void *)sub_21C2C2450();
    objc_msgSend(v54, sel_setToValue_, v71);

    v72 = sub_21C2A106C();
    if (((_BYTE)v8[4] & 1) != 0)
    {
      objc_msgSend(v3, sel_bounds);
    }
    else
    {
      v75 = v8[2];
      v76 = v8[3];
      v73 = *v8;
      v74 = v8[1];
    }
    objc_msgSend(v72, sel_setBounds_, v73, v74, v75, v76);

    v83 = sub_21C2A106C();
    v84 = (void *)sub_21C2C21A4();
    objc_msgSend(v83, (SEL)0x24E02AEC8, v54, v84);

    v85 = (void *)sub_21C2C21A4();
    v86 = objc_msgSend(v34, sel_animationWithKeyPath_, v85);

    v87 = sub_21C2A106C();
    objc_msgSend(v87, sel_cornerRadius);

    v88 = (void *)sub_21C2C1A3C();
    objc_msgSend(v86, (SEL)&selRef_initWithScanResult_limit_resultsHandler_ + 5, v88);

    v89 = (void *)sub_21C2C1A3C();
    objc_msgSend(v86, sel_setToValue_, v89);

    v90 = sub_21C2A106C();
    objc_msgSend(v90, sel_setCornerRadius_, 44.0);

    v91 = sub_21C2A106C();
    v92 = (void *)sub_21C2C21A4();
    objc_msgSend(v91, (SEL)0x24E02AEC8, v86, v92);

    v93 = (void *)sub_21C2C21A4();
    v94 = objc_msgSend(v34, sel_animationWithKeyPath_, v93);

    v95 = sub_21C2A106C();
    objc_msgSend(v95, sel_opacity);

    v96 = (void *)sub_21C2C2318();
    objc_msgSend(v94, (SEL)&selRef_initWithScanResult_limit_resultsHandler_ + 5, v96);

    v97 = (void *)sub_21C2C1A3C();
    objc_msgSend(v94, sel_setToValue_, v97);

    v98 = sub_21C2A106C();
    LODWORD(v99) = 1.0;
    objc_msgSend(v98, sel_setOpacity_, v99);

    v100 = sub_21C2A106C();
    v101 = (void *)sub_21C2C21A4();
    objc_msgSend(v100, (SEL)0x24E02AEC8, v94, v101);

    v102 = (void *)sub_21C2C21A4();
    v103 = objc_msgSend(v34, sel_animationWithKeyPath_, v102);

    v104 = sub_21C2A106C();
    objc_msgSend(v104, sel_transform);

    v105 = (void *)sub_21C2C1A3C();
    objc_msgSend(v103, (SEL)&selRef_initWithScanResult_limit_resultsHandler_ + 5, v105);

    v106 = (void *)sub_21C2C1A3C();
    objc_msgSend(v103, (SEL)0x24E02AAD3, v106);

    v107 = sub_21C2A106C();
    CATransform3DMakeTranslation(&aBlock, 0.0, 0.0, 0.0);
    objc_msgSend(v107, sel_setTransform_, &aBlock);

    v108 = sub_21C2A106C();
    v109 = (void *)sub_21C2C21A4();
    objc_msgSend(v108, (SEL)0x24E02AEC8, v103, v109);

    objc_msgSend(v7, sel_commit);
    v110 = (void *)objc_opt_self();
    v111 = swift_allocObject();
    *(_QWORD *)(v111 + 16) = v3;
    *(_QWORD *)&aBlock.m21 = sub_21C2A774C;
    *(_QWORD *)&aBlock.m22 = v111;
    v112 = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock.m11 = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock.m12 = 1107296256;
    *(_QWORD *)&aBlock.m13 = sub_21C2974B8;
    *(_QWORD *)&aBlock.m14 = &block_descriptor_14;
    v113 = _Block_copy(&aBlock);
    v114 = v3;
    swift_release();
    v115 = swift_allocObject();
    *(_QWORD *)(v115 + 16) = v114;
    *(_QWORD *)&aBlock.m21 = sub_21C2A7754;
    *(_QWORD *)&aBlock.m22 = v115;
    aBlock.m11 = v112;
    *(_QWORD *)&aBlock.m12 = 1107296256;
    *(_QWORD *)&aBlock.m13 = sub_21C2A4D04;
    *(_QWORD *)&aBlock.m14 = &block_descriptor_20;
    v116 = _Block_copy(&aBlock);
    v117 = v114;
    swift_release();
    objc_msgSend(v110, sel_animateWithDuration_animations_completion_, v113, v116, a3);
    _Block_release(v116);
    _Block_release(v113);

  }
}

void sub_21C2A4BE8()
{
  id v0;
  char *v1;

  v0 = sub_21C2A0D9C();
  objc_msgSend(v0, sel_setAlpha_, 0.0);

  v1 = sub_21C2A0E60();
  objc_msgSend(v1, sel_setAlpha_, 0.0);

}

void sub_21C2A4C48()
{
  char *v0;
  char *v1;
  id v2;
  CATransform3D v3;

  v0 = sub_21C2A0E60();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer], sel_setStrokeEnd_, 0.0);

  v1 = sub_21C2A0E60();
  v2 = objc_msgSend(v1, sel_layer);

  CATransform3DMakeTranslation(&v3, 0.0, 0.0, 0.0);
  objc_msgSend(v2, sel_setTransform_, &v3);

}

uint64_t sub_21C2A4D04(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_21C2A4D40(uint64_t a1)
{
  return sub_21C2A6D90(a1, type metadata accessor for CutoutView);
}

uint64_t type metadata accessor for CutoutView()
{
  return objc_opt_self();
}

char *sub_21C2A4DD4(double a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  id v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  objc_super v36;

  v3 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  v4 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_init);
  *(double *)&v5[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize] = a1;

  v36.receiver = v5;
  v36.super_class = (Class)type metadata accessor for MedsCompletionCheckmarkView();
  v6 = objc_msgSendSuper2(&v36, sel_initWithFrame_, 0.0, 0.0, a1, a1);
  v7 = objc_msgSend(v6, sel_layer);
  objc_msgSend(v7, sel_setCornerRadius_, a1 * 0.5);

  v8 = (void *)objc_opt_self();
  v9 = (char *)v6;
  v10 = objc_msgSend(v8, sel_clearColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD420]), sel_init);
  v12 = *(double *)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize];
  objc_msgSend(v11, sel_moveToPoint_, v12 * 0.31, v12 * 0.52);
  objc_msgSend(v11, sel_addLineToPoint_, v12 * 0.44, v12 * 0.66);
  objc_msgSend(v11, sel_addLineToPoint_, v12 * 0.62, v12 * 0.34);
  objc_msgSend(v11, sel_setLineCapStyle_, 1);
  v13 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  v14 = *(id *)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer];
  v15 = objc_msgSend(v11, sel_CGPath);
  objc_msgSend(v14, sel_setPath_, v15);

  v16 = *(void **)&v9[v13];
  objc_msgSend(v16, sel_setLineWidth_, a1 * 0.1);
  objc_msgSend(v16, sel_setLineCap_, *MEMORY[0x24BDE5CE8]);
  objc_msgSend(v16, sel_setLineJoin_, *MEMORY[0x24BDE5D08]);
  v17 = v16;
  v18 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v18, sel_bounds);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v17, sel_setFrame_, v20, v22, v24, v26);
  v27 = *(id *)&v9[v13];
  v28 = objc_msgSend(v8, sel_systemBlueColor);
  v29 = objc_msgSend(v28, sel_CGColor);

  objc_msgSend(v27, sel_setStrokeColor_, v29);
  v30 = *(id *)&v9[v13];
  v31 = objc_msgSend(v8, sel_clearColor);
  v32 = objc_msgSend(v31, sel_CGColor);

  objc_msgSend(v30, sel_setBackgroundColor_, v32);
  v33 = *(void **)&v9[v13];
  objc_msgSend(v33, sel_setFillColor_, 0);
  v34 = objc_msgSend(v9, sel_layer);
  objc_msgSend(v34, sel_addSublayer_, v33);

  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v9;
}

void sub_21C2A531C(char a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  if ((a1 & 1) != 0)
  {
    v8 = (void *)objc_opt_self();
    objc_msgSend(v8, sel_begin);
    objc_msgSend(v8, sel_setAnimationDuration_, 0.3);
    if (a2)
    {
      v23[4] = a2;
      v23[5] = a3;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 1107296256;
      v23[2] = sub_21C2974B8;
      v23[3] = &block_descriptor_8;
      a2 = _Block_copy(v23);
      swift_retain();
      swift_release();
    }
    objc_msgSend(v8, sel_setCompletionBlock_, a2);
    _Block_release(a2);
    v9 = objc_allocWithZone(MEMORY[0x24BDE56F0]);
    LODWORD(v10) = 1043928040;
    LODWORD(v11) = 1058272560;
    LODWORD(v12) = 1063980840;
    LODWORD(v13) = 0;
    v14 = objc_msgSend(v9, sel_initWithControlPoints__::, v10, v13, v11, v12);
    v15 = (void *)sub_21C2C21A4();
    v16 = objc_msgSend((id)objc_opt_self(), sel_animationWithKeyPath_, v15);

    objc_msgSend(v16, sel_setTimingFunction_, v14);
    objc_msgSend(v16, sel_setFillMode_, *MEMORY[0x24BDE5970]);
    v17 = v16;
    v18 = (void *)sub_21C2C1A3C();
    objc_msgSend(v17, sel_setFromValue_, v18);

    v19 = v17;
    v20 = (void *)sub_21C2C1A3C();
    objc_msgSend(v19, sel_setToValue_, v20);

    v21 = *(void **)(v4
                   + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer);
    objc_msgSend(v21, sel_setStrokeEnd_, a4);
    v22 = (void *)sub_21C2C21A4();
    objc_msgSend(v21, sel_addAnimation_forKey_, v19, v22);

    objc_msgSend(v8, sel_commit);
  }
  else
  {
    objc_msgSend(*(id *)(v4+ OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer), sel_setStrokeEnd_, a4);
  }
}

id sub_21C2A5600()
{
  return sub_21C2A6D90(0, type metadata accessor for MedsCompletionCheckmarkView);
}

uint64_t type metadata accessor for MedsCompletionCheckmarkView()
{
  return objc_opt_self();
}

id sub_21C2A5640()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 2);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v4);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_21C2A56EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
    v5 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    objc_msgSend(v4, sel_setTextAlignment_, 1);
    v6 = (void *)objc_opt_self();
    sub_21C2C21C8();
    v7 = (void *)sub_21C2C21A4();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v6, sel_hk_preferredFontForTextStyle_symbolicTraits_, v7, 2);

    objc_msgSend(v4, sel_setFont_, v8);
    v9 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_21C2A582C(double a1, double a2, double a3, double a4)
{
  char *v4;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_xInset] = 0x4028000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground_yInset] = 0x4000000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___blurView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD219LabelWithBackground____lazy_storage___label] = 0;
  v17.receiver = v4;
  v17.super_class = (Class)type metadata accessor for LabelWithBackground();
  v9 = objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v9, sel_setClipsToBounds_, 1);
  v10 = v9;
  v11 = sub_21C2A5640();
  objc_msgSend(v10, sel_addSubview_, v11);

  v12 = sub_21C2A5640();
  objc_msgSend(v10, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

  v13 = v10;
  v14 = sub_21C2A56EC();
  objc_msgSend(v13, sel_addSubview_, v14);

  v15 = sub_21C2A56EC();
  objc_msgSend(v13, sel_bounds);
  v19 = CGRectInset(v18, 12.0, 2.0);
  objc_msgSend(v15, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

  return v13;
}

id sub_21C2A5B90()
{
  return sub_21C2A6D90(0, type metadata accessor for LabelWithBackground);
}

uint64_t type metadata accessor for LabelWithBackground()
{
  return objc_opt_self();
}

double sub_21C2A5BF8()
{
  void *v0;
  id v1;
  void *v2;
  unsigned __int8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  char v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  char v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall)
    && (v1 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults),
        sub_21C2C2210(),
        v2 = (void *)sub_21C2C21A4(),
        swift_bridgeObjectRelease(),
        v3 = objc_msgSend(v1, sel_BOOLForKey_, v2),
        v1,
        v2,
        (v3 & 1) != 0))
  {
    objc_msgSend(v0, sel_bounds);
    return v4;
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    CGRectGetHeight(v27);
    sub_21C2C1BEC();
    v7 = v6;
    objc_msgSend(v0, sel_bounds);
    v8 = CGRectGetWidth(v28) - (v7 + v7);
    v9 = objc_msgSend(v0, sel_traitCollection);
    v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);

    v11 = sub_21C2C23FC();
    v5 = 44.0;
    if ((v11 & 1) != 0)
      v12 = 52.0;
    else
      v12 = 44.0;
    v13 = v7;
    v14 = 0x4060000000000000;
    v15 = v8;
    CGRectGetMaxY(*(CGRect *)(&v12 - 3));
    sub_21C2C1BEC();
    v17 = v16;
    objc_msgSend(v0, sel_bounds);
    v18 = CGRectGetWidth(v29) - (v17 + v17);
    v19 = objc_msgSend(v0, sel_traitCollection);
    v20 = objc_msgSend(v19, sel_preferredContentSizeCategory);

    v21 = sub_21C2C23FC();
    if ((v21 & 1) != 0)
      v22 = 52.0;
    else
      v22 = 44.0;
    v23 = v17;
    v24 = 0x4060000000000000;
    v25 = v18;
    CGRectGetMaxY(*(CGRect *)(&v22 - 3));
    objc_msgSend(v0, sel_bounds);
    CGRectGetWidth(v30);
  }
  return v5;
}

uint64_t sub_21C2A5E58()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C2C1F88();
  swift_release();
  swift_release();
  return v1;
}

id sub_21C2A5EC8()
{
  return sub_21C2A5EDC(&OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel, (uint64_t (*)(void))sub_21C2A5F34);
}

id sub_21C2A5EDC(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2();
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_21C2A5F34()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  CGRect v8;
  CGRect v9;

  v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LabelWithBackground()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v1, sel_setCornerRadius_, 8.0);

  v2 = sub_21C2A56EC();
  objc_msgSend(v2, sel_setNumberOfLines_, 2);

  v3 = sub_21C2A56EC();
  objc_msgSend(v3, sel_setAdjustsFontSizeToFitWidth_, 1);

  if (qword_255255398 != -1)
    swift_once();
  sub_21C2C1940();
  v4 = sub_21C2A56EC();
  v5 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setText_, v5, 0xE000000000000000);

  v6 = sub_21C2A56EC();
  objc_msgSend(v0, sel_bounds);
  v9 = CGRectInset(v8, 12.0, 2.0);
  objc_msgSend(v6, sel_setFrame_, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);

  return v0;
}

id sub_21C2A60E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle);
  }
  else
  {
    type metadata accessor for CutoutView();
    v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_21C2A6158(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  id v34;
  id v35;
  double v36;
  id v37;
  char *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v48;
  objc_super v49;
  _QWORD v50[5];
  CGRect v51;

  sub_21C2A6F1C(0, &qword_255255C48, MEMORY[0x24BDB9EF0]);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v48 - v12;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay_cancellables] = MEMORY[0x24BEE4B08];
  v14 = &v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title];
  v15 = qword_255255398;
  v16 = v4;
  if (v15 != -1)
    swift_once();
  v50[0] = sub_21C2C1940();
  v50[1] = v17;
  sub_21C2944A4(0, &qword_255255C50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  sub_21C2C1F70();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  *(_QWORD *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v16[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle] = 0;

  v18 = (objc_class *)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
  v49.receiver = v16;
  v49.super_class = v18;
  v19 = objc_msgSendSuper2(&v49, sel_initWithFrame_, a1, a2, a3, a4);
  v20 = (void *)objc_opt_self();
  v21 = v19;
  v22 = objc_msgSend(v20, sel_clearColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  if (!objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall)
    || (v23 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults),
        sub_21C2C2210(),
        v24 = (void *)sub_21C2C21A4(),
        swift_bridgeObjectRelease(),
        v25 = objc_msgSend(v23, sel_BOOLForKey_, v24),
        v23,
        v24,
        (v25 & 1) == 0))
  {
    v26 = v21;
    v27 = sub_21C2A60E8();
    objc_msgSend(v26, sel_addSubview_, v27);

    v28 = v26;
    v29 = sub_21C2A5EC8();
    objc_msgSend(v28, sel_addSubview_, v29);

    v30 = sub_21C2A5EC8();
    sub_21C2C1BEC();
    v32 = v31;
    objc_msgSend(v28, sel_bounds);
    v33 = CGRectGetWidth(v51) - (v32 + v32);
    v34 = objc_msgSend(v28, sel_traitCollection);
    v35 = objc_msgSend(v34, sel_preferredContentSizeCategory);

    LOBYTE(v34) = sub_21C2C23FC();
    if ((v34 & 1) != 0)
      v36 = 52.0;
    else
      v36 = 44.0;
    objc_msgSend(v30, sel_setFrame_, v32, 128.0, v33, v36);

    v37 = sub_21C2A60E8();
    objc_msgSend(v28, sel_bounds);
    objc_msgSend(v37, sel_setFrame_);

    v38 = (char *)sub_21C2A60E8();
    v39 = sub_21C2A5BF8();
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = &v38[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
    sub_21C2A7280((uint64_t)&v38[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame], (uint64_t)v50);
    *(double *)v46 = v39;
    *((_QWORD *)v46 + 1) = v41;
    *((_QWORD *)v46 + 2) = v43;
    *((_QWORD *)v46 + 3) = v45;
    v46[32] = 0;
    sub_21C2A0BA4((uint64_t)v50);

  }
  sub_21C2A6938();

  return v21;
}

void sub_21C2A65D0()
{
  void *v0;
  id v1;
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;
  double v7;
  id v8;
  char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  objc_super v18;
  _BYTE v19[40];
  CGRect v20;

  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
  objc_msgSendSuper2(&v18, sel_layoutSubviews);
  v1 = sub_21C2A5EC8();
  sub_21C2C1BEC();
  v3 = v2;
  objc_msgSend(v0, sel_bounds);
  v4 = CGRectGetWidth(v20) - (v3 + v3);
  v5 = objc_msgSend(v0, sel_traitCollection);
  v6 = objc_msgSend(v5, sel_preferredContentSizeCategory);

  LOBYTE(v5) = sub_21C2C23FC();
  if ((v5 & 1) != 0)
    v7 = 52.0;
  else
    v7 = 44.0;
  objc_msgSend(v1, sel_setFrame_, v3, 128.0, v4, v7);

  v8 = sub_21C2A60E8();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v8, sel_setFrame_);

  v9 = (char *)sub_21C2A60E8();
  v10 = sub_21C2A5BF8();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = &v9[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  sub_21C2A7280((uint64_t)&v9[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame], (uint64_t)v19);
  *(double *)v17 = v10;
  *((_QWORD *)v17 + 1) = v12;
  *((_QWORD *)v17 + 2) = v14;
  *((_QWORD *)v17 + 3) = v16;
  v17[32] = 0;
  sub_21C2A0BA4((uint64_t)v19);

}

void sub_21C2A6790(uint64_t a1, uint64_t a2, double a3)
{
  void *v3;
  void *v4;
  double MidY;
  double v9;
  double v10;
  CGFloat v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[6];
  CGRect v18;
  CGRect v19;

  v4 = v3;
  objc_msgSend(v3, sel_bounds);
  MidY = CGRectGetMidY(v18);
  v19.origin.x = sub_21C2A5BF8();
  v9 = MidY - CGRectGetMidY(v19);
  sub_21C2C1CB8();
  v11 = v9 + v10;
  v12 = sub_21C2A60E8();
  sub_21C2A28F0(a1, a2, a3, v11);

  v13 = (void *)objc_opt_self();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v4;
  v17[4] = sub_21C2A7158;
  v17[5] = v14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_21C2974B8;
  v17[3] = &block_descriptor_1;
  v15 = _Block_copy(v17);
  v16 = v4;
  swift_release();
  objc_msgSend(v13, sel_animateWithDuration_animations_, v15, a3);
  _Block_release(v15);
}

void sub_21C2A68B8()
{
  id v0;

  v0 = sub_21C2A5EC8();
  objc_msgSend(v0, sel_setAlpha_, 0.0);

}

void sub_21C2A68F8()
{
  id v0;

  v0 = sub_21C2A5EC8();
  objc_msgSend(v0, sel_setAlpha_, 1.0);

}

uint64_t sub_21C2A6938()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v15 = sub_21C2C254C();
  v0 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2A6F1C(0, &qword_255255C58, MEMORY[0x24BDB9ED8]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  sub_21C2A6F8C();
  v9 = v8;
  v16 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_21C2A6F1C(0, &qword_255255C48, MEMORY[0x24BDB9EF0]);
  sub_21C2C1F7C();
  swift_endAccess();
  sub_21C2C2540();
  v12 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v17 = v12;
  sub_21C2943A8(0, &qword_255255C68);
  sub_21C2A7034();
  sub_21C2A708C();
  sub_21C2C1FDC();

  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_21C2A7110();
  sub_21C2C2000();
  swift_release();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v9);
  swift_beginAccess();
  sub_21C2C1EE0();
  swift_endAccess();
  return swift_release();
}

void sub_21C2A6BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x220779584](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = sub_21C2A5EC8();
    swift_bridgeObjectRetain();
    v7 = sub_21C2A56EC();
    if (v2)
    {
      v8 = (void *)sub_21C2C21A4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v7, sel_setText_, v8);

    v9 = sub_21C2A56EC();
    objc_msgSend(v6, sel_bounds);
    v18 = CGRectInset(v17, 12.0, 2.0);
    objc_msgSend(v9, sel_setFrame_, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

    v10 = sub_21C2A5EC8();
    sub_21C2C1BEC();
    v12 = v11;
    objc_msgSend(v5, sel_bounds);
    v13 = CGRectGetWidth(v19) - (v12 + v12);
    v14 = objc_msgSend(v5, sel_traitCollection);
    v15 = objc_msgSend(v14, sel_preferredContentSizeCategory);

    LOBYTE(v14) = sub_21C2C23FC();
    if ((v14 & 1) != 0)
      v16 = 52.0;
    else
      v16 = 44.0;
    objc_msgSend(v10, sel_setFrame_, v12, 128.0, v13, v16);

  }
}

id sub_21C2A6D80()
{
  return sub_21C2A6D90(0, type metadata accessor for MedicationDataScannerRegionOfInterestOverlay);
}

id sub_21C2A6D90(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_21C2A6E40()
{
  return type metadata accessor for MedicationDataScannerRegionOfInterestOverlay();
}

uint64_t type metadata accessor for MedicationDataScannerRegionOfInterestOverlay()
{
  uint64_t result;

  result = qword_255255C38;
  if (!qword_255255C38)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21C2A6E84()
{
  unint64_t v0;

  sub_21C2A6F1C(319, &qword_255255C48, MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_21C2A6F1C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_21C2944A4(255, &qword_255255C50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_21C2A6F8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255C60)
  {
    sub_21C2A6F1C(255, &qword_255255C58, MEMORY[0x24BDB9ED8]);
    sub_21C2943A8(255, &qword_255255C68);
    sub_21C2A7034();
    sub_21C2A708C();
    v0 = sub_21C2C1EBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255C60);
  }
}

unint64_t sub_21C2A7034()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255C70;
  if (!qword_255255C70)
  {
    sub_21C2A6F1C(255, &qword_255255C58, MEMORY[0x24BDB9ED8]);
    result = MEMORY[0x22077944C](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, (unint64_t *)&qword_255255C70);
  }
  return result;
}

unint64_t sub_21C2A708C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255C78;
  if (!qword_255255C78)
  {
    v1 = sub_21C2943A8(255, &qword_255255C68);
    result = MEMORY[0x22077944C](MEMORY[0x24BDD0408], v1);
    atomic_store(result, (unint64_t *)&qword_255255C78);
  }
  return result;
}

uint64_t sub_21C2A70E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21C2A7108(uint64_t a1)
{
  uint64_t v1;

  sub_21C2A6BC8(a1, v1);
}

unint64_t sub_21C2A7110()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255C80;
  if (!qword_255255C80)
  {
    sub_21C2A6F8C();
    result = MEMORY[0x22077944C](MEMORY[0x24BDB9988], v1);
    atomic_store(result, (unint64_t *)&qword_255255C80);
  }
  return result;
}

void sub_21C2A7158()
{
  sub_21C2A7800((uint64_t (*)(void))sub_21C2A5EC8, 0.0);
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

double sub_21C2A7180@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C2C1F88();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_21C2A7200(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_21C2C1F94();
}

uint64_t sub_21C2A7280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2A72C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21C2A72C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255C88)
  {
    type metadata accessor for CGRect(255);
    v0 = sub_21C2C2564();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255C88);
  }
}

id sub_21C2A7318()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE56D0]), sel_init);
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_clearColor);
  v3 = objc_msgSend(v2, sel_CGColor);

  objc_msgSend(v0, sel_setBackgroundColor_, v3);
  objc_msgSend(v0, sel_setBorderWidth_, 6.0);
  v4 = objc_msgSend(v1, sel_whiteColor);
  v5 = objc_msgSend(v4, sel_colorWithAlphaComponent_, 0.8);

  v6 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(v0, sel_setBorderColor_, v6);

  objc_msgSend(v0, sel_setCornerRadius_, 44.0);
  objc_msgSend(v0, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);
  return v0;
}

void sub_21C2A7478()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cutoutFrame];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_borderWidth] = 0x4018000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_cornerRadius] = 0x4046000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_checkmarkDiameter] = 0x4054000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_expansionAmountForOutlineBox] = 0x402C000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView_animationSquishAmount] = 0x4018000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___blurView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___checkmarkView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___backgroundLayerMask] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI10CutoutView____lazy_storage___borderLayer] = 0;

  sub_21C2C26C0();
  __break(1u);
}

void sub_21C2A7578()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  sub_21C2A6F1C(0, &qword_255255C48, MEMORY[0x24BDB9EF0]);
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v8 - v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay_cancellables] = MEMORY[0x24BEE4B08];
  v6 = OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title;
  if (qword_255255398 != -1)
    swift_once();
  v8[0] = sub_21C2C1940();
  v8[1] = v7;
  sub_21C2944A4(0, &qword_255255C50, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  sub_21C2C1F70();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v0[v6], v5, v2);
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle] = 0;

  sub_21C2C26C0();
  __break(1u);
}

uint64_t sub_21C2A7728()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21C2A774C()
{
  sub_21C2A4BE8();
}

void sub_21C2A7754()
{
  sub_21C2A4C48();
}

uint64_t sub_21C2A775C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21C2A7788()
{
  uint64_t v0;

  sub_21C2A3DDC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_21C2A7794()
{
  return swift_deallocObject();
}

uint64_t sub_21C2A77A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_21C2A77E0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_21C2A77F0()
{
  sub_21C2A7800((uint64_t (*)(void))sub_21C2A0D9C, 1.0);
}

void sub_21C2A7800(uint64_t (*a1)(void), double a2)
{
  id v3;

  v3 = (id)a1();
  objc_msgSend(v3, sel_setAlpha_, a2);

}

id sub_21C2A789C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE14A10]), sel_init);
    objc_msgSend(v4, sel_setShape_, 1);
    objc_msgSend(v4, sel_setHidden_, 1);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_21C2A7934()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
    objc_msgSend(v4, sel_setHidden_, 1);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_21C2A79B8(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___reticleView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView____lazy_storage___spotlightView] = 0;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ReticleView();
  v9 = objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  v10 = sub_21C2A789C();
  objc_msgSend(v9, sel_addSubview_, v10);

  v11 = v9;
  v12 = sub_21C2A7934();
  objc_msgSend(v11, sel_addSubview_, v12);

  return v11;
}

void sub_21C2A7B58()
{
  void *v0;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v6;
  id v7;
  id v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for ReticleView();
  objc_msgSendSuper2(&v9, sel_layoutSubviews);
  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI11ReticleView_hasSetReticleRect) & 1) == 0)
  {
    objc_msgSend(v0, sel_bounds);
    x = v10.origin.x;
    y = v10.origin.y;
    width = v10.size.width;
    height = v10.size.height;
    MidX = CGRectGetMidX(v10);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v6 = CGRectGetMidX(v11);
    v7 = sub_21C2A789C();
    objc_msgSend(v7, sel_setFrame_, MidX, v6, 0.0, 0.0);

    v8 = sub_21C2A7934();
    objc_msgSend(v8, sel_setFrame_, MidX, v6, 0.0, 0.0);

  }
}

id sub_21C2A7C80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReticleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ReticleView()
{
  return objc_opt_self();
}

_QWORD *sub_21C2A7D08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, char *, uint64_t);
  uint64_t v18;
  _QWORD *result;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  sub_21C2B6FEC(0, &qword_255256170, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - v5;
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_11;
  }
  sub_21C2B6C90();
  v7 = (_QWORD *)sub_21C2C26FC();
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return v7;
  }
  v9 = *(int *)(v3 + 48);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v26 = a1;
  v28 = *(_QWORD *)(v4 + 72);
  swift_retain();
  sub_21C2B6D10(a1 + v10, (uint64_t)v6, &qword_255256170, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v11 = sub_21C2B1D4C((uint64_t)v6);
  if ((v12 & 1) != 0)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    swift_release();
    goto LABEL_11;
  }
  v13 = v11;
  v27 = &v6[v9];
  v14 = sub_21C2C1A00();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = *(void (**)(unint64_t, char *, uint64_t))(v15 + 32);
  v18 = v26 + v28 + v10;
  while (1)
  {
    *(_QWORD *)((char *)v7 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v13;
    v17(v7[6] + v16 * v13, v6, v14);
    result = memmove((void *)(v7[7] + 168 * v13), v27, 0xA8uLL);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      break;
    v7[2] = v22;
    if (!--v8)
      goto LABEL_9;
    v23 = v18 + v28;
    sub_21C2B6D10(v18, (uint64_t)v6, &qword_255256170, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    v13 = sub_21C2B1D4C((uint64_t)v6);
    v18 = v23;
    if ((v24 & 1) != 0)
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t sub_21C2A7F20(uint64_t a1)
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
  sub_21C2B6D60(0, &qword_255256120, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, &qword_2552554B8, (uint64_t)&unk_21C2C3670);
  v2 = sub_21C2C26FC();
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
    sub_21C2B6D10(v6, (uint64_t)&v13, &qword_255255E98, type metadata accessor for FileAttributeKey);
    v7 = v13;
    result = sub_21C2B1E9C(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21C2A77E0(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21C2A808C(uint64_t a1)
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
  sub_21C2B6D60(0, &qword_255256118, (uint64_t (*)(uint64_t))type metadata accessor for Key, (unint64_t *)&qword_255255548, (uint64_t)&unk_21C2C381C);
  v2 = sub_21C2C26FC();
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
    sub_21C2B6D10(v6, (uint64_t)&v13, (unint64_t *)&qword_255255880, type metadata accessor for Key);
    v7 = v13;
    result = sub_21C2B1E9C(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21C2A77E0(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21C2A81F8(uint64_t a1)
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
  sub_21C2B7050(0, &qword_255256148, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  v2 = (_QWORD *)sub_21C2C26FC();
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
    result = sub_21C2B1E38(v5, v6);
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

unint64_t sub_21C2A832C(uint64_t a1)
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
  sub_21C2B7050(0, &qword_255256178, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))MEMORY[0x24BEE30A0]);
  v2 = sub_21C2C26FC();
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
    sub_21C2B70A4(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_21C2B1E38(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21C2A77E0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_21C2A846C(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_21C2B1A10(isUniquelyReferenced_nonNull_native, v24, 1, v3, &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = sub_21C2C1994();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2A85F0(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    v5 = v20 + v3;
    if (!__OFADD__(v20, v3))
      goto LABEL_5;
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v4 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = v4 + v3;
  if (__OFADD__(v4, v3))
    goto LABEL_24;
LABEL_5:
  v6 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v6;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v9 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v8 = 1;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 <= v5)
    v10 = v5;
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x220778DD4](v8, v10, 1, v6);
  swift_bridgeObjectRelease();
  *v1 = v11;
  v9 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (*(_QWORD *)(v9 + 24) >> 1) - v12;
  result = sub_21C2B543C(v9 + 8 * v12 + 32, v13, a1);
  if (v15 < v3)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v16 = v15;
  if (v15 < 1)
    goto LABEL_19;
  v17 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v18 = __OFADD__(v17, v15);
  v19 = v17 + v15;
  if (!v18)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
LABEL_19:
    swift_bridgeObjectRelease();
    if (v16 != v13)
      return sub_21C2C2288();
LABEL_26:
    sub_21C2B6B14();
    return sub_21C2C2288();
  }
  __break(1u);
  return result;
}

uint64_t ScanningAnalyticsWrapper.timeSinceUserLastScannedAMed.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ScanningAnalyticsWrapper.didLastScanFallBackToOCR.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t ScanningAnalyticsWrapper.itemLevelRankOfMatchInOCRList.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ScanningSystemState.dataSaturated.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

double ScanningSystemState.sessionStartTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double ScanningSystemState.sessionEndTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double ScanningSystemState.lastItemUpdateTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

uint64_t ScanningSystemState.resolutionCounter.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ScanningSystemState.filterCompleteTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t ScanningSystemState.filterCompleteTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = result;
  *(_BYTE *)(v2 + 48) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.filterCompleteTime.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSystemState.stateChangeTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t ScanningSystemState.stateChangeTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = result;
  *(_BYTE *)(v2 + 64) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.stateChangeTime.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSystemState.resultOnScreenTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t ScanningSystemState.resultOnScreenTime.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = result;
  *(_BYTE *)(v2 + 80) = a2 & 1;
  return result;
}

uint64_t (*ScanningSystemState.resultOnScreenTime.modify())()
{
  return nullsub_1;
}

uint64_t sub_21C2A888C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2A88C8 + 4 * byte_21C2C3EE0[a1]))(0xD000000000000010, 0x800000021C2C8470);
}

uint64_t sub_21C2A88C8()
{
  return 0x7574615361746164;
}

uint64_t sub_21C2A88EC()
{
  return 0x456E6F6973736573;
}

unint64_t sub_21C2A8910()
{
  return 0xD000000000000012;
}

uint64_t sub_21C2A8988()
{
  unsigned __int8 *v0;

  return sub_21C2A888C(*v0);
}

uint64_t sub_21C2A8990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C2B5E0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21C2A89B4()
{
  return 0;
}

void sub_21C2A89C0(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_21C2A89CC()
{
  sub_21C2A8CA8();
  return sub_21C2C2894();
}

uint64_t sub_21C2A89F4()
{
  sub_21C2A8CA8();
  return sub_21C2C28A0();
}

uint64_t ScanningSystemState.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD v11[4];
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;

  sub_21C2B1474(0, &qword_255255CE0, (uint64_t (*)(void))sub_21C2A8CA8, (uint64_t)&type metadata for ScanningSystemState.CodingKeys, MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v11 - v6;
  v8 = *(_QWORD *)(v1 + 32);
  v16 = *(_QWORD *)(v1 + 40);
  v17 = v8;
  v15 = *(unsigned __int8 *)(v1 + 48);
  v14 = *(_QWORD *)(v1 + 56);
  v13 = *(unsigned __int8 *)(v1 + 64);
  v12 = *(_QWORD *)(v1 + 72);
  v11[3] = *(unsigned __int8 *)(v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2A8CA8();
  sub_21C2C2888();
  v26 = 0;
  v9 = v18;
  sub_21C2C27B0();
  if (!v9)
  {
    v25 = 1;
    sub_21C2C27BC();
    v24 = 2;
    sub_21C2C27BC();
    v23 = 3;
    sub_21C2C27BC();
    v22 = 4;
    sub_21C2C27D4();
    v21 = 5;
    sub_21C2C2798();
    v20 = 6;
    sub_21C2C2798();
    v19 = 7;
    sub_21C2C2798();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_21C2A8CA8()
{
  unint64_t result;

  result = qword_255255CE8;
  if (!qword_255255CE8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C46E4, &type metadata for ScanningSystemState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255255CE8);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t ScanningSystemState.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;

  v35 = a2;
  sub_21C2B1474(0, &qword_255255CF0, (uint64_t (*)(void))sub_21C2A8CA8, (uint64_t)&type metadata for ScanningSystemState.CodingKeys, MEMORY[0x24BEE33E0]);
  v36 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2A8CA8();
  v8 = v7;
  sub_21C2C287C();
  if (!v2)
  {
    v9 = v5;
    v11 = v35;
    v10 = v36;
    v44 = 0;
    v12 = v8;
    v13 = sub_21C2C2750();
    v43 = 1;
    sub_21C2C275C();
    v15 = v14;
    v42 = 2;
    sub_21C2C275C();
    v17 = v16;
    v41 = 3;
    sub_21C2C275C();
    v19 = v18;
    v40 = 4;
    v21 = sub_21C2C2774();
    v39 = 5;
    v22 = sub_21C2C2738();
    v34 = v23;
    v24 = v22;
    v38 = 6;
    v25 = sub_21C2C2738();
    HIDWORD(v32) = v26;
    v33 = v25;
    v37 = 7;
    v27 = sub_21C2C2738();
    v28 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29 = v27;
    v30 = v12;
    LOBYTE(v12) = v31;
    v28(v30, v10);
    *(_BYTE *)v11 = v13 & 1;
    *(_QWORD *)(v11 + 8) = v15;
    *(_QWORD *)(v11 + 16) = v17;
    *(_QWORD *)(v11 + 24) = v19;
    *(_QWORD *)(v11 + 32) = v21;
    *(_QWORD *)(v11 + 40) = v24;
    *(_BYTE *)(v11 + 48) = v34 & 1;
    *(_QWORD *)(v11 + 56) = v33;
    *(_BYTE *)(v11 + 64) = BYTE4(v32) & 1;
    *(_QWORD *)(v11 + 72) = v29;
    *(_BYTE *)(v11 + 80) = v12 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_21C2A8FD4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ScanningSystemState.init(from:)(a1, a2);
}

uint64_t sub_21C2A8FE8(_QWORD *a1)
{
  return ScanningSystemState.encode(to:)(a1);
}

uint64_t ScanningSession.allTranscripts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.usedTranscripts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.seenMRCs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.pbsResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.mrcResult.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

double ScanningSession.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

uint64_t ScanningSession.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 ScanningSession.systemState.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 88);
  v3 = *(_BYTE *)(v1 + 112);
  v4 = *(_QWORD *)(v1 + 120);
  v5 = *(_BYTE *)(v1 + 128);
  v6 = *(_QWORD *)(v1 + 136);
  v7 = *(_BYTE *)(v1 + 144);
  *(_BYTE *)a1 = *(_BYTE *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(a1 + 24) = v2;
  result = *(__n128 *)(v1 + 96);
  *(__n128 *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 48) = v3;
  *(_QWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 72) = v6;
  *(_BYTE *)(a1 + 80) = v7;
  return result;
}

__n128 ScanningSession.systemState.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_BYTE *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_BYTE *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(v1 + 64) = *(_BYTE *)a1;
  *(_OWORD *)(v1 + 72) = *(_OWORD *)(a1 + 8);
  *(_QWORD *)(v1 + 88) = v2;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 + 96) = result;
  *(_BYTE *)(v1 + 112) = v3;
  *(_QWORD *)(v1 + 120) = v4;
  *(_BYTE *)(v1 + 128) = v5;
  *(_QWORD *)(v1 + 136) = v6;
  *(_BYTE *)(v1 + 144) = v7;
  return result;
}

uint64_t (*ScanningSession.systemState.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.filteredResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.filteredResults.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 152) = a1;
  return result;
}

uint64_t (*ScanningSession.filteredResults.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.expandedResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScanningSession.expandedResults.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 160) = a1;
  return result;
}

uint64_t (*ScanningSession.expandedResults.modify())()
{
  return nullsub_1;
}

uint64_t ScanningSession.init(from:usedTranscripts:seenMRCs:pbsResults:mrcResult:attachments:systemState:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __objc2_meth_list **p_base_meths@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned __int8 *a8@<X7>, _QWORD *a9@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  __objc2_meth_list *v18;
  __objc2_meth_list *v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  void *v28;
  id v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  __objc2_meth_list *v35;
  id v36;
  int v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
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
  _QWORD *v69;
  __objc2_meth_list **v70;
  __objc2_meth_list **v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  __objc2_meth_list *v75;
  _QWORD *v76;
  _BYTE v77[7];
  char v78;
  _BYTE v79[7];
  char v80;
  _BYTE v81[7];
  char v82;
  _DWORD v83[3];

  v67 = a6;
  v68 = a7;
  v65 = a3;
  v66 = a5;
  v63 = a2;
  v62 = a1;
  v69 = a9;
  v57 = sub_21C2C19DC();
  v56 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v55 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = *a8;
  v12 = *((_QWORD *)a8 + 1);
  v13 = *((_QWORD *)a8 + 2);
  v14 = *((_QWORD *)a8 + 3);
  v60 = *((_QWORD *)a8 + 4);
  v59 = *((_QWORD *)a8 + 5);
  v54 = a8[48];
  v61 = *((_QWORD *)a8 + 7);
  v53 = a8[64];
  v64 = *((_QWORD *)a8 + 9);
  v52 = a8[80];
  if ((unint64_t)p_base_meths >> 62)
    goto LABEL_32;
  v15 = *(_QWORD *)(((unint64_t)p_base_meths & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v71 = p_base_meths;
  if (v15)
  {
    v17 = 0;
    v72 = v15;
    v73 = (unint64_t)p_base_meths & 0xC000000000000001;
    v70 = p_base_meths + 4;
    p_base_meths = &ResourceBundleClass.base_meths;
    do
    {
      if (v73)
        v18 = (__objc2_meth_list *)MEMORY[0x220778DC8](v17, v71);
      else
        v18 = v70[v17];
      v19 = v18;
      v20 = __OFADD__(v17, 1);
      v21 = v17 + 1;
      if (v20)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain();
        v15 = sub_21C2C26CC();
        goto LABEL_3;
      }
      v22 = -[__objc2_meth_list subHgIds](v18, sel_subHgIds);
      sub_21C2943A8(0, &qword_255255AE8);
      v23 = sub_21C2C2270();

      v76 = v16;
      if (v23 >> 62)
      {
        swift_bridgeObjectRetain();
        v24 = sub_21C2C26CC();
        v74 = v21;
        v75 = v19;
        if (!v24)
        {
LABEL_23:
          v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
          goto LABEL_24;
        }
      }
      else
      {
        v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        v74 = v21;
        v75 = v19;
        if (!v24)
          goto LABEL_23;
      }
      if (v24 < 1)
        goto LABEL_31;
      v25 = 0;
      v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        if ((v23 & 0xC000000000000001) != 0)
          v27 = (id)MEMORY[0x220778DC8](v25, v23);
        else
          v27 = *(id *)(v23 + 8 * v25 + 32);
        v28 = v27;
        v29 = objc_msgSend(v27, sel_hgId);
        objc_msgSend(v28, sel_jaccardSimilarity);
        v31 = v30;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v26 = sub_21C2B09D0(0, v26[2] + 1, 1, v26);
        v33 = v26[2];
        v32 = v26[3];
        if (v33 >= v32 >> 1)
          v26 = sub_21C2B09D0((_QWORD *)(v32 > 1), v33 + 1, 1, v26);
        ++v25;
        v26[2] = v33 + 1;
        v34 = &v26[2 * v33];
        v34[4] = v29;
        *((_DWORD *)v34 + 10) = v31;
      }
      while (v24 != v25);
LABEL_24:
      swift_bridgeObjectRelease_n();
      v35 = v75;
      v36 = -[__objc2_meth_list primaryHgId](v75, sel_primaryHgId);
      -[__objc2_meth_list maxJaccardSimilarity](v35, sel_maxJaccardSimilarity);
      v38 = v37;

      v16 = v76;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_21C2B0898(0, v16[2] + 1, 1, v16);
      v17 = v74;
      v40 = v16[2];
      v39 = v16[3];
      if (v40 >= v39 >> 1)
        v16 = sub_21C2B0898((_QWORD *)(v39 > 1), v40 + 1, 1, v16);
      v16[2] = v40 + 1;
      v41 = &v16[3 * v40];
      v41[4] = v36;
      *((_DWORD *)v41 + 10) = v38;
      v41[6] = v26;
    }
    while (v17 != v72);
  }
  swift_bridgeObjectRelease_n();
  v42 = v55;
  sub_21C2C19D0();
  sub_21C2C19AC();
  v44 = v43;
  result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v42, v57);
  v82 = v54;
  v80 = v53;
  v78 = v52;
  v46 = v69;
  v47 = v63;
  *v69 = v62;
  v46[1] = v47;
  v46[2] = v65;
  v46[3] = v16;
  v48 = v67;
  v46[4] = v66;
  v46[5] = v48;
  v46[6] = v44;
  v46[7] = v68;
  *((_BYTE *)v46 + 64) = v58;
  *(_DWORD *)((char *)v46 + 65) = v83[0];
  *((_DWORD *)v46 + 17) = *(_DWORD *)((char *)v83 + 3);
  v46[9] = v12;
  v46[10] = v13;
  v46[11] = v14;
  v49 = v59;
  v46[12] = v60;
  v46[13] = v49;
  *((_BYTE *)v46 + 112) = v82;
  *(_DWORD *)((char *)v46 + 113) = *(_DWORD *)v81;
  *((_DWORD *)v46 + 29) = *(_DWORD *)&v81[3];
  v46[15] = v61;
  *((_BYTE *)v46 + 128) = v80;
  *(_DWORD *)((char *)v46 + 129) = *(_DWORD *)v79;
  *((_DWORD *)v46 + 33) = *(_DWORD *)&v79[3];
  v46[17] = v64;
  *((_BYTE *)v46 + 144) = v78;
  LODWORD(v49) = *(_DWORD *)v77;
  *((_DWORD *)v46 + 37) = *(_DWORD *)&v77[3];
  *(_DWORD *)((char *)v46 + 145) = v49;
  v50 = MEMORY[0x24BEE4AF8];
  v46[19] = MEMORY[0x24BEE4AF8];
  v46[20] = v50;
  return result;
}

uint64_t sub_21C2A96BC(char a1)
{
  return *(_QWORD *)&aAlltransusedtr[8 * a1];
}

BOOL sub_21C2A96DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21C2A96F0()
{
  return sub_21C2C2858();
}

uint64_t sub_21C2A9718()
{
  char *v0;

  return sub_21C2A96BC(*v0);
}

uint64_t sub_21C2A9720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C2B6150(a1, a2);
  *a3 = result;
  return result;
}

void sub_21C2A9744(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_21C2A9750()
{
  sub_21C2B0AF0();
  return sub_21C2C2894();
}

uint64_t sub_21C2A9778()
{
  sub_21C2B0AF0();
  return sub_21C2C28A0();
}

uint64_t ScanningSession.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
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
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  int v45;
  char v46;

  sub_21C2B1474(0, &qword_255255CF8, (uint64_t (*)(void))sub_21C2B0AF0, (uint64_t)&type metadata for ScanningSession.CodingKeys, MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v18 - v6;
  v9 = *v1;
  v8 = v1[1];
  v31 = v1[2];
  v32 = v8;
  v10 = v1[3];
  v29 = v1[4];
  v30 = v10;
  v28 = v1[5];
  v27 = v1[7];
  v20 = *((unsigned __int8 *)v1 + 64);
  v11 = v1[9];
  v12 = v1[10];
  v13 = v1[11];
  v21 = v1[12];
  v26 = v1[13];
  v45 = *((unsigned __int8 *)v1 + 112);
  v25 = v1[15];
  v24 = *((unsigned __int8 *)v1 + 128);
  v23 = v1[17];
  v22 = *((unsigned __int8 *)v1 + 144);
  v19 = v1[19];
  v18 = v1[20];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B0AF0();
  sub_21C2C2888();
  v34 = v9;
  v46 = 0;
  sub_21C2944A4(0, &qword_255255D08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
  sub_21C2B0DAC(&qword_255255D10, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  v14 = v33;
  sub_21C2C27E0();
  if (!v14)
  {
    v16 = v30;
    v15 = v31;
    v34 = v32;
    v46 = 1;
    sub_21C2C27E0();
    v34 = v15;
    v46 = 2;
    sub_21C2C27E0();
    v34 = v16;
    v46 = 3;
    sub_21C2944A4(0, &qword_255255D18, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B0B34();
    sub_21C2C27E0();
    LOBYTE(v34) = 4;
    sub_21C2C278C();
    LOBYTE(v34) = 5;
    sub_21C2C27BC();
    v34 = v27;
    v46 = 6;
    sub_21C2944A4(0, &qword_255255D30, MEMORY[0x24BDCDDE8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B0BF0();
    sub_21C2C27E0();
    LOBYTE(v34) = v20;
    v35 = v11;
    v36 = v12;
    v37 = v13;
    v38 = v21;
    v39 = v26;
    v40 = v45;
    v41 = v25;
    v42 = v24;
    v43 = v23;
    v44 = v22;
    v46 = 7;
    sub_21C2B0CAC();
    sub_21C2C27E0();
    v34 = v19;
    v46 = 8;
    sub_21C2C27E0();
    v34 = v18;
    v46 = 9;
    sub_21C2944A4(0, &qword_255255D50, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B0CF0();
    sub_21C2C27E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ScanningSession.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v13;
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 v73;
  _BYTE v74[7];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  _BYTE v81[7];
  uint64_t v82;
  unsigned __int8 v83;
  _BYTE v84[7];
  uint64_t v85;
  char v86;
  _BYTE v87[7];
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  _BYTE v92[7];
  char v93;
  _BYTE v94[7];
  unsigned __int8 v95;
  _BYTE v96[7];
  char v97;
  _DWORD v98[3];
  _QWORD *v99;

  sub_21C2B1474(0, &qword_255255D68, (uint64_t (*)(void))sub_21C2B0AF0, (uint64_t)&type metadata for ScanningSession.CodingKeys, MEMORY[0x24BEE33E0]);
  v53 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - v7;
  v9 = a1[3];
  v99 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_21C2B0AF0();
  sub_21C2C287C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v52 = v6;
    sub_21C2944A4(0, &qword_255255D08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    LOBYTE(v54) = 0;
    sub_21C2B0DAC(&qword_255255D70, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_21C2C2780();
    v10 = v65;
    LOBYTE(v54) = 1;
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    v51 = v10;
    v11 = v65;
    LOBYTE(v54) = 2;
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    v50 = v11;
    v12 = v65;
    sub_21C2944A4(0, &qword_255255D18, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    LOBYTE(v54) = 3;
    v13 = sub_21C2B0E20();
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    v47 = v13;
    v49 = v12;
    v14 = v65;
    LOBYTE(v65) = 4;
    swift_bridgeObjectRetain();
    v15 = sub_21C2C272C();
    v48 = v16;
    v45 = v15;
    LOBYTE(v65) = 5;
    swift_bridgeObjectRetain();
    v46 = 0;
    sub_21C2C275C();
    v18 = v17;
    sub_21C2944A4(0, &qword_255255D30, MEMORY[0x24BDCDDE8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    LOBYTE(v54) = 6;
    sub_21C2B0EDC();
    sub_21C2C2780();
    v19 = v65;
    LOBYTE(v54) = 7;
    sub_21C2B0F98();
    v44 = v19;
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    v20 = v66;
    v21 = v67;
    v22 = v68;
    v40 = v70;
    v41 = v69;
    v42 = v72;
    v43 = v75;
    v38 = v71;
    v39 = v65;
    v97 = v71;
    v36 = v76;
    v37 = v73;
    v95 = v73;
    v93 = v76;
    LOBYTE(v54) = 8;
    sub_21C2C2780();
    v23 = v65;
    sub_21C2944A4(0, &qword_255255D50, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v90 = 9;
    sub_21C2B0FDC();
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v8, v53);
    v24 = v91;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v54 = v51;
    *((_QWORD *)&v54 + 1) = v50;
    v25 = v49;
    *(_QWORD *)&v55 = v49;
    *((_QWORD *)&v55 + 1) = v14;
    *(_QWORD *)&v56 = v45;
    *((_QWORD *)&v56 + 1) = v48;
    *(_QWORD *)&v57 = v18;
    *((_QWORD *)&v57 + 1) = v44;
    LOBYTE(v58) = v39;
    *((_QWORD *)&v58 + 1) = v20;
    *(_QWORD *)&v59 = v21;
    *((_QWORD *)&v59 + 1) = v22;
    *(_QWORD *)&v60 = v41;
    *((_QWORD *)&v60 + 1) = v40;
    LOBYTE(v61) = v38;
    *((_QWORD *)&v61 + 1) = v42;
    LOBYTE(v62) = v37;
    *((_QWORD *)&v62 + 1) = v43;
    LOBYTE(v63) = v36;
    *((_QWORD *)&v63 + 1) = v23;
    v64 = v24;
    sub_21C2B1098((uint64_t)&v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = v14;
    swift_bridgeObjectRelease();
    v27 = v48;
    swift_bridgeObjectRelease();
    v28 = v44;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v29 = v63;
    *(_OWORD *)(a2 + 128) = v62;
    *(_OWORD *)(a2 + 144) = v29;
    *(_QWORD *)(a2 + 160) = v64;
    v30 = v59;
    *(_OWORD *)(a2 + 64) = v58;
    *(_OWORD *)(a2 + 80) = v30;
    v31 = v61;
    *(_OWORD *)(a2 + 96) = v60;
    *(_OWORD *)(a2 + 112) = v31;
    v32 = v55;
    *(_OWORD *)a2 = v54;
    *(_OWORD *)(a2 + 16) = v32;
    v33 = v57;
    *(_OWORD *)(a2 + 32) = v56;
    *(_OWORD *)(a2 + 48) = v33;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v99);
    v65 = v51;
    v66 = v50;
    v67 = v25;
    v68 = v26;
    v69 = v45;
    v70 = v27;
    v71 = v18;
    v72 = v28;
    v73 = v39;
    *(_DWORD *)v74 = v98[0];
    *(_DWORD *)&v74[3] = *(_DWORD *)((char *)v98 + 3);
    v75 = v20;
    v76 = v21;
    v77 = v22;
    v78 = v41;
    v79 = v40;
    v80 = v97;
    *(_DWORD *)v81 = *(_DWORD *)v96;
    *(_DWORD *)&v81[3] = *(_DWORD *)&v96[3];
    v82 = v42;
    v83 = v95;
    *(_DWORD *)v84 = *(_DWORD *)v94;
    *(_DWORD *)&v84[3] = *(_DWORD *)&v94[3];
    v85 = v43;
    v86 = v93;
    *(_DWORD *)v87 = *(_DWORD *)v92;
    *(_DWORD *)&v87[3] = *(_DWORD *)&v92[3];
    v88 = v23;
    v89 = v24;
    return sub_21C2B1120((uint64_t)&v65);
  }
}

unint64_t sub_21C2AA568(char a1)
{
  unint64_t result;

  result = 0xD000000000000014;
  if (!a1)
    return 0xD000000000000013;
  return result;
}

uint64_t sub_21C2AA5C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ScanningSession.init(from:)(a1, a2);
}

uint64_t sub_21C2AA5D4(_QWORD *a1)
{
  return ScanningSession.encode(to:)(a1);
}

unint64_t sub_21C2AA5E8()
{
  char *v0;

  return sub_21C2AA568(*v0);
}

uint64_t sub_21C2AA5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C2B65A0(a1, a2);
  *a3 = result;
  return result;
}

void sub_21C2AA614(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21C2AA620()
{
  sub_21C2B11A8();
  return sub_21C2C2894();
}

uint64_t sub_21C2AA648()
{
  sub_21C2B11A8();
  return sub_21C2C28A0();
}

uint64_t ClinicalProductResultGroup.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;

  sub_21C2B1474(0, &qword_255255DB0, (uint64_t (*)(void))sub_21C2B11A8, (uint64_t)&type metadata for ClinicalProductResultGroup.CodingKeys, MEMORY[0x24BEE3520]);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - v6;
  v14 = *(_QWORD *)(v1 + 16);
  v8 = a1[3];
  v9 = a1;
  v11 = v10;
  __swift_project_boxed_opaque_existential_1(v9, v8);
  sub_21C2B11A8();
  sub_21C2C2888();
  v18 = 0;
  sub_21C2C27D4();
  if (!v2)
  {
    v12 = v14;
    v17 = 1;
    sub_21C2C27C8();
    v16 = v12;
    v15 = 2;
    sub_21C2944A4(0, &qword_255255DC0, (uint64_t)&type metadata for SpecificProductResult, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B11EC();
    sub_21C2C27E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v11);
}

uint64_t ClinicalProductResultGroup.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;

  v16 = a2;
  sub_21C2B1474(0, &qword_255255DD8, (uint64_t (*)(void))sub_21C2B11A8, (uint64_t)&type metadata for ClinicalProductResultGroup.CodingKeys, MEMORY[0x24BEE33E0]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B11A8();
  sub_21C2C287C();
  if (!v2)
  {
    v9 = v6;
    v10 = v16;
    v20 = 0;
    v11 = sub_21C2C2774();
    v19 = 1;
    sub_21C2C2768();
    v13 = v12;
    sub_21C2944A4(0, &qword_255255DC0, (uint64_t)&type metadata for SpecificProductResult, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v17 = 2;
    sub_21C2B12A8();
    sub_21C2C2780();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v5);
    v15 = v18;
    *(_QWORD *)v10 = v11;
    *(_DWORD *)(v10 + 8) = v13;
    *(_QWORD *)(v10 + 16) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_21C2AA9FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ClinicalProductResultGroup.init(from:)(a1, a2);
}

uint64_t sub_21C2AAA10(_QWORD *a1)
{
  return ClinicalProductResultGroup.encode(to:)(a1);
}

BOOL sub_21C2AAA24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21C2AAA3C()
{
  sub_21C2C284C();
  sub_21C2C2858();
  return sub_21C2C2870();
}

uint64_t sub_21C2AAA80()
{
  sub_21C2C284C();
  sub_21C2C2858();
  return sub_21C2C2870();
}

unint64_t sub_21C2AAAC0()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0xD000000000000013;
}

uint64_t sub_21C2AAB00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C2B66E0(a1, a2);
  *a3 = result;
  return result;
}

void sub_21C2AAB24(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21C2AAB30()
{
  sub_21C2B1364();
  return sub_21C2C2894();
}

uint64_t sub_21C2AAB58()
{
  sub_21C2B1364();
  return sub_21C2C28A0();
}

uint64_t SpecificProductResult.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  sub_21C2B1474(0, &qword_255255DF0, (uint64_t (*)(void))sub_21C2B1364, (uint64_t)&type metadata for SpecificProductResult.CodingKeys, MEMORY[0x24BEE3520]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B1364();
  sub_21C2C2888();
  v11 = 0;
  v7 = v9;
  sub_21C2C27D4();
  if (!v7)
  {
    v10 = 1;
    sub_21C2C27C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SpecificProductResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  int v13;
  uint64_t v14;
  char v15;
  char v16;

  v14 = a2;
  sub_21C2B1474(0, &qword_255255E00, (uint64_t (*)(void))sub_21C2B1364, (uint64_t)&type metadata for SpecificProductResult.CodingKeys, MEMORY[0x24BEE33E0]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B1364();
  sub_21C2C287C();
  if (!v2)
  {
    v9 = v14;
    v16 = 0;
    v10 = sub_21C2C2774();
    v15 = 1;
    sub_21C2C2768();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)v9 = v10;
    *(_DWORD *)(v9 + 8) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_21C2AAE38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SpecificProductResult.init(from:)(a1, a2);
}

uint64_t sub_21C2AAE4C(_QWORD *a1)
{
  return SpecificProductResult.encode(to:)(a1);
}

uint64_t sub_21C2AAE60@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v70;
  unint64_t v71;

  sub_21C2B6EDC();
  v4 = v3;
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C2C3880;
  v6 = objc_msgSend(a1, sel_specificProduct);
  v7 = objc_msgSend(v6, sel_identifier);
  v8 = objc_msgSend(v7, sel_numberRepresentation);

  v9 = objc_msgSend(v8, sel_stringValue);
  v10 = sub_21C2C21C8();
  v12 = v11;

  *(_QWORD *)(inited + 32) = v10;
  *(_QWORD *)(inited + 40) = v12;
  v13 = objc_msgSend(a1, sel_specificProduct);
  v14 = sub_21C2C2534();
  v16 = v15;

  *(_QWORD *)(inited + 48) = v14;
  *(_QWORD *)(inited + 56) = v16;
  v68 = sub_21C2A81F8(inited);
  swift_bridgeObjectRetain();
  v17 = objc_msgSend(a1, sel_tradeNameProduct);
  if (v17)
  {
    v18 = v17;
    v19 = swift_initStackObject();
    *(_OWORD *)(v19 + 16) = xmmword_21C2C3880;
    v20 = objc_msgSend(v18, sel_identifier);
    v21 = objc_msgSend(v20, sel_numberRepresentation);

    v22 = objc_msgSend(v21, sel_stringValue);
    v23 = sub_21C2C21C8();
    v25 = v24;

    *(_QWORD *)(v19 + 32) = v23;
    *(_QWORD *)(v19 + 40) = v25;
    *(_QWORD *)(v19 + 48) = sub_21C2C2534();
    *(_QWORD *)(v19 + 56) = v26;
    v27 = sub_21C2A81F8(v19);

  }
  else
  {
    v27 = 0;
  }
  v70 = a1;
  v28 = objc_msgSend(a1, sel_routedDoseFormProducts);
  sub_21C2943A8(0, &qword_255255AC0);
  v29 = sub_21C2C2270();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_21C2C26CC();
    v30 = result;
  }
  else
  {
    v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v67 = v27;
  if (v30)
  {
    if (v30 < 1)
    {
      __break(1u);
      goto LABEL_37;
    }
    v32 = 0;
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v29 & 0xC000000000000001) != 0)
        v34 = (id)MEMORY[0x220778DC8](v32, v29);
      else
        v34 = *(id *)(v29 + 8 * v32 + 32);
      v35 = v34;
      v36 = v4;
      v37 = swift_initStackObject();
      *(_OWORD *)(v37 + 16) = xmmword_21C2C3880;
      v38 = objc_msgSend(v35, sel_identifier);
      v39 = objc_msgSend(v38, sel_numberRepresentation);

      v40 = objc_msgSend(v39, sel_stringValue);
      v41 = sub_21C2C21C8();
      v43 = v42;

      *(_QWORD *)(v37 + 32) = v41;
      *(_QWORD *)(v37 + 40) = v43;
      *(_QWORD *)(v37 + 48) = sub_21C2C2534();
      *(_QWORD *)(v37 + 56) = v44;
      v45 = sub_21C2A81F8(v37);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v33 = sub_21C2B18F8(0, v33[2] + 1, 1, v33);
      v47 = v33[2];
      v46 = v33[3];
      v4 = v36;
      if (v47 >= v46 >> 1)
        v33 = sub_21C2B18F8((_QWORD *)(v46 > 1), v47 + 1, 1, v33);
      ++v32;
      v33[2] = v47 + 1;
      v33[v47 + 4] = v45;
    }
    while (v30 != v32);
  }
  else
  {
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  v48 = objc_msgSend(v70, sel_ingredientProducts);
  v49 = sub_21C2C2270();

  if (!(v49 >> 62))
  {
    v50 = *(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v50)
      goto LABEL_21;
LABEL_34:
    v52 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_35:

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *a2 = v68;
    a2[1] = v67;
    a2[2] = (unint64_t)v33;
    a2[3] = (unint64_t)v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_21C2C26CC();
  v50 = result;
  if (!result)
    goto LABEL_34;
LABEL_21:
  if (v50 >= 1)
  {
    v51 = 0;
    v71 = v49 & 0xC000000000000001;
    v52 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v53 = v49;
    do
    {
      if (v71)
        v54 = (id)MEMORY[0x220778DC8](v51, v49);
      else
        v54 = *(id *)(v49 + 8 * v51 + 32);
      v55 = v54;
      v56 = swift_initStackObject();
      *(_OWORD *)(v56 + 16) = xmmword_21C2C3880;
      v57 = objc_msgSend(v55, sel_identifier);
      v58 = objc_msgSend(v57, sel_numberRepresentation);

      v59 = objc_msgSend(v58, sel_stringValue);
      v60 = sub_21C2C21C8();
      v62 = v61;

      *(_QWORD *)(v56 + 32) = v60;
      *(_QWORD *)(v56 + 40) = v62;
      *(_QWORD *)(v56 + 48) = sub_21C2C2534();
      *(_QWORD *)(v56 + 56) = v63;
      v64 = sub_21C2A81F8(v56);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v52 = sub_21C2B18F8(0, v52[2] + 1, 1, v52);
      v66 = v52[2];
      v65 = v52[3];
      if (v66 >= v65 >> 1)
        v52 = sub_21C2B18F8((_QWORD *)(v65 > 1), v66 + 1, 1, v52);
      ++v51;
      v52[2] = v66 + 1;
      v52[v66 + 4] = v64;
      v49 = v53;
    }
    while (v50 != v51);
    goto LABEL_35;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21C2AB4A0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C2AB4D8 + 4 * byte_21C2C3EE8[a1]))(0xD000000000000010, 0x800000021C2C85B0);
}

uint64_t sub_21C2AB4D8()
{
  return 0x6369666963657073;
}

uint64_t sub_21C2AB4FC(uint64_t a1)
{
  return a1 + 6;
}

uint64_t sub_21C2AB524()
{
  unsigned __int8 *v0;

  return sub_21C2AB4A0(*v0);
}

uint64_t sub_21C2AB52C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21C2B68E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_21C2AB550(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_21C2AB55C()
{
  sub_21C2B13A8();
  return sub_21C2C2894();
}

uint64_t sub_21C2AB584()
{
  sub_21C2B13A8();
  return sub_21C2C28A0();
}

uint64_t ExpandedMedicationCluster.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  sub_21C2B1474(0, &qword_255255E08, (uint64_t (*)(void))sub_21C2B13A8, (uint64_t)&type metadata for ExpandedMedicationCluster.CodingKeys, MEMORY[0x24BEE3520]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  v9 = *v1;
  v8 = v1[1];
  v15 = v1[2];
  v16 = v8;
  v14 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B13A8();
  sub_21C2C2888();
  v19 = v9;
  v18 = 0;
  sub_21C2B7050(0, &qword_255255E18, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0460]);
  sub_21C2B14D0(&qword_255255E20, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
  v10 = v17;
  sub_21C2C27E0();
  if (!v10)
  {
    v11 = v15;
    v19 = v16;
    v18 = 1;
    sub_21C2C27A4();
    v19 = v11;
    v18 = 2;
    sub_21C2B6F40(0, &qword_255255E28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B13EC();
    sub_21C2C27E0();
    v19 = v14;
    v18 = 3;
    sub_21C2C27E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ExpandedMedicationCluster.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  sub_21C2B1474(0, &qword_255255E38, (uint64_t (*)(void))sub_21C2B13A8, (uint64_t)&type metadata for ExpandedMedicationCluster.CodingKeys, MEMORY[0x24BEE33E0]);
  v23 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21C2B13A8();
  sub_21C2C287C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v9 = v6;
    v22 = a2;
    sub_21C2B7050(0, &qword_255255E18, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0460]);
    v24 = 0;
    sub_21C2B14D0(&qword_255255E40, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    v10 = v23;
    sub_21C2C2780();
    v12 = v25;
    v24 = 1;
    swift_bridgeObjectRetain();
    sub_21C2C2744();
    v13 = v25;
    sub_21C2B6F40(0, &qword_255255E28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    v24 = 2;
    v14 = sub_21C2B1544();
    swift_bridgeObjectRetain();
    v21 = v14;
    sub_21C2C2780();
    v20 = v13;
    v15 = v25;
    v24 = 3;
    swift_bridgeObjectRetain();
    sub_21C2C2780();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v10);
    v16 = v25;
    swift_bridgeObjectRetain();
    v17 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = v22;
    *v22 = v12;
    v18[1] = v17;
    v18[2] = v15;
    v18[3] = v16;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C2ABB70@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return ExpandedMedicationCluster.init(from:)(a1, a2);
}

uint64_t sub_21C2ABB84(_QWORD *a1)
{
  return ExpandedMedicationCluster.encode(to:)(a1);
}

uint64_t sub_21C2ABB98()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for ScanningSessionLogger();
  v0 = swift_allocObject();
  result = sub_21C2AC08C(120.0);
  qword_255255CD8 = v0;
  return result;
}

uint64_t static ScanningSessionLogger.shared.getter()
{
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static ScanningSessionLogger.shared.setter(uint64_t a1)
{
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  qword_255255CD8 = a1;
  return swift_release();
}

uint64_t (*static ScanningSessionLogger.shared.modify())()
{
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21C2ABD2C@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  _OWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE *v40;
  uint64_t v42;
  uint64_t v43;
  _OWORD v44[10];
  uint64_t v45;
  _BYTE v46[192];
  _BYTE v47[168];
  _BYTE v48[176];

  v2 = v1;
  sub_21C29CBC0(0, &qword_255255E50, (uint64_t (*)(uint64_t))sub_21C2B15CC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v42 - v5;
  sub_21C2B15CC();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v42 - v13;
  sub_21C2B1638((uint64_t)v48);
  v15 = *(_QWORD *)(v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_21C2C1A54();
  v16 = v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds;
  swift_beginAccess();
  v17 = *(_QWORD *)(*(_QWORD *)v16 + 16);
  if (v17)
  {
    sub_21C2B1658(*(_QWORD *)v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * (v17 - 1), (uint64_t)v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
    {
      v42 = v15;
      v43 = a1;
      v18 = *(int *)(v8 + 48);
      v19 = &v14[v18];
      v20 = &v6[v18];
      v21 = sub_21C2C1A00();
      v22 = *(_QWORD *)(v21 - 8);
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v14, v6, v21);
      v23 = sub_21C2C19DC();
      v24 = v20;
      v25 = *(_QWORD *)(v23 - 8);
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v19, v24, v23);
      v26 = &v12[*(int *)(v8 + 48)];
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v12, v14, v21);
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v26, v19, v23);
      v27 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
      swift_beginAccess();
      v28 = *v27;
      if (*(_QWORD *)(v28 + 16))
      {
        swift_bridgeObjectRetain();
        v29 = sub_21C2B1D4C((uint64_t)v12);
        if ((v30 & 1) != 0)
        {
          v31 = (_OWORD *)(*(_QWORD *)(v28 + 56) + 168 * v29);
          v33 = v31[1];
          v32 = v31[2];
          v44[0] = *v31;
          v44[1] = v33;
          v44[2] = v32;
          v34 = v31[3];
          v35 = v31[4];
          v36 = v31[6];
          v44[5] = v31[5];
          v44[6] = v36;
          v44[3] = v34;
          v44[4] = v35;
          v37 = v31[7];
          v38 = v31[8];
          v39 = v31[9];
          v45 = *((_QWORD *)v31 + 20);
          v44[8] = v38;
          v44[9] = v39;
          v44[7] = v37;
          memmove(v47, v31, 0xA8uLL);
          nullsub_1(v47);
          sub_21C2B1098((uint64_t)v44);
          swift_bridgeObjectRelease();
          v40 = v47;
LABEL_10:
          sub_21C294178((uint64_t)v40, (uint64_t)v46);
          sub_21C2B1DB8((uint64_t)v14);
          (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v23);
          (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v21);
          sub_21C294178((uint64_t)v46, (uint64_t)v47);
          a1 = v43;
          goto LABEL_11;
        }
        swift_bridgeObjectRelease();
      }
      v40 = v48;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v6, 1, 1, v8);
  }
  sub_21C29C534((uint64_t)v6, &qword_255255E50, (uint64_t (*)(uint64_t))sub_21C2B15CC);
  sub_21C294178((uint64_t)v48, (uint64_t)v47);
LABEL_11:
  sub_21C2C1A60();
  return sub_21C294178((uint64_t)v47, a1);
}

uint64_t sub_21C2AC08C(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_21C2C1994();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v9 = objc_msgSend(v8, sel_temporaryDirectory);

  sub_21C2C197C();
  sub_21C2C1970();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_encoder;
  sub_21C2C1934();
  swift_allocObject();
  *(_QWORD *)(v2 + v10) = sub_21C2C1928();
  v11 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock;
  sub_21C2C1A78();
  swift_allocObject();
  *(_QWORD *)(v2 + v11) = sub_21C2C1A6C();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer) = 0;
  v12 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds) = MEMORY[0x24BEE4AF8];
  v13 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions;
  *(_QWORD *)(v2 + v13) = sub_21C2A7D08(v12);
  *(double *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod) = a1;
  v14 = (void *)objc_opt_self();
  v15 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_21C2B6FE4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21C2AC4D8;
  aBlock[3] = &block_descriptor_4;
  v16 = _Block_copy(aBlock);
  swift_release();
  v17 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v16, a1);
  _Block_release(v16);
  v18 = *(void **)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer) = v17;

  sub_21C2B0660();
  return v2;
}

uint64_t ScanningSessionLogger.deinit()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_controlTimer);
  if (v2)
    objc_msgSend(v2, sel_invalidate);
  v3 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer;
  v4 = *(void **)(v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer);
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  sub_21C2B0660();
  v5 = v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_logDirectory;
  v6 = sub_21C2C1994();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScanningSessionLogger.__deallocating_deinit()
{
  ScanningSessionLogger.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21C2AC3E4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  id v7;
  double v8;
  double v9;
  uint64_t v10;

  v2 = sub_21C2C19DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = objc_msgSend(a1, sel_fireDate);
    sub_21C2C19C4();

    sub_21C2C19AC();
    v9 = v8;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_21C2AFDE8(v9);
    return swift_release();
  }
  return result;
}

void sub_21C2AC4D8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21C2AC528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;

  sub_21C2B15CC();
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C2C19DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C19F4();
  sub_21C2C1A54();
  sub_21C2C19D0();
  v12 = &v7[*(int *)(v4 + 48)];
  v13 = sub_21C2C1A00();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v7, a1, v13);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v14 = (unint64_t *)(v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds);
  swift_beginAccess();
  v15 = *v14;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v14 = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v15 = sub_21C2B1A10(0, *(_QWORD *)(v15 + 16) + 1, 1, v15, &qword_255256150, (uint64_t (*)(uint64_t))sub_21C2B15CC);
    *v14 = v15;
  }
  v18 = *(_QWORD *)(v15 + 16);
  v17 = *(_QWORD *)(v15 + 24);
  if (v18 >= v17 >> 1)
  {
    v15 = sub_21C2B1A10(v17 > 1, v18 + 1, 1, v15, &qword_255256150, (uint64_t (*)(uint64_t))sub_21C2B15CC);
    *v14 = v15;
  }
  *(_QWORD *)(v15 + 16) = v18 + 1;
  sub_21C2B1DF4((uint64_t)v7, v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v18);
  swift_endAccess();
  return sub_21C2C1A60();
}

uint64_t sub_21C2AC718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, unsigned __int8 *a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  __objc2_meth_list **v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 v64[8];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  _QWORD v75[22];

  v60 = a1;
  v61 = a6;
  v59 = a5;
  v48 = a4;
  v13 = sub_21C2C1A00();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = *a8;
  v17 = *((_QWORD *)a8 + 1);
  v18 = *((_QWORD *)a8 + 2);
  v19 = *((_QWORD *)a8 + 3);
  v20 = *((_QWORD *)a8 + 4);
  v54 = *((_QWORD *)a8 + 5);
  v55 = v20;
  v53 = a8[48];
  v52 = *((_QWORD *)a8 + 7);
  v51 = a8[64];
  v50 = *((_QWORD *)a8 + 9);
  v49 = a8[80];
  v62 = v8;
  sub_21C2C1A54();
  if (a7)
  {
    v21 = objc_msgSend(a7, sel_resolvedIds);
    sub_21C2943A8(0, &qword_255255740);
    v22 = sub_21C2C2270();

  }
  else
  {
    v22 = MEMORY[0x24BEE4AF8];
  }
  v57 = a2;
  v58 = a3;
  v23 = (unint64_t)v22 >> 62;
  if ((unint64_t)v22 >> 62)
  {
    if (v22 < 0)
      v27 = v22;
    else
      v27 = v22 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v29 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v28 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    if (v28 < 0)
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v29 >= 10)
      v45 = 10;
    else
      v45 = v29;
    if (v29 >= 0)
      v24 = v45;
    else
      v24 = 10;
    swift_bridgeObjectRetain();
    v46 = sub_21C2C26CC();
    result = swift_bridgeObjectRelease();
    if (v46 < v24)
    {
      __break(1u);
      return result;
    }
  }
  else if (*(uint64_t *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10) >= 10)
  {
    v24 = 10;
  }
  else
  {
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((v22 & 0xC000000000000001) != 0 && v24)
  {
    sub_21C2943A8(0, &qword_255255740);
    v25 = 0;
    do
    {
      v26 = v25 + 1;
      sub_21C2C2648();
      v25 = v26;
    }
    while (v24 != v26);
  }
  if (v23)
  {
    swift_bridgeObjectRetain();
    v27 = sub_21C2C26D8();
    v28 = v30;
    v23 = v31;
    v29 = v32;
    swift_bridgeObjectRelease_n();
    if ((v29 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
    v27 = v22 & 0xFFFFFFFFFFFFFF8;
    v28 = (v22 & 0xFFFFFFFFFFFFFF8) + 32;
    v29 = (2 * v24) | 1;
    if ((v29 & 1) != 0)
    {
LABEL_17:
      v47 = v16;
      v16 = (char *)v13;
      v13 = v14;
      sub_21C2C2810();
      swift_unknownObjectRetain_n();
      v34 = swift_dynamicCastClass();
      if (!v34)
      {
        swift_unknownObjectRelease();
        v34 = MEMORY[0x24BEE4AF8];
      }
      v35 = *(_QWORD *)(v34 + 16);
      swift_release();
      if (!__OFSUB__((unint64_t)v29 >> 1, v23))
      {
        if (v35 == ((unint64_t)v29 >> 1) - v23)
        {
          v33 = (__objc2_meth_list **)swift_dynamicCastClass();
          v13 = (uint64_t)v16;
          v16 = v47;
          if (!v33)
          {
            swift_unknownObjectRelease();
            v33 = (__objc2_meth_list **)MEMORY[0x24BEE4AF8];
          }
          goto LABEL_23;
        }
        goto LABEL_39;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      swift_unknownObjectRelease();
      v14 = v13;
      v13 = (uint64_t)v16;
      v16 = v47;
    }
  }
  v33 = (__objc2_meth_list **)sub_21C2B22D0(v27, v28, v23, v29, &qword_255255740);
LABEL_23:
  swift_unknownObjectRelease();
  v36 = (void *)objc_opt_self();
  v37 = objc_msgSend(v36, sel_isAppleInternalInstall);
  v39 = v57;
  v38 = v58;
  if ((v37 & 1) != 0)
    swift_bridgeObjectRetain();
  else
    v39 = MEMORY[0x24BEE4AF8];
  if (objc_msgSend(v36, sel_isAppleInternalInstall))
    swift_bridgeObjectRetain();
  else
    v38 = MEMORY[0x24BEE4AF8];
  if (objc_msgSend(v36, sel_isAppleInternalInstall))
  {
    v40 = v48;
    swift_bridgeObjectRetain();
  }
  else
  {
    v40 = MEMORY[0x24BEE4AF8];
  }
  v64[0] = v56;
  v65 = v17;
  v66 = v18;
  v67 = v19;
  v68 = v55;
  v69 = v54;
  v70 = v53;
  v71 = v52;
  v72 = v51;
  v73 = v50;
  v74 = v49;
  v41 = v61;
  swift_bridgeObjectRetain();
  ScanningSession.init(from:usedTranscripts:seenMRCs:pbsResults:mrcResult:attachments:systemState:)(v39, v38, v40, v33, v59, v41, MEMORY[0x24BEE4AF8], v64, v75);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v60, v13);
  v42 = (uint64_t *)(v62 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v63 = *v42;
  *v42 = 0x8000000000000000;
  sub_21C2B32FC((uint64_t)v75, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
  *v42 = v63;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_endAccess();
  return sub_21C2C1A60();
}

uint64_t sub_21C2ACC3C(uint64_t a1, void *a2)
{
  uint64_t v2;
  unint64_t v5;
  __objc2_meth_list **p_base_meths;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  BOOL v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  int v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  id v49;
  id v50;
  int v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __objc2_meth_list **v85;
  unint64_t v86;
  uint64_t *v87;
  char *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  _QWORD v109[8];
  char v110;
  _BYTE v111[7];
  uint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  _BYTE v117[7];
  uint64_t v118;
  char v119;
  _BYTE v120[7];
  uint64_t v121;
  char v122;
  _BYTE v123[7];
  id v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  _BYTE v137[7];
  char v138;
  _BYTE v139[7];
  char v140;
  _BYTE v141[7];
  char v142;
  _BYTE v143[7];
  _OWORD v144[10];
  uint64_t v145;

  v5 = sub_21C2C1A00();
  p_base_meths = *(__objc2_meth_list ***)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v88 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD **)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_21C2C1A54();
  v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  v87 = v9;
  v10 = *v9;
  if (*(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    v11 = sub_21C2B1D4C(a1);
    if ((v12 & 1) != 0)
    {
      v93 = a1;
      v13 = *(_QWORD *)(v10 + 56) + 168 * v11;
      v15 = *(_OWORD *)(v13 + 16);
      v14 = *(_OWORD *)(v13 + 32);
      v126 = *(_OWORD *)v13;
      v127 = v15;
      v128 = v14;
      v16 = *(_OWORD *)(v13 + 48);
      v17 = *(_OWORD *)(v13 + 64);
      v18 = *(_OWORD *)(v13 + 96);
      v131 = *(_OWORD *)(v13 + 80);
      v132 = v18;
      v129 = v16;
      v130 = v17;
      v19 = *(_OWORD *)(v13 + 112);
      v20 = *(_OWORD *)(v13 + 128);
      v21 = *(_OWORD *)(v13 + 144);
      v136 = *(_QWORD *)(v13 + 160);
      v134 = v20;
      v135 = v21;
      v133 = v19;
      sub_21C2B1098((uint64_t)&v126);
      swift_bridgeObjectRelease();
      v22 = v126;
      v96 = a2;
      v23 = *((_QWORD *)&v126 + 1);
      v24 = v127;
      v78 = v128;
      v25 = *((_QWORD *)&v129 + 1);
      v26 = v129;
      v76 = v130;
      v27 = *((_QWORD *)&v130 + 1);
      v28 = v131;
      v81 = *((_QWORD *)&v132 + 1);
      v82 = v132;
      v83 = *((_QWORD *)&v133 + 1);
      v84 = *((_QWORD *)&v134 + 1);
      v29 = v136;
      v69 = v134;
      v70 = v133;
      v142 = v133;
      v140 = v134;
      v68 = v135;
      v138 = v135;
      v71 = *((_QWORD *)&v128 + 1);
      swift_bridgeObjectRetain();
      v77 = v25;
      swift_bridgeObjectRetain();
      v74 = v29;
      swift_bridgeObjectRetain();
      v80 = v22;
      swift_bridgeObjectRetain();
      v73 = v23;
      swift_bridgeObjectRetain();
      v72 = v24;
      swift_bridgeObjectRetain();
      v79 = *((_QWORD *)&v24 + 1);
      swift_bridgeObjectRetain();
      v30 = objc_msgSend(v96, sel_resolvedIds);
      sub_21C2943A8(0, &qword_255255740);
      v31 = sub_21C2C2270();

      if (v31 >> 62)
        goto LABEL_40;
      v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      while (1)
      {
        v85 = p_base_meths;
        v86 = v5;
        v75 = v8;
        v5 = v93;
        v90 = v31;
        if (!v32)
          break;
        v33 = 0;
        v92 = v31 & 0xC000000000000001;
        v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v89 = v31 + 32;
        p_base_meths = &ResourceBundleClass.base_meths;
        v91 = v32;
        while (1)
        {
          v35 = v92 ? (id)MEMORY[0x220778DC8](v33, v90) : *(id *)(v89 + 8 * v33);
          v31 = (unint64_t)v35;
          v36 = __OFADD__(v33, 1);
          v37 = v33 + 1;
          if (v36)
            break;
          v38 = objc_msgSend(v35, sel_subHgIds);
          sub_21C2943A8(0, &qword_255255AE8);
          v5 = sub_21C2C2270();

          if (v5 >> 62)
          {
            swift_bridgeObjectRetain();
            v39 = sub_21C2C26CC();
          }
          else
          {
            v39 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
          }
          v95 = (id)v31;
          v96 = v34;
          v94 = v37;
          if (v39)
          {
            if (v39 < 1)
              goto LABEL_39;
            v40 = 0;
            v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
            do
            {
              if ((v5 & 0xC000000000000001) != 0)
                v41 = (id)MEMORY[0x220778DC8](v40, v5);
              else
                v41 = *(id *)(v5 + 8 * v40 + 32);
              v42 = v41;
              v43 = objc_msgSend(v41, sel_hgId);
              objc_msgSend(v42, sel_jaccardSimilarity);
              v45 = v44;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v8 = sub_21C2B09D0(0, v8[2] + 1, 1, v8);
              v47 = v8[2];
              v46 = v8[3];
              if (v47 >= v46 >> 1)
                v8 = sub_21C2B09D0((_QWORD *)(v46 > 1), v47 + 1, 1, v8);
              ++v40;
              v8[2] = v47 + 1;
              v48 = &v8[2 * v47];
              v48[4] = v43;
              *((_DWORD *)v48 + 10) = v45;
            }
            while (v39 != v40);
          }
          else
          {
            v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
          }
          swift_bridgeObjectRelease_n();
          v49 = v95;
          v50 = objc_msgSend(v95, sel_primaryHgId);
          objc_msgSend(v49, sel_maxJaccardSimilarity);
          v52 = v51;

          v34 = v96;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v34 = sub_21C2B0898(0, v34[2] + 1, 1, v34);
          v5 = v93;
          v33 = v94;
          v53 = v91;
          v55 = v34[2];
          v54 = v34[3];
          if (v55 >= v54 >> 1)
            v34 = sub_21C2B0898((_QWORD *)(v54 > 1), v55 + 1, 1, v34);
          v34[2] = v55 + 1;
          v56 = &v34[3 * v55];
          v56[4] = v50;
          *((_DWORD *)v56 + 10) = v52;
          v56[6] = v8;
          if (v33 == v53)
            goto LABEL_36;
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain();
        v32 = sub_21C2C26CC();
      }
      v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_36:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v57 = (uint64_t)v88;
      ((void (*)(char *, unint64_t, unint64_t))v85[2])(v88, v5, v86);
      v58 = v72;
      v59 = v73;
      *(_QWORD *)&v98 = v80;
      *((_QWORD *)&v98 + 1) = v73;
      *(_QWORD *)&v99 = v72;
      *((_QWORD *)&v99 + 1) = v79;
      v60 = v71;
      *(_QWORD *)&v100 = v78;
      *((_QWORD *)&v100 + 1) = v71;
      *(_QWORD *)&v101 = v26;
      *((_QWORD *)&v101 + 1) = v77;
      LOBYTE(v102) = v76;
      *((_QWORD *)&v102 + 1) = v27;
      v103 = v28;
      *(_QWORD *)&v104 = v82;
      *((_QWORD *)&v104 + 1) = v81;
      LOBYTE(v105) = v70;
      *((_QWORD *)&v105 + 1) = v83;
      LOBYTE(v106) = v69;
      *((_QWORD *)&v106 + 1) = v84;
      LOBYTE(v107) = v68;
      *((_QWORD *)&v107 + 1) = v34;
      v96 = v34;
      v61 = v74;
      v108 = v74;
      v144[4] = v102;
      v144[5] = v28;
      v145 = v74;
      v144[8] = v106;
      v144[9] = v107;
      v144[6] = v104;
      v144[7] = v105;
      v144[2] = v100;
      v144[3] = v101;
      v144[0] = v98;
      v144[1] = v99;
      sub_21C2B1098((uint64_t)&v98);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v62 = v58;
      swift_bridgeObjectRelease();
      v63 = v79;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v64 = v87;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v97 = *v64;
      *v64 = 0x8000000000000000;
      sub_21C2B32FC((uint64_t)v144, v57, isUniquelyReferenced_nonNull_native);
      *v64 = v97;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, unint64_t))v85[1])(v57, v86);
      swift_endAccess();
      v109[0] = v80;
      v109[1] = v59;
      v109[2] = v62;
      v109[3] = v63;
      v109[4] = v78;
      v109[5] = v60;
      v109[6] = v26;
      v109[7] = v77;
      v110 = v76;
      *(_DWORD *)v111 = *(_DWORD *)v143;
      *(_DWORD *)&v111[3] = *(_DWORD *)&v143[3];
      v112 = v27;
      v113 = v28;
      v114 = v82;
      v115 = v81;
      v116 = v142;
      *(_DWORD *)v117 = *(_DWORD *)v141;
      *(_DWORD *)&v117[3] = *(_DWORD *)&v141[3];
      v118 = v83;
      v119 = v140;
      *(_DWORD *)v120 = *(_DWORD *)v139;
      *(_DWORD *)&v120[3] = *(_DWORD *)&v139[3];
      v121 = v84;
      v122 = v138;
      *(_DWORD *)&v123[3] = *(_DWORD *)&v137[3];
      *(_DWORD *)v123 = *(_DWORD *)v137;
      v124 = v96;
      v125 = v61;
      sub_21C2B1120((uint64_t)v109);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return sub_21C2C1A60();
}

uint64_t sub_21C2AD41C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  __int128 v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
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
  _QWORD *v78;
  _QWORD v79[8];
  char v80;
  _BYTE v81[7];
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  _BYTE v87[7];
  uint64_t v88;
  char v89;
  _BYTE v90[7];
  uint64_t v91;
  char v92;
  _BYTE v93[7];
  uint64_t v94;
  _QWORD *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  _BYTE v107[7];
  char v108;
  _BYTE v109[7];
  char v110;
  _BYTE v111[7];
  char v112;
  _BYTE v113[7];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD *v124;

  v5 = sub_21C2C1A00();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_21C2C1A54();
  v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
  swift_beginAccess();
  v11 = *v10;
  if (!*(_QWORD *)(*v10 + 16))
    return sub_21C2C1A60();
  swift_bridgeObjectRetain();
  v12 = sub_21C2B1D4C(a1);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return sub_21C2C1A60();
  }
  v47 = a1;
  v14 = *(_QWORD *)(v11 + 56) + 168 * v12;
  v16 = *(_OWORD *)(v14 + 16);
  v15 = *(_OWORD *)(v14 + 32);
  v96 = *(_OWORD *)v14;
  v97 = v16;
  v98 = v15;
  v17 = *(_OWORD *)(v14 + 48);
  v18 = *(_OWORD *)(v14 + 64);
  v19 = *(_OWORD *)(v14 + 96);
  v101 = *(_OWORD *)(v14 + 80);
  v102 = v19;
  v99 = v17;
  v100 = v18;
  v20 = *(_OWORD *)(v14 + 112);
  v21 = *(_OWORD *)(v14 + 128);
  v22 = *(_OWORD *)(v14 + 144);
  v106 = *(_QWORD *)(v14 + 160);
  v104 = v21;
  v105 = v22;
  v103 = v20;
  sub_21C2B1098((uint64_t)&v96);
  swift_bridgeObjectRelease();
  v64 = *((_QWORD *)&v96 + 1);
  v65 = v96;
  v62 = *((_QWORD *)&v97 + 1);
  v63 = v97;
  v23 = v99;
  v51 = v100;
  v24 = *((_QWORD *)&v100 + 1);
  v25 = v101;
  v53 = v98;
  v54 = *((_QWORD *)&v102 + 1);
  v55 = v102;
  v56 = *((_QWORD *)&v103 + 1);
  v57 = *((_QWORD *)&v104 + 1);
  v45 = v104;
  v46 = v103;
  v112 = v103;
  v110 = v104;
  v44 = v105;
  v108 = v105;
  v58 = *((_QWORD *)&v105 + 1);
  v48 = *((_QWORD *)&v98 + 1);
  v52 = *((_QWORD *)&v99 + 1);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21C2C26CC();
    v26 = result;
  }
  else
  {
    v26 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
  }
  v49 = v10;
  v50 = v9;
  v60 = v6;
  v61 = v5;
  v59 = v8;
  if (!v26)
  {
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v47, v61);
    v35 = v64;
    *(_QWORD *)&v68 = v65;
    *((_QWORD *)&v68 + 1) = v64;
    v36 = v63;
    *(_QWORD *)&v69 = v63;
    *((_QWORD *)&v69 + 1) = v62;
    v37 = v62;
    v38 = v48;
    *(_QWORD *)&v70 = v53;
    *((_QWORD *)&v70 + 1) = v48;
    *(_QWORD *)&v71 = v23;
    *((_QWORD *)&v71 + 1) = v52;
    LOBYTE(v72) = v51;
    *((_QWORD *)&v72 + 1) = v24;
    v73 = v25;
    *(_QWORD *)&v74 = v55;
    *((_QWORD *)&v74 + 1) = v54;
    LOBYTE(v75) = v46;
    *((_QWORD *)&v75 + 1) = v56;
    LOBYTE(v76) = v45;
    *((_QWORD *)&v76 + 1) = v57;
    LOBYTE(v77) = v44;
    *((_QWORD *)&v77 + 1) = v58;
    v78 = v29;
    v118 = v72;
    v119 = v25;
    v124 = v29;
    v122 = v76;
    v123 = v77;
    v120 = v74;
    v121 = v75;
    v116 = v70;
    v117 = v71;
    v114 = v68;
    v115 = v69;
    sub_21C2B1098((uint64_t)&v68);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v39 = v37;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = v49;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v67 = *v40;
    *v40 = 0x8000000000000000;
    v42 = (uint64_t)v59;
    sub_21C2B32FC((uint64_t)&v114, (uint64_t)v59, isUniquelyReferenced_nonNull_native);
    *v40 = v67;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v42, v61);
    swift_endAccess();
    v79[0] = v65;
    v79[1] = v35;
    v79[2] = v36;
    v79[3] = v39;
    v79[4] = v53;
    v79[5] = v38;
    v79[6] = v23;
    v79[7] = v52;
    v80 = v51;
    *(_DWORD *)v81 = *(_DWORD *)v113;
    *(_DWORD *)&v81[3] = *(_DWORD *)&v113[3];
    v82 = v24;
    v83 = v25;
    v84 = v55;
    v85 = v54;
    v86 = v112;
    *(_DWORD *)v87 = *(_DWORD *)v111;
    *(_DWORD *)&v87[3] = *(_DWORD *)&v111[3];
    v88 = v56;
    v89 = v110;
    *(_DWORD *)v90 = *(_DWORD *)v109;
    *(_DWORD *)&v90[3] = *(_DWORD *)&v109[3];
    v91 = v57;
    v92 = v108;
    *(_DWORD *)&v93[3] = *(_DWORD *)&v107[3];
    *(_DWORD *)v93 = *(_DWORD *)v107;
    v94 = v58;
    v95 = v29;
    sub_21C2B1120((uint64_t)v79);
    return sub_21C2C1A60();
  }
  if (v26 >= 1)
  {
    v28 = 0;
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v30 = (id)MEMORY[0x220778DC8](v28, a2);
      else
        v30 = *(id *)(a2 + 8 * v28 + 32);
      sub_21C2AAE60(v30, (unint64_t *)&v114);
      v31 = v114;
      v66 = v115;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v29 = sub_21C2B1C2C(0, v29[2] + 1, 1, v29);
      v33 = v29[2];
      v32 = v29[3];
      if (v33 >= v32 >> 1)
        v29 = sub_21C2B1C2C((_QWORD *)(v32 > 1), v33 + 1, 1, v29);
      ++v28;
      v29[2] = v33 + 1;
      v34 = &v29[4 * v33];
      *((_OWORD *)v34 + 2) = v31;
      *((_OWORD *)v34 + 3) = v66;
    }
    while (v26 != v28);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2AD9F0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  _BYTE v52[7];
  char v53;
  _BYTE v54[7];
  char v55;
  _BYTE v56[7];
  char v57;
  _BYTE v58[7];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[2];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[3];
  _OWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  _BYTE v74[7];
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  _BYTE v80[7];
  uint64_t v81;
  char v82;
  _BYTE v83[7];
  uint64_t v84;
  char v85;
  _BYTE v86[7];
  __int128 v87;

  LODWORD(v50) = a7;
  v48 = a4;
  v49 = a6;
  v47 = a2;
  v11 = sub_21C2C1A00();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1A54();
  if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
  {
    v15 = (uint64_t *)(v7 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
    swift_beginAccess();
    v16 = *v15;
    if (*(_QWORD *)(*v15 + 16))
    {
      swift_bridgeObjectRetain();
      v17 = sub_21C2B1D4C(a1);
      if ((v18 & 1) != 0)
      {
        v19 = *(_QWORD *)(v16 + 56) + 168 * v17;
        v21 = *(_OWORD *)(v19 + 16);
        v20 = *(_OWORD *)(v19 + 32);
        v59 = *(_OWORD *)v19;
        v60 = v21;
        v61 = v20;
        v22 = *(_OWORD *)(v19 + 48);
        v23 = *(_OWORD *)(v19 + 64);
        v24 = *(_OWORD *)(v19 + 96);
        v63[1] = *(_OWORD *)(v19 + 80);
        v64 = v24;
        v62 = v22;
        v63[0] = v23;
        v25 = *(_OWORD *)(v19 + 112);
        v26 = *(_OWORD *)(v19 + 128);
        v27 = *(_OWORD *)(v19 + 144);
        *(_QWORD *)&v67[1] = *(_QWORD *)(v19 + 160);
        v66 = v26;
        v67[0] = v27;
        v65 = v25;
        sub_21C2B1098((uint64_t)&v59);
        swift_bridgeObjectRelease();
        v44 = LOBYTE(v63[0]);
        v46 = *(_OWORD *)((char *)v63 + 8);
        v28 = *((_QWORD *)&v63[1] + 1);
        v29 = *((_QWORD *)&v64 + 1);
        v45 = v64;
        v30 = v62;
        v41 = *((_QWORD *)&v61 + 1);
        v42 = v61;
        v43 = *((_QWORD *)&v62 + 1);
        if ((a3 & 1) == 0)
          v29 = v47;
        v47 = v29;
        v31 = a3 & v65;
        v32 = v48;
        v33 = v49;
        if ((a5 & 1) != 0)
          v32 = *((_QWORD *)&v65 + 1);
        v48 = v32;
        v34 = a5 & v66;
        if ((v50 & 1) != 0)
          v33 = *((_QWORD *)&v66 + 1);
        v49 = v33;
        v35 = v50 & LOBYTE(v67[0]);
        v36 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
        v39 = v60;
        v40 = v59;
        v50 = *(_OWORD *)((char *)v67 + 8);
        v36(v14, a1, v11);
        v57 = v31 & 1;
        v55 = v34 & 1;
        v53 = v35 & 1;
        v68[0] = v40;
        v68[1] = v39;
        v69 = v42;
        v70 = v41;
        v71 = v30;
        v72 = v43;
        v73 = v44;
        *(_DWORD *)v74 = *(_DWORD *)v58;
        *(_DWORD *)&v74[3] = *(_DWORD *)&v58[3];
        v75 = v46;
        v76 = v28;
        v77 = v45;
        v78 = v47;
        v79 = v31 & 1;
        *(_DWORD *)&v80[3] = *(_DWORD *)&v56[3];
        *(_DWORD *)v80 = *(_DWORD *)v56;
        v81 = v48;
        v82 = v34 & 1;
        *(_DWORD *)&v83[3] = *(_DWORD *)&v54[3];
        *(_DWORD *)v83 = *(_DWORD *)v54;
        v84 = v49;
        v85 = v35 & 1;
        *(_DWORD *)v86 = *(_DWORD *)v52;
        *(_DWORD *)&v86[3] = *(_DWORD *)&v52[3];
        v87 = v50;
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v51 = *v15;
        *v15 = 0x8000000000000000;
        sub_21C2B32FC((uint64_t)v68, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
        *v15 = v51;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  return sub_21C2C1A60();
}

void sub_21C2ADD58(uint64_t a1@<X0>, void *a2@<X1>, id a3@<X2>, _OWORD *a4@<X8>)
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;
  _OWORD *v30;
  double v31;
  double v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  id v44;
  char v45;
  id v46;
  _BOOL8 v47;
  _OWORD *v48;
  _QWORD v49[2];
  uint64_t v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  uint64_t v52;
  uint64_t v53;
  _OWORD *v54;
  _BYTE v55[168];
  uint64_t v56[21];
  uint64_t v57[21];

  v54 = a4;
  v8 = sub_21C2C19DC();
  v51 = *(void (***)(_QWORD, _QWORD, _QWORD))(v8 - 8);
  v52 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_255255E50, (uint64_t (*)(uint64_t))sub_21C2B15CC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v49 - v12;
  sub_21C2B15CC();
  v15 = v14;
  v16 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v53 = (uint64_t)v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
    a3 = objc_msgSend(a2, sel_firstConceptIdentifier);
  else
    v18 = a3;
  v19 = sub_21C2C1A00();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(a1, 1, v19) != 1)
  {

    goto LABEL_13;
  }
  if (!a3)
  {
LABEL_13:
    v30 = v54;
    *v54 = xmmword_21C2C47E0;
    *((_QWORD *)v30 + 2) = 0;
    *((_BYTE *)v30 + 24) = 0;
    return;
  }
  v21 = v4 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds;
  swift_beginAccess();
  v22 = *(_QWORD *)(*(_QWORD *)v21 + 16);
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v13, 1, 1, v15);
    goto LABEL_12;
  }
  sub_21C2B1658(*(_QWORD *)v21+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * (v22 - 1), (uint64_t)v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) == 1)
  {
LABEL_12:

    sub_21C29C534((uint64_t)v13, &qword_255255E50, (uint64_t (*)(uint64_t))sub_21C2B15CC);
    goto LABEL_13;
  }
  v23 = *(int *)(v15 + 48);
  v24 = v53;
  v25 = v53 + v23;
  v26 = &v13[v23];
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v53, v13, v19);
  v28 = v51;
  v27 = v52;
  ((void (**)(uint64_t, char *, uint64_t))v51)[4](v25, v26, v52);
  v29 = a3;
  sub_21C2ABD2C((uint64_t)v55);
  sub_21C294178((uint64_t)v55, (uint64_t)v56);
  sub_21C294178((uint64_t)v56, (uint64_t)v57);
  if (sub_21C2941D4(v57) == 1)
  {
    sub_21C2B1DB8(v24);

    goto LABEL_13;
  }
  sub_21C2C19D0();
  sub_21C2C19B8();
  v32 = v31;
  ((void (*)(char *, uint64_t))v28[1])(v10, v27);
  if ((~*(_QWORD *)&v32 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v32 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v32 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    return;
  }
  v33 = (uint64_t)v32;
  v52 = v57[5];
  v34 = objc_msgSend(v29, sel_numberRepresentation);
  v35 = objc_msgSend(v34, sel_stringValue);

  v36 = sub_21C2C21C8();
  v38 = v37;

  v39 = v57[20];
  swift_bridgeObjectRetain();
  sub_21C2941EC(v56);
  v40 = *(_QWORD *)(v39 + 16);
  if (!v40)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v41 = 0;
    v45 = 1;
    goto LABEL_27;
  }
  v50 = (uint64_t)v32;
  v51 = (void (**)(_QWORD, _QWORD, _QWORD))v29;
  v41 = 0;
  v49[1] = v39;
  v42 = v39 + 56;
  while (!*(_QWORD *)(*(_QWORD *)(v42 - 24) + 16))
  {
LABEL_19:
    ++v41;
    v42 += 32;
    if (v40 == v41)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v44 = v51;

      v41 = 0;
      v45 = 1;
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21C2B1E38(v36, v38);
  if ((v43 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  v46 = v51;

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45 = 0;
LABEL_26:
  v33 = v50;
LABEL_27:
  v47 = v52 == 0;
  sub_21C2B1DB8(v53);
  v48 = v54;
  *(_QWORD *)v54 = v33;
  *((_QWORD *)v48 + 1) = v47;
  *((_QWORD *)v48 + 2) = v41;
  *((_BYTE *)v48 + 24) = v45;
}

id sub_21C2AE258(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v19;
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
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t inited;
  void **v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  void (*v73)(unint64_t, uint64_t);
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  double v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  _OWORD *v112;
  char *v113;
  void (*v114)(char *, char *, uint64_t);
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  void (*v121)(char *, uint64_t);
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  id v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  unint64_t v141;
  int v142;
  uint64_t v143;
  int v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  uint64_t (*v148)();
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  char *v157;
  unint64_t v158;
  unint64_t v159;
  void (*v160)(char *, uint64_t);
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t aBlock;
  unint64_t v167;
  void (*v168)(uint64_t, void *);
  void *v169;
  uint64_t (*v170)();
  uint64_t v171;
  char v172;
  uint64_t v173;
  char v174;
  uint64_t v175;
  char v176;
  uint64_t v177;

  v3 = v1;
  v177 = *MEMORY[0x24BDAC8D0];
  v161 = sub_21C2C21E0();
  v160 = *(void (**)(char *, uint64_t))(v161 - 8);
  v5 = MEMORY[0x24BDAC7A8](v161);
  v138 = (char *)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v159 = (unint64_t)&v122 - v7;
  v8 = sub_21C2C1994();
  v164 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v150 = (char *)&v122 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v152 = (char *)&v122 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v136 = (char *)&v122 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v139 = (char *)&v122 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v122 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v153 = (char *)&v122 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v155 = (char *)&v122 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v157 = (char *)&v122 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v162 = (char *)&v122 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v122 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v122 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v122 - v34;
  v36 = *(_QWORD *)a1;
  v163 = *(_QWORD *)(a1 + 8);
  v158 = *(_QWORD *)(a1 + 16);
  v156 = *(_QWORD *)(a1 + 24);
  v137 = *(_QWORD *)(a1 + 32);
  v141 = *(_QWORD *)(a1 + 40);
  v140 = *(_QWORD *)(a1 + 56);
  LODWORD(v149) = *(unsigned __int8 *)(a1 + 64);
  v37 = *(_QWORD *)(a1 + 72);
  v38 = *(void (**)(uint64_t, void *))(a1 + 80);
  v39 = *(void **)(a1 + 88);
  v148 = *(uint64_t (**)())(a1 + 96);
  v147 = *(_QWORD *)(a1 + 104);
  v146 = *(unsigned __int8 *)(a1 + 112);
  v145 = *(_QWORD *)(a1 + 120);
  v144 = *(unsigned __int8 *)(a1 + 128);
  v143 = *(_QWORD *)(a1 + 136);
  v142 = *(unsigned __int8 *)(a1 + 144);
  v40 = *(_QWORD *)(a1 + 152);
  v41 = *(_QWORD *)(a1 + 160);
  v154 = v40;
  if (!objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
    return (id)MEMORY[0x24BEE4AF8];
  v132 = v41;
  v131 = v19;
  v134 = v30;
  v135 = v33;
  v151 = v8;
  sub_21C2C230C();
  sub_21C2C1970();
  swift_bridgeObjectRelease();
  v42 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v43 = (void *)sub_21C2C1964();
  sub_21C2B3470();
  inited = swift_initStackObject();
  v45 = (void **)MEMORY[0x24BDD0CF0];
  *(_OWORD *)(inited + 16) = xmmword_21C2C3880;
  v46 = *v45;
  *(_QWORD *)(inited + 32) = *v45;
  v47 = (void *)*MEMORY[0x24BDD0CE0];
  type metadata accessor for FileProtectionType(0);
  *(_QWORD *)(inited + 64) = v48;
  *(_QWORD *)(inited + 40) = v47;
  v49 = v46;
  v50 = v47;
  sub_21C2A7F20(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_21C293BF0(&qword_2552554B8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_21C2C3670);
  v51 = (void *)sub_21C2C2174();
  swift_bridgeObjectRelease();
  aBlock = 0;
  LODWORD(inited) = objc_msgSend(v42, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v43, 1, v51, &aBlock);

  if (!(_DWORD)inited)
  {
    v59 = (id)aBlock;
    sub_21C2C1958();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v164 + 8))(v35, v151);
    return v59;
  }
  v133 = v42;
  v52 = (id)aBlock;
  v53 = v135;
  sub_21C2C1970();
  v130 = v3;
  v54 = *(_QWORD *)(v3 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_encoder);
  aBlock = v36;
  sub_21C2944A4(0, &qword_255255D08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
  v56 = v55;
  sub_21C2B0DAC(&qword_255255D10, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  swift_bridgeObjectRetain();
  v57 = sub_21C2C191C();
  if (!v2)
  {
    v61 = v57;
    v62 = v58;
    v128 = v56;
    v127 = v54;
    v129 = v35;
    swift_bridgeObjectRelease();
    sub_21C2C19A0();
    v63 = v62;
    v126 = v61;
    sub_21C2C1970();
    aBlock = v163;
    swift_bridgeObjectRetain();
    v65 = sub_21C2C191C();
    v67 = v66;
    swift_bridgeObjectRelease();
    sub_21C2C19A0();
    v124 = v65;
    v125 = v67;
    v163 = v63;
    sub_21C2C1970();
    aBlock = v158;
    sub_21C2B3524();
    swift_bridgeObjectRetain();
    v68 = sub_21C2C218C();
    v70 = v69;
    swift_bridgeObjectRelease();
    aBlock = v68;
    v167 = v70;
    v71 = v159;
    sub_21C2C21D4();
    v72 = sub_21C2B3584();
    sub_21C2C2588();
    v158 = v72;
    v73 = (void (*)(unint64_t, uint64_t))*((_QWORD *)v160 + 1);
    v73(v71, v161);
    swift_bridgeObjectRelease();
    sub_21C2C1970();
    aBlock = v156;
    sub_21C2944A4(0, &qword_255255D18, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B0B34();
    swift_bridgeObjectRetain();
    v74 = sub_21C2C191C();
    v76 = v75;
    v160 = (void (*)(char *, uint64_t))v73;
    v77 = v74;
    swift_bridgeObjectRelease();
    sub_21C2C19A0();
    v156 = v77;
    v159 = v76;
    sub_21C2C1970();
    aBlock = v154;
    swift_bridgeObjectRetain();
    v78 = sub_21C2C191C();
    v80 = v79;
    swift_bridgeObjectRelease();
    sub_21C2C19A0();
    v128 = v78;
    v154 = v80;
    sub_21C2C1970();
    aBlock = v132;
    sub_21C2944A4(0, &qword_255255D50, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_21C2B0CF0();
    swift_bridgeObjectRetain();
    v122 = sub_21C2C191C();
    v123 = v81;
    swift_bridgeObjectRelease();
    sub_21C2C19A0();
    sub_21C2C1970();
    LOBYTE(aBlock) = v149;
    v167 = v37;
    v168 = v38;
    v169 = v39;
    v170 = v148;
    v171 = v147;
    v172 = v146;
    v173 = v145;
    v174 = v144;
    v175 = v143;
    v176 = v142;
    sub_21C2B0CAC();
    v147 = sub_21C2C191C();
    v148 = (uint64_t (*)())v82;
    sub_21C2C19A0();
    v149 = 0;
    if (v141)
    {
      sub_21C2C1970();
      aBlock = v137;
      v167 = v141;
      sub_21C2C21D4();
      v83 = v149;
      sub_21C2C2588();
      v149 = v83;
      if (v83)
      {
        sub_21C2B34E0(v147, (unint64_t)v148);
        sub_21C2B34E0(v122, v123);
        sub_21C2B34E0(v128, v154);
        sub_21C2B34E0(v156, v159);
        sub_21C2B34E0(v124, v125);
        sub_21C2B34E0(v126, v163);

        v160(v138, v161);
        v59 = *(id *)(v164 + 8);
        v84 = v151;
        ((void (*)(char *, uint64_t))v59)(v139, v151);
LABEL_26:
        ((void (*)(char *, uint64_t))v59)(v131, v84);
        ((void (*)(char *, uint64_t))v59)(v153, v84);
        ((void (*)(char *, uint64_t))v59)(v155, v84);
        ((void (*)(char *, uint64_t))v59)(v157, v84);
        ((void (*)(char *, uint64_t))v59)(v162, v84);
        ((void (*)(char *, uint64_t))v59)(v134, v84);
        ((void (*)(char *, uint64_t))v59)(v135, v84);
        ((void (*)(char *, uint64_t))v59)(v129, v84);
        return v59;
      }
      v160(v138, v161);
      (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v136, v139, v151);
      v161 = sub_21C2B1A10(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      v86 = *(_QWORD *)(v161 + 16);
      v85 = *(_QWORD *)(v161 + 24);
      if (v86 >= v85 >> 1)
        v161 = sub_21C2B1A10(v85 > 1, v86 + 1, 1, v161, &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      v87 = v161;
      *(_QWORD *)(v161 + 16) = v86 + 1;
      v88 = v164;
      v89 = v151;
      (*(void (**)(unint64_t, char *, uint64_t))(v164 + 32))(v87+ ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80))+ *(_QWORD *)(v88 + 72) * v86, v136, v151);
      (*(void (**)(char *, uint64_t))(v88 + 8))(v139, v89);
    }
    else
    {
      v161 = MEMORY[0x24BEE4AF8];
    }
    v90 = *(_QWORD *)(v140 + 16);
    if (!v90)
    {
LABEL_27:
      v101 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer;
      v102 = v130;
      objc_msgSend(*(id *)(v130 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_persistedLogTimer), sel_invalidate, v122, v123);
      v103 = (void *)objc_opt_self();
      v104 = *(double *)(v102 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod);
      v105 = swift_allocObject();
      swift_weakInit();
      v170 = sub_21C2B3630;
      v171 = v105;
      aBlock = MEMORY[0x24BDAC760];
      v167 = 1107296256;
      v168 = sub_21C2AC4D8;
      v169 = &block_descriptor_2;
      v106 = _Block_copy(&aBlock);
      swift_release();
      v107 = objc_msgSend(v103, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v106, v104);
      _Block_release(v106);
      v108 = *(void **)(v102 + v101);
      *(_QWORD *)(v102 + v101) = v107;

      sub_21C29CBC0(0, &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v109 = v164;
      v110 = *(_QWORD *)(v164 + 72);
      v111 = (*(unsigned __int8 *)(v164 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v164 + 80);
      v112 = (_OWORD *)swift_allocObject();
      v112[1] = xmmword_21C2C47F0;
      v113 = (char *)v112 + v111;
      v114 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
      v115 = v151;
      v114(v113, v135, v151);
      v116 = v134;
      v114(&v113[v110], v134, v115);
      v114(&v113[2 * v110], v162, v115);
      v114(&v113[3 * v110], v157, v115);
      v117 = v155;
      v114(&v113[4 * v110], v155, v115);
      v118 = v153;
      v114(&v113[5 * v110], v153, v115);
      v119 = &v113[6 * v110];
      v120 = v131;
      v114(v119, v131, v115);
      aBlock = (uint64_t)v112;
      sub_21C2A846C(v161);
      sub_21C2B34E0(v147, (unint64_t)v148);
      sub_21C2B34E0(v122, v123);
      sub_21C2B34E0(v128, v154);
      sub_21C2B34E0(v156, v159);
      sub_21C2B34E0(v124, v125);
      sub_21C2B34E0(v126, v163);

      v59 = (id)aBlock;
      v121 = *(void (**)(char *, uint64_t))(v109 + 8);
      v121(v120, v115);
      v121(v118, v115);
      v121(v117, v115);
      v121(v157, v115);
      v121(v162, v115);
      v121(v116, v115);
      v121(v135, v115);
      v121(v129, v115);
      return v59;
    }
    v91 = 0;
    v92 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    while (1)
    {
      v94 = *(v92 - 1);
      v93 = *v92;
      aBlock = 0;
      v167 = 0xE000000000000000;
      sub_21C2B35C8(v94, v93);
      sub_21C2C2630();
      swift_bridgeObjectRelease();
      aBlock = 0x656D686361747461;
      v167 = 0xEB000000005F746ELL;
      v165 = v91;
      sub_21C2C27EC();
      sub_21C2C2240();
      swift_bridgeObjectRelease();
      sub_21C2C2240();
      sub_21C2C1970();
      swift_bridgeObjectRelease();
      v95 = v149;
      sub_21C2C19A0();
      v149 = v95;
      if (v95)
        break;
      (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v150, v152, v151);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v161 = sub_21C2B1A10(0, *(_QWORD *)(v161 + 16) + 1, 1, v161, &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      v97 = *(_QWORD *)(v161 + 16);
      v96 = *(_QWORD *)(v161 + 24);
      if (v97 >= v96 >> 1)
        v161 = sub_21C2B1A10(v96 > 1, v97 + 1, 1, v161, &qword_255255EB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      ++v91;
      v92 += 2;
      v98 = v161;
      *(_QWORD *)(v161 + 16) = v97 + 1;
      v99 = v164;
      v100 = v151;
      (*(void (**)(unint64_t, char *, uint64_t))(v164 + 32))(v98+ ((*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80))+ *(_QWORD *)(v99 + 72) * v97, v150, v151);
      sub_21C2B34E0(v94, v93);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v152, v100);
      if (v90 == v91)
      {
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
    }
    sub_21C2B34E0(v94, v93);
    sub_21C2B34E0(v147, (unint64_t)v148);
    sub_21C2B34E0(v122, v123);
    sub_21C2B34E0(v128, v154);
    sub_21C2B34E0(v156, v159);
    sub_21C2B34E0(v124, v125);
    sub_21C2B34E0(v126, v163);

    v59 = *(id *)(v164 + 8);
    v84 = v151;
    ((void (*)(char *, uint64_t))v59)(v152, v151);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();

  v59 = *(id *)(v164 + 8);
  v60 = v151;
  ((void (*)(char *, uint64_t))v59)(v53, v151);
  ((void (*)(char *, uint64_t))v59)(v35, v60);
  return v59;
}

uint64_t sub_21C2AFDE8(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  double v43;
  double v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  int v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char *v50;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void (*v69)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  unint64_t v71;
  char v72;
  int v73;
  uint64_t v74;
  _QWORD v76[3];
  char *v77;
  char *v78;
  void (*v79)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  unint64_t v93;
  _OWORD v94[10];
  uint64_t v95;
  uint64_t v96;

  v2 = v1;
  v4 = sub_21C2C1A00();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v92 = (char *)v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v86 = (char *)v76 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v77 = (char *)v76 - v11;
  sub_21C2B15CC();
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v78 = (char *)v76 - v18;
  v19 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_21C29CBC0(0, &qword_2552556E0, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v85 = (char *)v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v76 - v23;
  sub_21C29CBC0(0, &qword_255255E50, (uint64_t (*)(uint64_t))sub_21C2B15CC, v19);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v76 - v26;
  v76[2] = *(_QWORD *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_lock);
  sub_21C2C1A54();
  v87 = v2;
  v28 = (uint64_t *)(v2 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionIds);
  swift_beginAccess();
  v29 = *v28;
  v30 = *(char **)(v29 + 16);
  v91 = v24;
  if (v30)
  {
    v83 = v17;
    v81 = OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessionValidPeriod;
    v31 = v29 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v80 = *(_QWORD *)(v14 + 72);
    v76[1] = v29;
    v32 = v31;
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x24BEE4AF8];
    v88 = v13;
    v34 = (uint64_t)v78;
    v84 = v14;
    v82 = v27;
    while (1)
    {
      sub_21C2B1658(v32, (uint64_t)v27);
      v79 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
      v79(v27, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v27, 1, v13) == 1)
        break;
      v89 = v32;
      v90 = v30;
      v93 = v33;
      sub_21C2B1DF4((uint64_t)v27, v34);
      v35 = *(int *)(v13 + 48);
      v36 = v83;
      v37 = &v83[v35];
      v38 = v34 + v35;
      v39 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v39(v83, v34, v4);
      v40 = sub_21C2C19DC();
      v41 = *(_QWORD *)(v40 - 8);
      v42 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
      v42(v37, v38, v40);
      sub_21C2C19AC();
      v44 = v43;
      v45 = *(void (**)(char *, uint64_t))(v41 + 8);
      v45(v37, v40);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v36, v4);
      if (*(double *)(v87 + v81) <= a1 - v44)
      {
        v47 = &v36[*(int *)(v88 + 48)];
        v39(v36, v34, v4);
        v42(v47, v38, v40);
        v46 = (uint64_t)v85;
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v85, v36, v4);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v46, 0, 1, v4);
        v45(v47, v40);
      }
      else
      {
        v46 = (uint64_t)v85;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v85, 1, 1, v4);
      }
      v33 = v93;
      sub_21C2B1DB8(v34);
      v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v46, 1, v4);
      v24 = v91;
      v14 = v84;
      if (v48 == 1)
      {
        sub_21C29C534(v46, &qword_2552556E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
        v13 = v88;
      }
      else
      {
        v49 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 32);
        v50 = v77;
        v49(v77, v46, v4);
        v49(v86, (uint64_t)v50, v4);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v13 = v88;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v33 = sub_21C2B1A10(0, *(_QWORD *)(v33 + 16) + 1, 1, v33, &qword_255256100, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
        v53 = *(_QWORD *)(v33 + 16);
        v52 = *(_QWORD *)(v33 + 24);
        if (v53 >= v52 >> 1)
          v33 = sub_21C2B1A10(v52 > 1, v53 + 1, 1, v33, &qword_255256100, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58]);
        *(_QWORD *)(v33 + 16) = v53 + 1;
        v49((char *)(v33+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v53), (uint64_t)v86, v4);
        v34 = (uint64_t)v78;
      }
      v27 = v82;
      v32 = v89 + v80;
      v30 = v90 - 1;
      if (v90 == (char *)1)
      {
        v79(v82, 1, 1, v13);
        break;
      }
    }
  }
  else
  {
    v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x24BEE4AF8];
    v54(v27, 1, 1, v13);
  }
  swift_bridgeObjectRelease();
  v55 = *(_QWORD *)(v33 + 16);
  v93 = v33;
  if (v55)
  {
    v56 = (uint64_t *)(v87 + OBJC_IVAR____TtC25HealthMedicationsVisionUI21ScanningSessionLogger_sessions);
    v57 = v33 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v58 = *(_QWORD *)(v6 + 72);
    v90 = *(char **)(v6 + 16);
    ((void (*)(char *, unint64_t, uint64_t))v90)(v24, v57, v4);
    while (1)
    {
      v69 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v69(v24, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v24, 1, v4) == 1)
        break;
      v70 = (uint64_t)v92;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v92, v24, v4);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v71 = sub_21C2B1D4C(v70);
      LOBYTE(v70) = v72;
      swift_bridgeObjectRelease();
      if ((v70 & 1) != 0)
      {
        v73 = swift_isUniquelyReferenced_nonNull_native();
        v74 = *v56;
        v96 = *v56;
        *v56 = 0x8000000000000000;
        if (!v73)
        {
          sub_21C2B4EE8();
          v74 = v96;
        }
        (*(void (**)(unint64_t, uint64_t))(v6 + 8))(*(_QWORD *)(v74 + 48) + v71 * v58, v4);
        v59 = v96;
        v60 = *(_QWORD *)(v96 + 56) + 168 * v71;
        v62 = *(_OWORD *)(v60 + 16);
        v61 = *(_OWORD *)(v60 + 32);
        v94[0] = *(_OWORD *)v60;
        v94[1] = v62;
        v94[2] = v61;
        v63 = *(_OWORD *)(v60 + 96);
        v65 = *(_OWORD *)(v60 + 48);
        v64 = *(_OWORD *)(v60 + 64);
        v94[5] = *(_OWORD *)(v60 + 80);
        v94[6] = v63;
        v94[3] = v65;
        v94[4] = v64;
        v67 = *(_OWORD *)(v60 + 128);
        v66 = *(_OWORD *)(v60 + 144);
        v68 = *(_OWORD *)(v60 + 112);
        v95 = *(_QWORD *)(v60 + 160);
        v94[8] = v67;
        v94[9] = v66;
        v94[7] = v68;
        sub_21C2B3050(v71, v96);
        *v56 = v59;
        swift_bridgeObjectRelease();
        sub_21C2B1120((uint64_t)v94);
      }
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v92, v4);
      v57 += v58;
      --v55;
      v24 = v91;
      if (!v55)
        goto LABEL_28;
      ((void (*)(char *, unint64_t, uint64_t))v90)(v91, v57, v4);
    }
  }
  else
  {
    v69 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
LABEL_28:
    v69(v24, 1, 1, v4);
  }
  swift_bridgeObjectRelease();
  return sub_21C2C1A60();
}

uint64_t sub_21C2B060C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_21C2B0660();
    return swift_release();
  }
  return result;
}

void sub_21C2B0660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_21C2C1D78();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_21C2C1988();
  v4 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v14, sel_fileExistsAtPath_, v4);

  if (v5)
  {
    v6 = (void *)sub_21C2C1964();
    v15[0] = 0;
    v7 = objc_msgSend(v14, sel_removeItemAtURL_error_, v6, v15);

    if (v7)
    {
      v8 = v15[0];

    }
    else
    {
      v9 = v15[0];
      v10 = (void *)sub_21C2C1958();

      swift_willThrow();
      sub_21C2C1D54();
      v11 = sub_21C2C1D6C();
      v12 = sub_21C2C2354();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21C28F000, v11, v12, "Failed to clear scanning persisted logs", v13, 2u);
        MEMORY[0x2207794E8](v13, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
  }
  else
  {

  }
}

_QWORD *sub_21C2B0898(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2944A4(0, &qword_255256160, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_21C2B5A4C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21C2B09D0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2944A4(0, &qword_255256168, (uint64_t)&type metadata for SpecificProductResult, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_21C2B5B40(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_21C2B0AF0()
{
  unint64_t result;

  result = qword_255255D00;
  if (!qword_255255D00)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4694, &type metadata for ScanningSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255255D00);
  }
  return result;
}

unint64_t sub_21C2B0B34()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255D20;
  if (!qword_255255D20)
  {
    sub_21C2944A4(255, &qword_255255D18, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B0BAC();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255D20);
  }
  return result;
}

unint64_t sub_21C2B0BAC()
{
  unint64_t result;

  result = qword_255255D28;
  if (!qword_255255D28)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ClinicalProductResultGroup, &type metadata for ClinicalProductResultGroup);
    atomic_store(result, (unint64_t *)&qword_255255D28);
  }
  return result;
}

unint64_t sub_21C2B0BF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255D38;
  if (!qword_255255D38)
  {
    sub_21C2944A4(255, &qword_255255D30, MEMORY[0x24BDCDDE8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B0C68();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255D38);
  }
  return result;
}

unint64_t sub_21C2B0C68()
{
  unint64_t result;

  result = qword_255255D40;
  if (!qword_255255D40)
  {
    result = MEMORY[0x22077944C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_255255D40);
  }
  return result;
}

unint64_t sub_21C2B0CAC()
{
  unint64_t result;

  result = qword_255255D48;
  if (!qword_255255D48)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ScanningSystemState, &type metadata for ScanningSystemState);
    atomic_store(result, (unint64_t *)&qword_255255D48);
  }
  return result;
}

unint64_t sub_21C2B0CF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255D58;
  if (!qword_255255D58)
  {
    sub_21C2944A4(255, &qword_255255D50, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B0D68();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255D58);
  }
  return result;
}

unint64_t sub_21C2B0D68()
{
  unint64_t result;

  result = qword_255255D60;
  if (!qword_255255D60)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ExpandedMedicationCluster, &type metadata for ExpandedMedicationCluster);
    atomic_store(result, (unint64_t *)&qword_255255D60);
  }
  return result;
}

uint64_t sub_21C2B0DAC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    sub_21C2944A4(255, &qword_255255D08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v8 = a2;
    result = MEMORY[0x22077944C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21C2B0E20()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255D78;
  if (!qword_255255D78)
  {
    sub_21C2944A4(255, &qword_255255D18, (uint64_t)&type metadata for ClinicalProductResultGroup, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B0E98();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12D0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255D78);
  }
  return result;
}

unint64_t sub_21C2B0E98()
{
  unint64_t result;

  result = qword_255255D80;
  if (!qword_255255D80)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ClinicalProductResultGroup, &type metadata for ClinicalProductResultGroup);
    atomic_store(result, (unint64_t *)&qword_255255D80);
  }
  return result;
}

unint64_t sub_21C2B0EDC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255D88;
  if (!qword_255255D88)
  {
    sub_21C2944A4(255, &qword_255255D30, MEMORY[0x24BDCDDE8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B0F54();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12D0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255D88);
  }
  return result;
}

unint64_t sub_21C2B0F54()
{
  unint64_t result;

  result = qword_255255D90;
  if (!qword_255255D90)
  {
    result = MEMORY[0x22077944C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_255255D90);
  }
  return result;
}

unint64_t sub_21C2B0F98()
{
  unint64_t result;

  result = qword_255255D98;
  if (!qword_255255D98)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ScanningSystemState, &type metadata for ScanningSystemState);
    atomic_store(result, (unint64_t *)&qword_255255D98);
  }
  return result;
}

unint64_t sub_21C2B0FDC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255DA0;
  if (!qword_255255DA0)
  {
    sub_21C2944A4(255, &qword_255255D50, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B1054();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12D0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255DA0);
  }
  return result;
}

unint64_t sub_21C2B1054()
{
  unint64_t result;

  result = qword_255255DA8;
  if (!qword_255255DA8)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for ExpandedMedicationCluster, &type metadata for ExpandedMedicationCluster);
    atomic_store(result, (unint64_t *)&qword_255255DA8);
  }
  return result;
}

uint64_t sub_21C2B1098(uint64_t a1)
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

uint64_t sub_21C2B1120(uint64_t a1)
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

unint64_t sub_21C2B11A8()
{
  unint64_t result;

  result = qword_255255DB8;
  if (!qword_255255DB8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4644, &type metadata for ClinicalProductResultGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255255DB8);
  }
  return result;
}

unint64_t sub_21C2B11EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255DC8;
  if (!qword_255255DC8)
  {
    sub_21C2944A4(255, &qword_255255DC0, (uint64_t)&type metadata for SpecificProductResult, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B1264();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255DC8);
  }
  return result;
}

unint64_t sub_21C2B1264()
{
  unint64_t result;

  result = qword_255255DD0;
  if (!qword_255255DD0)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for SpecificProductResult, &type metadata for SpecificProductResult);
    atomic_store(result, (unint64_t *)&qword_255255DD0);
  }
  return result;
}

unint64_t sub_21C2B12A8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_255255DE0;
  if (!qword_255255DE0)
  {
    sub_21C2944A4(255, &qword_255255DC0, (uint64_t)&type metadata for SpecificProductResult, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B1320();
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12D0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255DE0);
  }
  return result;
}

unint64_t sub_21C2B1320()
{
  unint64_t result;

  result = qword_255255DE8;
  if (!qword_255255DE8)
  {
    result = MEMORY[0x22077944C](&protocol conformance descriptor for SpecificProductResult, &type metadata for SpecificProductResult);
    atomic_store(result, (unint64_t *)&qword_255255DE8);
  }
  return result;
}

unint64_t sub_21C2B1364()
{
  unint64_t result;

  result = qword_255255DF8;
  if (!qword_255255DF8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C45F4, &type metadata for SpecificProductResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255255DF8);
  }
  return result;
}

unint64_t sub_21C2B13A8()
{
  unint64_t result;

  result = qword_255255E10;
  if (!qword_255255E10)
  {
    result = MEMORY[0x22077944C](&unk_21C2C45A4, &type metadata for ExpandedMedicationCluster.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255255E10);
  }
  return result;
}

unint64_t sub_21C2B13EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_255255E30;
  if (!qword_255255E30)
  {
    sub_21C2B6F40(255, &qword_255255E28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B14D0(&qword_255255E20, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12A0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255E30);
  }
  return result;
}

void sub_21C2B1474(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

uint64_t sub_21C2B14D0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    sub_21C2B7050(255, &qword_255255E18, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0460]);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x22077944C](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21C2B1544()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_255255E48;
  if (!qword_255255E48)
  {
    sub_21C2B6F40(255, &qword_255255E28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    v2 = v1;
    v3 = sub_21C2B14D0(&qword_255255E40, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12D0], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_255255E48);
  }
  return result;
}

void sub_21C2B15CC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255255E58)
  {
    sub_21C2C1A00();
    sub_21C2C19DC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255255E58);
  }
}

double sub_21C2B1638(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 160) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_21C2B1658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2B15CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_21C2B169C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2944A4(0, &qword_255255578, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_21C2B5C28(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21C2B17BC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2944A4(0, &qword_2552560F0, (uint64_t)&type metadata for ScanResultGroupItem, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4])
          memmove(v12, a4 + 4, 56 * v8);
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
    sub_21C2B5D18(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21C2B18F8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2B6F40(0, &qword_255256140, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_21C2B67C8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2B1A10(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_21C29CBC0(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_21C2C26B4();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21C2B6B78(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_21C2B1C2C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_21C2944A4(0, &qword_255256128, (uint64_t)&type metadata for ExpandedMedicationCluster, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
    sub_21C2B6DEC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_21C2B1D4C(uint64_t a1)
{
  uint64_t v2;

  sub_21C2C1A00();
  sub_21C293BF0(&qword_255256108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_21C2C2180();
  return sub_21C2B1F28(a1, v2);
}

uint64_t sub_21C2B1DB8(uint64_t a1)
{
  uint64_t v2;

  sub_21C2B15CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C2B1DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2B15CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21C2B1E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2C284C();
  sub_21C2C2228();
  v4 = sub_21C2C2870();
  return sub_21C2B2068(a1, a2, v4);
}

unint64_t sub_21C2B1E9C(uint64_t a1)
{
  uint64_t v2;

  sub_21C2C21C8();
  sub_21C2C284C();
  sub_21C2C2228();
  v2 = sub_21C2C2870();
  swift_bridgeObjectRelease();
  return sub_21C2B2148(a1, v2);
}

unint64_t sub_21C2B1F28(uint64_t a1, uint64_t a2)
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
  v5 = sub_21C2C1A00();
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
      sub_21C293BF0(&qword_255256158, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_21C2C2198();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_21C2B2068(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21C2C2804() & 1) == 0)
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
      while (!v14 && (sub_21C2C2804() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21C2B2148(uint64_t a1, uint64_t a2)
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
    v6 = sub_21C2C21C8();
    v8 = v7;
    if (v6 == sub_21C2C21C8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21C2C2804();
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
          v13 = sub_21C2C21C8();
          v15 = v14;
          if (v13 == sub_21C2C21C8() && v15 == v16)
            break;
          v18 = sub_21C2C2804();
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

uint64_t sub_21C2B22BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_21C2B22D0(a1, a2, a3, a4, &qword_255255A90);
}

uint64_t sub_21C2B22D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v6)
      return MEMORY[0x24BEE4AF8];
    v10 = v6;
    if (v6 <= 0)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v5 != a3)
      {
LABEL_7:
        if (v6 < 0)
          goto LABEL_19;
        v14 = a2 + 8 * a3;
        if (v14 < (unint64_t)&v11[v10 + 4] && (unint64_t)(v11 + 4) < v14 + v10 * 8)
          goto LABEL_19;
        sub_21C2943A8(0, a5);
        swift_arrayInitWithCopy();
        return (uint64_t)v11;
      }
    }
    else
    {
      sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v6;
      v11[3] = (2 * (v13 >> 3)) | 1;
      if (v5 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

_QWORD *sub_21C2B2480(uint64_t a1)
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
  sub_21C2944A4(0, &qword_255255578, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_21C2B5658((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21C2B6A98();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_21C2B2578(uint64_t a1)
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
  sub_21C2944A4(0, &qword_2552554F8, MEMORY[0x24BEE4AD0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_21C2B5854(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21C2B6A98();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21C2B2678(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  unint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  int64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  __int128 v71;
  int64_t v72;
  char *v73;
  _BYTE v74[7];
  char v75;
  _BYTE v76[7];
  char v77;
  _BYTE v78[7];
  char v79;
  _OWORD v80[3];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[24];

  v3 = v2;
  v5 = sub_21C2C1A00();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v73 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  sub_21C2B6C90();
  v60 = a2;
  v9 = sub_21C2C26F0();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v55 = v2;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v57 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v56 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v59 = v8;
  v58 = v6;
  while (1)
  {
    if (v14)
    {
      v23 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v24 = v23 | (v17 << 6);
      goto LABEL_22;
    }
    v25 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v56)
      break;
    v26 = v57;
    v27 = v57[v25];
    ++v17;
    if (!v27)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v56)
        goto LABEL_34;
      v27 = v57[v17];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v56)
        {
LABEL_34:
          swift_release();
          v3 = v55;
          goto LABEL_36;
        }
        v27 = v57[v28];
        if (!v27)
        {
          while (1)
          {
            v17 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v17 >= v56)
              goto LABEL_34;
            v27 = v57[v17];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v17 = v28;
      }
    }
LABEL_21:
    v14 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v17 << 6);
LABEL_22:
    v72 = v17;
    v29 = *(_QWORD *)(v6 + 72);
    if ((v60 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v73, *(_QWORD *)(v8 + 48) + v29 * v24, v5);
      v30 = *(_QWORD *)(v8 + 56) + 168 * v24;
      v61 = *(_OWORD *)v30;
      v62 = *(_OWORD *)(v30 + 16);
      v64 = *(_QWORD *)(v30 + 32);
      v63 = *(_QWORD *)(v30 + 40);
      v31 = *(_QWORD *)(v30 + 48);
      v65 = *(_QWORD *)(v30 + 56);
      v70 = *(unsigned __int8 *)(v30 + 64);
      v32 = *(_QWORD *)(v30 + 72);
      v33 = *(_QWORD *)(v30 + 80);
      v34 = *(_QWORD *)(v30 + 88);
      v69 = *(_QWORD *)(v30 + 96);
      v68 = *(_QWORD *)(v30 + 104);
      v35 = *(_BYTE *)(v30 + 112);
      v67 = *(_QWORD *)(v30 + 120);
      v36 = *(_BYTE *)(v30 + 128);
      v66 = *(_QWORD *)(v30 + 136);
      v37 = *(_BYTE *)(v30 + 144);
      v71 = *(_OWORD *)(v30 + 152);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v73, *(_QWORD *)(v8 + 48) + v29 * v24, v5);
      v38 = *(_QWORD *)(v8 + 56) + 168 * v24;
      v39 = *(_OWORD *)(v38 + 112);
      v40 = *(_OWORD *)(v38 + 128);
      v41 = *(_OWORD *)(v38 + 144);
      *(_QWORD *)&v87[16] = *(_QWORD *)(v38 + 160);
      v86 = v40;
      *(_OWORD *)v87 = v41;
      v85 = v39;
      v42 = *(_OWORD *)(v38 + 48);
      v43 = *(_OWORD *)(v38 + 64);
      v44 = *(_OWORD *)(v38 + 96);
      v83 = *(_OWORD *)(v38 + 80);
      v84 = v44;
      v81 = v42;
      v82 = v43;
      v46 = *(_OWORD *)(v38 + 16);
      v45 = *(_OWORD *)(v38 + 32);
      v80[0] = *(_OWORD *)v38;
      v80[1] = v46;
      v80[2] = v45;
      v71 = *(_OWORD *)&v87[8];
      v70 = v82;
      v32 = *((_QWORD *)&v82 + 1);
      v34 = *((_QWORD *)&v83 + 1);
      v33 = v83;
      v68 = *((_QWORD *)&v44 + 1);
      v69 = v44;
      v35 = v85;
      v67 = *((_QWORD *)&v85 + 1);
      v36 = v86;
      v66 = *((_QWORD *)&v86 + 1);
      v37 = v41;
      v65 = *((_QWORD *)&v81 + 1);
      v31 = v81;
      v63 = *((_QWORD *)&v45 + 1);
      v64 = v45;
      v62 = v46;
      v61 = v80[0];
      sub_21C2B1098((uint64_t)v80);
    }
    sub_21C293BF0(&qword_255256108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_21C2C2180();
    v47 = -1 << *(_BYTE *)(v10 + 32);
    v48 = result & ~v47;
    v49 = v48 >> 6;
    if (((-1 << v48) & ~*(_QWORD *)(v15 + 8 * (v48 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v48) & ~*(_QWORD *)(v15 + 8 * (v48 >> 6)))) | v48 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v50 = 0;
      v51 = (unint64_t)(63 - v47) >> 6;
      do
      {
        if (++v49 == v51 && (v50 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v52 = v49 == v51;
        if (v49 == v51)
          v49 = 0;
        v50 |= v52;
        v53 = *(_QWORD *)(v15 + 8 * v49);
      }
      while (v53 == -1);
      v18 = __clz(__rbit64(~v53)) + (v49 << 6);
    }
    v79 = v35;
    v77 = v36;
    v75 = v37;
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v6 = v58;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v58 + 32))(*(_QWORD *)(v10 + 48) + v29 * v18, v73, v5);
    v19 = *(_QWORD *)(v10 + 56) + 168 * v18;
    v20 = v62;
    *(_OWORD *)v19 = v61;
    *(_OWORD *)(v19 + 16) = v20;
    v21 = v63;
    *(_QWORD *)(v19 + 32) = v64;
    *(_QWORD *)(v19 + 40) = v21;
    *(_QWORD *)(v19 + 48) = v31;
    *(_QWORD *)(v19 + 56) = v65;
    *(_BYTE *)(v19 + 64) = v70;
    *(_DWORD *)(v19 + 68) = *(_DWORD *)((char *)v80 + 3);
    *(_DWORD *)(v19 + 65) = v80[0];
    *(_QWORD *)(v19 + 72) = v32;
    *(_QWORD *)(v19 + 80) = v33;
    *(_QWORD *)(v19 + 88) = v34;
    v22 = v68;
    *(_QWORD *)(v19 + 96) = v69;
    *(_QWORD *)(v19 + 104) = v22;
    *(_BYTE *)(v19 + 112) = v79;
    *(_DWORD *)(v19 + 113) = *(_DWORD *)v78;
    *(_DWORD *)(v19 + 116) = *(_DWORD *)&v78[3];
    *(_QWORD *)(v19 + 120) = v67;
    *(_BYTE *)(v19 + 128) = v77;
    *(_DWORD *)(v19 + 129) = *(_DWORD *)v76;
    *(_DWORD *)(v19 + 132) = *(_DWORD *)&v76[3];
    *(_QWORD *)(v19 + 136) = v66;
    *(_BYTE *)(v19 + 144) = v75;
    *(_DWORD *)(v19 + 148) = *(_DWORD *)&v74[3];
    *(_DWORD *)(v19 + 145) = *(_DWORD *)v74;
    *(_OWORD *)(v19 + 152) = v71;
    ++*(_QWORD *)(v10 + 16);
    v8 = v59;
    v17 = v72;
  }
  swift_release();
  v3 = v55;
  v26 = v57;
LABEL_36:
  if ((v60 & 1) != 0)
  {
    v54 = 1 << *(_BYTE *)(v8 + 32);
    if (v54 >= 64)
      bzero(v26, ((unint64_t)(v54 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v26 = -1 << v54;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_21C2B2D48(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  sub_21C2B6AA0();
  v38 = a2;
  v6 = sub_21C2C26F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_21C2C284C();
    sub_21C2C2228();
    result = sub_21C2C2870();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

char *sub_21C2B3050(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  unint64_t v32;
  uint64_t v33;

  v4 = sub_21C2C1A00();
  v33 = *(_QWORD *)(v4 - 8);
  result = (char *)MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = (char *)sub_21C2C25AC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v32 = (unint64_t)(result + 1) & v11;
      v12 = *(_QWORD *)(v33 + 72);
      v31 = *(void (**)(char *, unint64_t, uint64_t))(v33 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v31(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_21C293BF0(&qword_255256108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_21C2C2180();
        result = (char *)(*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v32)
        {
          if (v19 >= v32 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || (v12 = v15, *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15)))
            {
              swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v22 = *(_QWORD *)(a2 + 56);
            result = (char *)(v22 + 168 * a1);
            v23 = (char *)(v22 + 168 * v10);
            if (a1 != v10 || (a1 = v10, result >= v23 + 168))
            {
              result = (char *)memmove(result, v23, 0xA8uLL);
              v13 = v17;
              v12 = v15;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v32 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v24 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v25 = *v24;
    v26 = (-1 << a1) - 1;
  }
  else
  {
    v24 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v24;
    v25 = (-1 << a1) - 1;
  }
  *v24 = v26 & v25;
  v27 = *(_QWORD *)(a2 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21C2B32FC(uint64_t a1, uint64_t a2, char a3)
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
  v8 = sub_21C2C1A00();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_21C2B1D4C(a2);
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
        return sub_21C2B6FB0(a1, v20[7] + 168 * v14);
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_21C2B4EE8();
      goto LABEL_7;
    }
    sub_21C2B2678(v17, a3 & 1);
    v22 = sub_21C2B1D4C(a2);
    if ((v18 & 1) == (v23 & 1))
    {
      v14 = v22;
      v20 = *v4;
      if ((v18 & 1) != 0)
        return sub_21C2B6FB0(a1, v20[7] + 168 * v14);
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_21C2B4E1C(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_21C2C2828();
  __break(1u);
  return result;
}

void sub_21C2B3470()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255E90)
  {
    sub_21C2B6FEC(255, &qword_255255E98, type metadata accessor for FileAttributeKey);
    v0 = sub_21C2C27F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255E90);
  }
}

uint64_t sub_21C2B34E0(uint64_t a1, unint64_t a2)
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

unint64_t sub_21C2B3524()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255255EA0;
  if (!qword_255255EA0)
  {
    sub_21C2944A4(255, &qword_255255D08, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x22077944C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255255EA0);
  }
  return result;
}

unint64_t sub_21C2B3584()
{
  unint64_t result;

  result = qword_255255EA8;
  if (!qword_255255EA8)
  {
    result = MEMORY[0x22077944C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255255EA8);
  }
  return result;
}

uint64_t sub_21C2B35C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_21C2B360C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21C2B3630()
{
  return sub_21C2B060C();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ScanningAnalyticsWrapper(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanningAnalyticsWrapper(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningAnalyticsWrapper()
{
  return &type metadata for ScanningAnalyticsWrapper;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ScanningSystemState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[81])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanningSystemState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningSystemState()
{
  return &type metadata for ScanningSystemState;
}

uint64_t destroy for ScanningSession()
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

uint64_t initializeWithCopy for ScanningSession(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  v9 = *(_OWORD *)(a2 + 112);
  v10 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = v10;
  *(_OWORD *)(a1 + 96) = v8;
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
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

uint64_t assignWithCopy for ScanningSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v4 = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = v4;
  v5 = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v5;
  v6 = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v6;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for ScanningSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v5 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v5;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScanningSession(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 168))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScanningSession(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
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
      *(_BYTE *)(result + 168) = 1;
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
    *(_BYTE *)(result + 168) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScanningSession()
{
  return &type metadata for ScanningSession;
}

uint64_t destroy for ClinicalProductResultGroup()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25HealthMedicationsVisionUI26ClinicalProductResultGroupVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClinicalProductResultGroup(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
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

uint64_t assignWithTake for ClinicalProductResultGroup(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClinicalProductResultGroup(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ClinicalProductResultGroup(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ClinicalProductResultGroup()
{
  return &type metadata for ClinicalProductResultGroup;
}

uint64_t __swift_memcpy12_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpecificProductResult(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SpecificProductResult(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SpecificProductResult()
{
  return &type metadata for SpecificProductResult;
}

uint64_t destroy for ExpandedMedicationCluster()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ExpandedMedicationCluster(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ExpandedMedicationCluster(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ExpandedMedicationCluster(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpandedMedicationCluster(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExpandedMedicationCluster(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpandedMedicationCluster()
{
  return &type metadata for ExpandedMedicationCluster;
}

uint64_t sub_21C2B4024()
{
  return type metadata accessor for ScanningSessionLogger();
}

uint64_t type metadata accessor for ScanningSessionLogger()
{
  uint64_t result;

  result = qword_255255EE8;
  if (!qword_255255EE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C2B4068()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C2C1994();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ScanningSessionLogger()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScanningSessionLogger.latestSession.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ScanningSessionLogger.startScanningSession()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerTranscripts(forSession:allTranscripts:usedTranscripts:seenMRCs:mrcResult:resolverResult:systemState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerFilteredResults(forSession:filteredResult:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerExpandedResults(forSession:expandedResults:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of ScanningSessionLogger.registerTimeChange(forSession:filterTime:stateChangeTime:onScreenTime:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v7 + 304))(a1, a2, a3 & 1, a4, a5 & 1, a6, a7 & 1);
}

uint64_t dispatch thunk of ScanningSessionLogger.getScanningAnalyticsInfo(forSession:medication:medicationIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of ScanningSessionLogger.writeSessionToFile(session:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExpandedMedicationCluster.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ExpandedMedicationCluster.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2B427C + 4 * byte_21C2C3EF1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21C2B42B0 + 4 * byte_21C2C3EEC[v4]))();
}

uint64_t sub_21C2B42B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B42B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2B42C0);
  return result;
}

uint64_t sub_21C2B42CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2B42D4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21C2B42D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B42E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ExpandedMedicationCluster.CodingKeys()
{
  return &type metadata for ExpandedMedicationCluster.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SpecificProductResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpecificProductResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2B43D8 + 4 * byte_21C2C3EFB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C2B440C + 4 * byte_21C2C3EF6[v4]))();
}

uint64_t sub_21C2B440C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B4414(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2B441CLL);
  return result;
}

uint64_t sub_21C2B4428(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2B4430);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C2B4434(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B443C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B4448(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21C2B4450(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpecificProductResult.CodingKeys()
{
  return &type metadata for SpecificProductResult.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ClinicalProductResultGroup.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ClinicalProductResultGroup.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2B4548 + 4 * byte_21C2C3F05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C2B457C + 4 * byte_21C2C3F00[v4]))();
}

uint64_t sub_21C2B457C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B4584(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2B458CLL);
  return result;
}

uint64_t sub_21C2B4598(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2B45A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C2B45A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B45AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClinicalProductResultGroup.CodingKeys()
{
  return &type metadata for ClinicalProductResultGroup.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ScanningSession.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScanningSession.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2B46A4 + 4 * byte_21C2C3F0F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_21C2B46D8 + 4 * byte_21C2C3F0A[v4]))();
}

uint64_t sub_21C2B46D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B46E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2B46E8);
  return result;
}

uint64_t sub_21C2B46F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2B46FCLL);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_21C2B4700(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B4708(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21C2B4714(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScanningSession.CodingKeys()
{
  return &type metadata for ScanningSession.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ScanningSystemState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScanningSystemState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C2B4808 + 4 * byte_21C2C3F19[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_21C2B483C + 4 * byte_21C2C3F14[v4]))();
}

uint64_t sub_21C2B483C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B4844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C2B484CLL);
  return result;
}

uint64_t sub_21C2B4858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C2B4860);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_21C2B4864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C2B486C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ScanningSystemState.CodingKeys()
{
  return &type metadata for ScanningSystemState.CodingKeys;
}

unint64_t sub_21C2B488C()
{
  unint64_t result;

  result = qword_255256070;
  if (!qword_255256070)
  {
    result = MEMORY[0x22077944C](&unk_21C2C429C, &type metadata for ScanningSystemState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256070);
  }
  return result;
}

unint64_t sub_21C2B48D4()
{
  unint64_t result;

  result = qword_255256078;
  if (!qword_255256078)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4354, &type metadata for ScanningSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256078);
  }
  return result;
}

unint64_t sub_21C2B491C()
{
  unint64_t result;

  result = qword_255256080;
  if (!qword_255256080)
  {
    result = MEMORY[0x22077944C](&unk_21C2C440C, &type metadata for ClinicalProductResultGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256080);
  }
  return result;
}

unint64_t sub_21C2B4964()
{
  unint64_t result;

  result = qword_255256088;
  if (!qword_255256088)
  {
    result = MEMORY[0x22077944C](&unk_21C2C44C4, &type metadata for SpecificProductResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256088);
  }
  return result;
}

unint64_t sub_21C2B49AC()
{
  unint64_t result;

  result = qword_255256090;
  if (!qword_255256090)
  {
    result = MEMORY[0x22077944C](&unk_21C2C457C, &type metadata for ExpandedMedicationCluster.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256090);
  }
  return result;
}

unint64_t sub_21C2B49F4()
{
  unint64_t result;

  result = qword_255256098;
  if (!qword_255256098)
  {
    result = MEMORY[0x22077944C](&unk_21C2C44EC, &type metadata for ExpandedMedicationCluster.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255256098);
  }
  return result;
}

unint64_t sub_21C2B4A3C()
{
  unint64_t result;

  result = qword_2552560A0;
  if (!qword_2552560A0)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4514, &type metadata for ExpandedMedicationCluster.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560A0);
  }
  return result;
}

unint64_t sub_21C2B4A84()
{
  unint64_t result;

  result = qword_2552560A8;
  if (!qword_2552560A8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4434, &type metadata for SpecificProductResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560A8);
  }
  return result;
}

unint64_t sub_21C2B4ACC()
{
  unint64_t result;

  result = qword_2552560B0;
  if (!qword_2552560B0)
  {
    result = MEMORY[0x22077944C](&unk_21C2C445C, &type metadata for SpecificProductResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560B0);
  }
  return result;
}

unint64_t sub_21C2B4B14()
{
  unint64_t result;

  result = qword_2552560B8;
  if (!qword_2552560B8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C437C, &type metadata for ClinicalProductResultGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560B8);
  }
  return result;
}

unint64_t sub_21C2B4B5C()
{
  unint64_t result;

  result = qword_2552560C0;
  if (!qword_2552560C0)
  {
    result = MEMORY[0x22077944C](&unk_21C2C43A4, &type metadata for ClinicalProductResultGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560C0);
  }
  return result;
}

unint64_t sub_21C2B4BA4()
{
  unint64_t result;

  result = qword_2552560C8;
  if (!qword_2552560C8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C42C4, &type metadata for ScanningSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560C8);
  }
  return result;
}

unint64_t sub_21C2B4BEC()
{
  unint64_t result;

  result = qword_2552560D0;
  if (!qword_2552560D0)
  {
    result = MEMORY[0x22077944C](&unk_21C2C42EC, &type metadata for ScanningSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560D0);
  }
  return result;
}

unint64_t sub_21C2B4C34()
{
  unint64_t result;

  result = qword_2552560D8;
  if (!qword_2552560D8)
  {
    result = MEMORY[0x22077944C](&unk_21C2C420C, &type metadata for ScanningSystemState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560D8);
  }
  return result;
}

unint64_t sub_21C2B4C7C()
{
  unint64_t result;

  result = qword_2552560E0;
  if (!qword_2552560E0)
  {
    result = MEMORY[0x22077944C](&unk_21C2C4234, &type metadata for ScanningSystemState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2552560E0);
  }
  return result;
}

void sub_21C2B4CC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21C2B1E38(a2, a3);
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
    sub_21C2B519C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_21C2B2D48(v15, a4 & 1);
  v20 = sub_21C2B1E38(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_21C2C2828();
  __break(1u);
}

uint64_t sub_21C2B4E1C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_21C2C1A00();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v11 = a4[7] + 168 * a1;
  v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 16) = v12;
  v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v11 + 64) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v11 + 80) = v13;
  v14 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v11 + 48) = v14;
  *(_QWORD *)(v11 + 160) = *(_QWORD *)(a3 + 160);
  v15 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v11 + 128) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v11 + 144) = v15;
  v16 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v11 + 96) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v11 + 112) = v16;
  v17 = a4[2];
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    a4[2] = v19;
  return result;
}

void *sub_21C2B4EE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v1 = v0;
  v2 = sub_21C2C1A00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2B6C90();
  v6 = *v0;
  v7 = sub_21C2C26E4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v42 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v43 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v39 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v39 >= v16)
      goto LABEL_26;
    v40 = *(_QWORD *)(v43 + 8 * v39);
    ++v12;
    if (!v40)
    {
      v12 = v39 + 1;
      if (v39 + 1 >= v16)
        goto LABEL_26;
      v40 = *(_QWORD *)(v43 + 8 * v12);
      if (!v40)
        break;
    }
LABEL_25:
    v15 = (v40 - 1) & v40;
    v18 = __clz(__rbit64(v40)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 168 * v18;
    v21 = *(_QWORD *)(v6 + 56) + v20;
    v22 = *(_OWORD *)(v21 + 48);
    v23 = *(_OWORD *)(v21 + 64);
    v24 = *(_OWORD *)(v21 + 96);
    v49 = *(_OWORD *)(v21 + 80);
    v50 = v24;
    v47 = v22;
    v48 = v23;
    v25 = *(_OWORD *)(v21 + 112);
    v26 = *(_OWORD *)(v21 + 128);
    v27 = *(_OWORD *)(v21 + 144);
    v54 = *(_QWORD *)(v21 + 160);
    v52 = v26;
    v53 = v27;
    v51 = v25;
    v29 = *(_OWORD *)(v21 + 16);
    v28 = *(_OWORD *)(v21 + 32);
    v44 = *(_OWORD *)v21;
    v45 = v29;
    v46 = v28;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    v30 = *(_QWORD *)(v8 + 56) + v20;
    v31 = v51;
    v32 = v52;
    v33 = v53;
    *(_QWORD *)(v30 + 160) = v54;
    *(_OWORD *)(v30 + 128) = v32;
    *(_OWORD *)(v30 + 144) = v33;
    *(_OWORD *)(v30 + 112) = v31;
    v34 = v47;
    v35 = v48;
    v36 = v50;
    *(_OWORD *)(v30 + 80) = v49;
    *(_OWORD *)(v30 + 96) = v36;
    *(_OWORD *)(v30 + 48) = v34;
    *(_OWORD *)(v30 + 64) = v35;
    v38 = v45;
    v37 = v46;
    *(_OWORD *)v30 = v44;
    *(_OWORD *)(v30 + 16) = v38;
    *(_OWORD *)(v30 + 32) = v37;
    result = (void *)sub_21C2B1098((uint64_t)&v44);
  }
  v41 = v39 + 2;
  if (v41 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v42;
    goto LABEL_28;
  }
  v40 = *(_QWORD *)(v43 + 8 * v41);
  if (v40)
  {
    v12 = v41;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v41 + 1;
    if (__OFADD__(v41, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v40 = *(_QWORD *)(v43 + 8 * v12);
    ++v41;
    if (v40)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_21C2B519C()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_21C2B6AA0();
  v2 = *v0;
  v3 = sub_21C2C26E4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

void (*sub_21C2B5348(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21C2B53C8(v6, a2, a3);
  return sub_21C2B539C;
}

void sub_21C2B539C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21C2B53C8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x220778DC8](a2, a3);
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
    return sub_21C2B5434;
  }
  __break(1u);
  return result;
}

void sub_21C2B5434(id *a1)
{

}

uint64_t sub_21C2B543C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_21C2C26CC();
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
    v10 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_21C2B6B14();
        sub_21C293BF0(&qword_2552560F8, (uint64_t (*)(uint64_t))sub_21C2B6B14, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          v12 = sub_21C2B5348(v16, i, a3);
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
    sub_21C2943A8(0, &qword_255255AD8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B5658(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  _QWORD *v20;
  uint64_t v21;

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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
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

_QWORD *sub_21C2B5854(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
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

uint64_t sub_21C2B5A4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

char *sub_21C2B5B40(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B5C28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B5D18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B5E0C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7574615361746164 && a2 == 0xED00006465746172;
  if (v3 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021C2C8470 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x456E6F6973736573 && a2 == 0xEE00656D6954646ELL || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C2C8490 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021C2C84B0 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C2C84D0 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6168436574617473 && a2 == 0xEF656D695465676ELL || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C2C84F0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_21C2C2804();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_21C2B6150(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x736E6172546C6C61 && a2 == 0xEE00737470697263;
  if (v3 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E61725464657375 && a2 == 0xEF73747069726373 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7343524D6E656573 && a2 == 0xE800000000000000 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C75736552736270 && a2 == 0xEA00000000007374 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C7573655263726DLL && a2 == 0xE900000000000074 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74536D6574737973 && a2 == 0xEB00000000657461 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x64657265746C6966 && a2 == 0xEF73746C75736552 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6465646E61707865 && a2 == 0xEF73746C75736552)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_21C2C2804();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_21C2B65A0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000021C2C8510 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021C2C8530 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021C2C8550)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_21C2C2804();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_21C2B66E0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000021C2C8570 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021C2C8590)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_21C2C2804();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21C2B67C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_21C2B7050(0, &qword_255255E18, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0460]);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B68E4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6369666963657073 && a2 == -1192218645498990000;
  if (v3 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021C2C85B0 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000021C2C85D0 || (sub_21C2C2804() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021C2C85F0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_21C2C2804();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_21C2B6A98()
{
  return swift_release();
}

void sub_21C2B6AA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552560E8)
  {
    sub_21C2943A8(255, &qword_255255A90);
    v0 = sub_21C2C2708();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552560E8);
  }
}

void sub_21C2B6B14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255AE0)
  {
    sub_21C2943A8(255, &qword_255255AD8);
    v0 = sub_21C2C22B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255AE0);
  }
}

uint64_t sub_21C2B6B78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

void sub_21C2B6C90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256110)
  {
    sub_21C2C1A00();
    sub_21C293BF0(&qword_255256108, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v0 = sub_21C2C2708();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256110);
  }
}

uint64_t sub_21C2B6D10(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_21C2B6FEC(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_21C2B6D60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    a3(255);
    sub_21C293BF0(a4, a3, a5);
    v9 = sub_21C2C2708();
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_21C2B6DEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

void sub_21C2B6EDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256130)
  {
    sub_21C2B70FC(255, &qword_255256138);
    v0 = sub_21C2C27F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256130);
  }
}

void sub_21C2B6F40(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_21C2B7050(255, &qword_255255E18, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0460]);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_21C2B6FB0(uint64_t a1, uint64_t a2)
{
  assignWithTake for ScanningSession(a2, a1);
  return a2;
}

uint64_t sub_21C2B6FE4(void *a1)
{
  return sub_21C2AC3E4(a1);
}

void sub_21C2B6FEC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
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

void sub_21C2B7050(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, _QWORD, uint64_t, _QWORD))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, MEMORY[0x24BEE0D00], a3, MEMORY[0x24BEE0D10]);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_21C2B70A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C2B70FC(0, &qword_255256180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21C2B70FC(uint64_t a1, unint64_t *a2)
{
  unint64_t TupleTypeMetadata2;
  uint64_t v4;

  if (!*a2)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

uint64_t type metadata accessor for ScanResultSelectionDataSource()
{
  uint64_t result;

  result = qword_2552561A8;
  if (!qword_2552561A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C2B71A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C2C1A00();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_21C2B724C(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = v4;
  v25 = a1;
  v26 = a2;
  v8 = sub_21C2C1B5C();
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  result = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v13 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v14 = MEMORY[0x24BEE4AF8];
  if (v12 == -1)
    return v14;
  v28 = MEMORY[0x24BEE4AF8];
  result = sub_21C2B8A58(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = 0;
    v14 = v28;
    v16 = a3 - 1;
    while (a4 != v16)
    {
      if (v15)
        goto LABEL_24;
      v27 = a3;
      v25(&v27);
      if (v5)
      {
        swift_release();
        return v14;
      }
      v5 = 0;
      v17 = v11;
      v28 = v14;
      v19 = *(_QWORD *)(v14 + 16);
      v18 = *(_QWORD *)(v14 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_21C2B8A58(v18 > 1, v19 + 1, 1);
        v14 = v28;
      }
      *(_QWORD *)(v14 + 16) = v19 + 1;
      v20 = v14
          + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))
          + *(_QWORD *)(v23 + 72) * v19;
      v11 = v17;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v23 + 32))(v20, v17, v24);
      v15 = a3 == a4;
      if (a3 == a4)
      {
        a3 = 0;
      }
      else if (__OFADD__(a3++, 1))
      {
        goto LABEL_20;
      }
      if (a4 == ++v16)
        return v14;
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_21C2B7404(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  unint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_21C2C1B5C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_21C2B8A74(0, v6, 0);
    v7 = v19;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v10(v5, v8, v2);
      v19 = v7;
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      if (v12 >= v11 >> 1)
        sub_21C2B8A74(v11 > 1, v12 + 1, 1);
      v17 = v2;
      v18 = sub_21C293BF0(&qword_2552562C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE438C0], MEMORY[0x24BE438A8]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
      v10((char *)boxed_opaque_existential_1, (uint64_t)v5, v2);
      v14 = v19;
      *(_QWORD *)(v19 + 16) = v12 + 1;
      sub_21C2B8B08(&v16, v14 + 40 * v12 + 32);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v7 = v19;
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_21C2B7580(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v6 = MEMORY[0x24BEE4AF8];
    sub_21C2C2690();
    v4 = a1 + 32;
    do
    {
      sub_21C2A77A4(v4, (uint64_t)&v5);
      type metadata accessor for CGPath(0);
      swift_dynamicCast();
      sub_21C2C2678();
      sub_21C2C269C();
      sub_21C2C26A8();
      sub_21C2C2684();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_21C2B7658(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  ValueMetadata *v18;
  unint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_21C2B8A74(0, v1, 0);
    v2 = v20;
    v4 = (_QWORD *)(a1 + 80);
    do
    {
      v5 = *(v4 - 5);
      v7 = *(v4 - 4);
      v6 = *(v4 - 3);
      v8 = (void *)*(v4 - 2);
      v9 = *((_DWORD *)v4 - 2);
      v15 = *v4;
      v16 = *(v4 - 6);
      v20 = v2;
      v10 = *(_QWORD *)(v2 + 16);
      v11 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = v8;
      if (v10 >= v11 >> 1)
      {
        sub_21C2B8A74(v11 > 1, v10 + 1, 1);
        v2 = v20;
      }
      v4 += 7;
      v18 = &type metadata for ScanResultGroupItem;
      v19 = sub_21C2B8A90();
      v13 = swift_allocObject();
      *(_QWORD *)&v17 = v13;
      *(_QWORD *)(v13 + 16) = v16;
      *(_QWORD *)(v13 + 24) = v5;
      *(_QWORD *)(v13 + 32) = v7;
      *(_QWORD *)(v13 + 40) = v6;
      *(_QWORD *)(v13 + 48) = v12;
      *(_DWORD *)(v13 + 56) = v9;
      *(_QWORD *)(v13 + 64) = v15;
      *(_QWORD *)(v2 + 16) = v10 + 1;
      sub_21C2B8B08(&v17, v2 + 40 * v10 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C2B77AC(uint64_t *a1, uint64_t a2)
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
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18[5];

  v4 = sub_21C2C1C4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C29CBC0(0, &qword_255255860, (uint64_t (*)(uint64_t))MEMORY[0x24BEBC408], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - v9;
  v11 = *a1;
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  sub_21C2C2630();
  swift_bridgeObjectRelease();
  strcpy((char *)v18, "FakeSearchItem");
  HIBYTE(v18[1]) = -18;
  *(_QWORD *)&v16[0] = v11;
  sub_21C2C27EC();
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  v12 = sub_21C2C1E5C();
  v18[3] = v12;
  v18[4] = MEMORY[0x24BEBC5F0];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(boxed_opaque_existential_1, a2, v12);
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  sub_21C2C1DF0();
  v14 = sub_21C2C1DFC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 0, 1, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE44C60], v4);
  return sub_21C2C1B50();
}

uint64_t sub_21C2B79BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
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
  id v29;

  sub_21C29CBC0(0, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - v2;
  sub_21C2B8624();
  v5 = v4;
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2B8854();
  v9 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  v26 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2B891C();
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  v28 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v0;
  v29 = *(id *)(v0 + qword_255256188);
  swift_allocObject();
  swift_weakInit();
  sub_21C2B86B8();
  sub_21C2B879C();
  sub_21C293BF0(&qword_255256230, (uint64_t (*)(uint64_t))sub_21C2B86B8, MEMORY[0x24BDB9D10]);
  swift_retain();
  sub_21C2C1FAC();
  swift_release();
  swift_release();
  v16 = sub_21C293BF0(&qword_255256248, (uint64_t (*)(uint64_t))sub_21C2B8624, MEMORY[0x24BDB94C8]);
  v17 = sub_21C293BF0(&qword_255256240, (uint64_t (*)(uint64_t))sub_21C2B879C, MEMORY[0x24BDB9AF8]);
  MEMORY[0x220778768](v5, v16, v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v5);
  sub_21C2943A8(0, &qword_255255700);
  v29 = (id)sub_21C2C239C();
  v18 = sub_21C2C2390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v3, 1, 1, v18);
  sub_21C293BF0(&qword_255256258, (uint64_t (*)(uint64_t))sub_21C2B8854, MEMORY[0x24BDB9610]);
  sub_21C29C7FC();
  v19 = v25;
  sub_21C2C1FD0();
  sub_21C2B89FC((uint64_t)v3);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v19);
  swift_allocObject();
  swift_weakInit();
  sub_21C293BF0(&qword_255256260, (uint64_t (*)(uint64_t))sub_21C2B891C, MEMORY[0x24BDB9A08]);
  v20 = v27;
  sub_21C2C2000();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v20);
  swift_beginAccess();
  sub_21C2C1EE0();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_21C2B7D80@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  sub_21C2B8F20();
  v5 = v4;
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2B8FE4();
  v9 = v8;
  v32 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2B9078();
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    goto LABEL_5;
  if (!v17)
  {
    result = swift_release();
LABEL_5:
    v26 = 0;
    goto LABEL_6;
  }
  v29 = v14;
  v19 = *(_QWORD *)(result + qword_2552568B0);
  v20 = swift_allocObject();
  v30 = a2;
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v19;
  sub_21C2A0A4C();
  v27[1] = v21;
  sub_21C293BF0(&qword_255256280, (uint64_t (*)(uint64_t))sub_21C2A0A4C, MEMORY[0x24BDB9E58]);
  v28 = v13;
  v22 = v17;
  swift_retain_n();
  v23 = v22;
  sub_21C2C1F58();
  sub_21C2B8800();
  sub_21C293BF0(&qword_255256290, (uint64_t (*)(uint64_t))sub_21C2B8F20, MEMORY[0x24BDB9E90]);
  swift_retain();
  sub_21C2C1FC4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v5);
  sub_21C293BF0(&qword_2552562B0, (uint64_t (*)(uint64_t))sub_21C2B8FE4, MEMORY[0x24BDB96C0]);
  v24 = sub_21C2C1FA0();

  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
  swift_release();

  v34 = v24;
  v33 = MEMORY[0x24BEE4AF8];
  sub_21C2B90F0();
  sub_21C293BF0(&qword_2552562A8, (uint64_t (*)(uint64_t))sub_21C2B90F0, MEMORY[0x24BDB9AF8]);
  sub_21C2C1FB8();
  a2 = v30;
  swift_release();
  sub_21C293BF0(&qword_2552562B8, (uint64_t (*)(uint64_t))sub_21C2B9078, MEMORY[0x24BDB95A8]);
  v25 = v28;
  v26 = sub_21C2C1FA0();

  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v25);
LABEL_6:
  *a2 = v26;
  return result;
}

uint64_t sub_21C2B80D4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v2 = sub_21C2C1A00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = result;
    if (qword_2552553A0 != -1)
      swift_once();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8 + qword_255256198, v2);
    v14 = MEMORY[0x24BEE4AF8];
    v9 = *(_QWORD *)(v6 + 16);
    if (v9)
    {
      v13 = v2;
      swift_retain();
      swift_bridgeObjectRetain();
      v10 = 64;
      do
      {
        v11 = *(id *)(v6 + v10);
        MEMORY[0x2207789CC]();
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_21C2C2294();
        sub_21C2C22AC();
        sub_21C2C2288();
        v10 += 56;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      v2 = v13;
      v12 = v14;
    }
    else
    {
      swift_retain();
      v12 = MEMORY[0x24BEE4AF8];
    }
    sub_21C2AD41C((uint64_t)v5, v12);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_21C2B7658(v6);
    sub_21C2C1B2C();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_21C2B82F0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_21C2B831C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();

  v1 = v0 + qword_255256198;
  v2 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C2B8398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_21C2C1B38();
  swift_release();

  v1 = v0 + qword_255256198;
  v2 = sub_21C2C1A00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21C2B8430()
{
  return type metadata accessor for ScanResultSelectionDataSource();
}

void *sub_21C2B8438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  void *v8;
  uint64_t v10;

  v0 = sub_21C2C1AC0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_21C2C1AB4();
  sub_21C2C1AA8();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v6, v0);
  v8 = (void *)sub_21C2C1A9C();
  v7(v4, v0);
  sub_21C2C2408();
  objc_msgSend(v8, sel_setContentInsets_);
  objc_msgSend(v8, sel_setContentInsetsReference_, 1);
  return v8;
}

uint64_t sub_21C2B8524()
{
  MEMORY[0x22077944C](&unk_21C2C4890);
  return sub_21C2C1CF4();
}

uint64_t sub_21C2B8574()
{
  sub_21C2C1C34();
  sub_21C2C2378();
  sub_21C2C1C7C();
  sub_21C2C236C();
  type metadata accessor for ScanResultGroupCell();
  sub_21C293BF0(&qword_255255AB8, (uint64_t (*)(uint64_t))type metadata accessor for ScanResultGroupCell, (uint64_t)&unk_21C2C3B9C);
  return sub_21C2C236C();
}

uint64_t sub_21C2B85F8()
{
  return sub_21C293BF0(&qword_2552561F8, (uint64_t (*)(uint64_t))type metadata accessor for ScanResultSelectionDataSource, (uint64_t)&unk_21C2C4860);
}

void sub_21C2B8624()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256200)
  {
    sub_21C2B86B8();
    sub_21C2B879C();
    sub_21C293BF0(&qword_255256230, (uint64_t (*)(uint64_t))sub_21C2B86B8, MEMORY[0x24BDB9D10]);
    v0 = sub_21C2C1E80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256200);
  }
}

void sub_21C2B86B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256208)
  {
    sub_21C2B873C(255, &qword_255256210, &qword_255256218, 0x24BE467F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v0 = sub_21C2C1F28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256208);
  }
}

void sub_21C2B873C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_21C2943A8(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_21C2B879C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256220)
  {
    sub_21C2B8800();
    v0 = sub_21C2C1ED4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256220);
  }
}

void sub_21C2B8800()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256228)
  {
    v0 = sub_21C2C22B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256228);
  }
}

void sub_21C2B8854()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256238)
  {
    sub_21C2B879C();
    sub_21C2B8624();
    sub_21C293BF0(&qword_255256240, (uint64_t (*)(uint64_t))sub_21C2B879C, MEMORY[0x24BDB9AF8]);
    sub_21C293BF0(&qword_255256248, (uint64_t (*)(uint64_t))sub_21C2B8624, MEMORY[0x24BDB94C8]);
    v0 = sub_21C2C1E98();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256238);
  }
}

void sub_21C2B891C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256250)
  {
    sub_21C2B8854();
    sub_21C2943A8(255, &qword_255255700);
    sub_21C293BF0(&qword_255256258, (uint64_t (*)(uint64_t))sub_21C2B8854, MEMORY[0x24BDB9610]);
    sub_21C29C7FC();
    v0 = sub_21C2C1EC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256250);
  }
}

uint64_t sub_21C2B89D0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21C2B89F4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_21C2B7D80(a1, a2);
}

uint64_t sub_21C2B89FC(uint64_t a1)
{
  uint64_t v2;

  sub_21C29CBC0(0, &qword_2552556E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE56F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C2B8A50(uint64_t *a1)
{
  return sub_21C2B80D4(a1);
}

uint64_t sub_21C2B8A58(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21C2B8B20(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21C2B8A74(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21C2B8D14(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

unint64_t sub_21C2B8A90()
{
  unint64_t result;

  result = qword_255256268;
  if (!qword_255256268)
  {
    result = MEMORY[0x22077944C](&unk_21C2C3CAC, &type metadata for ScanResultGroupItem);
    atomic_store(result, (unint64_t *)&qword_255256268);
  }
  return result;
}

uint64_t sub_21C2B8AD4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21C2B8B08(__int128 *a1, uint64_t a2)
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

uint64_t sub_21C2B8B20(char a1, int64_t a2, char a3, _QWORD *a4)
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
  sub_21C29CBC0(0, &qword_2552562D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE438C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(sub_21C2C1B5C() - 8);
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
  v16 = *(_QWORD *)(sub_21C2C1B5C() - 8);
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
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2B8D14(char a1, int64_t a2, char a3, _QWORD *a4)
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
    sub_21C2B8EBC();
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_21C2B8F98(0, &qword_255255858);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

void sub_21C2B8EBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256270)
  {
    sub_21C2B8F98(255, &qword_255255858);
    v0 = sub_21C2C27F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256270);
  }
}

void sub_21C2B8F20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256278)
  {
    sub_21C2A0A4C();
    sub_21C293BF0(&qword_255256280, (uint64_t (*)(uint64_t))sub_21C2A0A4C, MEMORY[0x24BDB9E58]);
    v0 = sub_21C2C1F64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256278);
  }
}

uint64_t sub_21C2B8F98(uint64_t a1, unint64_t *a2)
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

void sub_21C2B8FE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256288)
  {
    sub_21C2B8F20();
    sub_21C2B8800();
    sub_21C293BF0(&qword_255256290, (uint64_t (*)(uint64_t))sub_21C2B8F20, MEMORY[0x24BDB9E90]);
    v0 = sub_21C2C1EB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256288);
  }
}

void sub_21C2B9078()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256298)
  {
    sub_21C2B90F0();
    sub_21C293BF0(&qword_2552562A8, (uint64_t (*)(uint64_t))sub_21C2B90F0, MEMORY[0x24BDB9AF8]);
    v0 = sub_21C2C1E8C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256298);
  }
}

void sub_21C2B90F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2552562A0)
  {
    sub_21C2B8800();
    sub_21C2B8F98(255, (unint64_t *)&qword_255255768);
    v0 = sub_21C2C1ED4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2552562A0);
  }
}

uint64_t sub_21C2B916C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C2B9198@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21C29F82C(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_21C2B91A0@<X0>(_QWORD *a1@<X8>)
{
  return sub_21C2A0224(a1);
}

uint64_t sub_21C2B91A8(void *a1, char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23[16];
  char *v24;
  _QWORD v25[2];

  v22 = a2;
  v5 = sub_21C2C1A00();
  v21 = *(_QWORD *)(v5 - 8);
  v6 = v21;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_21C2C1E5C();
  v9 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = qword_255256188;
  v25[0] = 0;
  sub_21C2B86B8();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v2 + v12) = sub_21C2C1F34();
  *(_QWORD *)(v2 + qword_2552561A0) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v2 + qword_255256190) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v2 + qword_255256198, a2, v5);
  type metadata accessor for ScanResultDataProvider();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v2 + qword_2552568B0) = v13;
  v14 = a1;
  swift_release();
  sub_21C29CBC0(0, &qword_2552562C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE43368], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_21C2C1B14();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_21C2C3880;
  sub_21C2C1E50();
  v24 = v11;
  v15 = sub_21C2B724C((void (*)(uint64_t *))sub_21C2B94C0, (uint64_t)v23, 1, 10);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  sub_21C2B7404(v15);
  swift_bridgeObjectRelease();
  sub_21C2C1B08();
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  sub_21C2C2630();
  swift_bridgeObjectRelease();
  strcpy((char *)v25, "MutableArray<");
  HIWORD(v25[1]) = -4864;
  sub_21C2C19F4();
  sub_21C2C19E8();
  v16 = *(void (**)(char *, uint64_t))(v21 + 8);
  v16(v8, v5);
  sub_21C2C2240();
  swift_bridgeObjectRelease();
  sub_21C2C2240();
  v17 = sub_21C2C1B20();
  swift_retain();
  sub_21C2B79BC();
  swift_release();
  v16(v22, v5);
  return v17;
}

uint64_t sub_21C2B94C0(uint64_t *a1)
{
  uint64_t v1;

  return sub_21C2B77AC(a1, *(_QWORD *)(v1 + 16));
}

void sub_21C2B94E8()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)sub_21C2C1964();
    sub_21C2A832C(MEMORY[0x24BEE4AF8]);
    v3 = (id)sub_21C2C2174();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_openSensitiveURL_withOptions_, v2, v3);

  }
}

uint64_t VisionTapToRadar.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t VisionTapToRadar.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[6];

  swift_bridgeObjectRetain();
  v8 = (void *)sub_21C2C21A4();
  v9 = (void *)sub_21C2C21A4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1);

  v11 = (void *)sub_21C2C21A4();
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v11, 1, 0);

  objc_msgSend(v10, sel_addAction_, v13);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a4;
  *(_QWORD *)(v14 + 24) = a5;
  swift_retain();
  v15 = (void *)sub_21C2C21A4();
  v18[4] = sub_21C2B9DA4;
  v18[5] = v14;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_21C2AC4D8;
  v18[3] = &block_descriptor_3;
  v16 = _Block_copy(v18);
  swift_release();
  v17 = objc_msgSend(v12, sel_actionWithTitle_style_handler_, v15, 0, v16);
  _Block_release(v16);

  objc_msgSend(v10, sel_addAction_, v17);
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v10, 1, 0);

}

uint64_t _s25HealthMedicationsVisionUI0C10TapToRadarC8scanning0H7Session14viewControlleryAA08ScanningI0V_So06UIViewK0CtFZ_0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  void *v23;
  _OWORD v24[10];
  uint64_t v25;

  v23 = a2;
  v3 = sub_21C2C1994();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v24 - v8 + 32;
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  v10 = *(_OWORD *)(a1 + 144);
  v24[8] = *(_OWORD *)(a1 + 128);
  v24[9] = v10;
  v25 = *(_QWORD *)(a1 + 160);
  v11 = *(_OWORD *)(a1 + 80);
  v24[4] = *(_OWORD *)(a1 + 64);
  v24[5] = v11;
  v12 = *(_OWORD *)(a1 + 112);
  v24[6] = *(_OWORD *)(a1 + 96);
  v24[7] = v12;
  v13 = *(_OWORD *)(a1 + 16);
  v24[0] = *(_OWORD *)a1;
  v24[1] = v13;
  v14 = *(_OWORD *)(a1 + 48);
  v24[2] = *(_OWORD *)(a1 + 32);
  v24[3] = v14;
  swift_retain();
  sub_21C2AE258((uint64_t)v24);
  swift_release();
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_21C2C21A4();
  v17 = (void *)sub_21C2C21A4();
  v18 = (void *)sub_21C2C2264();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v15, sel_hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions_, 0, 1330752, v16, v17, 7, 0, 0, 2, v18, 0, 1);

  sub_21C2C197C();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v20 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v21 + v20, v7, v3);
  _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(0xD00000000000009ALL, 0x800000021C2C8BA0, v23, (uint64_t)sub_21C2B9DE0, v21);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t _s25HealthMedicationsVisionUI0C10TapToRadarC19medicationsTracking14viewControllerySo06UIViewK0C_tFZ_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = sub_21C2C1994();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - v7;
  v9 = (void *)objc_opt_self();
  v10 = (void *)sub_21C2C21A4();
  v11 = (void *)sub_21C2C21A4();
  v12 = objc_msgSend(v9, sel_hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions_, 0, 1397974, v10, v11, 7, 0, 0, 3, 0, 0, 1);

  sub_21C2C197C();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14 + v13, v6, v2);
  _s25HealthMedicationsVisionUI0C10TapToRadarC15promptBeforeTTR7message14viewController6actionySS_So06UIViewM0CyyctFZ_0(0x10000000000000D2, 0x800000021C2C8980, a1, (uint64_t)sub_21C2B9DE0, v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t type metadata accessor for VisionTapToRadar()
{
  return objc_opt_self();
}

uint64_t method lookup function for VisionTapToRadar()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_21C2B9D80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C2B9DA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_21C2B9DE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255C90)
  {
    v0 = sub_21C2C27F8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255255C90);
  }
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21C2C1994();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_21C2B9EA0()
{
  sub_21C2C1994();
  sub_21C2B94E8();
}

uint64_t sub_21C2B9ED0(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    sub_21C29CD90();
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C2B9F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21C2C22F4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21C2C22E8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21C2C1564(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21C2C22C4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21C2BA09C(uint64_t a1, uint64_t a2)
{
  return sub_21C2C0FB0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(void **)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_21C2BA0B8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C2C1F88();
  swift_release();
  swift_release();
  return v1;
}

_QWORD *sub_21C2BA12C()
{
  uint64_t v0;
  _QWORD *v1;
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
  void (*v13)(char *, uint64_t);
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v24[3];
  char v25;

  v1 = (_QWORD *)v0;
  sub_21C2944A4(0, &qword_255255718, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9EF0]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v24 - v5;
  v7 = sub_21C2C19DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  sub_21C2C1A78();
  swift_allocObject();
  *(_QWORD *)(v0 + 56) = sub_21C2C1A6C();
  *(_QWORD *)(v0 + 64) = 0;
  sub_21C2C19D0();
  sub_21C2C19AC();
  v12 = v11;
  v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  *(_QWORD *)(v0 + 72) = v12;
  sub_21C2C19D0();
  sub_21C2C19AC();
  v15 = v14;
  v13(v10, v7);
  *(double *)(v0 + 80) = v15 + 10.0;
  *(_QWORD *)(v0 + 88) = 0;
  *(_BYTE *)(v0 + 96) = 1;
  *(_WORD *)(v0 + 112) = 1;
  v16 = MEMORY[0x24BEE4AF8];
  v17 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 120) = v16;
  *(_QWORD *)(v0 + 128) = v17;
  *(_QWORD *)(v0 + 136) = v17;
  *(_QWORD *)(v0 + 144) = v17;
  *(_QWORD *)(v0 + 152) = v17;
  sub_21C2C182C();
  swift_allocObject();
  *(_QWORD *)(v0 + 160) = sub_21C2C1EF8();
  *(_QWORD *)(v0 + 168) = 0;
  *(_QWORD *)(v0 + 176) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 184) = v17;
  *(_QWORD *)(v0 + 192) = 0;
  *(_QWORD *)(v0 + 200) = 0;
  *(_BYTE *)(v0 + 208) = 0;
  *(_QWORD *)(v0 + 216) = v16;
  v18 = v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator__state;
  v24[1] = 0;
  v24[2] = 0;
  v25 = 2;
  sub_21C2C1F70();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v6, v3);
  v19 = OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId;
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  swift_retain();
  sub_21C2AC528((uint64_t)v1 + v19);
  swift_release();
  v1[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE467F0]), sel_init);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  v1[3] = v20;
  v1[6] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE46800]), sel_init);
  type metadata accessor for ScanResultDataProvider();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  v1[4] = v21;
  v22 = v20;
  return v1;
}

id *sub_21C2BA404()
{
  id *v0;
  id v1;
  id v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = v0[8];
  if (v1)
  {
    objc_msgSend(v1, sel_invalidate);
    v2 = v0[8];
  }
  else
  {
    v2 = 0;
  }
  v0[8] = 0;

  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator__state;
  sub_21C2944A4(0, &qword_255255718, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)v0 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId;
  v6 = sub_21C2C1A00();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t sub_21C2BA538()
{
  sub_21C2BA404();
  return swift_deallocClassInstance();
}

uint64_t sub_21C2BA55C()
{
  return type metadata accessor for MedicationDataScanningCoordinator();
}

uint64_t type metadata accessor for MedicationDataScanningCoordinator()
{
  uint64_t result;

  result = qword_2552563A0;
  if (!qword_2552563A0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21C2BA5A0()
{
  unint64_t v0;
  unint64_t v1;

  sub_21C2944A4(319, &qword_255255718, (uint64_t)&type metadata for MedicationDataScanningCoordinatorState, MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_21C2C1A00();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_21C2BA6C0(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v3 = sub_21C2C19DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1A54();
  if ((a1 & 1) != 0)
  {
    sub_21C2C19D0();
    sub_21C2C19AC();
    v8 = v7;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    *(_QWORD *)(v1 + 88) = v8;
    *(_BYTE *)(v1 + 96) = 0;
    objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
    v9 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = 0;

  }
  v10 = *(void **)(v1 + 64);
  if (!v10 || (objc_msgSend(v10, sel_isValid) & 1) == 0)
  {
    v11 = objc_msgSend((id)objc_opt_self(), sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v1, sel_pulseTimerFiredWithTimer_, 0, 1, 0.1);
    v12 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = v11;

  }
  return sub_21C2C1A60();
}

void sub_21C2BA7FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD **v55;
  _QWORD *v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  _QWORD v76[2];
  __int128 v77;
  uint64_t v78;
  int v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  int v86;
  void (*v87)(char *, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  unint64_t v103;
  _QWORD *v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;

  v2 = v1;
  v78 = a1;
  v84 = sub_21C2C2090();
  v83 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v82 = (char *)v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1490();
  MEMORY[0x24BDAC7A8](v4);
  v102 = (char *)v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_21C2C1D78();
  v91 = *(_QWORD *)(v92 - 8);
  v6 = MEMORY[0x24BDAC7A8](v92);
  v81 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v76 - v8;
  v94 = sub_21C2C2078();
  v93 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v95 = (char *)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C2C209C();
  v12 = *(_QWORD *)(v11 - 8);
  v97 = v11;
  v98 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v96 = (char *)v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C2C1F88();
  swift_release();
  swift_release();
  if (!v114)
  {
    v14 = 0;
    goto LABEL_5;
  }
  if (v114 == 1)
  {
    v14 = 1;
LABEL_5:
    sub_21C29CB74((void *)v112, v113, v14);
    return;
  }
  if (!(v112 ^ 1 | v113))
  {
    v90 = *(_QWORD *)(v78 + 16);
    if (v90)
    {
      v104 = (_QWORD *)(v1 + 120);
      v89 = v78 + ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80));
      v88 = *(_QWORD *)(v98 + 72);
      v87 = *(void (**)(char *, uint64_t, uint64_t))(v98 + 16);
      v86 = *MEMORY[0x24BDFA010];
      v79 = *MEMORY[0x24BDFA060];
      swift_bridgeObjectRetain();
      v15 = 0;
      *(_QWORD *)&v16 = 136446210;
      v77 = v16;
      v76[1] = MEMORY[0x24BEE4AD8] + 8;
      v100 = MEMORY[0x24BEE4AE0] + 8;
      v80 = v9;
      v18 = v96;
      v17 = v97;
      v101 = v1 + 136;
      do
      {
        v99 = v15;
        v87(v18, v89 + v15 * v88, v17);
        v19 = v98;
        v20 = (*(uint64_t (**)(char *, uint64_t))(v98 + 88))(v18, v17);
        if (v20 == v86)
        {
          (*(void (**)(char *, uint64_t))(v19 + 96))(v18, v17);
          (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v95, v18, v94);
          v21 = sub_21C2C2060();
          v23 = v22;
          sub_21C2C1D54();
          swift_bridgeObjectRetain_n();
          v24 = sub_21C2C1D6C();
          v25 = sub_21C2C2348();
          if (os_log_type_enabled(v24, v25))
          {
            v26 = swift_slowAlloc();
            v27 = swift_slowAlloc();
            v115 = v27;
            *(_DWORD *)v26 = v77;
            v112 = v21;
            v113 = v23;
            swift_bridgeObjectRetain();
            v28 = sub_21C2C21F8();
            *(_QWORD *)(v26 + 4) = sub_21C2BE2B4(v28, v29, &v115);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_21C28F000, v24, v25, "Received new transcript: %{public}s", (uint8_t *)v26, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2207794E8](v27, -1, -1);
            MEMORY[0x2207794E8](v26, -1, -1);

            (*(void (**)(char *, uint64_t))(v91 + 8))(v80, v92);
          }
          else
          {
            swift_bridgeObjectRelease_n();

            (*(void (**)(char *, uint64_t))(v91 + 8))(v9, v92);
          }
          v37 = *(void **)(v2 + 48);
          v38 = (void *)sub_21C2C21A4();
          swift_bridgeObjectRelease();
          v39 = objc_msgSend(v37, sel_parsedNDCCodeFromString_, v38);

          if (v39)
          {
            v40 = sub_21C2C21C8();
            v42 = v41;

            sub_21C2BB66C(805, v40, v42);
            swift_bridgeObjectRelease();
          }
          v85 = (id)sub_21C2C206C();
          v43 = objc_msgSend(v85, sel_topCandidates_, 5);
          sub_21C2943A8(0, &qword_255256760);
          v44 = sub_21C2C2270();

          if (v44 >> 62)
          {
            swift_bridgeObjectRetain();
            v45 = sub_21C2C26CC();
            swift_bridgeObjectRelease();
            if (v45)
            {
LABEL_23:
              if (v45 < 1)
              {
                __break(1u);
                return;
              }
              v46 = 0;
              v47 = *(_QWORD *)(v2 + 56);
              v106 = v45;
              v107 = v47;
              v105 = v44 & 0xC000000000000001;
              v103 = v44;
              while (2)
              {
                if (v105)
                  v49 = (id)MEMORY[0x220778DC8](v46, v44);
                else
                  v49 = *(id *)(v44 + 8 * v46 + 32);
                v50 = v49;
                v51 = objc_msgSend(v49, sel_string);
                v52 = sub_21C2C21C8();
                v54 = v53;

                sub_21C2C1A54();
                swift_beginAccess();
                swift_bridgeObjectRetain();
                sub_21C2BE91C(&v115, v52, v54);
                swift_endAccess();
                swift_bridgeObjectRelease();
                v55 = (_QWORD **)v104;
                swift_beginAccess();
                v56 = *v55;
                swift_bridgeObjectRetain();
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *v55 = v56;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  v56 = sub_21C2B169C(0, v56[2] + 1, 1, v56);
                  *v104 = v56;
                }
                v59 = v56[2];
                v58 = v56[3];
                if (v59 >= v58 >> 1)
                {
                  v56 = sub_21C2B169C((_QWORD *)(v58 > 1), v59 + 1, 1, v56);
                  *v104 = v56;
                }
                v56[2] = v59 + 1;
                v60 = &v56[2 * v59];
                v60[4] = v52;
                v60[5] = v54;
                swift_endAccess();
                v61 = *(unsigned __int8 *)(v2 + 113);
                sub_21C2C1A60();
                if (v61 == 1)
                {
                  swift_bridgeObjectRelease();

                  v48 = v106;
                }
                else
                {
                  v62 = sub_21C2C22F4();
                  v63 = *(_QWORD *)(v62 - 8);
                  v64 = (uint64_t)v102;
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v102, 1, 1, v62);
                  v65 = swift_allocObject();
                  v66 = v2;
                  swift_weakInit();
                  v67 = (_QWORD *)swift_allocObject();
                  v67[2] = 0;
                  v68 = v67 + 2;
                  v67[3] = 0;
                  v67[4] = v65;
                  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v64, 1, v62) == 1)
                  {
                    sub_21C2C1564(v64);
                    if (*v68)
                      goto LABEL_37;
LABEL_39:
                    v69 = 0;
                    v71 = 0;
                  }
                  else
                  {
                    sub_21C2C22E8();
                    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v62);
                    if (!*v68)
                      goto LABEL_39;
LABEL_37:
                    swift_getObjectType();
                    swift_unknownObjectRetain();
                    v69 = sub_21C2C22C4();
                    v71 = v70;
                    swift_unknownObjectRelease();
                  }
                  v72 = swift_allocObject();
                  *(_QWORD *)(v72 + 16) = &unk_255256770;
                  *(_QWORD *)(v72 + 24) = v67;
                  if (v71 | v69)
                  {
                    v108 = 0;
                    v109 = 0;
                    v110 = v69;
                    v111 = v71;
                  }
                  v2 = v66;
                  v48 = v106;
                  swift_task_create();
                  swift_bridgeObjectRelease();

                  swift_release();
                  v44 = v103;
                }
                if (v48 == ++v46)
                  break;
                continue;
              }
            }
          }
          else
          {
            v45 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v45)
              goto LABEL_23;
          }

          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v93 + 8))(v95, v94);
          v9 = v80;
        }
        else if (v20 == v79)
        {
          v30 = v96;
          (*(void (**)(char *, uint64_t))(v98 + 96))(v96, v97);
          (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v82, v30, v84);
          v31 = (void *)objc_opt_self();
          v32 = (void *)sub_21C2C2084();
          v33 = objc_msgSend(v31, sel_parsedGTIN14CodeFromBarcodeObservation_, v32);

          if (v33)
          {
            v34 = sub_21C2C21C8();
            v36 = v35;

            sub_21C2BB66C(808, v34, v36);
            swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v83 + 8))(v82, v84);
        }
        else
        {
          sub_21C2C1D54();
          v73 = sub_21C2C1D6C();
          v74 = sub_21C2C2354();
          if (os_log_type_enabled(v73, v74))
          {
            v75 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v75 = 0;
            _os_log_impl(&dword_21C28F000, v73, v74, "Encountered unexpected recognized item", v75, 2u);
            MEMORY[0x2207794E8](v75, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v91 + 8))(v81, v92);
          (*(void (**)(char *, uint64_t))(v98 + 8))(v96, v97);
        }
        v15 = v99 + 1;
        v18 = v96;
        v17 = v97;
      }
      while (v99 + 1 != v90);
      swift_bridgeObjectRelease();
    }
  }
}

void sub_21C2BB314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;

  v29 = sub_21C2C1D78();
  v3 = *(_QWORD *)(v29 - 8);
  v4 = MEMORY[0x24BDAC7A8](v29);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  v9 = sub_21C2C2144();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  v30 = v1;
  sub_21C2C1F88();
  swift_release();
  swift_release();
  if (v33)
  {
    if (v33 == 1)
    {
      sub_21C29CB74((void *)v31, v32, 1);
    }
    else if (!(v31 ^ 1 | v32))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
      v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
      if (v13 == *MEMORY[0x24BDFA180] || v13 == *MEMORY[0x24BDFA168])
      {
        sub_21C2C1D54();
        v15 = sub_21C2C1D6C();
        v16 = sub_21C2C2348();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_21C28F000, v15, v16, "Stability Low", v17, 2u);
          MEMORY[0x2207794E8](v17, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v29);
        v18 = v30;
        sub_21C2C1A54();
        objc_msgSend(*(id *)(v18 + 64), sel_invalidate);
        v19 = *(void **)(v18 + 64);
        *(_QWORD *)(v18 + 64) = 0;

        sub_21C2C1A60();
      }
      else
      {
        sub_21C2C1D54();
        v20 = sub_21C2C1D6C();
        v21 = sub_21C2C2348();
        if (os_log_type_enabled(v20, v21))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_21C28F000, v20, v21, "Stability Normal", v23, 2u);
          MEMORY[0x2207794E8](v23, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v29);
        v24 = v30;
        sub_21C2C1A54();
        v25 = *(void **)(v24 + 64);
        if (!v25 || (objc_msgSend(v25, sel_isValid) & 1) == 0)
        {
          v26 = objc_msgSend((id)objc_opt_self(), sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v24, sel_pulseTimerFiredWithTimer_, 0, 1, 0.1);
          v27 = *(void **)(v24 + 64);
          *(_QWORD *)(v24 + 64) = v26;

        }
        sub_21C2C1A60();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      }
    }
  }
  else
  {
    sub_21C29CB74((void *)v31, v32, 0);
  }
}

void sub_21C2BB66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t aBlock;
  unint64_t v26;
  uint64_t (*v27)(uint64_t, void *, uint64_t, void *);
  void *v28;
  uint64_t (*v29)(uint64_t, unint64_t, void *);
  _QWORD *v30;
  uint64_t v31[2];

  v4 = v3;
  v24 = a1;
  v7 = sub_21C2C19DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C1A54();
  swift_beginAccess();
  v11 = *(_QWORD *)(v3 + 144);
  swift_bridgeObjectRetain();
  v12 = sub_21C2BB9BC(a2, a3, v11);
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    sub_21C2C1A60();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_21C2BE91C(v31, a2, a3);
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_21C2C19D0();
    sub_21C2C19AC();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    *(_QWORD *)(v3 + 168) = v14;
    sub_21C2C1A60();
    v15 = swift_allocObject();
    swift_weakInit();
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a2;
    v16[4] = a3;
    v17 = objc_allocWithZone(MEMORY[0x24BE45C60]);
    swift_bridgeObjectRetain();
    swift_retain();
    v18 = (void *)sub_21C2C21A4();
    v29 = sub_21C2C1648;
    v30 = v16;
    aBlock = MEMORY[0x24BDAC760];
    v26 = 1107296256;
    v27 = sub_21C2BDDB0;
    v28 = &block_descriptor_19;
    v19 = _Block_copy(&aBlock);
    v20 = v24;
    v21 = objc_msgSend(v17, sel_initWithMachineReadableCode_codeAttributeType_resultsHandler_, v18, v24, v19);

    _Block_release(v19);
    swift_release();
    swift_release();
    aBlock = 0;
    v26 = 0xE000000000000000;
    v22 = v21;
    sub_21C2C2630();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000017;
    v26 = 0x800000021C2C8FE0;
    v31[0] = a2;
    v31[1] = a3;
    swift_bridgeObjectRetain();
    sub_21C2C2204();
    sub_21C2C2240();
    swift_bridgeObjectRelease();
    sub_21C2C2240();
    v31[0] = v20;
    type metadata accessor for HKConceptAttributeType(0);
    sub_21C2C2204();
    sub_21C2C2240();
    swift_bridgeObjectRelease();
    v23 = (void *)sub_21C2C21A4();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setDebugIdentifier_, v23);

    objc_msgSend(*(id *)(v4 + 24), sel_executeQuery_, v22);
  }
}

uint64_t sub_21C2BB9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_21C2C284C();
    sub_21C2C2228();
    v6 = sub_21C2C2870();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_21C2C2804() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_21C2C2804() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_21C2BBAF0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[3];

  v10 = sub_21C2C1D78();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v15 = result;
    if (a3)
    {
      v36 = a5;
      v16 = a3;
      sub_21C2C1D54();
      v17 = a3;
      v18 = a3;
      v19 = sub_21C2C1D6C();
      v20 = sub_21C2C2354();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v37 = (uint64_t)a3;
        v38[0] = v34;
        v35 = a6;
        *(_DWORD *)v21 = 136315138;
        v32 = v21 + 4;
        v33 = v21;
        v22 = a3;
        sub_21C29CD90();
        v23 = sub_21C2C2204();
        v37 = sub_21C2BE2B4(v23, v24, v38);
        a6 = v35;
        sub_21C2C2570();
        swift_bridgeObjectRelease();

        v25 = v33;
        _os_log_impl(&dword_21C28F000, v19, v20, "Unable to look up medication using MRC: %s", v33, 0xCu);
        v26 = v34;
        swift_arrayDestroy();
        MEMORY[0x2207794E8](v26, -1, -1);
        MEMORY[0x2207794E8](v25, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      a5 = v36;
    }
    swift_retain();
    sub_21C2C1A54();
    swift_release();
    if (a2)
    {
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        result = sub_21C2C26CC();
        if (result)
          goto LABEL_10;
      }
      else
      {
        v27 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        result = swift_bridgeObjectRetain();
        if (v27)
        {
LABEL_10:
          if ((a2 & 0xC000000000000001) != 0)
          {
            v28 = (id)MEMORY[0x220778DC8](0, a2);
          }
          else
          {
            if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            v28 = *(id *)(a2 + 32);
          }
          v29 = v28;
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          v30 = v29;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v37 = *(_QWORD *)(v15 + 176);
          *(_QWORD *)(v15 + 176) = 0x8000000000000000;
          sub_21C2B4CC0((uint64_t)v30, a5, a6, isUniquelyReferenced_nonNull_native);
          *(_QWORD *)(v15 + 176) = v37;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();

          goto LABEL_16;
        }
      }
      swift_bridgeObjectRelease();
    }
LABEL_16:
    *(_QWORD *)(v15 + 168) = 0;
    swift_retain();
    sub_21C2C1A60();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21C2BBE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[7] = a4;
  v5 = sub_21C2C1D78();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21C2BBED0()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 88) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_21C2BBF60;
    return sub_21C2BC20C();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21C2BBF60()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21C2BBFC4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BBFFC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = (void *)v0[13];
  sub_21C2C1D54();
  v3 = v2;
  v4 = v2;
  v5 = sub_21C2C1D6C();
  v6 = sub_21C2C2354();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (void *)v0[13];
    v18 = v0[9];
    v19 = v0[8];
    v20 = v0[10];
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    v21 = v9;
    v0[5] = v7;
    v10 = v7;
    sub_21C29CD90();
    v11 = sub_21C2C2204();
    v0[6] = sub_21C2BE2B4(v11, v12, &v21);
    sub_21C2C2570();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21C28F000, v5, v6, "Unable to read transcript: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v9, -1, -1);
    MEMORY[0x2207794E8](v8, -1, -1);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v13 = (void *)v0[13];
    v14 = v1[10];
    v15 = v1[8];
    v16 = v1[9];
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  }
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_21C2BC20C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[31] = v0;
  v2 = sub_21C2C19DC();
  v1[32] = v2;
  v1[33] = *(_QWORD *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v3 = sub_21C2C1D78();
  v1[35] = v3;
  v1[36] = *(_QWORD *)(v3 - 8);
  v1[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21C2BC294()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v1 = (uint64_t *)(v0 + 248);
  *(_QWORD *)(v0 + 304) = *(_QWORD *)(*(_QWORD *)(v0 + 248) + 56);
  sub_21C2C1A54();
  swift_beginAccess();
  v2 = sub_21C2BCA5C();
  v4 = v3;
  *(_QWORD *)(v0 + 312) = v2;
  *(_QWORD *)(v0 + 320) = v3;
  swift_endAccess();
  if (!v4)
    goto LABEL_5;
  if (sub_21C2C2234() < 4 || (v5 = *v1, (*(_BYTE *)(*v1 + 96) & 1) != 0))
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_21C2C1A60();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_QWORD *)(v0 + 328) = *(_QWORD *)(v5 + 88);
  *(_BYTE *)(v5 + 113) = 1;
  sub_21C2C1A60();
  sub_21C2C1D54();
  swift_bridgeObjectRetain_n();
  v7 = sub_21C2C1D6C();
  v8 = sub_21C2C2348();
  v9 = os_log_type_enabled(v7, v8);
  v11 = *(_QWORD *)(v0 + 288);
  v10 = *(_QWORD *)(v0 + 296);
  v12 = *(_QWORD *)(v0 + 280);
  if (v9)
  {
    v21 = *(_QWORD *)(v0 + 280);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    *(_QWORD *)(v0 + 216) = v2;
    *(_QWORD *)(v0 + 224) = v4;
    swift_bridgeObjectRetain();
    v15 = sub_21C2C21F8();
    *(_QWORD *)(v0 + 240) = sub_21C2BE2B4(v15, v16, &v22);
    sub_21C2C2570();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C28F000, v7, v8, "Processing new transcript: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v14, -1, -1);
    MEMORY[0x2207794E8](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v17 = *(void **)(*(_QWORD *)(v0 + 248) + 40);
  v18 = sub_21C2C21A4();
  *(_QWORD *)(v0 + 336) = v18;
  *(_QWORD *)(v0 + 56) = v0 + 232;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_21C2BC5BC;
  v19 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v20 = (_QWORD *)(v0 + 80);
  v20[1] = 0x40000000;
  v20[2] = sub_21C2B9ED0;
  v20[3] = &block_descriptor_4;
  v20[4] = v19;
  objc_msgSend(v17, sel_resolveMedicationsUsing_resultLimit_completionHandler_, v18, 10, v20);
  return swift_continuation_await();
}

uint64_t sub_21C2BC5BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 344) = v1;
  if (v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21C2BC624()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 336);
  v22 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 256);
  v6 = *(void **)(v0 + 232);
  *(_QWORD *)(v0 + 352) = v6;

  sub_21C2BCDC4(v6);
  v7 = objc_msgSend(v6, sel_usedNgrams);
  v8 = sub_21C2C2270();

  v9 = sub_21C2C12C0(v8);
  swift_bridgeObjectRelease();
  sub_21C2C1A54();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  *(double *)(v5 + 104) = v11;
  *(_BYTE *)(v5 + 112) = 0;
  swift_beginAccess();
  sub_21C2BE91C(&v24, v22, v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v5 + 184) + 16) <= *(_QWORD *)(v9 + 16) >> 3)
  {
    v24 = v9;
    swift_bridgeObjectRetain();
    v14 = swift_bridgeObjectRetain();
    sub_21C2C00CC(v14);
    swift_bridgeObjectRelease();
    v13 = v24;
  }
  else
  {
    swift_bridgeObjectRetain();
    v12 = swift_bridgeObjectRetain();
    v13 = sub_21C2C0260(v12, v9);
    swift_bridgeObjectRelease();
  }
  v15 = v11 - *(double *)(v0 + 328);
  swift_beginAccess();
  v16 = swift_bridgeObjectRetain();
  sub_21C2BCACC(v16);
  swift_endAccess();
  if (v15 <= 2.0)
  {
    v17 = *(_QWORD *)(v9 + 16);
    goto LABEL_10;
  }
  v17 = *(_QWORD *)(v9 + 16);
  if (*(uint64_t *)(*(_QWORD *)(v0 + 248) + 200) < 6)
  {
LABEL_10:
    if (!v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v18 = *(_QWORD *)(v13 + 16);
    goto LABEL_12;
  }
  if (!v17 || (v18 = *(_QWORD *)(v13 + 16), (double)v18 / (double)v17 < 0.1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_BYTE *)(*(_QWORD *)(v0 + 248) + 208) = 1;
    goto LABEL_17;
  }
LABEL_12:
  swift_bridgeObjectRelease();
  if (v18 == v17)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
    if ((double)v18 / (double)v19 > 0.9)
      sub_21C2BCC38();
  }
LABEL_17:
  *(_BYTE *)(*(_QWORD *)(v0 + 248) + 113) = 0;
  sub_21C2C1A60();
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v20;
  *v20 = v0;
  v20[1] = sub_21C2BC914;
  return sub_21C2BC20C();
}

uint64_t sub_21C2BC914()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21C2BC978()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BC9C0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 336);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BCA14()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BCA5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)v0;
  if (!*(_QWORD *)(*(_QWORD *)v0 + 16))
    return 0;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    v3 = v1[2];
    if (v3)
    {
LABEL_4:
      v4 = v3 - 1;
      result = v1[2 * v4 + 4];
      v1[2] = v4;
      *(_QWORD *)v0 = v1;
      return result;
    }
  }
  else
  {
    result = (uint64_t)sub_21C2C0F9C(v1);
    v1 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 16);
    if (v3)
      goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2BCACC(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_21C2BE91C(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21C2BCC38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _BYTE v14[24];

  v1 = v0;
  v2 = sub_21C2C19DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21C2C1490();
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_BYTE *)(v1 + 208) = 0;
  *(_QWORD *)(v1 + 200) = 0;
  swift_beginAccess();
  *(_QWORD *)(v1 + 120) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v1 + 184) = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  v9 = sub_21C2C22F4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  swift_retain();
  sub_21C2B9F58((uint64_t)v8, (uint64_t)&unk_255256748, (uint64_t)v10);
  swift_release();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v12 = v11;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + 88) = v12;
  *(_BYTE *)(v1 + 96) = 0;
  return result;
}

uint64_t sub_21C2BCDC4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  sub_21C2C1A54();
  v3 = *(_QWORD *)(v1 + 200);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 200) = v5;
    if (!*(_QWORD *)(v1 + 192))
    {
      *(_QWORD *)(v1 + 192) = a1;
      v11 = a1;
      return sub_21C2C1A60();
    }
    v6 = objc_msgSend(a1, sel_resolvedIds);
    sub_21C2943A8(0, &qword_255255740);
    v7 = sub_21C2C2270();

    if (!(v7 >> 62))
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRetain();
  v8 = sub_21C2C26CC();
  swift_bridgeObjectRelease();
LABEL_5:
  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = *(void **)(v1 + 192);
    *(_QWORD *)(v1 + 192) = a1;
    v10 = a1;

  }
  return sub_21C2C1A60();
}

uint64_t sub_21C2BCEC8(char a1)
{
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD);
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  char v52;

  v4 = v1;
  v6 = sub_21C2C1A00();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C2C19DC();
  v11 = *(void (***)(_QWORD, _QWORD))(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v1 + 56);
  sub_21C2C1A54();
  sub_21C2C19D0();
  sub_21C2C19AC();
  v16 = v15;
  ((void (**)(char *, uint64_t))v11)[1](v13, v10);
  swift_beginAccess();
  v17 = swift_bridgeObjectRetain();
  v18 = (unint64_t)sub_21C2B2578(v17);
  swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) != 0 || (v18 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v35 = sub_21C2C26CC();
    swift_release();
    if (v35)
    {
LABEL_4:
      if ((v18 & 0xC000000000000001) != 0)
      {
        v19 = (id)MEMORY[0x220778DC8](0, v18);
      }
      else
      {
        if (!*(_QWORD *)(v18 + 16))
        {
          __break(1u);
LABEL_23:
          swift_once();
LABEL_14:
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v4 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v6);
          swift_beginAccess();
          swift_retain();
          v21 = swift_bridgeObjectRetain();
          v22 = sub_21C2B2480(v21);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          v23 = swift_bridgeObjectRetain();
          v24 = sub_21C2B2480(v23);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          v38 = v6;
          v37 = v7;
          v25 = swift_bridgeObjectRetain();
          v26 = sub_21C2B2480(v25);
          swift_bridgeObjectRelease();
          v27 = objc_msgSend(v11, sel_specificProduct);
          v28 = objc_msgSend(v27, sel_identifier);

          v29 = objc_msgSend(v28, sel_numberRepresentation);
          v30 = objc_msgSend(v29, sel_stringValue);

          v31 = sub_21C2C21C8();
          v32 = v11;
          v34 = v33;

          LOBYTE(v42) = v40;
          v43 = v2;
          v44 = v16;
          v45 = v3;
          v46 = v39;
          v47 = 0;
          v48 = 1;
          v49 = 0;
          v50 = 1;
          v51 = 0;
          v52 = 1;
          sub_21C2AC718((uint64_t)v9, (uint64_t)v22, (uint64_t)v24, (uint64_t)v26, v31, v34, 0, (unsigned __int8 *)&v42);
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
          swift_getKeyPath();
          swift_getKeyPath();
          v42 = v32;
          v43 = 0.0;
          LOBYTE(v44) = 0;
          swift_retain();
          sub_21C2C1F94();
          return sub_21C2C1A60();
        }
        v19 = *(id *)(v18 + 32);
      }
      v11 = (void (**)(_QWORD, _QWORD))v19;
      swift_release();
      v41 = v14;
      objc_msgSend(*(id *)(v4 + 64), sel_invalidate);
      v20 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = 0;

      v40 = *(unsigned __int8 *)(v4 + 208);
      if (*(_BYTE *)(v4 + 96))
        v2 = 0.0;
      else
        v2 = *(double *)(v4 + 88);
      if (*(_BYTE *)(v4 + 112))
        v3 = 0.0;
      else
        v3 = *(double *)(v4 + 104);
      v39 = *(_QWORD *)(v4 + 200);
      if (qword_2552553A0 == -1)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if (*(_QWORD *)(v18 + 16))
  {
    goto LABEL_4;
  }
  swift_release();
  if ((a1 & 1) != 0 || *(_BYTE *)(v4 + 208) == 1 && v16 - *(double *)(v4 + 168) >= 0.5)
    sub_21C2BD3BC(v16);
  return sub_21C2C1A60();
}

uint64_t sub_21C2BD3BC(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  int v28;
  __int128 v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;

  v2 = v1;
  v4 = sub_21C2C1A00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  v8 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;

  v28 = *(unsigned __int8 *)(v1 + 208);
  if (*(_BYTE *)(v1 + 96))
    v9 = 0.0;
  else
    v9 = *(double *)(v1 + 88);
  if (*(_BYTE *)(v1 + 112))
    v10 = 0.0;
  else
    v10 = *(double *)(v1 + 104);
  v11 = *(_QWORD *)(v1 + 200);
  if (qword_2552553A0 != -1)
    swift_once();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC25HealthMedicationsVisionUI33MedicationDataScanningCoordinator_sessionId, v4);
  swift_beginAccess();
  swift_retain();
  v12 = swift_bridgeObjectRetain();
  v13 = sub_21C2B2480(v12);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v14 = swift_bridgeObjectRetain();
  v15 = sub_21C2B2480(v14);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v16 = swift_bridgeObjectRetain();
  v17 = sub_21C2B2480(v16);
  swift_bridgeObjectRelease();
  v18 = *(void **)(v1 + 192);
  LOBYTE(v29) = v28;
  *((double *)&v29 + 1) = v9;
  v30 = a1;
  v31 = v10;
  v32 = v11;
  v33 = 0;
  v34 = 1;
  v35 = 0;
  v36 = 1;
  v37 = 0;
  v38 = 1;
  v19 = v18;
  sub_21C2AC718((uint64_t)v7, (uint64_t)v13, (uint64_t)v15, (uint64_t)v17, 0, 0, v18, (unsigned __int8 *)&v29);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v20 = *(void **)(v1 + 192);
  if (!v20)
    goto LABEL_15;
  v21 = v20;
  v22 = objc_msgSend(v21, sel_resolvedIds);
  sub_21C2943A8(0, &qword_255255740);
  v23 = sub_21C2C2270();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v24)
  {

LABEL_15:
    swift_getKeyPath();
    swift_getKeyPath();
    v29 = xmmword_21C2C4900;
    LOBYTE(v30) = 2;
    swift_retain();
    return sub_21C2C1F94();
  }
  v25 = *(_QWORD *)(v2 + 128);
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)&v29 = v20;
  *((_QWORD *)&v29 + 1) = v25;
  LOBYTE(v30) = 1;
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_21C2C1F94();
}

uint64_t sub_21C2BD7A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[20] = a4;
  v5 = sub_21C2C1D78();
  v4[21] = v5;
  v4[22] = *(_QWORD *)(v5 - 8);
  v4[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21C2BD808()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[20] + 40);
  v0[7] = v0 + 25;
  v0[2] = v0;
  v0[3] = sub_21C2BD8A0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_21C2BDB28;
  v3[3] = &block_descriptor_12;
  v3[4] = v2;
  objc_msgSend(v1, sel_resetResolverWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21C2BD8A0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 192) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21C2BD900()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BD930()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 192);
  swift_willThrow();
  sub_21C2C1D54();
  v2 = v1;
  v3 = v1;
  v4 = sub_21C2C1D6C();
  v5 = sub_21C2C2354();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 176);
    v17 = *(_QWORD *)(v0 + 168);
    v18 = *(_QWORD *)(v0 + 184);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_21C2C2834();
    *(_QWORD *)(v0 + 152) = sub_21C2BE2B4(v9, v10, &v19);
    sub_21C2C2570();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21C28F000, v4, v5, "Failed to reset resolver, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207794E8](v8, -1, -1);
    MEMORY[0x2207794E8](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 184);
    v11 = *(void **)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21C2BDB28(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    sub_21C29CD90();
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

void destroy for MedicationDataScanningCoordinatorState(uint64_t a1)
{
  sub_21C29CB74(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s25HealthMedicationsVisionUI38MedicationDataScanningCoordinatorStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21C29CB38(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MedicationDataScanningCoordinatorState(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21C29CB38(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_21C29CB74(v6, v7, v8);
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

uint64_t assignWithTake for MedicationDataScanningCoordinatorState(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_21C29CB74(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MedicationDataScanningCoordinatorState(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MedicationDataScanningCoordinatorState(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_21C2BDD70(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_21C2BDD88(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for MedicationDataScanningCoordinatorState()
{
  return &type metadata for MedicationDataScanningCoordinatorState;
}

uint64_t sub_21C2BDDB0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void (*v7)(id, uint64_t, void *);
  id v8;
  id v9;

  v5 = a3;
  v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_21C2943A8(0, &qword_255255A90);
    v5 = sub_21C2C2270();
  }
  swift_retain();
  v8 = a2;
  v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21C2BDE50(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_21C2C284C();
    swift_bridgeObjectRetain();
    sub_21C2C2228();
    v18 = sub_21C2C2870();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_21C2C2804() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_21C2C2804() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

double sub_21C2BE0F0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C2C1F88();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_21C2BE174(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21C29CB38(v1, v2, v3);
  swift_retain();
  return sub_21C2C1F94();
}

uint64_t sub_21C2BE204(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21C2BE268;
  return v6(a1);
}

uint64_t sub_21C2BE268()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21C2BE2B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21C2BE384(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21C2A77A4((uint64_t)v12, *a3);
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
      sub_21C2A77A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21C2BE384(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C2C257C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21C2BE53C(a5, a6);
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
  v8 = sub_21C2C266C();
  if (!v8)
  {
    sub_21C2C26B4();
    __break(1u);
LABEL_17:
    result = sub_21C2C2714();
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

uint64_t sub_21C2BE53C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21C2BE5D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21C2BE7BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21C2BE7BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C2BE5D0(uint64_t a1, unint64_t a2)
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
      v3 = sub_21C2BE744(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21C2C263C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21C2C26B4();
      __break(1u);
LABEL_10:
      v2 = sub_21C2C224C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21C2C2714();
    __break(1u);
LABEL_14:
    result = sub_21C2C26B4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21C2BE744(uint64_t a1, uint64_t a2)
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
  sub_21C2944A4(0, &qword_255256730, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C2BE7BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_21C2944A4(0, &qword_255256730, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_21C2C2714();
  __break(1u);
  return result;
}

uint64_t sub_21C2BE91C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_21C2C284C();
  swift_bridgeObjectRetain();
  sub_21C2C2228();
  v8 = sub_21C2C2870();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21C2C2804() & 1) != 0)
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
      if (v19 || (sub_21C2C2804() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21C2BF544(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21C2BEAC8(_QWORD *a1, void *a2)
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
    v9 = sub_21C2C25DC();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_21C2943A8(0, &qword_255255AA0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_21C2C25D0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_21C2BED64(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_21C2BF22C();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_21C2BF4C4((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_21C2C2480();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_21C2943A8(0, &qword_255255AA0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_21C2C248C();

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
        v18 = sub_21C2C248C();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_21C2BF6DC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_21C2BED64(uint64_t a1, uint64_t a2)
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
    sub_21C2C17BC();
    v2 = sub_21C2C260C();
    v14 = v2;
    sub_21C2C25C4();
    if (sub_21C2C25E8())
    {
      sub_21C2943A8(0, &qword_255255AA0);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_21C2BF22C();
          v2 = v14;
        }
        result = sub_21C2C2480();
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
      while (sub_21C2C25E8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_21C2BEF54()
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
  sub_21C2C1434();
  v3 = sub_21C2C2600();
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
      sub_21C2C284C();
      sub_21C2C2228();
      result = sub_21C2C2870();
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

uint64_t sub_21C2BF22C()
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
  sub_21C2C17BC();
  v3 = sub_21C2C2600();
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
      result = sub_21C2C2480();
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

unint64_t sub_21C2BF4C4(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_21C2C2480();
  result = sub_21C2C25B8();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_21C2BF544(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21C2BEF54();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_21C2BF860();
      goto LABEL_22;
    }
    sub_21C2BFBB0();
  }
  v11 = *v4;
  sub_21C2C284C();
  sub_21C2C2228();
  result = sub_21C2C2870();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_21C2C2804(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_21C2C281C();
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
          result = sub_21C2C2804();
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

void sub_21C2BF6DC(uint64_t a1, unint64_t a2, char a3)
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
    sub_21C2BF22C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_21C2BFA0C();
      goto LABEL_14;
    }
    sub_21C2BFE58();
  }
  v8 = *v3;
  v9 = sub_21C2C2480();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_21C2943A8(0, &qword_255255AA0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_21C2C248C();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_21C2C281C();
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
        v15 = sub_21C2C248C();

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

void *sub_21C2BF860()
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
  sub_21C2C1434();
  v2 = *v0;
  v3 = sub_21C2C25F4();
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

id sub_21C2BFA0C()
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
  sub_21C2C17BC();
  v2 = *v0;
  v3 = sub_21C2C25F4();
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

uint64_t sub_21C2BFBB0()
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
  sub_21C2C1434();
  v3 = sub_21C2C2600();
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
    sub_21C2C284C();
    swift_bridgeObjectRetain();
    sub_21C2C2228();
    result = sub_21C2C2870();
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

uint64_t sub_21C2BFE58()
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
  sub_21C2C17BC();
  v3 = sub_21C2C2600();
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
    result = sub_21C2C2480();
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

uint64_t sub_21C2C00CC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_21C2C06C8(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_21C2C0260(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_21C2B6A98();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_21C2C284C();
      swift_bridgeObjectRetain();
      sub_21C2C2228();
      v19 = sub_21C2C2870();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_21C2C2804() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_21C2C2804() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_21C2C0854((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_21C2B6A98();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_21C2C0854((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_21C2B6A98();
      MEMORY[0x2207794E8](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_21C2C06C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_21C2C284C();
  swift_bridgeObjectRetain();
  sub_21C2C2228();
  v6 = sub_21C2C2870();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_21C2C2804() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_21C2C2804() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21C2BF860();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_21C2C0DD8(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_21C2C0854(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_21C2C0B48(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_21C2C284C();
        swift_bridgeObjectRetain();
        sub_21C2C2228();
        v22 = sub_21C2C2870();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_21C2C2804() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_21C2C2804() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_21C2C0B48(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_21C2C1434();
  result = sub_21C2C2618();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_21C2C284C();
    swift_bridgeObjectRetain();
    sub_21C2C2228();
    result = sub_21C2C2870();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
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
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_21C2C0DD8(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_21C2C25AC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_21C2C284C();
        swift_bridgeObjectRetain();
        sub_21C2C2228();
        v10 = sub_21C2C2870();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

_QWORD *sub_21C2C0F9C(_QWORD *a1)
{
  return sub_21C2B169C(0, a1[2], 0, a1);
}

uint64_t sub_21C2C0FB0(void *a1, uint64_t a2, char a3, void *a4, uint64_t a5, char a6)
{
  id v10;
  id v11;
  char v12;
  char v14;

  if (a3)
  {
    if (a3 != 1)
      __asm { BR              X9 }
    if (a6 == 1)
    {
      sub_21C2943A8(0, &qword_2552558B0);
      v10 = a1;
      v11 = a4;
      v12 = sub_21C2C248C();

      if ((v12 & 1) != 0)
        return sub_21C2BDE50(a2, a5);
    }
    return 0;
  }
  if (a6)
    return 0;
  sub_21C2943A8(0, &qword_2552558B0);
  sub_21C29CB38(a1, a2, 0);
  sub_21C29CB38(a4, a5, 0);
  v14 = sub_21C2C248C();
  sub_21C29CB74(a4, a5, 0);
  sub_21C29CB74(a1, a2, 0);
  return v14 & 1;
}

uint64_t sub_21C2C1168(unint64_t a1)
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
    sub_21C2C26CC();
    swift_bridgeObjectRelease();
  }
  sub_21C2943A8(0, &qword_255255AA0);
  sub_21C2A09C0();
  result = sub_21C2C2330();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_21C2C26CC();
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
        v6 = (void *)MEMORY[0x220778DC8](i, a1);
        sub_21C2BEAC8(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_21C2BEAC8(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C2C12C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_21C2C2330();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_21C2BE91C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21C2C1354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  double v11;
  uint64_t result;
  char v13;
  char v14;
  uint64_t v15;

  v1 = v0;
  v2 = sub_21C2C19DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2C19D0();
  sub_21C2C19AC();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_21C2C1A54();
  v9 = *(double *)(v1 + 80);
  v8 = *(double *)(v1 + 88);
  v10 = *(_BYTE *)(v1 + 96);
  v11 = v7 - *(double *)(v1 + 72);
  result = sub_21C2C1A60();
  if (v11 > 2.0)
  {
    if (v7 >= v9)
      v13 = 1;
    else
      v13 = v10;
    if (v7 - v8 >= 5.0)
      v14 = 1;
    else
      v14 = v13;
    return sub_21C2BCEC8(v14);
  }
  return result;
}

void sub_21C2C1434()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256738)
  {
    v0 = sub_21C2C2624();
    if (!v1)
      atomic_store(v0, &qword_255256738);
  }
}

void sub_21C2C1490()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255255728)
  {
    sub_21C2C22F4();
    v0 = sub_21C2C2564();
    if (!v1)
      atomic_store(v0, &qword_255255728);
  }
}

uint64_t sub_21C2C14E4()
{
  return objectdestroyTm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_21C2C14F8(uint64_t a1)
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
  v7[1] = sub_21C29CA44;
  return sub_21C2BD7A8(a1, v4, v5, v6);
}

uint64_t sub_21C2C1564(uint64_t a1)
{
  uint64_t v2;

  sub_21C2C1490();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C2C15A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2C18F4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255256750 + dword_255256750))(a1, v4);
}

uint64_t sub_21C2C1610()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21C2C1634()
{
  return objectdestroyTm((void (*)(_QWORD))MEMORY[0x24BEE4EF8], (void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t sub_21C2C1648(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t *v3;

  return sub_21C2BBAF0(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_21C2C166C()
{
  return objectdestroyTm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroyTm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 32));
  return swift_deallocObject();
}

uint64_t sub_21C2C16BC(uint64_t a1)
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
  v7[1] = sub_21C2C18F4;
  return sub_21C2BBE70(a1, v4, v5, v6);
}

uint64_t sub_21C2C1728()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C2C174C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C29CA44;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255256750 + dword_255256750))(a1, v4);
}

void sub_21C2C17BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256780)
  {
    sub_21C2943A8(255, &qword_255255AA0);
    sub_21C2A09C0();
    v0 = sub_21C2C2624();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256780);
  }
}

void sub_21C2C182C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255256788)
  {
    sub_21C2C1890();
    v0 = sub_21C2C1F04();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255256788);
  }
}

void sub_21C2C1890()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_255256790)
  {
    type metadata accessor for HKConceptAttributeType(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_255256790);
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_21C2C191C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21C2C1928()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21C2C1934()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21C2C1940()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21C2C194C()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t sub_21C2C1958()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21C2C1964()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21C2C1970()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21C2C197C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21C2C1988()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21C2C1994()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21C2C19A0()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_21C2C19AC()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_21C2C19B8()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21C2C19C4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21C2C19D0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21C2C19DC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21C2C19E8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21C2C19F4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21C2C1A00()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21C2C1A0C()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_21C2C1A18()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_21C2C1A24()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_21C2C1A30()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_21C2C1A3C()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_21C2C1A48()
{
  return MEMORY[0x24BE41EC0]();
}

uint64_t sub_21C2C1A54()
{
  return MEMORY[0x24BE473E0]();
}

uint64_t sub_21C2C1A60()
{
  return MEMORY[0x24BE473E8]();
}

uint64_t sub_21C2C1A6C()
{
  return MEMORY[0x24BE473F0]();
}

uint64_t sub_21C2C1A78()
{
  return MEMORY[0x24BE473F8]();
}

uint64_t sub_21C2C1A84()
{
  return MEMORY[0x24BE418B0]();
}

uint64_t sub_21C2C1A90()
{
  return MEMORY[0x24BE426A0]();
}

uint64_t sub_21C2C1A9C()
{
  return MEMORY[0x24BE42DF0]();
}

uint64_t sub_21C2C1AA8()
{
  return MEMORY[0x24BE42E00]();
}

uint64_t sub_21C2C1AB4()
{
  return MEMORY[0x24BE42E50]();
}

uint64_t sub_21C2C1AC0()
{
  return MEMORY[0x24BE42E90]();
}

uint64_t sub_21C2C1ACC()
{
  return MEMORY[0x24BE43198]();
}

uint64_t sub_21C2C1AD8()
{
  return MEMORY[0x24BE431A0]();
}

uint64_t sub_21C2C1AE4()
{
  return MEMORY[0x24BE431A8]();
}

uint64_t sub_21C2C1AF0()
{
  return MEMORY[0x24BE431B0]();
}

uint64_t sub_21C2C1AFC()
{
  return MEMORY[0x24BE431B8]();
}

uint64_t sub_21C2C1B08()
{
  return MEMORY[0x24BE43360]();
}

uint64_t sub_21C2C1B14()
{
  return MEMORY[0x24BE43368]();
}

uint64_t sub_21C2C1B20()
{
  return MEMORY[0x24BE434A0]();
}

uint64_t sub_21C2C1B2C()
{
  return MEMORY[0x24BE434C0]();
}

uint64_t sub_21C2C1B38()
{
  return MEMORY[0x24BE43538]();
}

uint64_t sub_21C2C1B44()
{
  return MEMORY[0x24BE43860]();
}

uint64_t sub_21C2C1B50()
{
  return MEMORY[0x24BE438B0]();
}

uint64_t sub_21C2C1B5C()
{
  return MEMORY[0x24BE438C0]();
}

uint64_t sub_21C2C1B68()
{
  return MEMORY[0x24BE43D28]();
}

uint64_t sub_21C2C1B74()
{
  return MEMORY[0x24BE43D78]();
}

uint64_t sub_21C2C1B80()
{
  return MEMORY[0x24BE43D98]();
}

uint64_t sub_21C2C1B8C()
{
  return MEMORY[0x24BE441B0]();
}

uint64_t sub_21C2C1B98()
{
  return MEMORY[0x24BE441B8]();
}

uint64_t sub_21C2C1BA4()
{
  return MEMORY[0x24BE441C0]();
}

uint64_t sub_21C2C1BB0()
{
  return MEMORY[0x24BE445B0]();
}

uint64_t sub_21C2C1BBC()
{
  return MEMORY[0x24BE445B8]();
}

uint64_t sub_21C2C1BC8()
{
  return MEMORY[0x24BE445D0]();
}

uint64_t sub_21C2C1BD4()
{
  return MEMORY[0x24BE445D8]();
}

uint64_t sub_21C2C1BE0()
{
  return MEMORY[0x24BE445E0]();
}

uint64_t sub_21C2C1BEC()
{
  return MEMORY[0x24BE44608]();
}

uint64_t sub_21C2C1BF8()
{
  return MEMORY[0x24BE44610]();
}

uint64_t sub_21C2C1C04()
{
  return MEMORY[0x24BE44620]();
}

uint64_t sub_21C2C1C10()
{
  return MEMORY[0x24BE44628]();
}

uint64_t sub_21C2C1C1C()
{
  return MEMORY[0x24BE44630]();
}

uint64_t sub_21C2C1C28()
{
  return MEMORY[0x24BE44638]();
}

uint64_t sub_21C2C1C34()
{
  return MEMORY[0x24BE44B30]();
}

uint64_t sub_21C2C1C40()
{
  return MEMORY[0x24BE44C18]();
}

uint64_t sub_21C2C1C4C()
{
  return MEMORY[0x24BE44C70]();
}

uint64_t sub_21C2C1C58()
{
  return MEMORY[0x24BE44D78]();
}

uint64_t sub_21C2C1C64()
{
  return MEMORY[0x24BE44F28]();
}

uint64_t sub_21C2C1C70()
{
  return MEMORY[0x24BE44F30]();
}

uint64_t sub_21C2C1C7C()
{
  return MEMORY[0x24BE44F68]();
}

uint64_t sub_21C2C1C88()
{
  return MEMORY[0x24BE450E0]();
}

uint64_t sub_21C2C1C94()
{
  return MEMORY[0x24BE450E8]();
}

uint64_t sub_21C2C1CA0()
{
  return MEMORY[0x24BE450F0]();
}

uint64_t sub_21C2C1CAC()
{
  return MEMORY[0x24BE450F8]();
}

uint64_t sub_21C2C1CB8()
{
  return MEMORY[0x24BE45100]();
}

uint64_t sub_21C2C1CC4()
{
  return MEMORY[0x24BE45110]();
}

uint64_t sub_21C2C1CD0()
{
  return MEMORY[0x24BE45120]();
}

uint64_t sub_21C2C1CDC()
{
  return MEMORY[0x24BE45148]();
}

uint64_t sub_21C2C1CE8()
{
  return MEMORY[0x24BE45158]();
}

uint64_t sub_21C2C1CF4()
{
  return MEMORY[0x24BE45198]();
}

uint64_t sub_21C2C1D00()
{
  return MEMORY[0x24BE45FB0]();
}

uint64_t sub_21C2C1D0C()
{
  return MEMORY[0x24BE45FB8]();
}

uint64_t sub_21C2C1D18()
{
  return MEMORY[0x24BE46018]();
}

uint64_t sub_21C2C1D24()
{
  return MEMORY[0x24BE46020]();
}

uint64_t sub_21C2C1D30()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_21C2C1D3C()
{
  return MEMORY[0x24BEE7710]();
}

uint64_t sub_21C2C1D48()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21C2C1D54()
{
  return MEMORY[0x24BE48480]();
}

uint64_t sub_21C2C1D60()
{
  return MEMORY[0x24BE46118]();
}

uint64_t sub_21C2C1D6C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21C2C1D78()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21C2C1D84()
{
  return MEMORY[0x24BEBC060]();
}

uint64_t sub_21C2C1D90()
{
  return MEMORY[0x24BEBC088]();
}

uint64_t sub_21C2C1D9C()
{
  return MEMORY[0x24BEBC098]();
}

uint64_t sub_21C2C1DA8()
{
  return MEMORY[0x24BEBC0B0]();
}

uint64_t sub_21C2C1DB4()
{
  return MEMORY[0x24BEBC0B8]();
}

uint64_t sub_21C2C1DC0()
{
  return MEMORY[0x24BEBC0E0]();
}

uint64_t sub_21C2C1DCC()
{
  return MEMORY[0x24BEBC3A8]();
}

uint64_t sub_21C2C1DD8()
{
  return MEMORY[0x24BEBC3C0]();
}

uint64_t sub_21C2C1DE4()
{
  return MEMORY[0x24BEBC3C8]();
}

uint64_t sub_21C2C1DF0()
{
  return MEMORY[0x24BEBC3F0]();
}

uint64_t sub_21C2C1DFC()
{
  return MEMORY[0x24BEBC408]();
}

uint64_t sub_21C2C1E08()
{
  return MEMORY[0x24BEBC4A8]();
}

uint64_t sub_21C2C1E14()
{
  return MEMORY[0x24BEBC500]();
}

uint64_t sub_21C2C1E20()
{
  return MEMORY[0x24BEBC508]();
}

uint64_t sub_21C2C1E2C()
{
  return MEMORY[0x24BEBC558]();
}

uint64_t sub_21C2C1E38()
{
  return MEMORY[0x24BEBC560]();
}

uint64_t sub_21C2C1E44()
{
  return MEMORY[0x24BEBC580]();
}

uint64_t sub_21C2C1E50()
{
  return MEMORY[0x24BEBC5E8]();
}

uint64_t sub_21C2C1E5C()
{
  return MEMORY[0x24BEBC5F8]();
}

uint64_t sub_21C2C1E68()
{
  return MEMORY[0x24BEBC728]();
}

uint64_t sub_21C2C1E74()
{
  return MEMORY[0x24BEBC748]();
}

uint64_t sub_21C2C1E80()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_21C2C1E8C()
{
  return MEMORY[0x24BDB9598]();
}

uint64_t sub_21C2C1E98()
{
  return MEMORY[0x24BDB9600]();
}

uint64_t sub_21C2C1EA4()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_21C2C1EB0()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_21C2C1EBC()
{
  return MEMORY[0x24BDB9978]();
}

uint64_t sub_21C2C1EC8()
{
  return MEMORY[0x24BDB99F8]();
}

uint64_t sub_21C2C1ED4()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_21C2C1EE0()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_21C2C1EEC()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_21C2C1EF8()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_21C2C1F04()
{
  return MEMORY[0x24BDB9C98]();
}

uint64_t sub_21C2C1F10()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_21C2C1F1C()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_21C2C1F28()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_21C2C1F34()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_21C2C1F40()
{
  return MEMORY[0x24BDB9E38]();
}

uint64_t sub_21C2C1F4C()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_21C2C1F58()
{
  return MEMORY[0x24BDB9E78]();
}

uint64_t sub_21C2C1F64()
{
  return MEMORY[0x24BDB9E80]();
}

uint64_t sub_21C2C1F70()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21C2C1F7C()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_21C2C1F88()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21C2C1F94()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21C2C1FA0()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_21C2C1FAC()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_21C2C1FB8()
{
  return MEMORY[0x24BDB9F50]();
}

uint64_t sub_21C2C1FC4()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_21C2C1FD0()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_21C2C1FDC()
{
  return MEMORY[0x24BDBA0B0]();
}

uint64_t sub_21C2C1FE8()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_21C2C1FF4()
{
  return MEMORY[0x24BDBA0F0]();
}

uint64_t sub_21C2C2000()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_21C2C200C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21C2C2018()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21C2C2024()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21C2C2030()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21C2C203C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21C2C2048()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21C2C2054()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_21C2C2060()
{
  return MEMORY[0x24BDF9FF8]();
}

uint64_t sub_21C2C206C()
{
  return MEMORY[0x24BDFA000]();
}

uint64_t sub_21C2C2078()
{
  return MEMORY[0x24BDFA008]();
}

uint64_t sub_21C2C2084()
{
  return MEMORY[0x24BDFA048]();
}

uint64_t sub_21C2C2090()
{
  return MEMORY[0x24BDFA058]();
}

uint64_t sub_21C2C209C()
{
  return MEMORY[0x24BDFA068]();
}

uint64_t sub_21C2C20A8()
{
  return MEMORY[0x24BDFA0C0]();
}

uint64_t sub_21C2C20B4()
{
  return MEMORY[0x24BDFA0C8]();
}

uint64_t sub_21C2C20C0()
{
  return MEMORY[0x24BDFA0D0]();
}

uint64_t sub_21C2C20CC()
{
  return MEMORY[0x24BDFA0F0]();
}

uint64_t sub_21C2C20D8()
{
  return MEMORY[0x24BDFA0F8]();
}

uint64_t sub_21C2C20E4()
{
  return MEMORY[0x24BDFA108]();
}

uint64_t sub_21C2C20F0()
{
  return MEMORY[0x24BDFA120]();
}

uint64_t sub_21C2C20FC()
{
  return MEMORY[0x24BDFA128]();
}

uint64_t sub_21C2C2108()
{
  return MEMORY[0x24BDFA130]();
}

uint64_t sub_21C2C2114()
{
  return MEMORY[0x24BDFA138]();
}

uint64_t sub_21C2C2120()
{
  return MEMORY[0x24BDFA140]();
}

uint64_t sub_21C2C212C()
{
  return MEMORY[0x24BDFA148]();
}

uint64_t sub_21C2C2138()
{
  return MEMORY[0x24BDFA150]();
}

uint64_t sub_21C2C2144()
{
  return MEMORY[0x24BDFA188]();
}

uint64_t sub_21C2C2150()
{
  return MEMORY[0x24BDFA190]();
}

uint64_t sub_21C2C215C()
{
  return MEMORY[0x24BDFA198]();
}

uint64_t sub_21C2C2168()
{
  return MEMORY[0x24BDFA1A0]();
}

uint64_t sub_21C2C2174()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21C2C2180()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21C2C218C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21C2C2198()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21C2C21A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21C2C21B0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21C2C21BC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21C2C21C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C2C21D4()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21C2C21E0()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21C2C21EC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21C2C21F8()
{
  return MEMORY[0x24BE48570]();
}

uint64_t sub_21C2C2204()
{
  return MEMORY[0x24BE48578]();
}

uint64_t sub_21C2C2210()
{
  return MEMORY[0x24BE46140]();
}

uint64_t sub_21C2C221C()
{
  return MEMORY[0x24BE46148]();
}

uint64_t sub_21C2C2228()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C2C2234()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21C2C2240()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21C2C224C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21C2C2258()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21C2C2264()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21C2C2270()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21C2C227C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21C2C2288()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21C2C2294()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21C2C22A0()
{
  return MEMORY[0x24BE46158]();
}

uint64_t sub_21C2C22AC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21C2C22B8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21C2C22C4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21C2C22D0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21C2C22DC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21C2C22E8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21C2C22F4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21C2C2300()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_21C2C230C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_21C2C2318()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_21C2C2324()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21C2C2330()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21C2C233C()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_21C2C2348()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21C2C2354()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21C2C2360()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21C2C236C()
{
  return MEMORY[0x24BE45478]();
}

uint64_t sub_21C2C2378()
{
  return MEMORY[0x24BE45488]();
}

uint64_t sub_21C2C2384()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21C2C2390()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_21C2C239C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21C2C23A8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21C2C23B4()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21C2C23C0()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21C2C23CC()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21C2C23D8()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_21C2C23E4()
{
  return MEMORY[0x24BEBCD20]();
}

uint64_t sub_21C2C23F0()
{
  return MEMORY[0x24BEBCD30]();
}

uint64_t sub_21C2C23FC()
{
  return MEMORY[0x24BEBCD60]();
}

uint64_t sub_21C2C2408()
{
  return MEMORY[0x24BE49B38]();
}

uint64_t sub_21C2C2414()
{
  return MEMORY[0x24BE46180]();
}

uint64_t sub_21C2C2420()
{
  return MEMORY[0x24BE46188]();
}

uint64_t sub_21C2C242C()
{
  return MEMORY[0x24BE46190]();
}

uint64_t sub_21C2C2438()
{
  return MEMORY[0x24BE46198]();
}

uint64_t sub_21C2C2444()
{
  return MEMORY[0x24BEBCD98]();
}

uint64_t sub_21C2C2450()
{
  return MEMORY[0x24BDD0108]();
}

uint64_t sub_21C2C245C()
{
  return MEMORY[0x24BE455D0]();
}

uint64_t sub_21C2C2468()
{
  return MEMORY[0x24BE455D8]();
}

uint64_t sub_21C2C2474()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_21C2C2480()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21C2C248C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21C2C2498()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_21C2C24A4()
{
  return MEMORY[0x24BEBD040]();
}

uint64_t sub_21C2C24B0()
{
  return MEMORY[0x24BEBD050]();
}

uint64_t sub_21C2C24BC()
{
  return MEMORY[0x24BEBD0D8]();
}

uint64_t sub_21C2C24C8()
{
  return MEMORY[0x24BE45640]();
}

uint64_t sub_21C2C24D4()
{
  return MEMORY[0x24BEBD130]();
}

uint64_t sub_21C2C24E0()
{
  return MEMORY[0x24BEBD190]();
}

uint64_t sub_21C2C24EC()
{
  return MEMORY[0x24BEBD1A8]();
}

uint64_t sub_21C2C24F8()
{
  return MEMORY[0x24BEBD1B0]();
}

uint64_t sub_21C2C2504()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_21C2C2510()
{
  return MEMORY[0x24BEBD208]();
}

uint64_t sub_21C2C251C()
{
  return MEMORY[0x24BEBD210]();
}

uint64_t sub_21C2C2528()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_21C2C2534()
{
  return MEMORY[0x24BE46248]();
}

uint64_t sub_21C2C2540()
{
  return MEMORY[0x24BDD03D0]();
}

uint64_t sub_21C2C254C()
{
  return MEMORY[0x24BDD03F0]();
}

uint64_t sub_21C2C2558()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21C2C2564()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21C2C2570()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21C2C257C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21C2C2588()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_21C2C2594()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21C2C25A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21C2C25AC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21C2C25B8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21C2C25C4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_21C2C25D0()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_21C2C25DC()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21C2C25E8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_21C2C25F4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21C2C2600()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21C2C260C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_21C2C2618()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21C2C2624()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_21C2C2630()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21C2C263C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21C2C2648()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_21C2C2654()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21C2C2660()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21C2C266C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C2C2678()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21C2C2684()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21C2C2690()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21C2C269C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21C2C26A8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21C2C26B4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21C2C26C0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21C2C26CC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21C2C26D8()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_21C2C26E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21C2C26F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21C2C26FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21C2C2708()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_21C2C2714()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21C2C2720()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21C2C272C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21C2C2738()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_21C2C2744()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21C2C2750()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_21C2C275C()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_21C2C2768()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_21C2C2774()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21C2C2780()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21C2C278C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21C2C2798()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_21C2C27A4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21C2C27B0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21C2C27BC()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_21C2C27C8()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_21C2C27D4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21C2C27E0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21C2C27EC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21C2C27F8()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_21C2C2804()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C2C2810()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21C2C281C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21C2C2828()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21C2C2834()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21C2C2840()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_21C2C284C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C2C2858()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21C2C2864()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_21C2C2870()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21C2C287C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21C2C2888()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21C2C2894()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21C2C28A0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21C2C28AC()
{
  return MEMORY[0x24BEE4A98]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t HKStringFromOntologyShardState()
{
  return MEMORY[0x24BDD37D8]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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


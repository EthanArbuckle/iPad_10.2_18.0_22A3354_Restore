uint64_t sub_230F0C79C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_230F0D5D0((uint64_t *)&unk_25414BA00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_230F0C7E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v4 = sub_230F0FBFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230F0FBF0();
  v19 = 0x6D614E7473726966;
  v20 = 0xE900000000000065;
  v8 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v8)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_230F0C79C((uint64_t)&v17, (uint64_t)&v19);
  if (v21)
    swift_dynamicCast();
  else
    sub_230F0EDB0((uint64_t)&v19, (uint64_t *)&unk_25414BA00);
  sub_230F0FBB4();
  v19 = 0x656D614E7473616CLL;
  v20 = 0xE800000000000000;
  v9 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_230F0C79C((uint64_t)&v17, (uint64_t)&v19);
  if (v21)
    swift_dynamicCast();
  else
    sub_230F0EDB0((uint64_t)&v19, (uint64_t *)&unk_25414BA00);
  sub_230F0FBCC();
  sub_230F0FBA8();
  v11 = v10;
  swift_bridgeObjectRelease();
  if (v11 || (sub_230F0FBC0(), v13 = v12, swift_bridgeObjectRelease(), v13))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    v14 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v14 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v14, 1, v4);
}

uint64_t sub_230F0CB14()
{
  uint64_t result;
  uint64_t v1;

  result = sub_230F0FC50();
  qword_25414BB48 = result;
  unk_25414BB50 = v1;
  return result;
}

void sub_230F0CB40(id a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(uint64_t *);
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  void (*v45)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  char *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t *__return_ptr, char **);
  uint64_t v59;
  void (*v60)(uint64_t *);
  uint64_t v61;
  uint64_t v62;
  int v63;
  void (*v64)(char *, uint64_t, uint64_t);
  uint64_t v65;
  void (*v66)(uint64_t *__return_ptr, char **);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  void (*v75)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  id v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  void *v99;
  uint64_t v100;

  sub_230F0D5D0((uint64_t *)&unk_25414B988);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v90 = (char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v89 = (char *)&v83 - v4;
  v5 = sub_230F0D5D0(qword_25414B970);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v83 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v83 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v83 - v15;
  v17 = sub_230F0FBFC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v92 = (char *)&v83 - v22;
  v100 = MEMORY[0x24BEE4AF8];
  v23 = objc_msgSend(a1, sel_identifier);
  if (!v23)
  {
    __break(1u);
    goto LABEL_43;
  }
  v24 = v23;
  v85 = v21;
  v86 = v11;
  v91 = v16;
  v25 = sub_230F0FC50();
  v27 = v26;

  if (qword_25414BAD8 != -1)
    swift_once();
  v87 = (char *)v25;
  v28 = qword_25414BB58;
  v29 = *(char **)(qword_25414BB58 + 16);
  v93 = a1;
  v94 = v27;
  if (v29)
  {
    v84 = v8;
    a1 = a1;
    swift_bridgeObjectRetain();
    v30 = 0;
    v31 = v28 + 40;
    while (1)
    {
      v32 = *(void (**)(uint64_t *))(v31 - 8);
      v96 = (uint64_t)a1;
      swift_bridgeObjectRetain();
      swift_retain();
      v32(&v96);
      swift_bridgeObjectRelease();
      swift_release();
      v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
      v34 = v33(v14, 1, v17);
      sub_230F0D610((uint64_t)v14);
      if (v34 != 1)
        break;
      ++v30;
      v31 += 16;
      if (v29 == v30)
        goto LABEL_11;
    }
    if (v29 == v30)
    {
LABEL_11:

      a1 = v93;
      goto LABEL_12;
    }
    if (v30 >= v29)
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    v60 = *(void (**)(uint64_t *))(v31 - 8);
    v96 = (uint64_t)a1;
    swift_retain();
    v61 = (uint64_t)v86;
    v60(&v96);
    swift_release();

    v62 = (uint64_t)v84;
    sub_230F0D650(v61, (uint64_t)v84);
    v63 = v33((char *)v62, 1, v17);
    v36 = (uint64_t)v91;
    if (v63 != 1)
    {
      v64 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 32);
      v65 = (uint64_t)v85;
      v64(v85, v62, v17);
      sub_230F0D610((uint64_t)v86);
      v64((char *)v36, v65, v17);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v36, 0, 1, v17);

      swift_bridgeObjectRelease();
      a1 = v93;
      goto LABEL_13;
    }
LABEL_43:

    __break(1u);
    goto LABEL_44;
  }
  v35 = a1;
  swift_bridgeObjectRetain();
LABEL_12:
  v36 = (uint64_t)v91;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v91, 1, 1, v17);

  swift_bridgeObjectRelease();
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
LABEL_13:
  if (v33((char *)v36, 1, v17) == 1)
  {
    sub_230F0D610(v36);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v92, v36, v17);
    v96 = 0x3A656D616ELL;
    v97 = (char *)0xE500000000000000;
    v37 = (uint64_t)v87;
    sub_230F0FC68();
    v86 = (char *)v96;
    v91 = v97;
    if (qword_25414BAC0 != -1)
      swift_once();
    v38 = unk_25414BB50;
    v85 = (char *)qword_25414BB48;
    v39 = v88;
    v40 = v88 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
    v41 = sub_230F0FC38();
    v42 = *(_QWORD *)(v41 - 8);
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 16);
    v44 = (uint64_t)v89;
    v43(v89, v40, v41);
    v45 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56);
    v45(v44, 0, 1, v41);
    v46 = (uint64_t)v90;
    v43(v90, v39 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate, v41);
    v45(v46, 0, 1, v41);
    v47 = objc_allocWithZone(MEMORY[0x24BE19188]);
    swift_bridgeObjectRetain();
    v48 = v94;
    swift_bridgeObjectRetain();
    v49 = sub_230F0D6C8((uint64_t)v85, v38, (uint64_t)v86, (uint64_t)v91, v37, v48, v44, v46);
    v50 = v92;
    v51 = (void *)sub_230F0FBD8();
    v52 = objc_msgSend((id)objc_opt_self(), sel_donationValueWithNameComponents_origin_, v51, v49);

    v53 = v52;
    MEMORY[0x2348C88A8]();
    if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_230F0FC98();
    sub_230F0FCA4();
    sub_230F0FC8C();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v50, v17);
    a1 = v93;
  }
  if (qword_25414BB30 != -1)
    swift_once();
  v54 = qword_25414BBA8;
  v55 = *(_QWORD *)(qword_25414BBA8 + 16);
  if (!v55)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v29 = (char *)a1;
  swift_bridgeObjectRetain();
  v56 = 0;
  v57 = v54 + 40;
  while (1)
  {
    v58 = *(void (**)(uint64_t *__return_ptr, char **))(v57 - 8);
    v95 = v29;
    swift_bridgeObjectRetain();
    swift_retain();
    v58(&v96, &v95);
    swift_bridgeObjectRelease();
    swift_release();
    v59 = (uint64_t)v97;
    sub_230F0D698(v96, (uint64_t)v97);
    if (v59)
      break;
    ++v56;
    v57 += 16;
    if (v55 == v56)
      goto LABEL_29;
  }
  if (v55 == v56)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  if (v56 >= v55)
    goto LABEL_40;
  v66 = *(void (**)(uint64_t *__return_ptr, char **))(v57 - 8);
  v95 = v29;
  swift_retain();
  v66(&v96, &v95);
  swift_release();

  if (!v97)
  {
LABEL_44:
    __break(1u);
    return;
  }
  v91 = (char *)v96;
  v92 = v98;
  v93 = v99;

  swift_bridgeObjectRelease();
  v96 = 0x3A6C69616D65;
  v97 = (char *)0xE600000000000000;
  v29 = v87;
  sub_230F0FC68();
  v85 = v97;
  v86 = (char *)v96;
  if (qword_25414BAC0 != -1)
LABEL_41:
    swift_once();
  v67 = qword_25414BB48;
  v68 = unk_25414BB50;
  v69 = v88;
  v70 = v88 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
  v71 = sub_230F0FC38();
  v72 = *(_QWORD *)(v71 - 8);
  v73 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
  v74 = (uint64_t)v89;
  v73(v89, v70, v71);
  v75 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v72 + 56);
  v75(v74, 0, 1, v71);
  v76 = v69 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate;
  v77 = (uint64_t)v90;
  v73(v90, v76, v71);
  v75(v77, 0, 1, v71);
  objc_allocWithZone(MEMORY[0x24BE19188]);
  swift_bridgeObjectRetain();
  v78 = sub_230F0D6C8(v67, v68, (uint64_t)v86, (uint64_t)v85, (uint64_t)v29, v94, v74, v77);
  v79 = (void *)sub_230F0FC44();
  swift_bridgeObjectRelease();
  v80 = (void *)sub_230F0FC44();
  swift_bridgeObjectRelease();
  v81 = objc_msgSend((id)objc_opt_self(), sel_donationValueWithEmailAddress_label_origin_, v79, v80, v78);

  v82 = v81;
  MEMORY[0x2348C88A8]();
  if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_230F0FC98();
  sub_230F0FCA4();
  sub_230F0FC8C();

}

id sub_230F0D478()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_230F0D520()
{
  return type metadata accessor for AccountPropertyParser();
}

uint64_t type metadata accessor for AccountPropertyParser()
{
  uint64_t result;

  result = qword_25414B998;
  if (!qword_25414B998)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_230F0D564()
{
  uint64_t result;
  unint64_t v1;

  result = sub_230F0FC38();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_230F0D5D0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348C8ADC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230F0D610(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_230F0D5D0(qword_25414B970);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230F0D650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_230F0D5D0(qword_25414B970);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_230F0D698(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_230F0D6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  void *v19;
  id v20;

  v9 = v8;
  v12 = (void *)sub_230F0FC44();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_230F0FC44();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_230F0FC44();
  swift_bridgeObjectRelease();
  v15 = sub_230F0FC38();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  v18 = 0;
  if (v17(a7, 1, v15) != 1)
  {
    v18 = (void *)sub_230F0FC14();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a7, v15);
  }
  if (v17(a8, 1, v15) == 1)
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)sub_230F0FC14();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a8, v15);
  }
  v20 = objc_msgSend(v9, sel_initWithBundleIdentifier_donationIdentifier_clusterIdentifier_donationDate_expirationDate_, v12, v13, v14, v18, v19);

  return v20;
}

id sub_230F0D824(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_230F0FCD4();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_230F0FCD4();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x2348C88F0](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x2348C88F0](0, v2);
LABEL_21:
    v14 = v13;
    sub_230F0E114();
    v15 = sub_230F0FCB0();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x2348C88F0](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x2348C88F0](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_230F0FCB0();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_230F0FCB0();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

id sub_230F0DB9C()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_pluginUnloaded);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_230F0DC78(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t type metadata accessor for Plugin()
{
  return objc_opt_self();
}

id sub_230F0DCE8(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger;
  v4 = (void *)objc_opt_self();
  v5 = v1;
  v6 = objc_msgSend(objc_msgSend(v4, sel_defaultProvider), sel_accountLogger);
  swift_unknownObjectRelease();
  *(_QWORD *)&v1[v3] = v6;
  *(_QWORD *)&v5[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_store] = a1;
  v7 = a1;
  objc_msgSend((id)swift_unknownObjectRetain(), sel_pluginLoaded);
  swift_unknownObjectRelease();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_230F0DDC4(id a1, id a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  objc_class *v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  id v17;
  void (*v18)(char *, uint64_t);
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  char *v25;
  objc_super v26;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_230F0FC38();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  if (a1)
  {
    v13 = *(void **)&v2[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger];
    if (a2)
    {
      objc_msgSend(v13, sel_accountChanged_, a1);
      a2 = a2;
      a1 = a1;
      sub_230F0FC2C();
      sub_230F0FC20();
      v14 = (objc_class *)type metadata accessor for AccountPropertyParser();
      v15 = (char *)objc_allocWithZone(v14);
      v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      v16(&v15[OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate], v12, v6);
      v16(&v15[OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate], v10, v6);
      v26.receiver = v15;
      v26.super_class = v14;
      v17 = objc_msgSendSuper2(&v26, sel_init);
      v18 = *(void (**)(char *, uint64_t))(v7 + 8);
      v18(v10, v6);
      v18(v12, v6);
      sub_230F0CB40(a2);
      v20 = v19;
      sub_230F0CB40(a1);
      LOBYTE(v18) = sub_230F0D824(v20, v21);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
        goto LABEL_9;
LABEL_7:
      objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_accountsDidNotChange);
      return;
    }
    objc_msgSend(v13, sel_accountAdded_, a1);
  }
  else
  {
    if (!a2)
      goto LABEL_7;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_accountRemoved_, a2);
  }
LABEL_9:
  v22 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_store], sel_changeFromAccount_toAccount_, a2, a1);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v3;
  aBlock[4] = sub_230F0E0AC;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_230F0DC78;
  aBlock[3] = &unk_24FFACE40;
  v24 = _Block_copy(aBlock);
  v25 = v3;
  swift_release();
  objc_msgSend(v22, sel_addFailureBlock_, v24);
  _Block_release(v24);

}

uint64_t sub_230F0E088()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_230F0E0AC()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger);
  v2 = (id)sub_230F0FC08();
  objc_msgSend(v1, sel_donationFailedWithError_, v2);

}

uint64_t sub_230F0E0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230F0E10C()
{
  return swift_release();
}

unint64_t sub_230F0E114()
{
  unint64_t result;

  result = qword_25414B9E8;
  if (!qword_25414B9E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25414B9E8);
  }
  return result;
}

uint64_t sub_230F0E150()
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

  sub_230F0D5D0(&qword_25414B9F0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230F10050;
  *(_QWORD *)(v0 + 32) = sub_230F0E328;
  *(_QWORD *)(v0 + 40) = 0;
  if (qword_25414BAD0 != -1)
    swift_once();
  v2 = qword_25414B9B8;
  v1 = unk_25414B9C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_QWORD *)(v0 + 48) = sub_230F0ED20;
  *(_QWORD *)(v0 + 56) = v3;
  v4 = qword_25414BAC8;
  swift_retain();
  if (v4 != -1)
    swift_once();
  v6 = qword_25414B9A8;
  v5 = unk_25414B9B0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  *(_QWORD *)(v0 + 64) = sub_230F0EF78;
  *(_QWORD *)(v0 + 72) = v7;
  v8 = qword_25414BAF0;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v10 = qword_25414B9D8;
  v9 = unk_25414B9E0;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v9;
  *(_QWORD *)(v0 + 80) = sub_230F0EF78;
  *(_QWORD *)(v0 + 88) = v11;
  v12 = qword_25414BAE8;
  swift_retain();
  if (v12 != -1)
    swift_once();
  v14 = qword_25414B9C8;
  v13 = unk_25414B9D0;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  *(_QWORD *)(v0 + 96) = sub_230F0EF78;
  *(_QWORD *)(v0 + 104) = v15;
  qword_25414BB58 = v0;
  return swift_retain();
}

uint64_t sub_230F0E328@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_230F0C7E4(*a1, a2);
}

_QWORD *sub_230F0E330()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyNameParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000012;
  result[4] = 0x8000000230F10260;
  qword_25414B9B8 = (uint64_t)sub_230F0EF8C;
  unk_25414B9C0 = result;
  return result;
}

uint64_t sub_230F0E398()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for AccountPropertyNameParser();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v0;
  strcpy((char *)(result + 24), "FullUserName");
  *(_BYTE *)(result + 37) = 0;
  *(_WORD *)(result + 38) = -5120;
  qword_25414B9A8 = (uint64_t)sub_230F0EF6C;
  unk_25414B9B0 = result;
  return result;
}

uint64_t sub_230F0E404@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  id v6;
  uint64_t v7;
  uint64_t v9;
  _OWORD v10[2];
  _QWORD v11[4];

  v11[0] = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  v6 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v6)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_230F0C79C((uint64_t)v10, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast())
      v7 = v9;
    else
      v7 = 0;
  }
  else
  {
    sub_230F0EDB0((uint64_t)v11, (uint64_t *)&unk_25414BA00);
    v7 = 0;
  }
  sub_230F0E51C(v7, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_230F0E51C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_230F0FBFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  v8 = (void *)objc_opt_self();
  v9 = (void *)sub_230F0FC44();
  v10 = objc_msgSend(v8, sel_componentsFromString_, v9);

  sub_230F0FBE4();
  sub_230F0FBA8();
  v12 = v11;
  swift_bridgeObjectRelease();
  if (v12 || (sub_230F0FBC0(), v14 = v13, swift_bridgeObjectRelease(), v14))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
}

_QWORD *sub_230F0E690()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyNameParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = 0xD000000000000014;
  result[3] = 0x8000000230F10240;
  result[4] = v0;
  result[5] = 0xD000000000000012;
  result[6] = 0x8000000230F10260;
  qword_25414B9D8 = (uint64_t)sub_230F0ED48;
  unk_25414B9E0 = result;
  return result;
}

_QWORD *sub_230F0E710()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyNameParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = 0xD000000000000010;
  result[3] = 0x8000000230F10220;
  result[4] = v0;
  result[5] = 0x656D614E6C6C7546;
  result[6] = 0xE800000000000000;
  qword_25414B9C8 = (uint64_t)sub_230F0ED48;
  unk_25414B9D0 = result;
  return result;
}

uint64_t sub_230F0E790@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  void *v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t, uint64_t);
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;

  v12 = sub_230F0FBFC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v50 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_230F0D5D0(qword_25414B970);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v54[0] = a2;
  *((_QWORD *)&v54[0] + 1) = a3;
  swift_bridgeObjectRetain();
  v18 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v18)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v54, 0, sizeof(v54));
  }
  sub_230F0C79C((uint64_t)v54, (uint64_t)&v55);
  if (!*((_QWORD *)&v56 + 1))
  {
    sub_230F0EDB0((uint64_t)&v55, (uint64_t *)&unk_25414BA00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a6, 1, 1, v12);
  }
  sub_230F0D5D0(&qword_255EABEB8);
  v19 = MEMORY[0x24BEE4AD8] + 8;
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a6, 1, 1, v12);
  v47 = a6;
  v48 = v19;
  v21 = 0;
  v22 = v53;
  v23 = *(_QWORD *)(v53 + 64);
  v51 = v53 + 64;
  v24 = 1 << *(_BYTE *)(v53 + 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v26 = v25 & v23;
  v52 = (unint64_t)(v24 + 63) >> 6;
  v49 = a4;
  while (1)
  {
    if (v26)
    {
      v27 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      v28 = v27 | (v21 << 6);
      goto LABEL_29;
    }
    v29 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v29 >= v52)
      goto LABEL_43;
    v30 = *(_QWORD *)(v51 + 8 * v29);
    ++v21;
    if (!v30)
    {
      v21 = v29 + 1;
      if (v29 + 1 >= v52)
        goto LABEL_43;
      v30 = *(_QWORD *)(v51 + 8 * v21);
      if (!v30)
      {
        v21 = v29 + 2;
        if (v29 + 2 >= v52)
          goto LABEL_43;
        v30 = *(_QWORD *)(v51 + 8 * v21);
        if (!v30)
          break;
      }
    }
LABEL_28:
    v26 = (v30 - 1) & v30;
    v28 = __clz(__rbit64(v30)) + (v21 << 6);
LABEL_29:
    v32 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v28);
    if (!*(_QWORD *)(v32 + 16))
    {
      v55 = 0u;
      v56 = 0u;
LABEL_10:
      sub_230F0EDB0((uint64_t)&v55, (uint64_t *)&unk_25414BA00);
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v17, 1, 1, v12);
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = sub_230F0ED4C(a4, a5);
    if ((v34 & 1) != 0)
    {
      sub_230F0EDEC(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v55);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v56 + 1))
      goto LABEL_10;
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_11;
    v35 = (void *)objc_opt_self();
    v36 = (void *)sub_230F0FC44();
    v37 = objc_msgSend(v35, sel_componentsFromString_, v36);

    sub_230F0FBE4();
    v38 = v50;
    sub_230F0FBA8();
    v40 = v39;
    swift_bridgeObjectRelease();
    if (v40 || (sub_230F0FBC0(), v42 = v41, swift_bridgeObjectRelease(), v42))
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v38, v12);
      v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
      v43(v17, 0, 1, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v38, v12);
      v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
      v43(v17, 1, 1, v12);
    }
    swift_bridgeObjectRelease();
    v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v17, 1, v12);
    a4 = v49;
    if (v44 != 1)
    {
      swift_release();
      v45 = v47;
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v47, v17, v12);
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v43)(v45, 0, 1, v12);
    }
LABEL_12:
    result = sub_230F0EDB0((uint64_t)v17, qword_25414B970);
  }
  v31 = v29 + 3;
  if (v31 >= v52)
  {
LABEL_43:
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v47, 1, 1, v12);
  }
  v30 = *(_QWORD *)(v51 + 8 * v31);
  if (v30)
  {
    v21 = v31;
    goto LABEL_28;
  }
  while (1)
  {
    v21 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v21 >= v52)
      goto LABEL_43;
    v30 = *(_QWORD *)(v51 + 8 * v21);
    ++v31;
    if (v30)
      goto LABEL_28;
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_230F0ECA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyNameParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AccountPropertyNameParser()
{
  return objc_opt_self();
}

uint64_t sub_230F0ECFC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230F0ED20(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_230F0ED4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230F0FCF8();
  sub_230F0FC5C();
  v4 = sub_230F0FD04();
  return sub_230F0EE28(a1, a2, v4);
}

uint64_t sub_230F0EDB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_230F0D5D0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230F0EDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_230F0EE28(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_230F0FCE0() & 1) == 0)
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
      while (!v14 && (sub_230F0FCE0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_230F0EF0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_230F0EF38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_230F0E790(a1, v2[2], v2[3], v2[5], v2[6], a2);
}

uint64_t sub_230F0EF48()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_230F0EF6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_230F0E404(a1, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_230F0EF90()
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

  sub_230F0D5D0(&qword_25414B9F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_230F10080;
  *(_QWORD *)(v0 + 32) = sub_230F0F174;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = sub_230F0F180;
  *(_QWORD *)(v0 + 56) = 0;
  if (qword_25414BB20 != -1)
    swift_once();
  v2 = qword_25414BB98;
  v1 = unk_25414BBA0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_QWORD *)(v0 + 64) = sub_230F0FAE8;
  *(_QWORD *)(v0 + 72) = v3;
  v4 = qword_25414BB08;
  swift_retain();
  if (v4 != -1)
    swift_once();
  v6 = qword_25414BB78;
  v5 = unk_25414BB80;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  *(_QWORD *)(v0 + 80) = sub_230F0FAE8;
  *(_QWORD *)(v0 + 88) = v7;
  v8 = qword_25414BB00;
  swift_retain();
  if (v8 != -1)
    swift_once();
  v10 = qword_25414BB68;
  v9 = unk_25414BB70;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v9;
  *(_QWORD *)(v0 + 96) = sub_230F0FAE8;
  *(_QWORD *)(v0 + 104) = v11;
  v12 = qword_25414BB18;
  swift_retain();
  if (v12 != -1)
    swift_once();
  v14 = qword_25414BB88;
  v13 = unk_25414BB90;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  *(_QWORD *)(v0 + 112) = sub_230F0FAE8;
  *(_QWORD *)(v0 + 120) = v15;
  qword_25414BBA8 = v0;
  return swift_retain();
}

uint64_t sub_230F0F174@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_230F0F18C(a1, (uint64_t (*)(_QWORD))sub_230F0F290, a2);
}

uint64_t sub_230F0F180@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_230F0F18C(a1, (uint64_t (*)(_QWORD))sub_230F0F43C, a2);
}

uint64_t sub_230F0F18C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = a2(*a1);
  *a3 = result;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

void sub_230F0F1B8()
{
  qword_25414BB60 = (uint64_t)&unk_24FFACD60;
}

uint64_t sub_230F0F1CC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_230F0FCE0();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_230F0FCE0() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_230F0F290(void *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v2 = objc_msgSend(a1, sel_accountType);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_identifier);

    if (v4)
    {
      v5 = sub_230F0FC50();
      v7 = v6;

      if (qword_25414BAF8 != -1)
        swift_once();
      v8 = sub_230F0F1CC(v5, v7, (_QWORD *)qword_25414BB60);
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 0;
    }
  }
  v9 = objc_msgSend(a1, sel_username);
  if (!v9)
    return 0;
  v10 = v9;
  sub_230F0FC50();

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19258]), sel_init);
  v12 = (void *)sub_230F0FC44();
  v13 = objc_msgSend(v11, sel_firstEmailAddressInString_, v12);

  if (!v13)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v14 = sub_230F0FC50();
  swift_bridgeObjectRelease();

  sub_230F0FC50();
  return v14;
}

uint64_t sub_230F0F43C(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[24];
  uint64_t v10;

  strcpy((char *)&v7, "primaryEmail");
  BYTE13(v7) = 0;
  HIWORD(v7) = -5120;
  v2 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  sub_230F0C79C((uint64_t)&v7, (uint64_t)v9);
  if (v10)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = v6;
      *(_QWORD *)&v7 = 0x6449656C707061;
      *((_QWORD *)&v7 + 1) = 0xE700000000000000;
      v4 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
      swift_unknownObjectRelease();
      if (v4)
      {
        sub_230F0FCBC();
        swift_unknownObjectRelease();
      }
      else
      {
        v7 = 0u;
        v8 = 0u;
      }
      sub_230F0C79C((uint64_t)&v7, (uint64_t)v9);
      if (v10)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        sub_230F0FB4C((uint64_t)v9);
      }
      if ((sub_230F0FC74() & 1) == 0)
      {
        sub_230F0FC50();
        return v3;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_230F0FB4C((uint64_t)v9);
  }
  return 0;
}

_QWORD *sub_230F0F654()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyEmailParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000014;
  result[4] = 0x8000000230F10300;
  qword_25414BB98 = (uint64_t)sub_230F0FB8C;
  unk_25414BBA0 = result;
  return result;
}

_QWORD *sub_230F0F6BC()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyEmailParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = v0;
  result[3] = 0x656D614E72657375;
  result[4] = 0xE800000000000000;
  qword_25414BB78 = (uint64_t)sub_230F0FB8C;
  unk_25414BB80 = result;
  return result;
}

_QWORD *sub_230F0F720()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyEmailParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000011;
  result[4] = 0x8000000230F102E0;
  qword_25414BB68 = (uint64_t)sub_230F0FB8C;
  unk_25414BB70 = result;
  return result;
}

_QWORD *sub_230F0F788()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for AccountPropertyEmailParser();
  result = (_QWORD *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000015;
  result[4] = 0x8000000230F102C0;
  qword_25414BB88 = (uint64_t)sub_230F0FB40;
  unk_25414BB90 = result;
  return result;
}

uint64_t sub_230F0F7F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  _OWORD v20[2];
  _BYTE v21[24];
  uint64_t v22;

  v7 = objc_msgSend(a1, sel_accountType);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_identifier);

    if (v9)
    {
      v10 = sub_230F0FC50();
      v12 = v11;

      if (qword_25414BAF8 != -1)
        swift_once();
      v13 = sub_230F0F1CC(v10, v12, (_QWORD *)qword_25414BB60);
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        return 0;
    }
  }
  *(_QWORD *)&v20[0] = a3;
  *((_QWORD *)&v20[0] + 1) = a4;
  swift_bridgeObjectRetain();
  v14 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_230F0FCEC());
  swift_unknownObjectRelease();
  if (v14)
  {
    sub_230F0FCBC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_230F0C79C((uint64_t)v20, (uint64_t)v21);
  if (!v22)
  {
    sub_230F0FB4C((uint64_t)v21);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19258]), sel_init);
  v16 = (void *)sub_230F0FC44();
  v17 = objc_msgSend(v15, sel_firstEmailAddressInString_, v16);

  if (!v17)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v18 = sub_230F0FC50();
  swift_bridgeObjectRelease();

  sub_230F0FC50();
  return v18;
}

id sub_230F0FA70()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyEmailParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AccountPropertyEmailParser()
{
  return objc_opt_self();
}

uint64_t sub_230F0FAC4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230F0FAEC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

uint64_t sub_230F0FB1C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_230F0FB40(void *a1)
{
  uint64_t *v1;

  return sub_230F0F7F0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_230F0FB4C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_230F0D5D0((uint64_t *)&unk_25414BA00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230F0FBA8()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_230F0FBB4()
{
  return MEMORY[0x24BDCCB28]();
}

uint64_t sub_230F0FBC0()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_230F0FBCC()
{
  return MEMORY[0x24BDCCB38]();
}

uint64_t sub_230F0FBD8()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_230F0FBE4()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_230F0FBF0()
{
  return MEMORY[0x24BDCCC00]();
}

uint64_t sub_230F0FBFC()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_230F0FC08()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_230F0FC14()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_230F0FC20()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_230F0FC2C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_230F0FC38()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_230F0FC44()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230F0FC50()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230F0FC5C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230F0FC68()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_230F0FC74()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_230F0FC80()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_230F0FC8C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_230F0FC98()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_230F0FCA4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_230F0FCB0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_230F0FCBC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_230F0FCC8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_230F0FCD4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_230F0FCE0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230F0FCEC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_230F0FCF8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230F0FD04()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


uint64_t sub_232DBB358(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v1 = objc_msgSend(a1, sel_sourceName);
  if (v1)
  {
    v2 = v1;
    v3 = sub_232DBD14C();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  sub_232DBD0E0();
  v6 = sub_232DBD0D4();
  if (v5)
  {
    if (v3 == v6 && v5 == v7)
      v8 = 1;
    else
      v8 = sub_232DBD1D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

id sub_232DBB4D4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourAwardPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SeymourAwardPlugin()
{
  return objc_opt_self();
}

id sub_232DBB550(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  id v4;
  id v5;
  id v6;

  v4 = objc_allocWithZone((Class)a3(0));
  v5 = a1;
  v6 = objc_msgSend(v4, sel_init);

  return v6;
}

id sub_232DBB5A0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  objc_class *v6;
  _QWORD v8[2];
  uint64_t v9;
  objc_super v10;
  uint64_t v11;

  v1 = sub_232DBD17C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232DBD170();
  MEMORY[0x24BDAC7A8]();
  sub_232DBD134();
  MEMORY[0x24BDAC7A8]();
  v9 = OBJC_IVAR____TtC19SeymourAwardsPlugin21AwardProgressProvider_queue;
  v8[0] = sub_232DBBD3C(0, &qword_254235FC0);
  v5 = v0;
  sub_232DBD128();
  v11 = MEMORY[0x24BEE4AF8];
  sub_232DBBE20();
  sub_232DBBCFC(&qword_254235F88);
  sub_232DBBE68();
  sub_232DBD1AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  *(_QWORD *)(v8[1] + v9) = sub_232DBD194();

  v6 = (objc_class *)type metadata accessor for AwardProgressProvider();
  v10.receiver = v5;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

id sub_232DBB798()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AwardProgressProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AwardProgressProvider()
{
  return objc_opt_self();
}

char *sub_232DBB898(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_232DBB8B4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_232DBB8B4(char *result, int64_t a2, char a3, char *a4)
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
    sub_232DBBCFC((uint64_t *)&unk_254235ED8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_232DBB9B4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *result;
  uint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29[5];

  v2 = sub_232DBD104();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_232DBBCFC(&qword_254235EB8);
  v28 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232DBD0C8();
  sub_232DBBD3C(0, &qword_254235FC0);
  sub_232DBD188();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE87648], v2);
  v29[3] = sub_232DBD0F8();
  v29[4] = MEMORY[0x24BE87608];
  sub_232DBBD74(v29);
  sub_232DBD0EC();
  sub_232DBD11C();
  swift_allocObject();
  sub_232DBD110();
  sub_232DBD188();
  v8 = sub_232DBD0BC();
  if (a1 >> 62)
    goto LABEL_17;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v9)
    {
LABEL_15:
      v22 = v27;
      sub_232DBD0B0();
      swift_release();
      swift_bridgeObjectRelease();
      v23 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_232DBD0A4();
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = 0;
      *(_QWORD *)(v24 + 24) = 0;
      v23(sub_232DBBDDC, v24);
      swift_release();
      swift_release();
      return (char *)(*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v22, v6);
    }
    v29[0] = MEMORY[0x24BEE4AF8];
    result = sub_232DBB898(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0)
      break;
    v25[1] = v8;
    v26 = v6;
    v6 = 0;
    v11 = v29[0];
    v8 = a1 & 0xC000000000000001;
    while (v9 != v6)
    {
      if (v8)
        v12 = (id)MEMORY[0x234928604](v6, a1);
      else
        v12 = *(id *)(a1 + 8 * v6 + 32);
      v13 = v12;
      v14 = a1;
      result = (char *)objc_msgSend(v12, sel_uniqueName);
      if (!result)
        goto LABEL_19;
      v15 = result;
      v16 = sub_232DBD14C();
      v18 = v17;

      v29[0] = v11;
      v20 = *(_QWORD *)(v11 + 16);
      v19 = *(_QWORD *)(v11 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_232DBB898((char *)(v19 > 1), v20 + 1, 1);
        v11 = v29[0];
      }
      ++v6;
      *(_QWORD *)(v11 + 16) = v20 + 1;
      v21 = v11 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v16;
      *(_QWORD *)(v21 + 40) = v18;
      a1 = v14;
      if (v9 == v6)
      {
        v6 = v26;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v9 = sub_232DBD1C4();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_232DBBCFC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234928760]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_232DBBD3C(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_232DBBD74(uint64_t *a1)
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

uint64_t sub_232DBBDB0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_232DBBDDC(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  uint64_t v4;
  char v5;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_BYTE *)(result + 8);
  v4 = *(_QWORD *)result;
  v5 = v3;
  if (v2)
    return v2(&v4);
  return result;
}

unint64_t sub_232DBBE20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254235FB0;
  if (!qword_254235FB0)
  {
    v1 = sub_232DBD170();
    result = MEMORY[0x234928778](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_254235FB0);
  }
  return result;
}

unint64_t sub_232DBBE68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254235F90;
  if (!qword_254235F90)
  {
    v1 = sub_232DBBEB4(&qword_254235F88);
    result = MEMORY[0x234928778](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254235F90);
  }
  return result;
}

uint64_t sub_232DBBEB4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492876C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_232DBBFE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourTemplateAssetSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_232DBC068()
{
  return type metadata accessor for SeymourTemplateAssetSource();
}

uint64_t type metadata accessor for SeymourTemplateAssetSource()
{
  uint64_t result;

  result = qword_254235EC0;
  if (!qword_254235EC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_232DBC0AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_232DBD098();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id sub_232DBC124@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v54 = a2;
  v3 = sub_232DBD098();
  v4 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  v56 = v4;
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v51 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v52 = (char *)&v51 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v51 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v51 - v16;
  result = objc_msgSend(a1, sel_uniqueName);
  if (!result)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v19 = result;
  v20 = sub_232DBD14C();
  v22 = v21;

  v59 = v20;
  v60 = v22;
  v57 = 45;
  v58 = 0xE100000000000000;
  sub_232DBD030();
  v23 = (_QWORD *)sub_232DBD1A0();
  swift_bridgeObjectRelease();
  if (!v23[2])
  {
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v54, 1, 1, v55);
  }
  v25 = v23[4];
  v24 = v23[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v25 == 0xD00000000000001CLL && v24 == 0x8000000232DBD590
    || (sub_232DBD1D0() & 1) != 0
    || v25 == 0xD00000000000001BLL && v24 == 0x8000000232DBD5B0
    || (sub_232DBD1D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_232DBD08C();
    sub_232DBD08C();
    v26 = v56;
    v27 = *(void (**)(char *, uint64_t))(v56 + 8);
    v28 = v15;
    v29 = v55;
    v27(v28, v55);
    result = objc_msgSend(a1, sel_uniqueName);
    if (!result)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v30 = result;
    sub_232DBD14C();

    v31 = v54;
    sub_232DBD08C();
    swift_bridgeObjectRelease();
    v27(v17, v29);
    v32 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56);
    v33 = v31;
  }
  else
  {
    if (v25 == 0xD000000000000027 && v24 == 0x8000000232DBD5D0)
    {
      swift_bridgeObjectRelease();
LABEL_20:
      result = objc_msgSend(a1, sel_uniqueName);
      if (!result)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      v35 = result;
      v36 = sub_232DBD14C();
      v38 = v37;

      v59 = v36;
      v60 = v38;
      v57 = 45;
      v58 = 0xE100000000000000;
      v39 = (_QWORD *)sub_232DBD1A0();
      swift_bridgeObjectRelease();
      v40 = v56;
      if (v39[2] < 3uLL)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v54, 1, 1, v55);
        return (id)swift_bridgeObjectRelease();
      }
      v41 = v39[5];
      v59 = v39[4];
      v60 = v41;
      swift_bridgeObjectRetain();
      result = (id)sub_232DBD158();
      if (v39[2] >= 3uLL)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_232DBD158();
        swift_bridgeObjectRelease();
        v42 = v52;
        sub_232DBD08C();
        sub_232DBD08C();
        v43 = *(void (**)(char *, uint64_t))(v40 + 8);
        v44 = v42;
        v45 = v55;
        v43(v44, v55);
        v46 = v54;
        sub_232DBD08C();
        swift_bridgeObjectRelease();
        v43(v15, v45);
        return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v40 + 56))(v46, 0, 1, v45);
      }
      __break(1u);
      goto LABEL_28;
    }
    v34 = sub_232DBD1D0();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_20;
    v29 = v55;
    v47 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v7, v53 + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_assetsRootBundlePath, v55);
    result = objc_msgSend(a1, sel_uniqueName);
    if (!result)
    {
LABEL_31:
      __break(1u);
      return result;
    }
    v48 = result;
    sub_232DBD14C();

    sub_232DBD08C();
    swift_bridgeObjectRelease();
    v49 = *(void (**)(char *, uint64_t))(v47 + 8);
    v49(v7, v29);
    v50 = v54;
    sub_232DBD08C();
    v49(v10, v29);
    v32 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56);
    v33 = v50;
  }
  return (id)v32(v33, 0, 1, v29);
}

id sub_232DBC734@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  id result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v27 = a2;
  v3 = sub_232DBD098();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v26 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  result = objc_msgSend(a1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
    goto LABEL_22;
  }
  v14 = result;
  v15 = sub_232DBD14C();
  v17 = v16;

  v30 = v15;
  v31 = v17;
  v28 = 45;
  v29 = 0xE100000000000000;
  sub_232DBD030();
  v18 = (_QWORD *)sub_232DBD1A0();
  swift_bridgeObjectRelease();
  if (!v18[2])
  {
    swift_bridgeObjectRelease();
    v21 = 1;
    v22 = v27;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
  v20 = v18[4];
  v19 = v18[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v20 == 0xD00000000000001CLL && v19 == 0x8000000232DBD590
    || (sub_232DBD1D0() & 1) != 0
    || v20 == 0xD00000000000001BLL && v19 == 0x8000000232DBD5B0
    || (sub_232DBD1D0() & 1) != 0
    || v20 == 0xD000000000000027 && v19 == 0x8000000232DBD5D0)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_232DBD08C();
    v22 = v27;
    sub_232DBD08C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
LABEL_13:
    v21 = 0;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
  v23 = sub_232DBD1D0();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
    goto LABEL_12;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v26 + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_assetsRootBundlePath, v3);
  result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    v24 = result;
    sub_232DBD14C();

    sub_232DBD08C();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v4 + 8);
    v25(v7, v3);
    v22 = v27;
    sub_232DBD08C();
    v25(v10, v3);
    goto LABEL_13;
  }
LABEL_22:
  __break(1u);
  return result;
}

id sub_232DBCACC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  char *v17;
  id result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  void *v28;
  char v29;
  char *v30;
  void *v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = sub_232DBD098();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v34 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v34 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - v16;
  result = objc_msgSend(a1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v19 = result;
  v20 = sub_232DBD14C();
  v22 = v21;

  v40 = v20;
  v41 = v22;
  v38 = 45;
  v39 = 0xE100000000000000;
  sub_232DBD030();
  v23 = (_QWORD *)sub_232DBD1A0();
  swift_bridgeObjectRelease();
  if (!v23[2])
  {
    swift_bridgeObjectRelease();
    v26 = 1;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v26, 1, v4);
  }
  v25 = v23[4];
  v24 = v23[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v25 == 0xD00000000000001CLL && v24 == 0x8000000232DBD590
    || (sub_232DBD1D0() & 1) != 0
    || v25 == 0xD00000000000001BLL && v24 == 0x8000000232DBD5B0
    || (sub_232DBD1D0() & 1) != 0
    || v25 == 0xD000000000000027 && v24 == 0x8000000232DBD5D0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v29 = sub_232DBD1D0();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
LABEL_12:
    sub_232DBD08C();
    sub_232DBD08C();
    v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v12, v4);
    result = objc_msgSend(a1, sel_uniqueName);
    if (result)
    {
      v28 = result;
      sub_232DBD14C();

      sub_232DBD08C();
      swift_bridgeObjectRelease();
      v27(v15, v4);
      sub_232DBD08C();
      v27(v17, v4);
LABEL_14:
      v26 = 0;
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v26, 1, v4);
    }
    goto LABEL_23;
  }
  v30 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v35, v37 + OBJC_IVAR____TtC19SeymourAwardsPlugin26SeymourTemplateAssetSource_assetsRootBundlePath, v4);
  result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    v31 = result;
    sub_232DBD14C();

    v32 = v36;
    sub_232DBD08C();
    swift_bridgeObjectRelease();
    v33 = *(void (**)(char *, uint64_t))(v5 + 8);
    v33(v30, v4);
    sub_232DBD08C();
    v33(v32, v4);
    goto LABEL_14;
  }
LABEL_24:
  __break(1u);
  return result;
}

id sub_232DBCF44(void *a1, uint64_t a2, void *a3, void (*a4)(id))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v7 = sub_232DBBCFC(&qword_254235F70);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a1;
  a4(v10);

  v12 = sub_232DBD098();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) != 1)
  {
    v14 = (void *)sub_232DBD080();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
  }
  return v14;
}

unint64_t sub_232DBD030()
{
  unint64_t result;

  result = qword_254235F78;
  if (!qword_254235F78)
  {
    result = MEMORY[0x234928778](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254235F78);
  }
  return result;
}

uint64_t sub_232DBD074()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_232DBD080()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_232DBD08C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_232DBD098()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_232DBD0A4()
{
  return MEMORY[0x24BE8D6E0]();
}

uint64_t sub_232DBD0B0()
{
  return MEMORY[0x24BE85ED8]();
}

uint64_t sub_232DBD0BC()
{
  return MEMORY[0x24BE85EE8]();
}

uint64_t sub_232DBD0C8()
{
  return MEMORY[0x24BE85EF8]();
}

uint64_t sub_232DBD0D4()
{
  return MEMORY[0x24BE87420]();
}

uint64_t sub_232DBD0E0()
{
  return MEMORY[0x24BE87470]();
}

uint64_t sub_232DBD0EC()
{
  return MEMORY[0x24BE87610]();
}

uint64_t sub_232DBD0F8()
{
  return MEMORY[0x24BE87618]();
}

uint64_t sub_232DBD104()
{
  return MEMORY[0x24BE87650]();
}

uint64_t sub_232DBD110()
{
  return MEMORY[0x24BE880A0]();
}

uint64_t sub_232DBD11C()
{
  return MEMORY[0x24BE880B0]();
}

uint64_t sub_232DBD128()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_232DBD134()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_232DBD140()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232DBD14C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232DBD158()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_232DBD164()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_232DBD170()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_232DBD17C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_232DBD188()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_232DBD194()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_232DBD1A0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_232DBD1AC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_232DBD1B8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_232DBD1C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_232DBD1D0()
{
  return MEMORY[0x24BEE3A30]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}


uint64_t FriendshipExpiration.wrapped.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v1 = sub_23B90D91C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  result = 0;
  if (v5 != *MEMORY[0x24BE31F10])
  {
    if (v5 == *MEMORY[0x24BE31F18])
    {
      return 1;
    }
    else if (v5 == *MEMORY[0x24BE31F08])
    {
      return 2;
    }
    else
    {
      result = sub_23B90DF04();
      __break(1u);
    }
  }
  return result;
}

uint64_t FMLFriend.fmlFriend.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
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
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t result;
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

  v38 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A38);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23B90D8A4();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - v7;
  v9 = sub_23B90D88C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23B90DA60();
  v30 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(v1, sel_handle);
  v16 = objc_msgSend(v15, sel_identifier);
  sub_23B90DCF4();

  sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
  v32 = v14;
  sub_23B90DA54();

  v17 = objc_msgSend(v1, sel_handleType);
  if ((unint64_t)v17 >= 5)
    goto LABEL_10;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, **((unsigned int **)&unk_250C9E7F8 + (_QWORD)v17), v9);
  v18 = objc_msgSend(v1, sel_expiry);
  if (v18)
  {
    v19 = v18;
    sub_23B90D868();

    v20 = sub_23B90D874();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, 0, 1, v20);
  }
  else
  {
    v21 = sub_23B90D874();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v8, 1, 1, v21);
  }
  v22 = v31;
  v23 = objc_msgSend(v1, sel_createdAt);
  if (v23)
  {
    v24 = v23;
    sub_23B90D868();

    v25 = sub_23B90D874();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v22, 0, 1, v25);
  }
  else
  {
    v26 = sub_23B90D874();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v22, 1, 1, v26);
  }
  v27 = objc_msgSend(v1, sel_origin);
  if ((unint64_t)v27 >= 3)
  {
LABEL_10:
    result = sub_23B90DF04();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v36, **((unsigned int **)&unk_250C9E820 + (_QWORD)v27), v35);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v37, 1, 1, v33);
    return sub_23B90DA00();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242608B88]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t FMLFriend.init(_:)(uint64_t a1)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  void *v31;
  char *v32;
  unsigned int v33;
  char *v34;
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v2 = sub_23B90D8A4();
  v50 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v49 = (char *)&v45 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v45 - v9;
  v10 = sub_23B90D88C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v45 - v15;
  v17 = sub_23B90DA60();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B90DA0C();
  sub_23B90DA30();
  v21 = *(void (**)(char *, uint64_t))(v18 + 8);
  v22 = a1;
  v21(v20, v17);
  v23 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend((id)objc_opt_self(), sel_handleWithIdentifier_, v23);

  sub_23B90D9E8();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v25 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v14, v10);
  v26 = 0;
  if (v25 != *MEMORY[0x24BE31D40])
  {
    if (v25 == *MEMORY[0x24BE31D48])
    {
      v26 = 1;
    }
    else if (v25 == *MEMORY[0x24BE31D28])
    {
      v26 = 2;
    }
    else if (v25 == *MEMORY[0x24BE31D30])
    {
      v26 = 3;
    }
    else
    {
      if (v25 != *MEMORY[0x24BE31D20])
        goto LABEL_22;
      v26 = 4;
    }
  }
  v45 = v26;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  v27 = v46;
  sub_23B90DA18();
  v28 = sub_23B90D874();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v31 = 0;
  if (v30(v27, 1, v28) != 1)
  {
    v31 = (void *)sub_23B90D850();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v28);
  }
  v32 = v47;
  sub_23B90D9F4();
  v33 = v30(v32, 1, v28);
  v34 = v49;
  if (v33 == 1)
  {
    v35 = 0;
  }
  else
  {
    v35 = (void *)sub_23B90D850();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v28);
  }
  v36 = v50;
  sub_23B90D9D0();
  v37 = v48;
  v38 = v51;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v48, v34, v51);
  v39 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v37, v38);
  if (v39 == *MEMORY[0x24BE31D60])
  {
    v40 = 0;
LABEL_21:
    v41 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    (*(void (**)(char *, uint64_t))(v36 + 8))(v34, v38);
    v42 = objc_msgSend(v41, sel_initWithHandle_handleType_createDate_expiry_origin_originatedFromTheSameClient_, v24, v45, v31, v35, v40, sub_23B90D9DC() & 1);

    v43 = sub_23B90DA24();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 8))(v22, v43);
    return (uint64_t)v42;
  }
  if (v39 == *MEMORY[0x24BE31D68])
  {
    v40 = 1;
    goto LABEL_21;
  }
  if (v39 == *MEMORY[0x24BE31D80])
  {
    v40 = 2;
    goto LABEL_21;
  }
LABEL_22:
  result = sub_23B90DF04();
  __break(1u);
  return result;
}

uint64_t sub_23B8F0B2C()
{
  sub_23B8F1000(&qword_256A54A70, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910100);
  return sub_23B90DF94();
}

uint64_t sub_23B8F0B6C()
{
  sub_23B8F1000(&qword_256A54A70, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910100);
  return sub_23B90DF88();
}

uint64_t sub_23B8F0BB0()
{
  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  return sub_23B90D7E4();
}

id sub_23B8F0BF0()
{
  id *v0;

  return *v0;
}

uint64_t sub_23B8F0BF8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_23B8F0C00()
{
  return sub_23B90DCF4();
}

uint64_t sub_23B8F0C10()
{
  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  return sub_23B90D820();
}

uint64_t sub_23B8F0C50()
{
  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  return sub_23B90D7FC();
}

uint64_t sub_23B8F0C90(void *a1)
{
  id v2;

  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  v2 = a1;
  return sub_23B90D7F0();
}

uint64_t sub_23B8F0CF4()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_23B90DE5C();

  return v2;
}

uint64_t sub_23B8F0D28()
{
  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  return sub_23B90D814();
}

uint64_t sub_23B8F0D78()
{
  sub_23B90DFAC();
  sub_23B90DCC4();
  return sub_23B90DFB8();
}

_QWORD *sub_23B8F0DD4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23B8F0DE4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23B8F0DF0()
{
  sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
  return sub_23B90D808();
}

BOOL sub_23B8F0E48(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_23B8F0E5C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54AB0);
  v2 = (_QWORD *)sub_23B90DF40();
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
    result = sub_23B9046CC(v5, v6);
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

void type metadata accessor for FMLFriendshipUpdateType(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54A48);
}

void type metadata accessor for FMLLocationShareState(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54A50);
}

void type metadata accessor for FMLSessionError(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54A58);
}

uint64_t sub_23B8F0FA8()
{
  return sub_23B8F1000(&qword_256A54A60, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910018);
}

uint64_t sub_23B8F0FD4()
{
  return sub_23B8F1000(&qword_256A54A68, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910044);
}

uint64_t sub_23B8F1000(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242608BA0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B8F1040()
{
  return sub_23B8F1000(&qword_256A54A70, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910100);
}

uint64_t sub_23B8F106C()
{
  return sub_23B8F1000(&qword_256A54A78, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B9100CC);
}

uint64_t sub_23B8F1098()
{
  return sub_23B8F1000(&qword_256A54A80, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910088);
}

uint64_t sub_23B8F10C4()
{
  return sub_23B8F1000(&qword_256A54A88, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_23B9101EC);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54AD0);
}

uint64_t sub_23B8F1104()
{
  return sub_23B8F1000(&qword_256A54A90, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_23B9101B0);
}

unint64_t sub_23B8F1134()
{
  unint64_t result;

  result = qword_256A54A98;
  if (!qword_256A54A98)
  {
    result = MEMORY[0x242608BA0](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256A54A98);
  }
  return result;
}

uint64_t sub_23B8F1178()
{
  return sub_23B8F1000(&qword_256A54AA0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_23B910228);
}

uint64_t sub_23B8F11A4()
{
  return sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
}

void type metadata accessor for FMLFriendshipExpiration(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54AB8);
}

void type metadata accessor for FMLLocatePriority(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54AC0);
}

void type metadata accessor for FMLHandleType(uint64_t a1)
{
  sub_23B8F120C(a1, &qword_256A54AC8);
}

void sub_23B8F120C(uint64_t a1, unint64_t *a2)
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

uint64_t ObjCBootstrap.sendFriendshipOffer(to:from:end:isFromGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v5 + 280) = a4;
  *(_QWORD *)(v5 + 96) = a3;
  *(_QWORD *)(v5 + 104) = v4;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  *(_QWORD *)(v5 + 112) = swift_getObjectType();
  v6 = sub_23B90D958();
  *(_QWORD *)(v5 + 120) = v6;
  *(_QWORD *)(v5 + 128) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 136) = swift_task_alloc();
  *(_QWORD *)(v5 + 144) = swift_task_alloc();
  *(_QWORD *)(v5 + 152) = swift_task_alloc();
  v7 = sub_23B90D91C();
  *(_QWORD *)(v5 + 160) = v7;
  *(_QWORD *)(v5 + 168) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A38);
  *(_QWORD *)(v5 + 184) = swift_task_alloc();
  v8 = sub_23B90D940();
  *(_QWORD *)(v5 + 192) = v8;
  *(_QWORD *)(v5 + 200) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 208) = swift_task_alloc();
  *(_QWORD *)(v5 + 216) = swift_task_alloc();
  *(_QWORD *)(v5 + 224) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F1370()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 104);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v2;
  *v2 = v0;
  v2[1] = sub_23B8F140C;
  return sub_23B90DF64();
}

uint64_t sub_23B8F140C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F1468()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 248) = v1;
  swift_retain();
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 256) = sub_23B8F21D8(*(_QWORD *)(v0 + 80));
    v3 = *(_QWORD *)(v0 + 184);
    if (v2)
    {
      v4 = objc_msgSend(*(id *)(v0 + 88), sel_identifier);
      sub_23B90DCF4();

      sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
      sub_23B90DA54();
      v5 = sub_23B90DA60();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 0, 1, v5);
    }
    else
    {
      v11 = sub_23B90DA60();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v3, 1, 1, v11);
    }
    v12 = *(_QWORD *)(v0 + 96);
    if (v12 > 2)
    {
      return sub_23B90DF04();
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 104))(*(_QWORD *)(v0 + 176), **((unsigned int **)&unk_250C9F7E8 + v12), *(_QWORD *)(v0 + 160));
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 264) = v13;
      *v13 = v0;
      v13[1] = sub_23B8F17F0;
      return sub_23B90DACC();
    }
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v6 = sub_23B90DC7C();
    __swift_project_value_buffer(v6, (uint64_t)qword_254309678);
    v7 = sub_23B90DC64();
    v8 = sub_23B90DDF0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B8EC000, v7, v8, "Missing FindMyLocate.Session!", v9, 2u);
      MEMORY[0x242608C00](v9, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
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
}

uint64_t sub_23B8F17F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v3 = v2[22];
    v4 = v2[23];
    v7 = v2 + 20;
    v5 = v2[20];
    v6 = v7[1];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    v4 = v2[23];
    (*(void (**)(_QWORD, _QWORD))(v2[21] + 8))(v2[22], v2[20]);
  }
  sub_23B909E6C(v4, &qword_256A54A38);
  return swift_task_switch();
}

uint64_t sub_23B8F18AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(void);
  void (*v63)(uint64_t, uint64_t, uint64_t);
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[2];

  if (qword_2543095D0 != -1)
    goto LABEL_39;
  while (2)
  {
    v2 = v0[27];
    v1 = v0[28];
    v4 = v0[24];
    v3 = v0[25];
    v5 = sub_23B90DC7C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
    v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v63(v2, v1, v4);
    v6 = sub_23B90DC64();
    v7 = sub_23B90DDFC();
    v8 = os_log_type_enabled(v6, v7);
    v9 = v0[27];
    v11 = v0[24];
    v10 = v0[25];
    if (v8)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      v71[0] = v13;
      sub_23B8F1000(&qword_256A54AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31FC8], MEMORY[0x24BE31FD0]);
      v14 = sub_23B90DF58();
      v0[9] = sub_23B904C6C(v14, v15, v71);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v64 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v64(v9, v11);
      _os_log_impl(&dword_23B8EC000, v6, v7, "sendFriendshipOffer result: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v13, -1, -1);
      MEMORY[0x242608C00](v12, -1, -1);
    }
    else
    {
      v64 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v64(v9, v11);
    }

    v16 = v0[16];
    v17 = sub_23B90D934();
    v65 = v17 + 64;
    v18 = -1;
    v19 = -1 << *(_BYTE *)(v17 + 32);
    if (-v19 < 64)
      v18 = ~(-1 << -(char)v19);
    v20 = v18 & *(_QWORD *)(v17 + 64);
    v66 = (unint64_t)(63 - v19) >> 6;
    v68 = *MEMORY[0x24BE31FE0];
    result = swift_bridgeObjectRetain();
    v22 = 0;
    while (v20)
    {
      v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v24 = v23 | (v22 << 6);
LABEL_9:
      v26 = v0[18];
      v25 = v0[19];
      v27 = v0[17];
      v28 = v0[15];
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v25, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v16 + 72) * v24, v28);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v26, v25, v28);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v27, v68, v28);
      LOBYTE(v25) = sub_23B90D94C();
      v29 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v29(v27, v28);
      result = ((uint64_t (*)(uint64_t, uint64_t))v29)(v26, v28);
      if ((v25 & 1) == 0)
      {
        v33 = v0[28];
        v34 = v0[26];
        v35 = v0[24];
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v63(v34, v33, v35);
        v36 = sub_23B90DC64();
        v37 = sub_23B90DDF0();
        v38 = os_log_type_enabled(v36, v37);
        v39 = v0[26];
        if (v38)
        {
          v69 = v0[24];
          v40 = (uint8_t *)swift_slowAlloc();
          v41 = swift_slowAlloc();
          v71[0] = v41;
          *(_DWORD *)v40 = 136315138;
          sub_23B90D934();
          sub_23B90DA60();
          sub_23B8F1000(&qword_256A54AE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
          v42 = sub_23B90DCAC();
          v44 = v43;
          swift_bridgeObjectRelease();
          v0[7] = sub_23B904C6C(v42, v44, v71);
          sub_23B90DE68();
          swift_bridgeObjectRelease();
          v45 = v64;
          v64(v39, v69);
          _os_log_impl(&dword_23B8EC000, v36, v37, "sendFriendshipOffer failed %s", v40, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242608C00](v41, -1, -1);
          MEMORY[0x242608C00](v40, -1, -1);
        }
        else
        {
          v45 = v64;
          v64(v0[26], v0[24]);
        }

        v60 = v0[28];
        v61 = v0[24];
        type metadata accessor for FMLSessionError(0);
        v0[6] = 7;
        sub_23B90481C(MEMORY[0x24BEE4AF8]);
        sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
        sub_23B90D82C();
        swift_willThrow();
        swift_release();
        v45(v60, v61);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v62 = (uint64_t (*)(void))v0[1];
        return v62();
      }
    }
    v30 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
LABEL_39:
      swift_once();
      continue;
    }
    break;
  }
  if (v30 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v30);
  ++v22;
  if (v31)
    goto LABEL_28;
  v22 = v30 + 1;
  if (v30 + 1 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 2;
  if (v30 + 2 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 3;
  if (v30 + 3 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 4;
  if (v30 + 4 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
  {
LABEL_28:
    v20 = (v31 - 1) & v31;
    v24 = __clz(__rbit64(v31)) + (v22 << 6);
    goto LABEL_9;
  }
  v32 = v30 + 5;
  if (v32 >= v66)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v46 = sub_23B90DC64();
    v47 = sub_23B90DDFC();
    v48 = os_log_type_enabled(v46, v47);
    v49 = v0[28];
    v50 = v0[24];
    if (v48)
    {
      v70 = v0[28];
      v51 = (uint8_t *)swift_slowAlloc();
      v67 = v50;
      v52 = swift_slowAlloc();
      v71[0] = v52;
      *(_DWORD *)v51 = 136315138;
      v53 = sub_23B90DA60();
      v54 = swift_bridgeObjectRetain();
      v55 = MEMORY[0x242608570](v54, v53);
      v57 = v56;
      swift_bridgeObjectRelease();
      v0[8] = sub_23B904C6C(v55, v57, v71);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B8EC000, v46, v47, "Successfully sent friendship offer to %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v52, -1, -1);
      MEMORY[0x242608C00](v51, -1, -1);
      swift_release();

      v59 = v67;
      v58 = v70;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      v58 = v49;
      v59 = v50;
    }
    v64(v58, v59);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v62 = (uint64_t (*)(void))v0[1];
    return v62();
  }
  v31 = *(_QWORD *)(v65 + 8 * v32);
  if (v31)
  {
    v22 = v32;
    goto LABEL_28;
  }
  while (1)
  {
    v22 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v22 >= v66)
      goto LABEL_31;
    v31 = *(_QWORD *)(v65 + 8 * v22);
    ++v32;
    if (v31)
      goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B8F213C()
{
  uint64_t v0;

  swift_release();
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

uint64_t sub_23B8F21D8(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  _QWORD v16[2];
  unint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v20 = sub_23B90DA60();
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x24BEE4AF8];
    if (!v7)
      return v8;
    v21 = MEMORY[0x24BEE4AF8];
    result = sub_23B9052AC(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v10 = 0;
    v8 = v21;
    v16[1] = v2;
    v17 = a1 & 0xC000000000000001;
    v18 = v6;
    v19 = a1;
    v11 = v6;
    while (v7 != v10)
    {
      if (v17)
        v12 = (id)MEMORY[0x2426086CC](v10, a1);
      else
        v12 = *(id *)(a1 + 8 * v10 + 32);
      v13 = v12;
      v14 = objc_msgSend(v12, sel_identifier);
      v6 = (char *)sub_23B90DCF4();

      sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
      sub_23B90DA54();

      v21 = v8;
      v2 = *(_QWORD *)(v8 + 16);
      v15 = *(_QWORD *)(v8 + 24);
      if (v2 >= v15 >> 1)
      {
        sub_23B9052AC(v15 > 1, v2 + 1, 1);
        v8 = v21;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v2 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v2, v11, v20);
      a1 = v19;
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v7 = sub_23B90DF10();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B8F253C(int a1, void *a2, uint64_t a3, char a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v11;
  id v12;
  _QWORD *v13;

  v6[2] = a2;
  v6[3] = a6;
  v6[4] = _Block_copy(aBlock);
  sub_23B909DF0(0, &qword_254309590);
  v11 = sub_23B90DD48();
  v6[5] = v11;
  v12 = a2;
  a6;
  v13 = (_QWORD *)swift_task_alloc();
  v6[6] = v13;
  *v13 = v6;
  v13[1] = sub_23B8F2600;
  return ObjCBootstrap.sendFriendshipOffer(to:from:end:isFromGroup:)(v11, (uint64_t)a2, a3, a4);
}

uint64_t sub_23B8F2600()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(*v1 + 16);
  v2 = *(void **)(*v1 + 24);
  v4 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 32);
  if (v0)
  {
    v6 = (void *)sub_23B90D838();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t ObjCBootstrap.sendFriendshipInvite(to:from:isFromGroup:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = v3;
  *(_BYTE *)(v4 + 264) = a3;
  *(_QWORD *)(v4 + 72) = a1;
  *(_QWORD *)(v4 + 96) = swift_getObjectType();
  v5 = sub_23B90D958();
  *(_QWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  *(_QWORD *)(v4 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A38);
  *(_QWORD *)(v4 + 144) = swift_task_alloc();
  v6 = sub_23B90D940();
  *(_QWORD *)(v4 + 152) = v6;
  *(_QWORD *)(v4 + 160) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 168) = swift_task_alloc();
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  *(_QWORD *)(v4 + 184) = swift_task_alloc();
  v7 = sub_23B90DA60();
  *(_QWORD *)(v4 + 192) = v7;
  *(_QWORD *)(v4 + 200) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 208) = swift_task_alloc();
  *(_QWORD *)(v4 + 216) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F27E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 88);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v2;
  *v2 = v0;
  v2[1] = sub_23B8F2880;
  return sub_23B90DF64();
}

uint64_t sub_23B8F2880()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F28DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v11;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 240) = v1;
  swift_retain();
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 80);
    v3 = objc_msgSend(*(id *)(v0 + 72), sel_identifier);
    sub_23B90DCF4();

    sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
    sub_23B90DA54();
    if (v2)
    {
      v4 = objc_msgSend(*(id *)(v0 + 80), sel_identifier);
      sub_23B90DCF4();

      sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
      sub_23B90DA54();
      v5 = 0;
    }
    else
    {
      v5 = 1;
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 200) + 56))(*(_QWORD *)(v0 + 144), v5, 1, *(_QWORD *)(v0 + 192));
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v11;
    *v11 = v0;
    v11[1] = sub_23B8F2BFC;
    return sub_23B90DAE4();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v6 = sub_23B90DC7C();
    __swift_project_value_buffer(v6, (uint64_t)qword_254309678);
    v7 = sub_23B90DC64();
    v8 = sub_23B90DDF0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B8EC000, v7, v8, "Missing FindMyLocate.Session!", v9, 2u);
      MEMORY[0x242608C00](v9, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
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
}

uint64_t sub_23B8F2BFC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 256) = v0;
  swift_task_dealloc();
  sub_23B909E6C(*(_QWORD *)(v2 + 144), &qword_256A54A38);
  return swift_task_switch();
}

uint64_t sub_23B8F2C70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(void);
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79[2];

  if (qword_2543095D0 != -1)
    goto LABEL_39;
  while (2)
  {
    v1 = v0[22];
    v2 = v0[23];
    v4 = v0[19];
    v3 = v0[20];
    v5 = sub_23B90DC7C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
    v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v67(v1, v2, v4);
    v6 = sub_23B90DC64();
    v7 = sub_23B90DDFC();
    v8 = os_log_type_enabled(v6, v7);
    v9 = v0[22];
    v11 = v0[19];
    v10 = v0[20];
    if (v8)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      v79[0] = v13;
      sub_23B8F1000(&qword_256A54AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31FC8], MEMORY[0x24BE31FD0]);
      v14 = sub_23B90DF58();
      v0[8] = sub_23B904C6C(v14, v15, v79);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v16(v9, v11);
      _os_log_impl(&dword_23B8EC000, v6, v7, "sendFriendshipInvite result: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v13, -1, -1);
      MEMORY[0x242608C00](v12, -1, -1);
    }
    else
    {
      v16 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v16(v9, v11);
    }

    v78 = v16;
    v17 = v0[14];
    v18 = sub_23B90D934();
    v69 = v18 + 64;
    v19 = -1;
    v20 = -1 << *(_BYTE *)(v18 + 32);
    if (-v20 < 64)
      v19 = ~(-1 << -(char)v20);
    v21 = v19 & *(_QWORD *)(v18 + 64);
    v71 = (unint64_t)(63 - v20) >> 6;
    v74 = *MEMORY[0x24BE31FE0];
    result = swift_bridgeObjectRetain();
    v23 = 0;
    while (v21)
    {
      v24 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v25 = v24 | (v23 << 6);
LABEL_9:
      v27 = v0[16];
      v26 = v0[17];
      v28 = v0[15];
      v29 = v0[13];
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v17 + 16))(v26, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v17 + 72) * v25, v29);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v27, v26, v29);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 104))(v28, v74, v29);
      LOBYTE(v26) = sub_23B90D94C();
      v30 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v30(v28, v29);
      result = ((uint64_t (*)(uint64_t, uint64_t))v30)(v27, v29);
      if ((v26 & 1) == 0)
      {
        v34 = v0[23];
        v35 = v0[21];
        v36 = v0[19];
        swift_release();
        swift_bridgeObjectRelease();
        v67(v35, v34, v36);
        v37 = sub_23B90DC64();
        v38 = sub_23B90DDF0();
        if (os_log_type_enabled(v37, v38))
        {
          v72 = v0[21];
          v75 = v0[19];
          v39 = (uint8_t *)swift_slowAlloc();
          v40 = swift_slowAlloc();
          v79[0] = v40;
          *(_DWORD *)v39 = 136315138;
          sub_23B90D934();
          sub_23B8F1000(&qword_256A54AE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
          v41 = sub_23B90DCAC();
          v43 = v42;
          swift_bridgeObjectRelease();
          v0[6] = sub_23B904C6C(v41, v43, v79);
          sub_23B90DE68();
          swift_bridgeObjectRelease();
          v78(v72, v75);
          _os_log_impl(&dword_23B8EC000, v37, v38, "sendFriendshipInvitefailed %s", v39, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242608C00](v40, -1, -1);
          MEMORY[0x242608C00](v39, -1, -1);
        }
        else
        {
          v78(v0[21], v0[19]);
        }

        v62 = v0[25];
        v73 = v0[24];
        v77 = v0[27];
        v63 = v0[23];
        v64 = v0[19];
        type metadata accessor for FMLSessionError(0);
        v0[5] = 7;
        sub_23B90481C(MEMORY[0x24BEE4AF8]);
        sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
        sub_23B90D82C();
        swift_willThrow();
        swift_release();
        v78(v63, v64);
        (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v77, v73);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v65 = (uint64_t (*)(void))v0[1];
        return v65();
      }
    }
    v31 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
LABEL_39:
      swift_once();
      continue;
    }
    break;
  }
  if (v31 >= v71)
    goto LABEL_31;
  v32 = *(_QWORD *)(v69 + 8 * v31);
  ++v23;
  if (v32)
    goto LABEL_28;
  v23 = v31 + 1;
  if (v31 + 1 >= v71)
    goto LABEL_31;
  v32 = *(_QWORD *)(v69 + 8 * v23);
  if (v32)
    goto LABEL_28;
  v23 = v31 + 2;
  if (v31 + 2 >= v71)
    goto LABEL_31;
  v32 = *(_QWORD *)(v69 + 8 * v23);
  if (v32)
    goto LABEL_28;
  v23 = v31 + 3;
  if (v31 + 3 >= v71)
    goto LABEL_31;
  v32 = *(_QWORD *)(v69 + 8 * v23);
  if (v32)
    goto LABEL_28;
  v23 = v31 + 4;
  if (v31 + 4 >= v71)
    goto LABEL_31;
  v32 = *(_QWORD *)(v69 + 8 * v23);
  if (v32)
  {
LABEL_28:
    v21 = (v32 - 1) & v32;
    v25 = __clz(__rbit64(v32)) + (v23 << 6);
    goto LABEL_9;
  }
  v33 = v31 + 5;
  if (v33 >= v71)
  {
LABEL_31:
    v45 = v0[26];
    v44 = v0[27];
    v46 = v0[24];
    v47 = v0[25];
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v45, v44, v46);
    v48 = sub_23B90DC64();
    v49 = sub_23B90DDFC();
    v50 = os_log_type_enabled(v48, v49);
    v51 = v0[26];
    v52 = v0[27];
    v53 = v0[24];
    v54 = v0[25];
    v55 = v0[23];
    v56 = v0[19];
    if (v50)
    {
      v76 = v0[19];
      v57 = (uint8_t *)swift_slowAlloc();
      v70 = v52;
      v58 = swift_slowAlloc();
      v79[0] = v58;
      v68 = v55;
      *(_DWORD *)v57 = 136315138;
      sub_23B8F1000(&qword_256A54AF8, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32138]);
      v59 = sub_23B90DF58();
      v0[7] = sub_23B904C6C(v59, v60, v79);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v61 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v61(v51, v53);
      _os_log_impl(&dword_23B8EC000, v48, v49, "Successfully sent friendship invite to %s", v57, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v58, -1, -1);
      MEMORY[0x242608C00](v57, -1, -1);
      swift_release();

      v78(v68, v76);
      v61(v70, v53);
    }
    else
    {

      swift_release();
      v66 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v66(v51, v53);
      v78(v55, v56);
      v66(v52, v53);
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
    v65 = (uint64_t (*)(void))v0[1];
    return v65();
  }
  v32 = *(_QWORD *)(v69 + 8 * v33);
  if (v32)
  {
    v23 = v33;
    goto LABEL_28;
  }
  while (1)
  {
    v23 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v23 >= v71)
      goto LABEL_31;
    v32 = *(_QWORD *)(v69 + 8 * v23);
    ++v33;
    if (v32)
      goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B8F3554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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

uint64_t sub_23B8F3760(void *a1, void *a2, char a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  id v10;
  id v11;
  _QWORD *v12;

  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  v10 = a1;
  v11 = a2;
  a5;
  v12 = (_QWORD *)swift_task_alloc();
  v5[6] = v12;
  *v12 = v5;
  v12[1] = sub_23B8F37FC;
  return ObjCBootstrap.sendFriendshipInvite(to:from:isFromGroup:)((uint64_t)v10, (uint64_t)a2, a3);
}

uint64_t sub_23B8F37FC()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(*v1 + 24);
  v2 = *(void **)(*v1 + 32);
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  v6 = *(_QWORD *)(v5 + 40);
  if (v0)
  {
    v7 = (void *)sub_23B90D838();

    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 40), 0);
  }
  _Block_release(*(const void **)(v5 + 40));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t ObjCBootstrap.stopSharingLocation(with:from:isFromGroup:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 96) = v3;
  *(_BYTE *)(v4 + 248) = a3;
  *(_QWORD *)(v4 + 80) = a1;
  *(_QWORD *)(v4 + 104) = swift_getObjectType();
  v5 = sub_23B90D958();
  *(_QWORD *)(v4 + 112) = v5;
  *(_QWORD *)(v4 + 120) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  *(_QWORD *)(v4 + 136) = swift_task_alloc();
  *(_QWORD *)(v4 + 144) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A38);
  *(_QWORD *)(v4 + 152) = swift_task_alloc();
  v6 = sub_23B90D940();
  *(_QWORD *)(v4 + 160) = v6;
  *(_QWORD *)(v4 + 168) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  *(_QWORD *)(v4 + 184) = swift_task_alloc();
  *(_QWORD *)(v4 + 192) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F39A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 96);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v2;
  *v2 = v0;
  v2[1] = sub_23B8F3A44;
  return sub_23B90DF64();
}

uint64_t sub_23B8F3A44()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F3AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  _QWORD *v12;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 216) = v1;
  swift_retain();
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 224) = sub_23B8F21D8(*(_QWORD *)(v0 + 80));
    v3 = *(_QWORD *)(v0 + 152);
    if (v2)
    {
      v4 = objc_msgSend(*(id *)(v0 + 88), sel_identifier);
      sub_23B90DCF4();

      sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
      sub_23B90DA54();
      v5 = sub_23B90DA60();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 0, 1, v5);
    }
    else
    {
      v11 = sub_23B90DA60();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v3, 1, 1, v11);
    }
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v12;
    *v12 = v0;
    v12[1] = sub_23B8F3D7C;
    return sub_23B90DA90();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v6 = sub_23B90DC7C();
    __swift_project_value_buffer(v6, (uint64_t)qword_254309678);
    v7 = sub_23B90DC64();
    v8 = sub_23B90DDF0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B8EC000, v7, v8, "Missing FindMyLocate.Session!", v9, 2u);
      MEMORY[0x242608C00](v9, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8F3D7C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 240) = v0;
  swift_task_dealloc();
  sub_23B909E6C(*(_QWORD *)(v2 + 152), &qword_256A54A38);
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B8F3E0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(void);
  void (*v63)(uint64_t, uint64_t, uint64_t);
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[2];

  if (qword_2543095D0 != -1)
    goto LABEL_39;
  while (2)
  {
    v2 = v0[23];
    v1 = v0[24];
    v4 = v0[20];
    v3 = v0[21];
    v5 = sub_23B90DC7C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
    v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v63(v2, v1, v4);
    v6 = sub_23B90DC64();
    v7 = sub_23B90DDFC();
    v8 = os_log_type_enabled(v6, v7);
    v9 = v0[23];
    v11 = v0[20];
    v10 = v0[21];
    if (v8)
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      v71[0] = v13;
      sub_23B8F1000(&qword_256A54AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31FC8], MEMORY[0x24BE31FD0]);
      v14 = sub_23B90DF58();
      v0[9] = sub_23B904C6C(v14, v15, v71);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v64 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v64(v9, v11);
      _os_log_impl(&dword_23B8EC000, v6, v7, "stopSharingLocation result: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v13, -1, -1);
      MEMORY[0x242608C00](v12, -1, -1);
    }
    else
    {
      v64 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v64(v9, v11);
    }

    v16 = v0[15];
    v17 = sub_23B90D934();
    v65 = v17 + 64;
    v18 = -1;
    v19 = -1 << *(_BYTE *)(v17 + 32);
    if (-v19 < 64)
      v18 = ~(-1 << -(char)v19);
    v20 = v18 & *(_QWORD *)(v17 + 64);
    v66 = (unint64_t)(63 - v19) >> 6;
    v68 = *MEMORY[0x24BE31FE0];
    result = swift_bridgeObjectRetain();
    v22 = 0;
    while (v20)
    {
      v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v24 = v23 | (v22 << 6);
LABEL_9:
      v26 = v0[17];
      v25 = v0[18];
      v27 = v0[16];
      v28 = v0[14];
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v25, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v16 + 72) * v24, v28);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v26, v25, v28);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v27, v68, v28);
      LOBYTE(v25) = sub_23B90D94C();
      v29 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v29(v27, v28);
      result = ((uint64_t (*)(uint64_t, uint64_t))v29)(v26, v28);
      if ((v25 & 1) == 0)
      {
        v33 = v0[24];
        v34 = v0[22];
        v35 = v0[20];
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v63(v34, v33, v35);
        v36 = sub_23B90DC64();
        v37 = sub_23B90DDF0();
        v38 = os_log_type_enabled(v36, v37);
        v39 = v0[22];
        if (v38)
        {
          v69 = v0[20];
          v40 = (uint8_t *)swift_slowAlloc();
          v41 = swift_slowAlloc();
          v71[0] = v41;
          *(_DWORD *)v40 = 136315138;
          sub_23B90D934();
          sub_23B90DA60();
          sub_23B8F1000(&qword_256A54AE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE32118], MEMORY[0x24BE32128]);
          v42 = sub_23B90DCAC();
          v44 = v43;
          swift_bridgeObjectRelease();
          v0[7] = sub_23B904C6C(v42, v44, v71);
          sub_23B90DE68();
          swift_bridgeObjectRelease();
          v45 = v64;
          v64(v39, v69);
          _os_log_impl(&dword_23B8EC000, v36, v37, "stopSharingLocationFailed %s", v40, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242608C00](v41, -1, -1);
          MEMORY[0x242608C00](v40, -1, -1);
        }
        else
        {
          v45 = v64;
          v64(v0[22], v0[20]);
        }

        v60 = v0[24];
        v61 = v0[20];
        type metadata accessor for FMLSessionError(0);
        v0[6] = 7;
        sub_23B90481C(MEMORY[0x24BEE4AF8]);
        sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
        sub_23B90D82C();
        swift_willThrow();
        swift_release();
        v45(v60, v61);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v62 = (uint64_t (*)(void))v0[1];
        return v62();
      }
    }
    v30 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
LABEL_39:
      swift_once();
      continue;
    }
    break;
  }
  if (v30 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v30);
  ++v22;
  if (v31)
    goto LABEL_28;
  v22 = v30 + 1;
  if (v30 + 1 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 2;
  if (v30 + 2 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 3;
  if (v30 + 3 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
    goto LABEL_28;
  v22 = v30 + 4;
  if (v30 + 4 >= v66)
    goto LABEL_31;
  v31 = *(_QWORD *)(v65 + 8 * v22);
  if (v31)
  {
LABEL_28:
    v20 = (v31 - 1) & v31;
    v24 = __clz(__rbit64(v31)) + (v22 << 6);
    goto LABEL_9;
  }
  v32 = v30 + 5;
  if (v32 >= v66)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v46 = sub_23B90DC64();
    v47 = sub_23B90DDFC();
    v48 = os_log_type_enabled(v46, v47);
    v49 = v0[24];
    v50 = v0[20];
    if (v48)
    {
      v70 = v0[24];
      v51 = (uint8_t *)swift_slowAlloc();
      v67 = v50;
      v52 = swift_slowAlloc();
      v71[0] = v52;
      *(_DWORD *)v51 = 136315138;
      v53 = sub_23B90DA60();
      v54 = swift_bridgeObjectRetain();
      v55 = MEMORY[0x242608570](v54, v53);
      v57 = v56;
      swift_bridgeObjectRelease();
      v0[8] = sub_23B904C6C(v55, v57, v71);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B8EC000, v46, v47, "Successfully stop location share with %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v52, -1, -1);
      MEMORY[0x242608C00](v51, -1, -1);
      swift_release();

      v59 = v67;
      v58 = v70;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      v58 = v49;
      v59 = v50;
    }
    v64(v58, v59);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v62 = (uint64_t (*)(void))v0[1];
    return v62();
  }
  v31 = *(_QWORD *)(v65 + 8 * v32);
  if (v31)
  {
    v22 = v32;
    goto LABEL_28;
  }
  while (1)
  {
    v22 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v22 >= v66)
      goto LABEL_31;
    v31 = *(_QWORD *)(v65 + 8 * v22);
    ++v32;
    if (v31)
      goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B8F4684()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8F485C(int a1, void *a2, char a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v9;
  id v10;
  _QWORD *v11;

  v5[2] = a2;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  sub_23B909DF0(0, &qword_254309590);
  v9 = sub_23B90DD48();
  v5[5] = v9;
  v10 = a2;
  a5;
  v11 = (_QWORD *)swift_task_alloc();
  v5[6] = v11;
  *v11 = v5;
  v11[1] = sub_23B90A378;
  return ObjCBootstrap.stopSharingLocation(with:from:isFromGroup:)(v9, (uint64_t)a2, a3);
}

uint64_t ObjCBootstrap.startRefreshingLocation(for:priority:isFromGroup:reverseGeocode:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, char);

  v9 = (uint64_t (*)(uint64_t, char))((char *)&dword_256A54B10 + dword_256A54B10);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_23B90A374;
  return v9(a1, a4);
}

uint64_t sub_23B8F4988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[22] = a4;
  v5[23] = a5;
  v6 = sub_23B90DC88();
  v5[24] = v6;
  v5[25] = *(_QWORD *)(v6 - 8);
  v5[26] = swift_task_alloc();
  v7 = sub_23B90DCA0();
  v5[27] = v7;
  v5[28] = *(_QWORD *)(v7 - 8);
  v5[29] = swift_task_alloc();
  v8 = sub_23B90DA60();
  v5[30] = v8;
  v5[31] = *(_QWORD *)(v8 - 8);
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v9 = sub_23B90DBF8();
  v5[36] = v9;
  v5[37] = *(_QWORD *)(v9 - 8);
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v10 = sub_23B90D928();
  v5[41] = v10;
  v5[42] = *(_QWORD *)(v10 - 8);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309550);
  v5[45] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309570);
  v5[46] = v11;
  v5[47] = *(_QWORD *)(v11 - 8);
  v5[48] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F4B2C()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254309580);
  sub_23B90DDB4();
  v1 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback;
  *(_QWORD *)(v0 + 392) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  *(_QWORD *)(v0 + 400) = v1;
  swift_beginAccess();
  v2 = (_DWORD *)MEMORY[0x24BE31F38];
  *(_DWORD *)(v0 + 416) = *MEMORY[0x24BE31F40];
  *(_DWORD *)(v0 + 420) = *v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 408) = v3;
  *v3 = v0;
  v3[1] = sub_23B8F4C00;
  return sub_23B90DDC0();
}

uint64_t sub_23B8F4C00()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F4C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  _BOOL4 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  _QWORD *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  void (*v85)(id, id);
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void *v108;
  char *v109;
  id v110;
  void (*v111)(_QWORD, id);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  os_log_type_t type[8];
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  os_log_t log;
  os_log_t loga;
  void (*v125)(uint64_t, uint64_t);
  uint64_t v126;
  void (*v127)(uint64_t, uint64_t);
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  void (*v133)(uint64_t, uint64_t);
  void *aBlock;
  uint64_t v135;
  uint64_t v136;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 336);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 376) + 8))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 368));
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
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
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 352), v1, v2);
  if ((sub_23B90DDD8() & 1) != 0)
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDFC();
    v7 = os_log_type_enabled(v5, v6);
    v9 = *(_QWORD *)(v0 + 376);
    v8 = *(_QWORD *)(v0 + 384);
    v10 = *(_QWORD *)(v0 + 368);
    v11 = *(_QWORD *)(v0 + 352);
    v13 = *(_QWORD *)(v0 + 328);
    v12 = *(_QWORD *)(v0 + 336);
    if (v7)
    {
      v135 = *(_QWORD *)(v0 + 384);
      aBlock = *(void **)(v0 + 368);
      v14 = (uint8_t *)swift_slowAlloc();
      v131 = v9;
      v15 = swift_slowAlloc();
      v136 = v15;
      *(_DWORD *)v14 = 136446210;
      *(_QWORD *)(v0 + 168) = sub_23B904C6C(0xD000000000000041, 0x800000023B90F3B0, &v136);
      sub_23B90DE68();
      _os_log_impl(&dword_23B8EC000, v5, v6, "%{public}s has been canceled", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v15, -1, -1);
      MEMORY[0x242608C00](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      (*(void (**)(uint64_t, void *))(v131 + 8))(v135, aBlock);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    }
    goto LABEL_14;
  }
  v16 = *(_DWORD *)(v0 + 416);
  v17 = *(_QWORD *)(v0 + 344);
  v18 = *(_QWORD *)(v0 + 328);
  v19 = *(_QWORD *)(v0 + 336);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 16))(v17, *(_QWORD *)(v0 + 352), v18);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 88))(v17, v18);
  if (v20 == v16)
  {
    v21 = *(_QWORD *)(v0 + 344);
    v22 = *(_QWORD *)(v0 + 320);
    v23 = *(_QWORD *)(v0 + 312);
    v24 = *(_QWORD *)(v0 + 288);
    v25 = *(_QWORD *)(v0 + 296);
    v26 = *(_QWORD *)(v0 + 280);
    v27 = *(_QWORD *)(v0 + 240);
    v28 = *(_QWORD *)(v0 + 248);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 336) + 96))(v21, *(_QWORD *)(v0 + 328));
    v29 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256A54EA0) + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v22, v21, v24);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v26, v29, v27);
    sub_23B90DA30();
    v30 = (void *)sub_23B90DCE8();
    swift_bridgeObjectRelease();
    v132 = objc_msgSend((id)objc_opt_self(), sel_handleWithIdentifier_, v30);

    sub_23B909DF0(0, &qword_256A54E68);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    v31(v23, v22, v24);
    v129 = (void *)sub_23B90A58C(v23);
    if (qword_2543095D0 != -1)
      swift_once();
    v32 = *(_QWORD *)(v0 + 320);
    v33 = *(_QWORD *)(v0 + 304);
    v35 = *(_QWORD *)(v0 + 280);
    v34 = *(_QWORD *)(v0 + 288);
    v36 = *(_QWORD *)(v0 + 272);
    v37 = *(_QWORD *)(v0 + 240);
    v38 = *(_QWORD *)(v0 + 248);
    v39 = sub_23B90DC7C();
    __swift_project_value_buffer(v39, (uint64_t)qword_254309678);
    v31(v33, v32, v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v36, v35, v37);
    v40 = sub_23B90DC64();
    v41 = sub_23B90DDFC();
    v42 = os_log_type_enabled(v40, v41);
    v44 = *(_QWORD *)(v0 + 296);
    v43 = *(_QWORD *)(v0 + 304);
    v45 = *(_QWORD *)(v0 + 288);
    v46 = *(_QWORD *)(v0 + 272);
    v47 = *(_QWORD *)(v0 + 240);
    v48 = *(_QWORD *)(v0 + 248);
    if (v42)
    {
      v121 = *(_QWORD *)(v0 + 240);
      v49 = swift_slowAlloc();
      v119 = swift_slowAlloc();
      v136 = v119;
      *(_DWORD *)v49 = 136315394;
      sub_23B8F1000(&qword_256A54EA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE32430], MEMORY[0x24BE32440]);
      v50 = sub_23B90DF58();
      *(_QWORD *)(v0 + 152) = sub_23B904C6C(v50, v51, &v136);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v127 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v127(v43, v45);
      *(_WORD *)(v49 + 12) = 2080;
      v52 = sub_23B90DA30();
      *(_QWORD *)(v0 + 160) = sub_23B904C6C(v52, v53, &v136);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      v125 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v125(v46, v121);
      _os_log_impl(&dword_23B8EC000, v40, v41, "locationStreams received location %s for handle: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v119, -1, -1);
      MEMORY[0x242608C00](v49, -1, -1);

    }
    else
    {
      v127 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v127(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
      v125 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v125(v46, v47);

    }
    v76 = *(_QWORD *)(v0 + 232);
    v77 = *(_QWORD *)(v0 + 208);
    v122 = *(_QWORD *)(v0 + 216);
    log = *(os_log_t *)(v0 + 400);
    v78 = *(_QWORD *)(v0 + 192);
    *(_QWORD *)type = *(_QWORD *)(v0 + 200);
    v120 = *(_QWORD *)(v0 + 224);
    v79 = *(void **)(v0 + 184);
    v80 = (_QWORD *)swift_allocObject();
    v80[2] = v79;
    v80[3] = v132;
    v80[4] = v129;
    *(_QWORD *)(v0 + 96) = sub_23B90A298;
    *(_QWORD *)(v0 + 104) = v80;
    *(_QWORD *)(v0 + 64) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 72) = 1107296256;
    *(_QWORD *)(v0 + 80) = sub_23B8F5B44;
    *(_QWORD *)(v0 + 88) = &block_descriptor_446;
    v81 = _Block_copy((const void *)(v0 + 64));
    v82 = v79;
    v83 = v132;
    v84 = v129;
    sub_23B90DC94();
    *(_QWORD *)(v0 + 144) = MEMORY[0x24BEE4AF8];
    sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
    sub_23B908958();
    sub_23B90DE8C();
    MEMORY[0x242608648](0, v76, v77, v81);
    _Block_release(v81);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)type + 8))(v77, v78);
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v76, v122);
    swift_release();
    v85 = *(void (**)(id, id))((char *)&log->isa + (_QWORD)v79);
    if (v85)
    {
      v86 = v84;
      sub_23B90A2A4((uint64_t)v85);
      v85(v84, v83);

      sub_23B90A254((uint64_t)v85);
    }
    v87 = *(_QWORD *)(v0 + 352);
    v88 = *(_QWORD *)(v0 + 328);
    v89 = *(_QWORD *)(v0 + 336);
    v90 = *(_QWORD *)(v0 + 320);
    v92 = *(_QWORD *)(v0 + 280);
    v91 = *(_QWORD *)(v0 + 288);
    v93 = *(_QWORD *)(v0 + 240);

    v125(v92, v93);
    v127(v90, v91);
    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v87, v88);
  }
  else if (v20 == *(_DWORD *)(v0 + 420))
  {
    v55 = *(_QWORD *)(v0 + 344);
    v56 = *(_QWORD *)(v0 + 264);
    v58 = *(_QWORD *)(v0 + 240);
    v57 = *(_QWORD *)(v0 + 248);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 336) + 96))(v55, *(_QWORD *)(v0 + 328));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v56, v55, v58);
    sub_23B90DA30();
    v59 = (void *)sub_23B90DCE8();
    swift_bridgeObjectRelease();
    v60 = objc_msgSend((id)objc_opt_self(), sel_handleWithIdentifier_, v59);

    if (qword_2543095D0 != -1)
      swift_once();
    v62 = *(_QWORD *)(v0 + 256);
    v61 = *(_QWORD *)(v0 + 264);
    v64 = *(_QWORD *)(v0 + 240);
    v63 = *(_QWORD *)(v0 + 248);
    v65 = sub_23B90DC7C();
    __swift_project_value_buffer(v65, (uint64_t)qword_254309678);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v62, v61, v64);
    v66 = sub_23B90DC64();
    v67 = sub_23B90DDFC();
    v68 = os_log_type_enabled(v66, v67);
    v70 = *(_QWORD *)(v0 + 248);
    v69 = *(_QWORD *)(v0 + 256);
    v71 = *(_QWORD *)(v0 + 240);
    if (v68)
    {
      v72 = swift_slowAlloc();
      v73 = swift_slowAlloc();
      v136 = v73;
      *(_DWORD *)v72 = 141558275;
      *(_QWORD *)(v72 + 4) = 1752392040;
      *(_WORD *)(v72 + 12) = 2081;
      v74 = sub_23B90DA30();
      *(_QWORD *)(v72 + 14) = sub_23B904C6C(v74, v75, &v136);
      swift_bridgeObjectRelease();
      v133 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
      v133(v69, v71);
      _os_log_impl(&dword_23B8EC000, v66, v67, "locationStreams received unavailable location for handle: %{private,mask.hash}s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v73, -1, -1);
      MEMORY[0x242608C00](v72, -1, -1);
    }
    else
    {
      v133 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
      v133(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
    }

    v103 = *(_QWORD *)(v0 + 232);
    v104 = *(_QWORD *)(v0 + 208);
    v128 = *(_QWORD *)(v0 + 216);
    v130 = *(_QWORD *)(v0 + 400);
    v105 = *(_QWORD *)(v0 + 192);
    loga = *(os_log_t *)(v0 + 200);
    v126 = *(_QWORD *)(v0 + 224);
    v106 = *(char **)(v0 + 184);
    v107 = swift_allocObject();
    *(_QWORD *)(v107 + 16) = v106;
    *(_QWORD *)(v107 + 24) = v60;
    *(_QWORD *)(v0 + 48) = sub_23B90A24C;
    *(_QWORD *)(v0 + 56) = v107;
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_23B8F5B44;
    *(_QWORD *)(v0 + 40) = &block_descriptor_440;
    v108 = _Block_copy((const void *)(v0 + 16));
    v109 = v106;
    v110 = v60;
    sub_23B90DC94();
    *(_QWORD *)(v0 + 136) = MEMORY[0x24BEE4AF8];
    sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
    sub_23B908958();
    sub_23B90DE8C();
    MEMORY[0x242608648](0, v103, v104, v108);
    _Block_release(v108);
    ((void (*)(uint64_t, uint64_t))loga[1].isa)(v104, v105);
    (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v103, v128);
    swift_release();
    v111 = *(void (**)(_QWORD, id))&v106[v130];
    if (v111)
    {
      swift_retain();
      v111(0, v110);
      sub_23B90A254((uint64_t)v111);
    }
    v112 = *(_QWORD *)(v0 + 352);
    v113 = *(_QWORD *)(v0 + 328);
    v114 = *(_QWORD *)(v0 + 336);
    v115 = *(_QWORD *)(v0 + 264);
    v116 = *(_QWORD *)(v0 + 240);

    v133(v115, v116);
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v112, v113);
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v94 = sub_23B90DC7C();
    __swift_project_value_buffer(v94, (uint64_t)qword_254309678);
    v95 = sub_23B90DC64();
    v96 = sub_23B90DDF0();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v97 = 0;
      _os_log_impl(&dword_23B8EC000, v95, v96, "Unknown location update case", v97, 2u);
      MEMORY[0x242608C00](v97, -1, -1);
    }
    v99 = *(_QWORD *)(v0 + 344);
    v98 = *(_QWORD *)(v0 + 352);
    v100 = *(_QWORD *)(v0 + 328);
    v101 = *(_QWORD *)(v0 + 336);

    v102 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
    v102(v98, v100);
    v102(v99, v100);
  }
  v117 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 408) = v117;
  *v117 = v0;
  v117[1] = sub_23B8F4C00;
  return sub_23B90DDC0();
}

void sub_23B8F5958(uint64_t a1, void *a2, void *a3)
{
  id v5;

  swift_beginAccess();
  v5 = a2;
  sub_23B905768((uint64_t)a3, v5);
  swift_endAccess();

}

uint64_t sub_23B8F59D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B90DA24();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_23B909E6C(a1, &qword_256A54DF8);
    sub_23B905630(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_23B909E6C((uint64_t)v10, &qword_256A54DF8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_23B9066A4((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B8F5B44(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23B8F5B70(uint64_t a1, unint64_t a2)
{
  void *v3;

  swift_beginAccess();
  v3 = (void *)sub_23B9054E4(a2);
  swift_endAccess();

}

uint64_t sub_23B8F5BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B90DDA8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B90DD9C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B909E6C(a1, &qword_254309618);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B90DD84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B8F5E68(int a1, int a2, int a3, uint64_t a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t);

  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  sub_23B909DF0(0, &qword_254309590);
  v9 = sub_23B90DD48();
  v6[4] = v9;
  v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_256A54B10 + dword_256A54B10);
  a6;
  v10 = (_QWORD *)swift_task_alloc();
  v6[5] = v10;
  *v10 = v6;
  v10[1] = sub_23B90A364;
  return v12(v9, a4);
}

uint64_t ObjCBootstrap.stopRefreshingLocation(for:priority:isFromGroup:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256A54B20 + dword_256A54B20);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23B8F5F8C;
  return v5(a1);
}

uint64_t sub_23B8F5F8C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B8F5FD4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E70);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_23B8F618C(int a1, int a2, int a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v5[2] = a5;
  v5[3] = _Block_copy(aBlock);
  sub_23B909DF0(0, &qword_254309590);
  v7 = sub_23B90DD48();
  v5[4] = v7;
  v10 = (uint64_t (*)(uint64_t))((char *)&dword_256A54B20 + dword_256A54B20);
  a5;
  v8 = (_QWORD *)swift_task_alloc();
  v5[5] = v8;
  *v8 = v5;
  v8[1] = sub_23B8F6240;
  return v10(v7);
}

uint64_t sub_23B8F6240()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_23B90D838();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t ObjCBootstrap.stopRefreshingLocation()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_23B8F6300()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136446210;
    *(_QWORD *)(v0 + 16) = sub_23B904C6C(0xD000000000000018, 0x800000023B90EED0, &v9);
    sub_23B90DE68();
    _os_log_impl(&dword_23B8EC000, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v5, -1, -1);
    MEMORY[0x242608C00](v4, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 24);
  v7 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTask;
  if (*(_QWORD *)(v6 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTask))
  {
    swift_retain();
    sub_23B90DDCC();
    swift_release();
  }
  *(_QWORD *)(v6 + v7) = 0;
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8F65F4(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_23B90A3F0;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t ObjCBootstrap.startUpdatingFriends(initialUpdates:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 32) = v1;
  *(_BYTE *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 40) = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  *(_QWORD *)(v2 + 48) = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309628);
  *(_QWORD *)(v2 + 56) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v4 + 64);
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F6718()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v2;
  *v2 = v0;
  v2[1] = sub_23B8F67B4;
  return sub_23B90DF64();
}

uint64_t sub_23B8F67B4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F6810()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 112) = v1;
  swift_retain();
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v2;
    *v2 = v0;
    v2[1] = sub_23B8F69EC;
    return sub_23B90DAF0();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23B8EC000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x242608C00](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8F69EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F6A50()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B8EC000, v2, v3, "Successfully startUpdatingFriends stream", v4, 2u);
    MEMORY[0x242608C00](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 32);

  v20 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTask;
  v21 = v5;
  if (*(_QWORD *)(v5 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTask))
  {
    swift_retain();
    sub_23B90DDCC();
    swift_release();
  }
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 88);
  v9 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 48);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(void **)(v0 + 32);
  v19 = *(_QWORD *)(v0 + 40);
  v13 = sub_23B90DDA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v7, v11);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = (v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v16 + v14, v6, v11);
  *(_QWORD *)(v16 + v15) = v12;
  *(_QWORD *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = v19;
  v17 = v12;
  *(_QWORD *)(v21 + v20) = sub_23B8F5BD0(v10, (uint64_t)&unk_256A54B40, v16);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8F6CA8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8F6D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[70] = a5;
  v5[69] = a4;
  v6 = sub_23B90DC88();
  v5[71] = v6;
  v5[72] = *(_QWORD *)(v6 - 8);
  v5[73] = swift_task_alloc();
  v7 = sub_23B90DCA0();
  v5[74] = v7;
  v5[75] = *(_QWORD *)(v7 - 8);
  v5[76] = swift_task_alloc();
  v8 = sub_23B90D88C();
  v5[77] = v8;
  v5[78] = *(_QWORD *)(v8 - 8);
  v5[79] = swift_task_alloc();
  v5[80] = swift_task_alloc();
  v5[81] = swift_task_alloc();
  v5[82] = swift_task_alloc();
  v9 = sub_23B90DA24();
  v5[83] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[84] = v10;
  v5[85] = *(_QWORD *)(v10 + 64);
  v5[86] = swift_task_alloc();
  v5[87] = swift_task_alloc();
  v5[88] = swift_task_alloc();
  v5[89] = swift_task_alloc();
  v5[90] = swift_task_alloc();
  v5[91] = swift_task_alloc();
  v5[92] = swift_task_alloc();
  v5[93] = swift_task_alloc();
  v5[94] = swift_task_alloc();
  v5[95] = swift_task_alloc();
  v11 = sub_23B90D910();
  v5[96] = v11;
  v5[97] = *(_QWORD *)(v11 - 8);
  v5[98] = swift_task_alloc();
  v5[99] = swift_task_alloc();
  v5[100] = swift_task_alloc();
  v5[101] = swift_task_alloc();
  v5[102] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095C0);
  v5[103] = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309620);
  v5[104] = v12;
  v5[105] = *(_QWORD *)(v12 - 8);
  v5[106] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8F6F24()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  _DWORD *v3;
  _QWORD *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254309628);
  sub_23B90DDB4();
  *(_QWORD *)(v0 + 856) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  *(_QWORD *)(v0 + 864) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback;
  swift_beginAccess();
  v1 = (_DWORD *)MEMORY[0x24BE31EB0];
  *(_DWORD *)(v0 + 880) = *MEMORY[0x24BE31EA8];
  *(_DWORD *)(v0 + 884) = *v1;
  *(_DWORD *)(v0 + 888) = *MEMORY[0x24BE31EB8];
  v2 = (_DWORD *)MEMORY[0x24BE31D48];
  *(_DWORD *)(v0 + 892) = *MEMORY[0x24BE31D40];
  *(_DWORD *)(v0 + 896) = *v2;
  *(_DWORD *)(v0 + 900) = *MEMORY[0x24BE31D28];
  v3 = (_DWORD *)MEMORY[0x24BE31D20];
  *(_DWORD *)(v0 + 904) = *MEMORY[0x24BE31D30];
  *(_DWORD *)(v0 + 908) = *v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 872) = v4;
  *v4 = v0;
  v4[1] = sub_23B8F7064;
  return sub_23B90DDC0();
}

uint64_t sub_23B8F7064()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F70B8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  _QWORD *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void (*v62)(uint64_t, _QWORD, uint64_t);
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void (*v67)(_QWORD, _QWORD, _QWORD);
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t, uint64_t);
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void (*v84)(uint64_t, _QWORD, uint64_t);
  unint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  void (*v89)(_QWORD, _QWORD, _QWORD);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void (*v96)(uint64_t, _QWORD, uint64_t);
  unint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  NSObject *v101;
  os_log_type_t v102;
  _BOOL4 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(uint64_t, uint64_t, uint64_t);
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void (*v128)(uint64_t, _QWORD, uint64_t);
  unint64_t v129;
  uint64_t v130;
  void *v131;
  id v132;
  void (*v133)(_QWORD, _QWORD, _QWORD);
  uint64_t *v134;
  void (*v135)(void *, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void (*v147)(uint64_t, _QWORD, uint64_t);
  unint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  NSObject *v152;
  os_log_type_t v153;
  _BOOL4 v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void (*v168)(uint64_t, _QWORD, uint64_t);
  unint64_t v169;
  uint64_t v170;
  void *v171;
  id v172;
  NSObject *v173;
  os_log_type_t v174;
  _BOOL4 v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  void (*v185)(void *, _QWORD);
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void (*v196)(uint64_t, _QWORD, uint64_t);
  unint64_t v197;
  uint64_t v198;
  void *v199;
  id v200;
  NSObject *v201;
  os_log_type_t v202;
  _BOOL4 v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void (*v217)(uint64_t, _QWORD, uint64_t);
  unint64_t v218;
  uint64_t v219;
  void *v220;
  id v221;
  uint64_t v222;
  void (*v223)(void *, uint64_t);
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  _QWORD *v228;
  NSObject *v229;
  os_log_type_t v230;
  _BOOL4 v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  unint64_t v240;
  void (*v241)(uint64_t, uint64_t);
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  void (*v248)(uint64_t, _QWORD, uint64_t);
  unint64_t v249;
  uint64_t v250;
  void *v251;
  id v252;
  NSObject *v253;
  os_log_type_t v254;
  _BOOL4 v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  unint64_t v263;
  unint64_t v264;
  void (*v265)(uint64_t, uint64_t);
  uint64_t v266;
  NSObject *v267;
  os_log_type_t v268;
  _BOOL4 v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  unint64_t v277;
  unint64_t v278;
  void (*v279)(uint64_t, uint64_t);
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void (*v327)(_QWORD, _QWORD, _QWORD);
  uint64_t v328;
  void (*v329)(_QWORD, _QWORD, _QWORD);
  void (*v330)(_QWORD, _QWORD, _QWORD);
  void (*v331)(uint64_t, uint64_t);
  uint64_t v332;
  uint64_t v333;

  v1 = v0;
  v2 = v0[103];
  v3 = v0[97];
  v4 = v0[96];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v4) != 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v1[102], v2, v4);
    if ((sub_23B90DDD8() & 1) != 0)
    {
      if (qword_2543095D0 != -1)
        swift_once();
      v5 = sub_23B90DC7C();
      __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
      v6 = sub_23B90DC64();
      v7 = sub_23B90DDFC();
      v8 = os_log_type_enabled(v6, v7);
      v9 = v1[106];
      v10 = v1[105];
      v11 = v1[104];
      v12 = v1[102];
      v13 = v1[97];
      v14 = v1[96];
      if (v8)
      {
        v332 = v1[104];
        v15 = (uint8_t *)swift_slowAlloc();
        v318 = v12;
        v16 = swift_slowAlloc();
        v333 = v16;
        *(_DWORD *)v15 = 136446210;
        v1[68] = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
        sub_23B90DE68();
        _os_log_impl(&dword_23B8EC000, v6, v7, "%{public}s has been canceled", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v16, -1, -1);
        MEMORY[0x242608C00](v15, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v318, v14);
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v332);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
      }
      goto LABEL_13;
    }
    if (qword_2543095D0 != -1)
      swift_once();
    v17 = v1[102];
    v18 = v1[101];
    v19 = v1[97];
    v20 = v1[96];
    v21 = sub_23B90DC7C();
    __swift_project_value_buffer(v21, (uint64_t)qword_254309678);
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v22(v18, v17, v20);
    v23 = sub_23B90DC64();
    v24 = sub_23B90DDFC();
    v25 = os_log_type_enabled(v23, v24);
    v26 = v1[101];
    if (v25)
    {
      v27 = v1[100];
      v28 = v1[97];
      v29 = v1[96];
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v333 = v31;
      *(_DWORD *)v30 = 136446466;
      *(_QWORD *)(v30 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
      *(_WORD *)(v30 + 12) = 2080;
      v22(v27, v26, v29);
      v32 = sub_23B90DD00();
      *(_QWORD *)(v30 + 14) = sub_23B904C6C(v32, v33, &v333);
      swift_bridgeObjectRelease();
      v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v34(v26, v29);
      _os_log_impl(&dword_23B8EC000, v23, v24, "%{public}s friendshipUpdate: %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v31, -1, -1);
      MEMORY[0x242608C00](v30, -1, -1);
    }
    else
    {
      v34 = *(void (**)(uint64_t, uint64_t))(v1[97] + 8);
      v34(v26, v1[96]);
    }

    v41 = *((_DWORD *)v1 + 220);
    v42 = v1[99];
    v43 = v1[97];
    v44 = v1[96];
    v22(v42, v1[102], v44);
    v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 88))(v42, v44);
    v331 = v34;
    if (v45 == v41)
    {
      v46 = *((_DWORD *)v1 + 223);
      v47 = v1[99];
      v48 = v1[95];
      v49 = v1[84];
      v50 = v1[83];
      v51 = v1[82];
      v52 = v1[78];
      v53 = v1[77];
      (*(void (**)(uint64_t, _QWORD))(v1[97] + 96))(v47, v1[96]);
      v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32);
      v54(v48, v47, v50);
      sub_23B90D9E8();
      v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 88))(v51, v53);
      if (v55 == v46)
      {
        v56 = v1[94];
        v57 = v1[84];
        v58 = v1[83];
        v282 = v1[76];
        v306 = v1[75];
        v319 = v1[74];
        v59 = v1[73];
        v294 = v1[72];
        v60 = v1[71];
        v61 = (void *)v1[70];
        v62 = *(void (**)(uint64_t, _QWORD, uint64_t))(v57 + 16);
        v62(v56, v1[95], v58);
        v63 = (*(unsigned __int8 *)(v57 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
        v64 = swift_allocObject();
        *(_QWORD *)(v64 + 16) = v61;
        v54(v64 + v63, v56, v58);
        v1[18] = sub_23B909FA4;
        v1[19] = v64;
        v1[14] = MEMORY[0x24BDAC760];
        v1[15] = 1107296256;
        v1[16] = sub_23B8F5B44;
        v1[17] = &block_descriptor_423;
        v65 = _Block_copy(v1 + 14);
        v66 = v61;
        sub_23B90DC94();
        v1[67] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v67 = v62;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v282, v59, v65);
        _Block_release(v65);
        (*(void (**)(uint64_t, uint64_t))(v294 + 8))(v59, v60);
        (*(void (**)(uint64_t, uint64_t))(v306 + 8))(v282, v319);
      }
      else if (v55 == *((_DWORD *)v1 + 224))
      {
        v90 = v1[94];
        v91 = v1[84];
        v92 = v1[83];
        v284 = v1[76];
        v308 = v1[75];
        v321 = v1[74];
        v93 = v1[73];
        v296 = v1[72];
        v94 = v1[71];
        v95 = (void *)v1[70];
        v96 = *(void (**)(uint64_t, _QWORD, uint64_t))(v91 + 16);
        v96(v90, v1[95], v92);
        v97 = (*(unsigned __int8 *)(v91 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
        v98 = swift_allocObject();
        *(_QWORD *)(v98 + 16) = v95;
        v54(v98 + v97, v90, v92);
        v1[30] = sub_23B909F50;
        v1[31] = v98;
        v1[26] = MEMORY[0x24BDAC760];
        v1[27] = 1107296256;
        v1[28] = sub_23B8F5B44;
        v1[29] = &block_descriptor_417;
        v99 = _Block_copy(v1 + 26);
        v100 = v95;
        sub_23B90DC94();
        v1[65] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v67 = v96;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v284, v93, v99);
        _Block_release(v99);
        (*(void (**)(uint64_t, uint64_t))(v296 + 8))(v93, v94);
        (*(void (**)(uint64_t, uint64_t))(v308 + 8))(v284, v321);
      }
      else
      {
        if (v55 == *((_DWORD *)v1 + 225) || v55 == *((_DWORD *)v1 + 226))
        {
          v67 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
          goto LABEL_28;
        }
        if (v55 != *((_DWORD *)v1 + 227))
        {
          v67 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
          v67(v1[93], v1[95], v1[83]);
          v229 = sub_23B90DC64();
          v230 = sub_23B90DDF0();
          v231 = os_log_type_enabled(v229, v230);
          v232 = v1[93];
          if (v231)
          {
            v233 = v1[81];
            v234 = v1[78];
            v235 = v1[77];
            v302 = v1[84];
            v314 = v1[83];
            v236 = swift_slowAlloc();
            v327 = v67;
            v291 = swift_slowAlloc();
            v333 = v291;
            *(_DWORD *)v236 = 136446466;
            *(_QWORD *)(v236 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
            *(_WORD *)(v236 + 12) = 2080;
            sub_23B90D9E8();
            sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
            v237 = v235;
            v238 = sub_23B90DF58();
            v240 = v239;
            v241 = *(void (**)(uint64_t, uint64_t))(v234 + 8);
            v241(v233, v237);
            *(_QWORD *)(v236 + 14) = sub_23B904C6C(v238, v240, &v333);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v302 + 8))(v232, v314);
            _os_log_impl(&dword_23B8EC000, v229, v230, "%{public}s Unknown friend.type %s!", (uint8_t *)v236, 0x16u);
            swift_arrayDestroy();
            v67 = v327;
            MEMORY[0x242608C00](v291, -1, -1);
            MEMORY[0x242608C00](v236, -1, -1);

          }
          else
          {
            v266 = v1[78];
            (*(void (**)(_QWORD, _QWORD))(v1[84] + 8))(v1[93], v1[83]);

            v241 = *(void (**)(uint64_t, uint64_t))(v266 + 8);
          }
          v241(v1[82], v1[77]);
          goto LABEL_28;
        }
        v162 = v1[94];
        v163 = v1[84];
        v164 = v1[83];
        v287 = v1[76];
        v311 = v1[75];
        v324 = v1[74];
        v165 = v1[73];
        v299 = v1[72];
        v166 = v1[71];
        v167 = (void *)v1[70];
        v168 = *(void (**)(uint64_t, _QWORD, uint64_t))(v163 + 16);
        v168(v162, v1[95], v164);
        v169 = (*(unsigned __int8 *)(v163 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v163 + 80);
        v170 = swift_allocObject();
        *(_QWORD *)(v170 + 16) = v167;
        v54(v170 + v169, v162, v164);
        v1[42] = sub_23B909F40;
        v1[43] = v170;
        v1[38] = MEMORY[0x24BDAC760];
        v1[39] = 1107296256;
        v1[40] = sub_23B8F5B44;
        v1[41] = &block_descriptor_411;
        v171 = _Block_copy(v1 + 38);
        v172 = v167;
        sub_23B90DC94();
        v1[63] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v67 = v168;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v287, v165, v171);
        _Block_release(v171);
        (*(void (**)(uint64_t, uint64_t))(v299 + 8))(v165, v166);
        (*(void (**)(uint64_t, uint64_t))(v311 + 8))(v287, v324);
      }
      swift_release();
LABEL_28:
      v67(v1[92], v1[95], v1[83]);
      v101 = sub_23B90DC64();
      v102 = sub_23B90DDFC();
      v103 = os_log_type_enabled(v101, v102);
      v104 = v1[92];
      v105 = v1[84];
      v106 = v1[83];
      if (v103)
      {
        v107 = swift_slowAlloc();
        v108 = swift_slowAlloc();
        v333 = v108;
        *(_DWORD *)v107 = 136446466;
        *(_QWORD *)(v107 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
        *(_WORD *)(v107 + 12) = 2080;
        sub_23B8F1000(&qword_256A54E38, (uint64_t (*)(uint64_t))MEMORY[0x24BE320C8], MEMORY[0x24BE320E0]);
        v109 = sub_23B90DF58();
        *(_QWORD *)(v107 + 14) = sub_23B904C6C(v109, v110, &v333);
        swift_bridgeObjectRelease();
        v111 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
        v111(v104, v106);
        _os_log_impl(&dword_23B8EC000, v101, v102, "%{public}s Added friend: %s", (uint8_t *)v107, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v108, -1, -1);
        MEMORY[0x242608C00](v107, -1, -1);
      }
      else
      {
        v111 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
        v111(v1[92], v1[83]);
      }

      v134 = v1 + 102;
      v135 = *(void (**)(void *, uint64_t))(v1[70] + v1[108]);
      if (v135)
      {
        v136 = v1[95];
        v137 = v1[94];
        v138 = v1[83];
        sub_23B909DF0(0, &qword_254309588);
        v67(v137, v136, v138);
        swift_retain();
        v139 = (void *)FMLFriend.init(_:)(v137);
        v135(v139, 1);

        sub_23B90A254((uint64_t)v135);
      }
      v140 = v1[95];
LABEL_68:
      v111(v140, v1[83]);
      v34 = v331;
LABEL_69:
      v34(*v134, v1[96]);
      v228 = (_QWORD *)swift_task_alloc();
      v1[109] = v228;
      *v228 = v1;
      v228[1] = sub_23B8F7064;
      return sub_23B90DDC0();
    }
    if (v45 == *((_DWORD *)v1 + 221))
    {
      v68 = *((_DWORD *)v1 + 223);
      v69 = v1[99];
      v70 = v1[91];
      v71 = v1[84];
      v72 = v1[83];
      v73 = v1[80];
      v74 = v1[78];
      v75 = v1[77];
      (*(void (**)(uint64_t, _QWORD))(v1[97] + 96))(v69, v1[96]);
      v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 32);
      v76(v70, v69, v72);
      sub_23B90D9E8();
      v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v74 + 88))(v73, v75);
      if (v77 == v68)
      {
        v78 = v1[94];
        v79 = v1[84];
        v80 = v1[83];
        v283 = v1[76];
        v307 = v1[75];
        v320 = v1[74];
        v81 = v1[73];
        v295 = v1[72];
        v82 = v1[71];
        v83 = (void *)v1[70];
        v84 = *(void (**)(uint64_t, _QWORD, uint64_t))(v79 + 16);
        v84(v78, v1[91], v80);
        v85 = (*(unsigned __int8 *)(v79 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
        v86 = swift_allocObject();
        *(_QWORD *)(v86 + 16) = v83;
        v76(v86 + v85, v78, v80);
        v1[54] = sub_23B90A03C;
        v1[55] = v86;
        v1[50] = MEMORY[0x24BDAC760];
        v1[51] = 1107296256;
        v1[52] = sub_23B8F5B44;
        v1[53] = &block_descriptor_405;
        v87 = _Block_copy(v1 + 50);
        v88 = v83;
        sub_23B90DC94();
        v1[61] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v89 = v84;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v283, v81, v87);
        _Block_release(v87);
        (*(void (**)(uint64_t, uint64_t))(v295 + 8))(v81, v82);
        (*(void (**)(uint64_t, uint64_t))(v307 + 8))(v283, v320);
      }
      else if (v77 == *((_DWORD *)v1 + 224))
      {
        v141 = v1[94];
        v142 = v1[84];
        v143 = v1[83];
        v286 = v1[76];
        v310 = v1[75];
        v323 = v1[74];
        v144 = v1[73];
        v298 = v1[72];
        v145 = v1[71];
        v146 = (void *)v1[70];
        v147 = *(void (**)(uint64_t, _QWORD, uint64_t))(v142 + 16);
        v147(v141, v1[91], v143);
        v148 = (*(unsigned __int8 *)(v142 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
        v149 = swift_allocObject();
        *(_QWORD *)(v149 + 16) = v146;
        v76(v149 + v148, v141, v143);
        v1[36] = sub_23B90A008;
        v1[37] = v149;
        v1[32] = MEMORY[0x24BDAC760];
        v1[33] = 1107296256;
        v1[34] = sub_23B8F5B44;
        v1[35] = &block_descriptor_399;
        v150 = _Block_copy(v1 + 32);
        v151 = v146;
        sub_23B90DC94();
        v1[59] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v89 = v147;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v286, v144, v150);
        _Block_release(v150);
        (*(void (**)(uint64_t, uint64_t))(v298 + 8))(v144, v145);
        (*(void (**)(uint64_t, uint64_t))(v310 + 8))(v286, v323);
      }
      else
      {
        if (v77 == *((_DWORD *)v1 + 225) || v77 == *((_DWORD *)v1 + 226))
        {
          v89 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
          goto LABEL_40;
        }
        if (v77 != *((_DWORD *)v1 + 227))
        {
          v89 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
          v89(v1[90], v1[91], v1[83]);
          v253 = sub_23B90DC64();
          v254 = sub_23B90DDF0();
          v255 = os_log_type_enabled(v253, v254);
          v256 = v1[90];
          if (v255)
          {
            v257 = v1[81];
            v258 = v1[78];
            v259 = v1[77];
            v304 = v1[84];
            v316 = v1[83];
            v260 = swift_slowAlloc();
            v329 = v89;
            v292 = swift_slowAlloc();
            v333 = v292;
            *(_DWORD *)v260 = 136446466;
            *(_QWORD *)(v260 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
            *(_WORD *)(v260 + 12) = 2080;
            sub_23B90D9E8();
            sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
            v261 = v259;
            v262 = sub_23B90DF58();
            v264 = v263;
            v265 = *(void (**)(uint64_t, uint64_t))(v258 + 8);
            v265(v257, v261);
            *(_QWORD *)(v260 + 14) = sub_23B904C6C(v262, v264, &v333);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v304 + 8))(v256, v316);
            _os_log_impl(&dword_23B8EC000, v253, v254, "%{public}s Unknown friend.type %s!", (uint8_t *)v260, 0x16u);
            swift_arrayDestroy();
            v89 = v329;
            MEMORY[0x242608C00](v292, -1, -1);
            MEMORY[0x242608C00](v260, -1, -1);

          }
          else
          {
            v280 = v1[78];
            (*(void (**)(_QWORD, _QWORD))(v1[84] + 8))(v1[90], v1[83]);

            v265 = *(void (**)(uint64_t, uint64_t))(v280 + 8);
          }
          v265(v1[80], v1[77]);
          goto LABEL_40;
        }
        v211 = v1[94];
        v212 = v1[84];
        v213 = v1[83];
        v289 = v1[76];
        v313 = v1[75];
        v326 = v1[74];
        v214 = v1[73];
        v301 = v1[72];
        v215 = v1[71];
        v216 = (void *)v1[70];
        v217 = *(void (**)(uint64_t, _QWORD, uint64_t))(v212 + 16);
        v217(v211, v1[91], v213);
        v218 = (*(unsigned __int8 *)(v212 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v212 + 80);
        v219 = swift_allocObject();
        *(_QWORD *)(v219 + 16) = v216;
        v76(v219 + v218, v211, v213);
        v1[48] = sub_23B909FB4;
        v1[49] = v219;
        v1[44] = MEMORY[0x24BDAC760];
        v1[45] = 1107296256;
        v1[46] = sub_23B8F5B44;
        v1[47] = &block_descriptor_393;
        v220 = _Block_copy(v1 + 44);
        v221 = v216;
        sub_23B90DC94();
        v1[60] = MEMORY[0x24BEE4AF8];
        sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
        sub_23B908958();
        v89 = v217;
        sub_23B90DE8C();
        MEMORY[0x242608648](0, v289, v214, v220);
        _Block_release(v220);
        (*(void (**)(uint64_t, uint64_t))(v301 + 8))(v214, v215);
        (*(void (**)(uint64_t, uint64_t))(v313 + 8))(v289, v326);
      }
      swift_release();
LABEL_40:
      v89(v1[89], v1[91], v1[83]);
      v152 = sub_23B90DC64();
      v153 = sub_23B90DDFC();
      v154 = os_log_type_enabled(v152, v153);
      v155 = v1[89];
      v156 = v1[84];
      v157 = v1[83];
      if (v154)
      {
        v158 = swift_slowAlloc();
        v159 = swift_slowAlloc();
        v333 = v159;
        *(_DWORD *)v158 = 136446466;
        *(_QWORD *)(v158 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
        *(_WORD *)(v158 + 12) = 2080;
        sub_23B8F1000(&qword_256A54E38, (uint64_t (*)(uint64_t))MEMORY[0x24BE320C8], MEMORY[0x24BE320E0]);
        v160 = sub_23B90DF58();
        *(_QWORD *)(v158 + 14) = sub_23B904C6C(v160, v161, &v333);
        swift_bridgeObjectRelease();
        v111 = *(void (**)(uint64_t, uint64_t))(v156 + 8);
        v111(v155, v157);
        _os_log_impl(&dword_23B8EC000, v152, v153, "%{public}s Removed friend: %s", (uint8_t *)v158, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v159, -1, -1);
        MEMORY[0x242608C00](v158, -1, -1);
      }
      else
      {
        v111 = *(void (**)(uint64_t, uint64_t))(v156 + 8);
        v111(v1[89], v1[83]);
      }

      v134 = v1 + 102;
      v185 = *(void (**)(void *, _QWORD))(v1[70] + v1[108]);
      if (v185)
      {
        v186 = v1[94];
        v187 = v1[91];
        v188 = v1[83];
        sub_23B909DF0(0, &qword_254309588);
        v89(v186, v187, v188);
        swift_retain();
        v189 = (void *)FMLFriend.init(_:)(v186);
        v185(v189, 0);

        sub_23B90A254((uint64_t)v185);
      }
      v140 = v1[91];
      goto LABEL_68;
    }
    if (v45 != *((_DWORD *)v1 + 222))
    {
      v134 = v1 + 99;
      v22(v1[98], v1[102], v1[96]);
      v173 = sub_23B90DC64();
      v174 = sub_23B90DDF0();
      v175 = os_log_type_enabled(v173, v174);
      v176 = v1[102];
      if (v175)
      {
        v177 = v1[100];
        v178 = v1[98];
        v179 = v1[96];
        v180 = swift_slowAlloc();
        v181 = swift_slowAlloc();
        v333 = v181;
        *(_DWORD *)v180 = 136315138;
        v22(v177, v178, v179);
        v182 = sub_23B90DD00();
        *(_QWORD *)(v180 + 4) = sub_23B904C6C(v182, v183, &v333);
        v134 = v1 + 99;
        swift_bridgeObjectRelease();
        v184 = v178;
        v34 = v331;
        v331(v184, v179);
        _os_log_impl(&dword_23B8EC000, v173, v174, "Unknown friendship update type %s", (uint8_t *)v180, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v181, -1, -1);
        MEMORY[0x242608C00](v180, -1, -1);

      }
      else
      {
        v222 = v1[98];
        v179 = v1[96];

        v34(v222, v179);
      }
      v34(v176, v179);
      goto LABEL_69;
    }
    v112 = *((_DWORD *)v1 + 223);
    v113 = v1[99];
    v114 = v1[88];
    v115 = v1[84];
    v116 = v1[83];
    v117 = v1[79];
    v118 = v1[78];
    v119 = v1[77];
    (*(void (**)(uint64_t, _QWORD))(v1[97] + 96))(v113, v1[96]);
    v120 = *(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 32);
    v120(v114, v113, v116);
    sub_23B90D9E8();
    v121 = (*(uint64_t (**)(uint64_t, uint64_t))(v118 + 88))(v117, v119);
    if (v121 == v112)
    {
      v122 = v1[94];
      v123 = v1[84];
      v124 = v1[83];
      v285 = v1[76];
      v309 = v1[75];
      v322 = v1[74];
      v125 = v1[73];
      v297 = v1[72];
      v126 = v1[71];
      v127 = (void *)v1[70];
      v128 = *(void (**)(uint64_t, _QWORD, uint64_t))(v123 + 16);
      v128(v122, v1[88], v124);
      v129 = (*(unsigned __int8 *)(v123 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80);
      v130 = swift_allocObject();
      *(_QWORD *)(v130 + 16) = v127;
      v120(v130 + v129, v122, v124);
      v1[6] = sub_23B909FA4;
      v1[7] = v130;
      v1[2] = MEMORY[0x24BDAC760];
      v1[3] = 1107296256;
      v1[4] = sub_23B8F5B44;
      v1[5] = &block_descriptor_387;
      v131 = _Block_copy(v1 + 2);
      v132 = v127;
      sub_23B90DC94();
      v1[62] = MEMORY[0x24BEE4AF8];
      sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
      sub_23B908958();
      v133 = v128;
      sub_23B90DE8C();
      MEMORY[0x242608648](0, v285, v125, v131);
      _Block_release(v131);
      (*(void (**)(uint64_t, uint64_t))(v297 + 8))(v125, v126);
      (*(void (**)(uint64_t, uint64_t))(v309 + 8))(v285, v322);
    }
    else if (v121 == *((_DWORD *)v1 + 224))
    {
      v190 = v1[94];
      v191 = v1[84];
      v192 = v1[83];
      v288 = v1[76];
      v312 = v1[75];
      v325 = v1[74];
      v193 = v1[73];
      v300 = v1[72];
      v194 = v1[71];
      v195 = (void *)v1[70];
      v196 = *(void (**)(uint64_t, _QWORD, uint64_t))(v191 + 16);
      v196(v190, v1[88], v192);
      v197 = (*(unsigned __int8 *)(v191 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v191 + 80);
      v198 = swift_allocObject();
      *(_QWORD *)(v198 + 16) = v195;
      v120(v198 + v197, v190, v192);
      v1[24] = sub_23B909F50;
      v1[25] = v198;
      v1[20] = MEMORY[0x24BDAC760];
      v1[21] = 1107296256;
      v1[22] = sub_23B8F5B44;
      v1[23] = &block_descriptor_381;
      v199 = _Block_copy(v1 + 20);
      v200 = v195;
      sub_23B90DC94();
      v1[64] = MEMORY[0x24BEE4AF8];
      sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
      sub_23B908958();
      v133 = v196;
      sub_23B90DE8C();
      MEMORY[0x242608648](0, v288, v193, v199);
      _Block_release(v199);
      (*(void (**)(uint64_t, uint64_t))(v300 + 8))(v193, v194);
      (*(void (**)(uint64_t, uint64_t))(v312 + 8))(v288, v325);
    }
    else
    {
      if (v121 == *((_DWORD *)v1 + 225) || v121 == *((_DWORD *)v1 + 226))
      {
        v133 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
        goto LABEL_55;
      }
      if (v121 != *((_DWORD *)v1 + 227))
      {
        v133 = *(void (**)(_QWORD, _QWORD, _QWORD))(v1[84] + 16);
        v133(v1[87], v1[88], v1[83]);
        v267 = sub_23B90DC64();
        v268 = sub_23B90DDF0();
        v269 = os_log_type_enabled(v267, v268);
        v270 = v1[87];
        if (v269)
        {
          v271 = v1[81];
          v272 = v1[78];
          v273 = v1[77];
          v305 = v1[84];
          v317 = v1[83];
          v274 = swift_slowAlloc();
          v330 = v133;
          v293 = swift_slowAlloc();
          v333 = v293;
          *(_DWORD *)v274 = 136446466;
          *(_QWORD *)(v274 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
          *(_WORD *)(v274 + 12) = 2080;
          sub_23B90D9E8();
          sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
          v275 = v273;
          v276 = sub_23B90DF58();
          v278 = v277;
          v279 = *(void (**)(uint64_t, uint64_t))(v272 + 8);
          v279(v271, v275);
          *(_QWORD *)(v274 + 14) = sub_23B904C6C(v276, v278, &v333);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v305 + 8))(v270, v317);
          _os_log_impl(&dword_23B8EC000, v267, v268, "%{public}s Unknown friend.type %s!", (uint8_t *)v274, 0x16u);
          swift_arrayDestroy();
          v133 = v330;
          MEMORY[0x242608C00](v293, -1, -1);
          MEMORY[0x242608C00](v274, -1, -1);

        }
        else
        {
          v281 = v1[78];
          (*(void (**)(_QWORD, _QWORD))(v1[84] + 8))(v1[87], v1[83]);

          v279 = *(void (**)(uint64_t, uint64_t))(v281 + 8);
        }
        v279(v1[79], v1[77]);
        goto LABEL_55;
      }
      v242 = v1[94];
      v243 = v1[84];
      v244 = v1[83];
      v290 = v1[76];
      v315 = v1[75];
      v328 = v1[74];
      v245 = v1[73];
      v303 = v1[72];
      v246 = v1[71];
      v247 = (void *)v1[70];
      v248 = *(void (**)(uint64_t, _QWORD, uint64_t))(v243 + 16);
      v248(v242, v1[88], v244);
      v249 = (*(unsigned __int8 *)(v243 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v243 + 80);
      v250 = swift_allocObject();
      *(_QWORD *)(v250 + 16) = v247;
      v120(v250 + v249, v242, v244);
      v1[12] = sub_23B909F40;
      v1[13] = v250;
      v1[8] = MEMORY[0x24BDAC760];
      v1[9] = 1107296256;
      v1[10] = sub_23B8F5B44;
      v1[11] = &block_descriptor_375;
      v251 = _Block_copy(v1 + 8);
      v252 = v247;
      sub_23B90DC94();
      v1[66] = MEMORY[0x24BEE4AF8];
      sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
      sub_23B908958();
      v133 = v248;
      sub_23B90DE8C();
      MEMORY[0x242608648](0, v290, v245, v251);
      _Block_release(v251);
      (*(void (**)(uint64_t, uint64_t))(v303 + 8))(v245, v246);
      (*(void (**)(uint64_t, uint64_t))(v315 + 8))(v290, v328);
    }
    swift_release();
LABEL_55:
    v133(v1[86], v1[88], v1[83]);
    v201 = sub_23B90DC64();
    v202 = sub_23B90DDFC();
    v203 = os_log_type_enabled(v201, v202);
    v204 = v1[86];
    v205 = v1[84];
    v206 = v1[83];
    if (v203)
    {
      v207 = swift_slowAlloc();
      v208 = swift_slowAlloc();
      v333 = v208;
      *(_DWORD *)v207 = 136446466;
      *(_QWORD *)(v207 + 4) = sub_23B904C6C(0xD000000000000025, 0x800000023B90F360, &v333);
      *(_WORD *)(v207 + 12) = 2080;
      sub_23B8F1000(&qword_256A54E38, (uint64_t (*)(uint64_t))MEMORY[0x24BE320C8], MEMORY[0x24BE320E0]);
      v209 = sub_23B90DF58();
      *(_QWORD *)(v207 + 14) = sub_23B904C6C(v209, v210, &v333);
      swift_bridgeObjectRelease();
      v111 = *(void (**)(uint64_t, uint64_t))(v205 + 8);
      v111(v204, v206);
      _os_log_impl(&dword_23B8EC000, v201, v202, "%{public}s Modified friend: %s", (uint8_t *)v207, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v208, -1, -1);
      MEMORY[0x242608C00](v207, -1, -1);
    }
    else
    {
      v111 = *(void (**)(uint64_t, uint64_t))(v205 + 8);
      v111(v1[86], v1[83]);
    }

    v134 = v1 + 102;
    v223 = *(void (**)(void *, uint64_t))(v1[70] + v1[108]);
    if (v223)
    {
      v224 = v1[94];
      v225 = v1[88];
      v226 = v1[83];
      sub_23B909DF0(0, &qword_254309588);
      v133(v224, v225, v226);
      swift_retain();
      v227 = (void *)FMLFriend.init(_:)(v224);
      v223(v227, 2);

      sub_23B90A254((uint64_t)v223);
    }
    v140 = v1[88];
    goto LABEL_68;
  }
  (*(void (**)(_QWORD, _QWORD))(v1[105] + 8))(v1[106], v1[104]);
LABEL_13:
  v35 = v1;
  if (qword_2543095D0 != -1)
    swift_once();
  v36 = sub_23B90DC7C();
  __swift_project_value_buffer(v36, (uint64_t)qword_254309678);
  v37 = sub_23B90DC64();
  v38 = sub_23B90DDFC();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_23B8EC000, v37, v38, "Successfully startUpdatingFriends", v39, 2u);
    MEMORY[0x242608C00](v39, -1, -1);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v35[1])();
}

void sub_23B8F9464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v0 = sub_23B90DA60();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B90DA0C();
  v7 = sub_23B90DA30();
  v9 = v8;
  v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v3, v0);
  swift_beginAccess();
  sub_23B905630(v7, v9, (uint64_t)v6);
  sub_23B909E6C((uint64_t)v6, &qword_256A54DF8);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_23B90DA0C();
  sub_23B90DA30();
  v11 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_handleWithIdentifier_, v11);

  v10(v3, v0);
  swift_beginAccess();
  v13 = (void *)sub_23B9054E4((unint64_t)v12);
  swift_endAccess();

}

uint64_t sub_23B8F9640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_23B90DA60();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B90DA0C();
  v7 = sub_23B90DA30();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  sub_23B905630(v7, v9, (uint64_t)v6);
  sub_23B909E6C((uint64_t)v6, &qword_256A54DF8);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B8F9774(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B90DA60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B90DA0C();
  v10 = sub_23B90DA30();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = sub_23B90DA24();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, a2, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  swift_beginAccess();
  sub_23B8F59D0((uint64_t)v5, v10, v12);
  return swift_endAccess();
}

uint64_t sub_23B8F99FC(char a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  _QWORD *v6;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  *v6 = v3;
  v6[1] = sub_23B90A3F0;
  return ObjCBootstrap.startUpdatingFriends(initialUpdates:)(a1);
}

uint64_t ObjCBootstrap.stopUpdatingFriends()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  *(_QWORD *)(v1 + 40) = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_23B8F9AB4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_23B8F9B50;
  return sub_23B90DF64();
}

uint64_t sub_23B8F9B50()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F9BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 64) = v2;
  swift_retain();
  if (v2)
  {
    v3 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTask;
    if (*(_QWORD *)(v1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTask))
    {
      swift_retain();
      sub_23B90DDCC();
      swift_release();
    }
    *(_QWORD *)(v1 + v3) = 0;
    swift_release();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v9;
    *v9 = v0;
    v9[1] = sub_23B8F9DB8;
    return sub_23B90DAD8();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23B8EC000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x242608C00](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8F9DB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8F9E1C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B8EC000, v2, v3, "Successfully stopUpdatingFriends", v4, 2u);
    MEMORY[0x242608C00](v4, -1, -1);
  }

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8F9F08()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FA058(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_23B8FA0DC;
  v5[4] = v4;
  v5[5] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_23B8FA0DC()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_23B90D838();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t ObjCBootstrap.startMonitoringActiveLocationSharingDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = v0;
  v1[5] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  v1[6] = swift_task_alloc();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309578);
  v1[7] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 + 64);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FA224()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 32);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FA2C0;
  return sub_23B90DF64();
}

uint64_t sub_23B8FA2C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FA31C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 112) = v1;
  swift_retain();
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v2;
    *v2 = v0;
    v2[1] = sub_23B8FA4F4;
    return sub_23B90DB44();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23B8EC000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x242608C00](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8FA4F4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FA558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(void **)(v0 + 32);
  v14 = *(_QWORD *)(v0 + 40);
  v8 = sub_23B90DDA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v6);
  v9 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v10 = (v3 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v11 + v9, v1, v6);
  *(_QWORD *)(v11 + v10) = v7;
  *(_QWORD *)(v11 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8)) = v14;
  v12 = v7;
  sub_23B8F5BD0(v5, (uint64_t)&unk_256A54B60, v11);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FA6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v5[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_254309558);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  v6 = sub_23B90D904();
  v5[12] = v6;
  v5[13] = *(_QWORD *)(v6 - 8);
  v5[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309548);
  v5[15] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309568);
  v5[16] = v7;
  v5[17] = *(_QWORD *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FA7A8()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254309578);
  sub_23B90DDB4();
  *(_QWORD *)(v0 + 152) = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback;
  swift_beginAccess();
  *(_DWORD *)(v0 + 168) = *MEMORY[0x24BE31E90];
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_23B8FA860;
  return sub_23B90DDC0();
}

uint64_t sub_23B8FA860()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FA8B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(id);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  char v43;
  char v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    v9 = *(_DWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 112);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v10, v1, v2);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v10, v2) == v9)
    {
      v11 = *(_QWORD *)(v0 + 112);
      v12 = *(_QWORD *)(v0 + 88);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 104) + 96))(v11, *(_QWORD *)(v0 + 96));
      sub_23B909E28(v11, v12, &qword_254309558);
      if (qword_2543095D0 != -1)
        swift_once();
      v13 = *(_QWORD *)(v0 + 80);
      v14 = *(_QWORD *)(v0 + 88);
      v15 = sub_23B90DC7C();
      __swift_project_value_buffer(v15, (uint64_t)qword_254309678);
      sub_23B90A310(v14, v13, &qword_254309558);
      v16 = sub_23B90DC64();
      v17 = sub_23B90DDFC();
      v18 = os_log_type_enabled(v16, v17);
      v19 = *(_QWORD *)(v0 + 80);
      if (v18)
      {
        v20 = *(_QWORD *)(v0 + 72);
        v21 = swift_slowAlloc();
        v22 = swift_slowAlloc();
        v50 = v22;
        *(_DWORD *)v21 = 136315138;
        sub_23B90A310(v19, v20, &qword_254309558);
        v23 = sub_23B90DD00();
        *(_QWORD *)(v21 + 4) = sub_23B904C6C(v23, v24, &v50);
        swift_bridgeObjectRelease();
        sub_23B909E6C(v19, &qword_254309558);
        _os_log_impl(&dword_23B8EC000, v16, v17, "meDeviceStreams receive meDevice updated: %s", (uint8_t *)v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v22, -1, -1);
        MEMORY[0x242608C00](v21, -1, -1);
      }
      else
      {
        sub_23B909E6C(*(_QWORD *)(v0 + 80), &qword_254309558);
      }

      v32 = *(void (**)(id))(*(_QWORD *)(v0 + 48) + *(_QWORD *)(v0 + 152));
      if (v32)
      {
        v33 = *(_QWORD *)(v0 + 88);
        v34 = sub_23B90D9B8();
        v35 = *(_QWORD *)(v34 - 8);
        v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48);
        if (v36(v33, 1, v34) == 1)
        {
          swift_retain();
          v37 = 0;
        }
        else
        {
          v49 = v35;
          v38 = *(_QWORD *)(v0 + 64);
          sub_23B90A310(v33, v38, &qword_254309558);
          result = v36(v38, 1, v34);
          if ((_DWORD)result == 1)
          {
            __break(1u);
            return result;
          }
          v39 = *(_QWORD *)(v0 + 64);
          v48 = objc_allocWithZone((Class)FMLDevice);
          swift_retain();
          sub_23B90D988();
          v47 = (void *)sub_23B90DCE8();
          swift_bridgeObjectRelease();
          sub_23B90D97C();
          v40 = (void *)sub_23B90DCE8();
          swift_bridgeObjectRelease();
          sub_23B90D964();
          v41 = (void *)sub_23B90DCE8();
          swift_bridgeObjectRelease();
          v42 = sub_23B90D9AC();
          v43 = sub_23B90D970();
          v44 = sub_23B90D994();
          LOBYTE(v46) = sub_23B90D9A0() & 1;
          v37 = objc_msgSend(v48, sel_initWithIdentifier_deviceName_idsDeviceId_isActive_isThisDevice_isCompanion_isAutoMeCapable_, v47, v40, v41, v42 & 1, v43 & 1, v44 & 1, v46);

          (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v39, v34);
        }
        v32(v37);

        sub_23B90A254((uint64_t)v32);
      }
      sub_23B909E6C(*(_QWORD *)(v0 + 88), &qword_254309558);
    }
    else
    {
      if (qword_2543095D0 != -1)
        swift_once();
      v25 = sub_23B90DC7C();
      __swift_project_value_buffer(v25, (uint64_t)qword_254309678);
      v26 = sub_23B90DC64();
      v27 = sub_23B90DDF0();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_23B8EC000, v26, v27, "Unknown me device update type", v28, 2u);
        MEMORY[0x242608C00](v28, -1, -1);
      }
      v30 = *(_QWORD *)(v0 + 104);
      v29 = *(_QWORD *)(v0 + 112);
      v31 = *(_QWORD *)(v0 + 96);

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    }
    v45 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v45;
    *v45 = v0;
    v45[1] = sub_23B8FA860;
    return sub_23B90DDC0();
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  if (qword_2543095D0 != -1)
    swift_once();
  v4 = sub_23B90DC7C();
  __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
  v5 = sub_23B90DC64();
  v6 = sub_23B90DDFC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B8EC000, v5, v6, "Successfully startMonitoringActiveLocationSharingDevice", v7, 2u);
    MEMORY[0x242608C00](v7, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FAFC0(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23B90A3F0;
  return ObjCBootstrap.startMonitoringActiveLocationSharingDevice()();
}

uint64_t ObjCBootstrap.setActiveLocationSharingDevice(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_23B8FB068()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 56);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FB104;
  return sub_23B90DF64();
}

uint64_t sub_23B8FB104()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FB160()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 88) = v1;
  swift_retain();
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_23B8FB31C;
    return sub_23B90DB2C();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23B8EC000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x242608C00](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8FB31C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FB380()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B8EC000, v2, v3, "Successfully set active location sharing device", v4, 2u);
    MEMORY[0x242608C00](v4, -1, -1);
  }

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FB46C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 104);
  v2 = sub_23B90DC7C();
  __swift_project_value_buffer(v2, (uint64_t)qword_254309678);
  v3 = v1;
  v4 = sub_23B90DC64();
  v5 = sub_23B90DDF0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 104);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138543362;
    v10 = sub_23B90D838();
    *(_QWORD *)(v0 + 32) = v10;
    sub_23B90DE68();
    *v9 = v10;

    _os_log_impl(&dword_23B8EC000, v4, v5, "Error setting active location sharing device: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095B0);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v9, -1, -1);
    MEMORY[0x242608C00](v8, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FB74C(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_23B90DCF4();
  v7 = v6;
  v3[4] = v6;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc();
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_23B90A364;
  v9[6] = v7;
  v9[7] = v8;
  v9[5] = v5;
  v9[8] = swift_getObjectType();
  return swift_task_switch();
}

uint64_t ObjCBootstrap.getActiveLocationSharingDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  v1[7] = swift_getObjectType();
  v2 = sub_23B90D9B8();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FB880()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 48);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FB91C;
  return sub_23B90DF64();
}

uint64_t sub_23B8FB91C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FB978()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 120) = v1;
  swift_retain();
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v2;
    *v2 = v0;
    v2[1] = sub_23B8FBB54;
    return sub_23B90DB14();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v4 = sub_23B90DC7C();
    __swift_project_value_buffer(v4, (uint64_t)qword_254309678);
    v5 = sub_23B90DC64();
    v6 = sub_23B90DDF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23B8EC000, v5, v6, "Missing FindMyLocate.Session!", v7, 2u);
      MEMORY[0x242608C00](v7, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8FBB54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FBBB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
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
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v23;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = sub_23B90DC7C();
  __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v1, v2, v3);
  v7 = sub_23B90DC64();
  v8 = sub_23B90DDFC();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 72);
  if (v9)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v23 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_23B8F1000(&qword_256A54B80, (uint64_t (*)(uint64_t))MEMORY[0x24BE32060], MEMORY[0x24BE32080]);
    v15 = sub_23B90DF58();
    *(_QWORD *)(v0 + 40) = sub_23B904C6C(v15, v16, &v23);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v10, v11);
    _os_log_impl(&dword_23B8EC000, v7, v8, "Successfully get active location sharing device: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v14, -1, -1);
    MEMORY[0x242608C00](v13, -1, -1);
  }
  else
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
  }

  v18 = *(_QWORD *)(v0 + 96);
  v19 = *(_QWORD *)(v0 + 80);
  v20 = *(_QWORD *)(v0 + 64);
  sub_23B909DF0(0, &qword_256A54B78);
  v6(v19, v18, v20);
  v21 = sub_23B90A478(v19);
  swift_release();
  v17(v18, v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v21);
}

uint64_t sub_23B8FBE24()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = sub_23B90DC7C();
  __swift_project_value_buffer(v2, (uint64_t)qword_254309678);
  v3 = v1;
  v4 = sub_23B90DC64();
  v5 = sub_23B90DDF0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 136);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138543362;
    v10 = sub_23B90D838();
    *(_QWORD *)(v0 + 32) = v10;
    sub_23B90DE68();
    *v9 = v10;

    _os_log_impl(&dword_23B8EC000, v4, v5, "Error getting active location sharing device: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095B0);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v9, -1, -1);
    MEMORY[0x242608C00](v8, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FC10C(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23B8FC16C;
  return ObjCBootstrap.getActiveLocationSharingDevice()();
}

uint64_t sub_23B8FC16C(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 24);
  if (v3)
  {
    v8 = (void *)sub_23B90D838();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t ObjCBootstrap.getFriends(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[28] = a1;
  v2[29] = v1;
  v2[30] = swift_getObjectType();
  v3 = sub_23B90DA24();
  v2[31] = v3;
  v2[32] = *(_QWORD *)(v3 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v4 = sub_23B90DC88();
  v2[37] = v4;
  v2[38] = *(_QWORD *)(v4 - 8);
  v2[39] = swift_task_alloc();
  v5 = sub_23B90DCA0();
  v2[40] = v5;
  v2[41] = *(_QWORD *)(v5 - 8);
  v2[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FC30C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 232);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FC3A8;
  return sub_23B90DF64();
}

uint64_t sub_23B8FC3A8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FC404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 360) = v1;
  swift_retain();
  if (v1)
  {
    switch(*(_QWORD *)(v0 + 224))
    {
      case 0:
        v13 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 368) = v13;
        *v13 = v0;
        v13[1] = sub_23B8FC854;
        result = sub_23B90DA9C();
        break;
      case 1:
        v14 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 392) = v14;
        *v14 = v0;
        v14[1] = sub_23B8FCD44;
        result = sub_23B90DB20();
        break;
      case 2:
      case 3:
        if (qword_2543095D0 != -1)
          swift_once();
        v2 = sub_23B90DC7C();
        __swift_project_value_buffer(v2, (uint64_t)qword_254309678);
        v3 = sub_23B90DC64();
        v4 = sub_23B90DDFC();
        if (!os_log_type_enabled(v3, v4))
          goto LABEL_17;
        v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v5 = 0;
        v6 = "getFriends with unsupported handle Type, return emtpy list";
        goto LABEL_16;
      case 4:
        v15 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 416) = v15;
        *v15 = v0;
        v15[1] = sub_23B8FD234;
        result = sub_23B90DB08();
        break;
      default:
        if (qword_2543095D0 != -1)
          swift_once();
        v12 = sub_23B90DC7C();
        __swift_project_value_buffer(v12, (uint64_t)qword_254309678);
        v3 = sub_23B90DC64();
        v4 = sub_23B90DDF0();
        if (os_log_type_enabled(v3, v4))
        {
          v5 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v5 = 0;
          v6 = "getFriends with unknown handle Type, return empty list";
LABEL_16:
          _os_log_impl(&dword_23B8EC000, v3, v4, v6, v5, 2u);
          MEMORY[0x242608C00](v5, -1, -1);
        }
LABEL_17:
        swift_release();

        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        result = (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
        break;
    }
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v7 = sub_23B90DC7C();
    __swift_project_value_buffer(v7, (uint64_t)qword_254309678);
    v8 = sub_23B90DC64();
    v9 = sub_23B90DDF0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23B8EC000, v8, v9, "Missing FindMyLocate.Session!", v10, 2u);
      MEMORY[0x242608C00](v10, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 200) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_23B8FC854(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 376) = a1;
  *(_QWORD *)(v3 + 384) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FC8C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0[47];
  v2 = v0[42];
  v3 = v0[39];
  v32 = v0[41];
  v33 = v0[40];
  v5 = v0[37];
  v4 = v0[38];
  v6 = (void *)v0[29];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[12] = sub_23B908A10;
  v0[13] = v7;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_23B8F5B44;
  v0[11] = &block_descriptor_61;
  v8 = _Block_copy(v0 + 8);
  v9 = v6;
  swift_bridgeObjectRetain();
  sub_23B90DC94();
  v0[26] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v2, v33);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  v10 = sub_23B90DC7C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v11 = sub_23B90DC64();
  v12 = sub_23B90DDFC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = v0[31];
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v34 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x242608570](v16, v13);
    v19 = v18;
    swift_bridgeObjectRelease();
    v0[27] = sub_23B904C6C(v17, v19, &v34);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v11, v12, "Followers: %s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v15, -1, -1);
    MEMORY[0x242608C00](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v20 = MEMORY[0x24BEE4AF8];
  v21 = v0[47];
  v34 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v23 = v0[32];
    sub_23B909DF0(0, &qword_254309588);
    v24 = v21 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v25 = *(_QWORD *)(v23 + 72);
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v27 = v0[35];
      v28 = v0[36];
      v29 = v0[31];
      v26(v28, v24, v29);
      v26(v27, v28, v29);
      FMLFriend.init(_:)(v27);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v28, v29);
      MEMORY[0x24260854C](v30);
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23B90DD6C();
      sub_23B90DD78();
      sub_23B90DD60();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    v20 = v34;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v0[1])(v20);
}

uint64_t sub_23B8FCD44(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 400) = a1;
  *(_QWORD *)(v3 + 408) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FCDB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0[50];
  v2 = v0[42];
  v3 = v0[39];
  v32 = v0[41];
  v33 = v0[40];
  v5 = v0[37];
  v4 = v0[38];
  v6 = (void *)v0[29];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[6] = sub_23B9089EC;
  v0[7] = v7;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23B8F5B44;
  v0[5] = &block_descriptor_54;
  v8 = _Block_copy(v0 + 2);
  v9 = v6;
  swift_bridgeObjectRetain();
  sub_23B90DC94();
  v0[23] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v2, v33);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  v10 = sub_23B90DC7C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v11 = sub_23B90DC64();
  v12 = sub_23B90DDFC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = v0[31];
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v34 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x242608570](v16, v13);
    v19 = v18;
    swift_bridgeObjectRelease();
    v0[24] = sub_23B904C6C(v17, v19, &v34);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v11, v12, "Followings: %s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v15, -1, -1);
    MEMORY[0x242608C00](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v20 = MEMORY[0x24BEE4AF8];
  v21 = v0[50];
  v34 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v23 = v0[32];
    sub_23B909DF0(0, &qword_254309588);
    v24 = v21 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v25 = *(_QWORD *)(v23 + 72);
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v28 = v0[34];
      v27 = v0[35];
      v29 = v0[31];
      v26(v28, v24, v29);
      v26(v27, v28, v29);
      FMLFriend.init(_:)(v27);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v28, v29);
      MEMORY[0x24260854C](v30);
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23B90DD6C();
      sub_23B90DD78();
      sub_23B90DD60();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    v20 = v34;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v0[1])(v20);
}

uint64_t sub_23B8FD234(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 424) = a1;
  *(_QWORD *)(v3 + 432) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FD2A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0[53];
  v2 = v0[42];
  v3 = v0[39];
  v32 = v0[41];
  v33 = v0[40];
  v5 = v0[37];
  v4 = v0[38];
  v6 = (void *)v0[29];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[18] = sub_23B908920;
  v0[19] = v7;
  v0[14] = MEMORY[0x24BDAC760];
  v0[15] = 1107296256;
  v0[16] = sub_23B8F5B44;
  v0[17] = &block_descriptor;
  v8 = _Block_copy(v0 + 14);
  v9 = v6;
  swift_bridgeObjectRetain();
  sub_23B90DC94();
  v0[20] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v2, v33);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  v10 = sub_23B90DC7C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v11 = sub_23B90DC64();
  v12 = sub_23B90DDFC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = v0[31];
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v34 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x242608570](v16, v13);
    v19 = v18;
    swift_bridgeObjectRelease();
    v0[21] = sub_23B904C6C(v17, v19, &v34);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v11, v12, "Pending Offers: %s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v15, -1, -1);
    MEMORY[0x242608C00](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v20 = MEMORY[0x24BEE4AF8];
  v21 = v0[53];
  v34 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v23 = v0[32];
    sub_23B909DF0(0, &qword_254309588);
    v24 = v21 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v25 = *(_QWORD *)(v23 + 72);
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v27 = v0[35];
      v28 = v0[33];
      v29 = v0[31];
      v26(v28, v24, v29);
      v26(v27, v28, v29);
      FMLFriend.init(_:)(v27);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v28, v29);
      MEMORY[0x24260854C](v30);
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23B90DD6C();
      sub_23B90DD78();
      sub_23B90DD60();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    v20 = v34;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v0[1])(v20);
}

uint64_t sub_23B8FD728()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FD7A8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FD828()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23B8FD8A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543095B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E48);
  v6 = sub_23B90DF40();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23B90A310(v12, (uint64_t)v5, &qword_2543095B8);
    v14 = *v5;
    v15 = v5[1];
    result = sub_23B905A88(*v5, v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_23B90DA24();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_23B8FDA50(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int isUniquelyReferenced_nonNull_native;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  unint64_t *v44;
  uint64_t result;
  _QWORD v46[2];
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;

  v6 = sub_23B90DA60();
  v54 = *(_QWORD *)(v6 - 8);
  v55 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v53 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B90DA24();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v46 - v13;
  v15 = sub_23B8FD8A8(MEMORY[0x24BEE4AF8]);
  v16 = *(_QWORD *)(a2 + 16);
  if (v16)
  {
    v47 = a1;
    v48 = a3;
    v17 = (char *)(a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
    v18 = *(_QWORD *)(v9 + 72);
    v52 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v46[1] = a2;
    swift_bridgeObjectRetain();
    v50 = v18;
    v51 = v12;
    v49 = v9;
    while (1)
    {
      v56 = v17;
      v57 = v16;
      v21 = v14;
      v22 = v8;
      v23 = v14;
      v24 = v8;
      v25 = v52;
      v52(v21, v17, v22);
      v26 = v53;
      sub_23B90DA0C();
      v27 = sub_23B90DA30();
      v29 = v28;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v26, v55);
      v25(v12, v23, v24);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v58 = (_QWORD *)v15;
      v32 = sub_23B905A88(v27, v29, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
      v33 = *(_QWORD *)(v15 + 16);
      v34 = (v31 & 1) == 0;
      v35 = v33 + v34;
      if (__OFADD__(v33, v34))
        break;
      v36 = v31;
      if (*(_QWORD *)(v15 + 24) >= v35)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_23B906D5C();
      }
      else
      {
        sub_23B905E30(v35, isUniquelyReferenced_nonNull_native);
        v37 = sub_23B905A88(v27, v29, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
        if ((v36 & 1) != (v38 & 1))
          goto LABEL_18;
        v32 = v37;
      }
      v8 = v24;
      v39 = v58;
      v14 = v23;
      if ((v36 & 1) != 0)
      {
        v19 = v49;
        v20 = v50;
        v12 = v51;
        (*(void (**)(unint64_t, char *, uint64_t))(v49 + 40))(v58[7] + v32 * v50, v51, v8);
      }
      else
      {
        v58[(v32 >> 6) + 8] |= 1 << v32;
        v40 = (uint64_t *)(v39[6] + 16 * v32);
        *v40 = v27;
        v40[1] = v29;
        v19 = v49;
        v20 = v50;
        v12 = v51;
        (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v39[7] + v32 * v50, v51, v8);
        v41 = v39[2];
        v42 = __OFADD__(v41, 1);
        v43 = v41 + 1;
        if (v42)
          goto LABEL_17;
        v39[2] = v43;
        swift_bridgeObjectRetain();
      }
      v15 = (unint64_t)v58;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v8);
      v17 = &v56[v20];
      v16 = v57 - 1;
      if (v57 == 1)
      {
        swift_bridgeObjectRelease();
        a1 = v47;
        a3 = v48;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_23B90DF7C();
    __break(1u);
  }
  else
  {
LABEL_15:
    v44 = (unint64_t *)(a1 + *a3);
    swift_beginAccess();
    *v44 = v15;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23B8FDEC0(uint64_t a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  _QWORD *v6;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  *v6 = v3;
  v6[1] = sub_23B8FDF34;
  return ObjCBootstrap.getFriends(with:)(a1);
}

uint64_t sub_23B8FDF34()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v6 = sub_23B90D838();

    v7 = 0;
    v8 = (void *)v6;
  }
  else
  {
    sub_23B909DF0(0, &qword_254309588);
    v7 = sub_23B90DD3C();
    swift_bridgeObjectRelease();
    v6 = 0;
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 24);
  v9[2](v9, v7, v6);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t ObjCBootstrap.canShareLocationWithHandle(_:isFromGroup:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 152) = a2;
  *(_QWORD *)(v3 + 128) = a1;
  *(_QWORD *)(v3 + 136) = v2;
  return swift_task_switch();
}

uint64_t sub_23B8FE02C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(unsigned __int8 *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23B8FE0D4;
  v4 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v5 = (_QWORD *)(v0 + 80);
  v5[1] = 0x40000000;
  v5[2] = sub_23B8FE180;
  v5[3] = &block_descriptor_62;
  v5[4] = v4;
  objc_msgSend(v2, sel_friendshipStateWithHandle_isFromGroup_completionHandler_, v3, v1, v5);
  return swift_continuation_await();
}

uint64_t sub_23B8FE0D4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23B8FE134()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_23B8FE144()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FE180(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E70);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23B8FE338(void *a1, char a2, void *aBlock, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;

  *(_BYTE *)(v4 + 160) = a2;
  *(_QWORD *)(v4 + 128) = a1;
  *(_QWORD *)(v4 + 136) = a4;
  *(_QWORD *)(v4 + 144) = _Block_copy(aBlock);
  v7 = a1;
  v8 = a4;
  return swift_task_switch();
}

uint64_t sub_23B8FE390()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(unsigned __int8 *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23B8FE438;
  v4 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v5 = (_QWORD *)(v0 + 80);
  v5[1] = 0x40000000;
  v5[2] = sub_23B8FE180;
  v5[3] = &block_descriptor_155;
  v5[4] = v4;
  objc_msgSend(v2, sel_friendshipStateWithHandle_isFromGroup_completionHandler_, v3, v1, v5);
  return swift_continuation_await();
}

uint64_t sub_23B8FE438()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23B8FE498()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, v3, 0);
  _Block_release(*(const void **)(v0 + 144));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FE4F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  v4 = *(void **)(v0 + 128);
  v3 = *(void **)(v0 + 136);
  swift_willThrow();

  v5 = (void *)sub_23B90D838();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

  _Block_release(*(const void **)(v0 + 144));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ObjCBootstrap.friendshipStateWithHandle(_:isFromGroup:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 144) = a2;
  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = v2;
  *(_QWORD *)(v3 + 48) = swift_getObjectType();
  v4 = sub_23B90DA60();
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 72) = swift_task_alloc();
  v5 = sub_23B90D8F8();
  *(_QWORD *)(v3 + 80) = v5;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FE60C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FE6A8;
  return sub_23B90DF64();
}

uint64_t sub_23B8FE6A8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FE704()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 120) = v1;
  swift_retain();
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 32), sel_identifier);
    sub_23B90DCF4();

    sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
    sub_23B90DA54();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v3;
    *v3 = v0;
    v3[1] = sub_23B8FE950;
    return sub_23B90DAB4();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v5 = sub_23B90DC7C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
    v6 = sub_23B90DC64();
    v7 = sub_23B90DDF0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23B8EC000, v6, v7, "Missing FindMyLocate.Session!", v8, 2u);
      MEMORY[0x242608C00](v8, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8FE950()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[8] + 8))(v2[9], v2[7]);
  return swift_task_switch();
}

uint64_t sub_23B8FE9C4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1 = sub_23B90D8E0();
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  if ((v1 & 1) != 0)
  {
    v5 = sub_23B90D8EC();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    v6 = ~v5 & 1;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_release();
    v6 = 2;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_23B8FEA78()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FEBF8(void *a1, char a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  _QWORD *v9;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v8 = a1;
  a4;
  v9 = (_QWORD *)swift_task_alloc();
  v4[5] = v9;
  *v9 = v4;
  v9[1] = sub_23B8FEC7C;
  return ObjCBootstrap.friendshipStateWithHandle(_:isFromGroup:)((uint64_t)v8, a2);
}

uint64_t sub_23B8FEC7C(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = *(void **)(*v2 + 16);
  v4 = *(void **)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(_QWORD *)(v6 + 32);
  if (v1)
  {
    v8 = (void *)sub_23B90D838();

    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(v6 + 32), a1, 0);
  }
  _Block_release(*(const void **)(v6 + 32));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t ObjCBootstrap.getOfferExpirationForHandle(_:groupId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  v5[9] = swift_getObjectType();
  v6 = sub_23B90DA60();
  v5[10] = v6;
  v5[11] = *(_QWORD *)(v6 - 8);
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B8FEDA4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 64);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v2;
  *v2 = v0;
  v2[1] = sub_23B8FEE40;
  return sub_23B90DF64();
}

uint64_t sub_23B8FEE40()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B8FEE9C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 120) = v1;
  swift_retain();
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 40), sel_identifier);
    sub_23B90DCF4();

    sub_23B8F0E5C(MEMORY[0x24BEE4AF8]);
    sub_23B90DA54();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v3;
    *v3 = v0;
    v3[1] = sub_23B8FF0CC;
    return sub_23B90DAC0();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v5 = sub_23B90DC7C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
    v6 = sub_23B90DC64();
    v7 = sub_23B90DDF0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23B8EC000, v6, v7, "Missing FindMyLocate.Session!", v8, 2u);
      MEMORY[0x242608C00](v8, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B8FF0CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[11] + 8))(v2[12], v2[10]);
  return swift_task_switch();
}

uint64_t sub_23B8FF140()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FF180()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B8FF2F4(void *a1, uint64_t a2, const void *a3, void *a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;

  v4[2] = a1;
  v4[3] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  v4[4] = swift_task_alloc();
  v9 = swift_task_alloc();
  v4[5] = v9;
  v4[6] = _Block_copy(a3);
  if (a2)
  {
    a2 = sub_23B90DCF4();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v4[7] = v11;
  v12 = a1;
  a4;
  v13 = (_QWORD *)swift_task_alloc();
  v4[8] = v13;
  *v13 = v4;
  v13[1] = sub_23B8FF3E8;
  return ObjCBootstrap.getOfferExpirationForHandle(_:groupId:)(v9, (uint64_t)v12, a2, v11);
}

uint64_t sub_23B8FF3E8()
{
  void *v0;
  uint64_t *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v2 = (_QWORD *)*v1;
  v4 = *(void **)(*v1 + 16);
  v3 = *(void **)(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))v2[6];
    v7 = (void *)sub_23B90D838();

    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);
    _Block_release(v6);
  }
  else
  {
    v8 = v2[4];
    sub_23B909E28(v2[5], v8, &qword_256A54A40);
    v9 = sub_23B90D874();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
    v12 = 0;
    if (v11 != 1)
    {
      v13 = v2[4];
      v12 = (void *)sub_23B90D850();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    }
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))v2[6];
    ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v12, 0);
    _Block_release(v14);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void __swiftcall ObjCBootstrap.cachedLocation(for:includeAddress:)(FMLLocation_optional *__return_ptr retstr, FMLHandle a2, Swift::Bool includeAddress)
{
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095A8);
  sub_23B90DE20();
}

void sub_23B8FF5AC(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  os_log_type_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45[3];
  uint64_t v46;

  if (qword_2543095D0 != -1)
    swift_once();
  v8 = sub_23B90DC7C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309678);
  v9 = a1;
  v10 = sub_23B90DC64();
  v11 = sub_23B90DDFC();
  if (os_log_type_enabled(v10, v11))
  {
    v42 = a4;
    v12 = swift_slowAlloc();
    v39 = (_QWORD *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v45[0] = v40;
    *(_DWORD *)v12 = 136446722;
    v46 = sub_23B904C6C(0xD000000000000023, 0x800000023B90F330, v45);
    sub_23B90DE68();
    *(_WORD *)(v12 + 12) = 2112;
    v46 = (uint64_t)v9;
    v13 = v9;
    sub_23B90DE68();
    *v39 = v9;

    *(_WORD *)(v12 + 22) = 1024;
    LODWORD(v46) = a2 & 1;
    sub_23B90DE68();
    _os_log_impl(&dword_23B8EC000, v10, v11, "%{public}s for handle: %@ includeAddress: %{BOOL}d", (uint8_t *)v12, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095B0);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v39, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v40, -1, -1);
    v14 = v12;
    a4 = v42;
    MEMORY[0x242608C00](v14, -1, -1);

  }
  else
  {

  }
  v15 = (uint64_t *)(a3 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationForHandles);
  swift_beginAccess();
  v16 = *v15;
  v17 = v9;
  swift_bridgeObjectRetain();
  v18 = sub_23B8FFB50(v17, v16);

  swift_bridgeObjectRelease();
  if (v18 && (a2 & 1) != 0)
  {
    v19 = objc_msgSend(v18, sel_address);

    v20 = v18;
    v21 = sub_23B90DC64();
    v22 = sub_23B90DDFC();
    v23 = os_log_type_enabled(v21, v22);
    if (v19)
    {
      if (v23)
      {
        v24 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v46 = v44;
        *(_DWORD *)v24 = 136315138;
        v25 = v20;
        v26 = objc_msgSend(v25, sel_description);
        v41 = v22;
        v27 = a4;
        v28 = sub_23B90DCF4();
        v30 = v29;

        v31 = v28;
        a4 = v27;
        sub_23B904C6C(v31, v30, &v46);
        sub_23B90DE68();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B8EC000, v21, v41, "Cached location: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v44, -1, -1);
        MEMORY[0x242608C00](v24, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      if (v23)
      {
        v32 = (uint8_t *)swift_slowAlloc();
        v33 = swift_slowAlloc();
        v46 = v33;
        *(_DWORD *)v32 = 136315138;
        v34 = v20;
        v35 = objc_msgSend(v34, sel_description);
        v36 = sub_23B90DCF4();
        v43 = a4;
        v38 = v37;

        sub_23B904C6C(v36, v38, &v46);
        sub_23B90DE68();

        a4 = v43;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B8EC000, v21, v22, "Found cached location: %s, but no address!", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v33, -1, -1);
        MEMORY[0x242608C00](v32, -1, -1);

      }
      else
      {

      }
      v18 = 0;
    }
  }
  *a4 = v18;
}

void *sub_23B8FFB50(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_23B905A58((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_23B90DEE0();

  if (!v4)
    return 0;
  sub_23B909DF0(0, &qword_256A54E68);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t ObjCBootstrap.cachedFriendsSharingLocationWithMe()()
{
  return sub_23B90137C();
}

size_t sub_23B8FFCC8(unint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t ObjectType;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, uint64_t);
  char v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int isUniquelyReferenced_nonNull_native;
  size_t v73;
  unint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  unint64_t v81;
  uint64_t v82;
  char v83;
  NSObject *v84;
  os_log_type_t v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  void (*v91)(char *, uint64_t);
  _QWORD *v92;
  uint64_t *v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t);
  uint64_t v98;
  char *v99;
  NSObject *v100;
  os_log_type_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unsigned int *v105;
  uint64_t *v106;
  unint64_t *v107;
  uint64_t v108;
  os_log_type_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  void (*v118)(char *, uint64_t);
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  void (*v125)(char *, uint64_t);
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v133;
  int v134;
  char *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  unint64_t v160;
  char *v161;
  size_t v162;
  uint64_t v163;
  size_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  char *v173;
  void (*v174)(char *, uint64_t);
  uint64_t v175[2];
  uint64_t v176;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v5);
  v142 = (char *)&v135 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = sub_23B90D88C();
  v138 = *(_QWORD *)(v139 - 8);
  v7 = MEMORY[0x24BDAC7A8](v139);
  v135 = (char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v136 = (char *)&v135 - v9;
  v151 = sub_23B90DC7C();
  v144 = *(_QWORD *)(v151 - 8);
  v10 = MEMORY[0x24BDAC7A8](v151);
  v12 = (char *)&v135 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t)&v135 - v13;
  v15 = sub_23B90DA60();
  v165 = *(_QWORD *)(v15 - 8);
  v166 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v152 = (char *)&v135 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v156 = (char *)&v135 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v155 = (char *)&v135 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v158 = (char *)&v135 - v22;
  v23 = sub_23B90DA24();
  v160 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v159 = (char *)&v135 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v150 = (char *)&v135 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v154 = (char *)&v135 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v153 = (char *)&v135 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v157 = (char *)&v135 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v135 - v34;
  v149 = sub_23B90D874();
  v148 = *(_QWORD *)(v149 - 8);
  MEMORY[0x24BDAC7A8](v149);
  v37 = (char *)&v135 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B90DB50();
  v161 = v37;
  sub_23B90DAA8();
  v145 = a1;
  v143 = ObjectType;
  v140 = v14;
  v137 = v12;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      swift_beginAccess();
      v38 = swift_bridgeObjectRetain();
      v39 = sub_23B906FB8(v38);
      v40 = swift_bridgeObjectRelease();
      break;
    default:
      v40 = sub_23B909758(a1);
      v39 = v40;
      break;
  }
  MEMORY[0x24BDAC7A8](v40);
  v133 = (uint64_t)v161;
  swift_bridgeObjectRetain();
  v41 = sub_23B902CBC(sub_23B909A54, (uint64_t)(&v135 - 4), v39);
  v171 = *(_QWORD *)(v41 + 16);
  if (!v171)
  {
    (*(void (**)(char *, uint64_t))(v148 + 8))(v161, v149);
    goto LABEL_61;
  }
  v170 = sub_23B8FD8A8(MEMORY[0x24BEE4AF8]);
  v163 = *(_QWORD *)(v39 + 16);
  v141 = v2;
  if (!v163)
  {
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v168 = 0;
  v42 = v160;
  v43 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v162 = v39 + v43;
  v167 = v41 + v43;
  swift_bridgeObjectRetain();
  v44 = 0;
  *(_QWORD *)&v45 = 141558275;
  v147 = v45;
  v146 = MEMORY[0x24BEE4AD8] + 8;
  v46 = v157;
  v173 = v35;
  v169 = v41;
  v164 = v39;
  while (2)
  {
    if (v44 >= *(_QWORD *)(v39 + 16))
      goto LABEL_63;
    v14 = *(_QWORD *)(v42 + 72);
    v172 = v44;
    v39 = *(_QWORD *)(v42 + 16);
    ((void (*)(char *, size_t, uint64_t))v39)(v35, v162 + v14 * v44, v23);
    ((void (*)(char *, unint64_t, uint64_t))v39)(v46, v167, v23);
    sub_23B8F1000(&qword_256A54E18, (uint64_t (*)(uint64_t))MEMORY[0x24BE320C8], MEMORY[0x24BE320D8]);
    swift_bridgeObjectRetain();
    v66 = sub_23B90DCDC();
    v174 = *(void (**)(char *, uint64_t))(v42 + 8);
    v174(v46, v23);
    if ((v66 & 1) != 0)
      goto LABEL_8;
    if (v171 == 1)
      goto LABEL_14;
    ((void (*)(char *, unint64_t, uint64_t))v39)(v46, v167 + v14, v23);
    v80 = sub_23B90DCDC();
    v174(v46, v23);
    if ((v80 & 1) != 0)
      goto LABEL_8;
    if (v171 == 2)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      v67 = v152;
      v68 = v173;
      sub_23B90DA0C();
      v41 = sub_23B90DA30();
      v70 = v69;
      (*(void (**)(char *, uint64_t))(v165 + 8))(v67, v166);
      ((void (*)(char *, char *, uint64_t))v39)(v159, v68, v23);
      v71 = v170;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v175[0] = v71;
      v74 = sub_23B905A88(v41, v70, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
      v75 = *(_QWORD *)(v71 + 16);
      v76 = (v73 & 1) == 0;
      v77 = v75 + v76;
      if (!__OFADD__(v75, v76))
      {
        v39 = v73;
        if (*(_QWORD *)(v71 + 24) >= v77)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_23B906D5C();
        }
        else
        {
          sub_23B905E30(v77, isUniquelyReferenced_nonNull_native);
          v78 = sub_23B905A88(v41, v70, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
          if ((v39 & 1) != (v79 & 1))
          {
            sub_23B90DF7C();
            __break(1u);
            goto LABEL_68;
          }
          v74 = v78;
        }
        v35 = v173;
        v92 = (_QWORD *)v175[0];
        if ((v39 & 1) != 0)
        {
          (*(void (**)(unint64_t, char *, uint64_t))(v42 + 40))(*(_QWORD *)(v175[0] + 56) + v74 * v14, v159, v23);
        }
        else
        {
          *(_QWORD *)(v175[0] + 8 * (v74 >> 6) + 64) |= 1 << v74;
          v93 = (uint64_t *)(v92[6] + 16 * v74);
          *v93 = v41;
          v93[1] = v70;
          (*(void (**)(unint64_t, char *, uint64_t))(v42 + 32))(v92[7] + v74 * v14, v159, v23);
          v94 = v92[2];
          v95 = __OFADD__(v94, 1);
          v96 = v94 + 1;
          if (v95)
            goto LABEL_65;
          v92[2] = v96;
          swift_bridgeObjectRetain();
        }
        v170 = v175[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v174(v35, v23);
        v39 = v164;
        goto LABEL_10;
      }
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      swift_once();
LABEL_43:
      v98 = __swift_project_value_buffer(v14, (uint64_t)qword_254309678);
      v99 = (char *)v140;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v140, v98, v14);
      v100 = sub_23B90DC64();
      v101 = sub_23B90DDFC();
      if (!os_log_type_enabled(v100, v101))
      {
LABEL_55:

        (*(void (**)(char *, uint64_t))(v41 + 8))(v99, v14);
        v2 = v141;
        goto LABEL_60;
      }
      v102 = v42;
      v103 = swift_slowAlloc();
      v104 = swift_slowAlloc();
      v175[0] = v104;
      *(_DWORD *)v103 = 141558275;
      v176 = 1752392040;
      sub_23B90DE68();
      *(_WORD *)(v103 + 12) = 2081;
      v164 = v39;
      v174 = (void (*)(char *, uint64_t))v104;
      if (v102 == 2)
      {
        v105 = (unsigned int *)MEMORY[0x24BE31D28];
LABEL_58:
        v119 = v138;
        v120 = v136;
        v121 = v139;
        (*(void (**)(char *, _QWORD, uint64_t))(v138 + 104))(v136, *v105, v139);
        sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
        v122 = sub_23B90DF58();
        v124 = v123;
        (*(void (**)(char *, uint64_t))(v119 + 8))(v120, v121);
        v176 = sub_23B904C6C(v122, v124, v175);
        sub_23B90DE68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B8EC000, v100, v101, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v103, 0x16u);
        v125 = v174;
        swift_arrayDestroy();
        MEMORY[0x242608C00](v125, -1, -1);
        MEMORY[0x242608C00](v103, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v144 + 8))(v140, v151);
        goto LABEL_59;
      }
      if (v102 == 3)
      {
        v105 = (unsigned int *)MEMORY[0x24BE31D30];
        goto LABEL_58;
      }
LABEL_68:
      v134 = 0;
      v133 = 72;
      sub_23B90DF04();
      __break(1u);
      JUMPOUT(0x23B900ED4);
    }
    v81 = v167 + 2 * v14;
    v41 = 2;
    while (1)
    {
      ((void (*)(char *, unint64_t, uint64_t))v39)(v46, v81, v23);
      v82 = v41 + 1;
      if (__OFADD__(v41, 1))
      {
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
      v83 = sub_23B90DCDC();
      v174(v46, v23);
      if ((v83 & 1) != 0)
        break;
      ++v41;
      v81 += v14;
      if (v82 == v171)
        goto LABEL_14;
    }
    v35 = v173;
LABEL_8:
    swift_bridgeObjectRelease();
    v47 = v158;
    sub_23B90DA0C();
    v48 = sub_23B90DA3C();
    v49 = v166;
    v14 = *(_QWORD *)(v165 + 8);
    v50 = ((uint64_t (*)(char *, uint64_t))v14)(v47, v166);
    MEMORY[0x24BDAC7A8](v50);
    v133 = (uint64_t)v161;
    v51 = v168;
    v52 = sub_23B9070D0((uint64_t)sub_23B909B30, (uint64_t)(&v135 - 4), v48);
    swift_bridgeObjectRelease();
    v53 = *(_QWORD *)(v52 + 16);
    v168 = v51;
    if (v53)
    {
      v54 = v156;
      sub_23B90DA0C();
      v55 = v155;
      sub_23B90DA48();
      swift_release();
      ((void (*)(char *, uint64_t))v14)(v54, v49);
      v56 = v153;
      sub_23B90D9C4();
      sub_23B90DA0C();
      v57 = sub_23B90DA30();
      v59 = v58;
      ((void (*)(char *, uint64_t))v14)(v54, v49);
      v60 = v154;
      ((void (*)(char *, char *, uint64_t))v39)(v154, v56, v23);
      v61 = v170;
      v62 = swift_isUniquelyReferenced_nonNull_native();
      v175[0] = v61;
      v63 = (uint64_t)v60;
      v35 = v173;
      sub_23B9066A4(v63, v57, v59, v62);
      v170 = v175[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v64 = v56;
      v46 = v157;
      v65 = v174;
      v174(v64, v23);
      ((void (*)(char *, uint64_t))v14)(v55, v49);
      v65(v35, v23);
      v39 = v164;
      v42 = v160;
    }
    else
    {
      swift_release();
      if (qword_2543095D0 != -1)
        swift_once();
      __swift_project_value_buffer(v151, (uint64_t)qword_254309678);
      v14 = (uint64_t)v150;
      ((void (*)(char *, char *, uint64_t))v39)(v150, v35, v23);
      v84 = sub_23B90DC64();
      v85 = sub_23B90DDFC();
      v86 = os_log_type_enabled(v84, v85);
      v42 = v160;
      if (v86)
      {
        v87 = swift_slowAlloc();
        v88 = swift_slowAlloc();
        v175[0] = v88;
        *(_DWORD *)v87 = v147;
        *(_QWORD *)(v87 + 4) = 1752392040;
        *(_WORD *)(v87 + 12) = 2081;
        sub_23B8F1000(&qword_256A54E38, (uint64_t (*)(uint64_t))MEMORY[0x24BE320C8], MEMORY[0x24BE320E0]);
        v89 = sub_23B90DF58();
        *(_QWORD *)(v87 + 14) = sub_23B904C6C(v89, v90, v175);
        swift_bridgeObjectRelease();
        v91 = v174;
        v174((char *)v14, v23);
        _os_log_impl(&dword_23B8EC000, v84, v85, "friend: %{private,mask.hash}s expired", (uint8_t *)v87, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v88, -1, -1);
        MEMORY[0x242608C00](v87, -1, -1);

        v91(v35, v23);
      }
      else
      {

        v97 = v174;
        v174((char *)v14, v23);
        v97(v35, v23);
      }
      v39 = v164;
    }
LABEL_10:
    v41 = v169;
    v44 = v172 + 1;
    if (v172 + 1 != v163)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = v141;
LABEL_41:
  v42 = v145;
  v14 = v151;
  v41 = v144;
  switch(v145)
  {
    case 0uLL:
      v106 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers;
      goto LABEL_49;
    case 1uLL:
      v106 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings;
      goto LABEL_49;
    case 2uLL:
    case 3uLL:
      if (qword_2543095D0 == -1)
        goto LABEL_43;
      goto LABEL_66;
    case 4uLL:
      v106 = &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers;
LABEL_49:
      v107 = (unint64_t *)&v2[*v106];
      swift_beginAccess();
      *v107 = v170;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_60;
    default:
      if (qword_2543095D0 != -1)
        swift_once();
      v108 = __swift_project_value_buffer(v14, (uint64_t)qword_254309678);
      v99 = v137;
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v137, v108, v14);
      v100 = sub_23B90DC64();
      v109 = sub_23B90DDFC();
      if (!os_log_type_enabled(v100, v109))
        goto LABEL_55;
      v164 = v39;
      v110 = v42;
      v111 = swift_slowAlloc();
      v174 = (void (*)(char *, uint64_t))swift_slowAlloc();
      v175[0] = (uint64_t)v174;
      *(_DWORD *)v111 = 141558275;
      v176 = 1752392040;
      sub_23B90DE68();
      *(_WORD *)(v111 + 12) = 2081;
      if (v110 != 4)
        goto LABEL_68;
      v112 = v138;
      v113 = v135;
      v114 = v139;
      (*(void (**)(char *, _QWORD, uint64_t))(v138 + 104))(v135, *MEMORY[0x24BE31D20], v139);
      sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
      v115 = sub_23B90DF58();
      v117 = v116;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v113, v114);
      v176 = sub_23B904C6C(v115, v117, v175);
      sub_23B90DE68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B8EC000, v100, v109, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v111, 0x16u);
      v118 = v174;
      swift_arrayDestroy();
      MEMORY[0x242608C00](v118, -1, -1);
      MEMORY[0x242608C00](v111, -1, -1);

      (*(void (**)(char *, uint64_t))(v144 + 8))(v137, v151);
      break;
  }
LABEL_59:
  v2 = v141;
  v42 = v145;
  v39 = v164;
LABEL_60:
  v126 = sub_23B90DDA8();
  v127 = (uint64_t)v142;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 56))(v142, 1, 1, v126);
  v128 = (_QWORD *)swift_allocObject();
  v128[2] = 0;
  v128[3] = 0;
  v128[4] = v2;
  v128[5] = v42;
  v129 = v143;
  v128[6] = v39;
  v128[7] = v129;
  v130 = v2;
  sub_23B904578(v127, (uint64_t)&unk_256A54E28, (uint64_t)v128);
  swift_release();
  v131 = swift_bridgeObjectRetain();
  v39 = sub_23B906FB8(v131);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v161, v149);
LABEL_61:
  swift_bridgeObjectRelease();
  return v39;
}

uint64_t ObjCBootstrap.cachedFriendsFollowingMyLocation()()
{
  return sub_23B90137C();
}

uint64_t sub_23B900F14@<X0>(unint64_t a1@<X2>, uint64_t a2@<X3>, unint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  uint64_t v31;
  void (*v32)(char *, size_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  size_t v38;
  uint64_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v9 = sub_23B90DA24();
  v10 = *(_QWORD *)(v9 - 8);
  v42 = v9;
  v43 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v37 - v13;
  v15 = sub_23B8FFCC8(a1);
  if (qword_2543095D0 != -1)
    swift_once();
  v16 = sub_23B90DC7C();
  __swift_project_value_buffer(v16, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v17 = sub_23B90DC64();
  v18 = sub_23B90DDFC();
  v19 = v18;
  v20 = os_log_type_enabled(v17, v18);
  v40 = v4;
  if (v20)
  {
    v21 = swift_slowAlloc();
    LODWORD(v39) = v19;
    v22 = v21;
    v45 = swift_slowAlloc();
    v23 = v45;
    *(_DWORD *)v22 = 136446466;
    v44 = sub_23B904C6C(a2, a3, &v45);
    sub_23B90DE68();
    *(_WORD *)(v22 + 12) = 2080;
    v38 = v22 + 14;
    v24 = swift_bridgeObjectRetain();
    v25 = MEMORY[0x242608570](v24, v42);
    v27 = v26;
    swift_bridgeObjectRelease();
    v44 = sub_23B904C6C(v25, v27, &v45);
    sub_23B90DE68();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B8EC000, v17, (os_log_type_t)v39, "%{public}s: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v23, -1, -1);
    MEMORY[0x242608C00](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v28 = MEMORY[0x24BEE4AF8];
  v45 = MEMORY[0x24BEE4AF8];
  v29 = *(_QWORD *)(v15 + 16);
  if (v29)
  {
    v39 = a4;
    sub_23B909DF0(0, &qword_254309588);
    v30 = v15 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
    v31 = *(_QWORD *)(v43 + 72);
    v32 = *(void (**)(char *, size_t, uint64_t))(v43 + 16);
    v38 = v15;
    swift_bridgeObjectRetain();
    do
    {
      v33 = v42;
      v32(v14, v30, v42);
      v34 = (uint64_t)v41;
      v32(v41, (size_t)v14, v33);
      FMLFriend.init(_:)(v34);
      v35 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v14, v33);
      MEMORY[0x24260854C](v35);
      if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23B90DD6C();
      sub_23B90DD78();
      sub_23B90DD60();
      v30 += v31;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease();
    v28 = v45;
    a4 = v39;
  }
  result = swift_bridgeObjectRelease();
  *a4 = v28;
  return result;
}

id sub_23B9012C0(void *a1)
{
  id v1;
  void *v2;

  swift_getObjectType();
  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309560);
  sub_23B90DE20();

  sub_23B909DF0(0, &qword_254309588);
  v2 = (void *)sub_23B90DD3C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t ObjCBootstrap.cachedFriendsWithPendingOffers()()
{
  return sub_23B90137C();
}

uint64_t sub_23B90137C()
{
  uint64_t v1;

  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309560);
  sub_23B90DE20();
  return v1;
}

uint64_t ObjCBootstrap.cachedOfferExpiration(for:groupId:)()
{
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  return sub_23B90DE20();
}

uint64_t sub_23B90148C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  id v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v71 = a4;
  v68 = a3;
  v69 = a2;
  v5 = sub_23B90DA60();
  v65 = *(_QWORD *)(v5 - 8);
  v66 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54A40);
  v7 = MEMORY[0x24BDAC7A8](v63);
  v62 = (uint64_t)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v72 = (char *)&v62 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v67 = (char *)&v62 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_23B90DA24();
  v15 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v70 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E10);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23B90DA84();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v74 = (uint64_t)&v62 - v25;
  if (!a1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v24, *MEMORY[0x24BE32150], v20);
    sub_23B90DA78();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  swift_bridgeObjectRetain();
  sub_23B90DA6C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v74, *MEMORY[0x24BE32168], v20);
    sub_23B909E6C((uint64_t)v19, &qword_256A54E10);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v74, v19, v20);
  }
  v26 = objc_msgSend(v68, sel_identifier);
  sub_23B90DCF4();

  v27 = sub_23B90DD0C();
  v29 = v28;
  swift_bridgeObjectRelease();
  v30 = (uint64_t *)(v69 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
  swift_beginAccess();
  v31 = *v30;
  if (*(_QWORD *)(v31 + 16))
  {
    swift_bridgeObjectRetain();
    v32 = sub_23B905A88(v27, v29, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
    v33 = (uint64_t)v72;
    v35 = v73;
    if ((v34 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, *(_QWORD *)(v31 + 56) + *(_QWORD *)(v15 + 72) * v32, v73);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v14, 0, 1, v35);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v14, 1, 1, v73);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v14, 1, 1, v73);
    swift_bridgeObjectRelease();
    v33 = (uint64_t)v72;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v35) == 1)
  {
    sub_23B909E6C((uint64_t)v14, &qword_256A54DF8);
    if (qword_2543095D0 != -1)
      swift_once();
    v36 = sub_23B90DC7C();
    __swift_project_value_buffer(v36, (uint64_t)qword_254309678);
    v37 = sub_23B90DC64();
    v38 = sub_23B90DDFC();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_23B8EC000, v37, v38, "Trying to get cached offer expiration for handle that is not a follower, returning nil", v39, 2u);
      MEMORY[0x242608C00](v39, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v74, v20);
    v40 = sub_23B90D874();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v71, 1, 1, v40);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v70, v14, v35);
    v42 = v64;
    sub_23B90DA0C();
    v43 = sub_23B90DA3C();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v42, v66);
    if (*(_QWORD *)(v43 + 16))
    {
      v44 = sub_23B905AF4(v74);
      v45 = (uint64_t)v67;
      if ((v46 & 1) != 0)
      {
        v47 = v44;
        v48 = *(_QWORD *)(v43 + 56);
        v49 = sub_23B90D874();
        v50 = *(_QWORD *)(v49 - 8);
        v51 = v48 + *(_QWORD *)(v50 + 72) * v47;
        v35 = v73;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v45, v51, v49);
        v52 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v50 + 56);
        v33 = (uint64_t)v72;
        v52(v45, 0, 1, v49);
      }
      else
      {
        v54 = sub_23B90D874();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v45, 1, 1, v54);
      }
    }
    else
    {
      v53 = sub_23B90D874();
      v45 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v67, 1, 1, v53);
    }
    swift_bridgeObjectRelease();
    if (qword_2543095D0 != -1)
      swift_once();
    v55 = sub_23B90DC7C();
    __swift_project_value_buffer(v55, (uint64_t)qword_254309678);
    sub_23B90A310(v45, v33, &qword_256A54A40);
    v56 = sub_23B90DC64();
    v57 = sub_23B90DDFC();
    if (os_log_type_enabled(v56, v57))
    {
      v72 = (char *)v20;
      v69 = v21;
      v58 = (uint8_t *)swift_slowAlloc();
      v59 = swift_slowAlloc();
      v76 = v59;
      *(_DWORD *)v58 = 136315138;
      sub_23B90A310(v33, v62, &qword_256A54A40);
      v60 = sub_23B90DD00();
      v75 = sub_23B904C6C(v60, v61, &v76);
      sub_23B90DE68();
      v45 = (uint64_t)v67;
      swift_bridgeObjectRelease();
      sub_23B909E6C(v33, &qword_256A54A40);
      _os_log_impl(&dword_23B8EC000, v56, v57, "Expiration date: %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242608C00](v59, -1, -1);
      MEMORY[0x242608C00](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v15 + 8))(v70, v73);
      (*(void (**)(uint64_t, char *))(v69 + 8))(v74, v72);
    }
    else
    {

      sub_23B909E6C(v33, &qword_256A54A40);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v70, v35);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v74, v20);
    }
    return sub_23B909E28(v45, v71, &qword_256A54A40);
  }
}

uint64_t ObjCBootstrap.cachedCanShareLocationWithHandle(_:isFromGroup:)()
{
  uint64_t v1;

  swift_getObjectType();
  type metadata accessor for FMLLocationShareState(0);
  sub_23B90DE20();
  return v1;
}

uint64_t sub_23B901E6C@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
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
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  char **p_type;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v49)(uint64_t, uint64_t, uint64_t);
  int v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char v58;
  char v59;
  char v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t result;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  int v105;
  uint64_t v106;
  uint64_t v107[4];
  int v108;
  char v109;

  v101 = a4;
  v108 = a2;
  v6 = sub_23B90DA84();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v86 - v11;
  v94 = sub_23B90DA60();
  v93 = *(_QWORD *)(v94 - 8);
  v13 = MEMORY[0x24BDAC7A8](v94);
  v88 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v91 = (char *)&v86 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54DF8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v97 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v99 = (char *)&v86 - v19;
  v20 = sub_23B90DA24();
  v102 = *(_QWORD *)(v20 - 8);
  v103 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v100 = (char *)&v86 - v24;
  if (qword_2543095D0 != -1)
    swift_once();
  v25 = sub_23B90DC7C();
  v26 = __swift_project_value_buffer(v25, (uint64_t)qword_254309678);
  v27 = a1;
  v98 = v26;
  v28 = sub_23B90DC64();
  v29 = sub_23B90DDFC();
  v30 = os_log_type_enabled(v28, v29);
  v95 = v7;
  v96 = v6;
  v104 = v27;
  v89 = v10;
  v90 = v23;
  v92 = v12;
  if (v30)
  {
    v31 = swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    v87 = swift_slowAlloc();
    v107[0] = v87;
    *(_DWORD *)v31 = 136446722;
    v106 = sub_23B904C6C(0xD000000000000030, 0x800000023B90F200, v107);
    sub_23B90DE68();
    *(_WORD *)(v31 + 12) = 2112;
    v106 = (uint64_t)v104;
    v33 = v104;
    v27 = v104;
    sub_23B90DE68();
    *v32 = v27;

    *(_WORD *)(v31 + 22) = 1024;
    LODWORD(v106) = v108 & 1;
    sub_23B90DE68();
    _os_log_impl(&dword_23B8EC000, v28, v29, "%{public}s for handle: %@ isFromGroup: %{BOOL}d", (uint8_t *)v31, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095B0);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v32, -1, -1);
    v34 = v87;
    swift_arrayDestroy();
    MEMORY[0x242608C00](v34, -1, -1);
    MEMORY[0x242608C00](v31, -1, -1);

  }
  else
  {

  }
  v109 = 0;
  p_type = &stru_250C9FFF0.type;
  v36 = objc_msgSend(v27, sel_identifier);
  sub_23B90DCF4();

  v37 = sub_23B90DD0C();
  v39 = v38;
  swift_bridgeObjectRelease();
  v40 = (uint64_t *)(a3 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
  swift_beginAccess();
  v41 = *v40;
  v42 = (uint64_t)v99;
  if (*(_QWORD *)(v41 + 16))
  {
    swift_bridgeObjectRetain();
    v43 = sub_23B905A88(v37, v39, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
    v44 = a3;
    v47 = v102;
    v46 = v103;
    if ((v45 & 1) != 0)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v102 + 16))(v42, *(_QWORD *)(v41 + 56) + *(_QWORD *)(v102 + 72) * v43, v103);
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56);
      v48(v42, 0, 1, v46);
    }
    else
    {
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
      v48(v42, 1, 1, v103);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = a3;
    v47 = v102;
    v46 = v103;
    v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
    v48((uint64_t)v99, 1, 1, v103);
  }
  swift_bridgeObjectRelease();
  v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  v50 = v49(v42, 1, v46);
  v51 = v100;
  if (v50 == 1)
  {
    sub_23B909E6C(v42, &qword_256A54DF8);
    if ((v109 & 1) == 0)
      goto LABEL_21;
LABEL_18:
    v60 = 1;
    goto LABEL_36;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v100, v42, v46);
  if ((v108 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v51, v46);
    goto LABEL_33;
  }
  v52 = v91;
  sub_23B90DA0C();
  v53 = sub_23B90DA3C();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v52, v94);
  v55 = v95;
  v54 = v96;
  v56 = (uint64_t)v92;
  (*(void (**)(char *, _QWORD, uint64_t))(v95 + 104))(v92, *MEMORY[0x24BE32148], v96);
  if (*(_QWORD *)(v53 + 16))
  {
    sub_23B905AF4(v56);
    v57 = v51;
    v59 = v58;
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v54);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v102 + 8))(v57, v103);
    v109 = v59 & 1;
    p_type = (char **)(&stru_250C9FFF0 + 16);
    if ((v59 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v54);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v102 + 8))(v51, v103);
    v109 = 0;
    p_type = &stru_250C9FFF0.type;
  }
LABEL_21:
  v61 = objc_msgSend(v104, p_type[330]);
  sub_23B90DCF4();

  v62 = sub_23B90DD0C();
  v64 = v63;
  swift_bridgeObjectRelease();
  v65 = (uint64_t *)(v44 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers);
  swift_beginAccess();
  v66 = *v65;
  if (*(_QWORD *)(v66 + 16))
  {
    swift_bridgeObjectRetain();
    v67 = sub_23B905A88(v62, v64, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
    v69 = v102;
    v68 = v103;
    v70 = (uint64_t)v97;
    if ((v71 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v102 + 16))(v97, *(_QWORD *)(v66 + 56) + *(_QWORD *)(v102 + 72) * v67, v103);
      v72 = (char *)v70;
      v73 = 0;
    }
    else
    {
      v72 = v97;
      v73 = 1;
    }
    v48((uint64_t)v72, v73, 1, v68);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v70 = (uint64_t)v97;
    v68 = v103;
    v48((uint64_t)v97, 1, 1, v103);
    swift_bridgeObjectRelease();
    v69 = v102;
  }
  if (v49(v70, 1, v68) == 1)
  {
    sub_23B909E6C(v70, &qword_256A54DF8);
    v60 = v109;
    goto LABEL_36;
  }
  v74 = v70;
  v75 = v90;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v90, v74, v68);
  if ((v108 & 1) != 0)
  {
    v76 = v88;
    sub_23B90DA0C();
    v77 = sub_23B90DA3C();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v76, v94);
    v79 = v95;
    v78 = v96;
    v80 = (uint64_t)v89;
    (*(void (**)(char *, _QWORD, uint64_t))(v95 + 104))(v89, *MEMORY[0x24BE32148], v96);
    if (*(_QWORD *)(v77 + 16))
    {
      sub_23B905AF4(v80);
      v60 = v81;
    }
    else
    {
      v60 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v80, v78);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v102 + 8))(v75, v103);
    v109 = v60 & 1;
    goto LABEL_36;
  }
  (*(void (**)(char *, uint64_t))(v69 + 8))(v75, v68);
LABEL_33:
  v60 = 1;
  v109 = 1;
LABEL_36:
  v82 = sub_23B90DC64();
  v83 = sub_23B90DDFC();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v84 = 67109120;
    v105 = v60 & 1;
    sub_23B90DE68();
    _os_log_impl(&dword_23B8EC000, v82, v83, "hasShared: %{BOOL}d", v84, 8u);
    MEMORY[0x242608C00](v84, -1, -1);
  }

  result = swift_beginAccess();
  *v101 = (v109 & 1) == 0;
  return result;
}

uint64_t ObjCBootstrap.processLocationPayload(payload:)()
{
  uint64_t v0;

  return sub_23B908B20(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23B9029B4(void *a1, void *aBlock, void *a3)
{
  uint64_t v3;
  void (**v6)(void *, _QWORD);
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v7 = a1;
  v8 = a3;
  v9 = sub_23B90D844();
  v11 = v10;

  sub_23B908D10(v9, v11);
  v6[2](v6, 0);
  _Block_release(v6);
  return sub_23B908DCC(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_23B902B80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  char v8;
  _BYTE v10[16];
  uint64_t v11;

  v3 = sub_23B90DA60();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23B90DA0C();
  v7 = sub_23B90DA3C();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  v11 = a2;
  v8 = sub_23B909B48(v7, (uint64_t (*)(char *, char *))sub_23B909DE8);
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_23B902C4C()
{
  sub_23B90D874();
  sub_23B8F1000(&qword_256A54E60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  return (sub_23B90DCD0() & 1) == 0;
}

uint64_t sub_23B902CBC(uint64_t (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v27 = sub_23B90DA24();
  v7 = *(_QWORD *)(v27 - 8);
  v8 = MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  v25 = *(_QWORD *)(a3 + 16);
  if (v25)
  {
    v14 = 0;
    v22 = a2;
    v23 = a3;
    v21 = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v27);
      v16 = a1(v12);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v27);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if ((v16 & 1) != 0)
      {
        v24 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v24(v26, v12, v27);
        v17 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23B9052D8(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v28;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_23B9052D8(v18 > 1, v19 + 1, 1);
          v17 = v28;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(v17 + v15 + v19 * v13, v26, v27);
        v28 = v17;
        a3 = v23;
        a1 = v21;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v27);
      }
      if (v25 == ++v14)
      {
        v13 = v28;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_23B902ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(void);

  v6[29] = a5;
  v6[30] = a6;
  v6[28] = a4;
  v7 = sub_23B90D88C();
  v6[31] = v7;
  v6[32] = *(_QWORD *)(v7 - 8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v8 = sub_23B90DC7C();
  v6[35] = v8;
  v6[36] = *(_QWORD *)(v8 - 8);
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  v9 = sub_23B90DC88();
  v6[39] = v9;
  v6[40] = *(_QWORD *)(v9 - 8);
  v6[41] = swift_task_alloc();
  v10 = sub_23B90DCA0();
  v6[42] = v10;
  v6[43] = *(_QWORD *)(v10 - 8);
  v6[44] = swift_task_alloc();
  v13 = (uint64_t (*)(void))((char *)&dword_256A54F50 + dword_256A54F50);
  v11 = (_QWORD *)swift_task_alloc();
  v6[45] = v11;
  *v11 = v6;
  v11[1] = sub_23B902FF4;
  return v13();
}

uint64_t sub_23B902FF4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = a1;
  swift_task_dealloc();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23B903054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  if (*(_QWORD *)(v0 + 368))
  {
    switch(*(_QWORD *)(v0 + 232))
    {
      case 0:
        v25 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 376) = v25;
        *v25 = v0;
        v25[1] = sub_23B903830;
        return sub_23B90DA9C();
      case 1:
        v27 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 400) = v27;
        *v27 = v0;
        v27[1] = sub_23B903C10;
        return sub_23B90DB20();
      case 2:
      case 3:
        if (qword_2543095D0 != -1)
          swift_once();
        v1 = *(_QWORD *)(v0 + 304);
        v3 = *(_QWORD *)(v0 + 280);
        v2 = *(_QWORD *)(v0 + 288);
        v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254309678);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
        v5 = sub_23B90DC64();
        v6 = sub_23B90DDFC();
        if (!os_log_type_enabled(v5, v6))
        {
          v29 = *(_QWORD *)(v0 + 304);
          goto LABEL_20;
        }
        v7 = *(_QWORD *)(v0 + 232);
        v8 = swift_slowAlloc();
        v9 = swift_slowAlloc();
        v53 = v9;
        *(_DWORD *)v8 = 141558275;
        *(_QWORD *)(v0 + 160) = 1752392040;
        sub_23B90DE68();
        *(_WORD *)(v8 + 12) = 2081;
        if (v7 == 2)
        {
          v10 = (unsigned int *)MEMORY[0x24BE31D28];
        }
        else
        {
          if (v7 != 3)
            return sub_23B90DF04();
          v10 = (unsigned int *)MEMORY[0x24BE31D30];
        }
        v47 = *(_QWORD *)(v0 + 288);
        v32 = *(_QWORD *)(v0 + 272);
        v48 = *(_QWORD *)(v0 + 280);
        v50 = *(_QWORD *)(v0 + 304);
        v33 = *(_QWORD *)(v0 + 248);
        v34 = *(_QWORD *)(v0 + 256);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v34 + 104))(v32, *v10, v33);
        sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
        v35 = sub_23B90DF58();
        v37 = v36;
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
        *(_QWORD *)(v0 + 168) = sub_23B904C6C(v35, v37, &v53);
        sub_23B90DE68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B8EC000, v5, v6, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v8, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242608C00](v9, -1, -1);
        MEMORY[0x242608C00](v8, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v50, v48);
        goto LABEL_23;
      case 4:
        v28 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 424) = v28;
        *v28 = v0;
        v28[1] = sub_23B903FF0;
        return sub_23B90DB08();
      default:
        if (qword_2543095D0 != -1)
          swift_once();
        v12 = *(_QWORD *)(v0 + 288);
        v11 = *(_QWORD *)(v0 + 296);
        v13 = *(_QWORD *)(v0 + 280);
        v14 = __swift_project_value_buffer(v13, (uint64_t)qword_254309678);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v14, v13);
        v5 = sub_23B90DC64();
        v15 = sub_23B90DDFC();
        if (os_log_type_enabled(v5, v15))
        {
          v16 = *(_QWORD *)(v0 + 232);
          v17 = swift_slowAlloc();
          v18 = swift_slowAlloc();
          v53 = v18;
          *(_DWORD *)v17 = 141558275;
          *(_QWORD *)(v0 + 208) = 1752392040;
          sub_23B90DE68();
          *(_WORD *)(v17 + 12) = 2081;
          if (v16 != 4)
            return sub_23B90DF04();
          v49 = *(_QWORD *)(v0 + 288);
          v51 = *(_QWORD *)(v0 + 280);
          v52 = *(_QWORD *)(v0 + 296);
          v20 = *(_QWORD *)(v0 + 256);
          v19 = *(_QWORD *)(v0 + 264);
          v21 = *(_QWORD *)(v0 + 248);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v19, *MEMORY[0x24BE31D20], v21);
          sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
          v22 = sub_23B90DF58();
          v24 = v23;
          (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
          *(_QWORD *)(v0 + 192) = sub_23B904C6C(v22, v24, &v53);
          sub_23B90DE68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23B8EC000, v5, v15, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v17, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x242608C00](v18, -1, -1);
          MEMORY[0x242608C00](v17, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v52, v51);
        }
        else
        {
          v29 = *(_QWORD *)(v0 + 296);
LABEL_20:
          v30 = *(_QWORD *)(v0 + 280);
          v31 = *(_QWORD *)(v0 + 288);

          (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
        }
LABEL_23:
        if (qword_2543095D0 != -1)
          swift_once();
        __swift_project_value_buffer(*(_QWORD *)(v0 + 280), (uint64_t)qword_254309678);
        swift_bridgeObjectRetain_n();
        v38 = sub_23B90DC64();
        v39 = sub_23B90DDFC();
        if (os_log_type_enabled(v38, v39))
        {
          v40 = (uint8_t *)swift_slowAlloc();
          v41 = swift_slowAlloc();
          v53 = v41;
          *(_DWORD *)v40 = 136315138;
          v42 = sub_23B90DA24();
          v43 = swift_bridgeObjectRetain();
          v44 = MEMORY[0x242608570](v43, v42);
          v46 = v45;
          swift_bridgeObjectRelease();
          *(_QWORD *)(v0 + 176) = sub_23B904C6C(v44, v46, &v53);
          sub_23B90DE68();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23B8EC000, v38, v39, "Updated friends: %s) when expired", v40, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242608C00](v41, -1, -1);
          MEMORY[0x242608C00](v40, -1, -1);
          swift_release();

        }
        else
        {
          swift_bridgeObjectRelease_n();

          swift_release();
        }
        break;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B903830(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 384) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 392) = a1;
  return swift_task_switch();
}

uint64_t sub_23B9038A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0[49];
  v2 = v0[44];
  v3 = v0[41];
  v20 = v0[43];
  v21 = v0[42];
  v5 = v0[39];
  v4 = v0[40];
  v6 = (void *)v0[28];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[12] = sub_23B90A370;
  v0[13] = v7;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_23B8F5B44;
  v0[11] = &block_descriptor_362;
  v8 = _Block_copy(v0 + 8);
  v9 = v6;
  sub_23B90DC94();
  v0[27] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v21);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  __swift_project_value_buffer(v0[35], (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v10 = sub_23B90DC64();
  v11 = sub_23B90DDFC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v22 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_23B90DA24();
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x242608570](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    v0[22] = sub_23B904C6C(v16, v18, &v22);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v10, v11, "Updated friends: %s) when expired", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v13, -1, -1);
    MEMORY[0x242608C00](v12, -1, -1);
    swift_release();

  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23B903C10(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 408) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 416) = a1;
  return swift_task_switch();
}

uint64_t sub_23B903C84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0[52];
  v2 = v0[44];
  v3 = v0[41];
  v20 = v0[43];
  v21 = v0[42];
  v5 = v0[39];
  v4 = v0[40];
  v6 = (void *)v0[28];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[18] = sub_23B90A36C;
  v0[19] = v7;
  v0[14] = MEMORY[0x24BDAC760];
  v0[15] = 1107296256;
  v0[16] = sub_23B8F5B44;
  v0[17] = &block_descriptor_355;
  v8 = _Block_copy(v0 + 14);
  v9 = v6;
  sub_23B90DC94();
  v0[25] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v21);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  __swift_project_value_buffer(v0[35], (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v10 = sub_23B90DC64();
  v11 = sub_23B90DDFC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v22 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_23B90DA24();
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x242608570](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    v0[22] = sub_23B904C6C(v16, v18, &v22);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v10, v11, "Updated friends: %s) when expired", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v13, -1, -1);
    MEMORY[0x242608C00](v12, -1, -1);
    swift_release();

  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23B903FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 432) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 440) = a1;
  return swift_task_switch();
}

uint64_t sub_23B904064()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0[55];
  v2 = v0[44];
  v3 = v0[41];
  v20 = v0[43];
  v21 = v0[42];
  v5 = v0[39];
  v4 = v0[40];
  v6 = (void *)v0[28];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  v0[6] = sub_23B90A368;
  v0[7] = v7;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23B8F5B44;
  v0[5] = &block_descriptor_348;
  v8 = _Block_copy(v0 + 2);
  v9 = v6;
  sub_23B90DC94();
  v0[23] = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B908958();
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v2, v3, v8);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v21);
  swift_release();
  if (qword_2543095D0 != -1)
    swift_once();
  __swift_project_value_buffer(v0[35], (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v10 = sub_23B90DC64();
  v11 = sub_23B90DDFC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v22 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_23B90DA24();
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x242608570](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    v0[22] = sub_23B904C6C(v16, v18, &v22);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B8EC000, v10, v11, "Updated friends: %s) when expired", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v13, -1, -1);
    MEMORY[0x242608C00](v12, -1, -1);
    swift_release();

  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23B9043D4()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B904460()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B9044EC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B904578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23B90DDA8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23B90DD9C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23B909E6C(a1, &qword_254309618);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B90DD84();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23B9046AC(uint64_t a1)
{
  uint64_t v1;

  return sub_23B90CB38(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23B9046CC(uint64_t a1, uint64_t a2)
{
  return sub_23B905A88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B9046D8);
}

unint64_t sub_23B9046D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_23B90DF70() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_23B90DF70() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_23B90DF70() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_23B90481C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54EB0);
  v2 = sub_23B90DF40();
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
    sub_23B90A310(v6, (uint64_t)&v15, &qword_256A54EB8);
    v7 = v15;
    v8 = v16;
    result = sub_23B905A88(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B9046D8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23B90A354(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_23B904964(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23B90A374;
  return v6();
}

uint64_t sub_23B9049B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23B90A374;
  return v7();
}

uint64_t sub_23B904A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B90DDA8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B90DD9C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B909E6C(a1, &qword_254309618);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B90DD84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B904B58(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B90A37C;
  return v6(a1);
}

uint64_t sub_23B904BBC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B904C20;
  return v6(a1);
}

uint64_t sub_23B904C20()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B904C6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B904D3C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B90A2D4((uint64_t)v12, *a3);
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
      sub_23B90A2D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23B904D3C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B90DE74();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B904EF4(a5, a6);
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
  v8 = sub_23B90DEBC();
  if (!v8)
  {
    sub_23B90DEF8();
    __break(1u);
LABEL_17:
    result = sub_23B90DF4C();
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

uint64_t sub_23B904EF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B904F88(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B905160(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B905160(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B904F88(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B9050FC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B90DEA4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B90DEF8();
      __break(1u);
LABEL_10:
      v2 = sub_23B90DD24();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B90DF4C();
    __break(1u);
LABEL_14:
    result = sub_23B90DEF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B9050FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B905160(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543095A0);
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
  result = sub_23B90DF4C();
  __break(1u);
  return result;
}

uint64_t sub_23B9052AC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23B905304(a1, a2, a3, (_QWORD *)*v3, &qword_254309598, (uint64_t (*)(_QWORD))MEMORY[0x24BE32118]);
  *v3 = result;
  return result;
}

uint64_t sub_23B9052D8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23B905304(a1, a2, a3, (_QWORD *)*v3, &qword_256A54E50, (uint64_t (*)(_QWORD))MEMORY[0x24BE320C8]);
  *v3 = result;
  return result;
}

uint64_t sub_23B905304(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23B90DF4C();
  __break(1u);
  return result;
}

uint64_t sub_23B9054E4(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_23B905A58(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_23B906BB8();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_23B90DEE0();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_23B90DED4();
  v9 = sub_23B905808(v5, v8);
  swift_retain();
  a1 = sub_23B905A58((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_23B906198(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_23B905630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_23B905A88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23B906D5C();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_23B90DA24();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_23B906348(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_23B90DA24();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_23B905768(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_23B90DED4();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_23B905808(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_23B906544(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B905808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E88);
    v2 = sub_23B90DF34();
    v18 = v2;
    sub_23B90DEC8();
    v3 = sub_23B90DEEC();
    if (v3)
    {
      v4 = v3;
      sub_23B909DF0(0, &qword_254309590);
      do
      {
        swift_dynamicCast();
        sub_23B909DF0(0, &qword_256A54E68);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_23B905B60(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_23B90DE44();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_23B90DEEC();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

unint64_t sub_23B905A58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23B90DE44();
  return sub_23B906880(a1, v2);
}

uint64_t sub_23B905A88(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  sub_23B90DFAC();
  sub_23B90DD18();
  v5 = sub_23B90DFB8();
  return a3(a1, a2, v5);
}

unint64_t sub_23B905AF4(uint64_t a1)
{
  uint64_t v2;

  sub_23B90DA84();
  sub_23B8F1000(&qword_256A54E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE32170], MEMORY[0x24BE32180]);
  v2 = sub_23B90DCB8();
  return sub_23B906A78(a1, v2);
}

uint64_t sub_23B905B60(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E88);
  v6 = sub_23B90DF28();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_23B90DE44();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23B905E30(uint64_t a1, int a2)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_23B90DA24();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E48);
  v43 = a2;
  v8 = sub_23B90DF28();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_23B90DFAC();
      sub_23B90DD18();
      result = sub_23B90DFB8();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

void sub_23B906198(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_23B90DE98();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_23B90DE44();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_23B906348(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23B90DE98();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_23B90DFAC();
        swift_bridgeObjectRetain();
        sub_23B90DD18();
        v9 = sub_23B90DFB8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_23B90DA24() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_23B906544(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_23B905A58((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_23B906BB8();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_23B905B60(v12, a3 & 1);
  v17 = sub_23B905A58((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23B909DF0(0, &qword_254309590);
  sub_23B90DF7C();
  __break(1u);
}

uint64_t sub_23B9066A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23B905A88(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = sub_23B90DA24();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23B906D5C();
      goto LABEL_7;
    }
    sub_23B905E30(v15, a4 & 1);
    v22 = sub_23B905A88(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23B906998);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23B9067F0(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B90DF7C();
  __break(1u);
  return result;
}

uint64_t sub_23B9067F0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_23B90DA24();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

unint64_t sub_23B906880(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_23B909DF0(0, &qword_254309590);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_23B90DE50();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_23B90DE50();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_23B906998(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23B90DF70() & 1) == 0)
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
      while (!v14 && (sub_23B90DF70() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23B906A78(uint64_t a1, uint64_t a2)
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
  v5 = sub_23B90DA84();
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
      sub_23B8F1000(&qword_256A54E08, (uint64_t (*)(uint64_t))MEMORY[0x24BE32170], MEMORY[0x24BE32188]);
      v14 = sub_23B90DCDC();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

id sub_23B906BB8()
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
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E88);
  v2 = *v0;
  v3 = sub_23B90DF1C();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23B906D5C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_23B90DA24();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E48);
  v31 = v0;
  v4 = *v0;
  v5 = sub_23B90DF1C();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

size_t sub_23B906FB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E50);
  v3 = *(_QWORD *)(sub_23B90DA24() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = sub_23B907918(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_23B909B3C();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23B9070D0(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v6)(char *, char *);
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = (uint64_t (*)(char *, char *))isStackAllocationSafe;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(a3 + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_23B907240((_QWORD *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, (_QWORD *)a3, v6);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a2 = sub_23B907240((unint64_t *)v11, v8, (_QWORD *)a3, v6);
    MEMORY[0x242608C00](v11, -1, -1);
  }
  return a2;
}

uint64_t sub_23B907240(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(char *, char *))
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  _QWORD *v39;
  int64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, char *);
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;

  v42 = a4;
  v36 = a2;
  v37 = a1;
  v41 = sub_23B90D874();
  v44 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23B90DA84();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v13 = 0;
  v43 = a3;
  v16 = a3[8];
  v15 = a3 + 8;
  v14 = v16;
  v17 = 1 << *((_BYTE *)v15 - 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & v14;
  v39 = v15;
  v40 = (unint64_t)(v17 + 63) >> 6;
LABEL_4:
  v38 = v12;
  while (v19)
  {
    v45 = (v19 - 1) & v19;
    v46 = v13;
    v20 = __clz(__rbit64(v19)) | (v13 << 6);
    v21 = v44;
LABEL_18:
    v26 = v43;
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v11, v43[6] + *(_QWORD *)(v8 + 72) * v20, v7);
    v27 = v26[7] + *(_QWORD *)(v21 + 72) * v20;
    v28 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
    v29 = v21;
    v30 = v41;
    v28(v6, v27, v41);
    v31 = v47;
    v32 = v42(v11, v6);
    v47 = v31;
    if (v31)
      goto LABEL_28;
    v33 = v32;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v30);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v19 = v45;
    v13 = v46;
    if ((v33 & 1) != 0)
    {
      v34 = v38;
      *(unint64_t *)((char *)v37 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v22 = __OFADD__(v34, 1);
      v12 = v34 + 1;
      if (!v22)
        goto LABEL_4;
      __break(1u);
LABEL_28:
      (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v30);
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
  }
  v22 = __OFADD__(v13, 1);
  v23 = v13 + 1;
  v21 = v44;
  if (v22)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v23 >= v40)
    return sub_23B90752C(v37, v36, v38, v43);
  v24 = v39[v23];
  if (v24)
  {
LABEL_17:
    v45 = (v24 - 1) & v24;
    v46 = v23;
    v20 = __clz(__rbit64(v24)) + (v23 << 6);
    goto LABEL_18;
  }
  v25 = v23 + 1;
  if (v23 + 1 >= v40)
    return sub_23B90752C(v37, v36, v38, v43);
  v24 = v39[v25];
  if (v24)
    goto LABEL_16;
  v25 = v23 + 2;
  if (v23 + 2 >= v40)
    return sub_23B90752C(v37, v36, v38, v43);
  v24 = v39[v25];
  if (v24)
    goto LABEL_16;
  v25 = v23 + 3;
  if (v23 + 3 >= v40)
    return sub_23B90752C(v37, v36, v38, v43);
  v24 = v39[v25];
  if (v24)
  {
LABEL_16:
    v23 = v25;
    goto LABEL_17;
  }
  while (1)
  {
    v23 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v23 >= v40)
      return sub_23B90752C(v37, v36, v38, v43);
    v24 = v39[v23];
    ++v25;
    if (v24)
      goto LABEL_17;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23B90752C(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;

  v57 = sub_23B90D874();
  v51 = *(_QWORD *)(v57 - 8);
  v8 = MEMORY[0x24BDAC7A8](v57);
  v56 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v44 - v10;
  v11 = sub_23B90DA84();
  v49 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v55 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v48 = (char *)&v44 - v14;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E40);
  result = sub_23B90DF40();
  v16 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v17 = 0;
  else
    v17 = *a1;
  v18 = 0;
  v19 = result + 64;
  v46 = a4;
  v47 = result;
  v20 = v50;
  while (1)
  {
    v54 = a3;
    if (v17)
    {
      v52 = (v17 - 1) & v17;
      v53 = v18;
      v21 = __clz(__rbit64(v17)) | (v18 << 6);
    }
    else
    {
      v22 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v16;
      v23 = v44[v22];
      v24 = v18 + 1;
      if (!v23)
      {
        v24 = v18 + 2;
        if (v18 + 2 >= v45)
          return v16;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v18 + 3;
          if (v18 + 3 >= v45)
            return v16;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v18 + 4;
            if (v18 + 4 >= v45)
              return v16;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v16;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v18 + 4;
          }
        }
      }
LABEL_24:
      v52 = (v23 - 1) & v23;
      v53 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = v48;
    v27 = v49;
    v28 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v48, a4[6] + v28 * v21, v11);
    v29 = a4[7];
    v30 = v51;
    v31 = *(_QWORD *)(v51 + 72);
    v32 = v29 + v31 * v21;
    v33 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v20, v32, v57);
    v34 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v34(v55, v26, v11);
    v35 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v35(v56, v20, v33);
    v16 = v47;
    sub_23B8F1000(&qword_256A54E00, (uint64_t (*)(uint64_t))MEMORY[0x24BE32170], MEMORY[0x24BE32180]);
    result = sub_23B90DCB8();
    v36 = -1 << *(_BYTE *)(v16 + 32);
    v37 = result & ~v36;
    v38 = v37 >> 6;
    if (((-1 << v37) & ~*(_QWORD *)(v19 + 8 * (v37 >> 6))) != 0)
    {
      v39 = __clz(__rbit64((-1 << v37) & ~*(_QWORD *)(v19 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v40 = 0;
      v41 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v41 && (v40 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v42 = v38 == v41;
        if (v38 == v41)
          v38 = 0;
        v40 |= v42;
        v43 = *(_QWORD *)(v19 + 8 * v38);
      }
      while (v43 == -1);
      v39 = __clz(__rbit64(~v43)) + (v38 << 6);
    }
    *(_QWORD *)(v19 + ((v39 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v39;
    v34((char *)(*(_QWORD *)(v16 + 48) + v39 * v28), v55, v11);
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v35)(*(_QWORD *)(v16 + 56) + v39 * v31, v56, v57);
    ++*(_QWORD *)(v16 + 16);
    a3 = v54 - 1;
    if (__OFSUB__(v54, 1))
      break;
    a4 = v46;
    v17 = v52;
    v18 = v53;
    if (v54 == 1)
      return v16;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23B907918(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = sub_23B90DA24();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 32);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 56) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23B907BE0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 + 212) = a2;
  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = v2;
  *(_QWORD *)(v3 + 72) = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  *(_QWORD *)(v3 + 80) = swift_task_alloc();
  v4 = sub_23B90D880();
  *(_QWORD *)(v3 + 88) = v4;
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 104) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309580);
  *(_QWORD *)(v3 + 112) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 120) = v6;
  *(_QWORD *)(v3 + 128) = *(_QWORD *)(v6 + 64);
  *(_QWORD *)(v3 + 136) = swift_task_alloc();
  *(_QWORD *)(v3 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B907CB4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  int v14;
  uint64_t v15;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  *(_QWORD *)(v0 + 152) = __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v14 = *(unsigned __int8 *)(v0 + 212);
    v4 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v15 = v13;
    *(_DWORD *)v4 = 136446722;
    *(_QWORD *)(v0 + 40) = sub_23B904C6C(0xD000000000000041, 0x800000023B90F3B0, &v15);
    sub_23B90DE68();
    *(_WORD *)(v4 + 12) = 2080;
    v5 = sub_23B909DF0(0, &qword_254309590);
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x242608570](v6, v5);
    v9 = v8;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 48) = sub_23B904C6C(v7, v9, &v15);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 22) = 1024;
    *(_DWORD *)(v0 + 208) = v14;
    sub_23B90DE68();
    _os_log_impl(&dword_23B8EC000, v2, v3, "%{public}s handles %s reverseGeocode: %{BOOL}d", (uint8_t *)v4, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v13, -1, -1);
    MEMORY[0x242608C00](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v10 = swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v10;
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v0 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v11;
  *v11 = v0;
  v11[1] = sub_23B908018;
  return sub_23B90DF64();
}

uint64_t sub_23B907F90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[12] + 8))(v2[13], v2[11]);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B908018()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B908074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session);
  *(_QWORD *)(v0 + 200) = v1;
  swift_retain();
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v2 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 160) = sub_23B8F21D8(*(_QWORD *)(v0 + 56));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE31CF0], v4);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v5;
    *v5 = v0;
    v5[1] = sub_23B907F90;
    return sub_23B90DAFC();
  }
  else
  {
    v7 = sub_23B90DC64();
    v8 = sub_23B90DDF0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B8EC000, v7, v8, "Missing FindMyLocate.Session!", v9, 2u);
      MEMORY[0x242608C00](v9, -1, -1);
    }

    type metadata accessor for FMLSessionError(0);
    *(_QWORD *)(v0 + 24) = 5;
    sub_23B90481C(MEMORY[0x24BEE4AF8]);
    sub_23B8F1000(&qword_256A54AA8, (uint64_t (*)(uint64_t))type metadata accessor for FMLSessionError, (uint64_t)&unk_23B910144);
    sub_23B90D82C();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B908264()
{
  uint64_t v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(char **)(v0 + 64);
  v18 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTask;
  v2 = v1;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTask])
  {
    swift_retain();
    sub_23B90DDCC();
    swift_release();
    v2 = *(void **)(v0 + 64);
  }
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v17 = v4;
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 80);
  v15 = v8;
  v16 = *(_QWORD *)(v0 + 72);
  v9 = sub_23B90DDA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v4, v7);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = (v6 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v12 + v10, v3, v7);
  *(_QWORD *)(v12 + v11) = v2;
  *(_QWORD *)(v12 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8)) = v16;
  v13 = v2;
  *(_QWORD *)&v1[v18] = sub_23B8F5BD0(v15, (uint64_t)&unk_256A54E98, v12);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v17, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B908424()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B908488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch();
}

uint64_t sub_23B9084A0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  if (qword_2543095D0 != -1)
    swift_once();
  v1 = sub_23B90DC7C();
  __swift_project_value_buffer(v1, (uint64_t)qword_254309678);
  swift_bridgeObjectRetain_n();
  v2 = sub_23B90DC64();
  v3 = sub_23B90DDFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    *(_DWORD *)v4 = 136315138;
    v13 = v5;
    v6 = sub_23B909DF0(0, &qword_254309590);
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x242608570](v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    v0[10] = sub_23B904C6C(v8, v10, &v13);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_arrayDestroy();
    MEMORY[0x242608C00](v5, -1, -1);
    MEMORY[0x242608C00](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v11 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = sub_23B9086EC;
  v0[14] = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23B8F5FD4;
  v0[13] = &block_descriptor_424;
  objc_msgSend(v11, sel_stopRefreshingLocationWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23B9086EC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23B90874C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B908758()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B908794()
{
  return objectdestroyTm(&qword_254309628);
}

uint64_t sub_23B9087A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309628) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B90A374;
  return sub_23B8F6D00(a1, v6, v7, v8, v9);
}

uint64_t sub_23B908858()
{
  return objectdestroyTm(&qword_254309578);
}

uint64_t sub_23B908864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309578) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B90A374;
  return sub_23B8FA6A8(a1, v6, v7, v8, v9);
}

uint64_t sub_23B908920()
{
  uint64_t v0;

  return sub_23B8FDA50(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers);
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

unint64_t sub_23B908958()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543095F8;
  if (!qword_2543095F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543095F0);
    result = MEMORY[0x242608BA0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2543095F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242608B94](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23B9089EC()
{
  uint64_t v0;

  return sub_23B8FDA50(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings);
}

uint64_t sub_23B908A10()
{
  uint64_t v0;

  return sub_23B8FDA50(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers);
}

void sub_23B908A30(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_23B8FF5AC(*(void **)(v1 + 16), *(_BYTE *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_23B908A50@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B900F14(1uLL, 0xD000000000000024, 0x800000023B90F300, a1);
}

uint64_t sub_23B908A84@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B900F14(0, 0xD000000000000022, 0x800000023B90F2D0, a1);
}

uint64_t sub_23B908AB8@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B900F14(4uLL, 0xD000000000000020, 0x800000023B90F240, a1);
}

uint64_t sub_23B908AEC@<X0>(uint64_t a1@<X8>)
{
  return sub_23B908DD4(a1);
}

uint64_t sub_23B908B00@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_23B901E6C(*(void **)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_23B908B20(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23B908B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B90A374;
  return ((uint64_t (*)(int, void *))((char *)&dword_256A54BB8 + dword_256A54BB8))(v2, v3);
}

uint64_t sub_23B908BA0()
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
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256A54BC8 + dword_256A54BC8))(v2, v3, v4);
}

uint64_t sub_23B908C1C(uint64_t a1)
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
  v7[1] = sub_23B90A374;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256A54BD8 + dword_256A54BD8))(a1, v4, v5, v6);
}

uint64_t sub_23B908CA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A54BE8 + dword_256A54BE8))(a1, v4);
}

uint64_t sub_23B908D10(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B908D58()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_256A54BF8 + dword_256A54BF8))(v2, v3, v4);
}

uint64_t sub_23B908DCC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23B908DD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23B90148C(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t sub_23B908DF4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_23B908E30()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v5 = (const void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23B90A374;
  return ((uint64_t (*)(void *, uint64_t, const void *, void *))((char *)&dword_256A54C18 + dword_256A54C18))(v2, v3, v5, v4);
}

uint64_t sub_23B908EB4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23B90A374;
  return ((uint64_t (*)(void *, char, void *, void *))((char *)&dword_256A54C38 + dword_256A54C38))(v2, v3, v5, v4);
}

uint64_t objectdestroy_127Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_23B908F70()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v5 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23B90A374;
  return ((uint64_t (*)(void *, char, void *, void *))((char *)&dword_256A54C58 + dword_256A54C58))(v2, v3, v5, v4);
}

uint64_t sub_23B908FF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B8F5F8C;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_256A54C78 + dword_256A54C78))(v2, v3, v4);
}

uint64_t sub_23B909070()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B90A374;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256A54C98 + dword_256A54C98))(v2, v3);
}

uint64_t objectdestroy_73Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_23B909114()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_256A54CB8 + dword_256A54CB8))(v2, v3, v4);
}

uint64_t sub_23B90918C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B90A374;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256A54CD8 + dword_256A54CD8))(v2, v3);
}

uint64_t sub_23B9091FC()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B90A374;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256A54CF8 + dword_256A54CF8))(v2, v3);
}

uint64_t objectdestroy_157Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_23B909298()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v3 = *(void **)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(char, void *, void *))((char *)&dword_256A54D18 + dword_256A54D18))(v2, v4, v3);
}

uint64_t objectdestroy_172Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_23B90933C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B90A374;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_256A54D38 + dword_256A54D38))(v2, v3);
}

uint64_t sub_23B9093AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(unsigned __int8 *)(v0 + 32);
  v6 = *(void **)(v0 + 40);
  v5 = *(void **)(v0 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23B90A374;
  return ((uint64_t (*)(int, int, int, void *, void *))((char *)&dword_256A54D58 + dword_256A54D58))(v2, v3, v4, v6, v5);
}

uint64_t objectdestroy_262Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_23B90946C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(unsigned __int8 *)(v0 + 32);
  v5 = *(unsigned __int8 *)(v0 + 33);
  v7 = *(void **)(v0 + 40);
  v6 = *(void **)(v0 + 48);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_23B90A374;
  return ((uint64_t (*)(int, int, int, uint64_t, void *, void *))((char *)&dword_256A54D78 + dword_256A54D78))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_23B909508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v6 = *(void **)(v0 + 40);
  v5 = *(void **)(v0 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23B90A374;
  return ((uint64_t (*)(int, void *, char, void *, void *))((char *)&dword_256A54D98 + dword_256A54D98))(v2, v3, v4, v6, v5);
}

uint64_t objectdestroy_292Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_23B9095D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v6 = *(void **)(v0 + 40);
  v5 = *(void **)(v0 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23B90A374;
  return ((uint64_t (*)(void *, void *, char, void *, void *))((char *)&dword_256A54DB8 + dword_256A54DB8))(v2, v3, v4, v6, v5);
}

uint64_t sub_23B909658()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_23B909694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 40);
  v7 = *(void **)(v0 + 48);
  v6 = *(void **)(v0 + 56);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_23B90A374;
  return ((uint64_t (*)(int, void *, uint64_t, char, void *, void *))((char *)&dword_256A54DD8 + dword_256A54DD8))(v2, v3, v4, v5, v7, v6);
}

uint64_t objectdestroy_77Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B909758(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = a1;
  v1 = sub_23B90D88C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23B90DC7C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543095D0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_254309678);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = sub_23B90DC64();
  v11 = sub_23B90DDFC();
  if (!os_log_type_enabled(v10, v11))
    goto LABEL_6;
  v12 = swift_slowAlloc();
  v13 = swift_slowAlloc();
  v21 = v13;
  *(_DWORD *)v12 = 141558275;
  v23 = 1752392040;
  v24 = v13;
  v20[1] = &v24;
  sub_23B90DE68();
  *(_WORD *)(v12 + 12) = 2081;
  if (v22 < 5)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, **((unsigned int **)&unk_250C9F800 + v22), v1);
    v22 = v12 + 14;
    sub_23B8F1000(&qword_256A54E30, (uint64_t (*)(uint64_t))MEMORY[0x24BE31D50], MEMORY[0x24BE31D58]);
    v14 = sub_23B90DF58();
    v15 = v2;
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v1);
    v23 = sub_23B904C6C(v14, v17, &v24);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B8EC000, v10, v11, "validFriends: %{private,mask.hash}s not supported", (uint8_t *)v12, 0x16u);
    v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x242608C00](v18, -1, -1);
    MEMORY[0x242608C00](v12, -1, -1);
LABEL_6:

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return MEMORY[0x24BEE4AF8];
  }
  result = sub_23B90DF04();
  __break(1u);
  return result;
}

uint64_t sub_23B909A54(uint64_t a1)
{
  uint64_t v1;

  return sub_23B902B80(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_23B909A70()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B909AA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23B8F5F8C;
  return sub_23B902ECC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_23B909B30()
{
  return sub_23B90D85C();
}

uint64_t sub_23B909B3C()
{
  return swift_release();
}

uint64_t sub_23B909B48(uint64_t a1, uint64_t (*a2)(char *, char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 64);
  v27 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v28 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v22 >= v28)
      goto LABEL_24;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_24;
      v23 = *(_QWORD *)(v27 + 8 * v12);
      if (!v23)
      {
        v12 = v22 + 2;
        if (v22 + 2 >= v28)
          goto LABEL_24;
        v23 = *(_QWORD *)(v27 + 8 * v12);
        if (!v23)
        {
          v12 = v22 + 3;
          if (v22 + 3 >= v28)
            goto LABEL_24;
          v23 = *(_QWORD *)(v27 + 8 * v12);
          if (!v23)
          {
            v24 = v22 + 4;
            if (v24 >= v28)
            {
LABEL_24:
              v25 = 0;
              goto LABEL_25;
            }
            v23 = *(_QWORD *)(v27 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_27;
                if (v12 >= v28)
                  goto LABEL_24;
                v23 = *(_QWORD *)(v27 + 8 * v12);
                ++v24;
                if (v23)
                  goto LABEL_22;
              }
            }
            v12 = v24;
          }
        }
      }
    }
LABEL_22:
    v10 = (v23 - 1) & v23;
    v14 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_23B90DA84();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v6, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = sub_23B90D874();
    v19 = *(_QWORD *)(v18 - 8);
    v20 = v17 + *(_QWORD *)(v19 + 72) * v14;
    v21 = &v6[*(int *)(v4 + 48)];
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v20, v18);
    LOBYTE(v21) = a2(v6, v21);
    result = sub_23B909E6C((uint64_t)v6, &qword_256A54E58);
    if ((v21 & 1) != 0)
    {
      v25 = 1;
LABEL_25:
      swift_release();
      return v25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t objectdestroy_46Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

BOOL sub_23B909DE8()
{
  return sub_23B902C4C();
}

uint64_t sub_23B909DF0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23B909E28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B909E6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B909EA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B909ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B90A374;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A54E78 + dword_256A54E78))(a1, v4);
}

uint64_t sub_23B909F40()
{
  return sub_23B909F5C();
}

uint64_t sub_23B909F50()
{
  return sub_23B909F5C();
}

uint64_t sub_23B909F5C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B90DA24() - 8) + 80);
  return sub_23B8F9774(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_23B909FA4()
{
  return sub_23B909F5C();
}

uint64_t sub_23B909FB4()
{
  return sub_23B909FC0();
}

uint64_t sub_23B909FC0()
{
  sub_23B90DA24();
  return sub_23B8F9640();
}

void sub_23B90A008()
{
  sub_23B90DA24();
  sub_23B8F9464();
}

uint64_t sub_23B90A03C()
{
  return sub_23B909FC0();
}

uint64_t objectdestroy_371Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B90DA24();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B90A0C8()
{
  return objectdestroyTm(&qword_254309580);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);

  return swift_deallocObject();
}

uint64_t sub_23B90A168(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309580) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B90A374;
  return sub_23B8F4988(a1, v6, v7, v8, v9);
}

uint64_t sub_23B90A220()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23B90A24C()
{
  uint64_t v0;

  sub_23B8F5B70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23B90A254(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23B90A264()
{
  id *v0;

  return swift_deallocObject();
}

void sub_23B90A298()
{
  uint64_t v0;

  sub_23B8F5958(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_23B90A2A4(uint64_t result)
{
  if (result)
    return swift_retain();
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

uint64_t sub_23B90A2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B90A310(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_23B90A354(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23B90A3C4@<X0>(_QWORD *a1@<X8>)
{
  return sub_23B908B00(a1);
}

void sub_23B90A3D8(_QWORD *a1@<X8>)
{
  sub_23B908A30(a1);
}

uint64_t sub_23B90A434@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B908AB8(a1);
}

uint64_t sub_23B90A448@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B908A84(a1);
}

uint64_t sub_23B90A45C@<X0>(uint64_t *a1@<X8>)
{
  return sub_23B908A50(a1);
}

id sub_23B90A478(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_23B90D988();
  v3 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90D97C();
  v4 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90D964();
  v5 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  v6 = sub_23B90D9AC();
  v7 = sub_23B90D970();
  v8 = sub_23B90D994();
  LOBYTE(v12) = sub_23B90D9A0() & 1;
  v9 = objc_msgSend(v2, sel_initWithIdentifier_deviceName_idsDeviceId_isActive_isThisDevice_isCompanion_isAutoMeCapable_, v3, v4, v5, v6 & 1, v7 & 1, v8 & 1, v12);

  v10 = sub_23B90D9B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_23B90A58C(uint64_t a1)
{
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;

  v45 = sub_23B90D8B0();
  v2 = *(_QWORD *)(v45 - 8);
  v3 = MEMORY[0x24BDAC7A8](v45);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v44 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54EC0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B90DC58();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v44 - v16;
  sub_23B90DBBC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23B90A988((uint64_t)v10);
    v18 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    sub_23B90A9C8();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    v18 = sub_23B90AA04((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  sub_23B90DBC8();
  v20 = v19;
  sub_23B90DBE0();
  v22 = v21;
  sub_23B90DBA4();
  v24 = v23;
  v25 = sub_23B90DB68();
  if (v25 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  v26 = v25;
  if (v25 > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  sub_23B90DB98();
  v28 = v27;
  sub_23B90DBB0();
  v29 = (void *)sub_23B90DD3C();
  swift_bridgeObjectRelease();
  sub_23B90DBD4();
  v31 = v30;
  sub_23B90DBEC();
  v33 = v32;
  sub_23B90DB80();
  v35 = v34;
  sub_23B90DB74();
  v36 = v45;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v45);
  v37 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v36);
  if (v37 != *MEMORY[0x24BE31DA8])
  {
    if (v37 == *MEMORY[0x24BE31D98])
    {
      v38 = 1;
      goto LABEL_14;
    }
    if (v37 == *MEMORY[0x24BE31DA0])
    {
      v38 = 2;
      goto LABEL_14;
    }
    if (v37 == *MEMORY[0x24BE31DB0])
    {
      v38 = 3;
      goto LABEL_14;
    }
LABEL_20:
    result = sub_23B90DF04();
    __break(1u);
    return result;
  }
  v38 = 0;
LABEL_14:
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v36);
  sub_23B90DB8C();
  if (v39)
  {
    v40 = (void *)sub_23B90DCE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v40 = 0;
  }
  v41 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAddress_altitude_longitude_speed_floorLevel_horizontalAccuracy_labels_latitude_timestamp_verticalAccuracy_locationType_coarseAddressLabel_, v18, v26, v29, v38, v40, v20, v22, v24, v28, v31, v33, v35);

  v42 = sub_23B90DBF8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 8))(a1, v42);
  return (uint64_t)v41;
}

uint64_t sub_23B90A988(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A54EC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23B90A9C8()
{
  unint64_t result;

  result = qword_256A54EC8;
  if (!qword_256A54EC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256A54EC8);
  }
  return result;
}

id sub_23B90AA04(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  sub_23B90DC40();
  v2 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC1C();
  v3 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC34();
  v4 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC4C();
  v5 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC10();
  v6 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC04();
  v7 = (void *)sub_23B90DCE8();
  swift_bridgeObjectRelease();
  sub_23B90DC28();
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = (void *)sub_23B90DD3C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithLocality_administrativeArea_country_stateCode_streetAddress_streetName_formattedAddressLines_, v2, v3, v4, v5, v6, v7, v9);

  v11 = sub_23B90DC58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  return v10;
}

uint64_t sub_23B90ABD4()
{
  uint64_t v0;

  v0 = sub_23B90DC7C();
  __swift_allocate_value_buffer(v0, qword_254309690);
  __swift_project_value_buffer(v0, (uint64_t)qword_254309690);
  return sub_23B90DC70();
}

uint64_t sub_23B90AC48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B90DC7C();
  __swift_allocate_value_buffer(v0, qword_254309678);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254309678);
  if (qword_2543095D8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254309690);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B90ACF4()
{
  return sub_23B90B348(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback, (void (*)(_QWORD, _QWORD))sub_23B90A2A4);
}

void sub_23B90AD08(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, id);
  id v6;
  id v7;

  v5 = *(void (**)(void *, id))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, v6);
  swift_release();

}

uint64_t sub_23B90AE08(uint64_t a1, uint64_t a2)
{
  return sub_23B90B4A4(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23B90A254);
}

uint64_t sub_23B90AE1C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, _QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23B90D3B8;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_23B90A2A4(v4);
}

uint64_t sub_23B90AEB0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23B90D384;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23B90A2A4(v3);
  return sub_23B90A254(v8);
}

uint64_t (*sub_23B90AF68())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23B90AFCC()
{
  return sub_23B90B348(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback, (void (*)(_QWORD, _QWORD))sub_23B90D798);
}

void sub_23B90AFE0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23B90B0D0(uint64_t a1, uint64_t a2)
{
  return sub_23B90B4A4(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23B90D79C);
}

uint64_t sub_23B90B0E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, _QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23B90D7E0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_23B90A2A4(v4);
}

uint64_t sub_23B90B178(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23B90D384;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23B90A2A4(v3);
  return sub_23B90A254(v8);
}

uint64_t (*sub_23B90B230())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_23B90B290(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v7 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  v8 = *v7;
  if (!*v7)
    return 0;
  v9 = v7[1];
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = a4;
  aBlock[3] = a5;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v10;
}

uint64_t sub_23B90B334()
{
  return sub_23B90B348(&OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback, (void (*)(_QWORD, _QWORD))sub_23B90D798);
}

uint64_t sub_23B90B348(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

void sub_23B90B3A8(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_23B90B490(uint64_t a1, uint64_t a2)
{
  return sub_23B90B4A4(a1, a2, &OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_23B90D79C);
}

uint64_t sub_23B90B4A4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_23B90B500@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_23B90D360;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_23B90A2A4(v4);
}

uint64_t sub_23B90B594(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23B90D330;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_23B90A2A4(v3);
  return sub_23B90A254(v8);
}

uint64_t (*sub_23B90B64C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id ObjCBootstrap.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ObjCBootstrap.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  objc_super v26;
  uint64_t v27;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309618);
  MEMORY[0x24BDAC7A8](v1);
  v25 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23B90DE08();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v3);
  v5 = sub_23B90DCA0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23B90DE14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback];
  *v10 = 0;
  v10[1] = 0;
  v11 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback];
  *v11 = 0;
  v11[1] = 0;
  v12 = &v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback];
  *v12 = 0;
  v12[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTask] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTask] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session] = 0;
  v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized] = 0;
  v13 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations] = MEMORY[0x24BEE4AF8];
  v24 = OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue;
  sub_23B90B9F0();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5758], v6);
  v14 = v0;
  sub_23B90DC94();
  v27 = v13;
  sub_23B8F1000(&qword_254309630, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309600);
  sub_23B90D63C(&qword_254309608, &qword_254309600);
  sub_23B90DE8C();
  *(_QWORD *)&v0[v24] = sub_23B90DE38();
  v15 = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v14[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followings] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v14[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_followers] = v15;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_pendingOffers] = v15;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationForHandles] = v15;

  v16 = (objc_class *)type metadata accessor for ObjCBootstrap();
  v26.receiver = v14;
  v26.super_class = v16;
  v17 = objc_msgSendSuper2(&v26, sel_init);
  v18 = sub_23B90DDA8();
  v19 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v25, 1, 1, v18);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v17;
  v21 = v17;
  sub_23B8F5BD0(v19, (uint64_t)&unk_256A54F40, (uint64_t)v20);
  swift_release();
  return v21;
}

unint64_t sub_23B90B9F0()
{
  unint64_t result;

  result = qword_254309638;
  if (!qword_254309638)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254309638);
  }
  return result;
}

uint64_t type metadata accessor for ObjCBootstrap()
{
  return objc_opt_self();
}

uint64_t sub_23B90BA4C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B90A374;
  return sub_23B90BB48();
}

uint64_t sub_23B90BA94()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23B90BAC0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B8F5F8C;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_23B90A374;
  return sub_23B90BB48();
}

uint64_t sub_23B90BB48()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[19] = v0;
  v1[20] = swift_getObjectType();
  v2 = sub_23B90D8A4();
  v1[21] = v2;
  v1[22] = *(_QWORD *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v3 = sub_23B90D8C8();
  v1[25] = v3;
  v1[26] = *(_QWORD *)(v3 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B90BC08()
{
  _QWORD *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  void (*v11)(uint64_t, _QWORD, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    v3 = sub_23B90DCF4();
    v5 = v4;

    v0[8] = v3;
    v0[10] = 0xD000000000000013;
    v0[9] = v5;
    v0[11] = 0x800000023B90F7F0;
    sub_23B90D280();
    if ((sub_23B90DE80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
LABEL_5:
      v7 = v0[24];
      v8 = v0[21];
      v9 = v0[22];
      v10 = (unsigned int *)MEMORY[0x24BE31D68];
      goto LABEL_7;
    }
    v0[12] = v3;
    v0[13] = v5;
    v0[14] = 0xD000000000000012;
    v0[15] = 0x800000023B90F810;
    v6 = sub_23B90DE80();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      goto LABEL_5;
  }
  v7 = v0[24];
  v8 = v0[21];
  v9 = v0[22];
  v10 = (unsigned int *)MEMORY[0x24BE31D80];
LABEL_7:
  v11 = *(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104);
  v11(v7, *v10, v8);
  v0[30] = v11;
  sub_23B90D8D4();
  if (qword_2543095D0 != -1)
    swift_once();
  v12 = v0[28];
  v13 = v0[29];
  v14 = v0[25];
  v15 = v0[26];
  v16 = sub_23B90DC7C();
  v0[31] = __swift_project_value_buffer(v16, (uint64_t)qword_254309678);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v17(v12, v13, v14);
  v18 = sub_23B90DC64();
  v19 = sub_23B90DDFC();
  v20 = os_log_type_enabled(v18, v19);
  v21 = v0[28];
  v22 = v0[25];
  v23 = v0[26];
  if (v20)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v32 = v17;
    v33 = swift_slowAlloc();
    v25 = v33;
    *(_DWORD *)v24 = 136315138;
    sub_23B8F1000(&qword_2543095C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31DD0], MEMORY[0x24BE31DD8]);
    v26 = sub_23B90DF58();
    v0[17] = sub_23B904C6C(v26, v27, &v33);
    sub_23B90DE68();
    swift_bridgeObjectRelease();
    v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v28(v21, v22);
    _os_log_impl(&dword_23B8EC000, v18, v19, "Init Session with origin: %s", v24, 0xCu);
    swift_arrayDestroy();
    v29 = v25;
    v17 = v32;
    MEMORY[0x242608C00](v29, -1, -1);
    MEMORY[0x242608C00](v24, -1, -1);
  }
  else
  {
    v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v28(v0[28], v0[25]);
  }

  v0[32] = v28;
  v17(v0[27], v0[29], v0[25]);
  sub_23B90DB50();
  swift_allocObject();
  v30 = (_QWORD *)swift_task_alloc();
  v0[33] = v30;
  *v30 = v0;
  v30[1] = sub_23B90BF98;
  return sub_23B90DB5C();
}

uint64_t sub_23B90BF98(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B90BFF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t result;
  void (*v10)(uint64_t, _QWORD, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;

  v1 = v0[34];
  v3 = (char *)v0[19];
  v2 = v0[20];
  v4 = *(NSObject **)&v3[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue];
  v5 = (_QWORD *)swift_allocObject();
  v0[35] = v5;
  v5[2] = v3;
  v5[3] = v1;
  v5[4] = v2;
  v6 = swift_allocObject();
  v0[2] = MEMORY[0x24BDAC760];
  *(_QWORD *)(v6 + 16) = sub_23B90CAE4;
  *(_QWORD *)(v6 + 24) = v5;
  v0[6] = sub_23B90CB00;
  v0[7] = v6;
  v0[3] = 1107296256;
  v0[4] = sub_23B90C864;
  v0[5] = &block_descriptor_0;
  v7 = _Block_copy(v0 + 2);
  v8 = v3;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = (void (*)(uint64_t, _QWORD, uint64_t))v0[30];
    v12 = v0[23];
    v11 = v0[24];
    v13 = v0[21];
    v14 = v0[22];
    sub_23B90D8BC();
    v10(v12, *MEMORY[0x24BE31D68], v13);
    v15 = sub_23B90D898();
    v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v16(v12, v13);
    v16(v11, v13);
    if ((v15 & 1) != 0)
    {
      v17 = sub_23B90DC64();
      v18 = sub_23B90DDFC();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_23B8EC000, v17, v18, "Subscribing to background proactive locations", v19, 2u);
        MEMORY[0x242608C00](v19, -1, -1);
      }

      v20 = (_QWORD *)swift_task_alloc();
      v0[36] = v20;
      *v20 = v0;
      v20[1] = sub_23B90C2A4;
      return sub_23B90DB38();
    }
    else
    {
      ((void (*)(_QWORD, _QWORD))v0[32])(v0[29], v0[25]);
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return ((uint64_t (*)(void))v0[1])();
    }
  }
  return result;
}

uint64_t sub_23B90C2A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 296) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B90C308()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  v1 = sub_23B90DC64();
  v2 = sub_23B90DDFC();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
  v5 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 200);
  if (v3)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B8EC000, v1, v2, "Finished subscribing to background proactive locations", v7, 2u);
    MEMORY[0x242608C00](v7, -1, -1);
  }

  swift_release();
  v4(v5, v6);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B90C414()
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
  id v9;
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

  v1 = *(void **)(v0 + 296);
  v2 = v1;
  v3 = v1;
  v4 = sub_23B90DC64();
  v5 = sub_23B90DDF0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 296);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    v17 = *(_QWORD *)(v0 + 200);
    v18 = *(_QWORD *)(v0 + 232);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136446210;
    v20 = v8;
    *(_QWORD *)(v0 + 144) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A54E70);
    v10 = sub_23B90DD00();
    *(_QWORD *)(v0 + 128) = sub_23B904C6C(v10, v11, &v20);
    sub_23B90DE68();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23B8EC000, v4, v5, "Background proactive locations subscription error: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242608C00](v8, -1, -1);
    MEMORY[0x242608C00](v7, -1, -1);

    swift_release();
    v19(v18, v17);
  }
  else
  {
    v12 = *(void **)(v0 + 296);
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    v14 = *(_QWORD *)(v0 + 232);
    v15 = *(_QWORD *)(v0 + 200);

    swift_release();
    v13(v14, v15);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B90C654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309610);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543095D0 != -1)
    swift_once();
  v8 = sub_23B90DC7C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309678);
  v9 = sub_23B90DC64();
  v10 = sub_23B90DDFC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23B8EC000, v9, v10, "FindMyLocate.Session async init is done.", v11, 2u);
    MEMORY[0x242608C00](v11, -1, -1);
  }

  *(_QWORD *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session) = a2;
  swift_retain();
  swift_release();
  v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations);
  swift_beginAccess();
  v13 = *v12;
  v14 = *(_QWORD *)(*v12 + 16);
  if (v14)
  {
    v19 = a1;
    v15 = v13 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v16 = *(_QWORD *)(v5 + 72);
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v17(v7, v15, v4);
      sub_23B90DD90();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v15 += v16;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    a1 = v19;
  }
  *v12 = MEMORY[0x24BEE4AF8];
  result = swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized) = 1;
  return result;
}

uint64_t sub_23B90C864(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id ObjCBootstrap.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCBootstrap();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ObjCBootstrap()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ObjCBootstrap.locationUpdateCallback.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ObjCBootstrap.friendshipUpdateCallback.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ObjCBootstrap.meDeviceUpdateCallback.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t sub_23B90CAB8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B90CAE4()
{
  uint64_t v0;

  return sub_23B90C654(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23B90CAF0()
{
  return swift_deallocObject();
}

uint64_t sub_23B90CB00()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_23B90CB38(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v21[0] = a3;
  v5 = sub_23B90DC88();
  v24 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B90DCA0();
  v22 = *(_QWORD *)(v8 - 8);
  v23 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309610);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *(_QWORD *)&a2[OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_serialQueue];
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, v11);
  *(_QWORD *)(v17 + v16) = v21[0];
  aBlock[4] = sub_23B90D5F4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B8F5B44;
  aBlock[3] = &block_descriptor_57;
  v18 = _Block_copy(aBlock);
  v19 = a2;
  sub_23B90DC94();
  v25 = MEMORY[0x24BEE4AF8];
  sub_23B8F1000(&qword_2543095E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543095F0);
  sub_23B90D63C((unint64_t *)&qword_2543095F8, &qword_2543095F0);
  sub_23B90DE8C();
  MEMORY[0x242608648](0, v10, v7, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
  return swift_release();
}

uint64_t sub_23B90CDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  unint64_t *v17;
  unint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309610);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_isInitialized) & 1) != 0)
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v8 = sub_23B90DC7C();
    __swift_project_value_buffer(v8, (uint64_t)qword_254309678);
    v9 = sub_23B90DC64();
    v10 = sub_23B90DDFC();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_23B8EC000, v9, v10, "Init is done. Resume all.", v11, 2u);
      MEMORY[0x242608C00](v11, -1, -1);
    }

    return sub_23B90DD90();
  }
  else
  {
    if (qword_2543095D0 != -1)
      swift_once();
    v13 = sub_23B90DC7C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254309678);
    v14 = sub_23B90DC64();
    v15 = sub_23B90DDE4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23B8EC000, v14, v15, "Init in progress; appending continuation.", v16, 2u);
      MEMORY[0x242608C00](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    v17 = (unint64_t *)(a1 + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_initContinuations);
    swift_beginAccess();
    v18 = *v17;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v17 = v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v18 = sub_23B90D070(0, *(_QWORD *)(v18 + 16) + 1, 1, v18);
      *v17 = v18;
    }
    v21 = *(_QWORD *)(v18 + 16);
    v20 = *(_QWORD *)(v18 + 24);
    if (v21 >= v20 >> 1)
    {
      v18 = sub_23B90D070(v20 > 1, v21 + 1, 1, v18);
      *v17 = v18;
    }
    *(_QWORD *)(v18 + 16) = v21 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v21, v7, v4);
    return swift_endAccess();
  }
}

uint64_t sub_23B90D070(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309640);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309610) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23B90DEF8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309610) - 8);
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
    sub_23B90D67C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_23B90D280()
{
  unint64_t result;

  result = qword_2543095E8;
  if (!qword_2543095E8)
  {
    result = MEMORY[0x242608BA0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2543095E8);
  }
  return result;
}

uint64_t sub_23B90D2C4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23B90D2E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23B90D2F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23B90D30C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B90D330(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_23B90D360(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_23B90D384(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_23B90D3B8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_23B90D3E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = swift_getObjectType();
  return swift_task_switch();
}

uint64_t sub_23B90D424()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *v2 = v0;
  v2[1] = sub_23B90D4C0;
  return sub_23B90DF64();
}

uint64_t sub_23B90D4C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B90D51C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(*(_QWORD *)(v0 + 16)
                                                                + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap__session));
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

uint64_t sub_23B90D570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309610);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B90D5F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309610) - 8) + 80);
  return sub_23B90CDB4(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_23B90D63C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242608BA0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B90D67C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254309610) - 8);
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
  result = sub_23B90DF4C();
  __break(1u);
  return result;
}

uint64_t sub_23B90D7E4()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_23B90D7F0()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_23B90D7FC()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_23B90D808()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_23B90D814()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_23B90D820()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_23B90D82C()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_23B90D838()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23B90D844()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23B90D850()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23B90D85C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23B90D868()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23B90D874()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23B90D880()
{
  return MEMORY[0x24BE31D10]();
}

uint64_t sub_23B90D88C()
{
  return MEMORY[0x24BE31D50]();
}

uint64_t sub_23B90D898()
{
  return MEMORY[0x24BE31D70]();
}

uint64_t sub_23B90D8A4()
{
  return MEMORY[0x24BE31D88]();
}

uint64_t sub_23B90D8B0()
{
  return MEMORY[0x24BE31DB8]();
}

uint64_t sub_23B90D8BC()
{
  return MEMORY[0x24BE31DC0]();
}

uint64_t sub_23B90D8C8()
{
  return MEMORY[0x24BE31DD0]();
}

uint64_t sub_23B90D8D4()
{
  return MEMORY[0x24BE31DE8]();
}

uint64_t sub_23B90D8E0()
{
  return MEMORY[0x24BE31DF0]();
}

uint64_t sub_23B90D8EC()
{
  return MEMORY[0x24BE31DF8]();
}

uint64_t sub_23B90D8F8()
{
  return MEMORY[0x24BE31E00]();
}

uint64_t sub_23B90D904()
{
  return MEMORY[0x24BE31E98]();
}

uint64_t sub_23B90D910()
{
  return MEMORY[0x24BE31EC0]();
}

uint64_t sub_23B90D91C()
{
  return MEMORY[0x24BE31F20]();
}

uint64_t sub_23B90D928()
{
  return MEMORY[0x24BE31F48]();
}

uint64_t sub_23B90D934()
{
  return MEMORY[0x24BE31FB8]();
}

uint64_t sub_23B90D940()
{
  return MEMORY[0x24BE31FC8]();
}

uint64_t sub_23B90D94C()
{
  return MEMORY[0x24BE31FD8]();
}

uint64_t sub_23B90D958()
{
  return MEMORY[0x24BE31FE8]();
}

uint64_t sub_23B90D964()
{
  return MEMORY[0x24BE32000]();
}

uint64_t sub_23B90D970()
{
  return MEMORY[0x24BE32018]();
}

uint64_t sub_23B90D97C()
{
  return MEMORY[0x24BE32020]();
}

uint64_t sub_23B90D988()
{
  return MEMORY[0x24BE32030]();
}

uint64_t sub_23B90D994()
{
  return MEMORY[0x24BE32048]();
}

uint64_t sub_23B90D9A0()
{
  return MEMORY[0x24BE32050]();
}

uint64_t sub_23B90D9AC()
{
  return MEMORY[0x24BE32058]();
}

uint64_t sub_23B90D9B8()
{
  return MEMORY[0x24BE32060]();
}

uint64_t sub_23B90D9C4()
{
  return MEMORY[0x24BE32088]();
}

uint64_t sub_23B90D9D0()
{
  return MEMORY[0x24BE32090]();
}

uint64_t sub_23B90D9DC()
{
  return MEMORY[0x24BE32098]();
}

uint64_t sub_23B90D9E8()
{
  return MEMORY[0x24BE320A0]();
}

uint64_t sub_23B90D9F4()
{
  return MEMORY[0x24BE320A8]();
}

uint64_t sub_23B90DA00()
{
  return MEMORY[0x24BE320B0]();
}

uint64_t sub_23B90DA0C()
{
  return MEMORY[0x24BE320B8]();
}

uint64_t sub_23B90DA18()
{
  return MEMORY[0x24BE320C0]();
}

uint64_t sub_23B90DA24()
{
  return MEMORY[0x24BE320C8]();
}

uint64_t sub_23B90DA30()
{
  return MEMORY[0x24BE320E8]();
}

uint64_t sub_23B90DA3C()
{
  return MEMORY[0x24BE320F8]();
}

uint64_t sub_23B90DA48()
{
  return MEMORY[0x24BE32100]();
}

uint64_t sub_23B90DA54()
{
  return MEMORY[0x24BE32108]();
}

uint64_t sub_23B90DA60()
{
  return MEMORY[0x24BE32118]();
}

uint64_t sub_23B90DA6C()
{
  return MEMORY[0x24BE32158]();
}

uint64_t sub_23B90DA78()
{
  return MEMORY[0x24BE32160]();
}

uint64_t sub_23B90DA84()
{
  return MEMORY[0x24BE32170]();
}

uint64_t sub_23B90DA90()
{
  return MEMORY[0x24BE32190]();
}

uint64_t sub_23B90DA9C()
{
  return MEMORY[0x24BE321A0]();
}

uint64_t sub_23B90DAA8()
{
  return MEMORY[0x24BE321D0]();
}

uint64_t sub_23B90DAB4()
{
  return MEMORY[0x24BE321D8]();
}

uint64_t sub_23B90DAC0()
{
  return MEMORY[0x24BE321E8]();
}

uint64_t sub_23B90DACC()
{
  return MEMORY[0x24BE32218]();
}

uint64_t sub_23B90DAD8()
{
  return MEMORY[0x24BE32228]();
}

uint64_t sub_23B90DAE4()
{
  return MEMORY[0x24BE32240]();
}

uint64_t sub_23B90DAF0()
{
  return MEMORY[0x24BE32250]();
}

uint64_t sub_23B90DAFC()
{
  return MEMORY[0x24BE32290]();
}

uint64_t sub_23B90DB08()
{
  return MEMORY[0x24BE322A0]();
}

uint64_t sub_23B90DB14()
{
  return MEMORY[0x24BE322C8]();
}

uint64_t sub_23B90DB20()
{
  return MEMORY[0x24BE322F8]();
}

uint64_t sub_23B90DB2C()
{
  return MEMORY[0x24BE32308]();
}

uint64_t sub_23B90DB38()
{
  return MEMORY[0x24BE32350]();
}

uint64_t sub_23B90DB44()
{
  return MEMORY[0x24BE32360]();
}

uint64_t sub_23B90DB50()
{
  return MEMORY[0x24BE32378]();
}

uint64_t sub_23B90DB5C()
{
  return MEMORY[0x24BE32388]();
}

uint64_t sub_23B90DB68()
{
  return MEMORY[0x24BE323A8]();
}

uint64_t sub_23B90DB74()
{
  return MEMORY[0x24BE323C0]();
}

uint64_t sub_23B90DB80()
{
  return MEMORY[0x24BE323C8]();
}

uint64_t sub_23B90DB8C()
{
  return MEMORY[0x24BE323D0]();
}

uint64_t sub_23B90DB98()
{
  return MEMORY[0x24BE323D8]();
}

uint64_t sub_23B90DBA4()
{
  return MEMORY[0x24BE323F0]();
}

uint64_t sub_23B90DBB0()
{
  return MEMORY[0x24BE323F8]();
}

uint64_t sub_23B90DBBC()
{
  return MEMORY[0x24BE32400]();
}

uint64_t sub_23B90DBC8()
{
  return MEMORY[0x24BE32408]();
}

uint64_t sub_23B90DBD4()
{
  return MEMORY[0x24BE32418]();
}

uint64_t sub_23B90DBE0()
{
  return MEMORY[0x24BE32420]();
}

uint64_t sub_23B90DBEC()
{
  return MEMORY[0x24BE32428]();
}

uint64_t sub_23B90DBF8()
{
  return MEMORY[0x24BE32430]();
}

uint64_t sub_23B90DC04()
{
  return MEMORY[0x24BE32450]();
}

uint64_t sub_23B90DC10()
{
  return MEMORY[0x24BE32478]();
}

uint64_t sub_23B90DC1C()
{
  return MEMORY[0x24BE32480]();
}

uint64_t sub_23B90DC28()
{
  return MEMORY[0x24BE32488]();
}

uint64_t sub_23B90DC34()
{
  return MEMORY[0x24BE32498]();
}

uint64_t sub_23B90DC40()
{
  return MEMORY[0x24BE324A0]();
}

uint64_t sub_23B90DC4C()
{
  return MEMORY[0x24BE324A8]();
}

uint64_t sub_23B90DC58()
{
  return MEMORY[0x24BE324B0]();
}

uint64_t sub_23B90DC64()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B90DC70()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B90DC7C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B90DC88()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23B90DC94()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23B90DCA0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23B90DCAC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23B90DCB8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23B90DCC4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23B90DCD0()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23B90DCDC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23B90DCE8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B90DCF4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B90DD00()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23B90DD0C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23B90DD18()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B90DD24()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B90DD30()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23B90DD3C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23B90DD48()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23B90DD54()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23B90DD60()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23B90DD6C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23B90DD78()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23B90DD84()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B90DD90()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23B90DD9C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23B90DDA8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23B90DDB4()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23B90DDC0()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23B90DDCC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23B90DDD8()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_23B90DDE4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23B90DDF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B90DDFC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B90DE08()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23B90DE14()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23B90DE20()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_23B90DE2C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23B90DE38()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23B90DE44()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23B90DE50()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23B90DE5C()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_23B90DE68()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B90DE74()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B90DE80()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23B90DE8C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23B90DE98()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23B90DEA4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B90DEB0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23B90DEBC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B90DEC8()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_23B90DED4()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_23B90DEE0()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_23B90DEEC()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_23B90DEF8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B90DF04()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B90DF10()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23B90DF1C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23B90DF28()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23B90DF34()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_23B90DF40()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23B90DF4C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B90DF58()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B90DF64()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23B90DF70()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B90DF7C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23B90DF88()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_23B90DF94()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_23B90DFA0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B90DFAC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B90DFB8()
{
  return MEMORY[0x24BEE4328]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


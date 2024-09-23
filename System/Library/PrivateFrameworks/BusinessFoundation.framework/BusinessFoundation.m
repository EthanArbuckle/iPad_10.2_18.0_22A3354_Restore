BOOL static LocalDatabase.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocalDatabase.Error.hash(into:)()
{
  return sub_2374210C4();
}

uint64_t LocalDatabase.Error.hashValue.getter()
{
  sub_2374210B8();
  sub_2374210C4();
  return sub_2374210D0();
}

BOOL sub_23741B9A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23741B9B4()
{
  sub_2374210B8();
  sub_2374210C4();
  return sub_2374210D0();
}

uint64_t sub_23741B9F8()
{
  return sub_2374210C4();
}

uint64_t sub_23741BA20()
{
  sub_2374210B8();
  sub_2374210C4();
  return sub_2374210D0();
}

uint64_t LocalDatabase.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  LocalDatabase.init(_:)(a1);
  return v2;
}

uint64_t LocalDatabase.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v14 = a1;
  v3 = sub_237420F8C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237420FB0();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8]();
  sub_237420E3C();
  MEMORY[0x24BDAC7A8]();
  v13 = OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue;
  v12 = sub_23741BD24();
  sub_237420E30();
  v15 = MEMORY[0x24BEE4AF8];
  sub_23741E9E0(&qword_2567D1210, v7, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1218);
  sub_23741C098(&qword_2567D1220, &qword_2567D1218);
  v8 = v14;
  sub_237420FE0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v3);
  *(_QWORD *)(v1 + v13) = sub_237420FBC();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database) = 0;
  if ((sub_237420DC4() & 1) != 0)
  {
    v9 = v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_url;
    v10 = sub_237420DDC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, v8, v10);
    return v2;
  }
  else
  {
    result = sub_237421004();
    __break(1u);
  }
  return result;
}

unint64_t sub_23741BD24()
{
  unint64_t result;

  result = qword_2567D1208;
  if (!qword_2567D1208)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2567D1208);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8118C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8118D4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t LocalDatabase.deinit()
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
  char *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_237420E24();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237420E3C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database);
  swift_beginAccess();
  v11 = *v10;
  if (v11)
  {
    v20 = v3;
    v12 = *(void **)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v11;
    aBlock[4] = sub_23741C04C;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23741C054;
    aBlock[3] = &block_descriptor;
    v14 = _Block_copy(aBlock);
    v15 = v12;
    sub_237420E30();
    v21 = MEMORY[0x24BEE4AF8];
    sub_23741E9E0((unint64_t *)&qword_2567D1238, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    v19 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1240);
    sub_23741C098((unint64_t *)&qword_2567D1248, &qword_2567D1240);
    sub_237420FE0();
    MEMORY[0x23B8114F0](0, v9, v5, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
    swift_release();
  }
  v16 = v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_url;
  v17 = sub_237420DDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);

  return v1;
}

uint64_t sub_23741C03C()
{
  return swift_deallocObject();
}

uint64_t sub_23741C04C()
{
  uint64_t v0;

  return sqlite3_close_v2(*(sqlite3 **)(v0 + 16));
}

uint64_t sub_23741C054(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_23741C098(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B8118E0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t LocalDatabase.__deallocating_deinit()
{
  LocalDatabase.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23741C0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23741C11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  sub_23741DFF4();
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_allocObject();
  *(_QWORD *)(v0 + 64) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  *(_QWORD *)(v4 + 48) = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v5;
  v6 = sub_237420EF0();
  *v5 = v0;
  v5[1] = sub_23741C22C;
  v7 = *(_QWORD *)(v0 + 56);
  v5[5] = v6;
  v5[6] = v7;
  v5[3] = sub_23741E1A0;
  v5[4] = v4;
  v5[2] = v0 + 16;
  return swift_task_switch();
}

uint64_t sub_23741C22C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23741C298()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23741C2A4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23741C2D8@<X0>(sqlite3 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  int v6;
  _BYTE *v7;
  sqlite3_stmt *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  sqlite3_stmt *ppStmt[2];

  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  sub_237420FEC();
  swift_bridgeObjectRelease();
  sub_237420E78();
  ppStmt[0] = 0;
  v5 = sub_237420E60();
  swift_bridgeObjectRelease();
  v6 = sqlite3_prepare_v2(a1, (const char *)(v5 + 32), -1, ppStmt, 0);
  swift_release();
  if (v6 || (v9 = ppStmt[0]) == 0)
  {
    sub_23741E5D8();
    swift_allocError();
    *v7 = 3;
    return swift_willThrow();
  }
  else
  {
    v10 = sub_237420ECC();
    v11 = sub_23741E61C(v9);
    type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder();
    v12 = (_QWORD *)swift_allocObject();
    v13 = MEMORY[0x24BEE4AF8];
    v12[4] = MEMORY[0x24BEE4AF8];
    v12[5] = sub_23741C84C(v13);
    v12[2] = v9;
    v12[3] = v11;
    if (sqlite3_step(v9) == 100)
    {
      sub_23741E9E0(&qword_2567D1508, (uint64_t (*)(uint64_t))type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder, (uint64_t)&unk_237421780);
      while (1)
      {
        swift_retain();
        sub_237420F44();
        if (v2)
          break;
        sub_237420EF0();
        sub_237420EE4();
        if (sqlite3_step(v9) != 100)
          goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
LABEL_8:
      swift_release();
      *a2 = v10;
    }
    return sqlite3_finalize(v9);
  }
}

uint64_t sub_23741C580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23741C5A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = v0[5];
  v1 = v0[6];
  v4 = v0[3];
  v3 = v0[4];
  v5 = *(void **)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue);
  v0[7] = (uint64_t)v5;
  v6 = (_QWORD *)swift_allocObject();
  v0[8] = (uint64_t)v6;
  v6[2] = v2;
  v6[3] = v1;
  v6[4] = v4;
  v6[5] = v3;
  v5;
  swift_retain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_23741C66C;
  return OS_dispatch_queue.bf_async<A>(execute:)(v0[2], (uint64_t)sub_23741E9C4, (uint64_t)v6, v0[5]);
}

uint64_t sub_23741C66C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 56);
  swift_release();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23741C6E8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  swift_release();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23741C720(uint64_t a1, uint64_t (*a2)(void))
{
  sqlite3 **v3;
  uint64_t v5;
  int v6;
  _BYTE *v7;

  v3 = (sqlite3 **)(a1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database);
  swift_beginAccess();
  if (*v3)
    return a2();
  sub_237420DD0();
  v5 = sub_237420E60();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v6 = sqlite3_open_v2((const char *)(v5 + 32), v3, 1, 0);
  swift_endAccess();
  swift_release();
  if (!v6)
    return a2();
  sub_23741E5D8();
  swift_allocError();
  *v7 = 0;
  return swift_willThrow();
}

unint64_t sub_23741C84C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1510);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1518);
  v6 = sub_237421028();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23741EA20(v12, (uint64_t)v5);
    result = sub_23741D920((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_237420FF8();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)sub_23741EA68(v9, (_OWORD *)(v7[7] + 32 * v16));
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
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

uint64_t sub_23741C9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v5 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, a2, a3, a4);
  v6 = *(_QWORD *)(v4 + 16);
  v9 = v4 + 24;
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(_QWORD *)(v9 + 8);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v8;
  v10[3] = v6;
  v10[4] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x23B8118E0](&unk_237421600, v5);
  return sub_237421034();
}

_QWORD *sub_23741CA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

uint64_t sub_23741CAC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23741CAFC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23741CB08()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23741CB14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23741C9E0(a1, a2, a3, a4);
}

uint64_t sub_23741CB34()
{
  return sub_23741CB48();
}

uint64_t sub_23741CB48()
{
  _BYTE *v0;

  sub_23741E5D8();
  swift_allocError();
  *v0 = 6;
  return swift_willThrow();
}

uint64_t sub_23741CB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  int v13;
  sqlite3_stmt *v14;
  _BYTE *v15;
  _BYTE *v16;
  int v17;
  uint64_t result;
  char v19;
  char *v20;

  v1 = v0;
  if (swift_dynamicCastMetatype())
  {
    v2 = *(_QWORD *)(v0 + 32);
    v3 = sub_2374210DC();
    if (*(_QWORD *)(v2 + 16))
    {
      v5 = sub_23741D8BC(v3, v4);
      if ((v6 & 1) != 0)
      {
        v7 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + 4 * v5);
        swift_bridgeObjectRelease();
        if (sqlite3_column_text(*(sqlite3_stmt **)(v1 + 24), v7))
        {
          sub_237420E90();
          return swift_dynamicCast();
        }
LABEL_14:
        v19 = 5;
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  if (swift_dynamicCastMetatype())
  {
    v8 = *(_QWORD *)(v0 + 32);
    v9 = sub_2374210DC();
    if (*(_QWORD *)(v8 + 16))
    {
      v11 = sub_23741D8BC(v9, v10);
      if ((v12 & 1) != 0)
      {
        v13 = *(_DWORD *)(*(_QWORD *)(v8 + 56) + 4 * v11);
        swift_bridgeObjectRelease();
        v14 = *(sqlite3_stmt **)(v1 + 24);
        v15 = sqlite3_column_blob(v14, v13);
        if (v15)
        {
          v16 = v15;
          v17 = sqlite3_column_bytes(v14, v13);
          sub_23741E8EC(v16, v17);
          return swift_dynamicCast();
        }
        goto LABEL_14;
      }
    }
LABEL_12:
    swift_bridgeObjectRelease();
    v19 = 4;
LABEL_13:
    sub_23741E5D8();
    swift_allocError();
    *v20 = v19;
    return swift_willThrow();
  }
  result = sub_237421004();
  __break(1u);
  return result;
}

void sub_23741CD74()
{
  sub_237421004();
  __break(1u);
}

void sub_23741CDBC()
{
  sub_237421004();
  __break(1u);
}

void sub_23741CE04()
{
  sub_237421004();
  __break(1u);
}

void sub_23741CE4C()
{
  sub_237421004();
  __break(1u);
}

void sub_23741CE94()
{
  sub_237421004();
  __break(1u);
}

uint64_t sub_23741CEDC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23741CF08()
{
  return swift_bridgeObjectRetain();
}

void sub_23741CF14()
{
  sub_23741E7E4();
}

void sub_23741CF20()
{
  sub_237421004();
  __break(1u);
}

void sub_23741CF68()
{
  sub_237421004();
  __break(1u);
}

uint64_t sub_23741CFB0()
{
  uint64_t v0;
  char v1;
  char v3;

  sub_23741CB94();
  if (!v0)
    v1 = v3;
  return v1 & 1;
}

uint64_t sub_23741CFFC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

double sub_23741D04C()
{
  uint64_t v0;
  double result;
  double v2;

  sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

float sub_23741D094()
{
  uint64_t v0;
  float result;
  float v2;

  sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_23741D0DC()
{
  return sub_23741D320();
}

uint64_t sub_23741D100()
{
  return sub_23741D1F4();
}

uint64_t sub_23741D124()
{
  return sub_23741D258();
}

uint64_t sub_23741D148()
{
  return sub_23741D2BC();
}

uint64_t sub_23741D16C()
{
  return sub_23741D320();
}

uint64_t sub_23741D190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D37C(a1, a2, a3, MEMORY[0x24BEE3C70]);
}

uint64_t sub_23741D1AC()
{
  return sub_23741D320();
}

uint64_t sub_23741D1D0()
{
  return sub_23741D1F4();
}

uint64_t sub_23741D1F4()
{
  uint64_t v0;
  uint64_t result;
  unsigned __int8 v2;

  result = sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_23741D234()
{
  return sub_23741D258();
}

uint64_t sub_23741D258()
{
  uint64_t v0;
  uint64_t result;
  unsigned __int16 v2;

  result = sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_23741D298()
{
  return sub_23741D2BC();
}

uint64_t sub_23741D2BC()
{
  uint64_t v0;
  uint64_t result;
  unsigned int v2;

  result = sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_23741D2FC()
{
  return sub_23741D320();
}

uint64_t sub_23741D320()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23741CB94();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_23741D360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D37C(a1, a2, a3, MEMORY[0x24BEE3C78]);
}

uint64_t sub_23741D37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;

  v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  return a4(a1, v7, a3);
}

uint64_t sub_23741D3D0()
{
  return sub_23741CB94();
}

uint64_t sub_23741D3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_237421064();
}

uint64_t sub_23741D440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_237421058();
}

uint64_t sub_23741D490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D73C(a1, a2, a3, MEMORY[0x24BEE3BF8]);
}

uint64_t sub_23741D4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D6B0(a1, a2, a3, MEMORY[0x24BEE3C00]);
}

uint64_t sub_23741D4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D73C(a1, a2, a3, MEMORY[0x24BEE3C08]);
}

uint64_t sub_23741D4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D5A8(a1, a2, a3, MEMORY[0x24BEE3C20]);
}

uint64_t sub_23741D500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D62C(a1, a2, a3, MEMORY[0x24BEE3C28]);
}

uint64_t sub_23741D51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D6B0(a1, a2, a3, MEMORY[0x24BEE3C30]);
}

uint64_t sub_23741D538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D73C(a1, a2, a3, MEMORY[0x24BEE3C38]);
}

uint64_t sub_23741D554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D7B8(a1, a2, a3, MEMORY[0x24BEE3C48]);
}

uint64_t sub_23741D570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D73C(a1, a2, a3, MEMORY[0x24BEE3C10]);
}

uint64_t sub_23741D58C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D5A8(a1, a2, a3, MEMORY[0x24BEE3C40]);
}

uint64_t sub_23741D5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;

  v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  return a4(a1, v7, a3) & 0x1FF;
}

uint64_t sub_23741D610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D62C(a1, a2, a3, MEMORY[0x24BEE3C50]);
}

uint64_t sub_23741D62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;

  v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  return a4(a1, v7, a3) & 0x1FFFF;
}

uint64_t sub_23741D694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D6B0(a1, a2, a3, MEMORY[0x24BEE3C58]);
}

uint64_t sub_23741D6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;

  v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  v8 = a4(a1, v7, a3);
  return v8 | ((HIDWORD(v8) & 1) << 32);
}

uint64_t sub_23741D720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D73C(a1, a2, a3, MEMORY[0x24BEE3C60]);
}

uint64_t sub_23741D73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v8 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  result = a4(a1, v8, a3);
  if (v4)
    return v10;
  return result;
}

uint64_t sub_23741D79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23741D7B8(a1, a2, a3, MEMORY[0x24BEE3C68]);
}

uint64_t sub_23741D7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v8 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), (uint64_t)a4);
  result = a4(a1, v8, a3);
  if (v4)
    return v10;
  return result;
}

void sub_23741D81C()
{
  sub_23741CD74();
}

void sub_23741D83C()
{
  sub_23741CDBC();
}

void sub_23741D85C()
{
  sub_23741CE04();
}

void sub_23741D87C()
{
  sub_23741CE4C();
}

void sub_23741D89C()
{
  sub_23741CE94();
}

unint64_t sub_23741D8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2374210B8();
  sub_237420E6C();
  v4 = sub_2374210D0();
  return sub_23741DC58(a1, a2, v4);
}

unint64_t sub_23741D920(uint64_t a1)
{
  uint64_t v2;

  sub_237420FF8();
  v2 = sub_237420E48();
  return sub_23741DD38(a1, v2);
}

uint64_t sub_23741D970(uint64_t a1, char a2)
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
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1520);
  v37 = a2;
  v6 = sub_23742101C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
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
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v35;
        if ((v37 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v36 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2374210B8();
    sub_237420E6C();
    result = sub_2374210D0();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_23741DC58(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23742104C() & 1) == 0)
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
      while (!v14 && (sub_23742104C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23741DD38(uint64_t a1, uint64_t a2)
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
  v5 = sub_237420FF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
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
      v14 = sub_237420E54();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_23741DE60()
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
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1520);
  v2 = *v0;
  v3 = sub_237421010();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v20) = (_DWORD)v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23741DFF4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  _QWORD v11[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1528);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1530);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_237420E18();
  if (!v0)
  {
    sub_237420E0C();
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1538);
    v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v2, 1, v8);
    sub_23741EA78((uint64_t)v2);
    if (v9 == 1)
    {
      sub_23741E5D8();
      swift_allocError();
      *v10 = 2;
      swift_willThrow();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_23741E174()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23741E1A0@<X0>(sqlite3 *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23741C2D8(a1, a2);
}

unint64_t sub_23741E1C4()
{
  unint64_t result;

  result = qword_2567D1260;
  if (!qword_2567D1260)
  {
    result = MEMORY[0x23B8118E0](&protocol conformance descriptor for LocalDatabase.Error, &type metadata for LocalDatabase.Error);
    atomic_store(result, (unint64_t *)&qword_2567D1260);
  }
  return result;
}

uint64_t sub_23741E208()
{
  return type metadata accessor for LocalDatabase();
}

uint64_t type metadata accessor for LocalDatabase()
{
  uint64_t result;

  result = qword_2567D1290;
  if (!qword_2567D1290)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23741E24C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237420DDC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LocalDatabase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalDatabase.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of LocalDatabase.select<A>(all:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v5 + 160)
                                                                            + *(_QWORD *)(*(_QWORD *)v5 + 160));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v12;
  *v12 = v6;
  v12[1] = sub_23741E37C;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t sub_23741E37C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalDatabase.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LocalDatabase.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23741E4B8 + 4 * byte_237421445[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23741E4EC + 4 * byte_237421440[v4]))();
}

uint64_t sub_23741E4EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23741E4F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23741E4FCLL);
  return result;
}

uint64_t sub_23741E508(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23741E510);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23741E514(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23741E51C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23741E528(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23741E534(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalDatabase.Error()
{
  return &type metadata for LocalDatabase.Error;
}

uint64_t type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder()
{
  return objc_opt_self();
}

uint64_t sub_23741E570()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LocalDatabase.SQLiteKeyedContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LocalDatabase.SQLiteKeyedContainer);
}

uint64_t sub_23741E5D0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

unint64_t sub_23741E5D8()
{
  unint64_t result;

  result = qword_2567D1500;
  if (!qword_2567D1500)
  {
    result = MEMORY[0x23B8118E0](&protocol conformance descriptor for LocalDatabase.Error, &type metadata for LocalDatabase.Error);
    atomic_store(result, (unint64_t *)&qword_2567D1500);
  }
  return result;
}

uint64_t sub_23741E61C(sqlite3_stmt *a1)
{
  int v2;
  int v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;

  v2 = sqlite3_column_count(a1);
  if (v2 < 0)
    goto LABEL_24;
  v3 = v2;
  if (!v2)
    return MEMORY[0x24BEE4B00];
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (v3 != v4)
  {
    if (!sqlite3_column_name(a1, v4))
      goto LABEL_25;
    v6 = sub_237420E84();
    v8 = v7;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = sub_23741D8BC(v6, v8);
    v12 = v5[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      goto LABEL_22;
    v15 = v10;
    if (v5[3] >= v14)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23741DE60();
        if ((v15 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23741D970(v14, isUniquelyReferenced_nonNull_native);
      v16 = sub_23741D8BC(v6, v8);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_26;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_4:
        *(_DWORD *)(v5[7] + 4 * v11) = v4;
        goto LABEL_5;
      }
    }
    v5[(v11 >> 6) + 8] |= 1 << v11;
    v18 = (uint64_t *)(v5[6] + 16 * v11);
    *v18 = v6;
    v18[1] = v8;
    *(_DWORD *)(v5[7] + 4 * v11) = v4;
    v19 = v5[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_23;
    v5[2] = v21;
    swift_bridgeObjectRetain();
LABEL_5:
    ++v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v3 == v4)
      return (uint64_t)v5;
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_23742107C();
  __break(1u);
  return result;
}

void sub_23741E7E4()
{
  sub_237421004();
  __break(1u);
}

uint64_t sub_23741E82C(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_23741E8EC(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_23741E82C(__src, &__src[a2]);
  sub_237420DAC();
  swift_allocObject();
  sub_237420DA0();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_237420DE8();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_23741E998()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23741E9C4()
{
  uint64_t v0;

  return sub_23741C720(*(_QWORD *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_23741E9E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8118E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23741EA20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23741EA68(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23741EA78(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1528);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B811898](a1, v6, a5);
}

uint64_t OS_dispatch_queue.bf_async<A>(execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23741EB04()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_23741EBA0;
  return sub_237421070();
}

uint64_t sub_23741EBA0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23741EC14()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23741EC48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v26 = a3;
  v27 = a4;
  v31 = a2;
  v7 = sub_237420E24();
  v30 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237420E3C();
  v28 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v13 = sub_237420F20();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v25 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v25 - v16, a1, v13);
  v18 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v19 = (v15 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v18, v17, v13);
  v21 = (_QWORD *)(v20 + v19);
  v22 = v27;
  *v21 = v26;
  v21[1] = v22;
  aBlock[4] = sub_23741F03C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23741C054;
  aBlock[3] = &block_descriptor_0;
  v23 = _Block_copy(aBlock);
  swift_retain();
  sub_237420E30();
  v32 = MEMORY[0x24BEE4AF8];
  sub_23741F0C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1240);
  sub_23741F10C();
  sub_237420FE0();
  MEMORY[0x23B8114F0](0, v12, v9, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
  return swift_release();
}

uint64_t sub_23741EEB0(uint64_t a1)
{
  uint64_t *v1;

  return sub_23741EC48(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_23741EEBC()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  v0 = MEMORY[0x24BDAC7A8]();
  v1(v0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  sub_237420F20();
  return sub_237420F14();
}

uint64_t sub_23741EFA4()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v1 = sub_237420F20();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23741F03C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  sub_237420F20();
  return sub_23741EEBC();
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

unint64_t sub_23741F0C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567D1238;
  if (!qword_2567D1238)
  {
    v1 = sub_237420E24();
    result = MEMORY[0x23B8118E0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2567D1238);
  }
  return result;
}

unint64_t sub_23741F10C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567D1248;
  if (!qword_2567D1248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1240);
    result = MEMORY[0x23B8118E0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2567D1248);
  }
  return result;
}

uint64_t CKDatabase.bf_performQuery(recordType:predicate:sortDescriptors:desiredKeys:resultsLimit:zone:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v9 + 96) = a8;
  *(_QWORD *)(v9 + 104) = v8;
  *(_BYTE *)(v9 + 160) = a7;
  *(_QWORD *)(v9 + 80) = a5;
  *(_QWORD *)(v9 + 88) = a6;
  *(_QWORD *)(v9 + 64) = a3;
  *(_QWORD *)(v9 + 72) = a4;
  *(_QWORD *)(v9 + 48) = a1;
  *(_QWORD *)(v9 + 56) = a2;
  return swift_task_switch();
}

uint64_t sub_23741F180()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  v2 = *(void **)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  sub_23741F610(0, &qword_2567D1558);
  swift_bridgeObjectRetain();
  v3 = v2;
  v4 = (void *)sub_237420FC8();
  *(_QWORD *)(v0 + 112) = v4;
  if (v1)
  {
    sub_23741F610(0, &qword_2567D1568);
    v5 = (void *)sub_237420EA8();
    objc_msgSend(v4, sel_setSortDescriptors_, v5);

  }
  v6 = *(_QWORD *)(v0 + 80);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB91C8]), sel_initWithQuery_, v4);
  *(_QWORD *)(v0 + 120) = v7;
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_237420F50();
  }
  if ((*(_BYTE *)(v0 + 160) & 1) == 0)
    objc_msgSend(v7, sel_setResultsLimit_, *(_QWORD *)(v0 + 88));
  v8 = *(void **)(v0 + 96);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v9, sel_zoneID);
    objc_msgSend(v7, sel_setZoneID_, v10);

  }
  v11 = *(_QWORD *)(v0 + 104);
  v12 = swift_allocObject();
  *(_QWORD *)(v0 + 128) = v12;
  *(_QWORD *)(v12 + 16) = MEMORY[0x24BEE4AF8];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v13;
  v13[2] = v7;
  v13[3] = v12;
  v13[4] = v11;
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1560);
  *v14 = v0;
  v14[1] = sub_23741F390;
  return sub_237421070();
}

uint64_t sub_23741F390()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
  {

    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_23741F408()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_23741F47C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23741F4D0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_23741F4F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2567D1570);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_237420F5C();
  swift_retain();
  sub_237420F68();
  return objc_msgSend(a4, sel_addOperation_, a2);
}

id sub_23741F604(uint64_t a1)
{
  uint64_t v1;

  return sub_23741F4F4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_23741F610(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23741F648(void *a1, char a2)
{
  id v2;
  id v4;

  if ((a2 & 1) != 0)
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2567D1570);
    return sub_237420F08();
  }
  else
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2567D1570);
    return sub_237420F14();
  }
}

uint64_t sub_23741F6B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(qword_2567D1570);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23741F718(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(qword_2567D1570);
  return sub_23741F648(a1, v3);
}

uint64_t sub_23741F768(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  _QWORD *v5;
  id v6;
  uint64_t result;

  if ((a3 & 1) == 0)
  {
    v5 = (_QWORD *)(a4 + 16);
    swift_beginAccess();
    v6 = a2;
    MEMORY[0x23B8113F4]();
    if (*(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_237420EC0();
    sub_237420ED8();
    sub_237420EB4();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_23741F800(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;

  return sub_23741F768(a1, a2, a3 & 1, v3);
}

uint64_t static DictionarySerialization.encode(_:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_237420D94();
  swift_allocObject();
  sub_237420D88();
  v1 = sub_237420D7C();
  v3 = v2;
  result = swift_release();
  if (!v0)
  {
    v5 = (void *)objc_opt_self();
    v6 = (void *)sub_237420DF4();
    sub_23741F970(v1, v3);
    v10[0] = 0;
    v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 0, v10);

    v8 = v10[0];
    if (v7)
    {
      sub_237420FD4();
      return swift_unknownObjectRelease();
    }
    else
    {
      v9 = v8;
      sub_237420DB8();

      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_23741F970(uint64_t a1, unint64_t a2)
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

uint64_t static DictionarySerialization.decode(_:from:)(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_237420D70();
  swift_allocObject();
  sub_237420D64();
  v3 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_0(a2, a2[3]);
  v11[0] = 0;
  v4 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, sub_237421040(), 0, v11);
  swift_unknownObjectRelease();
  v5 = v11[0];
  if (v4)
  {
    v6 = sub_237420E00();
    v8 = v7;

    sub_237420D58();
    swift_release();
    return sub_23741F970(v6, v8);
  }
  else
  {
    v10 = v5;
    swift_release();
    sub_237420DB8();

    return swift_willThrow();
  }
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23741FB54()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for DictionarySerialization(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DictionarySerialization);
}

uint64_t AsyncMutex.__allocating_init(label:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  AsyncMutex.init(label:)(a1, a2);
  return v4;
}

uint64_t AsyncMutex.init(label:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[4];

  v8[1] = a1;
  v8[2] = a2;
  v3 = sub_237420F8C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237420F80();
  MEMORY[0x24BDAC7A8]();
  sub_237420E3C();
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v2 + 24) = dispatch_group_create();
  sub_23741FD40();
  sub_237420E30();
  v8[3] = MEMORY[0x24BEE4AF8];
  sub_23741FD7C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1608);
  sub_23741FDC4();
  sub_237420FE0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v3);
  *(_QWORD *)(v2 + 16) = sub_237420FA4();
  return v2;
}

unint64_t sub_23741FD40()
{
  unint64_t result;

  result = qword_2567D15F8;
  if (!qword_2567D15F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2567D15F8);
  }
  return result;
}

unint64_t sub_23741FD7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567D1600;
  if (!qword_2567D1600)
  {
    v1 = sub_237420F80();
    result = MEMORY[0x23B8118E0](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2567D1600);
  }
  return result;
}

unint64_t sub_23741FDC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2567D1610;
  if (!qword_2567D1610)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1608);
    result = MEMORY[0x23B8118E0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2567D1610);
  }
  return result;
}

uint64_t sub_23741FE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23741FE30()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0[6] + 16);
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_23741FE90;
  return OS_dispatch_group.bf_notify<A>(queue:execute:)(v0[2], v1, v0[3], v0[4], v0[5]);
}

uint64_t sub_23741FE90()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t AsyncMutex.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AsyncMutex.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AsyncMutex()
{
  return objc_opt_self();
}

uint64_t method lookup function for AsyncMutex()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncMutex.__allocating_init(label:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AsyncMutex.perform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 104)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 104));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23741FFE8;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_23741FFE8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t OS_dispatch_group.bf_notify<A>(queue:execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_237420050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_2374200F4;
  return sub_237421070();
}

uint64_t sub_2374200F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_237420168()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23742019C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v28 = a4;
  v29 = a5;
  v33 = a3;
  v27 = a2;
  v8 = sub_237420E24();
  v32 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_237420E3C();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v14 = sub_237420F20();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v27 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v27 - v17, a1, v14);
  v19 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v20 = (v16 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a6;
  v22 = v27;
  *(_QWORD *)(v21 + 24) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v19, v18, v14);
  v23 = (_QWORD *)(v21 + v20);
  v24 = v29;
  *v23 = v28;
  v23[1] = v24;
  aBlock[4] = sub_237420678;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23741C054;
  aBlock[3] = &block_descriptor_1;
  v25 = _Block_copy(aBlock);
  v22;
  swift_retain();
  sub_237420E30();
  v34 = MEMORY[0x24BEE4AF8];
  sub_23741F0C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D1240);
  sub_23741F10C();
  sub_237420FE0();
  sub_237420F74();
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
  return swift_release();
}

uint64_t sub_237420418(uint64_t a1)
{
  uint64_t v1;

  return sub_23742019C(a1, *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16));
}

uint64_t sub_237420428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;

  v23 = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v9 = sub_237420F20();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v22 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2567D16E0);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_enter(a1);
  v16 = sub_237420F38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = 0;
  *((_QWORD *)v18 + 3) = 0;
  *((_QWORD *)v18 + 4) = a5;
  *((_QWORD *)v18 + 5) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], v13, v9);
  v19 = &v18[(v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(_QWORD *)v19 = v23;
  *((_QWORD *)v19 + 1) = a4;
  v20 = a1;
  swift_retain();
  sub_2374208DC((uint64_t)v15, (uint64_t)&unk_2567D16F0, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_2374205C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v1 = sub_237420F20();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237420678()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v2 = *(_QWORD *)(sub_237420F20() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_237420428(*(NSObject **)(v0 + 24), v0 + v3, *v4, v4[1], v1);
}

uint64_t sub_2374206EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t);

  v8[4] = a5;
  v8[5] = a8;
  v8[3] = a4;
  v10 = swift_task_alloc();
  v8[6] = v10;
  v13 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  v11 = (_QWORD *)swift_task_alloc();
  v8[7] = v11;
  *v11 = v8;
  v11[1] = sub_237420778;
  return v13(v10);
}

uint64_t sub_237420778()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2374207DC()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  sub_237420F20();
  sub_237420F14();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237420858()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  sub_237420F20();
  sub_237420F08();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2374208DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_237420F38();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_237420F2C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_237420BD4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_237420EFC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
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

uint64_t sub_237420A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v1 = sub_237420F20();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237420AF4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = v1[4];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2567D1548);
  v5 = *(_QWORD *)(sub_237420F20() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v6;
  v11 = (char *)v1 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  v12 = *(int **)v11;
  v13 = *((_QWORD *)v11 + 1);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23741FFE8;
  return sub_2374206EC(a1, v7, v8, v9, v10, v12, v13, v4);
}

uint64_t sub_237420BD4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2567D16E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237420C14(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_237420C78;
  return v6(a1);
}

uint64_t sub_237420C78()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_237420CC4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237420CE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23741FFE8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2567D16F8 + dword_2567D16F8))(a1, v4);
}

uint64_t sub_237420D58()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_237420D64()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_237420D70()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_237420D7C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_237420D88()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_237420D94()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_237420DA0()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_237420DAC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_237420DB8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_237420DC4()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_237420DD0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_237420DDC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_237420DE8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_237420DF4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_237420E00()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_237420E0C()
{
  return MEMORY[0x24BEE73D0]();
}

uint64_t sub_237420E18()
{
  return MEMORY[0x24BEE7448]();
}

uint64_t sub_237420E24()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_237420E30()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_237420E3C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_237420E48()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_237420E54()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_237420E60()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_237420E6C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237420E78()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237420E84()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_237420E90()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_237420E9C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_237420EA8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_237420EB4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_237420EC0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_237420ECC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_237420ED8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_237420EE4()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_237420EF0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_237420EFC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_237420F08()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_237420F14()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_237420F20()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_237420F2C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_237420F38()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_237420F44()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_237420F50()
{
  return MEMORY[0x24BDB8D50]();
}

uint64_t sub_237420F5C()
{
  return MEMORY[0x24BDB8D58]();
}

uint64_t sub_237420F68()
{
  return MEMORY[0x24BDB8D60]();
}

uint64_t sub_237420F74()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_237420F80()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_237420F8C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_237420F98()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_237420FA4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_237420FB0()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_237420FBC()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_237420FC8()
{
  return MEMORY[0x24BDB8E18]();
}

uint64_t sub_237420FD4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_237420FE0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_237420FEC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_237420FF8()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_237421004()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_237421010()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23742101C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_237421028()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_237421034()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t sub_237421040()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23742104C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_237421058()
{
  return MEMORY[0x24BEE3BE8]();
}

uint64_t sub_237421064()
{
  return MEMORY[0x24BEE3BF0]();
}

uint64_t sub_237421070()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23742107C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_237421088()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_237421094()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2374210A0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2374210AC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2374210B8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2374210C4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2374210D0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2374210DC()
{
  return MEMORY[0x24BEE49E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}


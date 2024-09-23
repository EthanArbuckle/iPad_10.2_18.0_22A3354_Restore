uint64_t sub_2384A8F1C()
{
  uint64_t v0;

  swift_release();

  sub_2384A900C(v0 + 40);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EventKitSourceListener()
{
  return objc_opt_self();
}

unint64_t sub_2384A8F7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256911E38;
  if (!qword_256911E38)
  {
    v1 = sub_2384A8FC8(qword_256911E40);
    result = MEMORY[0x23B835DA0](MEMORY[0x24BDB9D08], v1);
    atomic_store(result, (unint64_t *)&qword_256911E38);
  }
  return result;
}

uint64_t sub_2384A8FC8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B835D94](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2384A900C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2384A904C(&qword_256911E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2384A904C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B835D88]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2384A908C()
{
  uint64_t v0;

  v0 = sub_2384A9E6C();
  sub_2384A90F8(v0, qword_256912180);
  sub_2384A9138(v0, (uint64_t)qword_256912180);
  return sub_2384A9E60();
}

uint64_t *sub_2384A90F8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_2384A9138(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void static ConditionalEngineStartup.start()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *v8;
  void *v9;
  _QWORD aBlock[6];

  v0 = sub_2384A9E90();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256911D40 != -1)
    swift_once();
  v4 = sub_2384A9E6C();
  sub_2384A9138(v4, (uint64_t)qword_256912180);
  v5 = sub_2384A9E54();
  v6 = sub_2384A9EB4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2384A7000, v5, v6, "conditional engine ignition", v7, 2u);
    MEMORY[0x23B835DF4](v7, -1, -1);
  }

  sub_2384A930C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5490], v0);
  v8 = sub_2384A9EC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  aBlock[4] = sub_2384A9348;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2384A9620;
  aBlock[3] = &unk_250A29F60;
  v9 = _Block_copy(aBlock);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v8, v9);
  _Block_release(v9);

}

unint64_t sub_2384A930C()
{
  unint64_t result;

  result = qword_256911E88;
  if (!qword_256911E88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256911E88);
  }
  return result;
}

void sub_2384A9348(void *a1)
{
  uint64_t v2;
  void *v3;

  v2 = MEMORY[0x23B835E24]();
  if (v2 == sub_2384A9E84())
  {
    v3 = (void *)MEMORY[0x23B835C80]();
    sub_2384A93B4(a1);
    objc_autoreleasePoolPop(v3);
  }
}

void sub_2384A93B4(void *a1)
{
  const char *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v13;

  v2 = (const char *)sub_2384A9E78();
  if (xpc_dictionary_get_string(a1, v2))
  {
    v3 = sub_2384A9E9C();
    v5 = v4;
    if (qword_256911D40 != -1)
      swift_once();
    v6 = sub_2384A9E6C();
    sub_2384A9138(v6, (uint64_t)qword_256912180);
    swift_bridgeObjectRetain_n();
    v7 = sub_2384A9E54();
    v8 = sub_2384A9EB4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v13 = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_2384A9690(v3, v5, &v13);
      sub_2384A9ECC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2384A7000, v7, v8, "%s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B835DF4](v10, -1, -1);
      MEMORY[0x23B835DF4](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (v3 == 0xD00000000000001FLL && v5 == 0x80000002384AA3A0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_2384A9F14();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
        return;
    }
    v12 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    objc_msgSend(v12, sel_postNotificationName_object_, *MEMORY[0x24BDC7420], 0);

  }
}

uint64_t sub_2384A9620(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_2384A9668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2384A9678()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for ConditionalEngineStartup()
{
  return &type metadata for ConditionalEngineStartup;
}

uint64_t sub_2384A9690(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2384A9760(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2384A9CF0((uint64_t)v12, *a3);
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
      sub_2384A9CF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2384A9CD0((uint64_t)v12);
  return v7;
}

uint64_t sub_2384A9760(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2384A9ED8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2384A9918(a5, a6);
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
  v8 = sub_2384A9EF0();
  if (!v8)
  {
    sub_2384A9EFC();
    __break(1u);
LABEL_17:
    result = sub_2384A9F08();
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

uint64_t sub_2384A9918(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2384A99AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2384A9B84(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2384A9B84(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2384A99AC(uint64_t a1, unint64_t a2)
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
      v3 = sub_2384A9B20(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2384A9EE4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2384A9EFC();
      __break(1u);
LABEL_10:
      v2 = sub_2384A9EA8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2384A9F08();
    __break(1u);
LABEL_14:
    result = sub_2384A9EFC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2384A9B20(uint64_t a1, uint64_t a2)
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
  sub_2384A904C(qword_256911E90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2384A9B84(char a1, int64_t a2, char a3, char *a4)
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
    sub_2384A904C(qword_256911E90);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
  result = sub_2384A9F08();
  __break(1u);
  return result;
}

uint64_t sub_2384A9CD0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2384A9CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2384A9D34()
{
  return swift_initClassMetadata2();
}

id *sub_2384A9DA0()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_2384A9DEC()
{
  sub_2384A9DA0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BiomeSourceListener(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2384A9E28(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeSourceListener);
}

void sub_2384A9E18()
{
  JUMPOUT(0x23B835DA0);
}

uint64_t sub_2384A9E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B835D64](a1, v6, a5);
}

uint64_t sub_2384A9E54()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2384A9E60()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2384A9E6C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2384A9E78()
{
  return MEMORY[0x24BEE64A8]();
}

uint64_t sub_2384A9E84()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_2384A9E90()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2384A9E9C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2384A9EA8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2384A9EB4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2384A9EC0()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2384A9ECC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2384A9ED8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2384A9EE4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2384A9EF0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2384A9EFC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2384A9F08()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2384A9F14()
{
  return MEMORY[0x24BEE3A30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}


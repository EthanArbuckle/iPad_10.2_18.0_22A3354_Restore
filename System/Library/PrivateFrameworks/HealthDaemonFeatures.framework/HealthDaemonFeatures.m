id HealthDaemonFeaturesProfileExtension.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HealthDaemonFeaturesProfileExtension.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HealthDaemonFeaturesProfileExtension.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HealthDaemonFeaturesProfileExtension()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthDaemonFeaturesProfileExtension()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23DDDD510(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DDDD5E0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DDDDE5C((uint64_t)v12, *a3);
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
      sub_23DDDDE5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DDDD5E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DDDE314();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DDDD798(a5, a6);
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
  v8 = sub_23DDDE32C();
  if (!v8)
  {
    sub_23DDDE338();
    __break(1u);
LABEL_17:
    result = sub_23DDDE344();
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

uint64_t sub_23DDDD798(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DDDD82C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DDDDA00(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DDDDA00(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DDDD82C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DDDD9A0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DDDE320();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DDDE338();
      __break(1u);
LABEL_10:
      v2 = sub_23DDDE2E4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DDDE344();
    __break(1u);
LABEL_14:
    result = sub_23DDDE338();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DDDD9A0(uint64_t a1, uint64_t a2)
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
  sub_23DDDDE98();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DDDDA00(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DDDDE98();
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
  result = sub_23DDDE344();
  __break(1u);
  return result;
}

id sub_23DDDDB48(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  id v15;
  uint64_t v16;
  objc_super v17;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_254326F00 != -1)
    swift_once();
  v5 = sub_23DDDE2CC();
  __swift_project_value_buffer(v5, (uint64_t)qword_254326F18);
  v6 = a1;
  v7 = sub_23DDDE2B4();
  v8 = sub_23DDDE2F0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16 = v14;
    *(_DWORD *)v9 = 136446466;
    v11 = sub_23DDDE35C();
    sub_23DDDD510(v11, v12, &v16);
    sub_23DDDE308();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v15 = objc_msgSend(v6, sel_profileIdentifier);
    sub_23DDDE308();
    *v10 = v15;

    _os_log_impl(&dword_23DDDC000, v7, v8, "[%{public}s] Profile extension loaded for profile %@", (uint8_t *)v9, 0x16u);
    sub_23DDDDDAC();
    swift_arrayDestroy();
    MEMORY[0x242643F84](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242643F84](v14, -1, -1);
    MEMORY[0x242643F84](v9, -1, -1);

  }
  else
  {

  }
  v17.receiver = v2;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_23DDDDDAC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254326F10)
  {
    sub_23DDDDE00();
    v0 = sub_23DDDE2FC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254326F10);
  }
}

unint64_t sub_23DDDDE00()
{
  unint64_t result;

  result = qword_254326F08;
  if (!qword_254326F08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254326F08);
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

uint64_t sub_23DDDDE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23DDDDE98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D06700)
  {
    v0 = sub_23DDDE350();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D06700);
  }
}

uint64_t sub_23DDDDF24()
{
  return 0x654668746C616548;
}

uint64_t sub_23DDDDF48()
{
  return 0;
}

id sub_23DDDDF58(void *a1)
{
  id v2;
  id v3;
  id v4;

  if (objc_msgSend(a1, sel_profileType) != (id)1)
    return 0;
  v2 = objc_allocWithZone((Class)type metadata accessor for HealthDaemonFeaturesProfileExtension());
  v3 = a1;
  v4 = sub_23DDDDB48(v3);

  return v4;
}

id HealthDaemonFeaturesPlugin.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HealthDaemonFeaturesPlugin.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HealthDaemonFeaturesPlugin.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HealthDaemonFeaturesPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthDaemonFeaturesPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthDaemonFeaturesPlugin.pluginIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of HealthDaemonFeaturesPlugin.extension(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t static HealthDaemonFeaturesUtilities.pluginIdentifier.getter()
{
  return 0x654668746C616548;
}

id static HealthDaemonFeaturesUtilities.bundle.getter()
{
  uint64_t ObjCClassFromMetadata;

  type metadata accessor for HealthDaemonFeaturesPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
}

ValueMetadata *type metadata accessor for HealthDaemonFeaturesUtilities()
{
  return &type metadata for HealthDaemonFeaturesUtilities;
}

uint64_t sub_23DDDE200()
{
  uint64_t v0;

  v0 = sub_23DDDE2CC();
  __swift_allocate_value_buffer(v0, qword_254326F18);
  __swift_project_value_buffer(v0, (uint64_t)qword_254326F18);
  return sub_23DDDE2C0();
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

uint64_t sub_23DDDE2B4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DDDE2C0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DDDE2CC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DDDE2D8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DDDE2E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DDDE2F0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DDDE2FC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DDDE308()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DDDE314()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DDDE320()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DDDE32C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DDDE338()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DDDE344()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DDDE350()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DDDE35C()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}


uint64_t sub_2384ACCF8()
{
  uint64_t v0;

  v0 = sub_2384AEDD4();
  __swift_allocate_value_buffer(v0, qword_256912260);
  __swift_project_value_buffer(v0, (uint64_t)qword_256912260);
  return sub_2384AEDC8();
}

void Logger.ifError(_:message:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569121E0);
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_2384AF240;
    swift_getErrorValue();
    MEMORY[0x23B8361C4](a1);
    v3 = sub_2384AEF78();
    v5 = v4;
    *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v2 + 64) = sub_2384ACFB4();
    *(_QWORD *)(v2 + 32) = v3;
    *(_QWORD *)(v2 + 40) = v5;
    v6 = sub_2384AEED0();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = sub_2384AEDBC();
    v10 = sub_2384AEF00();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v13 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_2384AD190(v6, v8, &v13);
      sub_2384AEF0C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2384AB000, v9, v10, "%s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B83626C](v12, -1, -1);
      MEMORY[0x23B83626C](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83620C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2384ACFB4()
{
  unint64_t result;

  result = qword_2569121E8;
  if (!qword_2569121E8)
  {
    result = MEMORY[0x23B836224](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569121E8);
  }
  return result;
}

void Logger.ifErrorElse(_:message:debug:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (a1)
  {
    Logger.ifError(_:message:)(a1);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    oslog = sub_2384AEDBC();
    v7 = sub_2384AEEF4();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v11 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_bridgeObjectRetain();
      sub_2384AD190(a4, a5, &v11);
      sub_2384AEF0C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2384AB000, oslog, v7, "%s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B83626C](v9, -1, -1);
      MEMORY[0x23B83626C](v8, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
  }
}

uint64_t sub_2384AD190(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2384AD260(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2384AD848((uint64_t)v12, *a3);
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
      sub_2384AD848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2384AD260(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2384AEF18();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2384AD418(a5, a6);
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
  v8 = sub_2384AEF30();
  if (!v8)
  {
    sub_2384AEF3C();
    __break(1u);
LABEL_17:
    result = sub_2384AEF48();
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

uint64_t sub_2384AD418(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2384AD4AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2384AD684(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2384AD684(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2384AD4AC(uint64_t a1, unint64_t a2)
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
      v3 = sub_2384AD620(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2384AEF24();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2384AEF3C();
      __break(1u);
LABEL_10:
      v2 = sub_2384AEEDC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2384AEF48();
    __break(1u);
LABEL_14:
    result = sub_2384AEF3C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2384AD620(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569121F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2384AD684(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569121F0);
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
  result = sub_2384AEF48();
  __break(1u);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_2384AD848(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Void __swiftcall registerWidgetViewDecoders()()
{
  sub_2384AD8B8();
  sub_2384AEE10();
}

unint64_t sub_2384AD8B8()
{
  unint64_t result;

  result = qword_2542CC680;
  if (!qword_2542CC680)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for MemojiArchivableView, &type metadata for MemojiArchivableView);
    atomic_store(result, (unint64_t *)&qword_2542CC680);
  }
  return result;
}

uint64_t sub_2384AD8FC()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v1 = (void *)sub_2384AEEC4();
  v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  if (v2)
  {
    v3 = (void *)sub_2384AEEC4();
    v4 = (objc_class *)objc_msgSend(v2, sel_classNamed_, v3);

    if (v4)
    {
      swift_getObjCClassMetadata();
      v5 = &unk_256913098;
      class_addProtocol(v4, (Protocol *)v5);

      return swift_dynamicCastTypeToObjCProtocolConditional();
    }

  }
  if (qword_2569121D8 != -1)
    swift_once();
  v7 = sub_2384AEDD4();
  __swift_project_value_buffer(v7, (uint64_t)qword_256912260);
  v8 = sub_2384AEDBC();
  v9 = sub_2384AEEE8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2384AB000, v8, v9, "AVTContactsWidgetCoordinator not available", v10, 2u);
    MEMORY[0x23B83626C](v10, -1, -1);
  }

  return 0;
}

id sub_2384ADAC0()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0B448]), sel_init);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  if (sub_2384AD8FC())
  {
    objc_msgSend(objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init), sel_addAvatarDescriptor_forView_, v1, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_2569121D8 != -1)
      swift_once();
    v6 = sub_2384AEDD4();
    __swift_project_value_buffer(v6, (uint64_t)qword_256912260);
    v7 = sub_2384AEDBC();
    v8 = sub_2384AEF00();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2384AB000, v7, v8, "No class found for AVTContactsWidgetCoordinator", v9, 2u);
      MEMORY[0x23B83626C](v9, -1, -1);
    }

  }
  return v4;
}

id AnimatedMemojiView.makeUIView(context:)()
{
  return sub_2384ADAC0();
}

unint64_t sub_2384ADC74()
{
  unint64_t result;

  result = qword_2569121F8;
  if (!qword_2569121F8)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for AnimatedMemojiView, &type metadata for AnimatedMemojiView);
    atomic_store(result, (unint64_t *)&qword_2569121F8);
  }
  return result;
}

id sub_2384ADCB8()
{
  return sub_2384ADAC0();
}

uint64_t sub_2384ADCFC()
{
  return sub_2384AEE34();
}

uint64_t sub_2384ADD3C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_2384ADD48()
{
  sub_2384ADE34();
  return sub_2384AEE94();
}

uint64_t sub_2384ADD98()
{
  sub_2384ADE34();
  return sub_2384AEE40();
}

uint64_t sub_2384ADDE8()
{
  return sub_2384AEEB8();
}

void sub_2384ADE00()
{
  sub_2384ADE34();
  sub_2384AEE88();
  __break(1u);
}

ValueMetadata *type metadata accessor for AnimatedMemojiView()
{
  return &type metadata for AnimatedMemojiView;
}

unint64_t sub_2384ADE34()
{
  unint64_t result;

  result = qword_256912200;
  if (!qword_256912200)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for AnimatedMemojiView, &type metadata for AnimatedMemojiView);
    atomic_store(result, (unint64_t *)&qword_256912200);
  }
  return result;
}

id sub_2384ADE78()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  id v3;

  v1 = *v0;
  v2 = v0[1];
  sub_2384AED64();
  sub_2384AE7C4(v1, v2);
  v3 = sub_2384AEC18();
  sub_2384AE814(v1, v2);
  return v3;
}

uint64_t MemojiArchivableView.init(memojiDescriptorData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MemojiArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t result;
  __int128 v4;

  v4 = *v1;
  sub_2384ADE78();
  sub_2384ADC74();
  result = sub_2384AEEAC();
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = BYTE8(v4);
  return result;
}

uint64_t sub_2384AE12C()
{
  return 1;
}

uint64_t sub_2384AE134()
{
  sub_2384AEF84();
  sub_2384AEF90();
  return sub_2384AEF9C();
}

uint64_t sub_2384AE174()
{
  return sub_2384AEF90();
}

uint64_t sub_2384AE198()
{
  sub_2384AEF84();
  sub_2384AEF90();
  return sub_2384AEF9C();
}

unint64_t sub_2384AE1D4()
{
  return 0xD000000000000014;
}

uint64_t sub_2384AE1F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2384AECE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2384AE218()
{
  return 0;
}

void sub_2384AE224(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2384AE230()
{
  sub_2384AE3A4();
  return sub_2384AEFC0();
}

uint64_t sub_2384AE258()
{
  sub_2384AE3A4();
  return sub_2384AEFCC();
}

uint64_t MemojiArchivableView.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912208);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384AE3A4();
  sub_2384AEFB4();
  v10[0] = v8;
  v10[1] = v7;
  sub_2384AE3E8();
  sub_2384AEF60();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2384AE3A4()
{
  unint64_t result;

  result = qword_256912210;
  if (!qword_256912210)
  {
    result = MEMORY[0x23B836224](&unk_2384AF548, &type metadata for MemojiArchivableView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912210);
  }
  return result;
}

unint64_t sub_2384AE3E8()
{
  unint64_t result;

  result = qword_256912218;
  if (!qword_256912218)
  {
    result = MEMORY[0x23B836224](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256912218);
  }
  return result;
}

uint64_t MemojiArchivableView.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256912220);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2384AE3A4();
  sub_2384AEFA8();
  if (!v2)
  {
    sub_2384AE54C();
    sub_2384AEF54();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_2384AE54C()
{
  unint64_t result;

  result = qword_256912228;
  if (!qword_256912228)
  {
    result = MEMORY[0x23B836224](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256912228);
  }
  return result;
}

unint64_t sub_2384AE594()
{
  unint64_t result;

  result = qword_2542CC698;
  if (!qword_2542CC698)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for MemojiArchivableView, &type metadata for MemojiArchivableView);
    atomic_store(result, (unint64_t *)&qword_2542CC698);
  }
  return result;
}

unint64_t sub_2384AE5DC()
{
  unint64_t result;

  result = qword_2542CC690;
  if (!qword_2542CC690)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for MemojiArchivableView, &type metadata for MemojiArchivableView);
    atomic_store(result, (unint64_t *)&qword_2542CC690);
  }
  return result;
}

unint64_t sub_2384AE624()
{
  unint64_t result;

  result = qword_2542CC688;
  if (!qword_2542CC688)
  {
    result = MEMORY[0x23B836224](&protocol conformance descriptor for MemojiArchivableView, &type metadata for MemojiArchivableView);
    atomic_store(result, (unint64_t *)&qword_2542CC688);
  }
  return result;
}

uint64_t sub_2384AE66C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return MemojiArchivableView.init(from:)(a1, a2);
}

uint64_t sub_2384AE680(_QWORD *a1)
{
  return MemojiArchivableView.encode(to:)(a1);
}

uint64_t sub_2384AE694()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2384AE6A4()
{
  sub_2384AD8B8();
  return sub_2384AEDE0();
}

uint64_t sub_2384AE6F4()
{
  sub_2384AD8B8();
  return sub_2384AEDEC();
}

uint64_t sub_2384AE744()
{
  sub_2384AD8B8();
  return sub_2384AEE04();
}

uint64_t *initializeBufferWithCopyOfBuffer for MemojiArchivableView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_2384AE7C4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_2384AE7C4(uint64_t a1, unint64_t a2)
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

uint64_t destroy for MemojiArchivableView(uint64_t a1)
{
  return sub_2384AE814(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_2384AE814(uint64_t a1, unint64_t a2)
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

uint64_t *assignWithCopy for MemojiArchivableView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_2384AE7C4(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_2384AE814(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for MemojiArchivableView(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2384AE814(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MemojiArchivableView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MemojiArchivableView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MemojiArchivableView()
{
  return &type metadata for MemojiArchivableView;
}

unint64_t sub_2384AE994()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256912230;
  if (!qword_256912230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256912238);
    v2[0] = sub_2384ADC74();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B836224](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256912230);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B836218](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MemojiArchivableView.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MemojiArchivableView.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2384AEADC + 4 * asc_2384AF380[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2384AEAFC + 4 * byte_2384AF385[v4]))();
}

_BYTE *sub_2384AEADC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2384AEAFC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384AEB04(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384AEB0C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2384AEB14(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2384AEB1C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2384AEB28()
{
  return 0;
}

ValueMetadata *type metadata accessor for MemojiArchivableView.CodingKeys()
{
  return &type metadata for MemojiArchivableView.CodingKeys;
}

unint64_t sub_2384AEB44()
{
  unint64_t result;

  result = qword_256912240;
  if (!qword_256912240)
  {
    result = MEMORY[0x23B836224](&unk_2384AF520, &type metadata for MemojiArchivableView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912240);
  }
  return result;
}

unint64_t sub_2384AEB8C()
{
  unint64_t result;

  result = qword_256912248;
  if (!qword_256912248)
  {
    result = MEMORY[0x23B836224](&unk_2384AF490, &type metadata for MemojiArchivableView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912248);
  }
  return result;
}

unint64_t sub_2384AEBD4()
{
  unint64_t result;

  result = qword_256912250;
  if (!qword_256912250)
  {
    result = MEMORY[0x23B836224](&unk_2384AF4B8, &type metadata for MemojiArchivableView.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256912250);
  }
  return result;
}

id sub_2384AEC18()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)sub_2384AEDB0();
  v5[0] = 0;
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_descriptorWithDataRepresentation_error_, v0, v5);

  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_2384AEDA4();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_2384AECE0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000014 && a2 == 0x80000002384AFAE0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_2384AEF6C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_2384AED64()
{
  unint64_t result;

  result = qword_256912258;
  if (!qword_256912258)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256912258);
  }
  return result;
}

uint64_t sub_2384AEDA4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2384AEDB0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2384AEDBC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2384AEDC8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2384AEDD4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2384AEDE0()
{
  return MEMORY[0x24BDED520]();
}

uint64_t sub_2384AEDEC()
{
  return MEMORY[0x24BDED528]();
}

uint64_t sub_2384AEDF8()
{
  return MEMORY[0x24BDED530]();
}

uint64_t sub_2384AEE04()
{
  return MEMORY[0x24BDED538]();
}

uint64_t sub_2384AEE10()
{
  return MEMORY[0x24BDED540]();
}

uint64_t sub_2384AEE1C()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2384AEE28()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2384AEE34()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_2384AEE40()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_2384AEE4C()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_2384AEE58()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_2384AEE64()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_2384AEE70()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_2384AEE7C()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_2384AEE88()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_2384AEE94()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_2384AEEA0()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_2384AEEAC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2384AEEB8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2384AEEC4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2384AEED0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2384AEEDC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2384AEEE8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2384AEEF4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2384AEF00()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2384AEF0C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2384AEF18()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2384AEF24()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2384AEF30()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2384AEF3C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2384AEF48()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2384AEF54()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2384AEF60()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2384AEF6C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2384AEF78()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2384AEF84()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2384AEF90()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2384AEF9C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2384AEFA8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2384AEFB4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2384AEFC0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2384AEFCC()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE58](cls, protocol);
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

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C80]();
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


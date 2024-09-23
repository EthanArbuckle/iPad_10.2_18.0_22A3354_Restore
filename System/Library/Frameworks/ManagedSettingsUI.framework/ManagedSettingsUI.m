double sub_21A9ACB58@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21A9ACB94(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDDAE58], "Returning default configuration for application: %{sensitive}s", a2);
}

double sub_21A9ACB6C@<D0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD, _QWORD)@<X1>, uint64_t a3@<X8>)
{
  return sub_21A9ACDFC(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDDAE58], "Returning default configuration for application: %{sensitive}s in category: %{sensitive}s", a3);
}

double sub_21A9ACB80@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21A9ACB94(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDDAEF0], "Returning default configuration for web domain: %{sensitive}s", a2);
}

double sub_21A9ACB94@<D0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, const char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  double result;
  _QWORD v23[2];
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a2(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v23 - v12;
  if (qword_2551067E8 != -1)
    swift_once();
  v14 = sub_21A9B170C();
  __swift_project_value_buffer(v14, (uint64_t)qword_2551068E8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v15(v13, a1, v7);
  v16 = sub_21A9B16F4();
  v17 = sub_21A9B1778();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v27 = v25;
    v24 = a3;
    *(_DWORD *)v18 = 136642819;
    v23[1] = v18 + 4;
    v15(v11, (uint64_t)v13, v7);
    v19 = sub_21A9B1730();
    v26 = sub_21A9AD21C(v19, v20, &v27);
    sub_21A9B1790();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _os_log_impl(&dword_21A9AB000, v16, v17, v24, v18, 0xCu);
    v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x22074DA94](v21, -1, -1);
    MEMORY[0x22074DA94](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }

  *(_QWORD *)a4 = 0;
  *(_BYTE *)(a4 + 8) = 1;
  result = 0.0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_QWORD *)(a4 + 128) = 0;
  return result;
}

double sub_21A9ACDE8@<D0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD, _QWORD)@<X1>, uint64_t a3@<X8>)
{
  return sub_21A9ACDFC(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDDAEF0], "Returning default configuration for web domain: %{sensitive}s in category: %{sensitive}s", a3);
}

double sub_21A9ACDFC@<D0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD, _QWORD)@<X1>, uint64_t (*a3)(_QWORD)@<X2>, const char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t, uint64_t);
  void (*v22)(_QWORD, _QWORD, _QWORD);
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double result;
  _BYTE v35[4];
  int v36;
  os_log_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  const char *v41;
  void (*v42)(_QWORD, _QWORD, _QWORD);
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;

  v41 = a4;
  v42 = a2;
  v8 = sub_21A9B1694();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v40 = &v35[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v43 = &v35[-v12];
  v13 = a3(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v35[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v19 = &v35[-v18];
  if (qword_2551067E8 != -1)
    swift_once();
  v20 = sub_21A9B170C();
  __swift_project_value_buffer(v20, (uint64_t)qword_2551068E8);
  v21 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16);
  v21(v19, a1, v13);
  v22 = v42;
  v42 = *(void (**)(_QWORD, _QWORD, _QWORD))(v9 + 16);
  v42(v43, v22, v8);
  v23 = sub_21A9B16F4();
  v24 = sub_21A9B1778();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc();
    v38 = v9;
    v27 = v26;
    v39 = swift_slowAlloc();
    v45 = v39;
    *(_DWORD *)v27 = 136643075;
    v37 = v23;
    v21(v17, (uint64_t)v19, v13);
    v28 = sub_21A9B1730();
    v44 = sub_21A9AD21C(v28, v29, &v45);
    v36 = v25;
    sub_21A9B1790();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v19, v13);
    *(_WORD *)(v27 + 12) = 2085;
    v30 = v43;
    v42(v40, v43, v8);
    v31 = sub_21A9B1730();
    v44 = sub_21A9AD21C(v31, v32, &v45);
    sub_21A9B1790();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v30, v8);
    v23 = v37;
    _os_log_impl(&dword_21A9AB000, v37, (os_log_type_t)v36, v41, (uint8_t *)v27, 0x16u);
    v33 = v39;
    swift_arrayDestroy();
    MEMORY[0x22074DA94](v33, -1, -1);
    MEMORY[0x22074DA94](v27, -1, -1);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v19, v13);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v43, v8);
  }

  *(_QWORD *)a5 = 0;
  *(_BYTE *)(a5 + 8) = 1;
  result = 0.0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_QWORD *)(a5 + 128) = 0;
  return result;
}

id ShieldConfigurationDataSource.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ShieldConfigurationDataSource.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationDataSource();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ShieldConfigurationDataSource.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21A9AD21C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21A9AD2EC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21A9AD92C((uint64_t)v12, *a3);
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
      sub_21A9AD92C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21A9AD2EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21A9B179C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21A9AD4A4(a5, a6);
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
  v8 = sub_21A9B17B4();
  if (!v8)
  {
    sub_21A9B17C0();
    __break(1u);
LABEL_17:
    result = sub_21A9B17CC();
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

uint64_t sub_21A9AD4A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21A9AD538(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21A9AD710(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21A9AD710(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21A9AD538(uint64_t a1, unint64_t a2)
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
      v3 = sub_21A9AD6AC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21A9B17A8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21A9B17C0();
      __break(1u);
LABEL_10:
      v2 = sub_21A9B173C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21A9B17CC();
    __break(1u);
LABEL_14:
    result = sub_21A9B17C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21A9AD6AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255106830);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21A9AD710(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255106830);
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
  result = sub_21A9B17CC();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ShieldConfigurationDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for ShieldConfigurationDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ShieldConfigurationDataSource.configuration(shielding:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ShieldConfigurationDataSource.configuration(shielding:in:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

void type metadata accessor for Style(uint64_t a1)
{
  sub_21A9AD9C0(a1, &qword_255106828);
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

uint64_t sub_21A9AD92C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074DA34]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_21A9AD9C0(a1, &qword_255106838);
}

void sub_21A9AD9C0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21A9ADA04()
{
  uint64_t v0;

  v0 = sub_21A9B170C();
  __swift_allocate_value_buffer(v0, qword_2551068E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2551068E8);
  return sub_21A9B1700();
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

__n128 ShieldConfiguration.init(backgroundBlurStyle:backgroundColor:icon:title:subtitle:primaryButtonLabel:primaryButtonBackgroundColor:secondaryButtonLabel:)@<Q0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 *a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __n128 result;

  v10 = *(_QWORD *)(a5 + 16);
  v11 = *(_QWORD *)(a6 + 16);
  v12 = *(_QWORD *)(a7 + 16);
  v13 = a10[1].n128_u64[0];
  *(_QWORD *)a9 = a1;
  *(_BYTE *)(a9 + 8) = a2 & 1;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)a5;
  *(_QWORD *)(a9 + 48) = v10;
  *(_OWORD *)(a9 + 56) = *(_OWORD *)a6;
  *(_QWORD *)(a9 + 72) = v11;
  *(_OWORD *)(a9 + 80) = *(_OWORD *)a7;
  *(_QWORD *)(a9 + 96) = v12;
  *(_QWORD *)(a9 + 104) = a8;
  result = *a10;
  *(__n128 *)(a9 + 112) = *a10;
  *(_QWORD *)(a9 + 128) = v13;
  return result;
}

uint64_t ShieldConfiguration.Label.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id ShieldConfiguration.Label.color.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

ManagedSettingsUI::ShieldConfiguration::Label __swiftcall ShieldConfiguration.Label.init(text:color:)(Swift::String text, UIColor color)
{
  uint64_t v2;
  ManagedSettingsUI::ShieldConfiguration::Label result;

  *(Swift::String *)v2 = text;
  *(UIColor *)(v2 + 16) = color;
  result.text = text;
  result.color = color;
  return result;
}

uint64_t ShieldConfiguration.backgroundBlurStyle.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void *ShieldConfiguration.backgroundColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void *ShieldConfiguration.icon.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

id ShieldConfiguration.title.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = v1[4];
  v3 = v1[5];
  v4 = (void *)v1[6];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  return sub_21A9ADBD0(v2, v3, v4);
}

id sub_21A9ADBD0(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  return result;
}

id ShieldConfiguration.subtitle.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = v1[7];
  v3 = v1[8];
  v4 = (void *)v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  return sub_21A9ADBD0(v2, v3, v4);
}

id ShieldConfiguration.primaryButtonLabel.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = v1[10];
  v3 = v1[11];
  v4 = (void *)v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  return sub_21A9ADBD0(v2, v3, v4);
}

void *ShieldConfiguration.primaryButtonBackgroundColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 104);
  v2 = v1;
  return v1;
}

id ShieldConfiguration.secondaryButtonLabel.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = v1[14];
  v3 = v1[15];
  v4 = (void *)v1[16];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  return sub_21A9ADBD0(v2, v3, v4);
}

uint64_t initializeBufferWithCopyOfBuffer for ShieldConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ShieldConfiguration(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 40))
  {
    swift_bridgeObjectRelease();

  }
  if (*(_QWORD *)(a1 + 64))
  {
    swift_bridgeObjectRelease();

  }
  if (*(_QWORD *)(a1 + 88))
  {
    swift_bridgeObjectRelease();

  }
  if (*(_QWORD *)(a1 + 120))
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t initializeWithCopy for ShieldConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  v7 = v4;
  v8 = v5;
  if (v6)
  {
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v6;
    v9 = *(void **)(a2 + 48);
    *(_QWORD *)(a1 + 48) = v9;
    swift_bridgeObjectRetain();
    v10 = v9;
    v11 = *(_QWORD *)(a2 + 64);
    if (v11)
      goto LABEL_3;
LABEL_6:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    v14 = *(_QWORD *)(a2 + 88);
    if (v14)
      goto LABEL_4;
    goto LABEL_7;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 64);
  if (!v11)
    goto LABEL_6;
LABEL_3:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v11;
  v12 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v12;
  swift_bridgeObjectRetain();
  v13 = v12;
  v14 = *(_QWORD *)(a2 + 88);
  if (v14)
  {
LABEL_4:
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = v14;
    v15 = *(void **)(a2 + 96);
    *(_QWORD *)(a1 + 96) = v15;
    swift_bridgeObjectRetain();
    v16 = v15;
    goto LABEL_8;
  }
LABEL_7:
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
LABEL_8:
  v17 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v17;
  v18 = *(_QWORD *)(a2 + 120);
  v19 = v17;
  if (v18)
  {
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 120) = v18;
    v20 = *(void **)(a2 + 128);
    *(_QWORD *)(a1 + 128) = v20;
    swift_bridgeObjectRetain();
    v21 = v20;
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  }
  return a1;
}

uint64_t assignWithCopy for ShieldConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  void *v41;
  void *v42;
  id v43;
  _OWORD *v44;
  _OWORD *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  __int128 v53;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = *(void **)(a1 + 16);
  v6 = (void *)a2[2];
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v6;

  v8 = *(void **)(a1 + 24);
  v9 = (void *)a2[3];
  *(_QWORD *)(a1 + 24) = v9;
  v10 = v9;

  v11 = (_OWORD *)(a1 + 32);
  v12 = a2 + 4;
  v13 = a2[5];
  if (*(_QWORD *)(a1 + 40))
  {
    if (v13)
    {
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v14 = (void *)a2[6];
      v15 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v14;
      v16 = v14;

    }
    else
    {
      sub_21A9AE174(a1 + 32);
      v19 = a2[6];
      *v11 = *v12;
      *(_QWORD *)(a1 + 48) = v19;
    }
  }
  else if (v13)
  {
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = a2[5];
    v17 = (void *)a2[6];
    *(_QWORD *)(a1 + 48) = v17;
    swift_bridgeObjectRetain();
    v18 = v17;
  }
  else
  {
    v20 = *v12;
    *(_QWORD *)(a1 + 48) = a2[6];
    *v11 = v20;
  }
  v21 = (_OWORD *)(a1 + 56);
  v22 = a2 + 7;
  v23 = a2[8];
  if (*(_QWORD *)(a1 + 64))
  {
    if (v23)
    {
      *(_QWORD *)(a1 + 56) = a2[7];
      *(_QWORD *)(a1 + 64) = a2[8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v24 = (void *)a2[9];
      v25 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v24;
      v26 = v24;

    }
    else
    {
      sub_21A9AE174(a1 + 56);
      v29 = a2[9];
      *v21 = *v22;
      *(_QWORD *)(a1 + 72) = v29;
    }
  }
  else if (v23)
  {
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = a2[8];
    v27 = (void *)a2[9];
    *(_QWORD *)(a1 + 72) = v27;
    swift_bridgeObjectRetain();
    v28 = v27;
  }
  else
  {
    v30 = *v22;
    *(_QWORD *)(a1 + 72) = a2[9];
    *v21 = v30;
  }
  v31 = (_OWORD *)(a1 + 80);
  v32 = a2 + 10;
  v33 = a2[11];
  if (*(_QWORD *)(a1 + 88))
  {
    if (v33)
    {
      *(_QWORD *)(a1 + 80) = a2[10];
      *(_QWORD *)(a1 + 88) = a2[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v34 = (void *)a2[12];
      v35 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v34;
      v36 = v34;

    }
    else
    {
      sub_21A9AE174(a1 + 80);
      v39 = a2[12];
      *v31 = *v32;
      *(_QWORD *)(a1 + 96) = v39;
    }
  }
  else if (v33)
  {
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = a2[11];
    v37 = (void *)a2[12];
    *(_QWORD *)(a1 + 96) = v37;
    swift_bridgeObjectRetain();
    v38 = v37;
  }
  else
  {
    v40 = *v32;
    *(_QWORD *)(a1 + 96) = a2[12];
    *v31 = v40;
  }
  v41 = *(void **)(a1 + 104);
  v42 = (void *)a2[13];
  *(_QWORD *)(a1 + 104) = v42;
  v43 = v42;

  v44 = (_OWORD *)(a1 + 112);
  v45 = a2 + 14;
  v46 = a2[15];
  if (*(_QWORD *)(a1 + 120))
  {
    if (v46)
    {
      *(_QWORD *)(a1 + 112) = a2[14];
      *(_QWORD *)(a1 + 120) = a2[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v47 = (void *)a2[16];
      v48 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v47;
      v49 = v47;

    }
    else
    {
      sub_21A9AE174(a1 + 112);
      v52 = a2[16];
      *v44 = *v45;
      *(_QWORD *)(a1 + 128) = v52;
    }
  }
  else if (v46)
  {
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = a2[15];
    v50 = (void *)a2[16];
    *(_QWORD *)(a1 + 128) = v50;
    swift_bridgeObjectRetain();
    v51 = v50;
  }
  else
  {
    v53 = *v45;
    *(_QWORD *)(a1 + 128) = a2[16];
    *v44 = v53;
  }
  return a1;
}

uint64_t sub_21A9AE174(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for ShieldConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = *(_QWORD *)(a2 + 40);
    if (v6)
    {
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v6;
      swift_bridgeObjectRelease();
      v7 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

      goto LABEL_6;
    }
    sub_21A9AE174(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
LABEL_6:
  if (*(_QWORD *)(a1 + 64))
  {
    v8 = *(_QWORD *)(a2 + 64);
    if (v8)
    {
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = v8;
      swift_bridgeObjectRelease();
      v9 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);

      goto LABEL_11;
    }
    sub_21A9AE174(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
LABEL_11:
  if (*(_QWORD *)(a1 + 88))
  {
    v10 = *(_QWORD *)(a2 + 88);
    if (v10)
    {
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = v10;
      swift_bridgeObjectRelease();
      v11 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

      goto LABEL_16;
    }
    sub_21A9AE174(a1 + 80);
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
LABEL_16:
  v12 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  if (!*(_QWORD *)(a1 + 120))
  {
LABEL_20:
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
    return a1;
  }
  v13 = *(_QWORD *)(a2 + 120);
  if (!v13)
  {
    sub_21A9AE174(a1 + 112);
    goto LABEL_20;
  }
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  v14 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);

  return a1;
}

uint64_t getEnumTagSinglePayload for ShieldConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ShieldConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 136) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfiguration()
{
  return &type metadata for ShieldConfiguration;
}

void destroy for ShieldConfiguration.Label(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s17ManagedSettingsUI19ShieldConfigurationV5LabelVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for ShieldConfiguration.Label(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

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

uint64_t assignWithTake for ShieldConfiguration.Label(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for ShieldConfiguration.Label(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShieldConfiguration.Label(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfiguration.Label()
{
  return &type metadata for ShieldConfiguration.Label;
}

void sub_21A9AE618(uint64_t a1)
{
  sub_21A9AE640(a1, (void **)&protocolRef__TtP17ManagedSettingsUI32ShieldConfigurationExtensionHost_, &qword_255106840);
}

void sub_21A9AE62C(uint64_t a1)
{
  sub_21A9AE640(a1, (void **)&protocolRef__TtP17ManagedSettingsUI34ShieldConfigurationExtensionVendor_, &qword_255106848);
}

void sub_21A9AE640(uint64_t a1, void **a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *a2;
  v5 = (void *)objc_opt_self();
  v6 = v4;
  v7 = objc_msgSend(v5, sel_interfaceWithProtocol_, v6);

  *a3 = v7;
}

id sub_21A9AE6E0(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

BOOL sub_21A9AE71C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21A9AE734()
{
  sub_21A9B1814();
  sub_21A9B1820();
  return sub_21A9B182C();
}

uint64_t sub_21A9AE778()
{
  return sub_21A9B1820();
}

uint64_t sub_21A9AE7A0()
{
  sub_21A9B1814();
  sub_21A9B1820();
  return sub_21A9B182C();
}

void *sub_21A9AE7F0()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource;
  v2 = *(void **)&v0[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource];
  v3 = v2;
  if (v2 == (void *)1)
  {
    if (objc_msgSend(v0, sel__principalObject))
    {
      type metadata accessor for ShieldConfigurationDataSource();
      v3 = (void *)swift_dynamicCastClass();
      if (!v3)
        swift_unknownObjectRelease();
    }
    else
    {
      v3 = 0;
    }
    v4 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v3;
    v5 = v3;
    sub_21A9AF6FC(v4);
  }
  sub_21A9AF70C(v2);
  return v3;
}

uint64_t sub_21A9AEAA8(void *a1, int a2, int a3, void *a4, void *a5, void *aBlock, void (*a7)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, id, void *))
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v11 = _Block_copy(aBlock);
  v12 = sub_21A9B1724();
  v14 = v13;
  v15 = a4;
  v16 = a5;
  v17 = a1;
  v18 = sub_21A9B1640();
  v20 = v19;

  v21 = sub_21A9B1724();
  v23 = v22;

  _Block_copy(v11);
  a7(v12, v14, v18, v20, v21, v23, v17, v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_bridgeObjectRelease();
  sub_21A9B117C(v18, v20);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21A9AEBA8(double a1, double a2)
{
  UIImage *v2;
  UIImage *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  CGImage *v12;
  CGImage *v13;
  __CFData *v14;
  id v15;
  void *v16;
  __CFString *v17;
  CGImageDestinationRef v18;
  CGImageDestination *v19;
  id v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  const __CFDictionary *v28;
  __CFData *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  NSData *v35;
  NSData *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v46;

  v3 = v2;
  v6 = sub_21A9B16E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  -[UIImage size](v3, sel_size);
  if (v10 <= a1)
  {
    -[UIImage size](v3, sel_size);
    if (v11 <= a2)
    {
      v35 = UIImagePNGRepresentation(v3);
      if (v35)
      {
        v36 = v35;
        v30 = sub_21A9B1640();

        return v30;
      }
      return 0;
    }
  }
  v12 = -[UIImage CGImage](v3, sel_CGImage);
  if (!v12)
  {
    if (qword_2551067E8 != -1)
      swift_once();
    v31 = sub_21A9B170C();
    __swift_project_value_buffer(v31, (uint64_t)qword_2551068E8);
    v32 = sub_21A9B16F4();
    v33 = sub_21A9B1784();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_21A9AB000, v32, v33, "Failed to get CGImage from UImage", v34, 2u);
      MEMORY[0x22074DA94](v34, -1, -1);
    }

    return 0;
  }
  v13 = v12;
  v14 = (__CFData *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEC8]), sel_init);
  sub_21A9B16DC();
  sub_21A9B16D0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v16 = (void *)sub_21A9B1718();
  swift_bridgeObjectRelease();
  v17 = (__CFString *)objc_msgSend(v15, sel_initWithString_, v16);

  v18 = CGImageDestinationCreateWithData(v14, v17, 1uLL, 0);
  if (!v18)
  {
    if (qword_2551067E8 != -1)
      swift_once();
    v37 = sub_21A9B170C();
    __swift_project_value_buffer(v37, (uint64_t)qword_2551068E8);
    v38 = sub_21A9B16F4();
    v39 = sub_21A9B1784();
    if (!os_log_type_enabled(v38, v39))
    {

      goto LABEL_26;
    }
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_21A9AB000, v38, v39, "Failed to create image destination", v40, 2u);
    MEMORY[0x22074DA94](v40, -1, -1);

    return 0;
  }
  v19 = v18;
  if (a2 < a1)
    a1 = a2;
  v20 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v20, sel_scale);
  v22 = v21;

  sub_21A9B13A0(0, &qword_2551068B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551068B8);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_21A9B1D50;
  v24 = (void *)*MEMORY[0x24BDD9218];
  type metadata accessor for CFString(0);
  *(_QWORD *)(v23 + 56) = v25;
  *(_QWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 88) = MEMORY[0x24BEE50B0];
  *(double *)(v23 + 64) = a1 * v22;
  v26 = v24;
  v27 = (void *)sub_21A9B176C();
  v28 = (const __CFDictionary *)sub_21A9B1760();

  CGImageDestinationAddImage(v19, v13, v28);
  if (!CGImageDestinationFinalize(v19))
  {
    if (qword_2551067E8 != -1)
      swift_once();
    v41 = sub_21A9B170C();
    __swift_project_value_buffer(v41, (uint64_t)qword_2551068E8);
    v42 = sub_21A9B16F4();
    v43 = sub_21A9B1784();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_21A9AB000, v42, v43, "Failed to finalize image destination", v44, 2u);
      MEMORY[0x22074DA94](v44, -1, -1);

      return 0;
    }

LABEL_26:
    return 0;
  }
  v29 = v14;
  v30 = sub_21A9B1640();

  return v30;
}

id sub_21A9AF110(uint64_t a1)
{
  char *v1;
  void *v2;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    v2 = (void *)sub_21A9B1748();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  v3 = objc_msgSendSuper2(&v5, sel_initWithInputItems_, v2);

  if (v3)
  return v3;
}

id sub_21A9AF1EC(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  objc_super v17;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106880);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    v9 = (void *)sub_21A9B1748();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  sub_21A9B13D8(a2, (uint64_t)v8, &qword_255106880);
  v10 = sub_21A9B1664();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_21A9B164C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  v13 = (objc_class *)type metadata accessor for ShieldConfigurationExtensionContext();
  v17.receiver = v3;
  v17.super_class = v13;
  v14 = objc_msgSendSuper2(&v17, sel_initWithInputItems_contextUUID_, v9, v12);

  v15 = v14;
  sub_21A9B133C(a2, &qword_255106880);
  if (v15)

  return v15;
}

id sub_21A9AF434(uint64_t a1, void *a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  objc_super v19;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106880);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    v11 = (void *)sub_21A9B1748();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  sub_21A9B13D8(a3, (uint64_t)v10, &qword_255106880);
  v12 = sub_21A9B1664();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    v14 = (void *)sub_21A9B164C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  v15 = (objc_class *)type metadata accessor for ShieldConfigurationExtensionContext();
  v19.receiver = v4;
  v19.super_class = v15;
  v16 = objc_msgSendSuper2(&v19, sel_initWithInputItems_listenerEndpoint_contextUUID_, v11, a2, v14);

  v17 = v16;
  sub_21A9B133C(a3, &qword_255106880);
  if (v17)

  return v17;
}

id sub_21A9AF69C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShieldConfigurationExtensionContext()
{
  return objc_opt_self();
}

void sub_21A9AF6FC(id a1)
{
  if (a1 != (id)1)

}

id sub_21A9AF70C(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

id sub_21A9AF71C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v19;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v13 = v12;
  if (a2 >> 60 == 15)
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)sub_21A9B1634();
    sub_21A9B138C(a1, a2);
  }
  if (a4 >> 60 == 15)
  {
    v22 = 0;
  }
  else
  {
    v22 = (void *)sub_21A9B1634();
    sub_21A9B138C(a3, a4);
  }
  if (a6 >> 60 == 15)
  {
    v23 = 0;
  }
  else
  {
    v23 = (void *)sub_21A9B1634();
    sub_21A9B138C(a5, a6);
  }
  if (a11 >> 60 == 15)
  {
    v24 = 0;
  }
  else
  {
    v24 = (void *)sub_21A9B1634();
    sub_21A9B138C(a10, a11);
  }
  v25 = objc_msgSend(v13, sel_initWithBackgroundColorData_backgroundEffectData_iconData_title_subtitle_primaryButtonLabel_primaryButtonColorData_secondaryButtonLabel_, v19, v22, v23, a7, a8, a9, v24, a12);

  return v25;
}

uint64_t sub_21A9AF8A0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21[4];
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sub_21A9B13D8(a1, (uint64_t)&v23, &qword_255106898);
  if (!v24)
  {
    sub_21A9B133C((uint64_t)&v23, &qword_255106898);
    return 0;
  }
  sub_21A9B141C(&v23, &v25);
  v1 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_0(&v25, v26);
  v2 = sub_21A9B17D8();
  *(_QWORD *)&v23 = 0;
  v3 = objc_msgSend(v1, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v2, 1, &v23);
  swift_unknownObjectRelease();
  v4 = (id)v23;
  if (!v3)
  {
    v6 = v4;
    v7 = (void *)sub_21A9B1628();

    swift_willThrow();
    if (qword_2551067E8 != -1)
      swift_once();
    v8 = sub_21A9B170C();
    __swift_project_value_buffer(v8, (uint64_t)qword_2551068E8);
    sub_21A9AD92C((uint64_t)&v25, (uint64_t)&v23);
    v9 = v7;
    v10 = v7;
    v11 = sub_21A9B16F4();
    v12 = sub_21A9B1784();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v22 = v14;
      *(_DWORD *)v13 = 136446466;
      sub_21A9AD92C((uint64_t)&v23, (uint64_t)v21);
      v15 = sub_21A9B1730();
      v21[0] = sub_21A9AD21C(v15, v16, &v22);
      sub_21A9B1790();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v23);
      *(_WORD *)(v13 + 12) = 2082;
      v21[0] = (uint64_t)v7;
      v17 = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2551068C0);
      v18 = sub_21A9B1730();
      v21[0] = sub_21A9AD21C(v18, v19, &v22);
      sub_21A9B1790();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21A9AB000, v11, v12, "Failed to archive %{public}s: %{public}s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22074DA94](v14, -1, -1);
      MEMORY[0x22074DA94](v13, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v23);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v25);
    return 0;
  }
  v5 = sub_21A9B1640();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v25);
  return v5;
}

void sub_21A9AFC04(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  SEL *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v5 = (void *)a1[2];
  v4 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = (void *)a1[6];
  v9 = a1[8];
  v74 = (void *)a1[9];
  v76 = a1[7];
  v10 = a1[11];
  v11 = (void *)a1[13];
  v64 = (void *)a1[12];
  v66 = a1[10];
  v71 = a1[15];
  v73 = a1[14];
  v69 = (void *)a1[16];
  if (v5)
  {
    *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
    *(_QWORD *)&v83 = v5;
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  v12 = v5;
  v82 = sub_21A9AF8A0((uint64_t)&v83);
  v14 = v13;
  sub_21A9B133C((uint64_t)&v83, &qword_255106898);
  if ((v3 & 1) != 0)
  {
    v80 = 0xF000000000000000;
    v81 = 0;
    if (v4)
      goto LABEL_6;
  }
  else
  {
    v39 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, v2);
    *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A8);
    *(_QWORD *)&v83 = v39;
    v40 = sub_21A9AF8A0((uint64_t)&v83);
    v80 = v41;
    v81 = v40;
    sub_21A9B133C((uint64_t)&v83, &qword_255106898);
    if (v4)
    {
LABEL_6:
      v78 = sub_21A9AEBA8(120.0, 120.0);
      v79 = v15;
      v16 = (SEL *)&_swift_FORCE_LOAD___swiftsimd___ManagedSettingsUI;
      if (v7)
        goto LABEL_7;
LABEL_18:
      v68 = 0;
      if (v9)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  v78 = 0;
  v79 = 0xF000000000000000;
  v16 = (SEL *)&_swift_FORCE_LOAD___swiftsimd___ManagedSettingsUI;
  if (!v7)
    goto LABEL_18;
LABEL_7:
  v62 = v11;
  v17 = v14;
  *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
  *(_QWORD *)&v83 = v8;
  v18 = v8;
  sub_21A9ADBD0(v6, v7, v8);
  v19 = sub_21A9AF8A0((uint64_t)&v83);
  v21 = v20;
  sub_21A9B133C((uint64_t)&v83, &qword_255106898);
  swift_bridgeObjectRetain();
  v22 = (void *)sub_21A9B1718();
  swift_bridgeObjectRelease();
  v23 = 0;
  if (v21 >> 60 != 15)
  {
    v23 = (void *)sub_21A9B1634();
    sub_21A9B138C(v19, v21);
  }
  v16 = (SEL *)&_swift_FORCE_LOAD___swiftsimd___ManagedSettingsUI;
  v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F48]), sel_initWithText_colorData_, v22, v23);

  sub_21A9B130C(v6, v7, v8);
  v14 = v17;
  v11 = v62;
  if (v9)
  {
LABEL_10:
    *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
    *(_QWORD *)&v83 = v74;
    v24 = v74;
    sub_21A9ADBD0(v76, v9, v74);
    v25 = sub_21A9AF8A0((uint64_t)&v83);
    v27 = v26;
    sub_21A9B133C((uint64_t)&v83, &qword_255106898);
    swift_bridgeObjectRetain();
    v28 = (void *)sub_21A9B1718();
    swift_bridgeObjectRelease();
    v29 = 0;
    if (v27 >> 60 != 15)
    {
      v29 = (void *)sub_21A9B1634();
      sub_21A9B138C(v25, v27);
    }
    v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F48]), v16[157], v28, v29);

    sub_21A9B130C(v76, v9, v74);
    v31 = v64;
    v30 = v66;
    if (v10)
      goto LABEL_13;
LABEL_20:
    v38 = 0;
    goto LABEL_21;
  }
LABEL_19:
  v63 = 0;
  v31 = v64;
  v30 = v66;
  if (!v10)
    goto LABEL_20;
LABEL_13:
  *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
  *(_QWORD *)&v83 = v31;
  v32 = v31;
  sub_21A9ADBD0(v30, v10, v31);
  v33 = sub_21A9AF8A0((uint64_t)&v83);
  v35 = v34;
  sub_21A9B133C((uint64_t)&v83, &qword_255106898);
  swift_bridgeObjectRetain();
  v36 = (void *)sub_21A9B1718();
  swift_bridgeObjectRelease();
  v37 = 0;
  if (v35 >> 60 != 15)
  {
    v37 = (void *)sub_21A9B1634();
    sub_21A9B138C(v33, v35);
  }
  v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F48]), v16[157], v36, v37);

  sub_21A9B130C(v30, v10, v31);
LABEL_21:
  if (v11)
  {
    *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
    *(_QWORD *)&v83 = v11;
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  v42 = v11;
  v75 = sub_21A9AF8A0((uint64_t)&v83);
  v77 = v43;
  sub_21A9B133C((uint64_t)&v83, &qword_255106898);
  if (v71)
  {
    *((_QWORD *)&v84 + 1) = sub_21A9B13A0(0, &qword_2551068A0);
    *(_QWORD *)&v83 = v69;
    v44 = v69;
    sub_21A9ADBD0(v73, v71, v69);
    v45 = sub_21A9AF8A0((uint64_t)&v83);
    v47 = v46;
    sub_21A9B133C((uint64_t)&v83, &qword_255106898);
    swift_bridgeObjectRetain();
    v48 = (void *)sub_21A9B1718();
    swift_bridgeObjectRelease();
    v49 = 0;
    if (v47 >> 60 != 15)
    {
      v49 = (void *)sub_21A9B1634();
      sub_21A9B138C(v45, v47);
    }
    v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F48]), sel_initWithText_colorData_, v48, v49);

    sub_21A9B130C(v73, v71, v69);
  }
  else
  {
    v67 = 0;
  }
  objc_allocWithZone(MEMORY[0x24BE63F40]);
  sub_21A9B1378(v82, v14);
  sub_21A9B1378(v81, v80);
  sub_21A9B1378(v78, v79);
  v70 = v38;
  v61 = v68;
  v65 = v63;
  sub_21A9B1378(v75, v77);
  v72 = v67;
  v50 = sub_21A9AF71C(v82, v14, v81, v80, v78, v79, v68, v63, v38, v75, v77, v67);
  v51 = (void *)objc_opt_self();
  *(_QWORD *)&v83 = 0;
  v52 = objc_msgSend(v51, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v50, 1, &v83);
  v53 = (id)v83;
  if (v52)
  {
    sub_21A9B1640();
    v55 = v54;

    __asm { BR              X9 }
  }
  v56 = v53;
  v57 = (void *)sub_21A9B1628();

  swift_willThrow();
  v58 = v57;
  v59 = (void *)sub_21A9B161C();
  (*(void (**)(uint64_t, _QWORD, void *))(a2 + 16))(a2, 0, v59);

  sub_21A9B138C(v81, v80);
  sub_21A9B138C(v82, v14);
  sub_21A9B138C(v78, v79);
  sub_21A9B138C(v75, v77);

}

void sub_21A9B05CC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  const void *v22;
  void *v23;
  _BYTE *v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  _OWORD v35[8];
  uint64_t v36;
  _OWORD v37[8];
  uint64_t v38;

  v31 = a5;
  v32 = a6;
  v28 = a4;
  v29 = a1;
  v30 = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551068D0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21A9B167C();
  v33 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551068D8);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = a8;
  _Block_copy(a8);
  v20 = sub_21A9AE7F0();
  if (v20)
  {
    v21 = v20;
    sub_21A9B1204(a3, v28);
    sub_21A9B16A0();
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v12, v19, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v12, 0, 1, v16);
    v28 = v16;
    v22 = v34;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21A9B1670();
    (*(void (**)(_OWORD *__return_ptr, char *))((*MEMORY[0x24BEE4EA0] & *v21) + 0x50))(v37, v15);
    v35[6] = v37[6];
    v35[7] = v37[7];
    v36 = v38;
    v35[2] = v37[2];
    v35[3] = v37[3];
    v35[4] = v37[4];
    v35[5] = v37[5];
    v35[0] = v37[0];
    v35[1] = v37[1];
    _Block_copy(v22);
    sub_21A9AFC04((uint64_t *)v35, (uint64_t)v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v13);
    (*(void (**)(char *, unint64_t))(v17 + 8))(v19, v28);
    sub_21A9B1248((uint64_t)v37);
    _Block_release(v22);
  }
  else
  {
    sub_21A9B11C0();
    v23 = (void *)swift_allocError();
    *v24 = 0;
    v25 = (void *)sub_21A9B161C();
    v26 = v34;
    (*((void (**)(const void *, _QWORD, void *))v34 + 2))(v34, 0, v25);

    _Block_release(v26);
  }
}

void sub_21A9B0898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BYTE *v32;
  void *v33;
  const void *v34;
  _QWORD v35[5];
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  _OWORD v45[8];
  uint64_t v46;
  _OWORD v47[8];
  uint64_t v48;

  v40 = a7;
  v41 = a8;
  v36 = a5;
  v37 = a6;
  v35[3] = a3;
  v35[4] = a4;
  v35[1] = a1;
  v35[2] = a2;
  v10 = sub_21A9B1694();
  v43 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106888);
  v13 = *(_QWORD *)(v42 - 8);
  v14 = MEMORY[0x24BDAC7A8](v42);
  v16 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v35 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551068D0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_21A9B167C();
  v38 = *(_QWORD *)(v22 - 8);
  v39 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a10;
  _Block_copy(a10);
  v25 = sub_21A9AE7F0();
  if (v25)
  {
    v26 = v25;
    v35[0] = v10;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551068D8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v21, 1, 1, v27);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21A9B1670();
    v28 = v44;
    sub_21A9B1204(v36, v37);
    v29 = v35[0];
    sub_21A9B16A0();
    v30 = v42;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v42);
    v37 = v13;
    swift_bridgeObjectRetain();
    sub_21A9B1688();
    (*(void (**)(_OWORD *__return_ptr, char *, char *))((*MEMORY[0x24BEE4EA0] & *v26) + 0x58))(v47, v24, v12);
    v45[6] = v47[6];
    v45[7] = v47[7];
    v46 = v48;
    v45[2] = v47[2];
    v45[3] = v47[3];
    v45[4] = v47[4];
    v45[5] = v47[5];
    v45[0] = v47[0];
    v45[1] = v47[1];
    _Block_copy(v28);
    sub_21A9AFC04((uint64_t *)v45, (uint64_t)v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v29);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v30);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v39);
    sub_21A9B1248((uint64_t)v47);
    _Block_release(v28);
  }
  else
  {
    sub_21A9B11C0();
    v31 = (void *)swift_allocError();
    *v32 = 0;
    v33 = (void *)sub_21A9B161C();
    v34 = v44;
    (*((void (**)(const void *, _QWORD, void *))v44 + 2))(v44, 0, v33);

    _Block_release(v34);
  }
}

void sub_21A9B0C0C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, void (**a6)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  _QWORD v25[2];
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[8];
  uint64_t v33;
  _OWORD v34[8];
  uint64_t v35;

  v28 = a3;
  v29 = a4;
  v8 = sub_21A9B16C4();
  v31 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551068C8);
  v11 = *(_QWORD *)(v30 - 8);
  v12 = MEMORY[0x24BDAC7A8](v30);
  v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v25 - v15;
  _Block_copy(a6);
  v17 = sub_21A9AE7F0();
  if (v17)
  {
    v18 = v17;
    v26 = a6;
    v27 = v8;
    v25[0] = v11;
    v25[1] = a1;
    sub_21A9B1204(v28, v29);
    sub_21A9B16A0();
    v19 = v25[0];
    v20 = v30;
    (*(void (**)(char *, char *, uint64_t))(v25[0] + 16))(v14, v16, v30);
    swift_bridgeObjectRetain();
    sub_21A9B16AC();
    (*(void (**)(_OWORD *__return_ptr, char *))((*MEMORY[0x24BEE4EA0] & *v18) + 0x60))(v34, v10);
    v32[6] = v34[6];
    v32[7] = v34[7];
    v33 = v35;
    v32[2] = v34[2];
    v32[3] = v34[3];
    v32[4] = v34[4];
    v32[5] = v34[5];
    v32[0] = v34[0];
    v32[1] = v34[1];
    v21 = v26;
    _Block_copy(v26);
    sub_21A9AFC04((uint64_t *)v32, (uint64_t)v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v27);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v20);
    sub_21A9B1248((uint64_t)v34);
    _Block_release(v21);
  }
  else
  {
    sub_21A9B11C0();
    v22 = (void *)swift_allocError();
    *v23 = 0;
    v24 = (void *)sub_21A9B161C();
    ((void (**)(_QWORD, _QWORD, void *))a6)[2](a6, 0, v24);

    _Block_release(a6);
  }
}

void sub_21A9B0E88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  void *v25;
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  char *v29;
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
  _OWORD v40[8];
  uint64_t v41;
  _OWORD v42[8];
  uint64_t v43;

  v33 = a5;
  v34 = a6;
  v31 = a1;
  v32 = a3;
  v10 = sub_21A9B1694();
  v38 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106888);
  v39 = *(_QWORD *)(v37 - 8);
  v13 = MEMORY[0x24BDAC7A8](v37);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  v18 = sub_21A9B16C4();
  v35 = *(_QWORD *)(v18 - 8);
  v36 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a8);
  v21 = sub_21A9AE7F0();
  if (v21)
  {
    v22 = v21;
    v29 = v12;
    v30 = v10;
    swift_bridgeObjectRetain();
    sub_21A9B16B8();
    sub_21A9B1204(v32, a4);
    sub_21A9B16A0();
    v23 = v37;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v15, v17, v37);
    swift_bridgeObjectRetain();
    v24 = v29;
    sub_21A9B1688();
    (*(void (**)(_OWORD *__return_ptr, char *, char *))((*MEMORY[0x24BEE4EA0] & *v22) + 0x68))(v42, v20, v24);
    v40[6] = v42[6];
    v40[7] = v42[7];
    v41 = v43;
    v40[2] = v42[2];
    v40[3] = v42[3];
    v40[4] = v42[4];
    v40[5] = v42[5];
    v40[0] = v42[0];
    v40[1] = v42[1];
    _Block_copy(a8);
    sub_21A9AFC04((uint64_t *)v40, (uint64_t)a8);
    _Block_release(a8);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v30);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v23);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v20, v36);
    sub_21A9B1248((uint64_t)v42);
  }
  else
  {
    sub_21A9B11C0();
    v25 = (void *)swift_allocError();
    *v26 = 0;
    v27 = (void *)sub_21A9B161C();
    ((void (**)(_QWORD, _QWORD, void *))a8)[2](a8, 0, v27);

  }
  _Block_release(a8);
}

uint64_t sub_21A9B117C(uint64_t a1, unint64_t a2)
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

unint64_t sub_21A9B11C0()
{
  unint64_t result;

  result = qword_255106890;
  if (!qword_255106890)
  {
    result = MEMORY[0x22074DA40](&unk_21A9B1E1C, &type metadata for ShieldConfigurationExtensionContext.ExtensionError);
    atomic_store(result, (unint64_t *)&qword_255106890);
  }
  return result;
}

uint64_t sub_21A9B1204(uint64_t a1, unint64_t a2)
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

uint64_t sub_21A9B1248(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(void **)(a1 + 96);
  v12 = *(_QWORD *)(a1 + 80);
  v13 = *(void **)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 120);
  v16 = *(_QWORD *)(a1 + 112);
  v14 = *(void **)(a1 + 128);

  sub_21A9B130C(v3, v4, v5);
  sub_21A9B130C(v6, v7, v8);
  sub_21A9B130C(v12, v9, v10);

  sub_21A9B130C(v16, v15, v14);
  return a1;
}

void sub_21A9B130C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_21A9B133C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21A9B1378(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21A9B1204(a1, a2);
  return a1;
}

uint64_t sub_21A9B138C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21A9B117C(a1, a2);
  return a1;
}

uint64_t sub_21A9B13A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21A9B13D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_21A9B141C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShieldConfigurationExtensionContext.ExtensionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ShieldConfigurationExtensionContext.ExtensionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A9B153C + 4 * byte_21A9B1D75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21A9B1570 + 4 * byte_21A9B1D70[v4]))();
}

uint64_t sub_21A9B1570(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A9B1578(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A9B1580);
  return result;
}

uint64_t sub_21A9B158C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A9B1594);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21A9B1598(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A9B15A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A9B15AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21A9B15B8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfigurationExtensionContext.ExtensionError()
{
  return &type metadata for ShieldConfigurationExtensionContext.ExtensionError;
}

unint64_t sub_21A9B15D8()
{
  unint64_t result;

  result = qword_2551068E0;
  if (!qword_2551068E0)
  {
    result = MEMORY[0x22074DA40](&unk_21A9B1DF4, &type metadata for ShieldConfigurationExtensionContext.ExtensionError);
    atomic_store(result, (unint64_t *)&qword_2551068E0);
  }
  return result;
}

uint64_t sub_21A9B161C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21A9B1628()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21A9B1634()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21A9B1640()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21A9B164C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21A9B1658()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_21A9B1664()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21A9B1670()
{
  return MEMORY[0x24BDDAE40]();
}

uint64_t sub_21A9B167C()
{
  return MEMORY[0x24BDDAE58]();
}

uint64_t sub_21A9B1688()
{
  return MEMORY[0x24BDDAE80]();
}

uint64_t sub_21A9B1694()
{
  return MEMORY[0x24BDDAE90]();
}

uint64_t sub_21A9B16A0()
{
  return MEMORY[0x24BDDAEB8]();
}

uint64_t sub_21A9B16AC()
{
  return MEMORY[0x24BDDAED8]();
}

uint64_t sub_21A9B16B8()
{
  return MEMORY[0x24BDDAEE0]();
}

uint64_t sub_21A9B16C4()
{
  return MEMORY[0x24BDDAEF0]();
}

uint64_t sub_21A9B16D0()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_21A9B16DC()
{
  return MEMORY[0x24BEE6278]();
}

uint64_t sub_21A9B16E8()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_21A9B16F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21A9B1700()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21A9B170C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21A9B1718()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21A9B1724()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21A9B1730()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21A9B173C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21A9B1748()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21A9B1754()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21A9B1760()
{
  return MEMORY[0x24BDCFDE8]();
}

uint64_t sub_21A9B176C()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_21A9B1778()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21A9B1784()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21A9B1790()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21A9B179C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21A9B17A8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21A9B17B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21A9B17C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21A9B17CC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21A9B17D8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21A9B17E4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21A9B17F0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21A9B17FC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21A9B1808()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21A9B1814()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A9B1820()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A9B182C()
{
  return MEMORY[0x24BEE4328]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


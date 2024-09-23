uint64_t getEnumTagSinglePayload for EnergyWindows()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EAEBB14(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for EnergyWindows(uint64_t a1)
{
  return sub_23EAEBB14(a1, (uint64_t *)&unk_25433E898);
}

ValueMetadata *type metadata accessor for EnergyWindowRating()
{
  return &type metadata for EnergyWindowRating;
}

uint64_t storeEnumTagSinglePayload for EnergyWindows()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

ValueMetadata *type metadata accessor for EnergyWindow()
{
  return &type metadata for EnergyWindow;
}

void sub_23EAEBB88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25433E900)
  {
    sub_23EB1A954();
    v0 = sub_23EB1AF0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25433E900);
  }
}

uint64_t sub_23EAEBBDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23EB1ABAC();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_23EB1ABA0();
}

uint64_t sub_23EAEBC60(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23EB1AE64();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23EAEC0A0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23EAEBCF4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_23EB1B158();
    sub_23EB1AC90();
    v6 = sub_23EB1B170();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23EB1B0F8() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23EB1B0F8() & 1) != 0)
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

BOOL sub_23EAEBE28()
{
  __CFString *v0;
  __CFString *v1;
  CFPropertyListRef v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v0 = (__CFString *)sub_23EB1ACCC();
  v1 = (__CFString *)sub_23EB1ACCC();
  v2 = CFPreferencesCopyAppValue(v0, v1);

  if (!v2 || (swift_dynamicCast() & 1) == 0)
    return 1;
  v4 = v12;
  v3 = v13;
  if (qword_25433E6F0 != -1)
    swift_once();
  v5 = sub_23EB1ABAC();
  __swift_project_value_buffer(v5, (uint64_t)qword_25433F2D0);
  swift_bridgeObjectRetain_n();
  v6 = sub_23EB1AB94();
  v7 = sub_23EB1AEB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_23EB152C0(v4, v3, &v12);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v6, v7, "Environment override detected. Using user set env value : %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v9, -1, -1);
    MEMORY[0x242657DAC](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = v4;
  v13 = v3;
  sub_23EAF09E8();
  v11 = sub_23EB1AF3C();
  swift_bridgeObjectRelease();
  return v11 == 0;
}

uint64_t sub_23EAEC0A0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23EB1B158();
  swift_bridgeObjectRetain();
  sub_23EB1AC90();
  v8 = sub_23EB1B170();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23EB1B0F8() & 1) != 0)
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
      if (v19 || (sub_23EB1B0F8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23EAECBC4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_23EAEC24C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3B0);
  v2 = sub_23EB1B074();
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
    sub_23EAEC390(v6, (uint64_t)&v15, &qword_25433E360);
    v7 = v15;
    v8 = v16;
    result = sub_23EAEC44C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23EAEC380(&v17, (_OWORD *)(v3[7] + 32 * result));
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

_OWORD *sub_23EAEC380(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23EAEC390(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EAEC3D4(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  _BYTE v10[72];

  sub_23EB1B158();
  a3(v10, a1, a2);
  v7 = sub_23EB1B170();
  return a4(a1, a2, v7);
}

uint64_t sub_23EAEC44C(uint64_t a1, uint64_t a2)
{
  return sub_23EAEC3D4(a1, a2, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460);
}

unint64_t sub_23EAEC460(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23EB1B0F8() & 1) == 0)
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
      while (!v14 && (sub_23EB1B0F8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23EAEC540(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23EAEC57C()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23EB1B740;
  *(_QWORD *)(inited + 32) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 40) = 0x800000023EB1DF50;
  *(_QWORD *)(inited + 48) = 3600;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 80) = 0xD000000000000010;
  *(_QWORD *)(inited + 88) = 0x800000023EB1DF30;
  *(_QWORD *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
  *(_QWORD *)(inited + 96) = &unk_250F419D8;
  result = sub_23EAEC24C(inited);
  qword_25433F290 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242657CF8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_23EAEC6D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  __CFString *v6;
  __CFString *v7;
  CFPropertyListRef v8;
  _OWORD v10[2];

  if (sub_23EAEBE28())
    sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  v6 = (__CFString *)sub_23EB1ACCC();
  v7 = (__CFString *)sub_23EB1ACCC();
  v8 = CFPreferencesCopyAppValue(v6, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRetain();
  sub_23EAECE80(0x6553796772656E65, 0xEE00736563697672, (uint64_t)v8, v10);
  swift_unknownObjectRelease();
  sub_23EAECD5C(a1, a2, a3);
  swift_unknownObjectRelease();
  return sub_23EAEC540((uint64_t)v10, &qword_25433E780);
}

uint64_t sub_23EAEC850()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  sub_23EAEC6D0(0x72756769666E6F63, 0xED00006E6F697461, &v17);
  if (!*((_QWORD *)&v18 + 1))
    goto LABEL_14;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_15;
  if (*(_QWORD *)(v16 + 16) && (v0 = sub_23EAEC44C(0xD000000000000010, 0x800000023EB1DF30), (v1 & 1) != 0))
  {
    sub_23EAECB88(*(_QWORD *)(v16 + 56) + 32 * v0, (uint64_t)&v17);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v18 + 1))
  {
LABEL_14:
    sub_23EAEC540((uint64_t)&v17, &qword_25433E780);
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = v16;
    if (qword_25433E798 != -1)
      swift_once();
    v3 = sub_23EB1ABAC();
    __swift_project_value_buffer(v3, (uint64_t)qword_25433F320);
    v4 = sub_23EB1AB94();
    v5 = sub_23EB1AEB8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23EAEA000, v4, v5, "Returning regions from server config", v6, 2u);
      MEMORY[0x242657DAC](v6, -1, -1);
    }

    goto LABEL_26;
  }
LABEL_15:
  if (qword_25433E798 != -1)
    swift_once();
  v7 = sub_23EB1ABAC();
  __swift_project_value_buffer(v7, (uint64_t)qword_25433F320);
  v8 = sub_23EB1AB94();
  v9 = sub_23EB1AEA0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23EAEA000, v8, v9, "    Returning regions from default config.\n    Ensure this invocation is from a client that needs this value during installation.", v10, 2u);
    MEMORY[0x242657DAC](v10, -1, -1);
  }

  if (qword_25433E1E8 != -1)
    swift_once();
  v11 = qword_25433F290;
  if (*(_QWORD *)(qword_25433F290 + 16)
    && (v12 = sub_23EAEC44C(0xD000000000000010, 0x800000023EB1DF30), (v13 & 1) != 0)
    && (sub_23EAECB88(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v17),
        __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810),
        swift_dynamicCast()))
  {
    v2 = v16;
  }
  else
  {
    v2 = MEMORY[0x24BEE4AF8];
  }
LABEL_26:
  v14 = sub_23EAEBC60(v2);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_23EAECB88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23EAECBC4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23EB0BDFC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23EB0C0D8();
      goto LABEL_22;
    }
    sub_23EB0C288();
  }
  v11 = *v4;
  sub_23EB1B158();
  sub_23EB1AC90();
  result = sub_23EB1B170();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23EB1B0F8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23EB1B104();
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
          result = sub_23EB1B0F8();
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

uint64_t sub_23EAECD5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  sub_23EAEC390(v3, (uint64_t)&v11, &qword_25433E780);
  if (!*((_QWORD *)&v12 + 1))
  {
    result = sub_23EAEC540((uint64_t)&v11, &qword_25433E780);
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_7:
    *a3 = 0u;
    a3[1] = 0u;
    return result;
  }
  if (*(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_23EAEC44C(a1, a2);
    if ((v9 & 1) != 0)
    {
      sub_23EAECB88(*(_QWORD *)(v10 + 56) + 32 * v8, (uint64_t)&v11);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23EB0B5FC((uint64_t)&v11, (uint64_t)a3);
  return sub_23EAEC540((uint64_t)&v11, &qword_25433E780);
}

uint64_t sub_23EAECE80@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)&v9 = a3;
  if (a3
    && (v6 = result,
        swift_unknownObjectRetain(),
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770),
        result = swift_dynamicCast(),
        (_DWORD)result))
  {
    if (*(_QWORD *)(v11 + 16))
    {
      swift_bridgeObjectRetain();
      v7 = sub_23EAEC44C(v6, a2);
      if ((v8 & 1) != 0)
      {
        sub_23EAECB88(*(_QWORD *)(v11 + 56) + 32 * v7, (uint64_t)&v9);
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_23EB0B5FC((uint64_t)&v9, (uint64_t)a4);
    return sub_23EAEC540((uint64_t)&v9, &qword_25433E780);
  }
  else
  {
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_23EAECF88(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_25433F320);
}

void sub_23EAECFB0()
{
  unint64_t v0;

  sub_23EAEBB88();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t static EnergyServices.isSupportedInRegion(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23EAEC850();
  LOBYTE(a2) = sub_23EAEBCF4(a1, a2, v4);
  swift_bridgeObjectRelease();
  return a2 & 1;
}

ValueMetadata *type metadata accessor for MockGridDataGenerator()
{
  return &type metadata for MockGridDataGenerator;
}

void sub_23EAED094(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_23EAED0A0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23EAED0A8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_23EAED0BC(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23EAED0EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23EAED100(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23EAED114@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t static MockErrorURLResponder.respond(to:)()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  sub_23EB1AA68();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_23EB1AA80();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCF610];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1AA38();
  sub_23EAED7E8(MEMORY[0x24BEE4AF8]);
  sub_23EAEF3B0(&qword_256DAE660, v1, MEMORY[0x24BDCF608]);
  sub_23EB1A78C();
  sub_23EB1AA74();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return swift_willThrow();
}

uint64_t sub_23EAED238()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  sub_23EB1AA68();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_23EB1AA80();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCF610];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1AA38();
  sub_23EAED7E8(MEMORY[0x24BEE4AF8]);
  sub_23EAEF3B0(&qword_256DAE660, v1, MEMORY[0x24BDCF608]);
  sub_23EB1A78C();
  sub_23EB1AA74();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return swift_willThrow();
}

uint64_t static MockEnergyWindowResponder.respond(to:)()
{
  return sub_23EAEE48C();
}

uint64_t sub_23EAED360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t);
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE668);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23EB1AA20();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23EB1A8D0();
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23EB1A8B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23EB1A8A0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A8AC();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, _QWORD))(v16 + 104))((char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDCE368]);
  v17 = v11;
  v18 = v25;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCE348], v17);
  v19 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 104);
  v20 = v27;
  v19(v10, *MEMORY[0x24BDCE388], v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCE3D0], v26);
  sub_23EB1AA08();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v2, 1, v20);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v2, v20);
    return sub_23EB1A8C4();
  }
  return result;
}

uint64_t static MockEnergyIntervalDataGenerator.windowRatings(grid:fromDate:endDate:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;

  v4 = sub_23EAEDAB8(a1, a2);
  if (v4)
  {
    v5 = v4;
    v6 = (int *)type metadata accessor for EnergyWindows(0);
    v7 = (char *)a3 + v6[5];
    v8 = sub_23EB1A954();
    v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
    v9(v7, 1, 1, v8);
    v9((char *)a3 + v6[6], 1, 1, v8);
    *a3 = v5;
    v10 = (uint64_t *)((char *)a3 + v6[7]);
    *v10 = 0;
    v10[1] = 0;
    v11 = (uint64_t *)((char *)a3 + v6[8]);
    *v11 = 0;
    v11[1] = 0;
    *(uint64_t *)((char *)a3 + v6[9]) = 0;
    v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*((_QWORD *)v6 - 1) + 56);
    v13 = a3;
    v14 = 0;
    v15 = (uint64_t)v6;
  }
  else
  {
    if (qword_25433E6E0 != -1)
      swift_once();
    v16 = sub_23EB1ABAC();
    __swift_project_value_buffer(v16, (uint64_t)qword_25433F2B8);
    v17 = sub_23EB1AB94();
    v18 = sub_23EB1AEA0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23EAEA000, v17, v18, "Unable to generate Mock Energy Intervals", v19, 2u);
      MEMORY[0x242657DAC](v19, -1, -1);
    }

    v15 = type metadata accessor for EnergyWindows(0);
    v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
    v13 = a3;
    v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_23EAED774()
{
  return sub_23EAEE48C();
}

uint64_t static MockEnergyWindowFixedDateResponder.respond(to:)()
{
  return sub_23EAEE48C();
}

void static MockEnergyWindowFixedDateResponder.urlResponse(to:)()
{
  sub_23EAEECF8();
}

void sub_23EAED7B0()
{
  sub_23EAEECF8();
}

void sub_23EAED7C4()
{
  qword_256DAEE90 = (uint64_t)&unk_250F41780;
}

uint64_t sub_23EAED7D8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_23EAED7E8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3B0);
  v2 = sub_23EB1B074();
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
    sub_23EAEF3F0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23EAED910(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23EAEC380(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23EAED910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23EB1B158();
  sub_23EB1AC90();
  v4 = sub_23EB1B170();
  return sub_23EAED974(a1, a2, v4);
}

unint64_t sub_23EAED974(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if ((*v10 != a1 || v10[1] != a2) && (sub_23EB1B0F8() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_23EB1B0F8() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_23EB1B0F8() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_23EAEDAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t result;
  unsigned int v23;
  unint64_t v24;
  double v25;
  id v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(unint64_t, _QWORD, uint64_t);
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int v68;
  char v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  __int128 v93;
  unsigned int v94;
  unsigned int v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  _QWORD *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  _QWORD v112[2];

  v106 = sub_23EB1A9F0();
  v99 = *(_QWORD *)(v106 - 8);
  MEMORY[0x24BDAC7A8](v106);
  v105 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EB1A744();
  v97 = *(_QWORD *)(v5 - 8);
  v98 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v8);
  v96 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23EB1A954();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v12 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v101 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v100 = (char *)&v91 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v92 = (char *)&v91 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v91 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v91 - v19, a1, v10);
  v107 = sub_23EAEF3B0(&qword_256DAE690, v11, MEMORY[0x24BDCE948]);
  v108 = a2;
  v111 = v20;
  if ((sub_23EB1ACB4() & 1) != 0)
  {
    v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_3:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v111, v10);
    return (uint64_t)v21;
  }
  v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v23 = *MEMORY[0x24BDCF258];
  v94 = *MEMORY[0x24BDCF260];
  v95 = v23;
  v93 = xmmword_23EB1B740;
  v109 = v10;
  v110 = v12;
  v102 = v7;
  while (!v21[2])
  {
    v26 = objc_msgSend((id)objc_opt_self(), sel_currentCalendar);
    v27 = v105;
    sub_23EB1A9B4();

    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE698);
    v28 = sub_23EB1A9E4();
    v29 = *(_QWORD *)(v28 - 8);
    v30 = *(_QWORD *)(v29 + 72);
    v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = v93;
    v33 = v32 + v31;
    v34 = *(void (**)(unint64_t, _QWORD, uint64_t))(v29 + 104);
    v34(v33, v95, v28);
    v34(v33 + v30, v94, v28);
    sub_23EAFDE44(v32);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_23EB1A99C();
    swift_bridgeObjectRelease();
    v35 = *(void (**)(char *, uint64_t))(v99 + 8);
    v35(v27, v106);
    v36 = sub_23EB1A714();
    if ((v37 & 1) != 0)
      v38 = 0;
    else
      v38 = v36;
    result = 59 - v38;
    if (__OFSUB__(59, v38))
      goto LABEL_67;
    sub_23EB1A720();
    v39 = sub_23EB1A72C();
    if ((v40 & 1) != 0)
      v41 = 0;
    else
      v41 = v39;
    result = 60 - v41;
    if (__OFSUB__(60, v41))
      goto LABEL_68;
    sub_23EB1A738();
    v42 = v105;
    sub_23EB1A9D8();
    v43 = (uint64_t)v96;
    sub_23EB1A9CC();
    v44 = v42;
    v45 = v43;
    v35(v44, v106);
    (*(void (**)(char *, uint64_t))(v97 + 8))(v7, v98);
    v10 = v109;
    v12 = v110;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 48))(v43, 1, v109) == 1)
    {
      sub_23EAEC540(v43, (uint64_t *)&unk_25433E788);
      v25 = 0.0;
    }
    else
    {
      v46 = v92;
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v92, v45, v10);
      sub_23EB1A87C();
      v48 = v47;
      sub_23EB1A87C();
      v50 = v49;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v46, v10);
      v25 = v48 - v50;
    }
LABEL_22:
    if (qword_256DAE510 != -1)
      swift_once();
    v51 = qword_256DAEE90;
    v52 = *(_QWORD *)(qword_256DAEE90 + 16);
    if (!v52)
      goto LABEL_6;
    v112[0] = 0;
    swift_bridgeObjectRetain();
    result = MEMORY[0x242657DB8](v112, 8);
    v53 = (v112[0] * (unsigned __int128)v52) >> 64;
    if (v52 > v112[0] * v52)
    {
      v54 = -(uint64_t)v52 % v52;
      if (v54 > v112[0] * v52)
      {
        do
        {
          v112[0] = 0;
          result = MEMORY[0x242657DB8](v112, 8);
        }
        while (v54 > v112[0] * v52);
        v53 = (v112[0] * (unsigned __int128)v52) >> 64;
      }
    }
    if (v53 >= *(_QWORD *)(v51 + 16))
      goto LABEL_66;
    v55 = *(unsigned __int8 *)(v51 + v53 + 32);
    swift_bridgeObjectRelease();
    v56 = qword_256DAEE90;
    v57 = *(_QWORD *)(qword_256DAEE90 + 16);
    if (v57)
    {
      swift_bridgeObjectRetain();
      v58 = 0;
      v59 = MEMORY[0x24BEE4AF8];
      do
      {
        v60 = *(_BYTE *)(v56 + v58 + 32);
        if (v60)
        {
          v61 = sub_23EB1B0F8();
          swift_bridgeObjectRelease();
          if ((v61 & 1) == 0)
          {
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v112[0] = v59;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_23EB0FDC8(0, *(_QWORD *)(v59 + 16) + 1, 1);
              v59 = v112[0];
            }
            v64 = *(_QWORD *)(v59 + 16);
            v63 = *(_QWORD *)(v59 + 24);
            if (v64 >= v63 >> 1)
            {
              sub_23EB0FDC8(v63 > 1, v64 + 1, 1);
              v59 = v112[0];
            }
            *(_QWORD *)(v59 + 16) = v64 + 1;
            *(_BYTE *)(v59 + v64 + 32) = v60;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        ++v58;
      }
      while (v57 != v58);
      swift_bridgeObjectRelease();
      v12 = v110;
    }
    else
    {
      v59 = MEMORY[0x24BEE4AF8];
    }
    v65 = *(_QWORD *)(v59 + 16);
    v10 = v109;
    if (v65)
    {
      v112[0] = 0;
      result = MEMORY[0x242657DB8](v112, 8);
      v66 = (v112[0] * (unsigned __int128)v65) >> 64;
      if (v65 > v112[0] * v65)
      {
        v67 = -(uint64_t)v65 % v65;
        if (v67 > v112[0] * v65)
        {
          do
          {
            v112[0] = 0;
            result = MEMORY[0x242657DB8](v112, 8);
          }
          while (v67 > v112[0] * v65);
          v66 = (v112[0] * (unsigned __int128)v65) >> 64;
        }
      }
      if (v66 >= *(_QWORD *)(v59 + 16))
        goto LABEL_69;
      v68 = *(unsigned __int8 *)(v59 + v66 + 32);
      swift_release();
      v103 = v21;
      if (v55)
      {
        v69 = sub_23EB1B0F8();
        swift_bridgeObjectRelease();
        if ((v69 & 1) == 0)
        {
LABEL_55:
          v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
          objc_msgSend(v70, sel_setFormatOptions_, 1907);
          v71 = (void *)sub_23EB1A8F4();
          v72 = objc_msgSend(v70, sel_stringFromDate_, v71);

          v73 = sub_23EB1ACD8();
          v104 = v74;

          v75 = v100;
          sub_23EB1A8E8();
          v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
          objc_msgSend(v76, sel_setFormatOptions_, 1907);
          v77 = (void *)sub_23EB1A8F4();
          v78 = objc_msgSend(v76, sel_stringFromDate_, v77);

          v79 = sub_23EB1ACD8();
          v81 = v80;

          v82 = *(void (**)(char *, uint64_t))(v110 + 8);
          v82(v75, v10);
          if (v68)
          {
            if (v68 == 1)
            {
              v83 = 0xE400000000000000;
              v84 = 1146048327;
            }
            else
            {
              v83 = 0xE500000000000000;
              v84 = 0x5453524F57;
            }
          }
          else
          {
            v83 = 0xE400000000000000;
            v84 = 1414743362;
          }
          v21 = v103;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v21 = sub_23EB07A1C(0, v21[2] + 1, 1, v21);
          v86 = v21[2];
          v85 = v21[3];
          if (v86 >= v85 >> 1)
            v21 = sub_23EB07A1C((_QWORD *)(v85 > 1), v86 + 1, 1, v21);
          v21[2] = v86 + 1;
          v87 = &v21[6 * v86];
          v87[4] = v84;
          v87[5] = v83;
          v88 = v104;
          v87[6] = v73;
          v87[7] = v88;
          v87[8] = v79;
          v87[9] = v81;
          v89 = v101;
          v90 = v111;
          sub_23EB1A8E8();
          v10 = v109;
          v82(v90, v109);
          v12 = v110;
          (*(void (**)(char *, char *, uint64_t))(v110 + 32))(v90, v89, v10);
          v7 = v102;
          goto LABEL_6;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (v25 <= 3600.0)
        v68 = v55;
      goto LABEL_55;
    }
    swift_release();
    v7 = v102;
LABEL_6:
    if ((sub_23EB1ACB4() & 1) != 0)
      goto LABEL_3;
  }
  do
  {
    v112[0] = 0;
    result = MEMORY[0x242657DB8](v112, 8);
  }
  while (!(3 * v112[0]));
  v24 = (v112[0] * (unsigned __int128)3uLL) >> 64;
  if (v24 < 3)
  {
    v25 = *((double *)&unk_250F417A8 + v24 + 4);
    goto LABEL_22;
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t sub_23EAEE48C()
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void *v35;
  id v36;
  void (*v37)(uint64_t *, char *, uint64_t);
  uint64_t *v38;
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v40)(uint64_t *, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  char *v46;
  int v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t (*v64)(char *, uint64_t, uint64_t);
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  char *v66;
  char *v67;
  void (*v68)(uint64_t, _QWORD *);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t *v76;
  uint64_t v77;
  char *v78;
  uint64_t *v79;
  uint64_t *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t);
  char *v85;
  char *v86;
  uint64_t v87;

  v0 = sub_23EB1AA68();
  MEMORY[0x24BDAC7A8](v0);
  v86 = (char *)&v64 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_23EB1AA80();
  v87 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v85 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE680);
  MEMORY[0x24BDAC7A8](v4);
  v76 = (uint64_t *)((char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v77 = type metadata accessor for EnergyWindows(0);
  v74 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v78 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v80 = (uint64_t *)((char *)&v64 - v11);
  v84 = (void (*)(uint64_t, uint64_t))sub_23EB1A8DC();
  v12 = *((_QWORD *)v84 - 1);
  MEMORY[0x24BDAC7A8](v84);
  v83 = (uint64_t)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_23EB1A954();
  v14 = *(_QWORD *)(v82 - 8);
  v15 = MEMORY[0x24BDAC7A8](v82);
  v75 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v81 = (char *)&v64 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v79 = (uint64_t *)((char *)&v64 - v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23EB1A810();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A564();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_23EAEC540((uint64_t)v22, &qword_25433E7A0);
LABEL_17:
    v55 = v87;
    v56 = v85;
    sub_23EB1AA50();
    sub_23EAED7E8(MEMORY[0x24BEE4AF8]);
    sub_23EAEF3B0(&qword_256DAE660, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF610], MEMORY[0x24BDCF608]);
    sub_23EB1A78C();
    sub_23EB1AA74();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v2);
    swift_willThrow();
    return v55;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v22, v23);
  sub_23EAFE570(0x644964697267, 0xE600000000000000);
  v28 = v24;
  v29 = v26;
  if (!v27)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v23);
    goto LABEL_17;
  }
  v71 = v27;
  v72 = v28;
  v69 = v2;
  v70 = v23;
  v67 = v7;
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  v31 = v81;
  sub_23EB1A93C();
  v32 = v83;
  sub_23EAED360(v83);
  sub_23EB1A888();
  v68 = *(void (**)(uint64_t, _QWORD *))(v12 + 8);
  v68(v32, v84);
  v33 = *(void (**)(char *, uint64_t))(v14 + 8);
  v34 = v82;
  v33(v31, v82);
  v35 = (void *)sub_23EB1ACCC();
  swift_bridgeObjectRelease();
  v36 = objc_msgSend(v30, sel_dateFromString_, v35);

  if (!v36)
  {
    v38 = v80;
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v80, 1, 1, v34);
    goto LABEL_12;
  }
  sub_23EB1A930();

  v37 = *(void (**)(uint64_t *, char *, uint64_t))(v14 + 32);
  v38 = v80;
  v37(v80, v31, v34);
  v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v39((char *)v38, 0, 1, v34);
  v40 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48);
  if (v40(v38, 1, v34) == 1)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v29, v70);
    v53 = (uint64_t *)&unk_25433E788;
    goto LABEL_13;
  }
  v64 = (uint64_t (*)(char *, uint64_t, uint64_t))v40;
  v65 = v39;
  v66 = v29;
  v37(v79, (char *)v38, v34);
  v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  sub_23EB1A90C();
  v42 = v83;
  sub_23EAED360(v83);
  v43 = v34;
  sub_23EB1A888();
  v68(v42, v84);
  v84 = (void (*)(uint64_t, uint64_t))v33;
  v33(v31, v34);
  v44 = (void *)sub_23EB1ACCC();
  swift_bridgeObjectRelease();
  v45 = objc_msgSend(v41, sel_dateFromString_, v44);

  if (!v45)
  {
    v46 = v78;
    v65(v78, 1, 1, v43);
    v48 = v66;
    v49 = v72;
    goto LABEL_15;
  }
  sub_23EB1A930();

  v46 = v78;
  v37((uint64_t *)v78, v31, v43);
  v65(v46, 0, 1, v43);
  v47 = v64(v46, 1, v43);
  v48 = v66;
  v49 = v72;
  if (v47 == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    v84((uint64_t)v79, v43);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v70);
    v53 = (uint64_t *)&unk_25433E788;
    v54 = (uint64_t)v46;
    goto LABEL_16;
  }
  v50 = (uint64_t)v75;
  v37((uint64_t *)v75, v46, v43);
  v38 = v76;
  v51 = (uint64_t)v79;
  static MockEnergyIntervalDataGenerator.windowRatings(grid:fromDate:endDate:)((uint64_t)v79, v50, v76);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v74 + 48))(v38, 1, v77) == 1)
  {
    v52 = v84;
    v84(v50, v43);
    v52(v51, v43);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v66, v70);
    v53 = &qword_256DAE680;
LABEL_13:
    v54 = (uint64_t)v38;
LABEL_16:
    sub_23EAEC540(v54, v53);
    v2 = v69;
    goto LABEL_17;
  }
  v58 = (uint64_t)v67;
  sub_23EAEF330((uint64_t)v38, (uint64_t)v67);
  sub_23EB1A5DC();
  swift_allocObject();
  sub_23EB1A5D0();
  sub_23EAEF3B0(&qword_256DAE688, type metadata accessor for EnergyWindows, (uint64_t)&protocol conformance descriptor for EnergyWindows);
  v59 = v73;
  v60 = sub_23EB1A5C4();
  if (v59)
  {
    swift_release();
    sub_23EAEF374(v58);
    v55 = v82;
    v61 = v84;
    v84(v50, v82);
    v61(v51, v55);
  }
  else
  {
    v55 = v60;
    swift_release();
    sub_23EAEF374(v58);
    v62 = v82;
    v63 = v84;
    v84(v50, v82);
    v63(v51, v62);
  }
  (*(void (**)(char *, uint64_t))(v72 + 8))(v66, v70);
  return v55;
}

void sub_23EAEECF8()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t inited;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _BYTE *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  char *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE668);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_23EB1A954();
  v7 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v47 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23EB1A810();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A564();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23EAEC540((uint64_t)v11, &qword_25433E7A0);
LABEL_10:
    sub_23EAEF2B0();
    swift_allocError();
    *v39 = 1;
    swift_willThrow();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v16 = sub_23EAFE09C();
  objc_msgSend(v16, sel_copy);

  sub_23EB1AF60();
  swift_unknownObjectRelease();
  sub_23EAEF2F4();
  if ((swift_dynamicCast() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_10;
  }
  v42 = v0;
  v45 = v48;
  sub_23EB1A918();
  sub_23EB1A9FC();
  v17 = sub_23EB1AA20();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v6, 1, v17) != 1)
  {
    v19 = (void *)sub_23EB1AA14();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v17);
  }
  v20 = v45;
  objc_msgSend(v45, sel_setTimeZone_, v19);

  v21 = (void *)sub_23EB1A8F4();
  v22 = objc_msgSend(v20, sel_stringFromDate_, v21);

  v44 = sub_23EB1ACD8();
  v43 = v23;

  __swift_instantiateConcreteTypeFromMangledName(qword_25433E858);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_23EB1B750;
  sub_23EAFDB74((uint64_t)v3);
  v25 = v46;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v3, 1, v46) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_23EB1A924();
    v27 = v26;
    sub_23EB1A924();
    v29 = v27 - v28;
    v41 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41(v3, v25);
    v30 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v24 + 64) = v30;
    *(double *)(v24 + 32) = v29;
    sub_23EB1ACFC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E758);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23EB1B740;
    *(_QWORD *)(inited + 32) = 1702125892;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    v32 = v43;
    *(_QWORD *)(inited + 48) = v44;
    *(_QWORD *)(inited + 56) = v32;
    strcpy((char *)(inited + 64), "Cache-Control");
    *(_WORD *)(inited + 78) = -4864;
    v49 = 0x3D6567612D78616DLL;
    v50 = 0xE800000000000000;
    sub_23EB1AD74();
    swift_bridgeObjectRelease();
    v33 = v50;
    *(_QWORD *)(inited + 80) = v49;
    *(_QWORD *)(inited + 88) = v33;
    sub_23EB0AE18(inited);
    v34 = objc_allocWithZone(MEMORY[0x24BDD15B8]);
    v35 = (void *)sub_23EB1A7C8();
    v36 = (void *)sub_23EB1ACCC();
    v37 = (void *)sub_23EB1AC48();
    swift_bridgeObjectRelease();
    v38 = objc_msgSend(v34, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v35, 200, v36, v37);

    if (v38)
    {

      v41(v47, v46);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      return;
    }
  }
  __break(1u);
}

ValueMetadata *type metadata accessor for MockErrorURLResponder()
{
  return &type metadata for MockErrorURLResponder;
}

ValueMetadata *type metadata accessor for MockEnergyWindowResponder()
{
  return &type metadata for MockEnergyWindowResponder;
}

ValueMetadata *type metadata accessor for MockEnergyWindowFixedDateResponder()
{
  return &type metadata for MockEnergyWindowFixedDateResponder;
}

ValueMetadata *type metadata accessor for MockEnergyIntervalDataGenerator()
{
  return &type metadata for MockEnergyIntervalDataGenerator;
}

unint64_t sub_23EAEF2B0()
{
  unint64_t result;

  result = qword_256DAE670;
  if (!qword_256DAE670)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for MockNetworkError, &type metadata for MockNetworkError);
    atomic_store(result, (unint64_t *)&qword_256DAE670);
  }
  return result;
}

unint64_t sub_23EAEF2F4()
{
  unint64_t result;

  result = qword_256DAE678;
  if (!qword_256DAE678)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DAE678);
  }
  return result;
}

uint64_t sub_23EAEF330(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAEF374(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EAEF3B0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242657D10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23EAEF3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_23EAEF438(void *a1)
{
  return sub_23EAEF44C(a1);
}

id sub_23EAEF44C(id a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EB1A810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A564();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_23EAEF78C((uint64_t)v4);
LABEL_4:
    sub_23EAEF2B0();
    swift_allocError();
    *v12 = 1;
    swift_willThrow();
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v9 = objc_allocWithZone(MEMORY[0x24BDD15B8]);
  v10 = (void *)sub_23EB1A7C8();
  v11 = (void *)sub_23EB1ACCC();
  a1 = objc_msgSend(v9, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v10, 200, v11, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!a1)
    goto LABEL_4;
  return a1;
}

id static MockURLResponder.urlResponse(to:)(id a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EB1A810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A564();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_23EAEF78C((uint64_t)v4);
LABEL_4:
    sub_23EAEF2B0();
    swift_allocError();
    *v12 = 1;
    swift_willThrow();
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v9 = objc_allocWithZone(MEMORY[0x24BDD15B8]);
  v10 = (void *)sub_23EB1A7C8();
  v11 = (void *)sub_23EB1ACCC();
  a1 = objc_msgSend(v9, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v10, 200, v11, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!a1)
    goto LABEL_4;
  return a1;
}

uint64_t sub_23EAEF78C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static MockURLResponder.configResponse()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_23EB1AD14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1AD08();
  v4 = sub_23EB1ACE4();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
    return 0;
  else
    return v4;
}

uint64_t sub_23EAEF88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_23EB1AD14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1AD08();
  v4 = sub_23EB1ACE4();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
    return 0;
  else
    return v4;
}

uint64_t sub_23EAEF948()
{
  static MockURLResponder.respond(to:)();
  return 0;
}

uint64_t static MockURLResponder.respond(to:)()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_25433E6E0 != -1)
    swift_once();
  v0 = sub_23EB1ABAC();
  __swift_project_value_buffer(v0, (uint64_t)qword_25433F2B8);
  v1 = sub_23EB1AB94();
  v2 = sub_23EB1AEA0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23EAEA000, v1, v2, "MockURLResponder default empty response being send. Check your code if this intentional!", v3, 2u);
    MEMORY[0x242657DAC](v3, -1, -1);
  }

  return 0;
}

id sub_23EAEFA40(void *a1)
{
  return static MockURLResponder.urlResponse(to:)(a1);
}

uint64_t sub_23EAEFA54()
{
  return static MockURLResponder.configResponse()();
}

BOOL static MockNetworkError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MockNetworkError.hash(into:)()
{
  return sub_23EB1B164();
}

uint64_t MockNetworkError.hashValue.getter()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

BOOL sub_23EAEFAEC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23EAEFB04()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EAEFB48()
{
  return sub_23EB1B164();
}

uint64_t sub_23EAEFB70()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EAEFBC0()
{
  return 1;
}

uint64_t sub_23EAEFBC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_23EB1A594();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A54C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

uint64_t sub_23EAEFC48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_23EB1A594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

id sub_23EAEFC84()
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

  v0 = sub_23EB1A594();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_23EB1A54C();
  sub_23EAEFC48((uint64_t)v4, (uint64_t)v6);
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  v8 = (void *)sub_23EB1A534();
  v7(v6, v0);
  return v8;
}

id sub_23EAEFD4C()
{
  _QWORD *v0;
  void *v1;
  unint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id result;
  void *v18;
  id v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v1 = v0;
  v2 = *v0;
  v3 = *MEMORY[0x24BEE4EA0];
  v4 = sub_23EB1A594();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v41 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v1, sel_client);
  if (result)
  {
    v18 = result;
    v42 = v3;
    v43 = v2;
    v19 = objc_msgSend(v1, sel_request);
    sub_23EB1A54C();

    sub_23EB1A564();
    v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v13, v4);
    v21 = sub_23EB1A810();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v16, 1, v21) == 1)
    {
      sub_23EAEF78C((uint64_t)v16);
    }
    else
    {
      v41 = v20;
      v23 = sub_23EB1A7BC();
      v25 = v24;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v21);
      v46 = v23;
      v47 = v25;
      v44 = 0xD000000000000013;
      v45 = 0x800000023EB1D710;
      sub_23EAF09E8();
      LOBYTE(v23) = sub_23EB1AF54();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0 || (sub_23EAF0190() & 1) == 0)
      {
        v26 = v42 & v43;
        v27 = *(_QWORD *)((v42 & v43) + 0x50);
        v28 = objc_msgSend(v1, sel_request);
        sub_23EB1A54C();

        v29 = *(_QWORD *)(v26 + 88);
        v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 8))(v11, v27, v29);
        v43 = v30;
        v31 = v41;
        v41(v11, v4);
        v32 = objc_msgSend(v1, sel_request);
        sub_23EB1A54C();

        v33 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 16))(v8, v27, v29);
        v31(v8, v4);
        objc_msgSend(v18, sel_URLProtocol_didReceiveResponse_cacheStoragePolicy_, v1, v33, 2);
        objc_opt_self();
        v34 = swift_dynamicCastObjCClass();
        if (v34)
        {
          v35 = (void *)v34;
          v36 = v33;
          v37 = objc_msgSend(v35, sel_statusCode);
          v39 = v42;
          v38 = v43;
          if (v37 == (id)304)
          {

            sub_23EAF08F4(v39, v38);
          }
          else
          {
            v40 = (void *)sub_23EB1A858();
            objc_msgSend(v18, sel_URLProtocol_didLoadData_, v1, v40);

            sub_23EAF08F4(v39, v38);
          }
        }
        else
        {

          sub_23EAF08F4(v42, v43);
        }
      }
    }
    objc_msgSend(v18, sel_URLProtocolDidFinishLoading_, v1);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_23EAF015C(void *a1)
{
  id v1;

  v1 = a1;
  sub_23EAEFD4C();

}

uint64_t sub_23EAF0190()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
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
  unint64_t v14;
  unint64_t v15;
  id v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;

  v1 = v0;
  v2 = *MEMORY[0x24BEE4EA0] & *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EB1A594();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23EB1A810();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v32 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 88) + 24))();
  v15 = v14;
  v16 = objc_msgSend(v1, sel_request);
  sub_23EB1A54C();

  sub_23EB1A564();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) == 1)
  {
    sub_23EAF08F4(v13, v15);
    sub_23EAEF78C((uint64_t)v5);
  }
  else
  {
    v30 = v13;
    v31 = v15;
    v17 = v32;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v32, v5, v10);
    v18 = objc_msgSend(v1, sel_client);
    if (v18)
    {
      v19 = v18;
      v20 = objc_allocWithZone(MEMORY[0x24BDD15B8]);
      v21 = (void *)sub_23EB1A7C8();
      v22 = (void *)sub_23EB1ACCC();
      v23 = objc_msgSend(v20, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v21, 200, v22, 0);

      if (v23)
      {
        objc_msgSend(v19, sel_URLProtocol_didReceiveResponse_cacheStoragePolicy_, v1, v23, 2);
        v24 = v17;
        v25 = v30;
        v26 = v31;
        v27 = (void *)sub_23EB1A858();
        objc_msgSend(v19, sel_URLProtocol_didLoadData_, v1, v27);
        sub_23EAF08F4(v25, v26);

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v24, v10);
        return 1;
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
      swift_unknownObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    }
    sub_23EAF08F4(v30, v31);
  }
  return 0;
}

id sub_23EAF0484(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v13;

  v7 = sub_23EB1A594();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A54C();
  v10 = a4;
  swift_unknownObjectRetain();
  v11 = sub_23EAF0938((uint64_t)v9, (uint64_t)a4, a5);

  swift_unknownObjectRelease();
  return v11;
}

id sub_23EAF0538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for MockURLProtocol(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

id NSURLSession.init<A>(mockResponder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE6A0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_23EB1B750;
  *(_QWORD *)(v6 + 32) = type metadata accessor for MockURLProtocol(0, a2, a3, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE6A8);
  v8 = (void *)sub_23EB1AE34();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setProtocolClasses_, v8);

  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sessionWithConfiguration_, v5);
  v10 = (void *)objc_opt_self();
  objc_msgSend(v10, sel_registerClass_, swift_getObjCClassFromMetadata());

  return v9;
}

uint64_t type metadata accessor for MockURLProtocol(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MockURLProtocol);
}

unint64_t sub_23EAF06BC()
{
  unint64_t result;

  result = qword_256DAE6B0[0];
  if (!qword_256DAE6B0[0])
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for MockNetworkError, &type metadata for MockNetworkError);
    atomic_store(result, qword_256DAE6B0);
  }
  return result;
}

uint64_t dispatch thunk of static MockURLResponder.respond(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static MockURLResponder.urlResponse(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static MockURLResponder.configResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MockNetworkError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MockNetworkError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EAF0824 + 4 * byte_23EB1B855[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23EAF0858 + 4 * byte_23EB1B850[v4]))();
}

uint64_t sub_23EAF0858(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EAF0860(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EAF0868);
  return result;
}

uint64_t sub_23EAF0874(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EAF087CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23EAF0880(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EAF0888(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EAF0894(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23EAF08A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MockNetworkError()
{
  return &type metadata for MockNetworkError;
}

uint64_t sub_23EAF08C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23EAF08F4(uint64_t a1, unint64_t a2)
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

id sub_23EAF0938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  objc_super v15;

  v4 = v3;
  v8 = *MEMORY[0x24BEE4EA0] & *v4;
  v9 = (void *)sub_23EB1A534();
  v11 = (objc_class *)type metadata accessor for MockURLProtocol(0, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v10);
  v15.receiver = v4;
  v15.super_class = v11;
  v12 = objc_msgSendSuper2(&v15, sel_initWithRequest_cachedResponse_client_, v9, a2, a3);

  v13 = sub_23EB1A594();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
  return v12;
}

unint64_t sub_23EAF09E8()
{
  unint64_t result;

  result = qword_25433E7F8;
  if (!qword_25433E7F8)
  {
    result = MEMORY[0x242657D10](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25433E7F8);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242657CB0](a1, v6, a5);
}

ValueMetadata *type metadata accessor for HMACAuthController()
{
  return &type metadata for HMACAuthController;
}

uint64_t sub_23EAF0A68()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  if (v0[3])
  {
    v2 = v0[2];
  }
  else
  {
    v4 = *v0;
    v5 = v0[1];
    swift_bridgeObjectRetain();
    sub_23EB1AD74();
    sub_23EAEBE28();
    sub_23EB1AD74();
    swift_bridgeObjectRelease();
    sub_23EB1AD74();
    sub_23EB1AD74();
    v2 = v4;
    v1[2] = v4;
    v1[3] = v5;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_23EAF0B54()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  if (v0[5])
  {
    v1 = v0[4];
  }
  else
  {
    v1 = sub_23EAF0BB4(v0);
    v0[4] = v1;
    v0[5] = v2;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23EAF0BB4(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_bridgeObjectRetain();
  sub_23EB1AD74();
  sub_23EAEBE28();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  sub_23EB1AD74();
  sub_23EB1AD74();
  return v2;
}

void sub_23EAF0C60()
{
  qword_25433E6A0 = (uint64_t)&unk_250F41808;
}

uint64_t sub_23EAF0C74(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v4 = result % v3;
    if ((v4 & 0x8000000000000000) == 0)
      return *(unsigned __int8 *)(a3 + v4 + 32) ^ a2;
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23EAF0CA0()
{
  void *v0;
  void *v1;
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
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t *__return_ptr);
  uint64_t v38;
  uint64_t v39;
  char v40;
  _BYTE *v41;
  BOOL v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  _QWORD v48[2];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E6C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E6B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E6D0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E720);
  v47 = v12;
  sub_23EB1AA98();
  v13 = objc_msgSend(v1, sel_allHeaderFields);
  v14 = sub_23EB1AC60();

  strcpy((char *)v48, "Cache-Control");
  HIWORD(v48[1]) = -4864;
  sub_23EB1AF90();
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_23EB07F60((uint64_t)&v49), (v16 & 1) != 0))
  {
    sub_23EAECB88(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v53);
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23EAF2174((uint64_t)&v49);
  if (!*((_QWORD *)&v54 + 1))
  {
    sub_23EAEC540((uint64_t)&v53, &qword_25433E780);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v46 = v10;
    v49 = v48[0];
    v50 = v48[1];
    sub_23EAF21A8();
    sub_23EAF21EC();
    v45 = v9;
    sub_23EB1AC9C();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_23EAEC540((uint64_t)v4, &qword_25433E6C0);
      v9 = v45;
      v10 = v46;
      goto LABEL_10;
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    swift_getKeyPath();
    sub_23EB1AAA4();
    swift_release();
    v32 = MEMORY[0x2426574DC](v49, v50, v51, v52);
    v34 = v33;
    v35 = swift_bridgeObjectRelease();
    *(_QWORD *)&v53 = 0;
    v36 = MEMORY[0x24BDAC7A8](v35);
    v43[-2] = &v53;
    v10 = v46;
    if ((v34 & 0x1000000000000000) != 0 || !(v34 & 0x2000000000000000 | v32 & 0x1000000000000000))
    {
      sub_23EB1AFC0();
      goto LABEL_26;
    }
    MEMORY[0x24BDAC7A8](v36);
    v37 = (void (*)(uint64_t *__return_ptr))sub_23EAF227C;
    v43[-2] = sub_23EAF227C;
    v43[-1] = v38;
    if ((v34 & 0x2000000000000000) != 0)
    {
      v49 = v32;
      v50 = v34 & 0xFFFFFFFFFFFFFFLL;
      v42 = (v32 > 0x20u || ((0x100003E01uLL >> v32) & 1) == 0)
         && (v41 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
         && *v41 == 0;
      LOBYTE(v48[0]) = v42;
      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
    if ((v32 & 0x1000000000000000) != 0)
    {
      v39 = (v34 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else
    {
      v39 = sub_23EB1AFF0();
      v37 = (void (*)(uint64_t *__return_ptr))v43[-2];
      if (!v39)
      {
        v37(&v49);
        v40 = v49;
        v10 = v46;
        goto LABEL_25;
      }
      v10 = v46;
    }
    ((void (*)(uint64_t *__return_ptr, uint64_t))v37)(&v49, v39);
    v40 = v49;
LABEL_25:
    LOBYTE(v48[0]) = v40;
LABEL_26:
    swift_bridgeObjectRelease();
LABEL_33:
    v9 = v45;
    if ((v48[0] & 1) != 0)
    {
      v30 = v53;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v47, v9);
      return v30;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
LABEL_10:
  if (qword_25433E6E0 != -1)
    swift_once();
  v17 = sub_23EB1ABAC();
  __swift_project_value_buffer(v17, (uint64_t)qword_25433F2B8);
  v18 = sub_23EB1AB94();
  v19 = sub_23EB1AEA0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_23EAEA000, v18, v19, "Unable to generate max age value based on response.", v20, 2u);
    MEMORY[0x242657DAC](v20, -1, -1);
  }

  v21 = v1;
  v22 = sub_23EB1AB94();
  v23 = sub_23EB1AEA0();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    v49 = v44;
    *(_DWORD *)v24 = 136380675;
    v43[1] = v24 + 4;
    v25 = objc_msgSend(v21, sel_allHeaderFields);
    v46 = v10;
    v45 = v9;
    sub_23EB1AC60();

    v26 = sub_23EB1AC6C();
    v28 = v27;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v53 = sub_23EB152C0(v26, v28, &v49);
    sub_23EB1AF18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23EAEA000, v22, v23, "%{private}s", v24, 0xCu);
    v29 = v44;
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v29, -1, -1);
    MEMORY[0x242657DAC](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v47, v9);
  }
  return 0;
}

uint64_t sub_23EAF13D4@<X0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  sub_23EAF0CA0();
  if ((v2 & 1) != 0)
  {
    if (qword_25433E6E0 != -1)
      swift_once();
    v7 = sub_23EB1ABAC();
    __swift_project_value_buffer(v7, (uint64_t)qword_25433F2B8);
    v8 = sub_23EB1AB94();
    v9 = sub_23EB1AEA0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23EAEA000, v8, v9, "Unable to retrieve max age value from response.", v10, 2u);
      MEMORY[0x242657DAC](v10, -1, -1);
    }

    v3 = sub_23EB1A954();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 1;
  }
  else
  {
    sub_23EB1A90C();
    v3 = sub_23EB1A954();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 0;
  }
  return v4(v5, v6, 1, v3);
}

uint64_t sub_23EAF14F8()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21[5];
  __int128 v22;
  __int128 v23;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_allHeaderFields);
  v3 = sub_23EB1AC60();

  sub_23EB1AF90();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_23EB07F60((uint64_t)v21), (v5 & 1) != 0))
  {
    sub_23EAECB88(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v22);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23EAF2174((uint64_t)v21);
  if (*((_QWORD *)&v23 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
      return 1734440005;
  }
  else
  {
    sub_23EAEC540((uint64_t)&v22, &qword_25433E780);
  }
  if (qword_25433E6E0 != -1)
    swift_once();
  v7 = sub_23EB1ABAC();
  __swift_project_value_buffer(v7, (uint64_t)qword_25433F2B8);
  v8 = sub_23EB1AB94();
  v9 = sub_23EB1AEA0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v21[0] = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)&v22 = sub_23EB152C0(1734440005, 0xE400000000000000, v21);
    sub_23EB1AF18();
    _os_log_impl(&dword_23EAEA000, v8, v9, "Unable to retrieve %s header from response.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v11, -1, -1);
    MEMORY[0x242657DAC](v10, -1, -1);
  }

  v12 = v1;
  v13 = sub_23EB1AB94();
  v14 = sub_23EB1AEA0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21[0] = v20;
    *(_DWORD *)v15 = 136380675;
    v16 = objc_msgSend(v12, sel_allHeaderFields);
    sub_23EB1AC60();

    v17 = sub_23EB1AC6C();
    v19 = v18;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v22 = sub_23EB152C0(v17, v19, v21);
    sub_23EB1AF18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23EAEA000, v13, v14, "%{private}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v20, -1, -1);
    MEMORY[0x242657DAC](v15, -1, -1);

  }
  else
  {

  }
  return 0;
}

void sub_23EAF18D4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EB1A954();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EAF0CA0();
  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x2426579BC]();
    sub_23EAF1AF4(a1, (uint64_t)v5);
    if (v1)
    {
      objc_autoreleasePoolPop(v11);
      __break(1u);
      return;
    }
    objc_autoreleasePoolPop(v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      sub_23EB1A8E8();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return;
    }
    sub_23EAEC540((uint64_t)v5, (uint64_t *)&unk_25433E788);
  }
  if (qword_25433E6E0 != -1)
    swift_once();
  v12 = sub_23EB1ABAC();
  __swift_project_value_buffer(v12, (uint64_t)qword_25433F2B8);
  v13 = sub_23EB1AB94();
  v14 = sub_23EB1AEA0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    MEMORY[0x242657DAC](v15, -1, -1);
  }

  sub_23EB1A948();
}

uint64_t sub_23EAF1AF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[2];
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44[5];
  __int128 v45;
  __int128 v46;

  v41 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v38 - v7;
  v9 = objc_msgSend(a1, sel_allHeaderFields);
  v10 = sub_23EB1AC60();

  v42 = 1702125892;
  v43 = 0xE400000000000000;
  sub_23EB1AF90();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_23EB07F60((uint64_t)v44), (v12 & 1) != 0))
  {
    sub_23EAECB88(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)&v45);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23EAF2174((uint64_t)v44);
  if (!*((_QWORD *)&v46 + 1))
  {
    v17 = &qword_25433E780;
    v18 = (char *)&v45;
LABEL_13:
    sub_23EAEC540((uint64_t)v18, v17);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v13 = sub_23EAFE09C();
    v14 = (void *)sub_23EB1ACCC();
    v15 = objc_msgSend(v13, sel_dateFromString_, v14);

    if (v15)
    {
      sub_23EB1A930();

      v16 = sub_23EB1A954();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 0, 1, v16);
    }
    else
    {
      v16 = sub_23EB1A954();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
    }
    sub_23EAF22E8((uint64_t)v6, (uint64_t)v8);
    swift_bridgeObjectRelease();
    sub_23EB1A954();
    v19 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v8, 1, v16) != 1)
    {
      v37 = v41;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v41, v8, v16);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56))(v37, 0, 1, v16);
    }
    v17 = (uint64_t *)&unk_25433E788;
    v18 = v8;
    goto LABEL_13;
  }
LABEL_14:
  if (qword_25433E6E0 != -1)
    swift_once();
  v20 = sub_23EB1ABAC();
  __swift_project_value_buffer(v20, (uint64_t)qword_25433F2B8);
  v21 = sub_23EB1AB94();
  v22 = sub_23EB1AEA0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v44[0] = v24;
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)&v45 = sub_23EB152C0(1702125892, 0xE400000000000000, v44);
    sub_23EB1AF18();
    _os_log_impl(&dword_23EAEA000, v21, v22, "Unable to retrieve %s header from response.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v24, -1, -1);
    MEMORY[0x242657DAC](v23, -1, -1);
  }

  v25 = a1;
  v26 = sub_23EB1AB94();
  v27 = sub_23EB1AEA0();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v44[0] = v40;
    *(_DWORD *)v28 = 136380675;
    v38[1] = v28 + 4;
    v39 = v28;
    v29 = objc_msgSend(v25, sel_allHeaderFields);
    sub_23EB1AC60();

    v30 = sub_23EB1AC6C();
    v32 = v31;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v45 = sub_23EB152C0(v30, v32, v44);
    sub_23EB1AF18();

    swift_bridgeObjectRelease();
    v33 = v39;
    _os_log_impl(&dword_23EAEA000, v26, v27, "%{private}s", v39, 0xCu);
    v34 = v40;
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v34, -1, -1);
    MEMORY[0x242657DAC](v33, -1, -1);

  }
  else
  {

  }
  v35 = sub_23EB1A954();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v41, 1, 1, v35);
}

_BYTE *sub_23EAF207C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_23EAF20E4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  uint64_t v3;
  char v4;
  uint64_t var2;

  if (a1)
  {
    a3(&var2);
    if (!v3)
      v4 = var2;
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, _QWORD, _QWORD))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3)
      v4 = BYTE1(var2);
  }
  return v4 & 1;
}

_QWORD *sub_23EAF2138@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_23EAF2174(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_23EAF21A8()
{
  unint64_t result;

  result = qword_25433E700;
  if (!qword_25433E700)
  {
    result = MEMORY[0x242657D10](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25433E700);
  }
  return result;
}

unint64_t sub_23EAF21EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25433E6C8;
  if (!qword_25433E6C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_25433E6D0);
    result = MEMORY[0x242657D10](MEMORY[0x24BEE7460], v1);
    atomic_store(result, (unint64_t *)&qword_25433E6C8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242657D04](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_BYTE *sub_23EAF227C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_23EAF22E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAF2330@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EB1A810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB0B078();
  if (v10 != 1)
  {
    v11 = v9;
    swift_bridgeObjectRelease();
    if (v11)
    {
      sub_23EB14220((uint64_t)v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
        sub_23EB1A7D4();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        v16 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v16, 1, v5);
      }
      swift_bridgeObjectRelease();
      sub_23EAEC540((uint64_t)v4, &qword_25433E7A0);
    }
  }
  if (qword_25433E6E0 != -1)
    swift_once();
  v12 = sub_23EB1ABAC();
  __swift_project_value_buffer(v12, (uint64_t)qword_25433F2B8);
  v13 = sub_23EB1AB94();
  v14 = sub_23EB1AEA0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23EAEA000, v13, v14, "Unable to compute API Path for energy windows.", v15, 2u);
    MEMORY[0x242657DAC](v15, -1, -1);
  }

  v16 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v16, 1, v5);
}

uint64_t sub_23EAF2540@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X3>, uint64_t a5@<X8>)
{
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
  char *v18;
  uint64_t v19;
  char *v20;
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
  char *v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t inited;
  uint64_t v47;
  int v48;
  uint64_t v50;
  int v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  char *v59;
  uint8_t *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t (*v70)(uint64_t, unsigned int);
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unsigned int (*v77)(uint64_t, uint64_t, uint64_t);
  void (*v78)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  _BOOL4 v83;
  uint64_t v84;
  uint8_t *v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t);
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  uint64_t v90;
  void (*v91)(char *, char *, uint64_t);
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105[2];

  v100 = a3;
  v101 = a4;
  v97 = a1;
  v98 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E638);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v94 = (uint64_t)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v95 = (char *)&v90 - v9;
  v10 = sub_23EB1A594();
  v102 = *(_QWORD *)(v10 - 8);
  v103 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v96 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v90 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v90 - v19;
  v21 = sub_23EB1A810();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v90 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v99 = (char *)&v90 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v90 - v31;
  sub_23EAF2330((uint64_t)v20);
  v33 = v22;
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  if (v34(v20, 1, v21) == 1)
  {
    v35 = a5;
    sub_23EAEC540((uint64_t)v20, &qword_25433E7A0);
    if (qword_25433E6E0 != -1)
      swift_once();
    v36 = sub_23EB1ABAC();
    __swift_project_value_buffer(v36, (uint64_t)qword_25433F2B8);
    v37 = (unint64_t)v101;
    swift_bridgeObjectRetain_n();
    v38 = sub_23EB1AB94();
    v39 = sub_23EB1AEA0();
    v40 = os_log_type_enabled(v38, v39);
    v42 = v102;
    v41 = v103;
    if (v40)
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v105[0] = v44;
      *(_DWORD *)v43 = 136315138;
      swift_bridgeObjectRetain();
      v104 = sub_23EB152C0(v100, v37, v105);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v38, v39, "Request URL for EnergyWindows API not found | traceId: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v44, -1, -1);
      MEMORY[0x242657DAC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v35, 1, 1, v41);
  }
  else
  {
    v92 = v25;
    v93 = a5;
    v45 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
    v45(v32, v20, v21);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E758);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
    *(_QWORD *)(inited + 32) = 0x644964697267;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    *(_QWORD *)(inited + 48) = v97;
    *(_QWORD *)(inited + 56) = v98;
    swift_bridgeObjectRetain();
    v47 = v33;
    v98 = v32;
    sub_23EB1A7BC();
    sub_23EB1A7F8();
    v48 = v34(v15, 1, v21);
    v91 = v45;
    if (v48 == 1)
    {
      sub_23EAEC540((uint64_t)v15, &qword_25433E7A0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v18, 1, 1, v21);
    }
    else
    {
      v45(v28, v15, v21);
      sub_23EB0EC9C(inited, 1, 0, (uint64_t)v18);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v21);
    }
    v50 = v102;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v51 = v34(v18, 1, v21);
    v52 = v92;
    if (v51 == 1)
    {
      v53 = v47;
      sub_23EAEC540((uint64_t)v18, &qword_25433E7A0);
      if (qword_25433E6E0 != -1)
        swift_once();
      v54 = sub_23EB1ABAC();
      __swift_project_value_buffer(v54, (uint64_t)qword_25433F2B8);
      v55 = (unint64_t)v101;
      swift_bridgeObjectRetain_n();
      v56 = sub_23EB1AB94();
      v57 = sub_23EB1AEA0();
      v58 = os_log_type_enabled(v56, v57);
      v59 = v98;
      if (v58)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        v105[0] = v61;
        v102 = v21;
        *(_DWORD *)v60 = 136315138;
        swift_bridgeObjectRetain();
        v104 = sub_23EB152C0(v100, v55, v105);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v56, v57, "Unable to create Energy Interval URL with required query parameters | traceId: %s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v61, -1, -1);
        MEMORY[0x242657DAC](v60, -1, -1);

        (*(void (**)(char *, uint64_t))(v53 + 8))(v59, v102);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v53 + 8))(v59, v21);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56))(v93, 1, 1, v103);
    }
    else
    {
      v62 = v99;
      v91(v99, v18, v21);
      v102 = v47;
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v52, v62, v21);
      v63 = v96;
      sub_23EB1A558();
      sub_23EB1A528();
      v64 = sub_23EAFA5D4();
      v65 = v50;
      if ((v64 & 1) != 0)
      {
        v66 = v103;
        v67 = (uint64_t)v95;
        if (qword_25433E6A8 != -1)
          v64 = swift_once();
        MEMORY[0x24BDAC7A8](v64);
        *(&v90 - 2) = v71;
        v69 = &unk_250F41868;
        v70 = sub_23EAF3158;
      }
      else
      {
        v66 = v103;
        v67 = (uint64_t)v95;
        if (qword_25433E6A8 != -1)
          v64 = swift_once();
        MEMORY[0x24BDAC7A8](v64);
        *(&v90 - 2) = v68;
        v69 = &unk_250F418A8;
        v70 = sub_23EAF3150;
      }
      sub_23EB15910((uint64_t)v69, (uint64_t (*)(uint64_t, _QWORD))v70);
      v72 = (unint64_t)v101;
      v73 = sub_23EB1AD38();
      v75 = v74;
      swift_bridgeObjectRelease();
      sub_23EAFA5D4();
      v76 = v94;
      sub_23EAFE8BC(v73, v75, 49, 0xE100000000000000, v94);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v77 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
      if (v77(v76, 1, v66) == 1)
      {
        sub_23EAEC540(v76, &qword_25433E638);
        v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56);
        v78(v67, 1, 1, v66);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(v67, v76, v66);
        sub_23EB1A570();
        sub_23EB1A570();
        v79 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
        v79(v76, v66);
        v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56);
        v78(v67, 0, 1, v66);
        if (v77(v67, 1, v66) != 1)
        {
          v88 = v93;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v93, v67, v66);
          sub_23EB1A588();
          v79((uint64_t)v63, v66);
          v89 = *(void (**)(char *, uint64_t))(v102 + 8);
          v89(v99, v21);
          v89(v98, v21);
          return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v78)(v88, 0, 1, v66);
        }
      }
      v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v78;
      sub_23EAEC540(v67, &qword_25433E638);
      if (qword_25433E6E0 != -1)
        swift_once();
      v80 = sub_23EB1ABAC();
      __swift_project_value_buffer(v80, (uint64_t)qword_25433F2B8);
      swift_bridgeObjectRetain_n();
      v81 = sub_23EB1AB94();
      v82 = sub_23EB1AEA0();
      v83 = os_log_type_enabled(v81, v82);
      v84 = v93;
      if (v83)
      {
        v85 = (uint8_t *)swift_slowAlloc();
        v86 = swift_slowAlloc();
        v105[0] = v86;
        *(_DWORD *)v85 = 136315138;
        v84 = v93;
        swift_bridgeObjectRetain();
        v104 = sub_23EB152C0(v100, v72, v105);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v81, v82, "Unable to create signed Energy Interval request | traceId: %s", v85, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v86, -1, -1);
        MEMORY[0x242657DAC](v85, -1, -1);

        v66 = v103;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v96, v103);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v65 + 8))(v63, v66);
      }
      v87 = *(void (**)(char *, uint64_t))(v102 + 8);
      v87(v99, v21);
      v87(v98, v21);
      return v101(v84, 1, 1, v66);
    }
  }
}

uint64_t sub_23EAF3120()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EnergyWindowsRequest()
{
  return objc_opt_self();
}

uint64_t sub_23EAF3150(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  return sub_23EAF0C74(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23EAF315C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_23EB1AB88();
  __swift_allocate_value_buffer(v0, qword_256DAEE98);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DAEE98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE760);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23EB1BA40;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "accessoryId";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23EB1AB70();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "ekSiteId";
  *(_QWORD *)(v11 + 8) = 8;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "subscriptionId";
  *((_QWORD *)v13 + 1) = 14;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "usagePointRef";
  *((_QWORD *)v15 + 1) = 13;
  v15[16] = 2;
  v10();
  return sub_23EB1AB7C();
}

uint64_t sub_23EAF331C()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_23EB1AAF8();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_23EB1AB10();
          break;
        default:
          break;
      }
      result = sub_23EB1AAF8();
    }
  }
  return result;
}

uint64_t sub_23EAF33E0()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_23EB1AB58(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_23EB1AB58(), !v1))
    {
      v7 = v0[5];
      v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0)
        v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      if (!v8 || (result = sub_23EB1AB58(), !v1))
      {
        v9 = v0[7];
        v10 = HIBYTE(v9) & 0xF;
        if ((v9 & 0x2000000000000000) == 0)
          v10 = v0[6] & 0xFFFFFFFFFFFFLL;
        if (!v10 || (result = sub_23EB1AB58(), !v1))
        {
          type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
          return sub_23EB1AAB0();
        }
      }
    }
  }
  return result;
}

uint64_t sub_23EAF3520@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = 0;
  a1[7] = 0xE000000000000000;
  return sub_23EB1AABC();
}

unint64_t sub_23EAF3550()
{
  return 0xD000000000000019;
}

uint64_t sub_23EAF3570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_23EB1AAC8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23EAF35B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = sub_23EB1AAC8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_23EAF35F0())()
{
  return nullsub_2;
}

uint64_t sub_23EAF3604()
{
  return sub_23EAF331C();
}

uint64_t sub_23EAF3618()
{
  return sub_23EAF33E0();
}

uint64_t sub_23EAF3630()
{
  sub_23EAEF3B0(&qword_256DAE758, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB0C);
  return sub_23EB1AAE0();
}

uint64_t sub_23EAF3684@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DAE520 != -1)
    swift_once();
  v2 = sub_23EB1AB88();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DAEE98);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EAF36F4()
{
  sub_23EAEF3B0(&qword_256DAE740, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB44);
  return sub_23EB1AB34();
}

uint64_t sub_23EAF3734()
{
  sub_23EB1B158();
  sub_23EB1AC84();
  return sub_23EB1B170();
}

uint64_t sub_23EAF3788()
{
  sub_23EAEF3B0(&qword_256DAE740, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB44);
  return sub_23EB1AB40();
}

uint64_t sub_23EAF37D8()
{
  sub_23EB1B158();
  sub_23EB1AC84();
  return sub_23EB1B170();
}

uint64_t sub_23EAF3828()
{
  return sub_23EAEF3B0(&qword_256DAE738, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BA54);
}

uint64_t type metadata accessor for Com_Apple_Wpc_Es_IdBundle()
{
  uint64_t result;

  result = qword_256DAE7D0;
  if (!qword_256DAE7D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23EAF3890()
{
  return sub_23EAEF3B0(&qword_256DAE740, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB44);
}

uint64_t sub_23EAF38BC()
{
  return sub_23EAEF3B0(&qword_256DAE748, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BA7C);
}

uint64_t sub_23EAF38E8()
{
  return sub_23EAEF3B0(&qword_256DAE750, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BABC);
}

uint64_t sub_23EAF3914(_QWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_23EB1AAC8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_23EB1B0F8() & 1) != 0))
  {
    v13 = a1[2] == *((_QWORD *)a2 + 2) && a1[3] == *((_QWORD *)a2 + 3);
    if (v13 || (v12 = 0, (sub_23EB1B0F8() & 1) != 0))
    {
      if (a1[4] == *((_QWORD *)a2 + 4) && a1[5] == *((_QWORD *)a2 + 5) || (v12 = 0, (sub_23EB1B0F8() & 1) != 0))
      {
        if (a1[6] == *((_QWORD *)a2 + 6) && a1[7] == *((_QWORD *)a2 + 7) || (v12 = 0, (sub_23EB1B0F8() & 1) != 0))
        {
          v14 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
          v15 = (char *)a1 + *(int *)(v14 + 32);
          v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v16(v10, v15, v4);
          v16(v8, &a2[*(int *)(v14 + 32)], v4);
          sub_23EAEF3B0(qword_256DAE770, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
          v12 = sub_23EB1ACC0();
          v17 = *(void (**)(char *, uint64_t))(v5 + 8);
          v17(v8, v4);
          v17(v10, v4);
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t *sub_23EAF3AC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    v9 = *(int *)(a3 + 32);
    v10 = (char *)a2 + v9;
    v11 = (char *)a1 + v9;
    a1[6] = a2[6];
    a1[7] = v8;
    v12 = sub_23EB1AAC8();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t sub_23EAF3BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_23EB1AAC8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23EAF3C04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  v8 = *(int *)(a3 + 32);
  v9 = (char *)a2 + v8;
  v10 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  v11 = sub_23EB1AAC8();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

_QWORD *sub_23EAF3CB4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23EB1AAC8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_23EAF3D90(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23EB1AAC8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *sub_23EAF3DF4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23EB1AAC8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_23EAF3E90()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EAF3E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23EB1AAC8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_23EAF3F18()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EAF3F24(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_23EB1AAC8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23EAF3F98()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EB1AAC8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23EAF4010@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

_QWORD *sub_23EAF4028@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  char v3;

  v2 = *result >= 3uLL;
  *(_QWORD *)a2 = *result;
  v3 = !v2;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_23EAF4048()
{
  sub_23EAF4ABC();
  return sub_23EB1AAEC();
}

BOOL sub_23EAF4084(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_23EAF4098()
{
  qword_256DAEEB0 = (uint64_t)&unk_250F418E8;
}

uint64_t sub_23EAF40AC@<X0>(_QWORD *a1@<X8>)
{
  return sub_23EAF4294(&qword_256DAE528, &qword_256DAEEB0, a1);
}

void sub_23EAF40C8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

void sub_23EAF40D8(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_23EAF4AA8();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

uint64_t sub_23EAF4108()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_23EAF4110(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_23EAF4AA8();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

uint64_t sub_23EAF4144()
{
  sub_23EB1B158();
  sub_23EB1AC84();
  return sub_23EB1B170();
}

uint64_t sub_23EAF41AC()
{
  sub_23EAF4B00();
  return sub_23EB1AAEC();
}

uint64_t sub_23EAF41E4()
{
  sub_23EB1B158();
  sub_23EB1AC84();
  return sub_23EB1B170();
}

BOOL sub_23EAF4248(uint64_t a1, uint64_t *a2)
{
  return sub_23EAF4B60(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_23EAF4264()
{
  qword_256DAEEB8 = (uint64_t)&unk_250F41938;
}

uint64_t sub_23EAF4278@<X0>(_QWORD *a1@<X8>)
{
  return sub_23EAF4294(&qword_256DAE530, &qword_256DAEEB8, a1);
}

uint64_t sub_23EAF4294@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  if (*a1 != -1)
    swift_once();
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23EAF42D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_23EB1AB88();
  __swift_allocate_value_buffer(v0, qword_256DAEEC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DAEEC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE760);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23EB1BC10;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "ES_FEEDBACK_EVENT_ATTRIBUTION_UNDEFINED";
  *(_QWORD *)(v7 + 8) = 39;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23EB1AB70();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "ES_FEEDBACK_EVENT_ATTRIBUTION_USERCHANGED";
  *((_QWORD *)v11 + 1) = 41;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 2;
  *(_QWORD *)v12 = "ES_FEEDBACK_EVENT_ATTRIBUTION_SYSTEMCHANGED";
  *(_QWORD *)(v12 + 8) = 43;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_23EB1AB7C();
}

uint64_t sub_23EAF4468@<X0>(uint64_t a1@<X8>)
{
  return sub_23EAF4744(&qword_256DAE538, (uint64_t)qword_256DAEEC0, a1);
}

uint64_t sub_23EAF4484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;

  v0 = sub_23EB1AB88();
  __swift_allocate_value_buffer(v0, qword_256DAEED8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DAEED8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE760);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23EB1BC20;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "ES_FEEDBACK_EVENT_TYPE_UNDEFINED";
  *(_QWORD *)(v7 + 8) = 32;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23EB1AB70();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "ES_FEEDBACK_EVENT_TYPE_RUNNINGSTATUS";
  *(_QWORD *)(v11 + 8) = 36;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "ES_FEEDBACK_EVENT_TYPE_TEMPERATURESAMPLE";
  *((_QWORD *)v13 + 1) = 40;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "ES_FEEDBACK_EVENT_TYPE_TARGETTEMPERATURECHANGED";
  *((_QWORD *)v15 + 1) = 47;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "ES_FEEDBACK_EVENT_TYPE_SYSTEMMODE";
  *((_QWORD *)v17 + 1) = 33;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "ES_FEEDBACK_EVENT_TYPE_ACTIVITYSTATE";
  *((_QWORD *)v19 + 1) = 36;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "ES_FEEDBACK_EVENT_TYPE_HOLDSET";
  *((_QWORD *)v21 + 1) = 30;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 7;
  *(_QWORD *)v23 = "ES_FEEDBACK_EVENT_TYPE_INTERVALREADING";
  *((_QWORD *)v23 + 1) = 38;
  v23[16] = 2;
  v10();
  return sub_23EB1AB7C();
}

uint64_t sub_23EAF4728@<X0>(uint64_t a1@<X8>)
{
  return sub_23EAF4744(&qword_256DAE540, (uint64_t)qword_256DAEED8, a1);
}

uint64_t sub_23EAF4744@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23EB1AB88();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_23EAF47B0()
{
  return sub_23EAF47F8(&qword_256DAE818, &qword_256DAE820);
}

uint64_t sub_23EAF47D4()
{
  return sub_23EAF47F8(&qword_256DAE828, &qword_256DAE830);
}

uint64_t sub_23EAF47F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242657D10](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEventAttribution()
{
  return &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Wpc_Es_ESFeedbackEventType(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Com_Apple_Wpc_Es_ESFeedbackEventType(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_23EAF48AC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23EAF48C8(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEventType()
{
  return &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType;
}

unint64_t sub_23EAF48FC()
{
  unint64_t result;

  result = qword_256DAE838;
  if (!qword_256DAE838)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BD58, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType);
    atomic_store(result, (unint64_t *)&qword_256DAE838);
  }
  return result;
}

unint64_t sub_23EAF4944()
{
  unint64_t result;

  result = qword_256DAE840;
  if (!qword_256DAE840)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BDF8, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution);
    atomic_store(result, (unint64_t *)&qword_256DAE840);
  }
  return result;
}

unint64_t sub_23EAF498C()
{
  unint64_t result;

  result = qword_256DAE848;
  if (!qword_256DAE848)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BE20, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution);
    atomic_store(result, (unint64_t *)&qword_256DAE848);
  }
  return result;
}

unint64_t sub_23EAF49D4()
{
  unint64_t result;

  result = qword_256DAE850;
  if (!qword_256DAE850)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BE60, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution);
    atomic_store(result, (unint64_t *)&qword_256DAE850);
  }
  return result;
}

unint64_t sub_23EAF4A1C()
{
  unint64_t result;

  result = qword_256DAE858;
  if (!qword_256DAE858)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BD80, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType);
    atomic_store(result, (unint64_t *)&qword_256DAE858);
  }
  return result;
}

unint64_t sub_23EAF4A64()
{
  unint64_t result;

  result = qword_256DAE860;
  if (!qword_256DAE860)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BDC0, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType);
    atomic_store(result, (unint64_t *)&qword_256DAE860);
  }
  return result;
}

unint64_t sub_23EAF4ABC()
{
  unint64_t result;

  result = qword_256DAE868;
  if (!qword_256DAE868)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BE98, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution);
    atomic_store(result, (unint64_t *)&qword_256DAE868);
  }
  return result;
}

unint64_t sub_23EAF4B00()
{
  unint64_t result;

  result = qword_256DAE870;
  if (!qword_256DAE870)
  {
    result = MEMORY[0x242657D10](&unk_23EB1BEE0, &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType);
    atomic_store(result, (unint64_t *)&qword_256DAE870);
  }
  return result;
}

BOOL sub_23EAF4B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

void sub_23EAF4B6C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23EAF4BD8@<X0>(unsigned __int8 a1@<W1>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23EAF4CA4 + 4 * byte_23EB1BF3A[a1]))(a2 - 1);
}

uint64_t sub_23EAF4CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  if (a1 == a2 - 1 && v2 == 0x800000023EB1D2A0)
    v3 = 1;
  else
    v3 = sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23EAF4DA8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xED00006E6F697461;
  v3 = 0x72756769666E6F43;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x726576726553;
    else
      v5 = 0x73795320656C6946;
    if (v4 == 1)
      v6 = 0xE600000000000000;
    else
      v6 = 0xEB000000006D6574;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x72756769666E6F43;
  v6 = 0xED00006E6F697461;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x726576726553;
    else
      v3 = 0x73795320656C6946;
    if (v7 == 1)
      v2 = 0xE600000000000000;
    else
      v2 = 0xEB000000006D6574;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EAF4ED8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 1146048327;
    else
      v3 = 0x5453524F57;
    if (v2 == 1)
      v4 = 0xE400000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 1146048327;
      else
        v6 = 0x5453524F57;
      if (v5 == 1)
        v7 = 0xE400000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1414743362;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1414743362)
  {
LABEL_21:
    v8 = sub_23EB1B0F8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EAF4FC8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEF6C616E67695320;
  v3 = 0x65636E6164697547;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x5720796772656E45;
    else
      v5 = 0x6F6F4C2064697247;
    if (v4 == 1)
      v6 = 0xEE0073776F646E69;
    else
      v6 = 0xEB0000000070756BLL;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x65636E6164697547;
  v6 = 0xEF6C616E67695320;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x5720796772656E45;
    else
      v3 = 0x6F6F4C2064697247;
    if (v7 == 1)
      v2 = 0xEE0073776F646E69;
    else
      v2 = 0xEB0000000070756BLL;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EAF5118(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x7472617473;
    else
      v3 = 6581861;
    if (v2 == 1)
      v4 = 0xE500000000000000;
    else
      v4 = 0xE300000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x7472617473;
      else
        v6 = 6581861;
      if (v5 == 1)
        v7 = 0xE500000000000000;
      else
        v7 = 0xE300000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x676E69746172;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x676E69746172)
  {
LABEL_21:
    v8 = sub_23EB1B0F8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EAF5210(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 1685025392;
  else
    v3 = 7759204;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE400000000000000;
  if ((a2 & 1) != 0)
    v5 = 1685025392;
  else
    v5 = 7759204;
  if ((a2 & 1) != 0)
    v6 = 0xE400000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23EAF52A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;

  v0 = sub_23EB1AB88();
  __swift_allocate_value_buffer(v0, qword_256DAEEF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256DAEEF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE760);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_23EB1C130;
  v5 = v25 + v4;
  v6 = v25 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v25 + v4) = 1;
  *(_QWORD *)v6 = "startTime";
  *(_QWORD *)(v6 + 8) = 9;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_23EB1AB70();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 2;
  *(_QWORD *)v10 = "endTime";
  *(_QWORD *)(v10 + 8) = 7;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 3;
  *(_QWORD *)v12 = "eventType";
  *((_QWORD *)v12 + 1) = 9;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 4;
  *(_QWORD *)v14 = "value";
  *((_QWORD *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 5;
  *(_QWORD *)v16 = "unit";
  *((_QWORD *)v16 + 1) = 4;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 6;
  *(_QWORD *)v18 = "metadata";
  *((_QWORD *)v18 + 1) = 8;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 7;
  *(_QWORD *)v20 = "attribution";
  *((_QWORD *)v20 + 1) = 11;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 8;
  *(_QWORD *)v22 = "ids";
  *((_QWORD *)v22 + 1) = 3;
  v22[16] = 2;
  v9();
  v23 = v5 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 8 * v3) = 9;
  *(_QWORD *)v23 = "tag";
  *(_QWORD *)(v23 + 8) = 3;
  *(_BYTE *)(v23 + 16) = 2;
  v9();
  return sub_23EB1AB7C();
}

uint64_t sub_23EAF5578()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_23EB1AAF8();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
        case 9:
          v4 = v3;
          sub_23EB1AB10();
          goto LABEL_10;
        case 3:
          sub_23EAF4B00();
          goto LABEL_7;
        case 7:
          sub_23EAF4ABC();
LABEL_7:
          v4 = v3;
          sub_23EB1AB04();
          goto LABEL_10;
        case 8:
          v4 = v3;
          sub_23EAF56EC();
LABEL_10:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_23EB1AAF8();
    }
  }
  return result;
}

uint64_t sub_23EAF56EC()
{
  type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
  type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  sub_23EAEF3B0(&qword_256DAE740, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB44);
  return sub_23EB1AB1C();
}

uint64_t sub_23EAF5780()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_23EB1AB58(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_23EB1AB58(), !v1))
    {
      if (!v0[4] || (sub_23EAF4B00(), result = sub_23EB1AB4C(), !v1))
      {
        v7 = v0[7];
        v8 = HIBYTE(v7) & 0xF;
        if ((v7 & 0x2000000000000000) == 0)
          v8 = v0[6] & 0xFFFFFFFFFFFFLL;
        if (!v8 || (result = sub_23EB1AB58(), !v1))
        {
          v9 = v0[9];
          v10 = HIBYTE(v9) & 0xF;
          if ((v9 & 0x2000000000000000) == 0)
            v10 = v0[8] & 0xFFFFFFFFFFFFLL;
          if (!v10 || (result = sub_23EB1AB58(), !v1))
          {
            v11 = v0[11];
            v12 = HIBYTE(v11) & 0xF;
            if ((v11 & 0x2000000000000000) == 0)
              v12 = v0[10] & 0xFFFFFFFFFFFFLL;
            if (!v12 || (result = sub_23EB1AB58(), !v1))
            {
              if (!v0[12] || (sub_23EAF4ABC(), result = sub_23EB1AB4C(), !v1))
              {
                result = sub_23EAF59D4((uint64_t)v0);
                if (!v1)
                {
                  v13 = v0[15];
                  v14 = HIBYTE(v13) & 0xF;
                  if ((v13 & 0x2000000000000000) == 0)
                    v14 = v0[14] & 0xFFFFFFFFFFFFLL;
                  if (v14)
                    sub_23EB1AB58();
                  type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
                  return sub_23EB1AAB0();
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_23EAF59D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
  sub_23EAF5ED0(a1 + *(int *)(v9 + 52), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23EAEC540((uint64_t)v4, &qword_256DAE8A0);
  sub_23EAF5F18((uint64_t)v4, (uint64_t)v8);
  sub_23EAEF3B0(&qword_256DAE740, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle, (uint64_t)&unk_23EB1BB44);
  sub_23EB1AB64();
  return sub_23EAF5F5C((uint64_t)v8);
}

uint64_t sub_23EAF5B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0xE000000000000000;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0xE000000000000000;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0xE000000000000000;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0xE000000000000000;
  *(_QWORD *)(a2 + 96) = 0;
  *(_BYTE *)(a2 + 104) = 1;
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0xE000000000000000;
  sub_23EB1AABC();
  v4 = a2 + *(int *)(a1 + 52);
  v5 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_23EAF5BB8()
{
  return 0xD000000000000020;
}

uint64_t sub_23EAF5BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 48);
  v5 = sub_23EB1AAC8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23EAF5C14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 48);
  v5 = sub_23EB1AAC8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_23EAF5C54())()
{
  return nullsub_2;
}

uint64_t sub_23EAF5C68()
{
  return sub_23EAF5578();
}

uint64_t sub_23EAF5C7C()
{
  return sub_23EAF5780();
}

uint64_t sub_23EAF5C90()
{
  sub_23EAEF3B0(&qword_256DAE898, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1C008);
  return sub_23EB1AAE0();
}

uint64_t sub_23EAF5CE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DAE548 != -1)
    swift_once();
  v2 = sub_23EB1AB88();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256DAEEF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23EAF5D50()
{
  sub_23EAEF3B0(&qword_256DAE880, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1C040);
  return sub_23EB1AB34();
}

uint64_t sub_23EAF5D90()
{
  sub_23EAEF3B0(&qword_256DAE880, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1C040);
  return sub_23EB1AB40();
}

uint64_t sub_23EAF5DE4()
{
  return sub_23EAEF3B0(&qword_256DAE878, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1BF50);
}

uint64_t type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent()
{
  uint64_t result;

  result = qword_256DAE908;
  if (!qword_256DAE908)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23EAF5E4C()
{
  return sub_23EAEF3B0(&qword_256DAE880, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1C040);
}

uint64_t sub_23EAF5E78()
{
  return sub_23EAEF3B0(&qword_256DAE888, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1BF78);
}

uint64_t sub_23EAF5EA4()
{
  return sub_23EAEF3B0(&qword_256DAE890, (uint64_t (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent, (uint64_t)&unk_23EB1BFB8);
}

uint64_t sub_23EAF5ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAF5F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAF5F5C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EAF5F98(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(uint64_t, uint64_t, uint64_t);
  char v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;

  v4 = sub_23EB1AAC8();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v42 - v7;
  v8 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_256DAE8A8);
  MEMORY[0x24BDAC7A8](v12);
  v47 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t *)((char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v42 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v42 - v21;
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
    {
      if (!sub_23EAF4B60(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a2 + 32)))
        goto LABEL_33;
      if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48) && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
        || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
      {
        if (*(_QWORD *)(a1 + 64) == *(_QWORD *)(a2 + 64) && *(_QWORD *)(a1 + 72) == *(_QWORD *)(a2 + 72)
          || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
        {
          if (*(_QWORD *)(a1 + 80) == *(_QWORD *)(a2 + 80) && *(_QWORD *)(a1 + 88) == *(_QWORD *)(a2 + 88)
            || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
          {
            v24 = *(_QWORD *)(a1 + 96);
            v25 = *(_QWORD *)(a2 + 96);
            if (*(_BYTE *)(a2 + 104) == 1)
            {
              if (v25)
              {
                if (v25 == 1)
                {
                  if (v24 != 1)
                    goto LABEL_33;
                }
                else if (v24 != 2)
                {
                  goto LABEL_33;
                }
              }
              else if (v24)
              {
                goto LABEL_33;
              }
            }
            else if (v24 != v25)
            {
              goto LABEL_33;
            }
            v26 = type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
            sub_23EAF5ED0(a1 + *(int *)(v26 + 52), (uint64_t)v22);
            v42 = v26;
            v27 = *(int *)(v26 + 52);
            v28 = (uint64_t)v47;
            sub_23EAF5ED0(a2 + v27, (uint64_t)v20);
            v29 = v28 + *(int *)(v12 + 48);
            sub_23EAF5ED0((uint64_t)v22, v28);
            sub_23EAF5ED0((uint64_t)v20, v29);
            v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
            if (v30(v28, 1, v8) == 1)
            {
              sub_23EAEC540((uint64_t)v20, &qword_256DAE8A0);
              v28 = (uint64_t)v47;
              sub_23EAEC540((uint64_t)v22, &qword_256DAE8A0);
              if (v30(v29, 1, v8) == 1)
              {
                sub_23EAEC540(v28, &qword_256DAE8A0);
                goto LABEL_36;
              }
              goto LABEL_32;
            }
            sub_23EAF5ED0(v28, (uint64_t)v17);
            if (v30(v29, 1, v8) == 1)
            {
              sub_23EAEC540((uint64_t)v20, &qword_256DAE8A0);
              sub_23EAEC540((uint64_t)v22, &qword_256DAE8A0);
              sub_23EAF5F5C((uint64_t)v17);
LABEL_32:
              sub_23EAEC540(v28, qword_256DAE8A8);
              goto LABEL_33;
            }
            sub_23EAF5F18(v29, (uint64_t)v11);
            v32 = sub_23EAF351C(v17, v11);
            sub_23EAF5F5C((uint64_t)v11);
            sub_23EAEC540((uint64_t)v20, &qword_256DAE8A0);
            sub_23EAEC540((uint64_t)v22, &qword_256DAE8A0);
            sub_23EAF5F5C((uint64_t)v17);
            sub_23EAEC540(v28, &qword_256DAE8A0);
            if ((v32 & 1) != 0)
            {
LABEL_36:
              if (*(_QWORD *)(a1 + 112) == *(_QWORD *)(a2 + 112) && *(_QWORD *)(a1 + 120) == *(_QWORD *)(a2 + 120)
                || (v23 = 0, (sub_23EB1B0F8() & 1) != 0))
              {
                v33 = v42;
                v34 = v43;
                v35 = a1 + *(int *)(v42 + 48);
                v37 = v45;
                v36 = v46;
                v38 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 16);
                v38(v43, v35, v46);
                v39 = a2 + *(int *)(v33 + 48);
                v40 = v44;
                v38(v44, v39, v36);
                sub_23EAEF3B0(qword_256DAE770, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
                v23 = sub_23EB1ACC0();
                v41 = *(void (**)(char *, uint64_t))(v37 + 8);
                v41(v40, v36);
                v41(v34, v36);
              }
              return v23 & 1;
            }
LABEL_33:
            v23 = 0;
          }
        }
      }
    }
  }
  return v23 & 1;
}

_QWORD *sub_23EAF6484(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v10;
    v11 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v11;
    *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
    *(_QWORD *)(a1 + 96) = a2[12];
    v12 = a2[15];
    v13 = *(int *)(a3 + 48);
    v31 = (char *)a2 + v13;
    v32 = (char *)(a1 + v13);
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v12;
    v14 = sub_23EB1AAC8();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = v15;
    v15(v32, v31, v14);
    v16 = *(int *)(a3 + 52);
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v23 = v18[1];
      *v17 = *v18;
      v17[1] = v23;
      v24 = v18[3];
      v17[2] = v18[2];
      v17[3] = v24;
      v25 = v18[5];
      v17[4] = v18[4];
      v17[5] = v25;
      v26 = v18[7];
      v17[6] = v18[6];
      v17[7] = v26;
      v27 = *(int *)(v19 + 32);
      v28 = (char *)v17 + v27;
      v29 = (char *)v18 + v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v33(v28, v29, v14);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return v4;
}

uint64_t sub_23EAF6684(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_23EB1AAC8();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v4, v5);
  v6 = a1 + *(int *)(a2 + 52);
  v7 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v6 + *(int *)(v7 + 32), v5);
  }
  return result;
}

uint64_t sub_23EAF6784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v10 = *(_QWORD *)(a2 + 120);
  v11 = *(int *)(a3 + 48);
  v29 = (char *)(a2 + v11);
  v30 = (char *)(a1 + v11);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  v12 = sub_23EB1AAC8();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v30;
  v31 = v13;
  v13(v14, v29, v12);
  v15 = *(int *)(a3 + 52);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v21 = v17[1];
    *v16 = *v17;
    v16[1] = v21;
    v22 = v17[3];
    v16[2] = v17[2];
    v16[3] = v22;
    v23 = v17[5];
    v16[4] = v17[4];
    v16[5] = v23;
    v24 = v17[7];
    v16[6] = v17[6];
    v16[7] = v24;
    v25 = *(int *)(v18 + 32);
    v26 = (char *)v16 + v25;
    v27 = (char *)v17 + v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31(v26, v27, v12);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_23EAF6958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, uint64_t, uint64_t);
  int v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  char *v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 48);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23EB1AAC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 24);
  v13(v9, v10, v11);
  v14 = *(int *)(a3 + 52);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v10) = v19(v15, 1, v17);
  v20 = v19(v16, 1, v17);
  if (!(_DWORD)v10)
  {
    if (!v20)
    {
      *v15 = *v16;
      v15[1] = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v15[2] = v16[2];
      v15[3] = v16[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v15[4] = v16[4];
      v15[5] = v16[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v15[6] = v16[6];
      v15[7] = v16[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v13((uint64_t)v15 + *(int *)(v17 + 32), (uint64_t)v16 + *(int *)(v17 + 32), v11);
      return a1;
    }
    sub_23EAF5F5C((uint64_t)v15);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  *v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v15[3] = v16[3];
  v15[4] = v16[4];
  v15[5] = v16[5];
  v15[6] = v16[6];
  v15[7] = v16[7];
  v21 = *(int *)(v17 + 32);
  v26 = (char *)v15 + v21;
  v22 = (char *)v16 + v21;
  v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(v26, v22, v11);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_23EAF6C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = *(int *)(a3 + 48);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v11 = sub_23EB1AAC8();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v13 = *(int *)(a3 + 52);
  v14 = (_OWORD *)(a1 + v13);
  v15 = (_OWORD *)(a2 + v13);
  v16 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v19 = v15[1];
    *v14 = *v15;
    v14[1] = v19;
    v20 = v15[3];
    v14[2] = v15[2];
    v14[3] = v20;
    v12((char *)v14 + *(int *)(v16 + 32), (char *)v15 + *(int *)(v16 + 32), v11);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_23EAF6DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, uint64_t, uint64_t);
  int v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 48);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_23EB1AAC8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40);
  v17(v13, v14, v15);
  v18 = *(int *)(a3 + 52);
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  v21 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v14) = v23(v19, 1, v21);
  v24 = v23(v20, 1, v21);
  if (!(_DWORD)v14)
  {
    if (!v24)
    {
      v29 = v20[1];
      *v19 = *v20;
      v19[1] = v29;
      swift_bridgeObjectRelease();
      v30 = v20[3];
      v19[2] = v20[2];
      v19[3] = v30;
      swift_bridgeObjectRelease();
      v31 = v20[5];
      v19[4] = v20[4];
      v19[5] = v31;
      swift_bridgeObjectRelease();
      v32 = v20[7];
      v19[6] = v20[6];
      v19[7] = v32;
      swift_bridgeObjectRelease();
      v17((uint64_t)v19 + *(int *)(v21 + 32), (uint64_t)v20 + *(int *)(v21 + 32), v15);
      return a1;
    }
    sub_23EAF5F5C((uint64_t)v19);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  v25 = *((_OWORD *)v20 + 1);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v25;
  v26 = *((_OWORD *)v20 + 3);
  *((_OWORD *)v19 + 2) = *((_OWORD *)v20 + 2);
  *((_OWORD *)v19 + 3) = v26;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)v19 + *(int *)(v21 + 32), (char *)v20 + *(int *)(v21 + 32), v15);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

uint64_t sub_23EAF6FB4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EAF6FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23EB1AAC8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 48);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 52);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_23EAF7064()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23EAF7070(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_23EB1AAC8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 48);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE8A0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 52);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_23EAF7110()
{
  unint64_t v0;
  unint64_t v1;

  sub_23EB1AAC8();
  if (v0 <= 0x3F)
  {
    sub_23EAF71B4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23EAF71B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256DAE918[0])
  {
    type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
    v0 = sub_23EB1AF0C();
    if (!v1)
      atomic_store(v0, qword_256DAE918);
  }
}

uint64_t GridLookupError.hash(into:)()
{
  return sub_23EB1B164();
}

BOOL static GridLookupError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GridLookupError.hashValue.getter()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

unint64_t sub_23EAF728C()
{
  unint64_t result;

  result = qword_256DAE968;
  if (!qword_256DAE968)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for GridLookupError, &type metadata for GridLookupError);
    atomic_store(result, (unint64_t *)&qword_256DAE968);
  }
  return result;
}

BOOL sub_23EAF72D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t getEnumTagSinglePayload for GridLookupError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GridLookupError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EAF73C0 + 4 * byte_23EB1C145[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23EAF73F4 + 4 * byte_23EB1C140[v4]))();
}

uint64_t sub_23EAF73F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EAF73FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EAF7404);
  return result;
}

uint64_t sub_23EAF7410(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EAF7418);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23EAF741C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EAF7424(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23EAF7430(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GridLookupError()
{
  return &type metadata for GridLookupError;
}

uint64_t sub_23EAF7448(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 760) = a1;
  *(double *)(v3 + 752) = a3;
  *(double *)(v3 + 744) = a2;
  v4 = sub_23EB1A810();
  *(_QWORD *)(v3 + 768) = v4;
  *(_QWORD *)(v3 + 776) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 784) = swift_task_alloc();
  *(_QWORD *)(v3 + 792) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  *(_QWORD *)(v3 + 800) = swift_task_alloc();
  *(_QWORD *)(v3 + 808) = swift_task_alloc();
  *(_QWORD *)(v3 + 816) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  *(_QWORD *)(v3 + 824) = swift_task_alloc();
  v5 = sub_23EB1A954();
  *(_QWORD *)(v3 + 832) = v5;
  *(_QWORD *)(v3 + 840) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 848) = swift_task_alloc();
  *(_QWORD *)(v3 + 856) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EAF7588()
{
  uint64_t v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t inited;
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
  void *v21;
  id v22;
  void *v23;
  unsigned int v24;
  __CFString *v25;
  __CFString *v26;
  CFPropertyListRef v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void (*v36)(uint64_t, uint64_t);
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  __CFString *v56;
  __CFString *v57;
  CFPropertyListRef v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  _BOOL4 v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  CLLocationDegrees v90;
  CLLocationDegrees v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  _BOOL4 v96;
  unint64_t v97;
  uint64_t v98;
  uint8_t *v99;
  uint64_t v100;
  _BYTE *v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  unint64_t v105;
  uint64_t v106;
  uint8_t *v107;
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  _BOOL4 v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v1 = *(double *)(v0 + 752);
  v2 = *(double *)(v0 + 744);
  *(_QWORD *)(v0 + 728) = 0;
  MEMORY[0x242657DB8](v0 + 728, 8);
  v3 = *(_QWORD *)(v0 + 728);
  __swift_instantiateConcreteTypeFromMangledName(qword_25433E858);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4568];
  *(_OWORD *)(v4 + 16) = xmmword_23EB1B750;
  v6 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = v3;
  v7 = sub_23EB1ACFC();
  v9 = v8;
  v122 = v7;
  *(_QWORD *)(v0 + 864) = v7;
  *(_QWORD *)(v0 + 872) = v8;
  type metadata accessor for Geohash();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_QWORD *)(inited + 24) = 0;
  sub_23EB064F0(12, v2, v1);
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = sub_23EB08950(2);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  v18 = MEMORY[0x2426574DC](v11, v13, v15, v17);
  v20 = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 880) = v18;
  *(_QWORD *)(v0 + 888) = v20;
  if (qword_25433E340 != -1)
    swift_once();
  v123 = qword_25433F2E8;
  v124 = unk_25433F2F0;
  swift_bridgeObjectRetain();
  sub_23EAEBE28();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  sub_23EB1AD74();
  sub_23EB1AD74();
  *(_QWORD *)(v0 + 480) = v18;
  *(_QWORD *)(v0 + 488) = v20;
  *(_OWORD *)(v0 + 496) = 0u;
  *(_OWORD *)(v0 + 512) = 0u;
  *(_BYTE *)(v0 + 944) = 1;
  v21 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v22 = objc_msgSend(v21, sel_defaultManager);
  v23 = (void *)sub_23EB1ACCC();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v22, sel_fileExistsAtPath_isDirectory_, v23, v0 + 944);

  if (!v24)
  {
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
      swift_once();
    v48 = sub_23EB1ABAC();
    __swift_project_value_buffer(v48, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v49 = sub_23EB1AB94();
    v50 = sub_23EB1AEA0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v123 = v52;
      *(_DWORD *)v51 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 704) = sub_23EB152C0(v122, v9, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v49, v50, "Unable to find GeoHash 2 folder on disk. Proceed to fetch new file. | traceId: %s", v51, 0xCu);
      v53 = 1;
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v52, -1, -1);
      MEMORY[0x242657DAC](v51, -1, -1);

      v54 = 0;
      v55 = 0;
LABEL_25:
      *(_BYTE *)(v0 + 945) = v53;
      *(_QWORD *)(v0 + 904) = v55;
      *(_QWORD *)(v0 + 896) = v54;
      v71 = dword_256DAEAD8;
      v72 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 912) = v72;
      *v72 = v0;
      v72[1] = sub_23EAF8850;
      return ((uint64_t (*)(uint64_t))((char *)&dword_256DAEAD8 + v71))(*(_QWORD *)(v0 + 760));
    }
LABEL_24:
    swift_bridgeObjectRelease_n();

    v54 = 0;
    v55 = 0;
    v53 = 1;
    goto LABEL_25;
  }
  sub_23EAF0B54();
  v25 = (__CFString *)sub_23EB1ACCC();
  v26 = (__CFString *)sub_23EB1ACCC();
  v27 = CFPreferencesCopyAppValue(v25, v26);

  swift_bridgeObjectRelease();
  v28 = *(_QWORD *)(v0 + 840);
  v29 = *(_QWORD *)(v0 + 832);
  v30 = *(_QWORD *)(v0 + 824);
  if (!v27)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v28 + 56))(*(_QWORD *)(v0 + 824), 1, 1, *(_QWORD *)(v0 + 832));
    goto LABEL_16;
  }
  *(_QWORD *)(v0 + 736) = v27;
  v31 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v28 + 56))(v30, v31 ^ 1u, 1, v29);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v30, 1, v29) == 1)
  {
LABEL_16:
    sub_23EAEC540(*(_QWORD *)(v0 + 824), (uint64_t *)&unk_25433E788);
    goto LABEL_17;
  }
  v32 = *(_QWORD *)(v0 + 848);
  v33 = *(_QWORD *)(v0 + 840);
  v34 = *(_QWORD *)(v0 + 832);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v33 + 32))(*(_QWORD *)(v0 + 856), *(_QWORD *)(v0 + 824), v34);
  sub_23EB1A93C();
  v35 = sub_23EB1A900();
  v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  v36(v32, v34);
  if ((v35 & 1) == 0)
  {
    v36(*(_QWORD *)(v0 + 856), *(_QWORD *)(v0 + 832));
LABEL_17:
    sub_23EAF0A68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v56 = (__CFString *)sub_23EB1ACCC();
    v57 = (__CFString *)sub_23EB1ACCC();
    v58 = CFPreferencesCopyAppValue(v56, v57);

    swift_bridgeObjectRelease();
    if (v58)
    {
      *(_QWORD *)(v0 + 720) = v58;
      if ((swift_dynamicCast() & 1) != 0)
      {
        v53 = 0;
        v54 = *(_QWORD *)(v0 + 560);
        v55 = *(_QWORD *)(v0 + 568);
        goto LABEL_25;
      }
    }
    v59 = MEMORY[0x24BEE0D00];
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_23EB1B750;
    *(_QWORD *)(v60 + 32) = 0x64496563617274;
    *(_QWORD *)(v60 + 40) = 0xE700000000000000;
    *(_QWORD *)(v60 + 72) = v59;
    *(_QWORD *)(v60 + 48) = v122;
    *(_QWORD *)(v60 + 56) = v9;
    swift_bridgeObjectRetain();
    v61 = sub_23EAEC24C(v60);
    v62 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v63 = objc_msgSend(v62, sel_processName);

    v64 = sub_23EB1ACD8();
    v66 = v65;

    LOWORD(v123) = 514;
    BYTE2(v123) = 6;
    v124 = v64;
    v125 = v66;
    v126 = v61;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v123);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
      swift_once();
    v67 = sub_23EB1ABAC();
    __swift_project_value_buffer(v67, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v49 = sub_23EB1AB94();
    v68 = sub_23EB1AEA0();
    if (os_log_type_enabled(v49, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      v70 = swift_slowAlloc();
      v123 = v70;
      *(_DWORD *)v69 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 712) = sub_23EB152C0(v122, v9, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v49, v68, "Geohash folder exist, but no ETag for geohash stored in disk. | traceId: %s", v69, 0xCu);
      v53 = 1;
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v70, -1, -1);
      MEMORY[0x242657DAC](v69, -1, -1);

      v54 = 0;
      v55 = 0;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v37 = 0x25433E000uLL;
  if (qword_25433E350 != -1)
    swift_once();
  v38 = sub_23EB1ABAC();
  __swift_project_value_buffer(v38, (uint64_t)qword_25433F2F8);
  swift_bridgeObjectRetain_n();
  v39 = sub_23EB1AB94();
  v40 = sub_23EB1AEB8();
  v41 = os_log_type_enabled(v39, v40);
  v42 = *(_QWORD *)(v0 + 856);
  v43 = *(_QWORD *)(v0 + 832);
  if (v41)
  {
    v121 = v38;
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v123 = v45;
    *(_DWORD *)v44 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 688) = sub_23EB152C0(v122, v9, &v123);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v39, v40, "Geohash folder exist, and valid. Use local geohash tiles. Skipping fetching | traceId: %s", v44, 0xCu);
    swift_arrayDestroy();
    v46 = v45;
    v37 = 0x25433E000;
    MEMORY[0x242657DAC](v46, -1, -1);
    v47 = v44;
    v38 = v121;
    MEMORY[0x242657DAC](v47, -1, -1);

    v36(v42, v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v36(v42, v43);
  }
  v74 = sub_23EB05B44();
  if (v75)
  {
    v76 = v75;
    v77 = v74;
LABEL_30:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v77, v76);
  }
  v78 = *(_QWORD *)(v0 + 800);
  v79 = *(_QWORD *)(v0 + 776);
  v80 = *(_QWORD *)(v0 + 768);
  sub_23EB089D8(v78, *(double *)(v0 + 744), *(double *)(v0 + 752));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v78, 1, v80) == 1)
  {
    sub_23EAEC540(*(_QWORD *)(v0 + 800), &qword_25433E7A0);
    if (*(_QWORD *)(v37 + 848) != -1)
      swift_once();
    __swift_project_value_buffer(v38, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v81 = sub_23EB1AB94();
    v82 = sub_23EB1AE94();
    v83 = os_log_type_enabled(v81, v82);
    v84 = *(_QWORD *)(v0 + 872);
    if (v83)
    {
      v85 = *(_QWORD *)(v0 + 864);
      v86 = *(_QWORD *)(v0 + 752);
      v87 = *(_QWORD *)(v0 + 744);
      v88 = swift_slowAlloc();
      v89 = swift_slowAlloc();
      v123 = v89;
      *(_DWORD *)v88 = 134218498;
      *(_QWORD *)(v0 + 624) = v87;
      sub_23EB1AF18();
      *(_WORD *)(v88 + 12) = 2048;
      *(_QWORD *)(v0 + 632) = v86;
      sub_23EB1AF18();
      *(_WORD *)(v88 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 640) = sub_23EB152C0(v85, v84, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v81, v82, "Unable to locate matching geohash tile for coordinate %f:%f)\n| traceId: %s", (uint8_t *)v88, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v89, -1, -1);
      MEMORY[0x242657DAC](v88, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    v94 = sub_23EB1AB94();
    v95 = sub_23EB1AEA0();
    v96 = os_log_type_enabled(v94, v95);
    v97 = *(_QWORD *)(v0 + 872);
    if (v96)
    {
      v98 = *(_QWORD *)(v0 + 864);
      v99 = (uint8_t *)swift_slowAlloc();
      v100 = swift_slowAlloc();
      v123 = v100;
      *(_DWORD *)v99 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 616) = sub_23EB152C0(v98, v97, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v94, v95, "Returning no grid information. This could be intentional as the region is not supported\n| traceId: %s", v99, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v100, -1, -1);
      MEMORY[0x242657DAC](v99, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_23EAFA354();
    swift_allocError();
    *v101 = 2;
    swift_willThrow();
  }
  else
  {
    v90 = *(double *)(v0 + 752);
    v91 = *(double *)(v0 + 744);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 32))(*(_QWORD *)(v0 + 784), *(_QWORD *)(v0 + 800), *(_QWORD *)(v0 + 768));
    v92 = sub_23EB099A8(v91, v90);
    v76 = v93;
    sub_23EB05DFC(v92, v93);
    if (v76)
    {
      v77 = v92;
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 8))(*(_QWORD *)(v0 + 784), *(_QWORD *)(v0 + 768));
      goto LABEL_30;
    }
    if (*(_QWORD *)(v37 + 848) != -1)
      swift_once();
    __swift_project_value_buffer(v38, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v102 = sub_23EB1AB94();
    v103 = sub_23EB1AEA0();
    v104 = os_log_type_enabled(v102, v103);
    v105 = *(_QWORD *)(v0 + 872);
    if (v104)
    {
      v106 = *(_QWORD *)(v0 + 864);
      v107 = (uint8_t *)swift_slowAlloc();
      v108 = swift_slowAlloc();
      v123 = v108;
      *(_DWORD *)v107 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 672) = sub_23EB152C0(v106, v105, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v102, v103, "No Grid found for provided coordinates | traceId: %s", v107, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v108, -1, -1);
      MEMORY[0x242657DAC](v107, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    v109 = sub_23EB1AB94();
    v110 = sub_23EB1AE94();
    v111 = os_log_type_enabled(v109, v110);
    v112 = *(_QWORD *)(v0 + 872);
    if (v111)
    {
      v113 = *(_QWORD *)(v0 + 864);
      v114 = *(_QWORD *)(v0 + 752);
      v115 = *(_QWORD *)(v0 + 744);
      v116 = swift_slowAlloc();
      v117 = swift_slowAlloc();
      v123 = v117;
      *(_DWORD *)v116 = 134218498;
      *(_QWORD *)(v0 + 648) = v115;
      sub_23EB1AF18();
      *(_WORD *)(v116 + 12) = 2048;
      *(_QWORD *)(v0 + 656) = v114;
      sub_23EB1AF18();
      *(_WORD *)(v116 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 664) = sub_23EB152C0(v113, v112, &v123);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v109, v110, "Grid not found for coordinate %f:%f | traceId: %s", (uint8_t *)v116, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v117, -1, -1);
      MEMORY[0x242657DAC](v116, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v118 = *(_QWORD *)(v0 + 784);
    v119 = *(_QWORD *)(v0 + 776);
    v120 = *(_QWORD *)(v0 + 768);
    type metadata accessor for NetworkError(0);
    sub_23EAFA30C();
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v118, v120);
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

uint64_t sub_23EAF8850()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t *v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  v1[115] = (uint64_t)v3;
  *v3 = v2;
  v3[1] = sub_23EAF8904;
  return sub_23EB03194(v1[102], v1[110], v1[111], v1[95], v1[112], v1[113], v1[108], v1[109]);
}

uint64_t sub_23EAF8904(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 928) = a1;
  *(_QWORD *)(v3 + 936) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_23EAF89E0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  unint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  unint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  unint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  unint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  unint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  SEL *v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  _BOOL4 v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  CLLocationDegrees v100;
  CLLocationDegrees v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  unint64_t v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  os_log_type_t v119;
  _BOOL4 v120;
  unint64_t v121;
  uint64_t v122;
  uint8_t *v123;
  uint64_t v124;
  _BYTE *v125;
  _BYTE *v126;
  NSObject *v127;
  os_log_type_t v128;
  _BOOL4 v129;
  unint64_t v130;
  uint64_t v131;
  uint8_t *v132;
  uint64_t v133;
  _BYTE *v134;
  uint64_t v135;
  NSObject *v136;
  os_log_type_t v137;
  _BOOL4 v138;
  unint64_t v139;
  uint8_t *v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  _BOOL4 v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 928);
  if (!v1)
  {
    v10 = *(_QWORD *)(v0 + 872);
    v11 = *(_QWORD *)(v0 + 864);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
    *(_QWORD *)(inited + 32) = 0x64496563617274;
    *(_QWORD *)(inited + 40) = 0xE700000000000000;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = v11;
    *(_QWORD *)(inited + 56) = v10;
    swift_bridgeObjectRetain();
    v13 = sub_23EAEC24C(inited);
    v14 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v15 = objc_msgSend(v14, sel_processName);

    v16 = sub_23EB1ACD8();
    v18 = v17;

    LOWORD(v162) = 258;
    BYTE2(v162) = 7;
    v163 = v16;
    v164 = v18;
    v165 = v13;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v162);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
      swift_once();
    v19 = sub_23EB1ABAC();
    __swift_project_value_buffer(v19, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain();
    v20 = sub_23EB1AB94();
    v21 = sub_23EB1AEA0();
    v22 = os_log_type_enabled(v20, v21);
    v23 = *(_QWORD *)(v0 + 872);
    if (v22)
    {
      v160 = *(_QWORD *)(v0 + 864);
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v162 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 600) = sub_23EB152C0(v160, v23, &v162);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v20, v21, "Unknown error occurred while fetching geohash tile from server. | traceId: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v25, -1, -1);
      MEMORY[0x242657DAC](v24, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v53 = *(_QWORD *)(v0 + 816);
    type metadata accessor for NetworkError(0);
    sub_23EAFA30C();
    swift_allocError();
    *v54 = 2;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    goto LABEL_52;
  }
  v2 = v1;
  v3 = objc_msgSend(v2, sel_statusCode);
  swift_bridgeObjectRelease();
  if (v3 == (id)304)
  {
    if ((*(_BYTE *)(v0 + 945) & 1) != 0 || !*(_QWORD *)(v0 + 904))
    {
      v60 = *(_QWORD *)(v0 + 872);
      v61 = *(_QWORD *)(v0 + 864);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
      v62 = swift_initStackObject();
      *(_OWORD *)(v62 + 16) = xmmword_23EB1B740;
      *(_QWORD *)(v62 + 32) = 0x64496563617274;
      *(_QWORD *)(v62 + 40) = 0xE700000000000000;
      v63 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v62 + 48) = v61;
      *(_QWORD *)(v62 + 56) = v60;
      *(_QWORD *)(v62 + 72) = v63;
      *(_QWORD *)(v62 + 80) = 0x737574617473;
      *(_QWORD *)(v62 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      v64 = objc_msgSend(v2, sel_statusCode);
      *(_QWORD *)(v62 + 120) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v62 + 96) = v64;
      v65 = sub_23EAEC24C(v62);
      v66 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
      v67 = objc_msgSend(v66, sel_processName);

      v68 = sub_23EB1ACD8();
      v70 = v69;

      LOWORD(v162) = 258;
      BYTE2(v162) = 9;
      v163 = v68;
      v164 = v70;
      v165 = v65;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v162);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_25433E350 != -1)
        swift_once();
      v71 = sub_23EB1ABAC();
      __swift_project_value_buffer(v71, (uint64_t)qword_25433F2F8);
      swift_bridgeObjectRetain();
      v72 = sub_23EB1AB94();
      v73 = sub_23EB1AEA0();
      v74 = os_log_type_enabled(v72, v73);
      v75 = *(_QWORD *)(v0 + 872);
      if (v74)
      {
        v161 = *(_QWORD *)(v0 + 864);
        v76 = (uint8_t *)swift_slowAlloc();
        v156 = v2;
        v77 = swift_slowAlloc();
        v162 = v77;
        *(_DWORD *)v76 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 608) = sub_23EB152C0(v161, v75, &v162);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v72, v73, "Error while trying to fetch new Geohash tile from server | traceId: %s", v76, 0xCu);
        swift_arrayDestroy();
        v78 = v77;
        v2 = v156;
        MEMORY[0x242657DAC](v78, -1, -1);
        MEMORY[0x242657DAC](v76, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v53 = *(_QWORD *)(v0 + 816);
      sub_23EAFA354();
      swift_allocError();
      *v126 = 1;
      goto LABEL_51;
    }
    if (qword_25433E350 != -1)
      swift_once();
    v26 = sub_23EB1ABAC();
    __swift_project_value_buffer(v26, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v27 = sub_23EB1AB94();
    v28 = sub_23EB1AEB8();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(_QWORD *)(v0 + 872);
    if (v29)
    {
      v154 = *(_QWORD *)(v0 + 864);
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v162 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 680) = sub_23EB152C0(v154, v30, &v162);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v27, v28, "Geohash file unmodified. Continue using locally stored geohash tile | traceId: %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v32, -1, -1);
      MEMORY[0x242657DAC](v31, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_23EB052C8((uint64_t)v2, *(_QWORD *)(v0 + 880), *(_QWORD *)(v0 + 888));
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3 != (id)200)
    {
      v33 = *(_QWORD *)(v0 + 872);
      v34 = *(_QWORD *)(v0 + 864);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
      v35 = swift_initStackObject();
      *(_OWORD *)(v35 + 16) = xmmword_23EB1B740;
      *(_QWORD *)(v35 + 32) = 0x64496563617274;
      *(_QWORD *)(v35 + 40) = 0xE700000000000000;
      v36 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v35 + 48) = v34;
      *(_QWORD *)(v35 + 56) = v33;
      *(_QWORD *)(v35 + 72) = v36;
      *(_QWORD *)(v35 + 80) = 0x737574617473;
      *(_QWORD *)(v35 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      v37 = objc_msgSend(v2, sel_statusCode);
      *(_QWORD *)(v35 + 120) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v35 + 96) = v37;
      v38 = sub_23EAEC24C(v35);
      v39 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
      v40 = objc_msgSend(v39, sel_processName);

      v41 = sub_23EB1ACD8();
      v43 = v42;

      LOWORD(v162) = 258;
      BYTE2(v162) = 5;
      v163 = v41;
      v164 = v43;
      v165 = v38;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v162);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_25433E350 != -1)
        swift_once();
      v44 = sub_23EB1ABAC();
      __swift_project_value_buffer(v44, (uint64_t)qword_25433F2F8);
      swift_bridgeObjectRetain_n();
      v45 = sub_23EB1AB94();
      v46 = sub_23EB1AEA0();
      v47 = os_log_type_enabled(v45, v46);
      v48 = *(_QWORD *)(v0 + 872);
      if (v47)
      {
        v155 = v2;
        v49 = *(_QWORD *)(v0 + 864);
        v50 = (uint8_t *)swift_slowAlloc();
        v51 = swift_slowAlloc();
        v162 = v51;
        *(_DWORD *)v50 = 136315138;
        swift_bridgeObjectRetain();
        v52 = v49;
        v2 = v155;
        *(_QWORD *)(v0 + 592) = sub_23EB152C0(v52, v48, &v162);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v45, v46, "Unknown error occurred while fetching geohash tile from server | traceId: %s", v50, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v51, -1, -1);
        MEMORY[0x242657DAC](v50, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      swift_bridgeObjectRetain();
      v79 = v2;
      v80 = sub_23EB1AB94();
      v81 = sub_23EB1AEA0();
      v82 = os_log_type_enabled(v80, v81);
      v83 = *(_QWORD *)(v0 + 872);
      if (v82)
      {
        v159 = *(_QWORD *)(v0 + 864);
        v84 = swift_slowAlloc();
        v85 = swift_slowAlloc();
        v162 = v85;
        *(_DWORD *)v84 = 134218242;
        *(_QWORD *)(v0 + 576) = objc_msgSend(v79, sel_statusCode);
        sub_23EB1AF18();

        *(_WORD *)(v84 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 584) = sub_23EB152C0(v159, v83, &v162);
        sub_23EB1AF18();
        v86 = (SEL *)&unk_250F43000;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v80, v81, "Status Code returned %ld | traceId %s", (uint8_t *)v84, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v85, -1, -1);
        MEMORY[0x242657DAC](v84, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        v86 = (SEL *)&unk_250F43000;
      }
      v53 = *(_QWORD *)(v0 + 816);
      type metadata accessor for NetworkError(0);
      sub_23EAFA30C();
      swift_allocError();
      *v87 = objc_msgSend(v79, v86[421]);
      swift_storeEnumTagMultiPayload();
      swift_willThrow();

      goto LABEL_52;
    }
    v4 = *(_QWORD *)(v0 + 808);
    v5 = *(_QWORD *)(v0 + 776);
    v6 = *(_QWORD *)(v0 + 768);
    sub_23EAFA398(*(_QWORD *)(v0 + 816), v4);
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v4, 1, v6);
    v8 = *(_QWORD *)(v0 + 888);
    if (v7 == 1)
    {
      v9 = *(_QWORD *)(v0 + 808);
      swift_bridgeObjectRelease();
      sub_23EAEC540(v9, &qword_25433E7A0);
LABEL_43:
      v106 = *(_QWORD *)(v0 + 872);
      v107 = *(_QWORD *)(v0 + 864);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
      v108 = swift_initStackObject();
      *(_OWORD *)(v108 + 16) = xmmword_23EB1B740;
      *(_QWORD *)(v108 + 32) = 0x64496563617274;
      *(_QWORD *)(v108 + 40) = 0xE700000000000000;
      v109 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v108 + 48) = v107;
      *(_QWORD *)(v108 + 56) = v106;
      *(_QWORD *)(v108 + 72) = v109;
      *(_QWORD *)(v108 + 80) = 0x737574617473;
      *(_QWORD *)(v108 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      v110 = objc_msgSend(v2, sel_statusCode);
      *(_QWORD *)(v108 + 120) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v108 + 96) = v110;
      v111 = sub_23EAEC24C(v108);
      v112 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
      v113 = objc_msgSend(v112, sel_processName);

      v114 = sub_23EB1ACD8();
      v116 = v115;

      LOWORD(v162) = 514;
      BYTE2(v162) = 8;
      v163 = v114;
      v164 = v116;
      v165 = v111;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v162);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_25433E350 != -1)
        swift_once();
      v117 = sub_23EB1ABAC();
      __swift_project_value_buffer(v117, (uint64_t)qword_25433F2F8);
      swift_bridgeObjectRetain();
      v118 = sub_23EB1AB94();
      v119 = sub_23EB1AEA0();
      v120 = os_log_type_enabled(v118, v119);
      v121 = *(_QWORD *)(v0 + 872);
      if (v120)
      {
        v122 = *(_QWORD *)(v0 + 864);
        v123 = (uint8_t *)swift_slowAlloc();
        v124 = swift_slowAlloc();
        v162 = v124;
        *(_DWORD *)v123 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 696) = sub_23EB152C0(v122, v121, &v162);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v118, v119, "Error while creating geoHash tiles. | traceId: %s", v123, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v124, -1, -1);
        MEMORY[0x242657DAC](v123, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v53 = *(_QWORD *)(v0 + 816);
      sub_23EAFA354();
      swift_allocError();
      *v125 = 0;
LABEL_51:
      swift_willThrow();

LABEL_52:
      sub_23EAEC540(v53, &qword_25433E7A0);
LABEL_53:
      swift_willThrow();
      goto LABEL_54;
    }
    v55 = *(_QWORD *)(v0 + 880);
    v56 = *(_QWORD *)(v0 + 792);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 32))(v56, *(_QWORD *)(v0 + 808), *(_QWORD *)(v0 + 768));
    if ((sub_23EB045B0(v56, v55, v8) & 1) == 0)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 8))(*(_QWORD *)(v0 + 792), *(_QWORD *)(v0 + 768));
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
    v57 = *(_QWORD *)(v0 + 792);
    v58 = *(_QWORD *)(v0 + 776);
    v59 = *(_QWORD *)(v0 + 768);
    sub_23EB052C8((uint64_t)v2, *(_QWORD *)(v0 + 880), *(_QWORD *)(v0 + 888));

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  }
  sub_23EAEC540(*(_QWORD *)(v0 + 816), &qword_25433E7A0);
  v88 = *(_QWORD *)(v0 + 800);
  v89 = *(_QWORD *)(v0 + 776);
  v90 = *(_QWORD *)(v0 + 768);
  sub_23EB089D8(v88, *(double *)(v0 + 744), *(double *)(v0 + 752));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v88, 1, v90) == 1)
  {
    sub_23EAEC540(*(_QWORD *)(v0 + 800), &qword_25433E7A0);
    if (qword_25433E350 != -1)
      swift_once();
    v91 = sub_23EB1ABAC();
    __swift_project_value_buffer(v91, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v92 = sub_23EB1AB94();
    v93 = sub_23EB1AE94();
    v94 = os_log_type_enabled(v92, v93);
    v95 = *(_QWORD *)(v0 + 872);
    if (v94)
    {
      v157 = *(_QWORD *)(v0 + 864);
      v96 = *(_QWORD *)(v0 + 752);
      v97 = *(_QWORD *)(v0 + 744);
      v98 = swift_slowAlloc();
      v99 = swift_slowAlloc();
      v162 = v99;
      *(_DWORD *)v98 = 134218498;
      *(_QWORD *)(v0 + 624) = v97;
      sub_23EB1AF18();
      *(_WORD *)(v98 + 12) = 2048;
      *(_QWORD *)(v0 + 632) = v96;
      sub_23EB1AF18();
      *(_WORD *)(v98 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 640) = sub_23EB152C0(v157, v95, &v162);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v92, v93, "Unable to locate matching geohash tile for coordinate %f:%f)\n| traceId: %s", (uint8_t *)v98, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v99, -1, -1);
      MEMORY[0x242657DAC](v98, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    v127 = sub_23EB1AB94();
    v128 = sub_23EB1AEA0();
    v129 = os_log_type_enabled(v127, v128);
    v130 = *(_QWORD *)(v0 + 872);
    if (v129)
    {
      v131 = *(_QWORD *)(v0 + 864);
      v132 = (uint8_t *)swift_slowAlloc();
      v133 = swift_slowAlloc();
      v162 = v133;
      *(_DWORD *)v132 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 616) = sub_23EB152C0(v131, v130, &v162);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v127, v128, "Returning no grid information. This could be intentional as the region is not supported\n| traceId: %s", v132, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v133, -1, -1);
      MEMORY[0x242657DAC](v132, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_23EAFA354();
    swift_allocError();
    *v134 = 2;
    goto LABEL_53;
  }
  v100 = *(double *)(v0 + 752);
  v101 = *(double *)(v0 + 744);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 32))(*(_QWORD *)(v0 + 784), *(_QWORD *)(v0 + 800), *(_QWORD *)(v0 + 768));
  v102 = sub_23EB099A8(v101, v100);
  v104 = v103;
  sub_23EB05DFC(v102, v103);
  if (v104)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 776) + 8))(*(_QWORD *)(v0 + 784), *(_QWORD *)(v0 + 768));
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v102, v104);
  }
  if (qword_25433E350 != -1)
    swift_once();
  v135 = sub_23EB1ABAC();
  __swift_project_value_buffer(v135, (uint64_t)qword_25433F2F8);
  swift_bridgeObjectRetain_n();
  v136 = sub_23EB1AB94();
  v137 = sub_23EB1AEA0();
  v138 = os_log_type_enabled(v136, v137);
  v139 = *(_QWORD *)(v0 + 872);
  if (v138)
  {
    v158 = *(_QWORD *)(v0 + 864);
    v140 = (uint8_t *)swift_slowAlloc();
    v141 = swift_slowAlloc();
    v162 = v141;
    *(_DWORD *)v140 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 672) = sub_23EB152C0(v158, v139, &v162);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v136, v137, "No Grid found for provided coordinates | traceId: %s", v140, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v141, -1, -1);
    MEMORY[0x242657DAC](v140, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain();
  v142 = sub_23EB1AB94();
  v143 = sub_23EB1AE94();
  v144 = os_log_type_enabled(v142, v143);
  v145 = *(_QWORD *)(v0 + 872);
  if (v144)
  {
    v146 = *(_QWORD *)(v0 + 864);
    v147 = *(_QWORD *)(v0 + 752);
    v148 = *(_QWORD *)(v0 + 744);
    v149 = swift_slowAlloc();
    v150 = swift_slowAlloc();
    v162 = v150;
    *(_DWORD *)v149 = 134218498;
    *(_QWORD *)(v0 + 648) = v148;
    sub_23EB1AF18();
    *(_WORD *)(v149 + 12) = 2048;
    *(_QWORD *)(v0 + 656) = v147;
    sub_23EB1AF18();
    *(_WORD *)(v149 + 22) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 664) = sub_23EB152C0(v146, v145, &v162);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v142, v143, "Grid not found for coordinate %f:%f | traceId: %s", (uint8_t *)v149, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v150, -1, -1);
    MEMORY[0x242657DAC](v149, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v151 = *(_QWORD *)(v0 + 784);
  v152 = *(_QWORD *)(v0 + 776);
  v153 = *(_QWORD *)(v0 + 768);
  type metadata accessor for NetworkError(0);
  sub_23EAFA30C();
  swift_allocError();
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v151, v153);
LABEL_54:
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

uint64_t sub_23EAFA230()
{
  uint64_t v0;

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

unint64_t sub_23EAFA30C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DAE978;
  if (!qword_256DAE978)
  {
    v1 = type metadata accessor for NetworkError(255);
    result = MEMORY[0x242657D10](&protocol conformance descriptor for NetworkError, v1);
    atomic_store(result, (unint64_t *)&qword_256DAE978);
  }
  return result;
}

unint64_t sub_23EAFA354()
{
  unint64_t result;

  result = qword_256DAE980;
  if (!qword_256DAE980)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for GridLookupError, &type metadata for GridLookupError);
    atomic_store(result, &qword_256DAE980);
  }
  return result;
}

uint64_t sub_23EAFA398(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAFA3E0()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB4398]), sel_init);
  type metadata accessor for AppleAccountManager();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v0;
  qword_25433F298 = result;
  return result;
}

uint64_t sub_23EAFA430()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_aa_primaryAppleAccount);
  if (!v1)
  {
    if (qword_25433E6E0 != -1)
      swift_once();
    v6 = sub_23EB1ABAC();
    __swift_project_value_buffer(v6, (uint64_t)qword_25433F2B8);
    v2 = sub_23EB1AB94();
    v7 = sub_23EB1AEA0();
    if (os_log_type_enabled(v2, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23EAEA000, v2, v7, "Unable to retrieve User Primary Apple Account information", v8, 2u);
      MEMORY[0x242657DAC](v8, -1, -1);
    }
    goto LABEL_8;
  }
  v2 = v1;
  v3 = -[NSObject aa_personID](v1, sel_aa_personID);
  if (!v3)
  {
LABEL_8:

    return 0;
  }
  v4 = v3;
  v5 = sub_23EB1ACD8();

  return v5;
}

uint64_t sub_23EAFA560()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppleAccountManager()
{
  return objc_opt_self();
}

void sub_23EAFA5A4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7759204;
  if (*v1)
    v2 = 1685025392;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE400000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_23EAFA5D4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18[2];

  if (!os_variant_has_internal_diagnostics())
  {
LABEL_19:
    v7 = sub_23EAEBE28();
    return v7 & 1;
  }
  if (qword_25433E6F0 != -1)
    swift_once();
  v0 = sub_23EB1ABAC();
  __swift_project_value_buffer(v0, (uint64_t)qword_25433F2D0);
  v1 = sub_23EB1AB94();
  v2 = sub_23EB1AEB8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23EAEA000, v1, v2, "Internal build variant detected. Evaluating Server URL value for Environment information.", v3, 2u);
    MEMORY[0x242657DAC](v3, -1, -1);
  }

  v4 = sub_23EB0B4B8();
  if (!v5)
  {
    v14 = sub_23EB1AB94();
    v15 = sub_23EB1AEA0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23EAEA000, v14, v15, "Unable to retrieve server Base URL. Returning default value", v16, 2u);
      MEMORY[0x242657DAC](v16, -1, -1);
    }

    goto LABEL_19;
  }
  v18[0] = v4;
  v18[1] = v5;
  sub_23EAF09E8();
  v6 = sub_23EB1AF54();
  swift_bridgeObjectRelease();
  v7 = v6 ^ 1;
  v8 = sub_23EB1AB94();
  v9 = sub_23EB1AE88();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v18[0] = v11;
    *(_DWORD *)v10 = 136315138;
    if ((v6 & 1) != 0)
      v12 = 7759204;
    else
      v12 = 1685025392;
    if ((v6 & 1) != 0)
      v13 = 0xE300000000000000;
    else
      v13 = 0xE400000000000000;
    sub_23EB152C0(v12, v13, v18);
    sub_23EB1AF18();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23EAEA000, v8, v9, "%s env used for Internal calculation", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v11, -1, -1);
    MEMORY[0x242657DAC](v10, -1, -1);
  }

  return v7 & 1;
}

void sub_23EAFA8B0()
{
  BOOL v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = sub_23EAEBE28();
  if (v0)
    v1 = 1685025392;
  else
    v1 = 7759204;
  v2 = 0xE400000000000000;
  if (v0)
    v3 = 0xE400000000000000;
  else
    v3 = 0xE300000000000000;
  v4 = sub_23EAFA5D4();
  if ((v4 & 1) != 0)
    v5 = 1685025392;
  else
    v5 = 7759204;
  if ((v4 & 1) == 0)
    v2 = 0xE300000000000000;
  if (qword_25433E6F0 != -1)
    swift_once();
  v6 = sub_23EB1ABAC();
  __swift_project_value_buffer(v6, (uint64_t)qword_25433F2D0);
  swift_bridgeObjectRetain();
  v7 = sub_23EB1AB94();
  v8 = sub_23EB1AEB8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v16 = v1;
    v10 = swift_slowAlloc();
    v17 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_23EB152C0(v5, v2, &v17);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v7, v8, "Connected Server Environment : %s", v9, 0xCu);
    swift_arrayDestroy();
    v11 = v10;
    v1 = v16;
    MEMORY[0x242657DAC](v11, -1, -1);
    MEMORY[0x242657DAC](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v12 = sub_23EB1AB94();
  v13 = sub_23EB1AEB8();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v17 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_23EB152C0(v1, v3, &v17);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v12, v13, "Config Environment : %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v15, -1, -1);
    MEMORY[0x242657DAC](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_23EAFABA4()
{
  uint64_t result;
  uint64_t v1;

  if (qword_25433E6B0 != -1)
    swift_once();
  result = sub_23EAFA430();
  qword_25433F310 = result;
  *(_QWORD *)algn_25433F318 = v1;
  return result;
}

unint64_t sub_23EAFABFC(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x242657DB8](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x242657DB8](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_23EAFAC84(int64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  int64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  unsigned __int8 *v26;
  int v27;
  uint64_t v28;
  char v29;
  long double v30;

  if (!a3)
    goto LABEL_17;
  v30 = 0.0;
  v6 = MEMORY[0x24BDAC7A8](a1);
  if ((v7 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_23EB1AFC0();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
      goto LABEL_17;
    goto LABEL_8;
  }
  MEMORY[0x24BDAC7A8](v6);
  if ((a3 & 0x2000000000000000) != 0)
  {
    if (a2 <= 0x20u && ((1 << a2) & 0x100003E01) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      v26 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
      if (v26)
      {
        v27 = *v26;
        swift_bridgeObjectRelease();
        if (v27)
          goto LABEL_17;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if ((a2 & 0x1000000000000000) == 0)
    goto LABEL_34;
  v8 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
  for (i = a2 & 0xFFFFFFFFFFFFLL; ; i = v28)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23EAF20E4(v8, i, (void (*)(uint64_t *__return_ptr))sub_23EAFB0D4);
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      break;
LABEL_17:
    if (qword_25433E6E0 != -1)
      swift_once();
    v17 = sub_23EB1ABAC();
    __swift_project_value_buffer(v17, (uint64_t)qword_25433F2B8);
    v18 = sub_23EB1AB94();
    v19 = sub_23EB1AEA0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_23EAEA000, v18, v19, "Unable to retrieve User's DSID or convert to a required format. Generating random jitter value.", v20, 2u);
      MEMORY[0x242657DAC](v20, -1, -1);
    }

    if (a1 < 0)
    {
      __break(1u);
    }
    else if (a1)
    {
      v21 = sub_23EAFABFC(a1);
      v22 = sub_23EB1AB94();
      v23 = sub_23EB1AE94();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v24 = 134217984;
        sub_23EB1AF18();
        _os_log_impl(&dword_23EAEA000, v22, v23, "Generated Jitter Value: %lds", v24, 0xCu);
        MEMORY[0x242657DAC](v24, -1, -1);
      }

      return (double)v21;
    }
    __break(1u);
LABEL_34:
    v8 = sub_23EB1AFF0();
  }
LABEL_8:
  v11 = fmod(v30, (double)a1);
  if (qword_25433E6E0 != -1)
    swift_once();
  v12 = fabs(v11);
  v13 = sub_23EB1ABAC();
  __swift_project_value_buffer(v13, (uint64_t)qword_25433F2B8);
  v14 = sub_23EB1AB94();
  v15 = sub_23EB1AE94();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 134217984;
    sub_23EB1AF18();
    _os_log_impl(&dword_23EAEA000, v14, v15, "Generated Jitter Value: %fs", v16, 0xCu);
    MEMORY[0x242657DAC](v16, -1, -1);
  }

  return v12;
}

_BYTE *sub_23EAFB0BC@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_23EAF207C(a1, a2);
}

_QWORD *sub_23EAFB0D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_23EAF2138(*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_23EAFB0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[86] = a4;
  v4[85] = a3;
  v4[84] = a2;
  v4[83] = a1;
  v4[87] = type metadata accessor for NetworkError(0);
  v4[88] = swift_task_alloc();
  v4[89] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v4[90] = swift_task_alloc();
  v5 = sub_23EB1A954();
  v4[91] = v5;
  v4[92] = *(_QWORD *)(v5 - 8);
  v4[93] = swift_task_alloc();
  v4[94] = swift_task_alloc();
  v4[95] = swift_task_alloc();
  v4[96] = swift_task_alloc();
  v4[97] = type metadata accessor for EnergyWindows(0);
  v4[98] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E638);
  v4[99] = swift_task_alloc();
  v6 = sub_23EB1A594();
  v4[100] = v6;
  v4[101] = *(_QWORD *)(v6 - 8);
  v4[102] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EAFB248()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v0[75] = 0;
  MEMORY[0x242657DB8](v0 + 75, 8);
  v1 = v0[75];
  __swift_instantiateConcreteTypeFromMangledName(qword_25433E858);
  v2 = swift_allocObject();
  v3 = MEMORY[0x24BEE4568];
  *(_OWORD *)(v2 + 16) = xmmword_23EB1B750;
  v4 = MEMORY[0x24BEE45B8];
  *(_QWORD *)(v2 + 56) = v3;
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 32) = v1;
  v0[103] = sub_23EB1ACFC();
  v0[104] = v5;
  v8 = (uint64_t (*)(uint64_t))((char *)&dword_256DAEAD8 + dword_256DAEAD8);
  v6 = (_QWORD *)swift_task_alloc();
  v0[105] = v6;
  *v6 = v0;
  v6[1] = sub_23EAFB314;
  return v8(v0[86]);
}

uint64_t sub_23EAFB314()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EAFB368()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  _BYTE *v27;
  uint64_t v28[5];

  v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 832);
  v2 = *(_QWORD *)(v0 + 824);
  v3 = *(_QWORD *)(v0 + 808);
  v4 = *(_QWORD *)(v0 + 800);
  v5 = *(_QWORD *)(v0 + 792);
  v6 = *(char **)(v0 + 680);
  v7 = *(_QWORD *)(v0 + 672);
  type metadata accessor for EnergyWindowsRequest();
  swift_initStackObject();
  sub_23EAF2540(v7, v6, v2, v1, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) == 1)
  {
    v8 = *(_QWORD *)(v0 + 832);
    v9 = *(_QWORD *)(v0 + 824);
    sub_23EAEC540(*(_QWORD *)(v0 + 792), &qword_25433E638);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
    *(_QWORD *)(inited + 32) = 0x64496563617274;
    *(_QWORD *)(inited + 40) = 0xE700000000000000;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = v9;
    *(_QWORD *)(inited + 56) = v8;
    swift_bridgeObjectRetain();
    v11 = sub_23EAEC24C(inited);
    v12 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v13 = objc_msgSend(v12, sel_processName);

    v14 = sub_23EB1ACD8();
    v16 = v15;

    LOWORD(v28[0]) = 1;
    BYTE2(v28[0]) = 1;
    v28[1] = v14;
    v28[2] = v16;
    v28[3] = v11;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E6E0 != -1)
      swift_once();
    v17 = sub_23EB1ABAC();
    __swift_project_value_buffer(v17, (uint64_t)qword_25433F2B8);
    swift_bridgeObjectRetain();
    v18 = sub_23EB1AB94();
    v19 = sub_23EB1AEA0();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(_QWORD *)(v0 + 832);
    if (v20)
    {
      v22 = *(_QWORD *)(v0 + 824);
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v28[0] = v24;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 568) = sub_23EB152C0(v22, v21, v28);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v18, v19, "Unable generate request URL for EnergyWindow Request | traceId: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v24, -1, -1);
      MEMORY[0x242657DAC](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    swift_allocError();
    *v27 = 0;
    swift_storeEnumTagMultiPayload();
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
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 808) + 32))(*(_QWORD *)(v0 + 816), *(_QWORD *)(v0 + 792), *(_QWORD *)(v0 + 800));
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 848) = v25;
    *v25 = v0;
    v25[1] = sub_23EAFB7B0;
    return sub_23EB1AE70();
  }
}

uint64_t sub_23EAFB7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[107] = a1;
  v5[108] = a2;
  v5[109] = a3;
  v5[110] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_23EAFB828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  SEL *v4;
  SEL *v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t inited;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  id v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  _BOOL4 v88;
  unint64_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  _BOOL4 v114;
  unint64_t v115;
  uint64_t v116;
  uint8_t *v117;
  uint64_t v118;
  id v119;
  id v120;
  NSObject *v121;
  os_log_type_t v122;
  _BOOL4 v123;
  void *v124;
  unint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  void *v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  unint64_t v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  id v148;
  id v149;
  NSObject *v150;
  os_log_type_t v151;
  _BOOL4 v152;
  unint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  int v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(void);
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  os_log_type_t v171;
  _BOOL4 v172;
  _QWORD *v173;
  unint64_t v174;
  uint64_t v175;
  id v176;
  void *v177;
  id v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t v182;
  NSObject *v183;
  os_log_type_t v184;
  _BOOL4 v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  os_log_type_t v191;
  _BOOL4 v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  void *v197;
  id v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  _QWORD *v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void (*v234)(uint64_t, uint64_t);
  id v235;
  id v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;

  v1 = v0;
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  v3 = MEMORY[0x24BEE0D00];
  v4 = (SEL *)&unk_250F43000;
  v5 = (SEL *)&unk_250F43000;
  v6 = 0x25433E000uLL;
  if (!v2)
  {
    v11 = *(_QWORD *)(v0 + 832);
    v12 = *(_QWORD *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
    *(_QWORD *)(inited + 32) = 0x64496563617274;
    *(_QWORD *)(inited + 40) = 0xE700000000000000;
    *(_QWORD *)(inited + 72) = v3;
    *(_QWORD *)(inited + 48) = v12;
    *(_QWORD *)(inited + 56) = v11;
    swift_bridgeObjectRetain();
    v14 = sub_23EAEC24C(inited);
    v15 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v16 = objc_msgSend(v15, sel_processName);

    v17 = sub_23EB1ACD8();
    v19 = v18;

    LOWORD(v238) = 257;
    BYTE2(v238) = 2;
    v239 = v17;
    v240 = v19;
    v241 = v14;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v238);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E6E0 != -1)
      swift_once();
    v20 = sub_23EB1ABAC();
    __swift_project_value_buffer(v20, (uint64_t)qword_25433F2B8);
    swift_bridgeObjectRetain_n();
    v21 = sub_23EB1AB94();
    v22 = sub_23EB1AEA0();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_QWORD *)(v1 + 832);
    if (v23)
    {
      v25 = *(_QWORD *)(v1 + 824);
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v238 = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      v28 = v25;
      v5 = (SEL *)&unk_250F43000;
      *(_QWORD *)(v1 + 528) = sub_23EB152C0(v28, v24, &v238);
      v4 = (SEL *)&unk_250F43000;
      v3 = MEMORY[0x24BEE0D00];
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v21, v22, "Unable to process EnergyWindow Response | traceId: %s", v26, 0xCu);
      swift_arrayDestroy();
      v29 = v27;
      v6 = 0x25433E000;
      MEMORY[0x242657DAC](v29, -1, -1);
      MEMORY[0x242657DAC](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v52 = *(void **)(v1 + 872);
    v53 = *(_QWORD *)(v1 + 864);
    v54 = *(_QWORD *)(v1 + 856);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v55 = swift_allocError();
    *v56 = 2;
    swift_storeEnumTagMultiPayload();
    v236 = (id)v55;
    swift_willThrow();

    sub_23EAF08F4(v54, v53);
    goto LABEL_39;
  }
  v7 = (void *)v2;
  v8 = *(id *)(v0 + 872);
  v235 = v7;
  if (objc_msgSend(v7, sel_statusCode) != (id)200)
  {
    v30 = *(_QWORD *)(v0 + 832);
    v31 = *(_QWORD *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    v32 = swift_initStackObject();
    *(_OWORD *)(v32 + 16) = xmmword_23EB1B750;
    *(_QWORD *)(v32 + 32) = 0x64496563617274;
    *(_QWORD *)(v32 + 40) = 0xE700000000000000;
    *(_QWORD *)(v32 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v32 + 48) = v31;
    *(_QWORD *)(v32 + 56) = v30;
    swift_bridgeObjectRetain();
    v33 = sub_23EAEC24C(v32);
    v34 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v35 = objc_msgSend(v34, sel_processName);

    v36 = sub_23EB1ACD8();
    v38 = v37;

    LOWORD(v238) = 257;
    BYTE2(v238) = 4;
    v239 = v36;
    v240 = v38;
    v241 = v33;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v238);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E6E0 != -1)
      swift_once();
    v39 = *(void **)(v0 + 872);
    v40 = sub_23EB1ABAC();
    __swift_project_value_buffer(v40, (uint64_t)qword_25433F2B8);
    v41 = v39;
    swift_bridgeObjectRetain_n();
    v42 = v41;
    v43 = sub_23EB1AB94();
    v44 = sub_23EB1AEA0();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(void **)(v0 + 872);
    v47 = *(_QWORD *)(v0 + 832);
    if (v45)
    {
      v221 = *(_QWORD *)(v0 + 824);
      v48 = swift_slowAlloc();
      log = v43;
      v49 = (_QWORD *)swift_slowAlloc();
      v226 = swift_slowAlloc();
      v238 = v226;
      *(_DWORD *)v48 = 138412546;
      v50 = v235;
      *(_QWORD *)(v0 + 544) = v235;
      v51 = v46;
      sub_23EB1AF18();
      *v49 = v235;

      *(_WORD *)(v48 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 552) = sub_23EB152C0(v221, v47, &v238);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, log, v44, "Unhandled response code received for EnergyWindow Request. %@ | traceId: %s", (uint8_t *)v48, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v49, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v226, -1, -1);
      MEMORY[0x242657DAC](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      v50 = v235;
    }
    v57 = *(void **)(v0 + 872);
    v58 = *(_QWORD *)(v0 + 864);
    v59 = *(_QWORD *)(v0 + 856);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v60 = swift_allocError();
    *v61 = objc_msgSend(v50, sel_statusCode);
    swift_storeEnumTagMultiPayload();
    v236 = (id)v60;
    swift_willThrow();

    sub_23EAF08F4(v59, v58);
    v6 = 0x25433E000;
    v5 = (SEL *)&unk_250F43000;
    v4 = (SEL *)&unk_250F43000;
    v3 = MEMORY[0x24BEE0D00];
    goto LABEL_39;
  }
  v9 = *(void **)(v0 + 880);
  sub_23EB1A5B8();
  swift_allocObject();
  sub_23EB1A5AC();
  sub_23EAEF3B0(&qword_25433E698, type metadata accessor for EnergyWindows, (uint64_t)&protocol conformance descriptor for EnergyWindows);
  v10 = sub_23EB1A5A0();
  if (v9)
  {
    v236 = v9;
    swift_release();
    v5 = (SEL *)&unk_250F43000;
    v4 = (SEL *)&unk_250F43000;
    v3 = MEMORY[0x24BEE0D00];
LABEL_28:
    *(_QWORD *)(v1 + 560) = v236;
    v98 = v236;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
    if (swift_dynamicCast())
    {
      v99 = *(void **)(v1 + 872);
      v100 = *(_QWORD *)(v1 + 864);
      v101 = *(_QWORD *)(v1 + 856);
      sub_23EAFD9A4(*(_QWORD *)(v1 + 704), type metadata accessor for NetworkError);
      swift_willThrow();

      sub_23EAF08F4(v101, v100);
    }
    else
    {
      v102 = *(_QWORD *)(v1 + 832);
      v103 = *(_QWORD *)(v1 + 824);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
      v104 = swift_initStackObject();
      *(_OWORD *)(v104 + 16) = xmmword_23EB1B750;
      *(_QWORD *)(v104 + 32) = 0x64496563617274;
      *(_QWORD *)(v104 + 40) = 0xE700000000000000;
      *(_QWORD *)(v104 + 72) = v3;
      *(_QWORD *)(v104 + 48) = v103;
      *(_QWORD *)(v104 + 56) = v102;
      swift_bridgeObjectRetain();
      v105 = sub_23EAEC24C(v104);
      v106 = objc_msgSend((id)objc_opt_self(), v4[426]);
      v107 = objc_msgSend(v106, v5[427]);

      v108 = sub_23EB1ACD8();
      v110 = v109;

      LOWORD(v238) = 257;
      BYTE2(v238) = 3;
      v239 = v108;
      v240 = v110;
      v241 = v105;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v238);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v6 + 1760) != -1)
        swift_once();
      v111 = sub_23EB1ABAC();
      __swift_project_value_buffer(v111, (uint64_t)qword_25433F2B8);
      swift_bridgeObjectRetain_n();
      v112 = sub_23EB1AB94();
      v113 = sub_23EB1AEA0();
      v114 = os_log_type_enabled(v112, v113);
      v115 = *(_QWORD *)(v1 + 832);
      if (v114)
      {
        v116 = *(_QWORD *)(v1 + 824);
        v117 = (uint8_t *)swift_slowAlloc();
        v118 = swift_slowAlloc();
        v238 = v118;
        *(_DWORD *)v117 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v1 + 592) = sub_23EB152C0(v116, v115, &v238);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v112, v113, "Error while decoding Energy Intervals response from server | traceId: %s", v117, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v118, -1, -1);
        MEMORY[0x242657DAC](v117, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v119 = *(id *)(v1 + 872);
      swift_bridgeObjectRetain_n();
      v120 = v119;
      v121 = sub_23EB1AB94();
      v122 = sub_23EB1AEA0();
      v123 = os_log_type_enabled(v121, v122);
      v124 = *(void **)(v1 + 872);
      v125 = *(_QWORD *)(v1 + 832);
      if (v123)
      {
        loga = *(os_log_t *)(v1 + 824);
        v126 = swift_slowAlloc();
        v227 = swift_slowAlloc();
        v238 = v227;
        *(_DWORD *)v126 = 136315394;
        v127 = objc_msgSend(v124, sel_description);
        v128 = sub_23EB1ACD8();
        v130 = v129;

        *(_QWORD *)(v1 + 576) = sub_23EB152C0(v128, v130, &v238);
        sub_23EB1AF18();
        swift_bridgeObjectRelease();

        *(_WORD *)(v126 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v1 + 584) = sub_23EB152C0((uint64_t)loga, v125, &v238);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v121, v122, "URL Response %s | traceId: %s", (uint8_t *)v126, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v227, -1, -1);
        MEMORY[0x242657DAC](v126, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      v6 = 0x25433E000uLL;
      v5 = (SEL *)&unk_250F43000;
      v4 = (SEL *)&unk_250F43000;
      v3 = MEMORY[0x24BEE0D00];
      v131 = *(void **)(v1 + 872);
      v132 = *(_QWORD *)(v1 + 864);
      v133 = *(_QWORD *)(v1 + 856);
      sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
      v134 = swift_allocError();
      *v135 = 1;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();

      sub_23EAF08F4(v133, v132);
      v236 = (id)v134;
    }
LABEL_39:
    v136 = *(_QWORD *)(v1 + 832);
    v137 = *(_QWORD *)(v1 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    v138 = swift_initStackObject();
    *(_OWORD *)(v138 + 16) = xmmword_23EB1B750;
    *(_QWORD *)(v138 + 32) = 0x64496563617274;
    *(_QWORD *)(v138 + 40) = 0xE700000000000000;
    *(_QWORD *)(v138 + 72) = v3;
    *(_QWORD *)(v138 + 48) = v137;
    *(_QWORD *)(v138 + 56) = v136;
    swift_bridgeObjectRetain();
    v139 = v236;
    v140 = sub_23EAEC24C(v138);
    v141 = objc_msgSend((id)objc_opt_self(), v4[426]);
    v142 = objc_msgSend(v141, v5[427]);

    v143 = sub_23EB1ACD8();
    v145 = v144;

    LOWORD(v238) = 257;
    BYTE2(v238) = 5;
    v239 = v143;
    v240 = v145;
    v241 = v140;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v238);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v146 = v236;
    if (*(_QWORD *)(v6 + 1760) != -1)
      swift_once();
    v147 = sub_23EB1ABAC();
    __swift_project_value_buffer(v147, (uint64_t)qword_25433F2B8);
    v148 = v236;
    swift_bridgeObjectRetain();
    v149 = v236;
    v150 = sub_23EB1AB94();
    v151 = sub_23EB1AEA0();
    v152 = os_log_type_enabled(v150, v151);
    v153 = *(_QWORD *)(v1 + 832);
    if (v152)
    {
      logb = *(os_log_t *)(v1 + 824);
      v154 = swift_slowAlloc();
      v155 = (_QWORD *)swift_slowAlloc();
      v230 = v1;
      v156 = swift_slowAlloc();
      v238 = v156;
      *(_DWORD *)v154 = 138412546;
      v157 = v236;
      v158 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v230 + 520) = v158;
      sub_23EB1AF18();
      *v155 = v158;

      *(_WORD *)(v154 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v230 + 512) = sub_23EB152C0((uint64_t)logb, v153, &v238);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v150, v151, "URLSession Error while trying to fetch Energy Intervals. %@ | traceId: %s", (uint8_t *)v154, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
      swift_arrayDestroy();
      v146 = v236;
      MEMORY[0x242657DAC](v155, -1, -1);
      swift_arrayDestroy();
      v159 = v156;
      v1 = v230;
      MEMORY[0x242657DAC](v159, -1, -1);
      MEMORY[0x242657DAC](v154, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    *(_QWORD *)(v1 + 536) = v146;
    v160 = v146;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
    v161 = swift_dynamicCast();
    v162 = *(_QWORD *)(v1 + 816);
    v163 = *(_QWORD *)(v1 + 808);
    v164 = *(_QWORD *)(v1 + 800);
    if (v161)
    {
      sub_23EAFD9A4(*(_QWORD *)(v1 + 712), type metadata accessor for NetworkError);
      swift_willThrow();
    }
    else
    {
      sub_23EB104B4(v146);
      swift_willThrow();

    }
    (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v162, v164);
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
    v165 = *(void (**)(void))(v1 + 8);
    goto LABEL_48;
  }
  v62 = **(_QWORD **)(v0 + 784);
  if (!v62 || !*(_QWORD *)(v62 + 16))
  {
    v76 = *(_QWORD *)(v0 + 832);
    v77 = *(_QWORD *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
    v78 = swift_initStackObject();
    *(_OWORD *)(v78 + 16) = xmmword_23EB1B750;
    *(_QWORD *)(v78 + 32) = 0x64496563617274;
    *(_QWORD *)(v78 + 40) = 0xE700000000000000;
    v3 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v78 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v78 + 48) = v77;
    *(_QWORD *)(v78 + 56) = v76;
    swift_bridgeObjectRetain();
    v79 = sub_23EAEC24C(v78);
    v4 = (SEL *)&unk_250F43000;
    v80 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v5 = (SEL *)&unk_250F43000;
    v81 = objc_msgSend(v80, sel_processName);

    v82 = sub_23EB1ACD8();
    v84 = v83;

    LOWORD(v238) = 257;
    BYTE2(v238) = 0;
    v239 = v82;
    v240 = v84;
    v241 = v79;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v238);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
      swift_once();
    v85 = sub_23EB1ABAC();
    __swift_project_value_buffer(v85, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v86 = sub_23EB1AB94();
    v87 = sub_23EB1AEA0();
    v88 = os_log_type_enabled(v86, v87);
    v89 = *(_QWORD *)(v1 + 832);
    if (v88)
    {
      v90 = *(_QWORD *)(v1 + 824);
      v91 = (uint8_t *)swift_slowAlloc();
      v92 = v1;
      v93 = swift_slowAlloc();
      v238 = v93;
      *(_DWORD *)v91 = 136315138;
      swift_bridgeObjectRetain();
      v94 = v90;
      v4 = (SEL *)&unk_250F43000;
      *(_QWORD *)(v92 + 608) = sub_23EB152C0(v94, v89, &v238);
      v5 = (SEL *)&unk_250F43000;
      v6 = 0x25433E000;
      v3 = MEMORY[0x24BEE0D00];
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v86, v87, "No EnergyWindows returned in response | traceId: %s", v91, 0xCu);
      swift_arrayDestroy();
      v95 = v93;
      v1 = v92;
      MEMORY[0x242657DAC](v95, -1, -1);
      MEMORY[0x242657DAC](v91, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v96 = *(_QWORD *)(v1 + 784);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v97 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    v236 = (id)v97;
    swift_willThrow();
    swift_release();
    sub_23EAFD9A4(v96, type metadata accessor for EnergyWindows);
    goto LABEL_28;
  }
  v63 = (void *)MEMORY[0x2426579BC](v10);
  sub_23EAF18D4(v7);
  objc_autoreleasePoolPop(v63);
  if (qword_25433E768 != -1)
    swift_once();
  v64 = *(_QWORD *)(v0 + 784);
  v65 = *(_QWORD *)(v1 + 776);
  v66 = *(_QWORD *)(v1 + 760);
  v67 = *(_QWORD *)(v1 + 736);
  v68 = *(_QWORD *)(v1 + 728);
  v229 = (_QWORD *)v1;
  v232 = *(_QWORD *)(v1 + 720);
  v70 = qword_25433F310;
  v69 = *(_QWORD *)algn_25433F318;
  swift_bridgeObjectRetain();
  v71 = sub_23EAFAC84(600, v70, v69);
  swift_bridgeObjectRelease();
  sub_23EB1A8E8();
  v72 = v64 + *(int *)(v65 + 20);
  sub_23EAEC540(v72, (uint64_t *)&unk_25433E788);
  v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
  v73(v72, v66, v68);
  v74 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v67 + 56))(v72, 0, 1, v68);
  v75 = (void *)MEMORY[0x2426579BC](v74);
  sub_23EAF1AF4(v235, v232);
  objc_autoreleasePoolPop(v75);
  sub_23EAFD9E0(v229[90], v229[98] + *(int *)(v229[97] + 24));
  if (qword_25433E6E0 != -1)
    swift_once();
  v166 = v229[96];
  v167 = v229[94];
  v168 = v229[91];
  v169 = sub_23EB1ABAC();
  __swift_project_value_buffer(v169, (uint64_t)qword_25433F2B8);
  v73(v167, v166, v168);
  swift_bridgeObjectRetain_n();
  v170 = sub_23EB1AB94();
  v171 = sub_23EB1AE94();
  v172 = os_log_type_enabled(v170, v171);
  v173 = v229;
  v174 = v229[104];
  if (v172)
  {
    v212 = v229[94];
    v215 = v229[92];
    v217 = v229[103];
    v233 = v229[91];
    v175 = swift_slowAlloc();
    v219 = swift_slowAlloc();
    v238 = v219;
    *(_DWORD *)v175 = 136315394;
    v176 = sub_23EAFE0B8();
    v177 = (void *)sub_23EB1A8F4();
    v178 = objc_msgSend(v176, sel_stringFromDate_, v177);

    v179 = sub_23EB1ACD8();
    v181 = v180;

    v229[81] = sub_23EB152C0(v179, v181, &v238);
    sub_23EB1AF18();
    swift_bridgeObjectRelease();
    v182 = v233;
    v234 = *(void (**)(uint64_t, uint64_t))(v215 + 8);
    v234(v212, v182);
    *(_WORD *)(v175 + 12) = 2080;
    swift_bridgeObjectRetain();
    v229[82] = sub_23EB152C0(v217, v174, &v238);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v170, v171, "Window Response valid until %s | traceId: %s", (uint8_t *)v175, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v219, -1, -1);
    MEMORY[0x242657DAC](v175, -1, -1);
  }
  else
  {
    v234 = *(void (**)(uint64_t, uint64_t))(v229[92] + 8);
    v234(v229[94], v229[91]);
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain_n();
  v183 = sub_23EB1AB94();
  v184 = sub_23EB1AE94();
  v185 = os_log_type_enabled(v183, v184);
  v186 = v229[104];
  if (v185)
  {
    v187 = v229[103];
    v188 = swift_slowAlloc();
    v189 = swift_slowAlloc();
    v238 = v189;
    *(_DWORD *)v188 = 134218242;
    *((double *)v229 + 79) = v71;
    sub_23EB1AF18();
    *(_WORD *)(v188 + 12) = 2080;
    swift_bridgeObjectRetain();
    v173 = v229;
    v229[80] = sub_23EB152C0(v187, v186, &v238);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v183, v184, "Adding response jitter %fs | traceId: %s", (uint8_t *)v188, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v189, -1, -1);
    MEMORY[0x242657DAC](v188, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v73(v173[93], v173[95], v173[91]);
  swift_bridgeObjectRetain();
  v190 = sub_23EB1AB94();
  v191 = sub_23EB1AE94();
  v192 = os_log_type_enabled(v190, v191);
  v222 = (void *)v173[109];
  v228 = v173[107];
  v231 = v173[108];
  v193 = v173[104];
  if (v192)
  {
    v218 = v173[100];
    v220 = v173[102];
    v214 = v173[96];
    v216 = v173[101];
    v211 = v173[103];
    v213 = v173[95];
    v209 = v173[93];
    v210 = v173[91];
    v194 = swift_slowAlloc();
    v195 = swift_slowAlloc();
    v238 = v195;
    *(_DWORD *)v194 = 136315394;
    v196 = sub_23EAFE0B8();
    v197 = (void *)sub_23EB1A8F4();
    v198 = objc_msgSend(v196, sel_stringFromDate_, v197);

    v199 = sub_23EB1ACD8();
    v201 = v200;

    v173[77] = sub_23EB152C0(v199, v201, &v238);
    sub_23EB1AF18();
    swift_bridgeObjectRelease();
    v234(v209, v210);
    *(_WORD *)(v194 + 12) = 2080;
    swift_bridgeObjectRetain();
    v173[78] = sub_23EB152C0(v211, v193, &v238);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v190, v191, "Window Response re-poll date %s | traceId: %s", (uint8_t *)v194, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v195, -1, -1);
    MEMORY[0x242657DAC](v194, -1, -1);
    swift_release();
    sub_23EAF08F4(v228, v231);

    v234(v213, v210);
    v234(v214, v210);
    (*(void (**)(uint64_t, uint64_t))(v216 + 8))(v220, v218);
  }
  else
  {
    v237 = (id)v173[102];
    v202 = v173[101];
    v203 = v173[100];
    v204 = v173[96];
    v205 = v173[95];
    v206 = v173[93];
    v207 = v173[91];
    swift_release();
    sub_23EAF08F4(v228, v231);

    swift_bridgeObjectRelease_n();
    v234(v206, v207);

    v234(v205, v207);
    v234(v204, v207);
    (*(void (**)(id, uint64_t))(v202 + 8))(v237, v203);
  }
  v208 = v173[98];
  sub_23EAFDA28(v208, v173[83]);
  sub_23EAFD9A4(v208, type metadata accessor for EnergyWindows);
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
  v165 = (void (*)(void))v173[1];
LABEL_48:
  v165();
}

uint64_t sub_23EAFD4C0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[5];

  v1 = *(void **)(v0 + 880);
  v2 = *(_QWORD *)(v0 + 832);
  v3 = *(_QWORD *)(v0 + 824);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
  *(_QWORD *)(inited + 32) = 0x64496563617274;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v2;
  swift_bridgeObjectRetain();
  v5 = v1;
  v6 = sub_23EAEC24C(inited);
  v7 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v8 = objc_msgSend(v7, sel_processName);

  v9 = sub_23EB1ACD8();
  v11 = v10;

  LOWORD(v31[0]) = 257;
  BYTE2(v31[0]) = 5;
  v31[1] = v9;
  v31[2] = v11;
  v31[3] = v6;
  static AutoBugCaptureManager.sendIssue(_:)((char *)v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25433E6E0 != -1)
    swift_once();
  v12 = sub_23EB1ABAC();
  __swift_project_value_buffer(v12, (uint64_t)qword_25433F2B8);
  v13 = v1;
  swift_bridgeObjectRetain();
  v14 = v1;
  v15 = sub_23EB1AB94();
  v16 = sub_23EB1AEA0();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(_QWORD *)(v0 + 832);
  if (v17)
  {
    v29 = *(_QWORD *)(v0 + 824);
    v19 = swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    v31[0] = swift_slowAlloc();
    v30 = v31[0];
    *(_DWORD *)v19 = 138412546;
    v21 = v1;
    v22 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 520) = v22;
    sub_23EB1AF18();
    *v20 = v22;

    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 512) = sub_23EB152C0(v29, v18, v31);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v15, v16, "URLSession Error while trying to fetch Energy Intervals. %@ | traceId: %s", (uint8_t *)v19, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v30, -1, -1);
    MEMORY[0x242657DAC](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  *(_QWORD *)(v0 + 536) = v1;
  v23 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
  v24 = swift_dynamicCast();
  v25 = *(_QWORD *)(v0 + 816);
  v26 = *(_QWORD *)(v0 + 808);
  v27 = *(_QWORD *)(v0 + 800);
  if (v24)
  {
    sub_23EAFD9A4(*(_QWORD *)(v0 + 712), type metadata accessor for NetworkError);
    swift_willThrow();
  }
  else
  {
    sub_23EB104B4(v1);
    swift_willThrow();

  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
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

uint64_t sub_23EAFD934(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23EAFD954(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_23EB1AF18();
  *a1 = v5;
  return result;
}

uint64_t sub_23EAFD9A4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23EAFD9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAFDA28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EAFDA6C(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_25433F2B8);
}

uint64_t sub_23EAFDA94(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_256DAEF08);
}

uint64_t sub_23EAFDAB8(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_25433F2F8);
}

uint64_t sub_23EAFDAE0(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_256DAEF20);
}

uint64_t sub_23EAFDB08(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_256DAEF38);
}

uint64_t sub_23EAFDB28(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_25433F2D0);
}

uint64_t sub_23EAFDB48(uint64_t a1)
{
  return sub_23EAEBBDC(a1, qword_256DAEF50);
}

uint64_t sub_23EAFDB74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(unint64_t, _QWORD, uint64_t);
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t result;
  uint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a1;
  v1 = sub_23EB1A9F0();
  v26 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EB1A744();
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_currentCalendar);
  sub_23EB1A9B4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE698);
  v8 = sub_23EB1A9E4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23EB1C290;
  v13 = v12 + v11;
  v14 = *(void (**)(unint64_t, _QWORD, uint64_t))(v9 + 104);
  v14(v13, *MEMORY[0x24BDCF240], v8);
  v14(v13 + v10, *MEMORY[0x24BDCF250], v8);
  v14(v13 + 2 * v10, *MEMORY[0x24BDCF220], v8);
  v15 = v1;
  v14(v13 + 3 * v10, *MEMORY[0x24BDCF230], v8);
  v14(v13 + 4 * v10, *MEMORY[0x24BDCF258], v8);
  sub_23EAFDE44(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23EB1A99C();
  swift_bridgeObjectRelease();
  v16 = *(void (**)(char *, uint64_t))(v26 + 8);
  v16(v3, v15);
  result = sub_23EB1A714();
  v18 = 0;
  if ((v19 & 1) == 0)
  {
    if (result > 19)
    {
      if ((unint64_t)result > 0x31)
        v20 = 80;
      else
        v20 = 50;
      v21 = __OFADD__(result, v20 - result);
      result = v20;
      if (!v21)
        goto LABEL_6;
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    v18 = result;
  }
  if (!__OFSUB__(20, v18))
  {
    result = 20;
    if (!__OFADD__(v18, 20 - v18))
    {
LABEL_6:
      sub_23EB1A720();
      sub_23EB1A9D8();
      sub_23EB1A9C0();
      v16(v3, v15);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v6, v24);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_23EAFDE44(uint64_t a1)
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

  v2 = sub_23EB1A9E4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE9A8);
    v10 = sub_23EB1AFB4();
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
      sub_23EAFE2C4(&qword_256DAE9B0, MEMORY[0x24BDCF2A8]);
      v14 = sub_23EB1AC78();
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
          sub_23EAFE2C4(&qword_256DAE9B8, MEMORY[0x24BDCF2C0]);
          v20 = sub_23EB1ACC0();
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

id sub_23EAFE09C()
{
  return sub_23EAFE0D4(0xD00000000000001DLL, 0x800000023EB1DB70);
}

id sub_23EAFE0B8()
{
  return sub_23EAFE0D4(0xD000000000000018, 0x800000023EB1DB50);
}

id sub_23EAFE0D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a1;
  v21 = a2;
  v2 = sub_23EB1A984();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23EB1A9F0();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23EB1A978();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  sub_23EB1A960();
  v14 = (void *)sub_23EB1A96C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  objc_msgSend(v13, sel_setLocale_, v14);

  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCEF70], v2);
  sub_23EB1A990();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = (void *)sub_23EB1A9A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  objc_msgSend(v13, sel_setCalendar_, v15);

  v16 = (void *)sub_23EB1ACCC();
  objc_msgSend(v13, sel_setDateFormat_, v16);

  return v13;
}

uint64_t sub_23EAFE2C4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23EB1A9E4();
    result = MEMORY[0x242657D10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static EnergyServices.gridIDLookup(_:withSession:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, double, double);

  v9 = (uint64_t (*)(uint64_t, double, double))((char *)&dword_256DAE970 + dword_256DAE970);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23EAFE37C;
  return v9(a1, a2, a3);
}

uint64_t sub_23EAFE37C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  swift_task_dealloc();
  if (v2)
  {

    a1 = 0;
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t static EnergyServices.energyWindows(for:withSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  *(_QWORD *)(v4 + 16) = a1;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v9;
  *v9 = v4;
  v9[1] = sub_23EAFE464;
  return sub_23EAFB0EC(a1, a2, a3, a4);
}

uint64_t sub_23EAFE464()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_23EAFE4D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EAFE520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EAFE570(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  char v26;
  uint64_t v27;
  char *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;

  v35 = a2;
  v3 = sub_23EB1A63C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E640);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E648);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23EB1A6B4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A7BC();
  sub_23EB1A6A8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    v17 = &qword_25433E648;
    v18 = (uint64_t)v12;
LABEL_18:
    sub_23EAEC540(v18, v17);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  v19 = sub_23EB1A648();
  v20 = v19;
  if (v19)
  {
    v34 = v16;
    v21 = *(_QWORD *)(v19 + 16);
    if (v21)
    {
      v31 = v14;
      v32 = v13;
      v33 = v9;
      v22 = v19 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
      v23 = *(_QWORD *)(v4 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      v30 = v19;
      swift_bridgeObjectRetain();
      while (1)
      {
        v24(v6, v22, v3);
        if (sub_23EB1A624() == a1 && v25 == v35)
          break;
        v26 = sub_23EB1B0F8();
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
          goto LABEL_14;
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        v22 += v23;
        if (!--v21)
        {
          swift_bridgeObjectRelease();
          v27 = 1;
          v9 = v33;
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      v9 = v33;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v33, v6, v3);
      v27 = 0;
LABEL_15:
      v14 = v31;
      v13 = v32;
    }
    else
    {
      v27 = 1;
    }
    v28 = v34;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, v27, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
    {
      v20 = sub_23EB1A630();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v28, v13);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      return v20;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v28, v13);
    v17 = &qword_25433E640;
    v18 = (uint64_t)v9;
    goto LABEL_18;
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v20;
}

uint64_t sub_23EAFE8BC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD v36[2];
  unint64_t v37;
  uint64_t v38;

  v6 = v5;
  v37 = a2;
  v38 = a5;
  v10 = sub_23EB1A594();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23EB1A954();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A93C();
  sub_23EB1A924();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  __swift_instantiateConcreteTypeFromMangledName(qword_25433E858);
  v20 = swift_allocObject();
  v21 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v20 + 16) = xmmword_23EB1B750;
  v22 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v20 + 56) = v21;
  *(_QWORD *)(v20 + 64) = v22;
  *(double *)(v20 + 32) = floor(v19 * 1000.0 / 300000.0) * 300000.0;
  v23 = sub_23EB1ACFC();
  v25 = v24;
  v26 = v37;
  v36[1] = a3;
  v37 = a4;
  sub_23EAFEC74(a1, v26, a3, a4, v23, v25);
  if (v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
    sub_23EAFF7E8();
    if (v28)
    {
      sub_23EB1A570();
      swift_bridgeObjectRelease();
    }
    sub_23EB1A570();
    swift_bridgeObjectRelease();
    sub_23EB1A570();
    swift_bridgeObjectRelease();
    sub_23EB1A570();
    sub_23EB1A570();
    v29 = v38;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v38, v13, v10);
    v30 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_256DAE558 != -1)
      swift_once();
    v31 = sub_23EB1ABAC();
    __swift_project_value_buffer(v31, (uint64_t)qword_256DAEF08);
    v32 = sub_23EB1AB94();
    v33 = sub_23EB1AEA0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_23EAEA000, v32, v33, "Unable to generate HMAC Signature", v34, 2u);
      MEMORY[0x242657DAC](v34, -1, -1);
    }

    v30 = 1;
    v29 = v38;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v29, v30, 1, v10);
}

uint64_t type metadata accessor for HMACConstants()
{
  return objc_opt_self();
}

uint64_t sub_23EAFEC74(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  BOOL v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;

  v126 = a5;
  v127 = a6;
  v128 = a3;
  v129 = a4;
  v123 = a1;
  v124 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E238);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v125 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23EB1AC18();
  v133 = *(_QWORD *)(v9 - 8);
  v134 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v132 = (char *)&v116 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E648);
  MEMORY[0x24BDAC7A8](v11);
  v130 = (char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_23EB1AD14();
  v13 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v15 = (char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23EB1A810();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB1A564();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_23EAEC540((uint64_t)v18, &qword_25433E7A0);
    if (qword_256DAE558 != -1)
      swift_once();
    v23 = sub_23EB1ABAC();
    __swift_project_value_buffer(v23, (uint64_t)qword_256DAEF08);
    v24 = sub_23EB1AB94();
    v25 = sub_23EB1AEA0();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_23EAEA000, v24, v25, "Unable to retrieve URL from request.", v26, 2u);
      MEMORY[0x242657DAC](v26, -1, -1);
    }

    return 0;
  }
  v119 = v6;
  v28 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v117 = v19;
  v28(v22, v18, v19);
  sub_23EB1A51C();
  v29 = v22;
  v118 = v7;
  if (v30)
  {
    v120 = sub_23EB1AD20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v120 = 0;
  }
  sub_23EB1A7E0();
  v116 = sub_23EB1AD20();
  v122 = v31;
  swift_bridgeObjectRelease();
  v32 = sub_23EB1A540();
  if (v32)
    v33 = v32;
  else
    v33 = MEMORY[0x24BEE4B00];
  sub_23EAFF7E8();
  if (v35)
  {
    v36 = v34;
    v37 = v35;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v137 = v33;
    sub_23EB00FC0(v36, v37, 0xD000000000000016, 0x800000023EB1DC20, isUniquelyReferenced_nonNull_native);
    v33 = v137;
    swift_bridgeObjectRelease();
  }
  v39 = v127;
  swift_bridgeObjectRetain();
  v40 = swift_isUniquelyReferenced_nonNull_native();
  v137 = v33;
  sub_23EB00FC0(v126, v39, 0xD00000000000001BLL, 0x800000023EB1DBC0, v40);
  v41 = v137;
  swift_bridgeObjectRelease();
  v42 = v129;
  swift_bridgeObjectRetain();
  v43 = swift_isUniquelyReferenced_nonNull_native();
  v137 = v41;
  sub_23EB00FC0(v128, v42, 0xD00000000000001BLL, 0x800000023EB1DC00, v43);
  v44 = v137;
  swift_bridgeObjectRelease();
  v45 = sub_23EAFFAF0(v44);
  v127 = v46;
  v128 = v45;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E848);
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_23EB1B740;
  sub_23EB1AD08();
  v48 = sub_23EB1ACE4();
  v50 = v49;
  v51 = v131;
  v52 = *(void (**)(char *, uint64_t))(v13 + 8);
  v52(v15, v131);
  v121 = v29;
  if (v50 >> 60 == 15)
  {
    if (qword_256DAE558 != -1)
      swift_once();
    v53 = sub_23EB1ABAC();
    __swift_project_value_buffer(v53, (uint64_t)qword_256DAEF08);
    v54 = sub_23EB1AB94();
    v55 = sub_23EB1AEA0();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_23EAEA000, v54, v55, "String encoding failed. Returning empty string", v56, 2u);
      MEMORY[0x242657DAC](v56, -1, -1);
    }

    v57 = 0;
    v58 = 0xE000000000000000;
  }
  else
  {
    v57 = sub_23EB1A864();
    v58 = v59;
    sub_23EB03144(v48, v50);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v47 + 32) = v57;
  *(_QWORD *)(v47 + 40) = v58;
  sub_23EB1AD08();
  v60 = sub_23EB1ACE4();
  v62 = v61;
  v63 = v52;
  v52(v15, v51);
  if (v62 >> 60 == 15)
  {
    if (qword_256DAE558 != -1)
      swift_once();
    v64 = sub_23EB1ABAC();
    __swift_project_value_buffer(v64, (uint64_t)qword_256DAEF08);
    v65 = sub_23EB1AB94();
    v66 = sub_23EB1AEA0();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_23EAEA000, v65, v66, "String encoding failed. Returning empty string", v67, 2u);
      MEMORY[0x242657DAC](v67, -1, -1);
    }

    v68 = 0;
    v69 = 0xE000000000000000;
  }
  else
  {
    v68 = sub_23EB1A864();
    v69 = v70;
    sub_23EB03144(v60, v62);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v47 + 48) = v68;
  *(_QWORD *)(v47 + 56) = v69;
  v71 = (uint64_t)v130;
  sub_23EB1A684();
  v72 = sub_23EB1A6B4();
  v73 = *(_QWORD *)(v72 - 8);
  v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v71, 1, v72);
  v129 = v20;
  if (v74 == 1)
  {
    sub_23EAEC540(v71, &qword_25433E648);
LABEL_41:
    v87 = v124;
    v88 = v125;
    v89 = v123;
    v79 = v128;
    goto LABEL_42;
  }
  v75 = sub_23EB1A660();
  v77 = v76;
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v71, v72);
  if (!v77)
    goto LABEL_41;
  v78 = HIBYTE(v77) & 0xF;
  if ((v77 & 0x2000000000000000) == 0)
    v78 = v75 & 0xFFFFFFFFFFFFLL;
  v79 = v128;
  if (v78)
  {
    sub_23EB1AD08();
    v80 = sub_23EB1ACE4();
    v82 = v81;
    v63(v15, v51);
    if (v82 >> 60 == 15)
    {
      if (qword_256DAE558 != -1)
        swift_once();
      v83 = sub_23EB1ABAC();
      __swift_project_value_buffer(v83, (uint64_t)qword_256DAEF08);
      v84 = sub_23EB1AB94();
      v85 = sub_23EB1AEA0();
      v86 = os_log_type_enabled(v84, v85);
      v87 = v124;
      v88 = v125;
      v89 = v123;
      v90 = v127;
      if (v86)
      {
        v91 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v91 = 0;
        _os_log_impl(&dword_23EAEA000, v84, v85, "String encoding failed. Returning empty string", v91, 2u);
        MEMORY[0x242657DAC](v91, -1, -1);
      }

      v92 = 0;
      v93 = 0xE000000000000000;
    }
    else
    {
      v92 = sub_23EB1A864();
      v93 = v112;
      sub_23EB03144(v80, v82);
      v87 = v124;
      v88 = v125;
      v89 = v123;
      v90 = v127;
    }
    swift_bridgeObjectRelease();
    v114 = *(_QWORD *)(v47 + 16);
    v113 = *(_QWORD *)(v47 + 24);
    if (v114 >= v113 >> 1)
      v47 = (uint64_t)sub_23EB07D48((_QWORD *)(v113 > 1), v114 + 1, 1, (_QWORD *)v47);
    *(_QWORD *)(v47 + 16) = v114 + 1;
    v115 = v47 + 16 * v114;
    *(_QWORD *)(v115 + 32) = v92;
    *(_QWORD *)(v115 + 40) = v93;
    goto LABEL_43;
  }
  swift_bridgeObjectRelease();
  v87 = v124;
  v88 = v125;
  v89 = v123;
LABEL_42:
  v90 = v127;
LABEL_43:
  v95 = *(_QWORD *)(v47 + 16);
  v94 = *(_QWORD *)(v47 + 24);
  if (v95 >= v94 >> 1)
    v47 = (uint64_t)sub_23EB07D48((_QWORD *)(v94 > 1), v95 + 1, 1, (_QWORD *)v47);
  *(_QWORD *)(v47 + 16) = v95 + 1;
  v96 = v47 + 16 * v95;
  *(_QWORD *)(v96 + 32) = v79;
  *(_QWORD *)(v96 + 40) = v90;
  v137 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
  sub_23EB02CD4(&qword_25433E818, &qword_25433E810, MEMORY[0x24BEE12B0]);
  v97 = sub_23EB1ACA8();
  v99 = v98;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v100 = sub_23EAFFF10(v97, v99);
  v131 = v100;
  v102 = v101;
  swift_bridgeObjectRetain();
  v137 = sub_23EAFFF10(v89, v87);
  v138 = v103;
  v104 = v132;
  sub_23EB1AC0C();
  v137 = v100;
  v138 = v102;
  sub_23EB1AC3C();
  sub_23EAEF3B0(&qword_25433E7F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
  sub_23EB02C90();
  v105 = v88;
  sub_23EB1AC24();
  v106 = v119;
  v139 = v119;
  v140 = sub_23EB02CD4(&qword_25433E6F8, &qword_25433E238, MEMORY[0x24BDC6538]);
  v107 = __swift_allocate_boxed_opaque_existential_1(&v137);
  v108 = v118;
  (*(void (**)(uint64_t *, char *, uint64_t))(v118 + 16))(v107, v105, v106);
  __swift_project_boxed_opaque_existential_1(&v137, v139);
  sub_23EB1A774();
  v109 = v135;
  v110 = v136;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v137);
  v27 = sub_23EB1A864();
  sub_23EAF08F4(v109, v110);
  sub_23EAF08F4(v131, v102);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v105, v106);
  (*(void (**)(char *, uint64_t))(v133 + 8))(v104, v134);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v129 + 8))(v121, v117);
  return v27;
}

void sub_23EAFF7E8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v0 = sub_23EB1AC3C();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8];
  MEMORY[0x24BDAC7A8](v0);
  v2 = sub_23EB1AC00();
  MEMORY[0x24BDAC7A8](v2);
  sub_23EB1A57C();
  if (v3 >> 60 == 15)
    v4 = 0xC000000000000000;
  else
    v4 = v3;
  sub_23EAEF3B0(&qword_25433E7F0, v1, MEMORY[0x24BDC6AE8]);
  sub_23EB1ABF4();
  __asm { BR              X10 }
}

uint64_t sub_23EAFF8F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 - 112) = v4;
  *(_WORD *)(v7 - 104) = v5;
  *(_BYTE *)(v7 - 102) = BYTE2(v5);
  *(_BYTE *)(v7 - 101) = BYTE3(v5);
  *(_BYTE *)(v7 - 100) = BYTE4(v5);
  *(_BYTE *)(v7 - 99) = BYTE5(v5);
  sub_23EB1ABDC();
  sub_23EAF08F4(v4, v5);
  sub_23EB1ABE8();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  v8 = sub_23EB00414();
  sub_23EAF08F4(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 120) + 8))(v3, v6);
  return v8;
}

uint64_t sub_23EAFFAF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;

  v2 = sub_23EB1AD14();
  v32 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = 0;
  v38 = 0xE000000000000000;
  v5 = swift_bridgeObjectRetain();
  v35 = sub_23EB0165C(v5);
  sub_23EB01740((uint64_t *)&v35);
  swift_bridgeObjectRelease();
  v6 = v35[2];
  if (v6)
  {
    v30 = v35;
    v31 = v2;
    v7 = v35 + 5;
    do
    {
      if (*(_QWORD *)(a1 + 16))
      {
        v8 = *(v7 - 1);
        v9 = *v7;
        swift_bridgeObjectRetain();
        v10 = sub_23EAEC44C(v8, v9);
        if ((v11 & 1) != 0)
        {
          v12 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v10);
          v13 = v12[1];
          v33 = *v12;
          v34 = v13;
          v35 = 0;
          v36 = 0xE000000000000000;
          swift_bridgeObjectRetain();
          sub_23EB1AD08();
          v14 = sub_23EB1ACE4();
          v16 = v15;
          v17 = *(void (**)(char *, uint64_t))(v32 + 8);
          v17(v4, v2);
          if (v16 >> 60 == 15)
          {
            if (qword_256DAE558 != -1)
              swift_once();
            v18 = sub_23EB1ABAC();
            __swift_project_value_buffer(v18, (uint64_t)qword_256DAEF08);
            v19 = sub_23EB1AB94();
            v20 = sub_23EB1AEA0();
            if (os_log_type_enabled(v19, v20))
            {
              v21 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v21 = 0;
              _os_log_impl(&dword_23EAEA000, v19, v20, "String encoding failed. Returning empty string", v21, 2u);
              MEMORY[0x242657DAC](v21, -1, -1);
            }
            swift_bridgeObjectRelease();

          }
          else
          {
            sub_23EB1A864();
            sub_23EB03144(v14, v16);
            swift_bridgeObjectRelease();
          }
          sub_23EB1AD74();
          swift_bridgeObjectRelease();
          sub_23EB1AD74();
          sub_23EB1AD74();
          swift_bridgeObjectRelease();
          v35 = 0;
          v36 = 0xE000000000000000;
          sub_23EB1AD08();
          v22 = sub_23EB1ACE4();
          v24 = v23;
          v2 = v31;
          v17(v4, v31);
          if (v24 >> 60 == 15)
          {
            if (qword_256DAE558 != -1)
              swift_once();
            v25 = sub_23EB1ABAC();
            __swift_project_value_buffer(v25, (uint64_t)qword_256DAEF08);
            v26 = sub_23EB1AB94();
            v27 = sub_23EB1AEA0();
            if (os_log_type_enabled(v26, v27))
            {
              v28 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v28 = 0;
              _os_log_impl(&dword_23EAEA000, v26, v27, "String encoding failed. Returning empty string", v28, 2u);
              MEMORY[0x242657DAC](v28, -1, -1);
            }
            swift_bridgeObjectRelease();

          }
          else
          {
            sub_23EB1A864();
            sub_23EB03144(v22, v24);
            swift_bridgeObjectRelease();
          }
          sub_23EB1AD74();
          swift_bridgeObjectRelease();
          sub_23EB1AD74();
          sub_23EB1AD74();
        }
        swift_bridgeObjectRelease();
      }
      v7 += 2;
      --v6;
    }
    while (v6);
    swift_release();
    return v37;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t sub_23EAFFF10(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E650);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_23EAEC540((uint64_t)v14, &qword_25433E658);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_23EB1AFF0();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_23EB02FE8(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_23EB1AD98();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_23EB0304C(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_23EB023A8();
    __asm { BR              X12 }
  }
  sub_23EB03158(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_23EB1A774();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t sub_23EB00414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  sub_23EB1AC00();
  sub_23EAEF3B0(&qword_25433E7E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC62E8]);
  v0 = sub_23EB1AC30();
  v2 = sub_23EB02A18(v0, v1);
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_23EB0FE2C(0, v3, 0);
    v4 = 0;
    v5 = MEMORY[0x24BEE42B0];
    do
    {
      v6 = *(_BYTE *)(v2 + v4 + 32);
      __swift_instantiateConcreteTypeFromMangledName(qword_25433E858);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_23EB1B750;
      *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v7 + 64) = v5;
      *(_BYTE *)(v7 + 32) = v6;
      v8 = sub_23EB1ACFC();
      v10 = v9;
      v12 = *(_QWORD *)(v16 + 16);
      v11 = *(_QWORD *)(v16 + 24);
      if (v12 >= v11 >> 1)
        sub_23EB0FE2C(v11 > 1, v12 + 1, 1);
      ++v4;
      *(_QWORD *)(v16 + 16) = v12 + 1;
      v13 = v16 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
    }
    while (v3 != v4);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
  sub_23EB02CD4(&qword_25433E818, &qword_25433E810, MEMORY[0x24BEE12B0]);
  v14 = sub_23EB1ACA8();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_23EB00600(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_23EB1ADC8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x242657560](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_23EB00678(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E728);
  v42 = a2;
  v6 = sub_23EB1B068();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23EB1B158();
    sub_23EB1AC90();
    result = sub_23EB1B170();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23EB0099C(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3A8);
  v42 = a2;
  v6 = sub_23EB1B068();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23EB1B158();
    sub_23EB1AC90();
    result = sub_23EB1B170();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23EB00CC0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEA70);
  v39 = a2;
  result = sub_23EB1B068();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v38 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v21 = v20 | (v8 << 6);
      }
      else
      {
        v22 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v8;
        if (!v23)
        {
          v8 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v8];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              if ((v39 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v36 = 1 << *(_BYTE *)(v5 + 32);
              if (v36 >= 64)
                bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v38 = -1 << v36;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v8 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v8 >= v37)
                  goto LABEL_33;
                v23 = v38[v8];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v8 = v24;
          }
        }
LABEL_30:
        v11 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v8 << 6);
      }
      v29 = 16 * v21;
      v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v29);
      v32 = *v30;
      v31 = v30[1];
      v33 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v29);
      v34 = *v33;
      v35 = v33[1];
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_23EB1B158();
      sub_23EB1AC90();
      result = sub_23EB1B170();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v15 == v26;
          if (v15 == v26)
            v15 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v28 == -1);
        v16 = __clz(__rbit64(~v28)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 16 * v16;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v17);
      *v18 = v32;
      v18[1] = v31;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v17);
      *v19 = v34;
      v19[1] = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_23EB00FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  uint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_23EAEC44C(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_23EB01134();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23EB00678(v17, a5 & 1);
  v23 = sub_23EAEC44C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23EB1B110();
  __break(1u);
  return result;
}

void *sub_23EB01134()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E728);
  v2 = *v0;
  v3 = sub_23EB1B05C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23EB012EC()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3A8);
  v2 = *v0;
  v3 = sub_23EB1B05C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23EB014A4()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEA70);
  v2 = *v0;
  v3 = sub_23EB1B05C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_23EB0165C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E848);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_23EB0281C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23EB0318C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23EB01740(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23EB02D94(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_23EB017A8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23EB017A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_23EB1B0E0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_23EB01E90(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_23EB01F5C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_23EB02394((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_23EB1AE4C();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_23EB1B0F8();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_23EB1B0F8()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_23EB021F4(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_23EB021F4((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_23EB01F5C((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_23EB1B0F8() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_23EB1B044();
  __break(1u);
  return result;
}

uint64_t sub_23EB01E90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_23EB1B0F8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23EB01F5C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_23EB1B0F8() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_23EB1B0F8() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_23EB022EC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

char *sub_23EB021F4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEA68);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23EB022EC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_23EB1B080();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_23EB02394(uint64_t a1)
{
  return sub_23EB021F4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_23EB023A8()
{
  __asm { BR              X11 }
}

_QWORD *sub_23EB02408@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_23EB02698@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23EB02E30(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23EB02EF0((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23EB02F68((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_23EB0270C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_23EB02770(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_23EB1A6D8();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_23EB1A6FC();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_23EB1A6F0();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_23EB0281C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_23EB02A18(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  size_t v13;
  unint64_t v14;
  size_t v15;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *(_QWORD *)(result + 16);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      v6 = result;
      result = swift_bridgeObjectRetain();
      v4 = 0;
      v7 = v3 + 4;
      while (1)
      {
        v8 = *(_BYTE *)(v6 + v5 + 32);
        if (!v4)
        {
          v9 = v3[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_29;
          v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1)
            v11 = 1;
          else
            v11 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25433E850);
          v12 = (_QWORD *)swift_allocObject();
          v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          v12[3] = v13;
          v14 = (unint64_t)(v12 + 4);
          v15 = v3[3] >> 1;
          if (v3[2])
          {
            if (v12 != v3 || v14 >= (unint64_t)v3 + v15 + 32)
              memmove(v12 + 4, v3 + 4, v15);
            v3[2] = 0;
          }
          v7 = (_BYTE *)(v14 + v15);
          v4 = (v13 >> 1) - v15;
          result = swift_release();
          v3 = v12;
        }
        v17 = __OFSUB__(v4--, 1);
        if (v17)
          break;
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  v4 = 0;
LABEL_24:
  v18 = v3[3];
  if (v18 < 2)
    return (uint64_t)v3;
  v19 = v18 >> 1;
  v17 = __OFSUB__(v19, v4);
  v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23EB02B84(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23EB1A6D8();
  if (!result || (result = sub_23EB1A6FC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23EB1A6F0();
      sub_23EB1AC3C();
      sub_23EAEF3B0(&qword_25433E7F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
      return sub_23EB1ABDC();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23EB02C48(uint64_t a1, unint64_t a2)
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

unint64_t sub_23EB02C90()
{
  unint64_t result;

  result = qword_25433E660;
  if (!qword_25433E660)
  {
    result = MEMORY[0x242657D10](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25433E660);
  }
  return result;
}

uint64_t sub_23EB02CD4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242657D10](a3, v6);
    atomic_store(result, a1);
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23EB02D94(uint64_t a1)
{
  return sub_23EB10178(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23EB02DA8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_23EB1AFD8();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23EB02E30(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_23EB02EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23EB1A708();
  swift_allocObject();
  result = sub_23EB1A6CC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23EB1A834();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_23EB02F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23EB1A708();
  swift_allocObject();
  result = sub_23EB1A6CC();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_23EB02FE8(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_23EB02E30(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_23EB02EF0((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_23EB02F68((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_23EB0304C(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_23EB1A708();
      swift_allocObject();
      sub_23EB1A6E4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23EB1A834();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_23EB030E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_23EB0270C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_23EB03170, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_23EB03144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23EAF08F4(a1, a2);
  return a1;
}

uint64_t sub_23EB03158(__int128 *a1, uint64_t a2)
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

uint64_t sub_23EB03170@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23EB02DA8(a1, a2);
}

uint64_t sub_23EB0318C()
{
  return swift_release();
}

uint64_t sub_23EB03194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[15] = a3;
  v8[16] = a4;
  v8[13] = a1;
  v8[14] = a2;
  v8[21] = type metadata accessor for NetworkError(0);
  v8[22] = swift_task_alloc();
  v9 = sub_23EB1A810();
  v8[23] = v9;
  v8[24] = *(_QWORD *)(v9 - 8);
  v8[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E638);
  v8[26] = swift_task_alloc();
  v10 = sub_23EB1A594();
  v8[27] = v10;
  v8[28] = *(_QWORD *)(v10 - 8);
  v8[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EB03270()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 224);
  v19 = *(_QWORD *)(v0 + 216);
  v2 = *(char **)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 144);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 112);
  v7 = *(char **)(v0 + 120);
  type metadata accessor for GridLookupRequest();
  swift_initStackObject();
  sub_23EB1457C(v8, v7, v6, v5, v4, v3, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v2, 1, v19) == 1)
  {
    sub_23EAEC540(*(_QWORD *)(v0 + 208), &qword_25433E638);
    if (qword_25433E350 != -1)
      swift_once();
    v9 = sub_23EB1ABAC();
    __swift_project_value_buffer(v9, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v10 = sub_23EB1AB94();
    v11 = sub_23EB1AEA0();
    v12 = os_log_type_enabled(v10, v11);
    v13 = *(_QWORD *)(v0 + 160);
    if (v12)
    {
      v14 = *(_QWORD *)(v0 + 152);
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v20 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = sub_23EB152C0(v14, v13, &v20);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v10, v11, "Unable generate request URL for Grid ID Lookup | traceId: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v16, -1, -1);
      MEMORY[0x242657DAC](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 56))(*(_QWORD *)(v0 + 104), 1, 1, *(_QWORD *)(v0 + 184));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v17;
    *v17 = v0;
    v17[1] = sub_23EB0354C;
    return sub_23EB1AE7C();
  }
}

uint64_t sub_23EB0354C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 248) = a1;
  *(_QWORD *)(v3 + 256) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EB035B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  unint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  id v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91[2];

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = *(id *)(v0 + 248);
    v4 = objc_msgSend(v2, sel_statusCode);
    if (v4 == (id)304)
    {
      if (qword_25433E350 != -1)
        swift_once();
      v25 = sub_23EB1ABAC();
      __swift_project_value_buffer(v25, (uint64_t)qword_25433F2F8);
      swift_bridgeObjectRetain_n();
      v26 = sub_23EB1AB94();
      v27 = sub_23EB1AE94();
      v28 = os_log_type_enabled(v26, v27);
      v30 = *(_QWORD *)(v0 + 224);
      v29 = *(_QWORD *)(v0 + 232);
      v31 = *(_QWORD *)(v0 + 216);
      v88 = *(_QWORD *)(v0 + 200);
      v90 = *(void **)(v0 + 248);
      v81 = *(_QWORD *)(v0 + 192);
      v85 = *(_QWORD *)(v0 + 184);
      v32 = *(_QWORD *)(v0 + 160);
      if (v28)
      {
        v33 = *(_QWORD *)(v0 + 152);
        v80 = *(_QWORD *)(v0 + 224);
        v34 = (uint8_t *)swift_slowAlloc();
        v79 = v31;
        v35 = swift_slowAlloc();
        v91[0] = v35;
        *(_DWORD *)v34 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 88) = sub_23EB152C0(v33, v32, v91);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v26, v27, "Geohash File unmodified. Use existing file on disk. | traceId: %s", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v35, -1, -1);
        MEMORY[0x242657DAC](v34, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v88, v85);
        (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v29, v79);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v88, v85);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 56))(*(_QWORD *)(v0 + 104), 1, 1, *(_QWORD *)(v0 + 184));
      goto LABEL_26;
    }
    if (v4 == (id)200)
    {
      if (qword_25433E350 != -1)
        swift_once();
      v5 = sub_23EB1ABAC();
      __swift_project_value_buffer(v5, (uint64_t)qword_25433F2F8);
      swift_bridgeObjectRetain_n();
      v6 = sub_23EB1AB94();
      v7 = sub_23EB1AE94();
      v8 = os_log_type_enabled(v6, v7);
      v9 = *(void **)(v0 + 248);
      v11 = *(_QWORD *)(v0 + 224);
      v10 = *(_QWORD *)(v0 + 232);
      v12 = *(_QWORD *)(v0 + 216);
      v13 = *(_QWORD *)(v0 + 160);
      if (v8)
      {
        v89 = *(_QWORD *)(v0 + 224);
        v14 = *(_QWORD *)(v0 + 152);
        v87 = *(_QWORD *)(v0 + 216);
        v15 = (uint8_t *)swift_slowAlloc();
        v84 = v10;
        v16 = swift_slowAlloc();
        v91[0] = v16;
        *(_DWORD *)v15 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 96) = sub_23EB152C0(v14, v13, v91);
        sub_23EB1AF18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23EAEA000, v6, v7, "New Geo Tile fetched | traceId: %s", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242657DAC](v16, -1, -1);
        MEMORY[0x242657DAC](v15, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v84, v87);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
      }
      v49 = *(_QWORD *)(v0 + 192);
      v50 = *(_QWORD *)(v0 + 184);
      v51 = *(_QWORD *)(v0 + 104);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v49 + 32))(v51, *(_QWORD *)(v0 + 200), v50);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v49 + 56))(v51, 0, 1, v50);
LABEL_26:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void *))(v0 + 8))(v2);
    }
    if (qword_25433E350 != -1)
      swift_once();
    v36 = sub_23EB1ABAC();
    __swift_project_value_buffer(v36, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v37 = sub_23EB1AB94();
    v38 = sub_23EB1AEA0();
    v39 = os_log_type_enabled(v37, v38);
    v40 = *(_QWORD *)(v0 + 160);
    if (v39)
    {
      v82 = *(_QWORD *)(v0 + 152);
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v91[0] = v42;
      *(_DWORD *)v41 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 80) = sub_23EB152C0(v82, v40, v91);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v37, v38, "Error while checking for geohash tiles | traceId: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v42, -1, -1);
      MEMORY[0x242657DAC](v41, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v53 = *(id *)(v0 + 248);
    v54 = objc_msgSend(v2, sel_description);
    v55 = sub_23EB1ACD8();
    v57 = v56;

    swift_bridgeObjectRetain();
    v58 = sub_23EB1AB94();
    v59 = sub_23EB1AEA0();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v61 = swift_slowAlloc();
      v91[0] = v61;
      *(_DWORD *)v60 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 72) = sub_23EB152C0(v55, v57, v91);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v58, v59, "%s", v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v61, -1, -1);
      MEMORY[0x242657DAC](v60, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v62 = *(void **)(v0 + 248);
    v64 = *(_QWORD *)(v0 + 192);
    v63 = *(_QWORD *)(v0 + 200);
    v65 = *(_QWORD *)(v0 + 184);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v47 = (void *)swift_allocError();
    *v66 = objc_msgSend(v2, sel_statusCode);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
  }
  else
  {
    if (qword_25433E350 != -1)
      swift_once();
    v17 = sub_23EB1ABAC();
    __swift_project_value_buffer(v17, (uint64_t)qword_25433F2F8);
    swift_bridgeObjectRetain_n();
    v18 = sub_23EB1AB94();
    v19 = sub_23EB1AEA0();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(_QWORD *)(v0 + 160);
    if (v20)
    {
      v22 = *(_QWORD *)(v0 + 152);
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v91[0] = v24;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = sub_23EB152C0(v22, v21, v91);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v18, v19, "Unable to process GeoTiles Response. | traceId: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v24, -1, -1);
      MEMORY[0x242657DAC](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v43 = *(void **)(v0 + 248);
    v45 = *(_QWORD *)(v0 + 192);
    v44 = *(_QWORD *)(v0 + 200);
    v46 = *(_QWORD *)(v0 + 184);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v47 = (void *)swift_allocError();
    *v48 = 2;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  if (qword_25433E350 != -1)
    swift_once();
  v67 = sub_23EB1ABAC();
  __swift_project_value_buffer(v67, (uint64_t)qword_25433F2F8);
  swift_bridgeObjectRetain();
  v68 = v47;
  swift_bridgeObjectRetain();
  v69 = v47;
  v70 = sub_23EB1AB94();
  v71 = sub_23EB1AEA0();
  v72 = os_log_type_enabled(v70, v71);
  v73 = *(_QWORD *)(v0 + 160);
  if (v72)
  {
    v83 = *(_QWORD *)(v0 + 152);
    v74 = swift_slowAlloc();
    v75 = (_QWORD *)swift_slowAlloc();
    v86 = swift_slowAlloc();
    v91[0] = v86;
    *(_DWORD *)v74 = 138412546;
    v76 = v47;
    v77 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v77;
    sub_23EB1AF18();
    *v75 = v77;

    *(_WORD *)(v74 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_23EB152C0(v83, v73, v91);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v70, v71, "Error while trying to fetch geohash tiles from server %@ | traceId: %s", (uint8_t *)v74, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v75, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v86, -1, -1);
    MEMORY[0x242657DAC](v74, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  *(_QWORD *)(v0 + 40) = v47;
  v78 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
  if (swift_dynamicCast())
  {
    sub_23EB0610C(*(_QWORD *)(v0 + 176));
    swift_willThrow();
  }
  else
  {
    sub_23EB104B4(v47);
    swift_willThrow();

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB04294()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 256);
  if (qword_25433E350 != -1)
    swift_once();
  v2 = sub_23EB1ABAC();
  __swift_project_value_buffer(v2, (uint64_t)qword_25433F2F8);
  swift_bridgeObjectRetain();
  v3 = v1;
  swift_bridgeObjectRetain();
  v4 = v1;
  v5 = sub_23EB1AB94();
  v6 = sub_23EB1AEA0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 160);
  if (v7)
  {
    v15 = *(_QWORD *)(v0 + 152);
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17 = v16;
    *(_DWORD *)v9 = 138412546;
    v11 = v1;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v12;
    sub_23EB1AF18();
    *v10 = v12;

    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_23EB152C0(v15, v8, &v17);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23EAEA000, v5, v6, "Error while trying to fetch geohash tiles from server %@ | traceId: %s", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v16, -1, -1);
    MEMORY[0x242657DAC](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  *(_QWORD *)(v0 + 40) = v1;
  v13 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
  if (swift_dynamicCast())
  {
    sub_23EB0610C(*(_QWORD *)(v0 + 176));
    swift_willThrow();
  }
  else
  {
    sub_23EB104B4(v1);
    swift_willThrow();

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23EB045B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  void (**v7)(char *, uint64_t, uint64_t);
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
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  __int128 v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  os_log_type_t v52;
  uint8_t *v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  id v65;
  id v66;
  os_log_type_t v67;
  void *v68;
  uint8_t *v69;
  _QWORD *v70;
  id v71;
  uint64_t v72;
  _QWORD v73[2];
  __int128 v74;
  unint64_t *v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  uint8_t *v79;
  id v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  NSObject *v94;

  v6 = sub_23EB1A810();
  v7 = *(void (***)(char *, uint64_t, uint64_t))(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23EB1AD14();
  v86 = *(_QWORD *)(v10 - 8);
  v87 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v81 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v85 = (char *)v73 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v73 - v15;
  if (qword_25433E350 != -1)
LABEL_44:
    swift_once();
  v17 = sub_23EB1ABAC();
  v89 = __swift_project_value_buffer(v17, (uint64_t)qword_25433F2F8);
  v18 = sub_23EB1AB94();
  v19 = sub_23EB1AE88();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_23EAEA000, v18, v19, "Generating individual geohash tiles from parent geohash.", v20, 2u);
    MEMORY[0x242657DAC](v20, -1, -1);
  }

  v21 = sub_23EB1A7E0();
  v23 = v22;
  sub_23EB1AD08();
  type metadata accessor for StreamReader();
  swift_allocObject();
  v24 = sub_23EB1A18C(v21, v23, 10, 0xE100000000000000, (uint64_t)v16, 4096);
  if (v24)
  {
    v16 = (char *)v24;
    if (qword_25433E340 != -1)
      swift_once();
    v93 = qword_25433F2E8;
    v94 = unk_25433F2F0;
    swift_bridgeObjectRetain();
    sub_23EAEBE28();
    sub_23EB1AD74();
    swift_bridgeObjectRelease();
    sub_23EB1AD74();
    sub_23EB1AD74();
    v25 = v94;
    v26 = sub_23EB09234();
    swift_bridgeObjectRelease();
    if ((v26 & 1) != 0)
    {
      v76 = a2;
      v77 = a3;
      v80 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      a2 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
      if (!*(_QWORD *)&v16[OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle])
      {
LABEL_41:
        __break(1u);
LABEL_42:
        swift_release();

        goto LABEL_17;
      }
      LODWORD(v79) = 0;
      v78 = 0;
      v28 = &v16[OBJC_IVAR____TtC12HomeServices12StreamReader_delimData];
      v83 = &v16[OBJC_IVAR____TtC12HomeServices12StreamReader_encoding];
      v88 = OBJC_IVAR____TtC12HomeServices12StreamReader_atEof;
      v84 = OBJC_IVAR____TtC12HomeServices12StreamReader_buffer;
      v90 = OBJC_IVAR____TtC12HomeServices12StreamReader_chunkSize;
      v75 = &v92;
      *(_QWORD *)&v27 = 136315138;
      v74 = v27;
      v73[1] = MEMORY[0x24BEE4AD8] + 8;
      v82 = &v16[OBJC_IVAR____TtC12HomeServices12StreamReader_delimData];
      while (1)
      {
        if ((v16[v88] & 1) != 0)
        {
LABEL_35:
          v61 = sub_23EB1AB94();
          v62 = sub_23EB1AEB8();
          if (os_log_type_enabled(v61, v62))
          {
            v63 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v63 = 0;
            _os_log_impl(&dword_23EAEA000, v61, v62, "Wrote all geohash tile to disk.", v63, 2u);
            MEMORY[0x242657DAC](v63, -1, -1);
          }

          swift_release();
          v38 = (char)v79;
          return v38 & 1;
        }
        v39 = *(void **)&v16[v84];
        if (!v39)
          goto LABEL_46;
        if (*((_QWORD *)v28 + 1) >> 60 == 15)
          goto LABEL_47;
        v40 = (void *)sub_23EB1A858();
        v7 = (void (**)(char *, uint64_t, uint64_t))objc_msgSend(v39, sel_rangeOfData_options_range_, v40, 0, 0, objc_msgSend(v39, sel_length));
        v42 = v41;

        if (v7 == (void (**)(char *, uint64_t, uint64_t))sub_23EB1A510())
        {
          v43 = *(void **)&v16[a2];
          if (v43)
          {
            v44 = objc_msgSend(v43, sel_readDataOfLength_, *(_QWORD *)&v16[v90]);
            sub_23EB1A870();
            v46 = v45;

            __asm { BR              X9 }
          }
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          JUMPOUT(0x23EB052B8);
        }
        v47 = objc_msgSend(v39, sel_subdataWithRange_, 0, v7);
        v9 = (char *)sub_23EB1A870();
        a3 = v48;

        v6 = (uint64_t)v85;
        (*(void (**)(char *, char *, uint64_t))(v86 + 16))(v85, v83, v87);
        v49 = sub_23EB1ACF0();
        a1 = v50;
        sub_23EAF08F4((uint64_t)v9, a3);
        if (__OFADD__(v7, v42))
        {
          __break(1u);
          goto LABEL_44;
        }
        objc_msgSend(v39, sel_replaceBytesInRange_withBytes_length_, 0, (char *)v7 + v42, 0, 0);
        v28 = v82;
        if (!a1)
          goto LABEL_35;
        sub_23EB0967C(v49, a1);
        if (v51)
        {
          v93 = qword_25433F2E8;
          v94 = unk_25433F2F0;
          swift_bridgeObjectRetain();
          sub_23EAEBE28();
          sub_23EB1AD74();
          swift_bridgeObjectRelease();
          sub_23EB1AD74();
          sub_23EB1AD74();
          sub_23EB1AD74();
          sub_23EB1AD74();
          sub_23EB1AD74();
          swift_bridgeObjectRelease();
          v55 = v93;
          v54 = (unint64_t)v94;
          v93 = v49;
          v94 = a1;
          v91 = v55;
          v92 = v54;
          v56 = v81;
          sub_23EB1AD08();
          sub_23EAF09E8();
          v26 = v78;
          sub_23EB1AF48();
          if (v26)
          {
            (*(void (**)(char *, uint64_t))(v86 + 8))(v56, v87);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v65 = v26;
            v66 = v26;
            v25 = sub_23EB1AB94();
            v67 = sub_23EB1AEA0();
            if (!os_log_type_enabled(v25, v67))
              goto LABEL_42;
            v68 = v26;
            v69 = (uint8_t *)swift_slowAlloc();
            v70 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v69 = 138412290;
            v71 = v68;
            v72 = _swift_stdlib_bridgeErrorToNSError();
            v93 = v72;
            sub_23EB1AF18();
            *v70 = v72;

            _os_log_impl(&dword_23EAEA000, v25, v67, "Error while trying to geohash String to file %@", v69, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
            swift_arrayDestroy();
            MEMORY[0x242657DAC](v70, -1, -1);
            MEMORY[0x242657DAC](v69, -1, -1);

            swift_release();
            goto LABEL_17;
          }
          v78 = 0;
          (*(void (**)(char *, uint64_t))(v86 + 8))(v56, v87);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain_n();
          v57 = sub_23EB1AB94();
          v58 = sub_23EB1AE94();
          v26 = (id)v58;
          if (os_log_type_enabled(v57, v58))
          {
            v59 = (uint8_t *)swift_slowAlloc();
            v60 = swift_slowAlloc();
            v93 = v60;
            *(_DWORD *)v59 = v74;
            v79 = v59 + 4;
            swift_bridgeObjectRetain();
            v91 = sub_23EB152C0(v55, v54, &v93);
            sub_23EB1AF18();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23EAEA000, v57, (os_log_type_t)v26, "Successfully wrote to %s", v59, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x242657DAC](v60, -1, -1);
            MEMORY[0x242657DAC](v59, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          v25 = sub_23EB1ACCC();
          swift_bridgeObjectRelease();
          LODWORD(v79) = objc_msgSend(v80, sel_fileExistsAtPath_, v25);
        }
        else
        {
          swift_bridgeObjectRelease();
          v25 = sub_23EB1AB94();
          v52 = sub_23EB1AEA0();
          v26 = (id)v52;
          if (os_log_type_enabled(v25, v52))
          {
            v53 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v53 = 0;
            _os_log_impl(&dword_23EAEA000, v25, (os_log_type_t)v26, "Unable to find file name for the geo hash string", v53, 2u);
            MEMORY[0x242657DAC](v53, -1, -1);
          }
        }

        if (!*(_QWORD *)&v16[a2])
          goto LABEL_41;
      }
    }
    v35 = sub_23EB1AB94();
    v36 = sub_23EB1AEA0();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_23EAEA000, v35, v36, "Unable to create directory for saving GeoHash Polygons", v37, 2u);
      MEMORY[0x242657DAC](v37, -1, -1);
    }
    swift_release();

  }
  else
  {
    v7[2](v9, a1, v6);
    v29 = sub_23EB1AB94();
    v30 = sub_23EB1AEA0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v93 = v32;
      *(_DWORD *)v31 = 136315138;
      v33 = sub_23EB1A7E0();
      v91 = sub_23EB152C0(v33, v34, &v93);
      sub_23EB1AF18();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v7[1])(v9, v6);
      _os_log_impl(&dword_23EAEA000, v29, v30, "Unable to open file stream for file :%s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v32, -1, -1);
      MEMORY[0x242657DAC](v31, -1, -1);
    }
    else
    {
      ((void (*)(char *, uint64_t))v7[1])(v9, v6);
    }

  }
LABEL_17:
  v38 = 0;
  return v38 & 1;
}

uint64_t sub_23EB052C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  uint8_t *v19;
  uint8_t *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  const void *v27;
  char *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t *boxed_opaque_existential_1;
  __CFString *v32;
  const void *v33;
  __CFString *v34;
  __CFString *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _QWORD v39[2];
  uint64_t v40[3];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23EB1A954();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25433E350 != -1)
    swift_once();
  v13 = sub_23EB1ABAC();
  __swift_project_value_buffer(v13, (uint64_t)qword_25433F2F8);
  v14 = sub_23EB1AB94();
  v15 = sub_23EB1AE88();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v39[1] = a1;
    v17 = a2;
    v18 = v12;
    v19 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_23EAEA000, v14, v15, "Trying to save metadata about downloaded geohash tile.", v16, 2u);
    v20 = v19;
    v12 = v18;
    a2 = v17;
    MEMORY[0x242657DAC](v20, -1, -1);
  }

  sub_23EAF13D4((uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_23EAEC540((uint64_t)v8, (uint64_t *)&unk_25433E788);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  v22 = sub_23EAF14F8();
  if (v23)
  {
    v24 = v22;
    v25 = v23;
    v42 = a2;
    v43 = a3;
    v44 = 0u;
    v45 = 0u;
    swift_bridgeObjectRetain();
    sub_23EAF0A68();
    v41 = MEMORY[0x24BEE0D00];
    v40[0] = v24;
    v40[1] = v25;
    v26 = (__CFString *)sub_23EB1ACCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E780);
    v27 = (const void *)sub_23EB1AF00();
    v28 = v12;
    v29 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesSetAppValue(v26, v27, v29);

    swift_unknownObjectRelease();
    v12 = v28;
    v30 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesAppSynchronize(v30);
    swift_bridgeObjectRelease();

    sub_23EAEC540((uint64_t)v40, &qword_25433E780);
    sub_23EAF0B54();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v41 = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v28, v9);
    v32 = (__CFString *)sub_23EB1ACCC();
    v33 = (const void *)sub_23EB1AF00();
    v34 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesSetAppValue(v32, v33, v34);

    swift_unknownObjectRelease();
    v35 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesAppSynchronize(v35);
    swift_bridgeObjectRelease();

    sub_23EAEC540((uint64_t)v40, &qword_25433E780);
    v36 = sub_23EB1AB94();
    v37 = sub_23EB1AEB8();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_23EAEA000, v36, v37, "Saved metadata about downloaded geohash tile to defaults", v38, 2u);
      MEMORY[0x242657DAC](v38, -1, -1);
    }

  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_23EB056F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v10[5];
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = sub_23EB1AC3C();
  v10[3] = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_23EB1AC00();
  v10[1] = *(_QWORD *)(v1 - 8);
  v10[2] = v1;
  MEMORY[0x24BDAC7A8](v1);
  v10[0] = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23EB1AD14();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_23EB1AFCC();
  swift_bridgeObjectRelease();
  v11 = 0xD000000000000027;
  v12 = 0x800000023EB1DCF0;
  sub_23EAEBE28();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_23EB1AE58();
  sub_23EB1AD74();
  sub_23EB1AE58();
  sub_23EB1AD74();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  sub_23EB1AD08();
  sub_23EB1ACE4();
  v8 = v7;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v8 >> 60 != 15)
  {
    sub_23EAEF3B0(&qword_25433E7F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    sub_23EB1ABF4();
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t sub_23EB05B44()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  CFPropertyListRef v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v16;

  sub_23EB056F0();
  if (!v0)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v14 = sub_23EB1ABAC();
    __swift_project_value_buffer(v14, (uint64_t)qword_25433F2F8);
    v10 = sub_23EB1AB94();
    v11 = sub_23EB1AEA0();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_18;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "Unable to generate key for looking up grid info.";
    goto LABEL_17;
  }
  v1 = (__CFString *)sub_23EB1ACCC();
  v2 = (__CFString *)sub_23EB1ACCC();
  v3 = CFPreferencesCopyAppValue(v1, v2);
  swift_bridgeObjectRelease();

  if (!v3 || (swift_dynamicCast() & 1) == 0)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v9 = sub_23EB1ABAC();
    __swift_project_value_buffer(v9, (uint64_t)qword_25433F2F8);
    v10 = sub_23EB1AB94();
    v11 = sub_23EB1AEA0();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_18;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    v13 = "Unable to lookup computed grid from disk.";
LABEL_17:
    _os_log_impl(&dword_23EAEA000, v10, v11, v13, v12, 2u);
    MEMORY[0x242657DAC](v12, -1, -1);
LABEL_18:

    return 0;
  }
  v4 = v16;
  if (qword_25433E350 != -1)
    swift_once();
  v5 = sub_23EB1ABAC();
  __swift_project_value_buffer(v5, (uint64_t)qword_25433F2F8);
  v6 = sub_23EB1AB94();
  v7 = sub_23EB1AEB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23EAEA000, v6, v7, "Successfully retrieved computed grid from disk.", v8, 2u);
    MEMORY[0x242657DAC](v8, -1, -1);
  }

  return v4;
}

uint64_t sub_23EB05DE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23EB02C48(a1, a2);
  return a1;
}

void sub_23EB05DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __CFString *v5;
  const void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  const char *v16;
  uint64_t v17;
  NSObject *oslog;
  _QWORD v19[4];

  if (!a2)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v13 = sub_23EB1ABAC();
    __swift_project_value_buffer(v13, (uint64_t)qword_25433F2F8);
    oslog = sub_23EB1AB94();
    v14 = sub_23EB1AEA0();
    if (!os_log_type_enabled(oslog, v14))
      goto LABEL_17;
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    v16 = "No grid information to save.";
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  sub_23EB056F0();
  if (!v4)
  {
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
      swift_once();
    v17 = sub_23EB1ABAC();
    __swift_project_value_buffer(v17, (uint64_t)qword_25433F2F8);
    oslog = sub_23EB1AB94();
    v14 = sub_23EB1AEA0();
    if (!os_log_type_enabled(oslog, v14))
      goto LABEL_17;
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    v16 = "Unable to generate key for saving grid info.";
LABEL_16:
    _os_log_impl(&dword_23EAEA000, oslog, v14, v16, v15, 2u);
    MEMORY[0x242657DAC](v15, -1, -1);
LABEL_17:

    return;
  }
  v19[3] = MEMORY[0x24BEE0D00];
  v19[0] = a1;
  v19[1] = a2;
  v5 = (__CFString *)sub_23EB1ACCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E780);
  v6 = (const void *)sub_23EB1AF00();
  v7 = (__CFString *)sub_23EB1ACCC();
  CFPreferencesSetAppValue(v5, v6, v7);

  swift_unknownObjectRelease();
  v8 = (__CFString *)sub_23EB1ACCC();
  CFPreferencesAppSynchronize(v8);
  swift_bridgeObjectRelease();

  sub_23EAEC540((uint64_t)v19, &qword_25433E780);
  if (qword_25433E350 != -1)
    swift_once();
  v9 = sub_23EB1ABAC();
  __swift_project_value_buffer(v9, (uint64_t)qword_25433F2F8);
  v10 = sub_23EB1AB94();
  v11 = sub_23EB1AEB8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23EAEA000, v10, v11, "Saved computed grid for coordinate value.", v12, 2u);
    MEMORY[0x242657DAC](v12, -1, -1);
  }

}

uint64_t sub_23EB0610C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NetworkError(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::String __swiftcall CLLocationCoordinate2D.geohash(length:)(Swift::Int length)
{
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t inited;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Swift::String result;

  v3 = v2;
  v4 = v1;
  type metadata accessor for Geohash();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_QWORD *)(inited + 24) = 0;
  v7 = sub_23EB064F0(length, v4, v3);
  v9 = v8;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = v7;
  v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t type metadata accessor for Geohash()
{
  return objc_opt_self();
}

int64_t sub_23EB061F0(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

Swift::String __swiftcall CLLocation.geohash(length:)(Swift::Int length)
{
  void *v1;
  uint64_t inited;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Swift::String result;

  type metadata accessor for Geohash();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_QWORD *)(inited + 24) = 0;
  objc_msgSend(v1, sel_coordinate);
  v5 = v4;
  objc_msgSend(v1, sel_coordinate);
  v7 = sub_23EB064F0(length, v5, v6);
  v9 = v8;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = v7;
  v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

CLLocation __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CLLocation.init(geohash:)(Swift::String geohash)
{
  uint64_t v1;
  objc_class *object;
  uint64_t countAndFlagsBits;
  uint64_t inited;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_class *v14;
  CLLocation result;

  object = (objc_class *)geohash._object;
  countAndFlagsBits = geohash._countAndFlagsBits;
  type metadata accessor for Geohash();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_QWORD *)(inited + 24) = 0;
  sub_23EB06E70(countAndFlagsBits, (unint64_t)object);
  if (v1)
  {
    swift_setDeallocating();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v5;
    v11 = v6;
    v12 = v7;
    v13 = v8;
    swift_bridgeObjectRelease();
    object = (objc_class *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLatitude_longitude_, (v10 + v11) * 0.5, (v12 + v13) * 0.5);
    swift_setDeallocating();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = object;
  result._internal = v9;
  result.super.isa = v14;
  return result;
}

uint64_t static Geohash.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t Geohash.Error.hash(into:)()
{
  return sub_23EB1B164();
}

uint64_t Geohash.Error.hashValue.getter()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EB06450()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EB06490()
{
  return sub_23EB1B164();
}

uint64_t sub_23EB064B4()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EB064F0(uint64_t result, double a2, double a3)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  _QWORD *v8;
  double v9;
  double v10;
  _QWORD *v11;
  _QWORD *v12;
  double v13;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  _QWORD *v24;
  double v25;
  double v26;
  _QWORD *v27;
  _QWORD *v28;
  double v29;
  char v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  int64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  int64_t v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v4 = ceil((double)result * 5.0 * 0.5);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_77:
    __break(1u);
    return result;
  }
  v75 = result;
  v78 = (uint64_t)v4;
  v5 = sub_23EB06C84((uint64_t)v4, a2);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (double *)(v5 + 32);
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v9 = -90.0;
    v10 = 90.0;
    do
    {
      v13 = *v7;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v15 = v8;
      if (v13 >= (v10 + v9) * 0.5)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v15 = sub_23EB07D48(0, v8[2] + 1, 1, v8);
        v20 = v15[2];
        v19 = v15[3];
        if (v20 >= v19 >> 1)
          v15 = sub_23EB07D48((_QWORD *)(v19 > 1), v20 + 1, 1, v15);
        v15[2] = v20 + 1;
        v11 = &v15[2 * v20];
        v11[4] = 49;
        v12 = v11 + 4;
        v9 = (v10 + v9) * 0.5;
      }
      else
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v15 = sub_23EB07D48(0, v8[2] + 1, 1, v8);
        v17 = v15[2];
        v16 = v15[3];
        if (v17 >= v16 >> 1)
          v15 = sub_23EB07D48((_QWORD *)(v16 > 1), v17 + 1, 1, v15);
        v15[2] = v17 + 1;
        v18 = &v15[2 * v17];
        v18[4] = 48;
        v12 = v18 + 4;
        v10 = (v10 + v9) * 0.5;
      }
      v12[1] = 0xE100000000000000;
      swift_bridgeObjectRelease();
      ++v7;
      v8 = v15;
      --v6;
    }
    while (v6);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v21 = sub_23EB06C84(v78, a3);
  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v23 = (double *)(v21 + 32);
    v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v25 = -180.0;
    v26 = 180.0;
    do
    {
      v29 = *v23;
      swift_bridgeObjectRetain();
      v30 = swift_isUniquelyReferenced_nonNull_native();
      v31 = v24;
      if (v29 >= (v26 + v25) * 0.5)
      {
        if ((v30 & 1) == 0)
          v31 = sub_23EB07D48(0, v24[2] + 1, 1, v24);
        v36 = v31[2];
        v35 = v31[3];
        if (v36 >= v35 >> 1)
          v31 = sub_23EB07D48((_QWORD *)(v35 > 1), v36 + 1, 1, v31);
        v31[2] = v36 + 1;
        v27 = &v31[2 * v36];
        v27[4] = 49;
        v28 = v27 + 4;
        v25 = (v26 + v25) * 0.5;
      }
      else
      {
        if ((v30 & 1) == 0)
          v31 = sub_23EB07D48(0, v24[2] + 1, 1, v24);
        v33 = v31[2];
        v32 = v31[3];
        if (v33 >= v32 >> 1)
          v31 = sub_23EB07D48((_QWORD *)(v32 > 1), v33 + 1, 1, v31);
        v31[2] = v33 + 1;
        v34 = &v31[2 * v33];
        v34[4] = 48;
        v28 = v34 + 4;
        v26 = (v26 + v25) * 0.5;
      }
      v28[1] = 0xE100000000000000;
      swift_bridgeObjectRelease();
      ++v23;
      v24 = v31;
      --v22;
    }
    while (v22);
  }
  else
  {
    v31 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v77 = v31[2];
  if (v77)
  {
    result = swift_bridgeObjectRetain();
    v37 = 0;
    v38 = 0;
    v39 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v76 = v15;
    while (v38 < v15[2])
    {
      v40 = v39[2];
      v41 = v40 + 2;
      if (__OFADD__(v40, 2))
        goto LABEL_72;
      v42 = v31[v37 + 4];
      v43 = v31[v37 + 5];
      v44 = v15[v37 + 5];
      v79 = v15[v37 + 4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45 = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)v45 || v41 > v39[3] >> 1)
      {
        if (v40 <= v41)
          v46 = v40 + 2;
        else
          v46 = v40;
        v39 = sub_23EB07D48(v45, v46, 1, v39);
      }
      v48 = v39[2];
      v47 = v39[3];
      v49 = v48 + 1;
      swift_bridgeObjectRetain();
      if (v48 >= v47 >> 1)
        v39 = sub_23EB07D48((_QWORD *)(v47 > 1), v48 + 1, 1, v39);
      v39[2] = v49;
      v50 = &v39[2 * v48];
      v50[4] = v42;
      v50[5] = v43;
      v51 = v39[3];
      swift_bridgeObjectRetain();
      if (v49 >= v51 >> 1)
        v39 = sub_23EB07D48((_QWORD *)(v51 > 1), v48 + 2, 1, v39);
      v15 = v76;
      ++v38;
      v39[2] = v48 + 2;
      v52 = &v39[2 * v49];
      v52[4] = v79;
      v52[5] = v44;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v37 += 2;
      if (v77 == v38)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  swift_bridgeObjectRelease();
  v39 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_51:
  swift_bridgeObjectRelease();
  v53 = v39[2];
  if (v53)
  {
    swift_bridgeObjectRetain();
    v54 = 0;
    v55 = 0;
    v56 = v39 + 5;
    v57 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      result = sub_23EB1ADF8();
      v59 = result;
      v61 = v60;
      if (v54 + 5 * (v55 / 5))
      {
        if (!v57[2])
          goto LABEL_73;
        result = swift_isUniquelyReferenced_nonNull_native();
        v62 = v57;
        if ((result & 1) != 0)
        {
          v63 = v57[2];
          if (!v63)
            goto LABEL_74;
        }
        else
        {
          result = (uint64_t)sub_23EB08068(v57);
          v62 = (_QWORD *)result;
          v63 = *(_QWORD *)(result + 16);
          if (!v63)
            goto LABEL_74;
        }
        v64 = v63 - 1;
        v65 = &v62[2 * v64];
        v67 = v65[4];
        v66 = v65[5];
        v62[2] = v64;
        v80 = v67;
        v81 = v66;
        sub_23EB1AD74();
        swift_bridgeObjectRelease();
        v69 = v62[2];
        v68 = v62[3];
        if (v69 >= v68 >> 1)
          v62 = sub_23EB07D48((_QWORD *)(v68 > 1), v69 + 1, 1, v62);
        v62[2] = v69 + 1;
        v58 = &v62[2 * v69];
        v58[4] = v80;
        v58[5] = v81;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v57 = v62;
      }
      else
      {
        v70 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v70 = sub_23EB07D48(0, v57[2] + 1, 1, v57);
        v72 = v70[2];
        v71 = v70[3];
        if (v72 >= v71 >> 1)
          v70 = sub_23EB07D48((_QWORD *)(v71 > 1), v72 + 1, 1, v70);
        v70[2] = v72 + 1;
        v73 = &v70[2 * v72];
        v73[4] = v59;
        v73[5] = v61;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v57 = v70;
      }
      v56 += 2;
      ++v55;
      --v54;
      --v53;
    }
    while (v53);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v57 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_retain();
  v74 = sub_23EB08594((uint64_t)v57);
  swift_bridgeObjectRelease();
  swift_release();
  sub_23EB061F0(v75, (uint64_t)v74);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3A0);
  sub_23EB02CD4(&qword_25433E398, &qword_25433E3A0, MEMORY[0x24BEE2180]);
  return sub_23EB1ADEC();
}

uint64_t sub_23EB06C84(unint64_t a1, double a2)
{
  uint64_t result;
  double *v4;
  unint64_t v5;
  double v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = sub_23EB1B044();
    __break(1u);
    return result;
  }
  if (!a1)
    return MEMORY[0x24BEE4AF8];
  result = sub_23EB1AE4C();
  *(_QWORD *)(result + 16) = a1;
  v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    v5 = 0;
    v6 = a2;
LABEL_9:
    v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  v6 = a2;
  v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  v8 = (int64x2_t *)(result + 48);
  v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1)
    goto LABEL_9;
  return result;
}

double sub_23EB06D74(double a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  double v8;
  uint64_t v9;

  swift_bridgeObjectRetain();
  v4 = sub_23EB1AD8C();
  if (v5)
  {
    v6 = v5;
    do
    {
      v8 = (a1 + a2) * 0.5;
      if (v4 == 49 && v6 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v7 = sub_23EB1B0F8();
        swift_bridgeObjectRelease();
        if ((v7 & 1) == 0)
        {
          a2 = (a1 + a2) * 0.5;
          v8 = a1;
        }
      }
      v4 = sub_23EB1AD8C();
      v6 = v9;
      a1 = v8;
    }
    while (v9);
  }
  else
  {
    v8 = a1;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23EB06E70(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t *v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  swift_bridgeObjectRetain();
  v4 = sub_23EB1AD50();
  if (v4)
  {
    v5 = v4;
    v6 = sub_23EB08134(v4, 0);
    swift_bridgeObjectRetain();
    v7 = sub_23EB0807C(&v22, v6 + 4, v5, a1, a2);
    result = swift_bridgeObjectRelease();
    if (v7 != (_QWORD *)v5)
      goto LABEL_24;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v22 = 0;
  v23 = 0xE000000000000000;
  v9 = v6[2];
  if (v9)
  {
    swift_retain();
    v10 = v6 + 5;
    v11 = MEMORY[0x24BEE06E0];
    do
    {
      v13 = *(v10 - 1);
      v12 = *v10;
      swift_bridgeObjectRetain_n();
      if (*(_QWORD *)(sub_23EB071D4() + 16)
        && (sub_23EAEC3D4(v13, v12, (void (*)(_BYTE *, uint64_t, uint64_t))v11, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460), (v14 & 1) != 0))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23EB1AD74();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRelease();
      v10 += 2;
      --v9;
    }
    while (v9);
    swift_release_n();
    v15 = v22;
    v16 = v23;
  }
  else
  {
    swift_release();
    v15 = 0;
    v16 = 0xE000000000000000;
  }
  if (0xCCCCCCCCCCCCCCCDLL * sub_23EB1AD50() + 0x1999999999999999 >= 0x3333333333333333)
  {
    swift_bridgeObjectRelease();
    sub_23EB08718();
    swift_allocError();
    return swift_willThrow();
  }
  v17 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0)
    v17 = v15 & 0xFFFFFFFFFFFFLL;
  v22 = v15;
  v23 = v16;
  v24 = 0;
  v25 = v17;
  swift_bridgeObjectRetain();
  result = sub_23EB1AD8C();
  v19 = v18;
  if (!v18)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23EB06D74(-90.0, 90.0);
    sub_23EB06D74(-180.0, 180.0);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v20 = 0;
  while (!__OFADD__(v20, 1))
  {
    MEMORY[0x242657518](result, v19);
    swift_bridgeObjectRelease();
    result = sub_23EB1AD8C();
    v19 = v21;
    ++v20;
    if (!v21)
      goto LABEL_22;
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_23EB071D4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v1 = sub_23EB0722C();
    *(_QWORD *)(v0 + 16) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23EB0722C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _OWORD *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t result;

  v0 = sub_23EB1AD8C();
  if (!v1)
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  v2 = v0;
  v3 = v1;
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v8 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    sub_23EB088D0();
    sub_23EB1ADE0();
    v9 = sub_23EB1AD50();
    if ((unint64_t)(5 - v9 % 5) >= 5)
      v10 = -(v9 % 5);
    else
      v10 = 5 - v9 % 5;
    if (v10)
    {
      v11 = (_QWORD *)sub_23EB1AE4C();
      v11[2] = v10;
      v11[4] = 48;
      v11[5] = 0xE100000000000000;
      v12 = v10 - 1;
      if (v10 != 1)
      {
        v13 = v11 + 6;
        if (v10 < 5)
        {
          v14 = 1;
LABEL_17:
          v17 = v10 - v14;
          do
          {
            *v13 = 48;
            v13[1] = 0xE100000000000000;
            v13 += 2;
            --v17;
          }
          while (v17);
          goto LABEL_19;
        }
        v14 = v12 & 0xFFFFFFFFFFFFFFFCLL | 1;
        v13 += 2 * (v12 & 0xFFFFFFFFFFFFFFFCLL);
        v15 = v11 + 10;
        v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          *(v15 - 2) = xmmword_23EB1C2E0;
          *(v15 - 1) = xmmword_23EB1C2E0;
          *v15 = xmmword_23EB1C2E0;
          v15[1] = xmmword_23EB1C2E0;
          v15 += 4;
          v16 -= 4;
        }
        while (v16);
        if (v12 != (v12 & 0xFFFFFFFFFFFFFFFCLL))
          goto LABEL_17;
      }
    }
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
    sub_23EB02CD4(&qword_25433E818, &qword_25433E810, MEMORY[0x24BEE12B0]);
    v18 = sub_23EB1ACA8();
    v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23EB1AD74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = sub_23EAEC3D4(v2, v3, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE06E0], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460);
    v24 = v5[2];
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
      goto LABEL_33;
    v27 = v22;
    if (v5[3] >= v26)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v22 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_23EB014A4();
        if ((v27 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_23EB00CC0(v26, isUniquelyReferenced_nonNull_native);
      v28 = sub_23EAEC3D4(v2, v3, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE06E0], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460);
      if ((v27 & 1) != (v29 & 1))
        goto LABEL_35;
      v23 = v28;
      if ((v27 & 1) != 0)
      {
LABEL_3:
        v6 = (uint64_t *)(v5[7] + 16 * v23);
        swift_bridgeObjectRelease();
        *v6 = v18;
        v6[1] = v20;
        goto LABEL_4;
      }
    }
    v5[(v23 >> 6) + 8] |= 1 << v23;
    v30 = (uint64_t *)(v5[6] + 16 * v23);
    *v30 = v2;
    v30[1] = v3;
    v31 = (uint64_t *)(v5[7] + 16 * v23);
    *v31 = v18;
    v31[1] = v20;
    v32 = v5[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_34;
    v5[2] = v34;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v2 = sub_23EB1AD8C();
    v3 = v7;
    v4 = v8;
    if (!v7)
      goto LABEL_31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  result = sub_23EB1B110();
  __break(1u);
  return result;
}

uint64_t sub_23EB075D4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 24);
  }
  else
  {
    v1 = sub_23EB0762C();
    *(_QWORD *)(v0 + 24) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23EB0762C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t result;

  v0 = sub_23EB1AD8C();
  if (!v1)
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_30:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  v2 = v0;
  v3 = v1;
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v8 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    sub_23EB088D0();
    sub_23EB1ADE0();
    v9 = sub_23EB1AD50();
    if ((unint64_t)(5 - v9 % 5) >= 5)
      v10 = -(v9 % 5);
    else
      v10 = 5 - v9 % 5;
    if (!v10)
    {
      v15 = v2;
      goto LABEL_20;
    }
    v11 = (_QWORD *)sub_23EB1AE4C();
    v11[2] = v10;
    v11[4] = 48;
    v11[5] = 0xE100000000000000;
    v12 = v10 - 1;
    if (v10 != 1)
    {
      v13 = v11 + 6;
      if (v10 >= 5)
      {
        v14 = v12 & 0xFFFFFFFFFFFFFFFCLL | 1;
        v13 += 2 * (v12 & 0xFFFFFFFFFFFFFFFCLL);
        v16 = v11 + 10;
        v17 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          *(v16 - 2) = xmmword_23EB1C2E0;
          *(v16 - 1) = xmmword_23EB1C2E0;
          *v16 = xmmword_23EB1C2E0;
          v16[1] = xmmword_23EB1C2E0;
          v16 += 4;
          v17 -= 4;
        }
        while (v17);
        if (v12 == (v12 & 0xFFFFFFFFFFFFFFFCLL))
          goto LABEL_19;
      }
      else
      {
        v14 = 1;
      }
      v18 = v10 - v14;
      do
      {
        *v13 = 48;
        v13[1] = 0xE100000000000000;
        v13 += 2;
        --v18;
      }
      while (v18);
    }
LABEL_19:
    v15 = v2;
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
    sub_23EB02CD4(&qword_25433E818, &qword_25433E810, MEMORY[0x24BEE12B0]);
    v19 = sub_23EB1ACA8();
    v21 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23EB1AD74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = v21;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = sub_23EAEC3D4(v19, v21, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460);
    v26 = v5[2];
    v27 = (v24 & 1) == 0;
    v28 = v26 + v27;
    if (__OFADD__(v26, v27))
      goto LABEL_32;
    v29 = v24;
    if (v5[3] >= v28)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23EB012EC();
    }
    else
    {
      sub_23EB0099C(v28, isUniquelyReferenced_nonNull_native);
      v30 = sub_23EAEC3D4(v19, v22, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460);
      if ((v29 & 1) != (v31 & 1))
        goto LABEL_34;
      v25 = v30;
    }
    if ((v29 & 1) != 0)
    {
      v6 = (uint64_t *)(v5[7] + 16 * v25);
      swift_bridgeObjectRelease();
      *v6 = v15;
      v6[1] = v3;
    }
    else
    {
      v5[(v25 >> 6) + 8] |= 1 << v25;
      v32 = (uint64_t *)(v5[6] + 16 * v25);
      *v32 = v19;
      v32[1] = v22;
      v33 = (uint64_t *)(v5[7] + 16 * v25);
      *v33 = v15;
      v33[1] = v3;
      v34 = v5[2];
      v35 = __OFADD__(v34, 1);
      v36 = v34 + 1;
      if (v35)
        goto LABEL_33;
      v5[2] = v36;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v2 = sub_23EB1AD8C();
    v3 = v7;
    v4 = v8;
    if (!v7)
      goto LABEL_30;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  result = sub_23EB1B110();
  __break(1u);
  return result;
}

uint64_t Geohash.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Geohash.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *sub_23EB07A1C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEA90);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_23EB081A8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EB07B40(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E748);
  v10 = *(_QWORD *)(sub_23EB1A63C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23EB1B044();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_23EB1A63C() - 8);
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
    sub_23EB0829C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_23EB07D48(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E848);
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
    sub_23EB083B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23EB07E54(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3B8);
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
    sub_23EB084A4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_23EB07F60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23EB1AF78();
  return sub_23EB07F90(a1, v2);
}

unint64_t sub_23EB07F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23EB08914(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242657734](v9, a1);
      sub_23EAF2174((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23EB08054(unint64_t a1)
{
  return sub_23EB07B40(0, *(_QWORD *)(a1 + 16), 0, a1);
}

_QWORD *sub_23EB08068(_QWORD *a1)
{
  return sub_23EB07D48(0, a1[2], 0, a1);
}

_QWORD *sub_23EB0807C(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v5 = result;
  v6 = HIBYTE(a5) & 0xF;
  v12 = a4;
  v13 = a5;
  if ((a5 & 0x2000000000000000) == 0)
    v6 = a4 & 0xFFFFFFFFFFFFLL;
  v14 = v6;
  if (!a2)
  {
    v7 = 0;
LABEL_14:
    *v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
    goto LABEL_14;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = a2;
    v9 = 0;
    while (1)
    {
      v10 = sub_23EB1AD8C();
      if (!v11)
        break;
      ++v9;
      *v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    v7 = v9;
LABEL_13:
    v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23EB08134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E3B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_23EB081A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB0829C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_23EB1A63C() - 8);
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
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB083B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB084A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

_QWORD *sub_23EB08594(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v4 = *(v2 - 1);
    v5 = *v2;
    swift_bridgeObjectRetain_n();
    v6 = sub_23EB075D4();
    if (*(_QWORD *)(v6 + 16)
      && (v7 = sub_23EAEC3D4(v4, v5, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23EAEC460), (v8 & 1) != 0))
    {
      v9 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v7);
      v10 = *v9;
      v11 = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_23EB07E54(0, v3[2] + 1, 1, v3);
      v13 = v3[2];
      v12 = v3[3];
      if (v13 >= v12 >> 1)
        v3 = sub_23EB07E54((_QWORD *)(v12 > 1), v13 + 1, 1, v3);
      v3[2] = v13 + 1;
      v14 = &v3[2 * v13];
      v14[4] = v10;
      v14[5] = v11;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
    }
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_23EB08718()
{
  unint64_t result;

  result = qword_256DAEA80;
  if (!qword_256DAEA80)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for Geohash.Error, &type metadata for Geohash.Error);
    atomic_store(result, (unint64_t *)&qword_256DAEA80);
  }
  return result;
}

unint64_t sub_23EB08760()
{
  unint64_t result;

  result = qword_256DAEA88;
  if (!qword_256DAEA88)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for Geohash.Error, &type metadata for Geohash.Error);
    atomic_store(result, (unint64_t *)&qword_256DAEA88);
  }
  return result;
}

uint64_t method lookup function for Geohash()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Geohash.encode(latitude:longitude:length:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of Geohash.decode(geohash:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t getEnumTagSinglePayload for Geohash.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Geohash.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23EB0886C + 4 * byte_23EB1C2F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23EB0888C + 4 * byte_23EB1C2F5[v4]))();
}

_BYTE *sub_23EB0886C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23EB0888C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EB08894(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EB0889C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EB088A4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EB088AC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23EB088B8()
{
  return 0;
}

ValueMetadata *type metadata accessor for Geohash.Error()
{
  return &type metadata for Geohash.Error;
}

unint64_t sub_23EB088D0()
{
  unint64_t result;

  result = qword_25433E358;
  if (!qword_25433E358)
  {
    result = MEMORY[0x242657D10](MEMORY[0x24BEE1EC0], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_25433E358);
  }
  return result;
}

uint64_t sub_23EB08914(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23EB08950(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23EB1AD5C();
    return sub_23EB1AE04();
  }
  return result;
}

uint64_t sub_23EB089D8@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[3];

  v52 = a1;
  v5 = (_QWORD *)sub_23EB1A7B0();
  v6 = (uint64_t *)*(v5 - 1);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v9);
  v51 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25433E350 != -1)
LABEL_19:
    swift_once();
  v11 = sub_23EB1ABAC();
  v53 = __swift_project_value_buffer(v11, (uint64_t)qword_25433F2F8);
  v12 = sub_23EB1AB94();
  v13 = sub_23EB1AE88();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_23EAEA000, v12, v13, "Trying to locate geohash file in geohash-2 folder.", v14, 2u);
    MEMORY[0x242657DAC](v14, -1, -1);
  }

  type metadata accessor for Geohash();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = 0;
  *(_QWORD *)(inited + 24) = 0;
  sub_23EB064F0(8, a2, a3);
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v16 = sub_23EB08950(2);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  swift_bridgeObjectRelease();
  v54 = MEMORY[0x2426574DC](v16, v18, v20, v22);
  v24 = v23;
  swift_bridgeObjectRelease();
  if (sub_23EB1AD50() < 2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v35 = sub_23EB1AB94();
    v36 = sub_23EB1AEA0();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v55[0] = v38;
      *(_DWORD *)v37 = 136315138;
      swift_bridgeObjectRetain();
      v55[2] = sub_23EB152C0(v54, v24, v55);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v35, v36, "Unable to locate matching geohash in geohash-2 Folder for : %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v38, -1, -1);
      MEMORY[0x242657DAC](v37, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v39 = v52;
    v40 = sub_23EB1A810();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 1, 1, v40);
  }
  else
  {
    v48 = v6;
    v49 = v8;
    v50 = v5;
    v25 = (void *)objc_opt_self();
    if (qword_25433E340 != -1)
      swift_once();
    v6 = &qword_25433F2E8;
    while (1)
    {
      v55[0] = qword_25433F2E8;
      v55[1] = unk_25433F2F0;
      swift_bridgeObjectRetain();
      sub_23EAEBE28();
      sub_23EB1AD74();
      swift_bridgeObjectRelease();
      sub_23EB1AD74();
      sub_23EB1AD74();
      sub_23EB1AD74();
      swift_bridgeObjectRetain();
      sub_23EB1AD74();
      swift_bridgeObjectRelease();
      sub_23EB1AD74();
      v26 = objc_msgSend(v25, sel_defaultManager);
      v5 = (_QWORD *)sub_23EB1ACCC();
      v8 = (char *)objc_msgSend(v26, sel_fileExistsAtPath_, v5);

      if ((_DWORD)v8)
        break;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v27 = sub_23EB1AD50();
      swift_bridgeObjectRelease();
      if (__OFSUB__(v27, 1))
      {
        __break(1u);
        goto LABEL_19;
      }
      v28 = sub_23EB08950(v27 - 1);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      swift_bridgeObjectRelease();
      MEMORY[0x2426574DC](v28, v30, v32, v34);
      swift_bridgeObjectRelease();
      if (sub_23EB1AD50() <= 1)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v42 = sub_23EB1AB94();
    v43 = sub_23EB1AEB8();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_23EAEA000, v42, v43, "Located geohash file in geohash-2 folder.", v44, 2u);
      MEMORY[0x242657DAC](v44, -1, -1);
    }

    v45 = sub_23EB1A810();
    v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56);
    v46(v51, 1, 1, v45);
    ((void (*)(char *, _QWORD, _QWORD *))v48[13])(v49, *MEMORY[0x24BDCD7A0], v50);
    v47 = v52;
    sub_23EB1A804();
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v46)(v47, 0, 1, v45);
  }
}

uint64_t sub_23EB0901C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23EB0903C();
  qword_25433F2E8 = result;
  unk_25433F2F0 = v1;
  return result;
}

uint64_t sub_23EB0903C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23EB1A810();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v8 = 1;
  v9 = objc_msgSend(v7, sel_URLsForDirectory_inDomains_, 13, 1);
  v10 = sub_23EB1AE40();

  if (*(_QWORD *)(v10 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v2, v10 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v3);
    v8 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, v8, 1, v3);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_23EAEC540((uint64_t)v2, &qword_25433E7A0);

    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v14[0] = sub_23EB1A7E0();
    v14[1] = v12;
    sub_23EB1AD74();
    sub_23EB1AD74();

    v11 = v14[0];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v11;
}

id sub_23EB09234()
{
  id v0;
  void *v1;
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  void *v28;
  id v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v31 = 1;
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v1 = (void *)sub_23EB1ACCC();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v31);

  if (v2)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v3 = sub_23EB1ABAC();
    __swift_project_value_buffer(v3, (uint64_t)qword_25433F2F8);
    v4 = sub_23EB1AB94();
    v5 = sub_23EB1AEA0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23EAEA000, v4, v5, "Path exists", v6, 2u);
      MEMORY[0x242657DAC](v6, -1, -1);
    }

    v7 = sub_23EB1AB94();
    v8 = sub_23EB1AEA0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23EAEA000, v7, v8, "Deleting existing file", v9, 2u);
      MEMORY[0x242657DAC](v9, -1, -1);
    }

    v10 = (void *)sub_23EB1ACCC();
    v30 = 0;
    v11 = objc_msgSend(v0, sel_removeItemAtPath_error_, v10, &v30);

    if (v11)
    {
      v12 = v30;
    }
    else
    {
      v13 = v30;
      v14 = (void *)sub_23EB1A7A4();

      swift_willThrow();
    }
  }
  v15 = (void *)sub_23EB1ACCC();
  v30 = 0;
  v16 = objc_msgSend(v0, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v15, 1, 0, &v30);

  if ((_DWORD)v16)
  {
    v17 = v30;

  }
  else
  {
    v18 = v30;
    v19 = (void *)sub_23EB1A7A4();

    swift_willThrow();
    if (qword_25433E350 != -1)
      swift_once();
    v20 = sub_23EB1ABAC();
    __swift_project_value_buffer(v20, (uint64_t)qword_25433F2F8);
    v21 = v19;
    v22 = v19;
    v23 = sub_23EB1AB94();
    v24 = sub_23EB1AEA0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v25 = 138412290;
      v27 = v19;
      v28 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v30 = v28;
      sub_23EB1AF18();
      *v26 = v28;

      _os_log_impl(&dword_23EAEA000, v23, v24, "Unable to create GeoHash Directory! %@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v26, -1, -1);
      MEMORY[0x242657DAC](v25, -1, -1);

    }
    else
    {

    }
  }
  return v16;
}

uint64_t sub_23EB0967C(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEA98);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAA0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAA8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAB0);
  sub_23EB1AA98();
  v21 = a1;
  v22 = a2;
  sub_23EAF21A8();
  sub_23EB0995C();
  sub_23EB1AC9C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23EAEC540((uint64_t)v6, &qword_256DAEA98);
    if (qword_25433E350 != -1)
      swift_once();
    v15 = sub_23EB1ABAC();
    __swift_project_value_buffer(v15, (uint64_t)qword_25433F2F8);
    v16 = sub_23EB1AB94();
    v17 = sub_23EB1AEA0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23EAEA000, v16, v17, "No Matching file name found in Geo Hash", v18, 2u);
      MEMORY[0x242657DAC](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    swift_getKeyPath();
    sub_23EB1AAA4();
    swift_release();
    v19 = MEMORY[0x2426574DC](v21, v22, v23, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v19;
}

unint64_t sub_23EB0995C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DAEAB8;
  if (!qword_256DAEAB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DAEAA8);
    result = MEMORY[0x242657D10](MEMORY[0x24BEE7460], v1);
    atomic_store(result, (unint64_t *)&qword_256DAEAB8);
  }
  return result;
}

uint64_t sub_23EB099A8(CLLocationDegrees a1, CLLocationDegrees a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  id v64[2];

  v64[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_23EB1AD14();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)MEMORY[0x2426579BC](v6);
  sub_23EB0A0F8(v64);
  objc_autoreleasePoolPop(v9);
  v11 = v64[0];
  if (!v64[0])
  {
    if (qword_25433E350 != -1)
      swift_once();
    v45 = sub_23EB1ABAC();
    __swift_project_value_buffer(v45, (uint64_t)qword_25433F2F8);
    v41 = sub_23EB1AB94();
    v42 = sub_23EB1AEA0();
    if (!os_log_type_enabled(v41, v42))
      goto LABEL_32;
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    v44 = "Unable to retrieve geoJSONs from geohash tile";
LABEL_31:
    _os_log_impl(&dword_23EAEA000, v41, v42, v44, v43, 2u);
    MEMORY[0x242657DAC](v43, -1, -1);
LABEL_32:

    return 0;
  }
  v12 = *((_QWORD *)v64[0] + 2);
  if (!v12)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    if (qword_25433E350 != -1)
LABEL_45:
      swift_once();
    v40 = sub_23EB1ABAC();
    __swift_project_value_buffer(v40, (uint64_t)qword_25433F2F8);
    v41 = sub_23EB1AB94();
    v42 = sub_23EB1AEB8();
    if (!os_log_type_enabled(v41, v42))
      goto LABEL_32;
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    v44 = "No matching grid polygon in geohash tile.";
    goto LABEL_31;
  }
  v13 = 0;
  *(_QWORD *)&v10 = 138412290;
  v62 = v10;
  v63 = v5;
  while (1)
  {
    if (!*(_QWORD *)(v11[v13 + 4] + 16))
      goto LABEL_5;
    swift_bridgeObjectRetain();
    sub_23EAEC44C(6516580, 0xE300000000000000);
    if ((v14 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
LABEL_5:
    if (v12 == ++v13)
      goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_23EB1AD08();
  v15 = sub_23EB1ACE4();
  v17 = v16;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v17 >> 60 == 15)
    goto LABEL_5;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDB068]), sel_init);
  v19 = (void *)sub_23EB1A858();
  v64[0] = 0;
  v20 = objc_msgSend(v18, sel_geoJSONObjectsWithData_error_, v19, v64);

  v21 = v64[0];
  if (!v20)
  {
    v26 = v64[0];
    v27 = (void *)sub_23EB1A7A4();

    swift_willThrow();
    if (qword_25433E6E0 != -1)
      swift_once();
    v28 = sub_23EB1ABAC();
    __swift_project_value_buffer(v28, (uint64_t)qword_25433F2B8);
    v29 = v27;
    v30 = v27;
    v31 = sub_23EB1AB94();
    v32 = sub_23EB1AEA0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v60 = v15;
      v34 = v33;
      v35 = swift_slowAlloc();
      v61 = v4;
      v36 = (_QWORD *)v35;
      *(_DWORD *)v34 = v62;
      v37 = v27;
      v38 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v34 + 4) = v38;
      *v36 = v38;

      _os_log_impl(&dword_23EAEA000, v31, v32, "Error while decoding geoJSON File %@", (uint8_t *)v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
      swift_arrayDestroy();
      v39 = v36;
      v4 = v61;
      MEMORY[0x242657DAC](v39, -1, -1);
      MEMORY[0x242657DAC](v34, -1, -1);
      sub_23EB03144(v60, v17);

    }
    else
    {
      sub_23EB03144(v15, v17);

    }
    v5 = v63;
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E388);
  v22 = sub_23EB1AE40();
  v23 = v21;

  if ((v22 & 0xC000000000000001) != 0)
  {
    MEMORY[0x242657794](0, v22);
  }
  else
  {
    if (!*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  objc_opt_self();
  v24 = (void *)swift_dynamicCastObjCClass();
  if (!v24)
  {
    swift_unknownObjectRelease();
    sub_23EB03144(v15, v17);
    v5 = v63;
    goto LABEL_5;
  }
  v25 = v24;
  if ((sub_23EB0A81C(v24, a1, a2) & 1) == 0)
  {
    sub_23EB03144(v15, v17);
    swift_unknownObjectRelease();
    v5 = v63;
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (qword_25433E350 != -1)
    swift_once();
  v48 = sub_23EB1ABAC();
  __swift_project_value_buffer(v48, (uint64_t)qword_25433F2F8);
  v49 = sub_23EB1AB94();
  v50 = sub_23EB1AEB8();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v51 = 0;
    _os_log_impl(&dword_23EAEA000, v49, v50, "Found matching Polygon", v51, 2u);
    MEMORY[0x242657DAC](v51, -1, -1);
  }

  v52 = sub_23EB1AB94();
  v53 = sub_23EB1AE88();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    _os_log_impl(&dword_23EAEA000, v52, v53, "Extracting Grid Info", v54, 2u);
    MEMORY[0x242657DAC](v54, -1, -1);
  }

  v55 = objc_msgSend(v25, sel_properties);
  if (v55)
  {
    v56 = v55;
    v57 = sub_23EB1A870();
    v59 = v58;

  }
  else
  {
    v57 = 0;
    v59 = 0xF000000000000000;
  }
  v46 = sub_23EB0AB60(v57, v59);
  sub_23EB03144(v57, v59);
  swift_unknownObjectRelease();
  sub_23EB03144(v15, v17);
  return v46;
}

void sub_23EB0A0F8(_QWORD *a1@<X8>)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v3 = sub_23EB10CB0();
  v5 = v4;

  if (v5 >> 60 != 15)
  {
    v6 = (void *)objc_opt_self();
    v7 = (void *)sub_23EB1A858();
    *(_QWORD *)&v17 = 0;
    v8 = objc_msgSend(v6, sel_JSONObjectWithData_options_error_, v7, 0, &v17);

    v9 = (id)v17;
    if (v8)
    {
      sub_23EB1AF60();
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = v9;
      v11 = (void *)sub_23EB1A7A4();

      swift_willThrow();
      memset(v19, 0, sizeof(v19));
    }
    sub_23EAECD5C(1935896420, 0xE400000000000000, &v17);
    if (v18)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E368);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_23EB03144(v3, v5);
        sub_23EB0AD9C((uint64_t)v19);
        *a1 = v16;
        return;
      }
    }
    else
    {
      sub_23EB0AD9C((uint64_t)&v17);
    }
    if (qword_25433E6E0 != -1)
      swift_once();
    v12 = sub_23EB1ABAC();
    __swift_project_value_buffer(v12, (uint64_t)qword_25433F2B8);
    v13 = sub_23EB1AB94();
    v14 = sub_23EB1AEA0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23EAEA000, v13, v14, "Unable to deserialize Geohash GeoJSON document", v15, 2u);
      MEMORY[0x242657DAC](v15, -1, -1);
    }
    sub_23EB03144(v3, v5);

    sub_23EB0AD9C((uint64_t)v19);
  }
  *a1 = 0;
}

uint64_t sub_23EB0A38C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v1 = a1;
  v12 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  sub_23EB1B014();
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; ; ++i)
      {
        MEMORY[0x242657794](i, v1);
        v4 = i + 1;
        if (__OFADD__(i, 1))
          break;
        objc_opt_self();
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_23EB1AFFC();
        sub_23EB1B020();
        sub_23EB1B02C();
        sub_23EB1B008();
        if (v4 == v2)
          return v12;
      }
      __break(1u);
    }
    else
    {
      v5 = 0;
      v6 = v1 + 32;
      while (1)
      {
        v7 = v5 + 1;
        if (__OFADD__(v5, 1))
          break;
        v8 = *(void **)(v6 + 8 * v5);
        objc_opt_self();
        v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        v1 = v9;
        v10 = v8;
        sub_23EB1AFFC();
        sub_23EB1B020();
        sub_23EB1B02C();
        sub_23EB1B008();
        ++v5;
        if (v7 == v2)
          return v12;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_23EB1B050();
    swift_bridgeObjectRelease();
    sub_23EB1B014();
    swift_bridgeObjectRetain();
    v2 = sub_23EB1B050();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t sub_23EB0A56C(void *a1)
{
  SEL *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  id v20;

  v3 = objc_msgSend(a1, sel_geometry);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E378);
  v4 = sub_23EB1AE40();

  v5 = sub_23EB0A38C(v4);
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_11;
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x242657794](0, v5);
  }
  else
  {
    if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    v6 = *(id *)(v5 + 32);
  }
  v7 = v6;
  v1 = (SEL *)&unk_250F43000;
  v8 = objc_msgSend(v6, sel_polygons);

  sub_23EB0ADDC();
  v9 = sub_23EB1AE40();

  if (v9 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    v10 = sub_23EB1B050();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
  swift_bridgeObjectRelease();
  if (v10)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v11 = (id)MEMORY[0x242657794](0, v5);
    else
      v11 = *(id *)(v5 + 32);
    v19 = v11;
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v19, v1[454]);

    v14 = sub_23EB1AE40();
    return v14;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  v12 = objc_msgSend(a1, sel_geometry);
  v13 = sub_23EB1AE40();

  v14 = sub_23EB0A38C(v13);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v15 = sub_23EB1ABAC();
    __swift_project_value_buffer(v15, (uint64_t)qword_25433F2F8);
    v16 = sub_23EB1AB94();
    v17 = sub_23EB1AE94();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23EAEA000, v16, v17, "Unable to locate Polygons in current GeoFeature", v18, 2u);
      MEMORY[0x242657DAC](v18, -1, -1);
    }

    return 0;
  }
  return v14;
}

uint64_t sub_23EB0A81C(void *a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SEL *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  MKMapPoint v18;
  id v19;
  unint64_t v20;
  SEL *v21;
  uint64_t result;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  unsigned int v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  CLLocationCoordinate2D v44;

  v6 = sub_23EB1AA8C();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EB0A56C(a1);
  if (!v8)
  {
    if (qword_25433E350 != -1)
      swift_once();
    v28 = sub_23EB1ABAC();
    __swift_project_value_buffer(v28, (uint64_t)qword_25433F2F8);
    v29 = sub_23EB1AB94();
    v30 = sub_23EB1AE94();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_23EAEA000, v29, v30, "No multiPolygons for the current Geofeature", v31, 2u);
      MEMORY[0x242657DAC](v31, -1, -1);
    }

    return 0;
  }
  v9 = v8;
  if (v8 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    v10 = sub_23EB1B050();
    if (v10)
      goto LABEL_4;
    goto LABEL_22;
  }
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10)
  {
LABEL_22:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_4:
  v38 = v9 & 0xC000000000000001;
  v34 = *MEMORY[0x24BDBD730];
  v32 = &v43;
  v33 = v42;
  v11 = 4;
  v12 = (SEL *)&unk_250F43000;
  v13 = v35;
  while (1)
  {
    if (v38)
      v14 = (id)MEMORY[0x242657794](v11 - 4, v9);
    else
      v14 = *(id *)(v9 + 8 * v11);
    v15 = v14;
    v16 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDB180]), sel_initWithPolygon_, v14);
    v44.latitude = a2;
    v44.longitude = a3;
    v18 = MKMapPointForCoordinate(v44);
    objc_msgSend(v17, sel_pointForMapPoint_, v18.x, v18.y);
    v19 = objc_msgSend(v17, v12[452]);

    if (!v19)
    {

      goto LABEL_6;
    }
    v40 = v11 - 3;
    v20 = v9;
    v21 = v12;
    result = (uint64_t)objc_msgSend(v17, v12[452]);
    if (!result)
      break;
    v23 = (void *)result;
    v25 = v36;
    v24 = v37;
    (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v13, v34, v37);
    v26 = v33;
    *v33 = 0;
    v26[1] = 0;
    v41 = 0x3FF0000000000000;
    v42[2] = 0x3FF0000000000000;
    v27 = v32;
    *v32 = 0;
    v27[1] = 0;
    v39 = sub_23EB1AEF4();

    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v24);
    v9 = v20;
    v12 = v21;
    v16 = v40;
    if ((v39 & 1) != 0)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
LABEL_6:
    ++v11;
    if (v16 == v10)
      goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_23EB0AB60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2 >> 60 == 15)
  {
    if (qword_25433E6E0 != -1)
      swift_once();
    v2 = sub_23EB1ABAC();
    __swift_project_value_buffer(v2, (uint64_t)qword_25433F2B8);
    v3 = sub_23EB1AB94();
    v4 = sub_23EB1AEA0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23EAEA000, v3, v4, "Unable to find grid in matching Polygon", v5, 2u);
      MEMORY[0x242657DAC](v5, -1, -1);
    }

    return 0;
  }
  v8 = (void *)objc_opt_self();
  sub_23EB02C48(a1, a2);
  v9 = (void *)sub_23EB1A858();
  *(_QWORD *)&v16 = 0;
  v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v16);

  v11 = (id)v16;
  if (v10)
  {
    sub_23EB1AF60();
    swift_unknownObjectRelease();
  }
  else
  {
    v12 = v11;
    v13 = (void *)sub_23EB1A7A4();

    swift_willThrow();
    memset(v18, 0, sizeof(v18));
  }
  sub_23EAECD5C(1684632167, 0xE400000000000000, &v16);
  sub_23EB03144(a1, a2);
  sub_23EB0AD9C((uint64_t)v18);
  if (!v17)
  {
    sub_23EB0AD9C((uint64_t)&v16);
    return 0;
  }
  if (swift_dynamicCast())
    return v15;
  else
    return 0;
}

uint64_t sub_23EB0AD9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E780);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23EB0ADDC()
{
  unint64_t result;

  result = qword_25433E390;
  if (!qword_25433E390)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25433E390);
  }
  return result;
}

unint64_t sub_23EB0AE18(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E728);
  v2 = (_QWORD *)sub_23EB1B074();
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
    result = sub_23EAEC44C(v5, v6);
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

unint64_t sub_23EB0AF38(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAE0);
  v2 = sub_23EB1B074();
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
    sub_23EAEC390(v6, (uint64_t)v15, &qword_256DAEAE8);
    result = sub_23EB07F60((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_23EAEC380(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_23EB0B078()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  sub_23EAEC6D0(0x68746150697061, 0xE700000000000000, &v23);
  if (!v24)
  {
    sub_23EAEC540((uint64_t)&v23, &qword_25433E780);
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E708);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    if (qword_25433E798 != -1)
      swift_once();
    v7 = sub_23EB1ABAC();
    __swift_project_value_buffer(v7, (uint64_t)qword_25433F320);
    v8 = sub_23EB1AB94();
    v9 = sub_23EB1AEA0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23EAEA000, v8, v9, "No API Paths found in config", v10, 2u);
      MEMORY[0x242657DAC](v10, -1, -1);
    }

    return 0;
  }
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_23EB1AC48();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v23 = 0;
  v2 = objc_msgSend(v0, sel_dataWithJSONObject_options_error_, v1, 0, &v23);

  v3 = (id)v23;
  if (v2)
  {
    v4 = sub_23EB1A870();
    v6 = v5;

    sub_23EB1A5B8();
    swift_allocObject();
    sub_23EB1A5AC();
    sub_23EB0C56C();
    sub_23EB1A5A0();
    sub_23EAF08F4(v4, v6);
    swift_release();
    return v23;
  }
  v11 = v3;
  v12 = (void *)sub_23EB1A7A4();

  swift_willThrow();
  if (qword_25433E798 != -1)
    swift_once();
  v13 = sub_23EB1ABAC();
  __swift_project_value_buffer(v13, (uint64_t)qword_25433F320);
  v14 = v12;
  v15 = v12;
  v16 = sub_23EB1AB94();
  v17 = sub_23EB1AEA0();
  if (!os_log_type_enabled(v16, v17))
  {

    return 0;
  }
  v18 = (uint8_t *)swift_slowAlloc();
  v19 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v18 = 138412290;
  v20 = v12;
  v21 = _swift_stdlib_bridgeErrorToNSError();
  *(_QWORD *)&v23 = v21;
  sub_23EB1AF18();
  *v19 = v21;

  _os_log_impl(&dword_23EAEA000, v16, v17, "Unable to decode config's APIPath. %@", v18, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
  swift_arrayDestroy();
  MEMORY[0x242657DAC](v19, -1, -1);
  MEMORY[0x242657DAC](v18, -1, -1);

  return 0;
}

uint64_t sub_23EB0B4B8()
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  sub_23EAEC6D0(0x5255726576726573, 0xE90000000000004CLL, &v6);
  if (v7)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v5;
  }
  else
  {
    sub_23EAEC540((uint64_t)&v6, &qword_25433E780);
  }
  if (qword_25433E798 != -1)
    swift_once();
  v1 = sub_23EB1ABAC();
  __swift_project_value_buffer(v1, (uint64_t)qword_25433F320);
  v2 = sub_23EB1AB94();
  v3 = sub_23EB1AEA0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23EAEA000, v2, v3, "No Server Base URL found in config", v4, 2u);
    MEMORY[0x242657DAC](v4, -1, -1);
  }

  return 0;
}

uint64_t sub_23EB0B5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  char v6;
  unsigned __int8 v7;
  id v9;
  _BYTE v10[32];
  _BYTE v11[24];
  uint64_t v12;

  sub_23EAEC390(a1, (uint64_t)v11, &qword_25433E780);
  if (v12)
  {
    sub_23EAEC390((uint64_t)v11, (uint64_t)v10, &qword_25433E780);
    sub_23EB0C534(0, &qword_25433E830);
    if (swift_dynamicCast())
    {
      v4 = objc_retainAutorelease(v9);
      objc_msgSend(v4, sel_objCType);
      if (sub_23EB1AD80() == 99 && v5 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = sub_23EB1B0F8();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0)
        {

          sub_23EAEC390(a1, a2, &qword_25433E780);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v4, sel_BOOLValue);
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE1328];

      *(_BYTE *)a2 = v7;
LABEL_13:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      return sub_23EAEC540((uint64_t)v11, &qword_25433E780);
    }
    sub_23EB0C534(0, &qword_25433E828);
    if ((swift_dynamicCast() & 1) != 0)
    {

      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  sub_23EAEC390(a1, a2, &qword_25433E780);
  return sub_23EAEC540((uint64_t)v11, &qword_25433E780);
}

uint64_t sub_23EB0B7C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256DAEAD8 + dword_256DAEAD8);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v3;
  *v3 = v1;
  v3[1] = sub_23EB0B828;
  return v5(a1);
}

uint64_t sub_23EB0B828(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EB0B884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (*(_BYTE *)(v0 + 64) == 1)
  {
    sub_23EAEC6D0(0x72756769666E6F63, 0xED00006E6F697461, (_OWORD *)(v0 + 16));
    if (*(_QWORD *)(v0 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v1 = *(_QWORD *)(v0 + 48);
        return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
      }
    }
    else
    {
      sub_23EAEC540(v0 + 16, &qword_25433E780);
    }
  }
  if (qword_25433E798 != -1)
    swift_once();
  v2 = sub_23EB1ABAC();
  __swift_project_value_buffer(v2, (uint64_t)qword_25433F320);
  v3 = sub_23EB1AB94();
  v4 = sub_23EB1AEA0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23EAEA000, v3, v4, "Using default configuration values hardcoded in Framework.", v5, 2u);
    MEMORY[0x242657DAC](v5, -1, -1);
  }

  if (qword_25433E1E8 != -1)
    swift_once();
  v1 = swift_bridgeObjectRetain();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23EB0BA20()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E49796772656E65;
  else
    return 0x656C695464697267;
}

uint64_t sub_23EB0BA74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EB0E3DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23EB0BA98()
{
  return 0;
}

void sub_23EB0BAA4(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23EB0BAB0()
{
  sub_23EB0E6C0();
  return sub_23EB1B194();
}

uint64_t sub_23EB0BAD8()
{
  sub_23EB0E6C0();
  return sub_23EB1B1A0();
}

uint64_t sub_23EB0BB00(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v12[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAF0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23EB0E6C0();
  sub_23EB1B188();
  v14 = 0;
  sub_23EB1B0BC();
  if (!v5)
  {
    v13 = 1;
    sub_23EB1B0BC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23EB0BC28@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_23EB0E514(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_23EB0BC54(_QWORD *a1)
{
  uint64_t *v1;

  return sub_23EB0BB00(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_23EB0BC70(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void *sub_23EB0BC90(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_23EB1B080();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

void sub_23EB0BD24(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23EB1AF18();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_23EB0BDD4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23EB0BDFC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC8);
  v3 = sub_23EB1AFA8();
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
      sub_23EB1B158();
      sub_23EB1AC90();
      result = sub_23EB1B170();
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

void *sub_23EB0C0D8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC8);
  v2 = *v0;
  v3 = sub_23EB1AF9C();
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

uint64_t sub_23EB0C288()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC8);
  v3 = sub_23EB1AFA8();
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
    sub_23EB1B158();
    swift_bridgeObjectRetain();
    sub_23EB1AC90();
    result = sub_23EB1B170();
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

uint64_t sub_23EB0C534(uint64_t a1, unint64_t *a2)
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

unint64_t sub_23EB0C56C()
{
  unint64_t result;

  result = qword_25433E688;
  if (!qword_25433E688)
  {
    result = MEMORY[0x242657D10](&unk_23EB1C464, &type metadata for APIPathModel);
    atomic_store(result, (unint64_t *)&qword_25433E688);
  }
  return result;
}

uint64_t sub_23EB0C5B0()
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
  char *v9;
  __CFString *v10;
  __CFString *v11;
  CFPropertyListRef v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v20;
  char *v21;
  __CFString *v22;
  __CFString *v23;
  CFPropertyListRef v24;
  int v25;
  void (*v26)(char *, uint64_t);
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  __int128 v30;
  uint64_t v31;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23EB1A954();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  if (sub_23EAEBE28())
    sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  v10 = (__CFString *)sub_23EB1ACCC();
  v11 = (__CFString *)sub_23EB1ACCC();
  v12 = CFPreferencesCopyAppValue(v10, v11);
  swift_bridgeObjectRelease();

  if (!v12)
    goto LABEL_17;
  *(_QWORD *)&v30 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_17;
  v13 = v29[0];
  if (*(_QWORD *)(v29[0] + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_23EAEC44C(0x6553796772656E65, 0xEE00736563697672);
    if ((v15 & 1) != 0)
    {
      sub_23EAECB88(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v27);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    swift_bridgeObjectRetain();
  }
  sub_23EB0B5FC((uint64_t)&v27, (uint64_t)v29);
  sub_23EAEC540((uint64_t)&v27, &qword_25433E780);
  swift_bridgeObjectRelease();
  sub_23EAECD5C(0x5255726576726573, 0xE90000000000004CLL, &v30);
  sub_23EAEC540((uint64_t)v29, &qword_25433E780);
  if (!v31)
  {
    sub_23EAEC540((uint64_t)&v30, &qword_25433E780);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    v16 = sub_23EAEC44C(0x6553796772656E65, 0xEE00736563697672);
    if ((v17 & 1) != 0)
    {
      sub_23EAECB88(*(_QWORD *)(v13 + 56) + 32 * v16, (uint64_t)&v27);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_23EB0B5FC((uint64_t)&v27, (uint64_t)v29);
  sub_23EAEC540((uint64_t)&v27, &qword_25433E780);
  swift_bridgeObjectRelease();
  sub_23EAECD5C(0x68746150697061, 0xE700000000000000, &v30);
  sub_23EAEC540((uint64_t)v29, &qword_25433E780);
  if (!v31)
  {
    v20 = &qword_25433E780;
    v21 = (char *)&v30;
LABEL_34:
    sub_23EAEC540((uint64_t)v21, v20);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E708);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = *(_QWORD *)(v27 + 16);
    swift_bridgeObjectRelease();
    if (!v18)
      return v18 & 1;
    if (sub_23EAEBE28())
      sub_23EB1B0F8();
    swift_bridgeObjectRelease();
    v22 = (__CFString *)sub_23EB1ACCC();
    v23 = (__CFString *)sub_23EB1ACCC();
    v24 = CFPreferencesCopyAppValue(v22, v23);
    swift_bridgeObjectRelease();

    if (v24)
    {
      *(_QWORD *)&v30 = v24;
      v25 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, v25 ^ 1u, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
        sub_23EB1A93C();
        LOBYTE(v18) = sub_23EB1A900();
        v26 = *(void (**)(char *, uint64_t))(v4 + 8);
        v26(v7, v3);
        v26(v9, v3);
        return v18 & 1;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    }
    v20 = (uint64_t *)&unk_25433E788;
    v21 = v2;
    goto LABEL_34;
  }
LABEL_17:
  LOBYTE(v18) = 0;
  return v18 & 1;
}

uint64_t sub_23EB0CB58()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_23EB1A858();
  *(_QWORD *)&v16 = 0;
  v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, &v16);

  if (!v2)
  {
    v7 = (id)v16;
    v8 = (void *)sub_23EB1A7A4();

    swift_willThrow();
    return 0;
  }
  v3 = (id)v16;
  sub_23EB1AF60();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E770);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v4 = v14;
    if (*(_QWORD *)(v14 + 16) && (v5 = sub_23EAEC44C(0x6553796772656E65, 0xEE00736563697672), (v6 & 1) != 0))
    {
      sub_23EAECB88(*(_QWORD *)(v14 + 56) + 32 * v5, (uint64_t)&v14);
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
    }
    sub_23EAECD5C(0x5255726576726573, 0xE90000000000004CLL, &v16);
    sub_23EAEC540((uint64_t)&v14, &qword_25433E780);
    if (v17)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v4 + 16) && (v9 = sub_23EAEC44C(0x6553796772656E65, 0xEE00736563697672), (v10 & 1) != 0))
        {
          sub_23EAECB88(*(_QWORD *)(v4 + 56) + 32 * v9, (uint64_t)&v14);
        }
        else
        {
          v14 = 0u;
          v15 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_23EAECD5C(0x68746150697061, 0xE700000000000000, &v16);
        sub_23EAEC540((uint64_t)&v14, &qword_25433E780);
        if (v17)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25433E708);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v12 = *(_QWORD *)(v13 + 16);
            swift_bridgeObjectRelease();
            if (v12)
              return 1;
          }
        }
        else
        {
          sub_23EAEC540((uint64_t)&v16, &qword_25433E780);
        }
        return 0;
      }
    }
    else
    {
      sub_23EAEC540((uint64_t)&v16, &qword_25433E780);
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_23EB0CE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  __CFString *v38;
  const void *v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t *v42;
  id *v43;
  uint64_t *boxed_opaque_existential_1;
  __CFString *v45;
  const void *v46;
  __CFString *v47;
  __CFString *v48;
  _QWORD v49[3];
  uint64_t v50;
  id v51[4];
  _QWORD v52[5];

  v52[4] = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)sub_23EB1A954();
  v8 = *(v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_23EB0CB58() & 1) == 0)
  {
    if (qword_25433E798 != -1)
      swift_once();
    v16 = sub_23EB1ABAC();
    __swift_project_value_buffer(v16, (uint64_t)qword_25433F320);
    v17 = sub_23EB1AB94();
    v18 = sub_23EB1AEA0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23EAEA000, v17, v18, "Corrupt Config received from Server.", v19, 2u);
      MEMORY[0x242657DAC](v19, -1, -1);
    }

    v20 = sub_23EB1AB94();
    v21 = sub_23EB1AEA0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_23EAEA000, v20, v21, "Unable to save config from server.", v22, 2u);
      MEMORY[0x242657DAC](v22, -1, -1);
    }

    v23 = sub_23EB1AB94();
    v24 = sub_23EB1AEA0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_23EAEA000, v23, v24, "This will result in using old values fetched from server.", v25, 2u);
      MEMORY[0x242657DAC](v25, -1, -1);
    }

    return 0;
  }
  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_23EB1A858();
  v51[0] = 0;
  v13 = objc_msgSend(v11, sel_JSONObjectWithData_options_error_, v12, 0, v51);

  v14 = v51[0];
  if (!v13)
  {
    v27 = v14;
    v28 = (void *)sub_23EB1A7A4();

    swift_willThrow();
    if (qword_25433E350 != -1)
      swift_once();
    v29 = sub_23EB1ABAC();
    __swift_project_value_buffer(v29, (uint64_t)qword_25433F2F8);
    v30 = v28;
    v31 = v28;
    v32 = sub_23EB1AB94();
    v33 = sub_23EB1AEA0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v34 = 138412290;
      v36 = v28;
      v37 = _swift_stdlib_bridgeErrorToNSError();
      v52[0] = v37;
      sub_23EB1AF18();
      *v35 = v37;

      _os_log_impl(&dword_23EAEA000, v32, v33, "Error while trying to save Config to file %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v35, -1, -1);
      MEMORY[0x242657DAC](v34, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  sub_23EB1AF60();
  swift_unknownObjectRelease();
  v15 = sub_23EAEBE28();
  v50 = a3;
  if (v15)
    sub_23EB1B0F8();
  swift_bridgeObjectRelease();
  sub_23EAECB88((uint64_t)v52, (uint64_t)v51);
  v38 = (__CFString *)sub_23EB1ACCC();
  v49[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E780);
  v39 = (const void *)sub_23EB1AF00();
  v49[1] = "";
  v40 = (__CFString *)sub_23EB1ACCC();
  CFPreferencesSetAppValue(v38, v39, v40);

  swift_unknownObjectRelease();
  v41 = (__CFString *)sub_23EB1ACCC();
  CFPreferencesAppSynchronize(v41);

  sub_23EAEC540((uint64_t)v51, &qword_25433E780);
  swift_bridgeObjectRelease();
  sub_23EAEC390(v50, (uint64_t)v6, (uint64_t *)&unk_25433E788);
  if ((*(unsigned int (**)(char *, uint64_t, _QWORD *))(v8 + 48))(v6, 1, v7) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    v42 = (uint64_t *)&unk_25433E788;
    v43 = (id *)v6;
  }
  else
  {
    (*(void (**)(char *, char *, _QWORD *))(v8 + 32))(v10, v6, v7);
    if (sub_23EAEBE28())
      sub_23EB1B0F8();
    swift_bridgeObjectRelease();
    v51[3] = v7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v51);
    (*(void (**)(uint64_t *, char *, _QWORD *))(v8 + 16))(boxed_opaque_existential_1, v10, v7);
    v45 = (__CFString *)sub_23EB1ACCC();
    v46 = (const void *)sub_23EB1AF00();
    v47 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesSetAppValue(v45, v46, v47);

    swift_unknownObjectRelease();
    v48 = (__CFString *)sub_23EB1ACCC();
    CFPreferencesAppSynchronize(v48);
    swift_bridgeObjectRelease();

    (*(void (**)(char *, _QWORD *))(v8 + 8))(v10, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    v42 = &qword_25433E780;
    v43 = v51;
  }
  sub_23EAEC540((uint64_t)v43, v42);
  return 1;
}

uint64_t sub_23EB0D5C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v1[6] = swift_task_alloc();
  v2 = sub_23EB1A594();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  v1[10] = swift_task_alloc();
  v3 = sub_23EB1A810();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23EB0D6A4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  sub_23EAFA8B0();
  v1 = sub_23EB0C5B0();
  if ((v1 & 1) != 0)
  {
    if (qword_25433E798 != -1)
      swift_once();
    v2 = sub_23EB1ABAC();
    __swift_project_value_buffer(v2, (uint64_t)qword_25433F320);
    v3 = sub_23EB1AB94();
    v4 = sub_23EB1AEB8();
    if (!os_log_type_enabled(v3, v4))
      goto LABEL_12;
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    v6 = "Config saved on disk is valid. Skipping reloading";
LABEL_11:
    _os_log_impl(&dword_23EAEA000, v3, v4, v6, v5, 2u);
    MEMORY[0x242657DAC](v5, -1, -1);
LABEL_12:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(v1 & 1);
  }
  sub_23EAEBE28();
  sub_23EB1A7F8();
  v7 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
  {
    sub_23EAEC540(v9, &qword_25433E7A0);
    if (qword_25433E798 != -1)
      swift_once();
    v10 = sub_23EB1ABAC();
    __swift_project_value_buffer(v10, (uint64_t)qword_25433F320);
    v3 = sub_23EB1AB94();
    v4 = sub_23EB1AEA0();
    if (!os_log_type_enabled(v3, v4))
      goto LABEL_12;
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    v6 = "Unable to generate request URL for fetching config";
    goto LABEL_11;
  }
  v13 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v9, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v13, v12, v7);
  sub_23EB1A558();
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v14;
  *v14 = v0;
  v14[1] = sub_23EB0D964;
  return sub_23EB1AE70();
}

uint64_t sub_23EB0D964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[16] = a1;
  v5[17] = a2;
  v5[18] = a3;
  v5[19] = v3;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23EB0D9D4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (!v1)
  {
    if (qword_25433E798 != -1)
      swift_once();
    v16 = sub_23EB1ABAC();
    __swift_project_value_buffer(v16, (uint64_t)qword_25433F320);
    v17 = sub_23EB1AB94();
    v18 = sub_23EB1AEA0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23EAEA000, v17, v18, "Unable to process Config Response.", v19, 2u);
      MEMORY[0x242657DAC](v19, -1, -1);
    }
    v20 = *(void **)(v0 + 144);
    v21 = *(_QWORD *)(v0 + 112);
    v22 = *(_QWORD *)(v0 + 88);
    v23 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 64);
    v24 = *(_QWORD *)(v0 + 72);
    v26 = *(_QWORD *)(v0 + 56);
    sub_23EAF08F4(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    goto LABEL_18;
  }
  v2 = (void *)v1;
  v3 = *(id *)(v0 + 144);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {
    if (qword_25433E798 != -1)
      swift_once();
    v27 = *(void **)(v0 + 144);
    v28 = sub_23EB1ABAC();
    __swift_project_value_buffer(v28, (uint64_t)qword_25433F320);
    v29 = v27;
    v30 = sub_23EB1AB94();
    v31 = sub_23EB1AEA0();
    v32 = os_log_type_enabled(v30, v31);
    v34 = *(_QWORD *)(v0 + 136);
    v33 = *(void **)(v0 + 144);
    v35 = *(_QWORD *)(v0 + 128);
    v36 = *(_QWORD *)(v0 + 112);
    v37 = *(_QWORD *)(v0 + 88);
    v38 = *(_QWORD *)(v0 + 96);
    v43 = *(_QWORD *)(v0 + 64);
    v45 = *(_QWORD *)(v0 + 56);
    v47 = *(_QWORD *)(v0 + 72);
    if (v32)
    {
      v41 = *(_QWORD *)(v0 + 88);
      v39 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v39 = 134217984;
      *(_QWORD *)(v0 + 32) = objc_msgSend(v2, sel_statusCode);
      sub_23EB1AF18();

      _os_log_impl(&dword_23EAEA000, v30, v31, "Unhandled http response code %ld", v39, 0xCu);
      MEMORY[0x242657DAC](v39, -1, -1);
      sub_23EAF08F4(v35, v34);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v47, v45);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v41);
    }
    else
    {
      sub_23EAF08F4(v35, v34);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v47, v45);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  if (qword_25433E798 != -1)
    swift_once();
  v4 = sub_23EB1ABAC();
  __swift_project_value_buffer(v4, (uint64_t)qword_25433F320);
  v5 = sub_23EB1AB94();
  v6 = sub_23EB1AEB8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23EAEA000, v5, v6, "Saving fetched config to disk", v7, 2u);
    MEMORY[0x242657DAC](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 136);
  v9 = *(void **)(v0 + 144);
  v10 = *(_QWORD *)(v0 + 128);
  v42 = *(_QWORD *)(v0 + 96);
  v44 = *(_QWORD *)(v0 + 88);
  v46 = *(_QWORD *)(v0 + 112);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 48);
  v13 = *(_QWORD *)(v0 + 56);

  sub_23EAF13D4(v14);
  v15 = sub_23EB0CE38(v10, v8, v14);
  sub_23EAF08F4(v10, v8);

  sub_23EAEC540(v14, (uint64_t *)&unk_25433E788);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v46, v44);
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v15 & 1);
}

uint64_t sub_23EB0DE50()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (qword_25433E798 != -1)
    swift_once();
  v1 = *(void **)(v0 + 152);
  v2 = sub_23EB1ABAC();
  __swift_project_value_buffer(v2, (uint64_t)qword_25433F320);
  v3 = v1;
  v4 = v1;
  v5 = sub_23EB1AB94();
  v6 = sub_23EB1AEA0();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 152);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v12;
    sub_23EB1AF18();
    *v10 = v12;

    _os_log_impl(&dword_23EAEA000, v5, v6, "Error while trying to fetch Config from Server %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAC0);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v10, -1, -1);
    MEMORY[0x242657DAC](v9, -1, -1);
  }
  else
  {

  }
  v13 = sub_23EB1AB94();
  v14 = sub_23EB1AEA0();
  v15 = os_log_type_enabled(v13, v14);
  v16 = *(void **)(v0 + 152);
  v17 = *(_QWORD *)(v0 + 112);
  v18 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 96);
  v21 = *(_QWORD *)(v0 + 64);
  v20 = *(_QWORD *)(v0 + 72);
  v22 = *(_QWORD *)(v0 + 56);
  if (v15)
  {
    v32 = *(_QWORD *)(v0 + 72);
    v31 = *(_QWORD *)(v0 + 96);
    v23 = (uint8_t *)swift_slowAlloc();
    v30 = v18;
    v24 = swift_slowAlloc();
    v33 = v24;
    *(_DWORD *)v23 = 136315138;
    v25 = sub_23EAEBE28();
    v26 = !v25;
    if (v25)
      v27 = 1685025392;
    else
      v27 = 7759204;
    if (v26)
      v28 = 0xE300000000000000;
    else
      v28 = 0xE400000000000000;
    *(_QWORD *)(v0 + 16) = sub_23EB152C0(v27, v28, &v33);
    sub_23EB1AF18();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23EAEA000, v13, v14, "Current Environment %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v24, -1, -1);
    MEMORY[0x242657DAC](v23, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v32, v22);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v17, v30);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t initializeBufferWithCopyOfBuffer for APIPathModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for APIPathModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for APIPathModel(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for APIPathModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

_QWORD *assignWithTake for APIPathModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for APIPathModel(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for APIPathModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for APIPathModel()
{
  return &type metadata for APIPathModel;
}

uint64_t sub_23EB0E3DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656C695464697267 && a2 == 0xEE0070756B6F6F4CLL;
  if (v2 || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E49796772656E65 && a2 == 0xEF736C6176726574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23EB1B0F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23EB0E514(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E730);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23EB0E6C0();
  sub_23EB1B17C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_23EB1B098();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_23EB1B098();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_23EB0E6C0()
{
  unint64_t result;

  result = qword_25433E670;
  if (!qword_25433E670)
  {
    result = MEMORY[0x242657D10](&unk_23EB1C550, &type metadata for APIPathModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E670);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for APIPathModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB0E750 + 4 * byte_23EB1C41D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23EB0E784 + 4 * byte_23EB1C418[v4]))();
}

uint64_t sub_23EB0E784(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB0E78C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB0E794);
  return result;
}

uint64_t sub_23EB0E7A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB0E7A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23EB0E7AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB0E7B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for APIPathModel.CodingKeys()
{
  return &type metadata for APIPathModel.CodingKeys;
}

unint64_t sub_23EB0E7D4()
{
  unint64_t result;

  result = qword_256DAEAF8;
  if (!qword_256DAEAF8)
  {
    result = MEMORY[0x242657D10](&unk_23EB1C528, &type metadata for APIPathModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DAEAF8);
  }
  return result;
}

unint64_t sub_23EB0E81C()
{
  unint64_t result;

  result = qword_25433E680;
  if (!qword_25433E680)
  {
    result = MEMORY[0x242657D10](&unk_23EB1C498, &type metadata for APIPathModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E680);
  }
  return result;
}

unint64_t sub_23EB0E864()
{
  unint64_t result;

  result = qword_25433E678;
  if (!qword_25433E678)
  {
    result = MEMORY[0x242657D10](&unk_23EB1C4C0, &type metadata for APIPathModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E678);
  }
  return result;
}

uint64_t sub_23EB0E8A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v19[2];
  _QWORD v20[4];
  uint64_t v21;

  v4 = v3;
  v19[0] = a1;
  v19[1] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E640);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_23EB0FE10(0, v10, 0);
    v11 = v21;
    v12 = (uint64_t *)(a3 + 56);
    while (1)
    {
      v13 = *(v12 - 2);
      v14 = *(v12 - 1);
      v15 = *v12;
      v20[0] = *(v12 - 3);
      v20[1] = v13;
      v20[2] = v14;
      v20[3] = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      ((void (*)(_QWORD *))v19[0])(v20);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v11;
      v17 = *(_QWORD *)(v11 + 16);
      v16 = *(_QWORD *)(v11 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_23EB0FE10(v16 > 1, v17 + 1, 1);
        v11 = v21;
      }
      v12 += 4;
      *(_QWORD *)(v11 + 16) = v17 + 1;
      sub_23EB0FD84((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v17, &qword_25433E640);
      if (!--v10)
        return v11;
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t sub_23EB0EA3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD v18[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v18 - v6;
  if ((sub_23EB1ADD4() & 1) != 0)
  {
    sub_23EB1A7F8();
    v8 = sub_23EB1A810();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
    v13 = (uint64_t)v7;
LABEL_8:
    sub_23EAEC540(v13, &qword_25433E7A0);
    if (qword_25433E6E0 != -1)
      swift_once();
    v14 = sub_23EB1ABAC();
    __swift_project_value_buffer(v14, (uint64_t)qword_25433F2B8);
    v15 = sub_23EB1AB94();
    v16 = sub_23EB1AEAC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_23EAEA000, v15, v16, "Unable to create valid URL", v17, 2u);
      MEMORY[0x242657DAC](v17, -1, -1);
    }

    abort();
  }
  v18[0] = 0x2F2F3A7370747468;
  v18[1] = 0xE800000000000000;
  sub_23EB1AD74();
  sub_23EB1A7F8();
  v11 = sub_23EB1A810();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) == 1)
  {
    v13 = (uint64_t)v5;
    goto LABEL_8;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v5, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB0EC9C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;

  v5 = v4;
  LODWORD(v59) = a3;
  v57 = a2;
  v58 = a1;
  v60 = a4;
  v6 = sub_23EB1A63C();
  v7 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  v65 = v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v66 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v53 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E640);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v53 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E648);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23EB1A6B4();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v5;
  sub_23EB1A684();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_23EAEC540((uint64_t)v21, &qword_25433E648);
    v27 = sub_23EB1A810();
    v28 = v60;
    v29 = *(_QWORD *)(v27 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v60, v5, v27);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v28, 0, 1, v27);
  }
  else
  {
    v31 = v59;
    v61 = v16;
    v62 = v18;
    v55 = v26;
    v56 = v23;
    v63 = v11;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v21, v22);
    v32 = sub_23EB1A678();
    if (v32)
    {
      v33 = sub_23EB0F238(v32, v58, v57 & 1, v31 & 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      v54 = v25;
      v59 = v22;
      MEMORY[0x24BDAC7A8](0);
      *((_BYTE *)&v53 - 16) = v57 & 1;
      *(&v53 - 1) = v55;
      v34 = sub_23EB0E8A8((uint64_t)sub_23EB0FBE0, (uint64_t)(&v53 - 4), v58);
      v35 = *(_QWORD *)(v34 + 16);
      if (v35)
      {
        v36 = v13;
        v37 = *(unsigned __int8 *)(v13 + 80);
        v58 = v34;
        v38 = v34 + ((v37 + 32) & ~v37);
        v39 = *(_QWORD *)(v36 + 72);
        v33 = MEMORY[0x24BEE4AF8];
        v41 = (uint64_t)v62;
        v40 = v63;
        v42 = (uint64_t)v61;
        v43 = v65;
        do
        {
          v44 = v33;
          sub_23EB0FC00(v38, v41);
          sub_23EB0FD84(v41, v42, &qword_25433E640);
          v45 = v42;
          v46 = v42;
          v47 = v64;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v45, 1, v64) == 1)
          {
            sub_23EAEC540(v46, &qword_25433E640);
            v42 = v46;
            v33 = v44;
          }
          else
          {
            v48 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 32);
            v48(v40, v46, v47);
            v48(v66, (uint64_t)v40, v47);
            v33 = v44;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v33 = sub_23EB07B40(0, *(_QWORD *)(v44 + 16) + 1, 1, v44);
            v50 = *(_QWORD *)(v33 + 16);
            v49 = *(_QWORD *)(v33 + 24);
            if (v50 >= v49 >> 1)
              v33 = sub_23EB07B40(v49 > 1, v50 + 1, 1, v33);
            *(_QWORD *)(v33 + 16) = v50 + 1;
            v48((char *)(v33+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(_QWORD *)(v43 + 72) * v50), (uint64_t)v66, v47);
            v41 = (uint64_t)v62;
            v40 = v63;
            v42 = (uint64_t)v61;
          }
          v38 += v39;
          --v35;
        }
        while (v35);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        v33 = MEMORY[0x24BEE4AF8];
      }
      v22 = v59;
      v25 = v54;
    }
    v51 = v56;
    if (!*(_QWORD *)(v33 + 16))
      swift_bridgeObjectRelease();
    sub_23EB1A654();
    sub_23EB1A69C();
    if (v52)
      sub_23EB1A66C();
    sub_23EB1A690();
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v25, v22);
  }
}

void sub_23EB0F100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v0 = sub_23EB1A60C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_25433F2A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25433F2A0);
  sub_23EB1A5E8();
  v5 = sub_23EB1A5F4();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v8 = (void *)sub_23EB1A858();
  v9 = objc_msgSend((id)objc_opt_self(), sel_characterSetWithBitmapRepresentation_, v8);
  sub_23EAF08F4(v5, v7);

  v10 = (void *)sub_23EB1ACCC();
  objc_msgSend(v9, sel_removeCharactersInString_, v10);

  sub_23EB1A600();
}

uint64_t sub_23EB0F238(unint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  int64_t *v15;
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
  char *v26;
  uint64_t v27;
  uint64_t *v28;
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
  unint64_t v39;
  uint64_t result;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  int64_t v49;
  int64_t *v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  char v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  _QWORD v83[2];
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  char *v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;

  v88 = a4;
  v92 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB00);
  MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB08);
  v97 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v95 = (char *)v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB10);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v15 = (_QWORD *)((char *)v83 - v14);
  v16 = sub_23EB1A63C();
  v101 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v85 = (char *)v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v84 = (char *)v83 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v86 = (uint64_t)v83 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v100 = (char *)v83 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v83 - v25;
  v104 = a1;
  v91 = *(_QWORD *)(a2 + 16);
  if (!v91)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  v90 = a2 + 32;
  swift_bridgeObjectRetain();
  v83[1] = a2;
  swift_bridgeObjectRetain();
  v27 = 0;
  v98 = v16;
  v93 = v26;
  while (2)
  {
    v28 = (uint64_t *)(v90 + 32 * v27);
    v30 = *v28;
    v29 = v28[1];
    v31 = v28[3];
    if ((v92 & 1) != 0)
    {
      v96 = v28[2];
      v102 = v30;
      v103 = v29;
      v32 = qword_25433E230;
      v99 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v32 != -1)
        swift_once();
      v33 = sub_23EB1A60C();
      v34 = __swift_project_value_buffer(v33, (uint64_t)qword_25433F2A0);
      sub_23EAF09E8();
      v89 = v34;
      v30 = sub_23EB1AF30();
      v36 = v35;
      swift_bridgeObjectRelease();
      if (!v36)
      {
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
      v94 = v27;
      v102 = v96;
      v103 = v31;
      sub_23EB1AF30();
      swift_bridgeObjectRelease();
      v37 = v36;
    }
    else
    {
      v94 = v27;
      v38 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v37 = v38;
    }
    v99 = v37;
    sub_23EB1A618();
    swift_bridgeObjectRelease();
    v39 = *(_QWORD *)(v104 + 16);
    v96 = v104;
    result = swift_bridgeObjectRetain();
    v41 = 0;
    v42 = v101;
    if (!v39)
    {
LABEL_12:
      v43 = 1;
      v41 = v39;
      goto LABEL_15;
    }
    while (1)
    {
      if (v41 >= *(_QWORD *)(v96 + 16))
      {
        __break(1u);
        goto LABEL_44;
      }
      v44 = v96
          + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))
          + *(_QWORD *)(v42 + 72) * v41;
      v45 = v42;
      v46 = &v95[*(int *)(v8 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v46, v44, v16);
      v47 = (char *)v13 + *(int *)(v8 + 48);
      *v13 = v41;
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v47, v46, v16);
      v43 = 0;
      ++v41;
LABEL_15:
      v48 = v97;
      (*(void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v97 + 56))(v13, v43, 1, v8);
      sub_23EB0FD84((uint64_t)v13, (uint64_t)v15, &qword_256DAEB10);
      if ((*(unsigned int (**)(int64_t *, uint64_t, uint64_t))(v48 + 48))(v15, 1, v8) == 1)
        break;
      v49 = *v15;
      v50 = v15;
      v51 = (char *)v15 + *(int *)(v8 + 48);
      v52 = *(void (**)(char *, char *, uint64_t))(v101 + 32);
      v52(v100, v51, v16);
      if (sub_23EB1A624() == v30 && v53 == v99)
      {
        swift_bridgeObjectRelease();
        v27 = v94;
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v59 = v86;
        sub_23EB0FC48(v49, v86);
        v60 = v101;
        v61 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
        v62 = v59;
        v63 = v98;
        v61(v62, v98);
        result = ((uint64_t (*)(char *, uint64_t))v61)(v100, v63);
        v64 = v104;
        v65 = *(_QWORD *)(v104 + 16);
        if (v49 >= v65)
        {
          v69 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
          if ((v88 & 1) != 0)
          {
            v70 = (uint64_t)v87;
            v71 = v93;
            v72 = v98;
            v69(v87, v93, v98);
            sub_23EB102E0(0, 0, v70);
            v61((uint64_t)v71, v72);
            v16 = v72;
            v15 = v50;
          }
          else
          {
            v79 = v93;
            v69(v84, v93, v98);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v64 = sub_23EB07B40(0, v65 + 1, 1, v64);
            v81 = *(_QWORD *)(v64 + 16);
            v80 = *(_QWORD *)(v64 + 24);
            if (v81 >= v80 >> 1)
              v64 = sub_23EB07B40(v80 > 1, v81 + 1, 1, v64);
            *(_QWORD *)(v64 + 16) = v81 + 1;
            v82 = v98;
            v52((char *)(v64+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(_QWORD *)(v101 + 72) * v81), v84, v98);
            v104 = v64;
            v61((uint64_t)v79, v82);
            v16 = v82;
            v15 = v50;
          }
          goto LABEL_4;
        }
        if ((v49 & 0x8000000000000000) == 0)
        {
          v15 = v50;
          v66 = (uint64_t)v87;
          v67 = v93;
          v68 = v98;
          (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v87, v93, v98);
          sub_23EB102E0(v49, v49, v66);
          v61((uint64_t)v67, v68);
          v16 = v68;
          goto LABEL_4;
        }
LABEL_44:
        __break(1u);
        return result;
      }
      v54 = sub_23EB1B0F8();
      swift_bridgeObjectRelease();
      if ((v54 & 1) != 0)
      {
        v27 = v94;
        goto LABEL_25;
      }
      v42 = v101;
      v16 = v98;
      result = (*(uint64_t (**)(char *, uint64_t))(v101 + 8))(v100, v98);
      v15 = v50;
      if (v41 == v39)
        goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v55 = v101;
    v56 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
    if ((v88 & 1) != 0)
    {
      v57 = (uint64_t)v87;
      v58 = v93;
      v56(v87, v93, v16);
      sub_23EB102E0(0, 0, v57);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v58, v16);
      v27 = v94;
    }
    else
    {
      v73 = v93;
      v56(v85, v93, v16);
      v74 = v104;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v74 = sub_23EB07B40(0, *(_QWORD *)(v74 + 16) + 1, 1, v74);
      v27 = v94;
      v76 = *(_QWORD *)(v74 + 16);
      v75 = *(_QWORD *)(v74 + 24);
      if (v76 >= v75 >> 1)
        v74 = sub_23EB07B40(v75 > 1, v76 + 1, 1, v74);
      *(_QWORD *)(v74 + 16) = v76 + 1;
      v77 = v101;
      v78 = v74
          + ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80))
          + *(_QWORD *)(v101 + 72) * v76;
      v16 = v98;
      (*(void (**)(unint64_t, char *, uint64_t))(v101 + 32))(v78, v85, v98);
      v104 = v74;
      (*(void (**)(char *, uint64_t))(v77 + 8))(v73, v16);
    }
LABEL_4:
    if (++v27 != v91)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  return v104;
}

uint64_t sub_23EB0FA30@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  v3 = qword_25433E230;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v3 != -1)
    swift_once();
  v4 = sub_23EB1A60C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25433F2A0);
  sub_23EAF09E8();
  sub_23EB1AF30();
  v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_23EB1AF30();
    swift_bridgeObjectRelease();
LABEL_7:
    sub_23EB1A618();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 = sub_23EB1A63C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a2, 0, 1, v7);
  }
  v9 = sub_23EB1A63C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a2, 1, 1, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB0FBE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23EB0FA30(*(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_23EB0FC00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EB0FC48@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t *v2;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_23EB08054(v5);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6 - 1;
  v8 = sub_23EB1A63C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    result = sub_23EB1B080();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  *(_QWORD *)(v5 + 16) = v7;
  *v2 = v5;
  return result;
}

uint64_t sub_23EB0FD84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EB0FDC8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23EB0FE48(a1, a2, a3, *v3, &qword_256DAEB18);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23EB0FDEC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23EB0FE48(a1, a2, a3, *v3, &qword_25433E850);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23EB0FE10(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23EB0FF90(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23EB0FE2C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23EB10178(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23EB0FE48(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v9] || v13 >= &v14[v9])
  {
    memcpy(v13, v14, v9);
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB0FF90(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E750);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25433E640) - 8);
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
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25433E640) - 8);
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
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB10178(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E848);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

uint64_t sub_23EB102E0(uint64_t a1, int64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v5;
  int64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = sub_23EB07B40(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *v3 = v5;
  }
  v14 = sub_23EB1A63C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = v5 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v17 = *(_QWORD *)(v15 + 72);
  v18 = v16 + v17 * a1;
  swift_arrayDestroy();
  if (!v9)
    goto LABEL_25;
  v19 = *(_QWORD *)(v5 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_33;
  if (v20 < 0)
  {
LABEL_35:
    result = sub_23EB1B080();
    __break(1u);
    return result;
  }
  v21 = v18 + v17;
  v22 = v16 + v17 * a2;
  if (v18 + v17 < v22 || v21 >= v22 + v20 * v17)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v21 != v22)
  {
    swift_arrayInitWithTakeBackToFront();
  }
  v24 = *(_QWORD *)(v5 + 16);
  v25 = __OFADD__(v24, v9);
  v26 = v24 + v9;
  if (v25)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(_QWORD *)(v5 + 16) = v26;
LABEL_25:
  if (v17 >= 1)
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  return sub_23EAEC540(a3, &qword_256DAEB00);
}

uint64_t sub_23EB104B4(void *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  int v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  void *v23;
  void *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  char *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  NSObject *v51;
  uint8_t *v52;
  uint8_t *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  _DWORD *v57;
  int v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;

  v2 = sub_23EB1AA68();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v57 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23EB1AA80();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  v64 = (uint64_t)a1;
  v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAE990);
  v20 = swift_dynamicCast();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v20)
  {
    v61 = v16;
    v21(v11, 0, 1, v12);
    v62 = v13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    v22 = sub_23EAEF3B0(&qword_256DAE660, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF610], MEMORY[0x24BDCF608]);
    sub_23EB1A780();
    sub_23EB1AA44();
    sub_23EAEF3B0(&qword_256DAEB28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF5D8], MEMORY[0x24BDCF5F0]);
    sub_23EB1AE10();
    sub_23EB1AE10();
    v24 = v63;
    v23 = (void *)v64;
    v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v6, v2);
    v25(v8, v2);
    if (v23 == v24)
    {
      if (qword_256DAE568 != -1)
        swift_once();
      v26 = sub_23EB1ABAC();
      __swift_project_value_buffer(v26, (uint64_t)qword_256DAEF38);
      v27 = sub_23EB1AB94();
      v28 = sub_23EB1AEA0();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_23EAEA000, v27, v28, "No Internet connection detected. Check your network connection.", v29, 2u);
        MEMORY[0x242657DAC](v29, -1, -1);
      }

      type metadata accessor for NetworkError(0);
      sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
      v30 = swift_allocError();
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v18, v12);
    }
    else
    {
      v59 = v22;
      v60 = v18;
      sub_23EB1A780();
      sub_23EB1AA2C();
      sub_23EB1AE10();
      sub_23EB1AE10();
      v36 = v63;
      v35 = (void *)v64;
      v25(v6, v2);
      v25(v8, v2);
      if (v35 == v36)
      {
        v37 = v62;
        if (qword_256DAE568 != -1)
          swift_once();
        v38 = sub_23EB1ABAC();
        __swift_project_value_buffer(v38, (uint64_t)qword_256DAEF38);
        v39 = sub_23EB1AB94();
        v40 = sub_23EB1AEA0();
        v41 = os_log_type_enabled(v39, v40);
        v42 = v60;
        if (v41)
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_23EAEA000, v39, v40, "Unable to find Host. if this DEV env, please check your VPN connection!", v43, 2u);
          MEMORY[0x242657DAC](v43, -1, -1);
        }

        type metadata accessor for NetworkError(0);
        sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
        v30 = swift_allocError();
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v42, v12);
      }
      else
      {
        v44 = v62;
        if (qword_256DAE568 != -1)
          swift_once();
        v45 = sub_23EB1ABAC();
        __swift_project_value_buffer(v45, (uint64_t)qword_256DAEF38);
        v46 = v60;
        v47 = v61;
        (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v61, v60, v12);
        v48 = sub_23EB1AB94();
        v49 = sub_23EB1AEA0();
        v50 = v49;
        if (os_log_type_enabled(v48, v49))
        {
          v51 = v48;
          v52 = (uint8_t *)swift_slowAlloc();
          v58 = v50;
          v53 = v52;
          *(_DWORD *)v52 = 134217984;
          v57 = v52 + 4;
          sub_23EB1A780();
          v54 = sub_23EB1AA5C();
          v25(v8, v2);
          v55 = *(void (**)(char *, uint64_t))(v44 + 8);
          v55(v47, v12);
          v64 = v54;
          v48 = v51;
          v46 = v60;
          sub_23EB1AF18();
          _os_log_impl(&dword_23EAEA000, v48, (os_log_type_t)v58, "URLError error : %ld", v53, 0xCu);
          MEMORY[0x242657DAC](v53, -1, -1);
        }
        else
        {
          v55 = *(void (**)(char *, uint64_t))(v44 + 8);
          v55(v47, v12);
        }

        type metadata accessor for NetworkError(0);
        sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
        v30 = swift_allocError();
        sub_23EB1A780();
        swift_storeEnumTagMultiPayload();
        v55(v46, v12);
      }
    }
  }
  else
  {
    v21(v11, 1, 1, v12);
    sub_23EB10C70((uint64_t)v11);
    if (qword_256DAE568 != -1)
      swift_once();
    v31 = sub_23EB1ABAC();
    __swift_project_value_buffer(v31, (uint64_t)qword_256DAEF38);
    v32 = sub_23EB1AB94();
    v33 = sub_23EB1AEA0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_23EAEA000, v32, v33, "Unknown Error", v34, 2u);
      MEMORY[0x242657DAC](v34, -1, -1);
    }

    type metadata accessor for NetworkError(0);
    sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
    v30 = swift_allocError();
    swift_storeEnumTagMultiPayload();
  }
  return v30;
}

uint64_t sub_23EB10C70(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23EB10CB0()
{
  id v0;
  void *v1;
  unsigned int v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23EB1A7EC();
  v1 = (void *)sub_23EB1ACCC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2)
    return sub_23EB1A828();
  if (qword_256DAE560 != -1)
    swift_once();
  v4 = sub_23EB1ABAC();
  __swift_project_value_buffer(v4, (uint64_t)qword_256DAEF20);
  v5 = sub_23EB1AB94();
  v6 = sub_23EB1AEA0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23EAEA000, v5, v6, "File not found in provided location!", v7, 2u);
    MEMORY[0x242657DAC](v7, -1, -1);
  }

  return 0;
}

void sub_23EB10FA4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23EB10FEC()
{
  sub_23EB1AC90();
  return swift_bridgeObjectRelease();
}

void AutoBugCaptureIssue.init(type:subType:subTypeContext:payload:)(char *a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7;
  char v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = *a1;
  v8 = *a2;
  v9 = *a3;
  v10 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v11 = objc_msgSend(v10, sel_processName);

  v12 = sub_23EB1ACD8();
  v14 = v13;

  *(_BYTE *)a5 = v7;
  *(_BYTE *)(a5 + 1) = v8;
  *(_BYTE *)(a5 + 2) = v9;
  *(_QWORD *)(a5 + 8) = v12;
  *(_QWORD *)(a5 + 16) = v14;
  *(_QWORD *)(a5 + 24) = a4;
}

uint64_t static AutoBugCaptureManager.sendIssue(_:)(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v2 = sub_23EB1ABB8();
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23EB1ABD0();
  v5 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v9 = a1[1];
  v10 = a1[2];
  v11 = *((_QWORD *)a1 + 1);
  v12 = *((_QWORD *)a1 + 2);
  v13 = *((_QWORD *)a1 + 3);
  if (qword_256DAE588 != -1)
    swift_once();
  v17 = qword_256DAEB30;
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = v8;
  *(_BYTE *)(v14 + 17) = v9;
  *(_BYTE *)(v14 + 18) = v10;
  *(_QWORD *)(v14 + 24) = v11;
  *(_QWORD *)(v14 + 32) = v12;
  *(_QWORD *)(v14 + 40) = v13;
  aBlock[4] = sub_23EB13034;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23EB1304C;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23EB1ABC4();
  v20 = MEMORY[0x24BEE4AF8];
  sub_23EAEF3B0(&qword_256DAEB40, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEB48);
  sub_23EB141D0(&qword_256DAEB50, &qword_256DAEB48);
  sub_23EB1AF6C();
  MEMORY[0x24265768C](0, v7, v4, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  return swift_release();
}

uint64_t AutoBugCaptureDomain.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23EB1B08C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t AutoBugCaptureDomain.rawValue.getter()
{
  return 0x6553796772656E45;
}

uint64_t sub_23EB11448()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  return sub_23EB1B170();
}

uint64_t sub_23EB114A4()
{
  return sub_23EB1AC90();
}

uint64_t sub_23EB114C8()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  return sub_23EB1B170();
}

uint64_t sub_23EB11520@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23EB1B08C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_23EB11570(char *a1@<X8>)
{
  strcpy(a1, "EnergyServices");
  a1[15] = -18;
}

HomeServices::AutoBugCaptureType_optional __swiftcall AutoBugCaptureType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (HomeServices::AutoBugCaptureType_optional)sub_23EB118DC(v1);
}

uint64_t AutoBugCaptureType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x5720796772656E45;
  if (*v0 != 1)
    v1 = 0x6F6F4C2064697247;
  if (*v0)
    return v1;
  else
    return 0x65636E6164697547;
}

uint64_t sub_23EB11620(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23EAF4FC8(*a1, *a2);
}

uint64_t sub_23EB1162C()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

uint64_t sub_23EB116EC()
{
  sub_23EB1AC90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB11788()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

HomeServices::AutoBugCaptureType_optional sub_23EB11844(Swift::String *a1)
{
  return AutoBugCaptureType.init(rawValue:)(*a1);
}

void sub_23EB11850(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEF6C616E67695320;
  v4 = 0xEE0073776F646E69;
  v5 = 0x5720796772656E45;
  if (v2 != 1)
  {
    v5 = 0x6F6F4C2064697247;
    v4 = 0xEB0000000070756BLL;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x65636E6164697547;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

HomeServices::AutoBugCaptureSubType_optional __swiftcall AutoBugCaptureSubType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (HomeServices::AutoBugCaptureSubType_optional)sub_23EB118DC(v1);
}

uint64_t sub_23EB118DC@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23EB1B08C();
  result = swift_bridgeObjectRelease();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t AutoBugCaptureSubType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x726576726553;
  if (*v0 != 1)
    v1 = 0x73795320656C6946;
  if (*v0)
    return v1;
  else
    return 0x72756769666E6F43;
}

uint64_t sub_23EB1199C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23EAF4DA8(*a1, *a2);
}

uint64_t sub_23EB119A8()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

uint64_t sub_23EB11A58()
{
  sub_23EB1AC90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB11AE4()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

HomeServices::AutoBugCaptureSubType_optional sub_23EB11B90(Swift::String *a1)
{
  return AutoBugCaptureSubType.init(rawValue:)(*a1);
}

void sub_23EB11B9C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xED00006E6F697461;
  v4 = 0xE600000000000000;
  v5 = 0x726576726553;
  if (v2 != 1)
  {
    v5 = 0x73795320656C6946;
    v4 = 0xEB000000006D6574;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x72756769666E6F43;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

HomeServices::AutoBugCaptureSubTypeContext_optional __swiftcall AutoBugCaptureSubTypeContext.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HomeServices::AutoBugCaptureSubTypeContext_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23EB1B08C();
  result.value = swift_bridgeObjectRelease();
  v5 = 10;
  if (v3 < 0xA)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AutoBugCaptureSubTypeContext.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23EB11C9C + 4 * byte_23EB1C5AA[*v0]))(0x20676E697373694DLL, 0xEC00000061746144);
}

unint64_t sub_23EB11C9C()
{
  return 0xD00000000000001ELL;
}

void sub_23EB11D80(char *a1)
{
  sub_23EAF4B6C(*a1);
}

uint64_t sub_23EB11D8C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23EB1B158();
  sub_23EB10FA4((uint64_t)v3, v1);
  return sub_23EB1B170();
}

void sub_23EB11DD0(uint64_t a1)
{
  char *v1;

  sub_23EB10FA4(a1, *v1);
}

uint64_t sub_23EB11DD8()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23EB1B158();
  sub_23EB10FA4((uint64_t)v3, v1);
  return sub_23EB1B170();
}

HomeServices::AutoBugCaptureSubTypeContext_optional sub_23EB11E18(Swift::String *a1)
{
  return AutoBugCaptureSubTypeContext.init(rawValue:)(*a1);
}

uint64_t sub_23EB11E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AutoBugCaptureSubTypeContext.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23EB11E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void (*v15)(_BYTE *, _BYTE *, uint64_t);
  double v16;
  double v17;
  void (*v18)(_BYTE *, uint64_t);
  uint64_t v19;
  _BYTE v21[24];

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v21[-v5];
  v7 = sub_23EB1A954();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v21[-v12];
  sub_23EB1A93C();
  v14 = v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate;
  swift_beginAccess();
  sub_23EB1414C(v14, (uint64_t)v6);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_23EAEC540((uint64_t)v6, (uint64_t *)&unk_25433E788);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v4, v13, v7);
LABEL_6:
    v19 = 1;
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
    swift_beginAccess();
    sub_23EAFD9E0((uint64_t)v4, v14);
    swift_endAccess();
    return v19;
  }
  v15 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32);
  v15(v11, v6, v7);
  sub_23EB1A894();
  v17 = v16;
  v18 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v18(v11, v7);
  if (v17 >= 86400.0)
  {
    v15(v4, v13, v7);
    goto LABEL_6;
  }
  v18(v13, v7);
  return 0;
}

void sub_23EB12054(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *(unsigned __int8 *)(a1 + 2);
  if ((sub_23EB11E48() & 1) != 0)
  {
    sub_23EB1ACCC();
    sub_23EB1ACCC();
    swift_bridgeObjectRelease();
    sub_23EB1ACCC();
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  if (qword_256DAE578 != -1)
    swift_once();
  v1 = sub_23EB1ABAC();
  __swift_project_value_buffer(v1, (uint64_t)qword_256DAEF50);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v2 = sub_23EB1AB94();
  v3 = sub_23EB1AEB8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = AutoBugCaptureIssue.description.getter();
    sub_23EB152C0(v6, v7, &v9);
    sub_23EB1AF18();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23EAEA000, v2, v3, "Not reporting to AutoBugCapture because we are rate limited: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242657DAC](v5, -1, -1);
    MEMORY[0x242657DAC](v4, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_23EB12878(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEAE0);
    v2 = sub_23EB1B074();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_23EAECB88(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_23EAEC380(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_23EAEC380(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_23EAEC380(v36, v37);
    sub_23EAEC380(v37, &v33);
    result = sub_23EB1AF78();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_23EAEC380(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_23EB0318C();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23EB12C3C(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
    v3 = sub_23EB1AC60();
  else
    v3 = 0;
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AutoBugCaptureReporter.deinit()
{
  uint64_t v0;

  sub_23EAEC540(v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate, (uint64_t *)&unk_25433E788);
  return v0;
}

uint64_t AutoBugCaptureReporter.__deallocating_deinit()
{
  uint64_t v0;

  sub_23EAEC540(v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate, (uint64_t *)&unk_25433E788);
  return swift_deallocClassInstance();
}

uint64_t sub_23EB12D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_23EB1AED0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23EB1AEC4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23EB1ABD0();
  MEMORY[0x24BDAC7A8](v6);
  sub_23EB14194();
  sub_23EB1ABC4();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_23EAEF3B0(&qword_256DAEC40, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DAEC48);
  sub_23EB141D0(&qword_256DAEC50, &qword_256DAEC48);
  sub_23EB1AF6C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_23EB1AEE8();
  qword_256DAEB30 = result;
  return result;
}

uint64_t sub_23EB12EE4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB3470]), sel_init);
  type metadata accessor for AutoBugCaptureReporter();
  v1 = swift_allocObject();
  v2 = v1 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate;
  v3 = sub_23EB1A954();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(_QWORD *)(v1 + 16) = v0;
  qword_256DAEB38 = v1;
  return result;
}

void sub_23EB12F74(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int16 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_256DAE590 != -1)
    swift_once();
  v8 = a1;
  v9 = BYTE2(a1);
  v10 = a2;
  v11 = a3;
  v12 = a4;
  sub_23EB12054((uint64_t)&v8);
}

uint64_t sub_23EB13008()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23EB13034()
{
  uint64_t v0;

  sub_23EB12F74(*(unsigned __int16 *)(v0 + 16) | (*(unsigned __int8 *)(v0 + 18) << 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_23EB1304C(uint64_t a1)
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

void AutoBugCaptureIssue.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void AutoBugCaptureIssue.subType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

void AutoBugCaptureIssue.subTypeContext.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 2);
}

uint64_t AutoBugCaptureIssue.process.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoBugCaptureIssue.payload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AutoBugCaptureIssue.description.getter()
{
  sub_23EB1AD74();
  sub_23EB1AD74();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  sub_23EB1AD74();
  sub_23EB1AD74();
  swift_bridgeObjectRelease();
  sub_23EB1AD74();
  sub_23EB1B038();
  return 0;
}

unint64_t sub_23EB132B0()
{
  unint64_t result;

  result = qword_256DAEB60;
  if (!qword_256DAEB60)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for AutoBugCaptureDomain, &type metadata for AutoBugCaptureDomain);
    atomic_store(result, (unint64_t *)&qword_256DAEB60);
  }
  return result;
}

unint64_t sub_23EB132F8()
{
  unint64_t result;

  result = qword_256DAEB68;
  if (!qword_256DAEB68)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for AutoBugCaptureType, &type metadata for AutoBugCaptureType);
    atomic_store(result, (unint64_t *)&qword_256DAEB68);
  }
  return result;
}

unint64_t sub_23EB13340()
{
  unint64_t result;

  result = qword_256DAEB70;
  if (!qword_256DAEB70)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for AutoBugCaptureSubType, &type metadata for AutoBugCaptureSubType);
    atomic_store(result, (unint64_t *)&qword_256DAEB70);
  }
  return result;
}

unint64_t sub_23EB13388()
{
  unint64_t result;

  result = qword_256DAEB78;
  if (!qword_256DAEB78)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for AutoBugCaptureSubTypeContext, &type metadata for AutoBugCaptureSubTypeContext);
    atomic_store(result, (unint64_t *)&qword_256DAEB78);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AutoBugCaptureDomain(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23EB13410 + 4 * byte_23EB1C5B4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23EB13430 + 4 * byte_23EB1C5B9[v4]))();
}

_BYTE *sub_23EB13410(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23EB13430(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EB13438(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EB13440(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23EB13448(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23EB13450(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureDomain()
{
  return &type metadata for AutoBugCaptureDomain;
}

ValueMetadata *type metadata accessor for AutoBugCaptureType()
{
  return &type metadata for AutoBugCaptureType;
}

uint64_t _s12HomeServices18AutoBugCaptureTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12HomeServices18AutoBugCaptureTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB13560 + 4 * byte_23EB1C5C3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23EB13594 + 4 * byte_23EB1C5BE[v4]))();
}

uint64_t sub_23EB13594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB1359C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB135A4);
  return result;
}

uint64_t sub_23EB135B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB135B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23EB135BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB135C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureSubType()
{
  return &type metadata for AutoBugCaptureSubType;
}

uint64_t getEnumTagSinglePayload for AutoBugCaptureSubTypeContext(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AutoBugCaptureSubTypeContext(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB136BC + 4 * byte_23EB1C5CD[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_23EB136F0 + 4 * byte_23EB1C5C8[v4]))();
}

uint64_t sub_23EB136F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB136F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB13700);
  return result;
}

uint64_t sub_23EB1370C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB13714);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_23EB13718(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB13720(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureSubTypeContext()
{
  return &type metadata for AutoBugCaptureSubTypeContext;
}

uint64_t sub_23EB1373C()
{
  return type metadata accessor for AutoBugCaptureReporter();
}

uint64_t type metadata accessor for AutoBugCaptureReporter()
{
  uint64_t result;

  result = qword_256DAEBA8;
  if (!qword_256DAEBA8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23EB13780()
{
  unint64_t v0;

  sub_23EAEBB88();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AutoBugCaptureReporter()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for AutoBugCaptureManager()
{
  return &type metadata for AutoBugCaptureManager;
}

uint64_t destroy for AutoBugCaptureIssue()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoBugCaptureIssue(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoBugCaptureIssue(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureIssue()
{
  return &type metadata for AutoBugCaptureIssue;
}

void sub_23EB139F8(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40[5];
  __int128 v41;
  __int128 v42;

  if (a1)
  {
    v34 = sub_23EB1ACD8();
    sub_23EB1AF90();
    if (*(_QWORD *)(a1 + 16) && (v2 = sub_23EB07F60((uint64_t)v40), (v3 & 1) != 0))
    {
      sub_23EAECB88(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)&v41);
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
    }
    sub_23EAF2174((uint64_t)v40);
    if (*((_QWORD *)&v42 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0 && v34 == 1)
      {
        v35 = sub_23EB1ACD8();
        v38 = v4;
        sub_23EB1AF90();
        if (*(_QWORD *)(a1 + 16) && (v5 = sub_23EB07F60((uint64_t)v40), (v6 & 1) != 0))
        {
          sub_23EAECB88(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)&v41);
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
        }
        sub_23EAF2174((uint64_t)v40);
        if (*((_QWORD *)&v42 + 1))
        {
          if (swift_dynamicCast())
          {
            v20 = v35;
            v19 = v38;
LABEL_53:
            if (qword_256DAE578 != -1)
              swift_once();
            v30 = sub_23EB1ABAC();
            __swift_project_value_buffer(v30, (uint64_t)qword_256DAEF50);
            swift_bridgeObjectRetain();
            v25 = sub_23EB1AB94();
            v31 = sub_23EB1AEB8();
            if (os_log_type_enabled(v25, v31))
            {
              v32 = (uint8_t *)swift_slowAlloc();
              v33 = swift_slowAlloc();
              v40[0] = v33;
              *(_DWORD *)v32 = 136315138;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v41 = sub_23EB152C0(v20, v19, v40);
              sub_23EB1AF18();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_23EAEA000, v25, v31, "Diagnostic reporter snapshot accepted with sessionID [%s]", v32, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x242657DAC](v33, -1, -1);
              v29 = (uint64_t)v32;
              goto LABEL_57;
            }

LABEL_59:
            swift_bridgeObjectRelease_n();
            return;
          }
        }
        else
        {
          sub_23EAEC540((uint64_t)&v41, &qword_25433E780);
        }
        v20 = 0x6E776F6E6B6E55;
        v19 = 0xE700000000000000;
        goto LABEL_53;
      }
    }
    else
    {
      sub_23EAEC540((uint64_t)&v41, &qword_25433E780);
    }
    v36 = sub_23EB1ACD8();
    sub_23EB1AF90();
    if (*(_QWORD *)(a1 + 16) && (v7 = sub_23EB07F60((uint64_t)v40), (v8 & 1) != 0))
    {
      sub_23EAECB88(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v41);
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
    }
    sub_23EAF2174((uint64_t)v40);
    if (*((_QWORD *)&v42 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v9 = v36;
        v37 = sub_23EB1ACD8();
        v39 = v10;
        sub_23EB1AF90();
        if (*(_QWORD *)(a1 + 16) && (v11 = sub_23EB07F60((uint64_t)v40), (v12 & 1) != 0))
        {
          sub_23EAECB88(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v41);
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
        }
        sub_23EAF2174((uint64_t)v40);
        if (*((_QWORD *)&v42 + 1))
        {
          if (swift_dynamicCast())
          {
            v18 = v37;
            v17 = v39;
            goto LABEL_38;
          }
        }
        else
        {
          sub_23EAEC540((uint64_t)&v41, &qword_25433E780);
        }
        v18 = 0x6E776F6E6B6E55;
        v17 = 0xE700000000000000;
LABEL_38:
        v21 = 0x6465746365707865;
        v22 = 0xE800000000000000;
        if (v9 != *MEMORY[0x24BEB34B0] && v9 != *MEMORY[0x24BEB34C8])
        {
          if (v9 == *MEMORY[0x24BEB34A8] || v9 == *MEMORY[0x24BEB34F0])
          {
            v22 = 0xE800000000000000;
          }
          else
          {
            v21 = 0x7463657078656E75;
            v22 = 0xEA00000000006465;
          }
        }
        if (qword_256DAE578 != -1)
          swift_once();
        v24 = sub_23EB1ABAC();
        __swift_project_value_buffer(v24, (uint64_t)qword_256DAEF50);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = sub_23EB1AB94();
        v26 = sub_23EB1AEB8();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = swift_slowAlloc();
          v28 = swift_slowAlloc();
          v40[0] = v28;
          *(_DWORD *)v27 = 136315650;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v41 = sub_23EB152C0(v21, v22, v40);
          sub_23EB1AF18();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v27 + 12) = 2048;
          *(_QWORD *)&v41 = v9;
          sub_23EB1AF18();
          *(_WORD *)(v27 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v41 = sub_23EB152C0(v18, v17, v40);
          sub_23EB1AF18();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23EAEA000, v25, v26, "Diagnostic reporter snapshot rejected with%s\nreason: %ld (%s)", (uint8_t *)v27, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x242657DAC](v28, -1, -1);
          v29 = v27;
LABEL_57:
          MEMORY[0x242657DAC](v29, -1, -1);

          return;
        }

        swift_bridgeObjectRelease_n();
        goto LABEL_59;
      }
    }
    else
    {
      sub_23EAEC540((uint64_t)&v41, &qword_25433E780);
    }
    if (qword_256DAE578 != -1)
      swift_once();
    v13 = sub_23EB1ABAC();
    __swift_project_value_buffer(v13, (uint64_t)qword_256DAEF50);
    v14 = sub_23EB1AB94();
    v15 = sub_23EB1AEB8();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23EAEA000, v14, v15, "Diagnostic reporter snapshot rejected with unknown reason", v16, 2u);
      MEMORY[0x242657DAC](v16, -1, -1);
    }

  }
}

uint64_t sub_23EB1414C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23EB14194()
{
  unint64_t result;

  result = qword_256DAEC38;
  if (!qword_256DAEC38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256DAEC38);
  }
  return result;
}

uint64_t sub_23EB141D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242657D10](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23EB14220@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  sub_23EB0B4B8();
  if (v2)
  {
    sub_23EB0EA3C(a1);
    swift_bridgeObjectRelease();
    v3 = sub_23EB1A810();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 0;
  }
  else
  {
    if (qword_25433E6E0 != -1)
      swift_once();
    v7 = sub_23EB1ABAC();
    __swift_project_value_buffer(v7, (uint64_t)qword_25433F2B8);
    v8 = sub_23EB1AB94();
    v9 = sub_23EB1AEA0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23EAEA000, v8, v9, "No Server Base URL Found!!", v10, 2u);
      MEMORY[0x242657DAC](v10, -1, -1);
    }

    v3 = sub_23EB1A810();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 1;
  }
  return v4(v5, v6, 1, v3);
}

uint64_t type metadata accessor for GridBaseRequest()
{
  return objc_opt_self();
}

uint64_t sub_23EB1436C@<X0>(uint64_t a1@<X8>)
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23EB1A810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB0B078();
  if (v9 != 1)
  {
    v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      sub_23EB14220((uint64_t)v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
        sub_23EB1A7D4();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        v15 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v15, 1, v5);
      }
      swift_bridgeObjectRelease();
      sub_23EAEC540((uint64_t)v4, &qword_25433E7A0);
    }
  }
  if (qword_25433E6E0 != -1)
    swift_once();
  v11 = sub_23EB1ABAC();
  __swift_project_value_buffer(v11, (uint64_t)qword_25433F2B8);
  v12 = sub_23EB1AB94();
  v13 = sub_23EB1AEA0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_23EAEA000, v12, v13, "Unable to compute API Path for grid tile lookup.", v14, 2u);
    MEMORY[0x242657DAC](v14, -1, -1);
  }

  v15 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v15, 1, v5);
}

uint64_t sub_23EB1457C@<X0>(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t)@<X0>, char *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, char *a7@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  uint64_t v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t inited;
  uint64_t v51;
  unsigned int v52;
  uint64_t v54;
  unsigned int v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  char *v63;
  uint8_t *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, char *, uint64_t);
  void *v75;
  uint64_t (*v76)(uint64_t, unsigned int);
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unsigned int (*v82)(uint64_t, uint64_t, uint64_t);
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  char *v91;
  void (*v92)(char *, uint64_t);
  void (*v93)(char *, uint64_t, uint64_t);
  char *v94;
  char *v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t);
  void (*v98)(char *, char *, uint64_t);
  char *v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  char *v106;
  void (*v107)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115[2];

  v110 = a5;
  v111 = a6;
  v102 = a4;
  v101 = a3;
  v107 = a1;
  v108 = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E638);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v104 = (uint64_t)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v105 = (char *)&v98 - v11;
  v12 = sub_23EB1A594();
  v112 = *(_QWORD *)(v12 - 8);
  v113 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v100 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v106 = (char *)&v98 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E7A0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v98 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v98 - v23;
  v25 = sub_23EB1A810();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v98 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v109 = (char *)&v98 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v98 - v35;
  sub_23EB1436C((uint64_t)v24);
  v37 = v26;
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v38(v24, 1, v25) == 1)
  {
    v39 = a7;
    sub_23EAEC540((uint64_t)v24, &qword_25433E7A0);
    if (qword_25433E6E0 != -1)
      swift_once();
    v40 = sub_23EB1ABAC();
    __swift_project_value_buffer(v40, (uint64_t)qword_25433F2B8);
    v41 = v111;
    swift_bridgeObjectRetain_n();
    v42 = sub_23EB1AB94();
    v43 = sub_23EB1AEA0();
    v44 = os_log_type_enabled(v42, v43);
    v46 = v112;
    v45 = v113;
    if (v44)
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v115[0] = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v114 = sub_23EB152C0(v110, v41, v115);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v42, v43, "Request URL for Grid Tile Lookup API not found | traceId: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v48, -1, -1);
      MEMORY[0x242657DAC](v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v39, 1, 1, v45);
  }
  v99 = v29;
  v103 = a7;
  v49 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v49(v36, v24, v25);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E758);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23EB1B750;
  *(_QWORD *)(inited + 32) = 104;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  *(_QWORD *)(inited + 48) = v107;
  *(_QWORD *)(inited + 56) = v108;
  swift_bridgeObjectRetain();
  v51 = v37;
  v108 = v36;
  sub_23EB1A7BC();
  sub_23EB1A7F8();
  v52 = v38(v19, 1, v25);
  v98 = v49;
  if (v52 == 1)
  {
    sub_23EAEC540((uint64_t)v19, &qword_25433E7A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v22, 1, 1, v25);
  }
  else
  {
    v49(v32, v19, v25);
    sub_23EB0EC9C(inited, 1, 0, (uint64_t)v22);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v25);
  }
  v54 = v112;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v55 = v38(v22, 1, v25);
  v56 = v99;
  if (v55 == 1)
  {
    v57 = v37;
    sub_23EAEC540((uint64_t)v22, &qword_25433E7A0);
    v58 = v111;
    if (qword_25433E6E0 != -1)
      swift_once();
    v59 = sub_23EB1ABAC();
    __swift_project_value_buffer(v59, (uint64_t)qword_25433F2B8);
    swift_bridgeObjectRetain_n();
    v60 = sub_23EB1AB94();
    v61 = sub_23EB1AEA0();
    v62 = os_log_type_enabled(v60, v61);
    v63 = v108;
    if (v62)
    {
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v115[0] = v65;
      v112 = v25;
      *(_DWORD *)v64 = 136315138;
      swift_bridgeObjectRetain();
      v114 = sub_23EB152C0(v110, v58, v115);
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v60, v61, "Unable to create Grid Tile Request URL with required query parameters | traceId: %s", v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v65, -1, -1);
      MEMORY[0x242657DAC](v64, -1, -1);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v63, v112);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v63, v25);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v103, 1, 1, v113);
  }
  v66 = v109;
  v98(v109, v22, v25);
  v112 = v51;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v56, v66, v25);
  v67 = v106;
  sub_23EB1A558();
  sub_23EB1A528();
  v68 = sub_23EAFA5D4();
  v69 = v111;
  v70 = v54;
  if ((v68 & 1) != 0)
  {
    v71 = v103;
    v72 = v113;
    v73 = (uint64_t)v105;
    if (qword_25433E6A8 != -1)
      v68 = swift_once();
    MEMORY[0x24BDAC7A8](v68);
    *(&v98 - 2) = v77;
    v75 = &unk_250F41868;
    v76 = sub_23EAF3158;
  }
  else
  {
    v71 = v103;
    v72 = v113;
    v73 = (uint64_t)v105;
    if (qword_25433E6A8 != -1)
      v68 = swift_once();
    MEMORY[0x24BDAC7A8](v68);
    *(&v98 - 2) = v74;
    v75 = &unk_250F418A8;
    v76 = sub_23EAF3150;
  }
  sub_23EB15910((uint64_t)v75, (uint64_t (*)(uint64_t, _QWORD))v76);
  v78 = sub_23EB1AD38();
  v80 = v79;
  swift_bridgeObjectRelease();
  sub_23EAFA5D4();
  v81 = v104;
  sub_23EAFE8BC(v78, v80, 49, 0xE100000000000000, v104);
  swift_bridgeObjectRelease();
  v82 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
  if (v82(v81, 1, v72) == 1)
  {
    sub_23EAEC540(v81, &qword_25433E638);
    v107 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56);
    v107(v73, 1, 1, v72);
LABEL_29:
    sub_23EAEC540(v73, &qword_25433E638);
    if (qword_25433E6E0 != -1)
      swift_once();
    v86 = sub_23EB1ABAC();
    __swift_project_value_buffer(v86, (uint64_t)qword_25433F2B8);
    swift_bridgeObjectRetain_n();
    v87 = sub_23EB1AB94();
    v88 = sub_23EB1AEA0();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      v90 = swift_slowAlloc();
      v115[0] = v90;
      *(_DWORD *)v89 = 136315138;
      v91 = v103;
      swift_bridgeObjectRetain();
      v114 = sub_23EB152C0(v110, v69, v115);
      v71 = v91;
      sub_23EB1AF18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23EAEA000, v87, v88, "Unable to create signed Grid Look up request | traceId: %s", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242657DAC](v90, -1, -1);
      MEMORY[0x242657DAC](v89, -1, -1);

      v72 = v113;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v106, v113);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v72);
    }
    v92 = *(void (**)(char *, uint64_t))(v112 + 8);
    v92(v109, v25);
    v92(v108, v25);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v107)(v71, 1, 1, v72);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v73, v81, v72);
  v83 = v81;
  sub_23EB1A570();
  sub_23EB1A570();
  v84 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
  v84(v83, v72);
  v85 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56);
  v85(v73, 0, 1, v72);
  if (v82(v73, 1, v72) == 1)
  {
    v107 = v85;
    v71 = v103;
    goto LABEL_29;
  }
  v93 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 32);
  v94 = v100;
  v93(v100, v73, v72);
  sub_23EB1A588();
  v95 = v103;
  if (v102)
  {
    v96 = HIBYTE(v102) & 0xF;
    if ((v102 & 0x2000000000000000) == 0)
      v96 = v101 & 0xFFFFFFFFFFFFLL;
    if (v96)
      sub_23EB1A570();
  }
  v84((uint64_t)v67, v72);
  v97 = *(void (**)(char *, uint64_t))(v112 + 8);
  v97(v109, v25);
  v97(v108, v25);
  v93(v95, (uint64_t)v94, v72);
  return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v85)(v95, 0, 1, v72);
}

uint64_t type metadata accessor for GridLookupRequest()
{
  return objc_opt_self();
}

uint64_t sub_23EB1521C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23EB15250(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23EB152C0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23EB1AF18();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23EB152C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23EB15390(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23EAECB88((uint64_t)v12, *a3);
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
      sub_23EAECB88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23EB15390(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23EB1AF24();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23EB15548(a5, a6);
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
  v8 = sub_23EB1AFF0();
  if (!v8)
  {
    sub_23EB1B044();
    __break(1u);
LABEL_17:
    result = sub_23EB1B080();
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

uint64_t sub_23EB15548(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23EB155DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23EB157B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23EB157B4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23EB155DC(uint64_t a1, unint64_t a2)
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
      v3 = sub_23EB15750(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23EB1AFD8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23EB1B044();
      __break(1u);
LABEL_10:
      v2 = sub_23EB1AD98();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23EB1B080();
    __break(1u);
LABEL_14:
    result = sub_23EB1B044();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23EB15750(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E850);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23EB157B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E850);
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
  result = sub_23EB1B080();
  __break(1u);
  return result;
}

_BYTE **sub_23EB15900(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_23EB15910(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  sub_23EB0FDEC(0, 0, 0);
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 32;
    do
    {
      v7 = a2(v5, *(unsigned __int8 *)(v6 + v5));
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_23EB0FDEC(v8 > 1, v9 + 1, 1);
      ++v5;
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_BYTE *)(v11 + v9 + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *static EnergyWindowRating.allCases.getter()
{
  return &unk_250F417E0;
}

uint64_t EnergyWindowRating.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1146048327;
  if (*v0 != 1)
    v1 = 0x5453524F57;
  if (*v0)
    return v1;
  else
    return 1414743362;
}

uint64_t static EnergyServices.configuration()()
{
  return swift_task_switch();
}

uint64_t sub_23EB15A78()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  *v2 = v0;
  v2[1] = sub_23EB15AE8;
  return sub_23EB0B7C8((uint64_t)v1);
}

uint64_t sub_23EB15AE8(uint64_t a1)
{
  uint64_t *v1;
  void *v3;
  uint64_t v5;

  v3 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();

  return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t static EnergyServices.configuration(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23EB15B88;
  return sub_23EB0B7C8(a1);
}

uint64_t sub_23EB15B88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t static EnergyServices.gridIDLookup(forCoordinate:withSession:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, double, double);

  v9 = (uint64_t (*)(uint64_t, double, double))((char *)&dword_256DAE970 + dword_256DAE970);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23EB15C50;
  return v9(a1, a2, a3);
}

uint64_t sub_23EB15C50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t static EnergyServices.energyWindows(forGridID:withSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23EB15D24;
  return sub_23EAFB0EC(a1, a2, a3, a4);
}

uint64_t sub_23EB15D24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t EnergyWindows.windows.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EnergyWindows.validUntil.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 20);
  return sub_23EB1414C(v3, a1);
}

uint64_t EnergyWindows.validUntil.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 20);
  return sub_23EAFD9E0(a1, v3);
}

uint64_t (*EnergyWindows.validUntil.modify())()
{
  type metadata accessor for EnergyWindows(0);
  return nullsub_2;
}

uint64_t EnergyWindows.validFrom.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 24);
  return sub_23EB1414C(v3, a1);
}

uint64_t EnergyWindows.validFrom.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 24);
  return sub_23EAFD9E0(a1, v3);
}

uint64_t (*EnergyWindows.validFrom.modify())()
{
  type metadata accessor for EnergyWindows(0);
  return nullsub_2;
}

uint64_t EnergyWindows.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergyWindows(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindows.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergyWindows(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindows.fieldErrors.getter()
{
  type metadata accessor for EnergyWindows(0);
  return swift_bridgeObjectRetain();
}

uint64_t sub_23EB15F28()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23EB15F58
                                                            + 4 * asc_23EB1CA50[*v0]))(0x73776F646E6977, 0xE700000000000000);
}

uint64_t sub_23EB15F58()
{
  return 0x746E5564696C6176;
}

uint64_t sub_23EB15F74()
{
  return 0x6F724664696C6176;
}

uint64_t sub_23EB15F90()
{
  return 0x6567617373656DLL;
}

uint64_t sub_23EB15FA4()
{
  return 0x7470697263736564;
}

uint64_t sub_23EB15FC4()
{
  return 0x727245646C656966;
}

uint64_t sub_23EB15FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23EB19E38(a1, a2);
  *a3 = result;
  return result;
}

void sub_23EB16008(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23EB16014()
{
  sub_23EB185D8();
  return sub_23EB1B194();
}

uint64_t sub_23EB1603C()
{
  sub_23EB185D8();
  return sub_23EB1B1A0();
}

uint64_t EnergyWindows.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E740);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23EB185D8();
  sub_23EB1B188();
  v13 = *v3;
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433E800);
  sub_23EB18660(&qword_25433E710, (uint64_t (*)(void))sub_23EB1861C, MEMORY[0x24BEE12A0]);
  sub_23EB1B0C8();
  if (!v2)
  {
    v9 = type metadata accessor for EnergyWindows(0);
    LOBYTE(v13) = 1;
    sub_23EB1A954();
    sub_23EAEF3B0(&qword_25433E668, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23EB1B0C8();
    LOBYTE(v13) = 2;
    sub_23EB1B0C8();
    LOBYTE(v13) = 3;
    sub_23EB1B0BC();
    LOBYTE(v13) = 4;
    sub_23EB1B0BC();
    v13 = *(uint64_t *)((char *)v3 + *(int *)(v9 + 36));
    v12 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
    sub_23EB1870C(&qword_25433E718, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23EB1B0C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t EnergyWindows.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  uint64_t v45;

  v35 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v35 - v6;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E840);
  v8 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for EnergyWindows(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 20)];
  v16 = sub_23EB1A954();
  v17 = *(void (**)(void))(*(_QWORD *)(v16 - 8) + 56);
  v41 = v15;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17)(v15, 1, 1, v16);
  v18 = *(int *)(v11 + 24);
  v43 = v14;
  v39 = &v14[v18];
  v40 = (int *)v11;
  v17();
  v19 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23EB185D8();
  v20 = v42;
  sub_23EB1B17C();
  if (v20)
  {
    v24 = v41;
    v25 = (uint64_t)v39;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    sub_23EAEC540(v24, (uint64_t *)&unk_25433E788);
    return sub_23EAEC540(v25, (uint64_t *)&unk_25433E788);
  }
  else
  {
    v21 = (uint64_t)v7;
    v22 = (uint64_t)v36;
    v42 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E800);
    v44 = 0;
    sub_23EB18660(&qword_25433E808, (uint64_t (*)(void))sub_23EB186C8, MEMORY[0x24BEE12D0]);
    v23 = v37;
    sub_23EB1B0A4();
    *v43 = v45;
    LOBYTE(v45) = 1;
    sub_23EAEF3B0(&qword_25433E7A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23EB1B0A4();
    sub_23EAFD9E0(v21, v41);
    LOBYTE(v45) = 2;
    sub_23EB1B0A4();
    v26 = v40;
    sub_23EAFD9E0(v22, (uint64_t)v39);
    LOBYTE(v45) = 3;
    v27 = sub_23EB1B098();
    v28 = (uint64_t)v43;
    v29 = (_QWORD *)((char *)v43 + v26[7]);
    *v29 = v27;
    v29[1] = v30;
    LOBYTE(v45) = 4;
    v31 = sub_23EB1B098();
    v32 = (uint64_t *)(v28 + v26[8]);
    *v32 = v31;
    v32[1] = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433E810);
    v44 = 5;
    sub_23EB1870C(&qword_25433E820, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23EB1B0A4();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v23);
    *(_QWORD *)(v28 + v26[9]) = v45;
    sub_23EB187C4(v28, v35, type metadata accessor for EnergyWindows);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    return sub_23EAFD9A4(v28, type metadata accessor for EnergyWindows);
  }
}

uint64_t sub_23EB16834@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EnergyWindows.init(from:)(a1, a2);
}

uint64_t sub_23EB16848(_QWORD *a1)
{
  return EnergyWindows.encode(to:)(a1);
}

uint64_t EnergyWindow.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  v3 = (void *)sub_23EB1ACCC();
  v4 = objc_msgSend(v2, sel_dateFromString_, v3);

  if (v4)
  {
    sub_23EB1A930();

    v5 = sub_23EB1A954();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_23EB1A954();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t EnergyWindow.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  v3 = (void *)sub_23EB1ACCC();
  v4 = objc_msgSend(v2, sel_dateFromString_, v3);

  if (v4)
  {
    sub_23EB1A930();

    v5 = sub_23EB1A954();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_23EB1A954();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t EnergyWindow.rating.getter@<X0>(char *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t result;
  char v9;

  v4 = *v1;
  v3 = v1[1];
  v5 = 0;
  if (v4 == 1414743362 && v3 == 0xE400000000000000)
  {
LABEL_8:
    result = swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v7 = sub_23EB1B0F8();
  result = swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    v5 = 1;
    if (v4 != 1146048327 || v3 != 0xE400000000000000)
    {
      v9 = sub_23EB1B0F8();
      result = swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
        goto LABEL_9;
      v5 = 2;
      if (v4 != 0x5453524F57 || v3 != 0xE500000000000000)
      {
        sub_23EB1B0F8();
        result = swift_bridgeObjectRelease();
        v5 = 2;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_9:
  *a1 = v5;
  return result;
}

uint64_t EnergyWindow.start.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindow.end.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23EB16C1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23EAF5118(*a1, *a2);
}

uint64_t sub_23EB16C28()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

uint64_t sub_23EB16CB8()
{
  sub_23EB1AC90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB16D24()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

uint64_t sub_23EB16DB0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23EB1A100();
  *a1 = result;
  return result;
}

void sub_23EB16DDC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE500000000000000;
  v5 = 0x7472617473;
  if (v2 != 1)
  {
    v5 = 6581861;
    v4 = 0xE300000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x676E69746172;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_23EB16E2C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7472617473;
  if (*v0 != 1)
    v1 = 6581861;
  if (*v0)
    return v1;
  else
    return 0x676E69746172;
}

uint64_t sub_23EB16E78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23EB1A100();
  *a1 = result;
  return result;
}

void sub_23EB16E9C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23EB16EA8()
{
  sub_23EB1876C();
  return sub_23EB1B194();
}

uint64_t sub_23EB16ED0()
{
  sub_23EB1876C();
  return sub_23EB1B1A0();
}

uint64_t EnergyWindow.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E838);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23EB1876C();
  sub_23EB1B17C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v27 = 1;
  v9 = sub_23EB1B0B0();
  v11 = v10;
  v24 = v9;
  v26 = 2;
  swift_bridgeObjectRetain();
  v12 = sub_23EB1B0B0();
  v14 = v13;
  v22 = v12;
  v25 = 0;
  swift_bridgeObjectRetain();
  v23 = v14;
  v15 = sub_23EB1B0B0();
  v17 = v16;
  v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  *a2 = v18;
  a2[1] = v17;
  v19 = v23;
  a2[2] = v24;
  a2[3] = v11;
  a2[4] = v22;
  a2[5] = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t EnergyWindow.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433E738);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v11[1] = v1[1];
  v11[2] = v7;
  v8 = v1[4];
  v11[3] = v1[5];
  v11[4] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23EB1876C();
  sub_23EB1B188();
  v14 = 1;
  v9 = v11[5];
  sub_23EB1B0D4();
  if (!v9)
  {
    v13 = 2;
    sub_23EB1B0D4();
    v12 = 0;
    sub_23EB1B0D4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23EB17288@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return EnergyWindow.init(from:)(a1, a2);
}

uint64_t sub_23EB1729C(_QWORD *a1)
{
  return EnergyWindow.encode(to:)(a1);
}

HomeServices::EnergyWindowRating_optional __swiftcall EnergyWindowRating.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HomeServices::EnergyWindowRating_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23EB1B08C();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_23EB1730C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23EAF4ED8(*a1, *a2);
}

uint64_t sub_23EB17318()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

uint64_t sub_23EB173A4()
{
  sub_23EB1AC90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB1740C()
{
  sub_23EB1B158();
  sub_23EB1AC90();
  swift_bridgeObjectRelease();
  return sub_23EB1B170();
}

HomeServices::EnergyWindowRating_optional sub_23EB17494(Swift::String *a1)
{
  return EnergyWindowRating.init(rawValue:)(*a1);
}

void sub_23EB174A0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xE400000000000000;
  v5 = 1146048327;
  if (v2 != 1)
  {
    v5 = 0x5453524F57;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1414743362;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_23EB174EC()
{
  sub_23EB1A148();
  return sub_23EB1AE28();
}

uint64_t sub_23EB17548()
{
  sub_23EB1A148();
  return sub_23EB1AE1C();
}

void sub_23EB17594(_QWORD *a1@<X8>)
{
  *a1 = &unk_250F41D50;
}

BOOL static NetworkInternalError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void NetworkError.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = sub_23EB1AA68();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for NetworkError(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23EB187C4(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_23EB176A4 + 4 * byte_23EB1CA56[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23EB176A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  *(_QWORD *)(v4 - 80) = 0;
  *(_QWORD *)(v4 - 72) = 0xE000000000000000;
  sub_23EB1AFCC();
  v5 = *(_QWORD *)(v4 - 72);
  *(_QWORD *)(v4 - 80) = *(_QWORD *)(v4 - 80);
  *(_QWORD *)(v4 - 72) = v5;
  sub_23EB1AD74();
  sub_23EB1B038();
  sub_23EB1AD74();
  v6 = *(_QWORD *)(v4 - 80);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v6;
}

unint64_t NetworkInternalError.errorDescription.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000027;
  if (*v0 == 1)
    v1 = 0xD000000000000032;
  if (*v0)
    return v1;
  else
    return 0xD00000000000002BLL;
}

uint64_t NetworkInternalError.hash(into:)()
{
  return sub_23EB1B164();
}

uint64_t NetworkInternalError.hashValue.getter()
{
  sub_23EB1B158();
  sub_23EB1B164();
  return sub_23EB1B170();
}

uint64_t sub_23EB179A0(uint64_t a1, uint64_t a2)
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
  BOOL v13;
  BOOL v14;
  BOOL v15;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    v3 = a2;
    if (a1 != a2)
    {
      v4 = 0;
      v17 = a1;
      while (1)
      {
        v5 = *(_QWORD *)(a1 + v4 + 48);
        v6 = *(_QWORD *)(a1 + v4 + 56);
        v7 = *(_QWORD *)(a1 + v4 + 64);
        v8 = *(_QWORD *)(a1 + v4 + 72);
        v9 = *(_QWORD *)(v3 + v4 + 48);
        v10 = *(_QWORD *)(v3 + v4 + 56);
        v11 = *(_QWORD *)(v3 + v4 + 64);
        v12 = *(_QWORD *)(v3 + v4 + 72);
        v13 = *(_QWORD *)(a1 + v4 + 32) == *(_QWORD *)(v3 + v4 + 32)
           && *(_QWORD *)(a1 + v4 + 40) == *(_QWORD *)(v3 + v4 + 40);
        if (!v13 && (sub_23EB1B0F8() & 1) == 0)
          break;
        v14 = v5 == v9 && v6 == v10;
        if (!v14 && (sub_23EB1B0F8() & 1) == 0)
          break;
        v15 = v7 == v11 && v8 == v12;
        if (!v15 && (sub_23EB1B0F8() & 1) == 0)
          break;
        v4 += 48;
        --v2;
        a1 = v17;
        v3 = a2;
        if (!v2)
          return 1;
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_23EB17AB0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_23EB1B0F8(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_23EB1B0F8() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t _s12HomeServices12EnergyWindowV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  char v12;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (v10 = sub_23EB1B0F8(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (v12 = sub_23EB1B0F8(), result = 0, (v12 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
        return 1;
      else
        return sub_23EB1B0F8();
    }
  }
  return result;
}

void _s12HomeServices12NetworkErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD v13[4];

  v4 = sub_23EB1AA68();
  v13[0] = *(_QWORD *)(v4 - 8);
  v13[1] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for NetworkError(0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DAED70);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v13 + *(int *)(v9 + 48) - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EB187C4(a1, (uint64_t)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for NetworkError);
  sub_23EB187C4(a2, (uint64_t)v11, type metadata accessor for NetworkError);
  v12 = (char *)sub_23EB17DC0 + 4 * byte_23EB1CA5D[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_23EB17DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  sub_23EB187C4(v0, v2, type metadata accessor for NetworkError);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 112) + 8))(v2, *(_QWORD *)(v4 - 104));
    sub_23EAEC540(v0, &qword_256DAED70);
    return 0;
  }
  else
  {
    v6 = *(_QWORD *)(v4 - 112);
    v7 = v3;
    v8 = *(_QWORD *)(v4 - 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v7, v8);
    sub_23EAEF3B0(&qword_256DAEB28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF5D8], MEMORY[0x24BDCF5F0]);
    sub_23EB1AE10();
    sub_23EB1AE10();
    v5 = *(_QWORD *)(v4 - 88) == *(_QWORD *)(v4 - 96);
    v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9(v1, v8);
    v9(v2, v8);
    sub_23EAFD9A4(v0, type metadata accessor for NetworkError);
  }
  return v5;
}

uint64_t _s12HomeServices13EnergyWindowsV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
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
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  _BYTE *v34;
  void (*v35)(_BYTE *, uint64_t);
  int *v36;
  _BYTE *v37;
  uint64_t *v38;
  uint64_t v39;
  unsigned int (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t result;
  _BYTE *v43;
  char v44;
  void (*v45)(_BYTE *, uint64_t);
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  _BYTE v61[12];
  int v62;
  unsigned int (*v63)(uint64_t, uint64_t, uint64_t);
  int *v64;
  uint64_t *v65;
  uint64_t v66;
  _BYTE *v67;
  _BYTE *v68;
  _BYTE *v69;
  uint64_t *v70;

  v4 = sub_23EB1A954();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v67 = &v61[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E330);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v68 = &v61[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v61[-v10];
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = &v61[-v15];
  v17 = MEMORY[0x24BDAC7A8](v14);
  v69 = &v61[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = &v61[-v20];
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = &v61[-v23];
  MEMORY[0x24BDAC7A8](v22);
  v27 = &v61[-v26];
  v70 = a1;
  v28 = *a1;
  v29 = *a2;
  if (*a1)
  {
    if (!v29)
      return 0;
    v66 = v25;
    if ((sub_23EB179A0(v28, v29) & 1) == 0)
      return 0;
  }
  else
  {
    v66 = v25;
    if (v29)
      return 0;
  }
  v30 = type metadata accessor for EnergyWindows(0);
  sub_23EB1414C((uint64_t)v70 + *(int *)(v30 + 20), (uint64_t)v27);
  v64 = (int *)v30;
  v65 = a2;
  sub_23EB1414C((uint64_t)a2 + *(int *)(v30 + 20), (uint64_t)v24);
  v31 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_23EB1414C((uint64_t)v27, (uint64_t)v11);
  sub_23EB1414C((uint64_t)v24, v31);
  v32 = v5;
  v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v33((uint64_t)v11, 1, v4) == 1)
  {
    sub_23EAEC540((uint64_t)v24, (uint64_t *)&unk_25433E788);
    sub_23EAEC540((uint64_t)v27, (uint64_t *)&unk_25433E788);
    if (v33(v31, 1, v4) != 1)
      goto LABEL_17;
    v63 = v33;
    sub_23EAEC540((uint64_t)v11, (uint64_t *)&unk_25433E788);
  }
  else
  {
    sub_23EB1414C((uint64_t)v11, (uint64_t)v21);
    if (v33(v31, 1, v4) == 1)
    {
      sub_23EAEC540((uint64_t)v24, (uint64_t *)&unk_25433E788);
      sub_23EAEC540((uint64_t)v27, (uint64_t *)&unk_25433E788);
      (*(void (**)(_BYTE *, uint64_t))(v32 + 8))(v21, v4);
      goto LABEL_17;
    }
    v63 = v33;
    v34 = v67;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v32 + 32))(v67, v31, v4);
    sub_23EAEF3B0(&qword_25433E328, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
    v62 = sub_23EB1ACC0();
    v35 = *(void (**)(_BYTE *, uint64_t))(v32 + 8);
    v35(v34, v4);
    sub_23EAEC540((uint64_t)v24, (uint64_t *)&unk_25433E788);
    sub_23EAEC540((uint64_t)v27, (uint64_t *)&unk_25433E788);
    v35(v21, v4);
    sub_23EAEC540((uint64_t)v11, (uint64_t *)&unk_25433E788);
    if ((v62 & 1) == 0)
      return 0;
  }
  v36 = v64;
  v37 = v69;
  sub_23EB1414C((uint64_t)v70 + v64[6], (uint64_t)v69);
  v38 = v65;
  sub_23EB1414C((uint64_t)v65 + v36[6], (uint64_t)v16);
  v11 = v68;
  v39 = (uint64_t)&v68[*(int *)(v7 + 48)];
  sub_23EB1414C((uint64_t)v37, (uint64_t)v68);
  sub_23EB1414C((uint64_t)v16, v39);
  v40 = v63;
  if (v63((uint64_t)v11, 1, v4) == 1)
  {
    sub_23EAEC540((uint64_t)v16, (uint64_t *)&unk_25433E788);
    sub_23EAEC540((uint64_t)v37, (uint64_t *)&unk_25433E788);
    if (v40(v39, 1, v4) == 1)
    {
      sub_23EAEC540((uint64_t)v11, (uint64_t *)&unk_25433E788);
      goto LABEL_21;
    }
LABEL_17:
    sub_23EAEC540((uint64_t)v11, (uint64_t *)&unk_25433E330);
    return 0;
  }
  v41 = v66;
  sub_23EB1414C((uint64_t)v11, v66);
  if (v40(v39, 1, v4) == 1)
  {
    sub_23EAEC540((uint64_t)v16, (uint64_t *)&unk_25433E788);
    sub_23EAEC540((uint64_t)v69, (uint64_t *)&unk_25433E788);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v41, v4);
    goto LABEL_17;
  }
  v43 = v67;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v32 + 32))(v67, v39, v4);
  sub_23EAEF3B0(&qword_25433E328, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v44 = sub_23EB1ACC0();
  v45 = *(void (**)(_BYTE *, uint64_t))(v32 + 8);
  v45(v43, v4);
  sub_23EAEC540((uint64_t)v16, (uint64_t *)&unk_25433E788);
  sub_23EAEC540((uint64_t)v69, (uint64_t *)&unk_25433E788);
  v45((_BYTE *)v41, v4);
  v38 = v65;
  sub_23EAEC540((uint64_t)v11, (uint64_t *)&unk_25433E788);
  if ((v44 & 1) == 0)
    return 0;
LABEL_21:
  v46 = v36[7];
  v47 = (uint64_t *)((char *)v70 + v46);
  v48 = *(uint64_t *)((char *)v70 + v46 + 8);
  v49 = (uint64_t *)((char *)v38 + v46);
  v50 = v49[1];
  if (v48)
  {
    if (!v50)
      return 0;
    if (*v47 != *v49 || v48 != v50)
    {
      v51 = sub_23EB1B0F8();
      result = 0;
      if ((v51 & 1) == 0)
        return result;
    }
  }
  else if (v50)
  {
    return 0;
  }
  v52 = v36[8];
  v53 = (uint64_t *)((char *)v70 + v52);
  v54 = *(uint64_t *)((char *)v70 + v52 + 8);
  v55 = (uint64_t *)((char *)v38 + v52);
  v56 = v55[1];
  if (!v54)
  {
    if (v56)
      return 0;
LABEL_35:
    v58 = v36[9];
    v59 = *(_QWORD **)((char *)v70 + v58);
    v60 = *(_QWORD **)((char *)v38 + v58);
    if (v59)
    {
      if (v60 && (sub_23EB17AB0(v59, v60) & 1) != 0)
        return 1;
    }
    else if (!v60)
    {
      return 1;
    }
    return 0;
  }
  if (!v56)
    return 0;
  if (*v53 == *v55 && v54 == v56)
    goto LABEL_35;
  v57 = sub_23EB1B0F8();
  result = 0;
  if ((v57 & 1) != 0)
    goto LABEL_35;
  return result;
}

unint64_t sub_23EB185D8()
{
  unint64_t result;

  result = qword_25433E7D0;
  if (!qword_25433E7D0)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D178, &type metadata for EnergyWindows.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7D0);
  }
  return result;
}

unint64_t sub_23EB1861C()
{
  unint64_t result;

  result = qword_25433E690;
  if (!qword_25433E690)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for EnergyWindow, &type metadata for EnergyWindow);
    atomic_store(result, (unint64_t *)&qword_25433E690);
  }
  return result;
}

uint64_t sub_23EB18660(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25433E800);
    v8 = a2();
    result = MEMORY[0x242657D10](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23EB186C8()
{
  unint64_t result;

  result = qword_25433E7C8;
  if (!qword_25433E7C8)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for EnergyWindow, &type metadata for EnergyWindow);
    atomic_store(result, (unint64_t *)&qword_25433E7C8);
  }
  return result;
}

uint64_t sub_23EB1870C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25433E810);
    v8 = a2;
    result = MEMORY[0x242657D10](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23EB1876C()
{
  unint64_t result;

  result = qword_25433E7B0;
  if (!qword_25433E7B0)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D128, &type metadata for EnergyWindow.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7B0);
  }
  return result;
}

uint64_t type metadata accessor for NetworkError(uint64_t a1)
{
  return sub_23EAEBB14(a1, qword_25433E218);
}

uint64_t sub_23EB187C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_23EB1880C()
{
  unint64_t result;

  result = qword_256DAED30;
  if (!qword_256DAED30)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for EnergyWindowRating, &type metadata for EnergyWindowRating);
    atomic_store(result, (unint64_t *)&qword_256DAED30);
  }
  return result;
}

unint64_t sub_23EB18854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256DAED38;
  if (!qword_256DAED38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256DAED40);
    result = MEMORY[0x242657D10](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256DAED38);
  }
  return result;
}

uint64_t sub_23EB188A0()
{
  return sub_23EAEF3B0((unint64_t *)&qword_256DAE978, type metadata accessor for NetworkError, (uint64_t)&protocol conformance descriptor for NetworkError);
}

unint64_t sub_23EB188D0()
{
  unint64_t result;

  result = qword_256DAED48;
  if (!qword_256DAED48)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for NetworkInternalError, &type metadata for NetworkInternalError);
    atomic_store(result, (unint64_t *)&qword_256DAED48);
  }
  return result;
}

unint64_t sub_23EB18918()
{
  unint64_t result;

  result = qword_256DAED50;
  if (!qword_256DAED50)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for NetworkInternalError, &type metadata for NetworkInternalError);
    atomic_store(result, (unint64_t *)&qword_256DAED50);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyServices()
{
  return &type metadata for EnergyServices;
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergyWindows(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23EB1A954();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[6];
    v16 = (char *)v7 + v15;
    v17 = (char *)a2 + v15;
    if (v13((char *)a2 + v15, 1, v11))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v17, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    }
    v19 = a3[7];
    v20 = a3[8];
    v21 = (uint64_t *)((char *)v7 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = (uint64_t *)((char *)v7 + v20);
    v25 = (uint64_t *)((char *)a2 + v20);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for EnergyWindows(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23EB1A954();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EnergyWindows(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;

  *a1 = *(_QWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_23EB1A954();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[7];
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = &a2[v17];
  v21 = *((_QWORD *)v20 + 1);
  *v19 = *(_QWORD *)v20;
  v19[1] = v21;
  v22 = (_QWORD *)((char *)a1 + v18);
  v23 = &a2[v18];
  v24 = *((_QWORD *)v23 + 1);
  *v22 = *(_QWORD *)v23;
  v22[1] = v24;
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for EnergyWindows(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;

  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_23EB1A954();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = (_QWORD *)((char *)a2 + v21);
  *(_QWORD *)v22 = *v23;
  *((_QWORD *)v22 + 1) = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = (_QWORD *)((char *)a2 + v24);
  *(_QWORD *)v25 = *v26;
  *((_QWORD *)v25 + 1) = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for EnergyWindows(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  *a1 = *(_QWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_23EB1A954();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)&a2[v17];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)&a2[a3[9]];
  return a1;
}

char *assignWithTake for EnergyWindows(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_23EB1A954();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *(_QWORD *)v22 = v25;
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v26 = a3[8];
  v27 = &a1[v26];
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *(_QWORD *)v27 = v30;
  *((_QWORD *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23EB1934C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

char *sub_23EB193D8(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433E788);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t destroy for EnergyWindow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EnergyWindow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EnergyWindow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for EnergyWindow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyWindow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergyWindow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  else
  {
    v8 = sub_23EB1AA68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for NetworkError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if (!(_DWORD)result)
  {
    v3 = sub_23EB1AA68();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_23EB1AA68();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23EAFD9A4((uint64_t)a1, type metadata accessor for NetworkError);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_23EB1AA68();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_23EB1AA68();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23EAFD9A4((uint64_t)a1, type metadata accessor for NetworkError);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_23EB1AA68();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23EB199C4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23EB199D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EB1AA68();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkInternalError()
{
  return &type metadata for NetworkInternalError;
}

uint64_t _s12HomeServices18EnergyWindowRatingOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23EB19AAC + 4 * byte_23EB1CA69[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23EB19AE0 + 4 * byte_23EB1CA64[v4]))();
}

uint64_t sub_23EB19AE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB19AE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB19AF0);
  return result;
}

uint64_t sub_23EB19AFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB19B04);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23EB19B08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB19B10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EnergyWindow.CodingKeys()
{
  return &type metadata for EnergyWindow.CodingKeys;
}

uint64_t getEnumTagSinglePayload for EnergyWindows.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergyWindows.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23EB19C08 + 4 * byte_23EB1CA73[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23EB19C3C + 4 * byte_23EB1CA6E[v4]))();
}

uint64_t sub_23EB19C3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB19C44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23EB19C4CLL);
  return result;
}

uint64_t sub_23EB19C58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23EB19C60);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23EB19C64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23EB19C6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EnergyWindows.CodingKeys()
{
  return &type metadata for EnergyWindows.CodingKeys;
}

unint64_t sub_23EB19C8C()
{
  unint64_t result;

  result = qword_256DAED58;
  if (!qword_256DAED58)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D010, &type metadata for EnergyWindows.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DAED58);
  }
  return result;
}

unint64_t sub_23EB19CD4()
{
  unint64_t result;

  result = qword_256DAED60;
  if (!qword_256DAED60)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D100, &type metadata for EnergyWindow.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256DAED60);
  }
  return result;
}

unint64_t sub_23EB19D1C()
{
  unint64_t result;

  result = qword_25433E7C0;
  if (!qword_25433E7C0)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D038, &type metadata for EnergyWindow.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7C0);
  }
  return result;
}

unint64_t sub_23EB19D64()
{
  unint64_t result;

  result = qword_25433E7B8;
  if (!qword_25433E7B8)
  {
    result = MEMORY[0x242657D10](&unk_23EB1D060, &type metadata for EnergyWindow.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7B8);
  }
  return result;
}

unint64_t sub_23EB19DAC()
{
  unint64_t result;

  result = qword_25433E7E0;
  if (!qword_25433E7E0)
  {
    result = MEMORY[0x242657D10](&unk_23EB1CF80, &type metadata for EnergyWindows.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7E0);
  }
  return result;
}

unint64_t sub_23EB19DF4()
{
  unint64_t result;

  result = qword_25433E7D8;
  if (!qword_25433E7D8)
  {
    result = MEMORY[0x242657D10](&unk_23EB1CFA8, &type metadata for EnergyWindows.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25433E7D8);
  }
  return result;
}

uint64_t sub_23EB19E38(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73776F646E6977 && a2 == 0xE700000000000000;
  if (v2 || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E5564696C6176 && a2 == 0xEA00000000006C69 || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F724664696C6176 && a2 == 0xE90000000000006DLL || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000 || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69 || (sub_23EB1B0F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x727245646C656966 && a2 == 0xEB0000000073726FLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23EB1B0F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_23EB1A100()
{
  unint64_t v0;

  v0 = sub_23EB1B08C();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_23EB1A148()
{
  unint64_t result;

  result = qword_256DAED68;
  if (!qword_256DAED68)
  {
    result = MEMORY[0x242657D10](&protocol conformance descriptor for EnergyWindowRating, &type metadata for EnergyWindowRating);
    atomic_store(result, (unint64_t *)&qword_256DAED68);
  }
  return result;
}

uint64_t sub_23EB1A18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t *v19;
  void *v20;

  v8 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle) = 0;
  *(_BYTE *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_atEof) = 0;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_chunkSize) = a6;
  v9 = v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_encoding;
  v10 = sub_23EB1AD14();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, a5, v10);
  v12 = (void *)sub_23EB1ACCC();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_fileHandleForReadingAtPath_, v12);

  if (!v13)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
    swift_bridgeObjectRelease();
LABEL_9:
    v20 = *(void **)(v6 + v8);
    *(_QWORD *)(v6 + v8) = 0;

    *(_OWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData) = xmmword_23EB1D1D0;
    *(_QWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_buffer) = 0;
    swift_release();
    return 0;
  }
  v14 = sub_23EB1ACE4();
  v16 = v15;
  swift_bridgeObjectRelease();
  if (v16 >> 60 == 15)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
LABEL_8:

    goto LABEL_9;
  }
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEC8]), sel_initWithCapacity_, a6);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
  if (!v17)
  {
    sub_23EB03144(v14, v16);
    goto LABEL_8;
  }
  v18 = *(void **)(v6 + v8);
  *(_QWORD *)(v6 + v8) = v13;

  v19 = (uint64_t *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData);
  *v19 = v14;
  v19[1] = v16;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_buffer) = v17;
  return v6;
}

uint64_t sub_23EB1A38C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle), sel_closeFile);
  v2 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = 0;

  v3 = v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_encoding;
  v4 = sub_23EB1AD14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_23EB03144(*(_QWORD *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData), *(_QWORD *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData + 8));
  return swift_deallocClassInstance();
}

uint64_t sub_23EB1A434()
{
  return type metadata accessor for StreamReader();
}

uint64_t type metadata accessor for StreamReader()
{
  uint64_t result;

  result = qword_256DAEDA0;
  if (!qword_256DAEDA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23EB1A478()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23EB1AD14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23EB1A510()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_23EB1A51C()
{
  return MEMORY[0x24BDCAFF0]();
}

uint64_t sub_23EB1A528()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_23EB1A534()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_23EB1A540()
{
  return MEMORY[0x24BDCB040]();
}

uint64_t sub_23EB1A54C()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_23EB1A558()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_23EB1A564()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_23EB1A570()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_23EB1A57C()
{
  return MEMORY[0x24BDCB0A0]();
}

uint64_t sub_23EB1A588()
{
  return MEMORY[0x24BDCB0B0]();
}

uint64_t sub_23EB1A594()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_23EB1A5A0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23EB1A5AC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23EB1A5B8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23EB1A5C4()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23EB1A5D0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23EB1A5DC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23EB1A5E8()
{
  return MEMORY[0x24BDCB668]();
}

uint64_t sub_23EB1A5F4()
{
  return MEMORY[0x24BDCB6A8]();
}

uint64_t sub_23EB1A600()
{
  return MEMORY[0x24BDCB6D0]();
}

uint64_t sub_23EB1A60C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23EB1A618()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23EB1A624()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_23EB1A630()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_23EB1A63C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23EB1A648()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_23EB1A654()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_23EB1A660()
{
  return MEMORY[0x24BDCBA78]();
}

uint64_t sub_23EB1A66C()
{
  return MEMORY[0x24BDCBA80]();
}

uint64_t sub_23EB1A678()
{
  return MEMORY[0x24BDCBA90]();
}

uint64_t sub_23EB1A684()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_23EB1A690()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23EB1A69C()
{
  return MEMORY[0x24BDCBB08]();
}

uint64_t sub_23EB1A6A8()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_23EB1A6B4()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23EB1A6C0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23EB1A6CC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23EB1A6D8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23EB1A6E4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23EB1A6F0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23EB1A6FC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23EB1A708()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23EB1A714()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_23EB1A720()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_23EB1A72C()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_23EB1A738()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_23EB1A744()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23EB1A750()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_23EB1A75C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_23EB1A768()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_23EB1A774()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23EB1A780()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_23EB1A78C()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_23EB1A798()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23EB1A7A4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23EB1A7B0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23EB1A7BC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23EB1A7C8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23EB1A7D4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_23EB1A7E0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23EB1A7EC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23EB1A7F8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23EB1A804()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_23EB1A810()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23EB1A81C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23EB1A828()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23EB1A834()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23EB1A840()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23EB1A84C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23EB1A858()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23EB1A864()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_23EB1A870()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23EB1A87C()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23EB1A888()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_23EB1A894()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23EB1A8A0()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_23EB1A8AC()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_23EB1A8B8()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_23EB1A8C4()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_23EB1A8D0()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_23EB1A8DC()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_23EB1A8E8()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23EB1A8F4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23EB1A900()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23EB1A90C()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_23EB1A918()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_23EB1A924()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23EB1A930()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23EB1A93C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23EB1A948()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23EB1A954()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23EB1A960()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_23EB1A96C()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_23EB1A978()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23EB1A984()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23EB1A990()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23EB1A99C()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_23EB1A9A8()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_23EB1A9B4()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_23EB1A9C0()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_23EB1A9CC()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t sub_23EB1A9D8()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23EB1A9E4()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23EB1A9F0()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23EB1A9FC()
{
  return MEMORY[0x24BDCF4B0]();
}

uint64_t sub_23EB1AA08()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_23EB1AA14()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_23EB1AA20()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23EB1AA2C()
{
  return MEMORY[0x24BDCF560]();
}

uint64_t sub_23EB1AA38()
{
  return MEMORY[0x24BDCF578]();
}

uint64_t sub_23EB1AA44()
{
  return MEMORY[0x24BDCF5A0]();
}

uint64_t sub_23EB1AA50()
{
  return MEMORY[0x24BDCF5A8]();
}

uint64_t sub_23EB1AA5C()
{
  return MEMORY[0x24BDCF5B8]();
}

uint64_t sub_23EB1AA68()
{
  return MEMORY[0x24BDCF5D8]();
}

uint64_t sub_23EB1AA74()
{
  return MEMORY[0x24BDCF5F8]();
}

uint64_t sub_23EB1AA80()
{
  return MEMORY[0x24BDCF610]();
}

uint64_t sub_23EB1AA8C()
{
  return MEMORY[0x24BDBD738]();
}

uint64_t sub_23EB1AA98()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_23EB1AAA4()
{
  return MEMORY[0x24BEE7408]();
}

uint64_t sub_23EB1AAB0()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_23EB1AABC()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_23EB1AAC8()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_23EB1AAD4()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_23EB1AAE0()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_23EB1AAEC()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_23EB1AAF8()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_23EB1AB04()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_23EB1AB10()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_23EB1AB1C()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_23EB1AB28()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_23EB1AB34()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_23EB1AB40()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_23EB1AB4C()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_23EB1AB58()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_23EB1AB64()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_23EB1AB70()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_23EB1AB7C()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_23EB1AB88()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_23EB1AB94()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23EB1ABA0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23EB1ABAC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23EB1ABB8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23EB1ABC4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23EB1ABD0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23EB1ABDC()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23EB1ABE8()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23EB1ABF4()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23EB1AC00()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_23EB1AC0C()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_23EB1AC18()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_23EB1AC24()
{
  return MEMORY[0x24BDC66E0]();
}

uint64_t sub_23EB1AC30()
{
  return MEMORY[0x24BDC6AC0]();
}

uint64_t sub_23EB1AC3C()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_23EB1AC48()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23EB1AC54()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_23EB1AC60()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23EB1AC6C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23EB1AC78()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23EB1AC84()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23EB1AC90()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_23EB1AC9C()
{
  return MEMORY[0x24BEE75B8]();
}

uint64_t sub_23EB1ACA8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23EB1ACB4()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23EB1ACC0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23EB1ACCC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23EB1ACD8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23EB1ACE4()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23EB1ACF0()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23EB1ACFC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23EB1AD08()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23EB1AD14()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23EB1AD20()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23EB1AD2C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23EB1AD38()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23EB1AD44()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23EB1AD50()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23EB1AD5C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23EB1AD68()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_23EB1AD74()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23EB1AD80()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23EB1AD8C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_23EB1AD98()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23EB1ADA4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23EB1ADB0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23EB1ADBC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23EB1ADC8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23EB1ADD4()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23EB1ADE0()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_23EB1ADEC()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23EB1ADF8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23EB1AE04()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23EB1AE10()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23EB1AE1C()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23EB1AE28()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23EB1AE34()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23EB1AE40()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23EB1AE4C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23EB1AE58()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23EB1AE64()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23EB1AE70()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_23EB1AE7C()
{
  return MEMORY[0x24BDCFF28]();
}

uint64_t sub_23EB1AE88()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23EB1AE94()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23EB1AEA0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23EB1AEAC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23EB1AEB8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23EB1AEC4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23EB1AED0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23EB1AEDC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23EB1AEE8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23EB1AEF4()
{
  return MEMORY[0x24BDBD898]();
}

uint64_t sub_23EB1AF00()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_23EB1AF0C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23EB1AF18()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23EB1AF24()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23EB1AF30()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_23EB1AF3C()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_23EB1AF48()
{
  return MEMORY[0x24BDD0610]();
}

uint64_t sub_23EB1AF54()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23EB1AF60()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23EB1AF6C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23EB1AF78()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23EB1AF84()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23EB1AF90()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23EB1AF9C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23EB1AFA8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23EB1AFB4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23EB1AFC0()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23EB1AFCC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23EB1AFD8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23EB1AFE4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23EB1AFF0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23EB1AFFC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23EB1B008()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23EB1B014()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23EB1B020()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23EB1B02C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23EB1B038()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23EB1B044()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23EB1B050()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23EB1B05C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23EB1B068()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23EB1B074()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23EB1B080()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23EB1B08C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23EB1B098()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23EB1B0A4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23EB1B0B0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23EB1B0BC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23EB1B0C8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23EB1B0D4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23EB1B0E0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23EB1B0EC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23EB1B0F8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23EB1B104()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23EB1B110()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23EB1B11C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23EB1B128()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23EB1B134()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23EB1B140()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23EB1B14C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23EB1B158()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23EB1B164()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23EB1B170()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23EB1B17C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23EB1B188()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23EB1B194()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23EB1B1A0()
{
  return MEMORY[0x24BEE4A10]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  MEMORY[0x24BDDAF98]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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


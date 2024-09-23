uint64_t NSManagedObjectModel.makeManagedObjectModel(for:mergedWith:)(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  if (a2)
  {
    v5[3] = sub_2356F1D50();
    v5[0] = a2;
    v3 = a2;
    sub_2356F1EBC();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
    if (v7)
    {
      sub_2356F1D40(&v6, v8);
LABEL_6:
      swift_dynamicCast();
      return v5[0];
    }
  }
  else
  {
    sub_2356F1ED4();
    if (v7)
    {
      sub_2356F1D40(&v6, v8);
      sub_2356F1D50();
      goto LABEL_6;
    }
  }
  sub_2356F1CC0((uint64_t)&v6);
  return 0;
}

uint64_t sub_2356F1CC0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256262708);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D362C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *sub_2356F1D40(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2356F1D50()
{
  unint64_t result;

  result = qword_256262710;
  if (!qword_256262710)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256262710);
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

uint64_t static NSManagedObjectModel.makeManagedObjectModel(for:mergedWith:)(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];

  if (a2)
  {
    sub_2356F1EEC();
    v5[3] = sub_2356F1D50();
    v5[0] = a2;
    v3 = a2;
    sub_2356F1EC8();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
    if (v7)
    {
      sub_2356F1D40(&v6, v8);
LABEL_6:
      swift_dynamicCast();
      return v5[0];
    }
  }
  else
  {
    sub_2356F1EEC();
    sub_2356F1EE0();
    if (v7)
    {
      sub_2356F1D40(&v6, v8);
      sub_2356F1D50();
      goto LABEL_6;
    }
  }
  sub_2356F1CC0((uint64_t)&v6);
  return 0;
}

uint64_t sub_2356F1EBC()
{
  return MEMORY[0x24BDEAB20]();
}

uint64_t sub_2356F1EC8()
{
  return MEMORY[0x24BDEAB28]();
}

uint64_t sub_2356F1ED4()
{
  return MEMORY[0x24BDEAB30]();
}

uint64_t sub_2356F1EE0()
{
  return MEMORY[0x24BDEAB38]();
}

uint64_t sub_2356F1EEC()
{
  return MEMORY[0x24BDEAC20]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}


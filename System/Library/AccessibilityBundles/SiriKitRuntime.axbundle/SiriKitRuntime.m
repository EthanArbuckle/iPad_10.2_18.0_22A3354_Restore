id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25035A908, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXIsPluginAllowedInClarity()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v0 = sub_2329DD860();
  v2 = v1;
  v3 = (_QWORD *)sub_2329DD86C();
  LOBYTE(v0) = sub_2329DD3F0(v0, v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_2329DD3F0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  char *v5;
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
  int v17;
  char v18;
  void (*v20)(char *, uint64_t);
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25421A6F8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2329DD854();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - v11;
  sub_2329DD83C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_2329DD738((uint64_t)v5);
LABEL_20:
    v18 = 1;
    return v18 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
  v13 = sub_2329DD848();
  if (!v14)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    goto LABEL_20;
  }
  v15 = v13;
  v16 = v14;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
  if (v17 == *MEMORY[0x24BE98BD8]
    || v17 == *MEMORY[0x24BE98BF0]
    || v17 == *MEMORY[0x24BE98BF8]
    || v17 == *MEMORY[0x24BE98BE0]
    || v17 == *MEMORY[0x24BE98BC8]
    || v17 == *MEMORY[0x24BE98BE8]
    || v17 == *MEMORY[0x24BE98BB0]
    || v17 == *MEMORY[0x24BE98BB8]
    || v17 == *MEMORY[0x24BE98BD0]
    || v17 == *MEMORY[0x24BE98C00]
    || v17 == *MEMORY[0x24BE98C08]
    || v17 == *MEMORY[0x24BE98C10]
    || v17 == *MEMORY[0x24BE98C28])
  {
LABEL_22:
    v18 = sub_2329DD778(v15, v16, a3);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    swift_bridgeObjectRelease();
    return v18 & 1;
  }
  if (v17 != *MEMORY[0x24BE98C18])
  {
    if (v17 != *MEMORY[0x24BE98C20])
    {
      v20 = *(void (**)(char *, uint64_t))(v7 + 8);
      v20(v12, v6);
      swift_bridgeObjectRelease();
      v20(v10, v6);
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  swift_bridgeObjectRelease();
  v18 = 0;
  return v18 & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23491E308]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2329DD738(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25421A6F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2329DD778(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_2329DD878() & 1) != 0)
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
    if (v12 || (sub_2329DD878() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return sub_2329DD83C();
}

uint64_t sub_2329DD83C()
{
  return MEMORY[0x24BE98BA8]();
}

uint64_t sub_2329DD848()
{
  return MEMORY[0x24BE98BC0]();
}

uint64_t sub_2329DD854()
{
  return MEMORY[0x24BE98C30]();
}

uint64_t sub_2329DD860()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2329DD86C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2329DD878()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}


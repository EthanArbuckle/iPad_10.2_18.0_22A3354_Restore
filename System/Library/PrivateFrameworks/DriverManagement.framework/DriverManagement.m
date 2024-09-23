uint64_t DriverKitDriver.driverIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DriverKitDriver();
  return sub_23A72126C(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
}

uint64_t type metadata accessor for DriverKitDriver()
{
  uint64_t result;

  result = qword_2542D2FA0;
  if (!qword_2542D2FA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DriverKitDriver.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DriverKitDriver() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.usageText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DriverKitDriver() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DriverKitDriver.init(driverIdentifier:source:displayName:usageText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  int *v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  *a8 = a1;
  a8[1] = a2;
  v14 = (int *)type metadata accessor for DriverKitDriver();
  result = sub_23A721228(a3, (uint64_t)a8 + v14[5], (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
  v16 = (_QWORD *)((char *)a8 + v14[6]);
  *v16 = a4;
  v16[1] = a5;
  v17 = (_QWORD *)((char *)a8 + v14[7]);
  *v17 = a6;
  v17[1] = a7;
  return result;
}

BOOL sub_23A71F7AC(uint64_t *a1, uint64_t *a2)
{
  return (_s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_23A71F7D4(uint64_t *a1, uint64_t *a2)
{
  return (_s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_23A71F7F0(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(a2, a1);
}

uint64_t variable initialization expression of DriverKitDaemonClient.$__lazy_storage_$_connection()
{
  return 0;
}

uint64_t variable initialization expression of DriverKitDaemonClient.$__lazy_storage_$_clientIdentifier()
{
  return 0;
}

void sub_23A71F814(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_23A71F820(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A71F828@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_23A71F83C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_23A71F86C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A71F880(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23A71F894@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _s16DriverManagement0a3KitA0V2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v4 = (int *)type metadata accessor for DriverKitDriver();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v38 = (uint64_t)&v37 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v37 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v37 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v37 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - v19;
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    sub_23A72126C((uint64_t)a1, (uint64_t)&v37 - v19, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A72126C((uint64_t)a2, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  }
  else
  {
    v21 = sub_23A73C0A8();
    sub_23A72126C((uint64_t)a1, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A72126C((uint64_t)a2, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    if ((v21 & 1) == 0)
    {
      sub_23A7212B0((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      sub_23A7212B0((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      sub_23A72126C((uint64_t)a1, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      sub_23A72126C((uint64_t)a2, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      goto LABEL_15;
    }
  }
  v22 = _s16DriverManagement0a3KitA6SourceO21__derived_enum_equalsySbAC_ACtFZ_0((uint64_t)&v20[v4[5]], (uint64_t)&v18[v4[5]]);
  sub_23A7212B0((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A7212B0((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A72126C((uint64_t)a1, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A72126C((uint64_t)a2, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  if ((v22 & 1) == 0)
  {
LABEL_15:
    sub_23A7212B0((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    goto LABEL_16;
  }
  v23 = v4[6];
  v24 = &v15[v23];
  v25 = *(_QWORD *)&v15[v23 + 8];
  v26 = &v12[v23];
  v27 = *((_QWORD *)v26 + 1);
  if (!v25)
  {
    swift_bridgeObjectRetain();
    sub_23A7212B0((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    if (!v27)
    {
LABEL_24:
      v30 = v38;
      sub_23A72126C((uint64_t)a1, v38, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      sub_23A72126C((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      goto LABEL_25;
    }
    swift_bridgeObjectRelease();
LABEL_16:
    v30 = v38;
    sub_23A72126C((uint64_t)a1, v38, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A72126C((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    goto LABEL_17;
  }
  if (!v27)
  {
    swift_bridgeObjectRetain();
    sub_23A7212B0((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (*(_QWORD *)v24 == *(_QWORD *)v26 && v25 == v27)
  {
    swift_bridgeObjectRetain();
    sub_23A7212B0((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v29 = sub_23A73C0A8();
  swift_bridgeObjectRetain();
  sub_23A7212B0((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  swift_bridgeObjectRelease();
  v30 = v38;
  sub_23A72126C((uint64_t)a1, v38, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A72126C((uint64_t)a2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  if ((v29 & 1) == 0)
  {
LABEL_17:
    sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
LABEL_18:
    LOBYTE(v31) = 0;
    return v31 & 1;
  }
LABEL_25:
  v33 = v4[7];
  v34 = (_QWORD *)(v30 + v33);
  v35 = *(_QWORD *)(v30 + v33 + 8);
  v36 = &v7[v33];
  v31 = *((_QWORD *)v36 + 1);
  if (!v35)
  {
    swift_bridgeObjectRetain();
    sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    if (!v31)
    {
      LOBYTE(v31) = 1;
      return v31 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (v31)
  {
    if (*v34 == *(_QWORD *)v36 && v35 == v31)
      LOBYTE(v31) = 1;
    else
      LOBYTE(v31) = sub_23A73C0A8();
  }
  swift_bridgeObjectRetain();
  sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  swift_bridgeObjectRelease();
  return v31 & 1;
}

uint64_t _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  uint64_t (*v27)();
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)();
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v44 = type metadata accessor for SettingsApplicationRecord();
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v48 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)v43 - v6;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FC0);
  MEMORY[0x24BDAC7A8](v46);
  v45 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DriverKitDriverApp();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v43 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FD8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[1];
  v52 = *a1;
  v53 = v18;
  v19 = a2[1];
  v50 = *a2;
  v51 = v19;
  v20 = sub_23A7211E4();
  v49 = sub_23A73BEEC() == -1;
  v21 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
  v22 = (uint64_t)a2 + v21;
  v23 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_23A72126C((uint64_t)a1 + v21, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
  sub_23A72126C(v22, v23, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  LODWORD(v15) = v24(v17, 1, v8);
  v25 = v24((char *)v23, 1, v8);
  if ((_DWORD)v15 != 1)
  {
    v28 = (uint64_t)v45;
    v29 = v46;
    v43[1] = v20;
    v30 = (uint64_t)v12;
    v32 = (uint64_t)v47;
    v31 = (uint64_t)v48;
    if (v25 == 1)
    {
      v33 = type metadata accessor for DriverKitDriverApp;
      v34 = (uint64_t)v17;
    }
    else
    {
      sub_23A721228((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A721228(v23, v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      v23 = v28 + *(int *)(v29 + 48);
      sub_23A72126C((uint64_t)v14, v28, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A72126C(v30, v23, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A7205E4(*(_QWORD *)v28, *(_QWORD *)(v28 + 8));
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_23A7205E4(*(_QWORD *)v23, *(_QWORD *)(v23 + 8));
          return v49;
        }
        v27 = type metadata accessor for DriverKitDriverApp;
        goto LABEL_4;
      }
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_23A721228(v28, v32, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
        v36 = v31;
        sub_23A721228(v23, v31, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
        v37 = *(int *)(v44 + 36);
        v38 = *(_QWORD *)(v32 + v37 + 8);
        v52 = *(_QWORD *)(v32 + v37);
        v53 = v38;
        v39 = (uint64_t *)(v31 + v37);
        v41 = *v39;
        v40 = v39[1];
        v50 = v41;
        v51 = v40;
        v42 = sub_23A73BEEC();
        if (v42)
        {
          v26 = v42 == -1;
          sub_23A7212B0(v36, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v32, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        }
        else
        {
          sub_23A7212B0(v31, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v32, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          return v49;
        }
        return v26;
      }
      sub_23A7212B0(v30, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A7205E4(*(_QWORD *)v23, *(_QWORD *)(v23 + 8));
      v33 = type metadata accessor for SettingsApplicationRecord;
      v34 = v28;
    }
    sub_23A7212B0(v34, (uint64_t (*)(_QWORD))v33);
    return 0;
  }
  v26 = v49;
  if (v25 != 1)
  {
    v27 = type metadata accessor for DriverKitDriverSource;
LABEL_4:
    sub_23A7212B0(v23, (uint64_t (*)(_QWORD))v27);
    return 1;
  }
  return v26;
}

unint64_t sub_23A7201E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B4658;
  if (!qword_2569B4658)
  {
    v1 = type metadata accessor for DriverKitDriver();
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for DriverKitDriver, v1);
    atomic_store(result, (unint64_t *)&qword_2569B4658);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriver(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  char *v47;
  uint64_t v48;
  int *v49;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = type metadata accessor for DriverKitDriverApp();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = type metadata accessor for DriverKitDriverSource();
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v17 = *v10;
      if (EnumCaseMultiPayload == 1)
      {
        v18 = v10[1];
        sub_23A720478(v17, v18);
        *v9 = v17;
        v9[1] = v18;
      }
      else
      {
        v19 = v10[1];
        *v9 = v17;
        v9[1] = v19;
        v20 = (int *)type metadata accessor for SettingsApplicationRecord();
        v21 = v20[5];
        v46 = (char *)v10 + v21;
        v47 = (char *)v9 + v21;
        v22 = sub_23A73BBEC();
        v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
        swift_bridgeObjectRetain();
        v45(v47, v46, v22);
        v23 = v20[6];
        v24 = (char *)v9 + v23;
        v25 = (uint64_t *)((char *)v10 + v23);
        v26 = v25[1];
        if (v26 >> 60 == 15)
        {
          *(_OWORD *)v24 = *(_OWORD *)v25;
        }
        else
        {
          v48 = *v25;
          sub_23A720478(*v25, v26);
          *(_QWORD *)v24 = v48;
          *((_QWORD *)v24 + 1) = v26;
        }
        *(uint64_t *)((char *)v9 + v20[7]) = *(uint64_t *)((char *)v10 + v20[7]);
        v27 = v20[8];
        v49 = v20;
        v28 = (uint64_t *)((char *)v9 + v27);
        v29 = (uint64_t *)((char *)v10 + v27);
        v30 = *v29;
        v31 = v29[1];
        swift_bridgeObjectRetain();
        sub_23A720478(v30, v31);
        *v28 = v30;
        v28[1] = v31;
        v32 = v49[9];
        v33 = (uint64_t *)((char *)v9 + v32);
        v34 = (uint64_t *)((char *)v10 + v32);
        v35 = v34[1];
        *v33 = *v34;
        v33[1] = v35;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v36 = a3[6];
    v37 = a3[7];
    v38 = (uint64_t *)((char *)v4 + v36);
    v39 = (uint64_t *)((char *)a2 + v36);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = (uint64_t *)((char *)v4 + v37);
    v42 = (uint64_t *)((char *)a2 + v37);
    v43 = v42[1];
    *v41 = *v42;
    v41[1] = v43;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23A720478(uint64_t a1, unint64_t a2)
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

uint64_t destroy for DriverKitDriver(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for DriverKitDriverApp();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_23A7205E4(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
    }
    else
    {
      swift_bridgeObjectRelease();
      v6 = (int *)type metadata accessor for SettingsApplicationRecord();
      v7 = v4 + v6[5];
      v8 = sub_23A73BBEC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
      v9 = (uint64_t *)(v4 + v6[6]);
      v10 = v9[1];
      if (v10 >> 60 != 15)
        sub_23A7205E4(*v9, v10);
      swift_bridgeObjectRelease();
      sub_23A7205E4(*(_QWORD *)(v4 + v6[8]), *(_QWORD *)(v4 + v6[8] + 8));
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A7205E4(uint64_t a1, unint64_t a2)
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

_QWORD *initializeWithCopy for DriverKitDriver(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t *, uint64_t, uint64_t);
  uint64_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  char *v45;
  uint64_t v46;
  int *v47;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for DriverKitDriverApp();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = type metadata accessor for DriverKitDriverSource();
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v15 = *v9;
    if (EnumCaseMultiPayload == 1)
    {
      v16 = v9[1];
      sub_23A720478(v15, v16);
      *v8 = v15;
      v8[1] = v16;
    }
    else
    {
      v17 = v9[1];
      *v8 = v15;
      v8[1] = v17;
      v18 = (int *)type metadata accessor for SettingsApplicationRecord();
      v19 = v18[5];
      v44 = (char *)v9 + v19;
      v45 = (char *)v8 + v19;
      v20 = sub_23A73BBEC();
      v43 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
      swift_bridgeObjectRetain();
      v43(v45, v44, v20);
      v21 = v18[6];
      v22 = (char *)v8 + v21;
      v23 = (uint64_t *)((char *)v9 + v21);
      v24 = v23[1];
      if (v24 >> 60 == 15)
      {
        *(_OWORD *)v22 = *(_OWORD *)v23;
      }
      else
      {
        v46 = *v23;
        sub_23A720478(*v23, v24);
        *(_QWORD *)v22 = v46;
        *((_QWORD *)v22 + 1) = v24;
      }
      *(uint64_t *)((char *)v8 + v18[7]) = *(uint64_t *)((char *)v9 + v18[7]);
      v25 = v18[8];
      v47 = v18;
      v26 = (uint64_t *)((char *)v8 + v25);
      v27 = (uint64_t *)((char *)v9 + v25);
      v28 = *v27;
      v29 = v27[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v28, v29);
      *v26 = v28;
      v26[1] = v29;
      v30 = v47[9];
      v31 = (uint64_t *)((char *)v8 + v30);
      v32 = (uint64_t *)((char *)v9 + v30);
      v33 = v32[1];
      *v31 = *v32;
      v31[1] = v33;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v34 = a3[6];
  v35 = a3[7];
  v36 = (_QWORD *)((char *)a1 + v34);
  v37 = (_QWORD *)((char *)a2 + v34);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = (_QWORD *)((char *)a1 + v35);
  v40 = (_QWORD *)((char *)a2 + v35);
  v41 = v40[1];
  *v39 = *v40;
  v39[1] = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DriverKitDriver(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t *, uint64_t, uint64_t);
  int v12;
  int v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  int *v65;
  char *v66;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (_QWORD *)((char *)a2 + v6);
  v9 = type metadata accessor for DriverKitDriverApp();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v15 = *v8;
      if (EnumCaseMultiPayload == 1)
      {
        v16 = v8[1];
        sub_23A720478(v15, v16);
        *v7 = v15;
        v7[1] = v16;
      }
      else
      {
        *v7 = v15;
        v7[1] = v8[1];
        v21 = (int *)type metadata accessor for SettingsApplicationRecord();
        v22 = v21[5];
        v61 = (char *)v8 + v22;
        v63 = (char *)v7 + v22;
        v23 = sub_23A73BBEC();
        v60 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        v60(v63, v61, v23);
        v24 = v21[6];
        v25 = (char *)v7 + v24;
        v26 = (uint64_t *)((char *)v8 + v24);
        v27 = v26[1];
        if (v27 >> 60 == 15)
        {
          *(_OWORD *)v25 = *(_OWORD *)v26;
        }
        else
        {
          v64 = *v26;
          sub_23A720478(*v26, v27);
          *(_QWORD *)v25 = v64;
          *((_QWORD *)v25 + 1) = v27;
        }
        *(uint64_t *)((char *)v7 + v21[7]) = *(uint64_t *)((char *)v8 + v21[7]);
        v28 = v21[8];
        v65 = v21;
        v29 = (uint64_t *)((char *)v7 + v28);
        v30 = (uint64_t *)((char *)v8 + v28);
        v31 = *v30;
        v32 = v30[1];
        swift_bridgeObjectRetain();
        sub_23A720478(v31, v32);
        *v29 = v31;
        v29[1] = v32;
        v33 = v65[9];
        v34 = (uint64_t *)((char *)v7 + v33);
        v35 = (uint64_t *)((char *)v8 + v33);
        *v34 = *v35;
        v34[1] = v35[1];
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_16;
    }
LABEL_7:
    v17 = type metadata accessor for DriverKitDriverSource();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_16;
  }
  if (v13)
  {
    sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    v18 = swift_getEnumCaseMultiPayload();
    v19 = *v8;
    if (v18 == 1)
    {
      v20 = v8[1];
      sub_23A720478(v19, v20);
      *v7 = v19;
      v7[1] = v20;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *v7 = v19;
      v7[1] = v8[1];
      v43 = (int *)type metadata accessor for SettingsApplicationRecord();
      v44 = v43[5];
      v62 = (char *)v8 + v44;
      v66 = (char *)v7 + v44;
      v45 = sub_23A73BBEC();
      v46 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 16);
      swift_bridgeObjectRetain();
      v46(v66, v62, v45);
      v47 = v43[6];
      v48 = (char *)v7 + v47;
      v49 = (char *)v8 + v47;
      v50 = *((_QWORD *)v49 + 1);
      if (v50 >> 60 == 15)
      {
        *(_OWORD *)v48 = *(_OWORD *)v49;
      }
      else
      {
        v51 = *(_QWORD *)v49;
        sub_23A720478(*(_QWORD *)v49, *((_QWORD *)v49 + 1));
        *(_QWORD *)v48 = v51;
        *((_QWORD *)v48 + 1) = v50;
      }
      *(uint64_t *)((char *)v7 + v43[7]) = *(uint64_t *)((char *)v8 + v43[7]);
      v52 = v43[8];
      v53 = (uint64_t *)((char *)v7 + v52);
      v54 = (uint64_t *)((char *)v8 + v52);
      v55 = *v54;
      v56 = v54[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v55, v56);
      *v53 = v55;
      v53[1] = v56;
      v57 = v43[9];
      v58 = (uint64_t *)((char *)v7 + v57);
      v59 = (uint64_t *)((char *)v8 + v57);
      *v58 = *v59;
      v58[1] = v59[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_16:
  v36 = a3[6];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  *v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = a3[7];
  v40 = (_QWORD *)((char *)a1 + v39);
  v41 = (_QWORD *)((char *)a2 + v39);
  *v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriver(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (_OWORD *)((char *)a1 + v6);
  v8 = (_OWORD *)((char *)a2 + v6);
  v9 = type metadata accessor for DriverKitDriverApp();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = type metadata accessor for DriverKitDriverSource();
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      *v7 = *v8;
      v12 = (int *)type metadata accessor for SettingsApplicationRecord();
      v13 = v12[5];
      v14 = (char *)v7 + v13;
      v15 = (char *)v8 + v13;
      v16 = sub_23A73BBEC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      *(_OWORD *)((char *)v7 + v12[6]) = *(_OWORD *)((char *)v8 + v12[6]);
      *(_QWORD *)((char *)v7 + v12[7]) = *(_QWORD *)((char *)v8 + v12[7]);
      *(_OWORD *)((char *)v7 + v12[8]) = *(_OWORD *)((char *)v8 + v12[8]);
      *(_OWORD *)((char *)v7 + v12[9]) = *(_OWORD *)((char *)v8 + v12[9]);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v17 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  return a1;
}

_QWORD *assignWithTake for DriverKitDriver(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_OWORD *, uint64_t, uint64_t);
  int v13;
  int v14;
  size_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (_OWORD *)((char *)a1 + v7);
  v9 = (_OWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for DriverKitDriverApp();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_23A7212B0((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      if (!swift_getEnumCaseMultiPayload())
      {
        *v8 = *v9;
        v32 = (int *)type metadata accessor for SettingsApplicationRecord();
        v33 = v32[5];
        v34 = (char *)v8 + v33;
        v35 = (char *)v9 + v33;
        v36 = sub_23A73BBEC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v34, v35, v36);
        *(_OWORD *)((char *)v8 + v32[6]) = *(_OWORD *)((char *)v9 + v32[6]);
        *(_QWORD *)((char *)v8 + v32[7]) = *(_QWORD *)((char *)v9 + v32[7]);
        *(_OWORD *)((char *)v8 + v32[8]) = *(_OWORD *)((char *)v9 + v32[8]);
        *(_OWORD *)((char *)v8 + v32[9]) = *(_OWORD *)((char *)v9 + v32[9]);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v15 = *(_QWORD *)(v11 + 64);
      goto LABEL_8;
    }
    sub_23A7212B0((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
LABEL_7:
    v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for DriverKitDriverSource() - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v15);
    goto LABEL_14;
  }
  if (v14)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v8, v9, *(_QWORD *)(v11 + 64));
  }
  else
  {
    *v8 = *v9;
    v16 = (int *)type metadata accessor for SettingsApplicationRecord();
    v17 = v16[5];
    v18 = (char *)v8 + v17;
    v19 = (char *)v9 + v17;
    v20 = sub_23A73BBEC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
    *(_OWORD *)((char *)v8 + v16[6]) = *(_OWORD *)((char *)v9 + v16[6]);
    *(_QWORD *)((char *)v8 + v16[7]) = *(_QWORD *)((char *)v9 + v16[7]);
    *(_OWORD *)((char *)v8 + v16[8]) = *(_OWORD *)((char *)v9 + v16[8]);
    *(_OWORD *)((char *)v8 + v16[9]) = *(_OWORD *)((char *)v9 + v16[9]);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_14:
  v21 = a3[6];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = a3[7];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriver()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A721028(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for DriverKitDriverSource();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DriverKitDriver()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A7210B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for DriverKitDriverSource();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A721124()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DriverKitDriverSource();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B855D8C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A7211E4()
{
  unint64_t result;

  result = qword_2542D2EE0;
  if (!qword_2542D2EE0)
  {
    result = MEMORY[0x23B855DA4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2542D2EE0);
  }
  return result;
}

uint64_t sub_23A721228(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A72126C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A7212B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t DriverKitDriverApp.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE v14[8];
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for DriverKitDriverApp();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)&v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A7215E0(v1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = *v7;
    v9 = v7[1];
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v16 = 0xD00000000000002CLL;
    v17 = 0x800000023A73F560;
    sub_23A721630(v8, v9);
    v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
    sub_23A7219C4();
    sub_23A73BD3C();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    sub_23A7205E4(v8, v9);
    return v16;
  }
  else
  {
    sub_23A721A54((uint64_t)v7, (uint64_t)v4);
    v16 = 0;
    v17 = 0xE000000000000000;
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v16 = 544239681;
    v17 = 0xE400000000000000;
    swift_bridgeObjectRetain();
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    sub_23A721630(*(_QWORD *)&v4[*(int *)(v2 + 32)], *(_QWORD *)&v4[*(int *)(v2 + 32) + 8]);
    v15 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
    sub_23A7219C4();
    sub_23A73BD3C();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    v11 = v16;
    sub_23A7212B0((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  }
  return v11;
}

uint64_t type metadata accessor for DriverKitDriverApp()
{
  uint64_t result;

  result = qword_2542D2FB0;
  if (!qword_2542D2FB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A7215E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DriverKitDriverApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23A721630(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_23A721688(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v4 = BYTE6(v22);
  if (BYTE6(v22))
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = BYTE6(v22);
    sub_23A728288(0, BYTE6(v22), 0);
    v2 = *(_QWORD *)(v3 - 104);
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)a1;
      else
        v6 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(v3 - 136) = v22 & 0x3FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v3 - 128) = v1;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < (int)a1 || v6 >= a1 >> 32)
            goto LABEL_29;
          v7 = sub_23A73BB68();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_23A73BB80();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(a1 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(a1 + 24))
            goto LABEL_33;
          v12 = sub_23A73BB68();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_23A73BB80();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= BYTE6(v22))
          goto LABEL_30;
        *(_QWORD *)(v3 - 118) = a1;
        *(_WORD *)(v3 - 110) = v22;
        *(_BYTE *)(v3 - 108) = BYTE2(v22);
        *(_BYTE *)(v3 - 107) = BYTE3(v22);
        *(_BYTE *)(v3 - 106) = BYTE4(v22);
        *(_BYTE *)(v3 - 105) = BYTE5(v22);
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_23A73C950;
      *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v14 + 32) = v11;
      v15 = sub_23A73BD60();
      v17 = v16;
      *(_QWORD *)(v3 - 104) = v2;
      v19 = *(_QWORD *)(v2 + 16);
      v18 = *(_QWORD *)(v2 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_23A728288(v18 > 1, v19 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v19 + 1;
      v20 = v2 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x23A72199CLL);
  }
  return v2;
}

unint64_t sub_23A7219C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D2EF8;
  if (!qword_2542D2EF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542D2EF0);
    result = MEMORY[0x23B855DA4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2542D2EF8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B855D98](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A721A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SettingsApplicationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23A721A98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23A721ADC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23A721B10 + *((int *)qword_23A721BD0 + (v0 >> 62))))();
}

uint64_t sub_23A721B20@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_23A720478(v2, v1);
      sub_23A728064(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t _s16DriverManagement0a3KitA3AppO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  uint64_t (*v25)();
  uint64_t v26;
  char v27;
  uint64_t v29;

  v4 = type metadata accessor for SettingsApplicationRecord();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  v10 = type metadata accessor for DriverKitDriverApp();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (uint64_t *)((char *)&v29 - v15);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (uint64_t *)((char *)&v29 - v17);
  sub_23A7215E0(a1, (uint64_t)&v29 - v17);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_23A721A54((uint64_t)v18, (uint64_t)v9);
    sub_23A7215E0(a2, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_23A721A54((uint64_t)v13, (uint64_t)v7);
      sub_23A721A98(*(_QWORD *)&v9[*(int *)(v4 + 32)], *(_QWORD *)&v9[*(int *)(v4 + 32) + 8]);
      v24 = v27;
      sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
      sub_23A7212B0((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
      return v24 & 1;
    }
    sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    v25 = type metadata accessor for SettingsApplicationRecord;
    v26 = (uint64_t)v9;
    goto LABEL_7;
  }
  v19 = *v18;
  v20 = v18[1];
  sub_23A7215E0(a2, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_23A7205E4(v19, v20);
    v25 = type metadata accessor for DriverKitDriverApp;
    v26 = (uint64_t)v16;
LABEL_7:
    sub_23A7212B0(v26, (uint64_t (*)(_QWORD))v25);
    v24 = 0;
    return v24 & 1;
  }
  v21 = *v16;
  v22 = v16[1];
  sub_23A721A98(v19, v20);
  v24 = v23;
  sub_23A7205E4(v19, v20);
  sub_23A7205E4(v21, v22);
  return v24 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriverApp(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      v8 = a2[1];
      sub_23A720478(v7, v8);
      *a1 = v7;
      a1[1] = v8;
    }
    else
    {
      v10 = a2[1];
      *a1 = v7;
      a1[1] = v10;
      v11 = (int *)type metadata accessor for SettingsApplicationRecord();
      v12 = v11[5];
      v13 = (char *)a1 + v12;
      v14 = (char *)a2 + v12;
      v15 = sub_23A73BBEC();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      v17 = v11[6];
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = *((_QWORD *)v19 + 1);
      if (v20 >> 60 == 15)
      {
        *(_OWORD *)v18 = *(_OWORD *)v19;
      }
      else
      {
        v21 = *(_QWORD *)v19;
        sub_23A720478(*(_QWORD *)v19, *((_QWORD *)v19 + 1));
        *(_QWORD *)v18 = v21;
        *((_QWORD *)v18 + 1) = v20;
      }
      *(uint64_t *)((char *)a1 + v11[7]) = *(uint64_t *)((char *)a2 + v11[7]);
      v22 = v11[8];
      v23 = (uint64_t *)((char *)a1 + v22);
      v24 = (uint64_t *)((char *)a2 + v22);
      v25 = *v24;
      v26 = v24[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v25, v26);
      *v23 = v25;
      v23[1] = v26;
      v27 = v11[9];
      v28 = (uint64_t *)((char *)a1 + v27);
      v29 = (uint64_t *)((char *)a2 + v27);
      v30 = v29[1];
      *v28 = *v29;
      v28[1] = v30;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DriverKitDriverApp(uint64_t a1)
{
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_23A7205E4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v3 = (int *)type metadata accessor for SettingsApplicationRecord();
  v4 = a1 + v3[5];
  v5 = sub_23A73BBEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (uint64_t *)(a1 + v3[6]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_23A7205E4(*v6, v7);
  swift_bridgeObjectRelease();
  sub_23A7205E4(*(_QWORD *)(a1 + v3[8]), *(_QWORD *)(a1 + v3[8] + 8));
  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for DriverKitDriverApp(uint64_t *a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = *a2;
  if (EnumCaseMultiPayload == 1)
  {
    v6 = a2[1];
    sub_23A720478(v5, v6);
    *a1 = v5;
    a1[1] = v6;
  }
  else
  {
    v7 = a2[1];
    *a1 = v5;
    a1[1] = v7;
    v8 = (int *)type metadata accessor for SettingsApplicationRecord();
    v9 = v8[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23A73BBEC();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = v8[6];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = *((_QWORD *)v16 + 1);
    if (v17 >> 60 == 15)
    {
      *(_OWORD *)v15 = *(_OWORD *)v16;
    }
    else
    {
      v18 = *(_QWORD *)v16;
      sub_23A720478(*(_QWORD *)v16, *((_QWORD *)v16 + 1));
      *(_QWORD *)v15 = v18;
      *((_QWORD *)v15 + 1) = v17;
    }
    *(uint64_t *)((char *)a1 + v8[7]) = *(uint64_t *)((char *)a2 + v8[7]);
    v19 = v8[8];
    v20 = (uint64_t *)((char *)a1 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = *v21;
    v23 = v21[1];
    swift_bridgeObjectRetain();
    sub_23A720478(v22, v23);
    *v20 = v22;
    v20[1] = v23;
    v24 = v8[9];
    v25 = (uint64_t *)((char *)a1 + v24);
    v26 = (uint64_t *)((char *)a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for DriverKitDriverApp(uint64_t *a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  unint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;

  if (a1 != a2)
  {
    sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      v6 = a2[1];
      sub_23A720478(v5, v6);
      *a1 = v5;
      a1[1] = v6;
    }
    else
    {
      *a1 = v5;
      a1[1] = a2[1];
      v7 = (int *)type metadata accessor for SettingsApplicationRecord();
      v8 = v7[5];
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_23A73BBEC();
      v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
      swift_bridgeObjectRetain();
      v12(v9, v10, v11);
      v13 = v7[6];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      v16 = *((_QWORD *)v15 + 1);
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)v14 = *(_OWORD *)v15;
      }
      else
      {
        v17 = *(_QWORD *)v15;
        sub_23A720478(*(_QWORD *)v15, *((_QWORD *)v15 + 1));
        *(_QWORD *)v14 = v17;
        *((_QWORD *)v14 + 1) = v16;
      }
      *(uint64_t *)((char *)a1 + v7[7]) = *(uint64_t *)((char *)a2 + v7[7]);
      v18 = v7[8];
      v19 = (uint64_t *)((char *)a1 + v18);
      v20 = (uint64_t *)((char *)a2 + v18);
      v21 = *v20;
      v22 = v20[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v21, v22);
      *v19 = v21;
      v19[1] = v22;
      v23 = v7[9];
      v24 = (uint64_t *)((char *)a1 + v23);
      v25 = (uint64_t *)((char *)a2 + v23);
      *v24 = *v25;
      v24[1] = v25[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriverApp(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = (int *)type metadata accessor for SettingsApplicationRecord();
    v7 = v6[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23A73BBEC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
    *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
    *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
    *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for DriverKitDriverApp(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = (int *)type metadata accessor for SettingsApplicationRecord();
      v7 = v6[5];
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_23A73BBEC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
      *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
      *(_OWORD *)((char *)a1 + v6[8]) = *(_OWORD *)((char *)a2 + v6[8]);
      *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriverApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DriverKitDriverApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A722548()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A722558()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SettingsApplicationRecord();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t ApprovalStateUpdateStatus.description.getter(uint64_t a1)
{
  if (a1)
    return 0xD000000000000012;
  else
    return 0xD000000000000015;
}

unint64_t sub_23A722600()
{
  _QWORD *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0xD000000000000015;
}

BOOL static ApprovalStateUpdateStatus.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  char updated;

  result = (a1 | a2) == 0;
  if (a1)
  {
    if (a2)
    {
      swift_retain();
      swift_retain();
      updated = _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(a1, a2);
      swift_release();
      swift_release();
      return updated & 1;
    }
  }
  return result;
}

BOOL sub_23A7226B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;
  BOOL v5;
  char updated;

  v2 = *a1;
  v3 = *a2;
  result = (*a1 | *a2) == 0;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    swift_retain();
    swift_retain();
    updated = _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(v2, v3);
    swift_release();
    swift_release();
    return updated & 1;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ApprovalStateUpdateStatus(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for ApprovalStateUpdateStatus()
{
  return swift_release();
}

_QWORD *assignWithCopy for ApprovalStateUpdateStatus(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for ApprovalStateUpdateStatus(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalStateUpdateStatus(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ApprovalStateUpdateStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_23A722870(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A722888(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalStateUpdateStatus()
{
  return &type metadata for ApprovalStateUpdateStatus;
}

void *sub_23A7228C0()
{
  void *result;

  result = (void *)sub_23A738100((uint64_t)&unk_250B93B98);
  off_2542D2E60 = result;
  return result;
}

DriverManagement::ApprovalState_optional __swiftcall ApprovalState.init(fromString:)(Swift::String fromString)
{
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  DriverManagement::ApprovalState_optional v6;

  object = fromString._object;
  countAndFlagsBits = fromString._countAndFlagsBits;
  if (qword_2542D2E68 != -1)
    swift_once();
  v3 = off_2542D2E60;
  if (*((_QWORD *)off_2542D2E60 + 2)
    && (v4 = sub_23A728630(countAndFlagsBits, (uint64_t)object, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A7286A8), (v5 & 1) != 0))
  {
    v6.value = *(_BYTE *)(v3[7] + v4);
  }
  else
  {
    v6.value = DriverManagement_ApprovalState_unknownDefault;
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t ApprovalState.stringValue.getter(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _BYTE v8[48];

  v1 = a1;
  if (qword_2542D2E68 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1);
  v8[16] = v1;
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23A7298B8(v2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A7296D0, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v4 = sub_23A722A64(v3);
  v6 = v5;
  result = swift_release();
  if (v6)
    return (uint64_t)v4;
  __break(1u);
  return result;
}

BOOL sub_23A722A54(uint64_t a1, uint64_t a2, char a3, char a4)
{
  return a3 == a4;
}

_BYTE *sub_23A722A64(uint64_t a1)
{
  _BYTE *result;
  int v3;
  char v4;
  char v5;

  result = (_BYTE *)sub_23A7357CC(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_BYTE *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_23A735854(&v5, (uint64_t)result, v3, 0, a1);
}

Swift::Bool __swiftcall ApprovalState.canTransitionTo(_:)(DriverManagement::ApprovalState a1)
{
  char v1;
  int v2;

  if (v1 == 1)
    v2 = 2;
  else
    v2 = 1;
  return v2 == a1;
}

DriverManagement::ApprovalState_optional __swiftcall ApprovalState.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3)
    LOBYTE(rawValue) = 3;
  return (DriverManagement::ApprovalState_optional)rawValue;
}

uint64_t ApprovalState.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_23A722B20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A722B34()
{
  sub_23A73C0F0();
  sub_23A73C0FC();
  return sub_23A73C114();
}

uint64_t sub_23A722B78()
{
  return sub_23A73C0FC();
}

uint64_t sub_23A722BA0()
{
  sub_23A73C0F0();
  sub_23A73C0FC();
  return sub_23A73C114();
}

uint64_t *sub_23A722BE0@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_23A722BF8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void *static ApprovalState.allCases.getter()
{
  return &unk_250B93B70;
}

void sub_23A722C10(_QWORD *a1@<X8>)
{
  *a1 = &unk_250B93C00;
}

uint64_t ApprovalState.description.getter(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _BYTE v8[48];

  v1 = a1;
  if (qword_2542D2E68 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1);
  v8[16] = v1;
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23A7298B8(v2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A72D56C, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v4 = sub_23A722A64(v3);
  v6 = v5;
  result = swift_release();
  if (v6)
    return (uint64_t)v4;
  __break(1u);
  return result;
}

uint64_t sub_23A722CF4(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _BYTE v9[48];

  v2 = *v1;
  if (qword_2542D2E68 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1);
  v9[16] = v2;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_23A7298B8(v3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A72D56C, (uint64_t)v9);
  swift_bridgeObjectRelease();
  v5 = sub_23A722A64(v4);
  v7 = v6;
  result = swift_release();
  if (v7)
    return (uint64_t)v5;
  __break(1u);
  return result;
}

uint64_t ApprovalState.debugDescription.getter(unsigned __int8 a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _BYTE v9[40];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = a1;
  v11 = sub_23A73C09C();
  v12 = v2;
  v3 = sub_23A73BDA8();
  if (qword_2542D2E68 != -1)
    v3 = swift_once();
  MEMORY[0x24BDAC7A8](v3);
  v9[16] = a1;
  v4 = swift_bridgeObjectRetain();
  v5 = sub_23A7298B8(v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A72D56C, (uint64_t)v9);
  swift_bridgeObjectRelease();
  sub_23A722A64(v5);
  v7 = v6;
  result = swift_release();
  if (v7)
  {
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A722EF8()
{
  unsigned __int8 *v0;

  return ApprovalState.debugDescription.getter(*v0);
}

uint64_t sub_23A722F00()
{
  sub_23A72CE74();
  return sub_23A73BDFC();
}

uint64_t sub_23A722F5C()
{
  sub_23A72CE74();
  return sub_23A73BDF0();
}

unint64_t sub_23A722FB8(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4;

  if ((a3 & 1) != 0)
  {
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000010;
  }
  else
  {
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000012;
  }
  sub_23A73BDA8();
  return v4;
}

unint64_t sub_23A72306C()
{
  uint64_t v0;

  return sub_23A722FB8(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_23A723080()
{
  _BYTE *v0;

  if (*v0)
    return 0x7261506472696874;
  else
    return 0x7261507473726966;
}

uint64_t sub_23A7230B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A729D68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A7230DC()
{
  return 0;
}

void sub_23A7230E8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A7230F4()
{
  sub_23A729A4C();
  return sub_23A73C138();
}

uint64_t sub_23A72311C()
{
  sub_23A729A4C();
  return sub_23A73C144();
}

uint64_t sub_23A723144()
{
  return 0;
}

uint64_t sub_23A723150@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_23A72317C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A723188()
{
  sub_23A729B2C();
  return sub_23A73C138();
}

uint64_t sub_23A7231B0()
{
  sub_23A729B2C();
  return sub_23A73C144();
}

uint64_t sub_23A7231D8()
{
  return 1;
}

unint64_t sub_23A7231E8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_23A723204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A729E70(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A72322C()
{
  sub_23A729A90();
  return sub_23A73C138();
}

uint64_t sub_23A723254()
{
  sub_23A729A90();
  return sub_23A73C144();
}

uint64_t ApprovalDBEntrySource.encode(to:)(_QWORD *a1, uint64_t a2, unint64_t a3)
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
  char *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v21 = a2;
  v22 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4660);
  v19 = *(_QWORD *)(v4 - 8);
  v20 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4668);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4670);
  v23 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A729A4C();
  v14 = v22;
  sub_23A73C12C();
  if (v14 >> 60 == 15)
  {
    LOBYTE(v24) = 0;
    sub_23A729B2C();
    sub_23A73C054();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v11);
  }
  else
  {
    LOBYTE(v24) = 1;
    v16 = v21;
    sub_23A720478(v21, v14);
    sub_23A729A90();
    sub_23A73C054();
    v24 = v16;
    v25 = v14;
    sub_23A729AD4();
    v17 = v20;
    sub_23A73C084();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v17);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v11);
    return sub_23A729B18(v16, v14);
  }
}

_QWORD *ApprovalDBEntrySource.init(from:)(_QWORD *a1)
{
  return sub_23A729EF4(a1);
}

_QWORD *sub_23A7234DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = sub_23A729EF4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_23A723504(_QWORD *a1)
{
  uint64_t v1;

  return ApprovalDBEntrySource.encode(to:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8));
}

uint64_t ApprovalDBEntrySource.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 == 15)
    return sub_23A73C0FC();
  sub_23A73C0FC();
  sub_23A720478(a2, a3);
  sub_23A73BC10();
  return sub_23A729B18(a2, a3);
}

uint64_t ApprovalDBEntrySource.hashValue.getter(uint64_t a1, unint64_t a2)
{
  sub_23A73C0F0();
  sub_23A73C0FC();
  if (a2 >> 60 != 15)
  {
    sub_23A720478(a1, a2);
    sub_23A73BC10();
    sub_23A729B18(a1, a2);
  }
  return sub_23A73C114();
}

uint64_t sub_23A723628()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23A73C0F0();
  sub_23A73C0FC();
  if (v2 >> 60 != 15)
  {
    sub_23A720478(v1, v2);
    sub_23A73BC10();
    sub_23A729B18(v1, v2);
  }
  return sub_23A73C114();
}

uint64_t sub_23A7236B4()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v3;

  v1 = v0[1];
  if (v1 >> 60 == 15)
    return sub_23A73C0FC();
  v3 = *v0;
  sub_23A73C0FC();
  sub_23A720478(v3, v1);
  sub_23A73BC10();
  return sub_23A729B18(v3, v1);
}

uint64_t sub_23A723738()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23A73C0F0();
  sub_23A73C0FC();
  if (v2 >> 60 != 15)
  {
    sub_23A720478(v1, v2);
    sub_23A73BC10();
    sub_23A729B18(v1, v2);
  }
  return sub_23A73C114();
}

uint64_t sub_23A7237C4(uint64_t a1, uint64_t a2)
{
  return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

uint64_t ApprovalDBEntrySource.description.getter(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
    return 0x6D6574737973;
  sub_23A720478(a1, a2);
  sub_23A73BF1C();
  swift_bridgeObjectRelease();
  sub_23A721630(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
  sub_23A72B6E0((unint64_t *)&qword_2542D2EF8, &qword_2542D2EF0, MEMORY[0x24BEE12B0]);
  sub_23A73BD3C();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A729B18(a1, a2);
  return 0xD000000000000024;
}

uint64_t sub_23A723904()
{
  uint64_t v0;

  return ApprovalDBEntrySource.description.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t ApprovalDBEntry.init(driverIdentifier:source:approvalState:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 32) = a5;
  return result;
}

unint64_t sub_23A72391C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656372756F73;
  if (*v0 != 1)
    v1 = 0x6C61766F72707061;
  if (*v0)
    return v1;
  else
    return 0xD000000000000010;
}

uint64_t sub_23A723984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A72A38C(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A7239A8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23A7239B4()
{
  sub_23A72A2B0();
  return sub_23A73C138();
}

uint64_t sub_23A7239DC()
{
  sub_23A72A2B0();
  return sub_23A73C144();
}

uint64_t ApprovalDBEntry.description.getter()
{
  __int128 *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[40];
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;

  v15 = *v0;
  v16 = v15;
  sub_23A72A274((uint64_t)&v16);
  sub_23A73BDA8();
  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  if (v2 >> 60 != 15)
  {
    sub_23A72A29C(v1, v2);
    sub_23A720478(v1, v2);
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v13 = 0xD000000000000024;
    v14 = 0x800000023A73F610;
    sub_23A721630(v1, v2);
    v12 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
    sub_23A72B6E0((unint64_t *)&qword_2542D2EF8, &qword_2542D2EF0, MEMORY[0x24BEE12B0]);
    sub_23A73BD3C();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    sub_23A729B18(v1, v2);
  }
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A729B18(v1, v2);
  v4 = sub_23A73BDA8();
  v5 = *((_BYTE *)v0 + 32);
  if (qword_2542D2E68 != -1)
    v4 = swift_once();
  MEMORY[0x24BDAC7A8](v4);
  v11[16] = v5;
  v6 = swift_bridgeObjectRetain();
  v7 = sub_23A7298B8(v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A72D56C, (uint64_t)v11);
  swift_bridgeObjectRelease();
  sub_23A722A64(v7);
  v9 = v8;
  result = swift_release();
  if (v9)
  {
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ApprovalDBEntry.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4688);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72A2B0();
  sub_23A73C12C();
  LOBYTE(v12) = 0;
  sub_23A73C06C();
  if (!v2)
  {
    sub_23A72A2F4((_OWORD *)(v3 + 16), &v13);
    sub_23A72A2F4(&v13, &v12);
    v11 = 1;
    sub_23A72A304();
    sub_23A73C084();
    LOBYTE(v12) = *(_BYTE *)(v3 + 32);
    v11 = 2;
    sub_23A72A348();
    sub_23A73C084();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double ApprovalDBEntry.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  char v7;

  sub_23A72A4F8(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 32) = v7;
  }
  return result;
}

double sub_23A723E1C@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  char v7;

  sub_23A72A4F8(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_23A723E60(_QWORD *a1)
{
  return ApprovalDBEntry.encode(to:)(a1);
}

BOOL static ApprovalDBEntry.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  unint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_23A73C0A8(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 24);
    sub_23A72A2F4((_OWORD *)(a2 + 16), &v8);
    if (v7 >> 60 == 15)
    {
      sub_23A72A2F4(&v8, &v9);
      if (*((_QWORD *)&v9 + 1) >> 60 == 15)
        return *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32);
    }
    else
    {
      sub_23A72A2F4(&v8, &v9);
      if (*((_QWORD *)&v9 + 1) >> 60 != 15)
        __asm { BR              X10 }
    }
    return 0;
  }
  return result;
}

uint64_t sub_23A7240A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v9;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 32);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v2, v3, v5, v6) & (v4 == v7);
  v9 = sub_23A73C0A8();
  result = 0;
  if ((v9 & 1) != 0)
    return _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v2, v3, v5, v6) & (v4 == v7);
  return result;
}

uint64_t sub_23A72412C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4770);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72CD84();
  sub_23A73C12C();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4780);
  sub_23A72D08C(&qword_2569B4788, &qword_2569B4780, (uint64_t (*)(void))sub_23A72CDC8, MEMORY[0x24BEE12A0]);
  sub_23A73C084();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23A724250()
{
  return sub_23A73C0FC();
}

uint64_t sub_23A724274()
{
  return 0x73656972746E65;
}

uint64_t sub_23A724290()
{
  sub_23A72CD84();
  return sub_23A73C138();
}

uint64_t sub_23A7242B8()
{
  sub_23A72CD84();
  return sub_23A73C144();
}

_QWORD *sub_23A7242E0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23A72A7FC(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23A724308(_QWORD *a1)
{
  uint64_t *v1;

  return sub_23A72412C(a1, *v1);
}

uint64_t ApprovalDB.entries.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ApprovalDB.entries.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  swift_bridgeObjectRetain();
  return sub_23A724384;
}

uint64_t sub_23A724384(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)a1[1];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v3 = v2;
  }
  return result;
}

uint64_t sub_23A7243E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unsigned __int8 *i;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v5 = *(_QWORD *)(a5 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    for (i = (unsigned __int8 *)(a5 + 64); ; i += 40)
    {
      v12 = *((_QWORD *)i - 2);
      v11 = *((_QWORD *)i - 1);
      v13 = *i;
      v14 = *((_QWORD *)i - 4) == a1 && *((_QWORD *)i - 3) == a2;
      if (v14 || (sub_23A73C0A8() & 1) != 0)
      {
        if (v11 >> 60 == 15)
        {
          if (a4 >> 60 == 15)
          {
            swift_bridgeObjectRetain();
            sub_23A72A29C(v12, v11);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_23A729B18(v12, v11);
            return v13;
          }
        }
        else if (a4 >> 60 != 15)
        {
          __asm { BR              X8 }
        }
      }
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
    }
  }
  return 3;
}

BOOL sub_23A724F74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A724F8C()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E6F6973726576;
  else
    return 12406;
}

uint64_t sub_23A724FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A72A948(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A724FE0()
{
  sub_23A72A774();
  return sub_23A73C138();
}

uint64_t sub_23A725008()
{
  sub_23A72A774();
  return sub_23A73C144();
}

uint64_t ApprovalDB.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B46A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72A774();
  sub_23A73C12C();
  v11 = a2;
  v10[15] = 0;
  sub_23A72A7B8();
  sub_23A73C084();
  if (!v2)
  {
    v10[14] = 1;
    sub_23A73C078();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ApprovalDB.init(from:)(_QWORD *a1)
{
  return sub_23A72AA20(a1);
}

uint64_t sub_23A725178@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_23A72AA20(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_23A7251A0(_QWORD *a1)
{
  uint64_t *v1;

  return ApprovalDB.encode(to:)(a1, *v1);
}

uint64_t sub_23A7251BC(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement10ApprovalDBV2eeoiySbAC_ACtFZ_0(*a1, a1[1], *a2);
}

uint64_t sub_23A7251D4()
{
  sub_23A73C0F0();
  sub_23A73C0FC();
  return sub_23A73C114();
}

uint64_t sub_23A725214()
{
  sub_23A73C0F0();
  sub_23A73C0FC();
  return sub_23A73C114();
}

uint64_t sub_23A725250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x73656972746E65 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A73C0A8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A7252E4()
{
  sub_23A72ABB0();
  return sub_23A73C138();
}

uint64_t sub_23A72530C()
{
  sub_23A72ABB0();
  return sub_23A73C144();
}

uint64_t ApprovalSettingsState.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B46C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72ABB0();
  sub_23A73C12C();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3078);
  sub_23A72D08C(&qword_2569B46C8, &qword_2542D3078, (uint64_t (*)(void))sub_23A72ABF4, MEMORY[0x24BEE1700]);
  sub_23A73C084();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

_QWORD *ApprovalSettingsState.init(from:)(_QWORD *a1)
{
  return sub_23A72AC38(a1);
}

_QWORD *sub_23A72546C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_23A72AC38(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_23A725494(_QWORD *a1)
{
  uint64_t *v1;

  return ApprovalSettingsState.encode(to:)(a1, *v1);
}

uint64_t sub_23A7254B0(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t i;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v30;
  char v32;
  char v34;
  int v35;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v43;
  int v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unsigned __int8 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v2 = 0;
  v3 = a1 + 56;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  v45 = a2 + 56;
  v38 = a1 + 56;
  v39 = a1;
  v37 = v7;
  if (v6)
    goto LABEL_7;
LABEL_8:
  v9 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    JUMPOUT(0x23A726278);
  }
  if (v9 >= v7)
    return 1;
  v10 = *(_QWORD *)(v3 + 8 * v9);
  v11 = v2 + 1;
  if (!v10)
  {
    v11 = v9 + 1;
    if (v9 + 1 >= v7)
      return 1;
    v10 = *(_QWORD *)(v3 + 8 * v11);
    if (!v10)
    {
      v11 = v9 + 2;
      if (v9 + 2 >= v7)
        return 1;
      v10 = *(_QWORD *)(v3 + 8 * v11);
      if (!v10)
      {
        v11 = v9 + 3;
        if (v9 + 3 >= v7)
          return 1;
        v10 = *(_QWORD *)(v3 + 8 * v11);
        if (!v10)
        {
          v12 = v9 + 4;
          if (v12 < v7)
          {
            v10 = *(_QWORD *)(v3 + 8 * v12);
            if (v10)
            {
              v11 = v12;
              goto LABEL_23;
            }
            while (1)
            {
              v11 = v12 + 1;
              if (__OFADD__(v12, 1))
              {
                __break(1u);
                JUMPOUT(0x23A726290);
              }
              if (v11 >= v7)
                break;
              v10 = *(_QWORD *)(v3 + 8 * v11);
              ++v12;
              if (v10)
                goto LABEL_23;
            }
          }
          return 1;
        }
      }
    }
  }
LABEL_23:
  v40 = (v10 - 1) & v10;
  v41 = v11;
  for (i = __clz(__rbit64(v10)) + (v11 << 6); ; i = __clz(__rbit64(v6)) | (v2 << 6))
  {
    v13 = *(_QWORD *)(a1 + 48) + 72 * i;
    v46 = *(_OWORD *)v13;
    v15 = *(_OWORD *)(v13 + 32);
    v14 = *(_OWORD *)(v13 + 48);
    v16 = *(_OWORD *)(v13 + 16);
    v50 = *(_BYTE *)(v13 + 64);
    v49 = v14;
    v47 = v16;
    v48 = v15;
    sub_23A73C0F0();
    sub_23A72CF74((uint64_t)&v46);
    ApprovalSettingsStateEntry.hash(into:)();
    v17 = sub_23A73C114();
    v18 = a2;
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v17 & ~v19;
    if (((*(_QWORD *)(v45 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      break;
    v43 = ~v19;
    v21 = v46;
    while (1)
    {
      v22 = *(_QWORD *)(v18 + 48) + 72 * v20;
      v23 = *(_QWORD *)(v22 + 16);
      v24 = *(_QWORD *)(v22 + 24);
      v25 = *(_QWORD *)(v22 + 32);
      v26 = *(_QWORD *)(v22 + 40);
      v28 = *(_QWORD *)(v22 + 48);
      v27 = *(_QWORD *)(v22 + 56);
      v44 = *(unsigned __int8 *)(v22 + 64);
      if (*(_QWORD *)v22 != (_QWORD)v21 || *(_QWORD *)(v22 + 8) != *((_QWORD *)&v21 + 1))
      {
        v30 = sub_23A73C0A8();
        v18 = a2;
        if ((v30 & 1) == 0)
          goto LABEL_27;
      }
      if (v24)
      {
        if (!*((_QWORD *)&v47 + 1))
          goto LABEL_27;
        if (v23 != (_QWORD)v47 || v24 != *((_QWORD *)&v47 + 1))
        {
          v32 = sub_23A73C0A8();
          v18 = a2;
          if ((v32 & 1) == 0)
            goto LABEL_27;
        }
      }
      else if (*((_QWORD *)&v47 + 1))
      {
        goto LABEL_27;
      }
      if (v26)
      {
        if (!*((_QWORD *)&v48 + 1))
          goto LABEL_27;
        if (v25 != (_QWORD)v48 || v26 != *((_QWORD *)&v48 + 1))
        {
          v34 = sub_23A73C0A8();
          v18 = a2;
          if ((v34 & 1) == 0)
            goto LABEL_27;
        }
      }
      else if (*((_QWORD *)&v48 + 1))
      {
        goto LABEL_27;
      }
      sub_23A72A2F4(&v49, &v51);
      if (v27 >> 60 != 15)
      {
        sub_23A72A2F4(&v51, &v52);
        v18 = a2;
        if (*((_QWORD *)&v52 + 1) >> 60 != 15)
          __asm { BR              X8 }
        goto LABEL_27;
      }
      sub_23A72A2F4(&v51, &v53);
      v18 = a2;
      if (*((_QWORD *)&v53 + 1) >> 60 == 15)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A72A29C(v28, v27);
        v35 = v50;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23A729B18(v28, v27);
        v18 = a2;
        if (v44 == v35)
          break;
      }
LABEL_27:
      v20 = (v20 + 1) & v43;
      if (((*(_QWORD *)(v45 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
        goto LABEL_58;
    }
    sub_23A72CFD4((uint64_t)&v46);
    v3 = v38;
    a1 = v39;
    v7 = v37;
    v6 = v40;
    v2 = v41;
    if (!v40)
      goto LABEL_8;
LABEL_7:
    v40 = (v6 - 1) & v6;
    v41 = v2;
  }
LABEL_58:
  sub_23A72CFD4((uint64_t)&v46);
  return 0;
}

uint64_t sub_23A72634C(uint64_t *a1, uint64_t *a2)
{
  return sub_23A7254B0(*a1, *a2);
}

unint64_t ApprovalSettingsState.debugDescription.getter(uint64_t a1)
{
  unint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;

  sub_23A73BF1C();
  swift_bridgeObjectRelease();
  v47 = 0xD000000000000017;
  v48 = 0x800000023A73F640;
  v65 = *(_QWORD *)(a1 + 16);
  sub_23A73C09C();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  v2 = 0xD000000000000017;
  v63 = 0xD000000000000017;
  v64 = 0x800000023A73F640;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  v4 = ~v3;
  v5 = -v3;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a1 + 56);
  v57 = a1;
  v58 = a1 + 56;
  v59 = v4;
  v60 = 0;
  v61 = v7;
  v62 = 0;
  swift_bridgeObjectRetain();
  sub_23A726760((uint64_t)&v47);
  v8 = v49;
  if (v49)
  {
    v9 = v47;
    v10 = v48;
    v12 = v50;
    v11 = v51;
    v13 = v52;
    v14 = v53;
    v15 = v54;
    v16 = v55;
    v17 = v56;
    do
    {
      v65 = v10;
      v66 = v8;
      v67 = v12;
      v68 = v11;
      v44 = v13;
      v45 = v11;
      v69 = v13;
      v70 = v14;
      v42 = v15;
      v43 = v14;
      v71 = v15;
      v72 = v16;
      v41 = v16;
      v73 = v17;
      v47 = 0x207865646E492020;
      v48 = 0xE800000000000000;
      sub_23A73C09C();
      sub_23A73BDA8();
      swift_bridgeObjectRelease();
      sub_23A73BDA8();
      sub_23A73BDA8();
      swift_bridgeObjectRelease();
      v21 = ApprovalSettingsStateEntry.debugDescription.getter();
      v23 = sub_23A726C9C(0x7FFFFFFFFFFFFFFFLL, 1, v21, v22);
      v24 = *(_QWORD *)(v23 + 16);
      if (v24)
      {
        v38 = v12;
        v39 = v10;
        v40 = v9;
        v37 = v8;
        v46 = MEMORY[0x24BEE4AF8];
        sub_23A728288(0, v24, 0);
        v25 = v46;
        v26 = (uint64_t *)(v23 + 56);
        do
        {
          v27 = *(v26 - 3);
          v28 = *(v26 - 2);
          v29 = *(v26 - 1);
          v30 = *v26;
          v47 = 538976288;
          v48 = 0xE400000000000000;
          swift_bridgeObjectRetain();
          MEMORY[0x23B85566C](v27, v28, v29, v30);
          sub_23A73BDA8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v31 = v47;
          v32 = v48;
          v34 = *(_QWORD *)(v46 + 16);
          v33 = *(_QWORD *)(v46 + 24);
          if (v34 >= v33 >> 1)
            sub_23A728288(v33 > 1, v34 + 1, 1);
          *(_QWORD *)(v46 + 16) = v34 + 1;
          v35 = v46 + 16 * v34;
          *(_QWORD *)(v35 + 32) = v31;
          *(_QWORD *)(v35 + 40) = v32;
          v26 += 4;
          --v24;
        }
        while (v24);
        swift_bridgeObjectRelease();
        v8 = v37;
        v12 = v38;
        v9 = v40;
        v10 = v39;
      }
      else
      {
        swift_bridgeObjectRelease();
        v25 = MEMORY[0x24BEE4AF8];
      }
      v47 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
      sub_23A72B6E0((unint64_t *)&qword_2542D2EF8, &qword_2542D2EF0, MEMORY[0x24BEE12B0]);
      v18 = sub_23A73BD3C();
      v20 = v19;
      swift_bridgeObjectRelease();
      v47 = v18;
      v48 = v20;
      swift_bridgeObjectRetain();
      sub_23A73BDA8();
      swift_bridgeObjectRelease();
      sub_23A73BDA8();
      swift_bridgeObjectRelease();
      sub_23A72AD8C(v9, v10, v8, v12, v45, v44, v43, v42, v41);
      sub_23A726760((uint64_t)&v47);
      v9 = v47;
      v10 = v48;
      v8 = v49;
      v12 = v50;
      v11 = v51;
      v13 = v52;
      v14 = v53;
      v15 = v54;
      v16 = v55;
      v17 = v56;
    }
    while (v49);
    v2 = v63;
  }
  sub_23A72AD84();
  return v2;
}

void sub_23A726760(uint64_t a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;

  v3 = v1[3];
  v2 = v1[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_QWORD *)(*v1 + 48) + 72 * v6;
    v8 = *(_QWORD *)v7;
    v9 = *(_QWORD *)(v7 + 8);
    v10 = *(_QWORD *)(v7 + 16);
    v11 = *(_OWORD *)(v7 + 24);
    v12 = *(_QWORD *)(v7 + 40);
    v13 = *(_QWORD *)(v7 + 48);
    v14 = *(_QWORD *)(v7 + 56);
    v15 = *(_BYTE *)(v7 + 64);
    v1[3] = v4;
    v1[4] = v5;
    v16 = v1[5];
    if (!__OFADD__(v16, 1))
    {
      v1[5] = v16 + 1;
      *(_QWORD *)a1 = v16;
      *(_QWORD *)(a1 + 8) = v8;
      *(_QWORD *)(a1 + 16) = v9;
      *(_QWORD *)(a1 + 24) = v10;
      *(_OWORD *)(a1 + 32) = v11;
      *(_QWORD *)(a1 + 48) = v12;
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v14;
      *(_BYTE *)(a1 + 72) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A72A29C(v13, v14);
      return;
    }
    __break(1u);
    goto LABEL_25;
  }
  v17 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    v18 = (unint64_t)(v1[2] + 64) >> 6;
    if (v17 < v18)
    {
      v19 = v1[1];
      v20 = *(_QWORD *)(v19 + 8 * v17);
      if (v20)
      {
LABEL_8:
        v5 = (v20 - 1) & v20;
        v6 = __clz(__rbit64(v20)) + (v17 << 6);
        v4 = v17;
        goto LABEL_3;
      }
      v21 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v18)
      {
        v20 = *(_QWORD *)(v19 + 8 * v21);
        if (v20)
        {
LABEL_11:
          v17 = v21;
          goto LABEL_8;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v18)
        {
          v20 = *(_QWORD *)(v19 + 8 * (v3 + 3));
          if (v20)
          {
            v17 = v3 + 3;
            goto LABEL_8;
          }
          v21 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v18)
          {
            v20 = *(_QWORD *)(v19 + 8 * v21);
            if (v20)
              goto LABEL_11;
            v17 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v18)
            {
              v20 = *(_QWORD *)(v19 + 8 * v17);
              if (v20)
                goto LABEL_8;
              v4 = v18 - 1;
              v22 = v3 + 6;
              while (v18 != v22)
              {
                v20 = *(_QWORD *)(v19 + 8 * v22++);
                if (v20)
                {
                  v17 = v22 - 1;
                  goto LABEL_8;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v4;
    v1[4] = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 57) = 0u;
    return;
  }
LABEL_25:
  __break(1u);
}

uint64_t ApprovalSettingsStateEntry.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[40];
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE v17[16];
  _QWORD v18[2];

  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  sub_23A73BF1C();
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_23A73BDA8();
  swift_bridgeObjectRetain();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  sub_23A72ADE4(v0 + 16, (uint64_t)v18);
  sub_23A72ADE4((uint64_t)v18, (uint64_t)v17);
  sub_23A72A274((uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EE8);
  sub_23A73BD6C();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  sub_23A72ADE4(v0 + 32, (uint64_t)v17);
  sub_23A72ADE4((uint64_t)v17, (uint64_t)&v13);
  sub_23A72A274((uint64_t)v17);
  sub_23A73BD6C();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  if (v2 >> 60 != 15)
  {
    v13 = 0;
    v14 = 0xE000000000000000;
    sub_23A72A29C(v1, v2);
    sub_23A720478(v1, v2);
    sub_23A73BF1C();
    swift_bridgeObjectRelease();
    v13 = 0xD000000000000024;
    v14 = 0x800000023A73F610;
    sub_23A721630(v1, v2);
    v12 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EF0);
    sub_23A72B6E0((unint64_t *)&qword_2542D2EF8, &qword_2542D2EF0, MEMORY[0x24BEE12B0]);
    sub_23A73BD3C();
    swift_bridgeObjectRelease();
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    sub_23A729B18(v1, v2);
  }
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A729B18(v1, v2);
  v4 = sub_23A73BDA8();
  v5 = *(_BYTE *)(v0 + 64);
  if (qword_2542D2E68 != -1)
    v4 = swift_once();
  MEMORY[0x24BDAC7A8](v4);
  v11[16] = v5;
  v6 = swift_bridgeObjectRetain();
  v7 = sub_23A7298B8(v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A72D56C, (uint64_t)v11);
  swift_bridgeObjectRelease();
  sub_23A722A64(v7);
  v9 = v8;
  result = swift_release();
  if (v9)
  {
    sub_23A73BDA8();
    swift_bridgeObjectRelease();
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A726C9C(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v45;

  if (a1 < 0)
  {
LABEL_50:
    result = sub_23A73BFAC();
    __break(1u);
  }
  else
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = MEMORY[0x24BEE4AF8];
    v9 = swift_allocObject();
    v10 = v9;
    *(_QWORD *)(v9 + 16) = 15;
    v11 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      v12 = (a4 & 0x2000000000000000) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        v41 = a1;
        v45 = 4 * v12;
        v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v14 = 15;
        v15 = 15;
        v42 = (_QWORD *)a3;
        v43 = v9;
        while (1)
        {
          v16 = sub_23A73BDD8();
          v18 = v17;
          if (!((v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : v16 & 0xFFFFFFFFFFFFLL))
            break;
          if ((v17 & 0x1000000000000000) != 0)
          {
            v20 = sub_23A73BF10();
          }
          else
          {
            if ((v17 & 0x2000000000000000) == 0 && (v16 & 0x1000000000000000) == 0)
              sub_23A73BF64();
            v20 = sub_23A73BF70();
          }
          v4 = v20;
          swift_bridgeObjectRelease();
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || (_DWORD)v4 == 133)
          {
            if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
            {
              v14 = sub_23A73BD9C();
              *(_QWORD *)(v10 + 16) = v14;
              v15 = v14;
            }
            else
            {
              if (v14 >> 14 < v15 >> 14)
                goto LABEL_49;
              v21 = a4;
              v22 = sub_23A73BDE4();
              v24 = v23;
              v26 = v25;
              v4 = v27;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v13 = sub_23A727CF0(0, v13[2] + 1, 1, v13);
              v28 = v13;
              v29 = v13[2];
              v30 = v28;
              v31 = v28[3];
              if (v29 >= v31 >> 1)
                v30 = sub_23A727CF0((_QWORD *)(v31 > 1), v29 + 1, 1, v30);
              v30[2] = v29 + 1;
              v32 = &v30[4 * v29];
              v13 = v30;
              v32[4] = v22;
              v32[5] = v24;
              v32[6] = v26;
              v32[7] = v4;
              *(_QWORD *)(v8 + 16) = v30;
              a4 = v21;
              a3 = (unint64_t)v42;
              v15 = sub_23A73BD9C();
              v10 = v43;
              *(_QWORD *)(v43 + 16) = v15;
              v14 = v15;
              if (v13[2] == v41)
              {
LABEL_38:
                if (v45 == v15 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                if (v45 < v15 >> 14)
                {
LABEL_49:
                  sub_23A73BFAC();
                  __break(1u);
                  goto LABEL_50;
                }
                a3 = (unint64_t)v13;
                v15 = sub_23A73BDE4();
                v18 = v34;
                v13 = v35;
                v4 = v36;
                swift_bridgeObjectRelease();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                {
LABEL_43:
                  v38 = *(_QWORD *)(a3 + 16);
                  v37 = *(_QWORD *)(a3 + 24);
                  if (v38 >= v37 >> 1)
                    a3 = (unint64_t)sub_23A727CF0((_QWORD *)(v37 > 1), v38 + 1, 1, (_QWORD *)a3);
                  *(_QWORD *)(a3 + 16) = v38 + 1;
                  v39 = (_QWORD *)(a3 + 32 * v38);
                  v39[4] = v15;
                  v39[5] = v18;
                  v39[6] = v13;
                  v39[7] = v4;
                  v13 = (_QWORD *)a3;
                  *(_QWORD *)(v8 + 16) = a3;
                  goto LABEL_46;
                }
LABEL_48:
                a3 = (unint64_t)sub_23A727CF0(0, *(_QWORD *)(a3 + 16) + 1, 1, (_QWORD *)a3);
                goto LABEL_43;
              }
            }
          }
          else
          {
            v14 = sub_23A73BD9C();
          }
          if (v45 == v14 >> 14)
            goto LABEL_38;
        }
        __break(1u);
        goto LABEL_48;
      }
    }
    if ((a4 & 0x2000000000000000) == 0)
      v11 = a3 & 0xFFFFFFFFFFFFLL;
    v33 = 7;
    if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0)
      v33 = 11;
    sub_23A727B98(v33 | (v11 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v8 + 16);
LABEL_46:
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  return result;
}

unint64_t sub_23A72716C()
{
  uint64_t *v0;

  return ApprovalSettingsState.debugDescription.getter(*v0);
}

uint64_t ApprovalSettingsStateEntry.driverIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.usageText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ApprovalSettingsStateEntry.source.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_23A72A29C(v1, *(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t ApprovalSettingsStateEntry.approvalState.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t sub_23A727230()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A727264 + 4 * byte_23A73CAC0[*v0]))(0xD000000000000010, 0x800000023A73F730);
}

uint64_t sub_23A727264()
{
  return 0x4E79616C70736964;
}

uint64_t sub_23A727284()
{
  return 0x7865546567617375;
}

uint64_t sub_23A7272A0()
{
  return 0x656372756F73;
}

uint64_t sub_23A7272B4()
{
  return 0x6C61766F72707061;
}

uint64_t sub_23A7272D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A72AF60(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A7272FC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23A727308()
{
  sub_23A72AE2C();
  return sub_23A73C138();
}

uint64_t sub_23A727330()
{
  sub_23A72AE2C();
  return sub_23A73C144();
}

uint64_t ApprovalSettingsStateEntry.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B46D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72AE2C();
  sub_23A73C12C();
  LOBYTE(v12) = 0;
  sub_23A73C06C();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_23A73C060();
    LOBYTE(v12) = 2;
    sub_23A73C060();
    sub_23A72A2F4((_OWORD *)(v3 + 48), &v13);
    sub_23A72A2F4(&v13, &v12);
    v11 = 3;
    sub_23A72A304();
    sub_23A73C084();
    LOBYTE(v12) = *(_BYTE *)(v3 + 64);
    v11 = 4;
    sub_23A72A348();
    sub_23A73C084();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 ApprovalSettingsStateEntry.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  char v7;

  sub_23A72B1B8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_BYTE *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

__n128 sub_23A727574@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  char v7;

  sub_23A72B1B8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_BYTE *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_23A7275C4(_QWORD *a1)
{
  return ApprovalSettingsStateEntry.encode(to:)(a1);
}

BOOL sub_23A727608(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  char v8;
  _OWORD v9[4];
  char v10;

  v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  v8 = *(_BYTE *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v10 = *(_BYTE *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return _s16DriverManagement26ApprovalSettingsStateEntryV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9);
}

uint64_t ApprovalSettingsStateEntry.hash(into:)()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRetain();
  sub_23A73BD90();
  swift_bridgeObjectRelease();
  if (v0[3])
  {
    sub_23A73C108();
    swift_bridgeObjectRetain();
    sub_23A73BD90();
    swift_bridgeObjectRelease();
    if (v0[5])
    {
LABEL_3:
      sub_23A73C108();
      swift_bridgeObjectRetain();
      sub_23A73BD90();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_23A73C108();
    if (v0[5])
      goto LABEL_3;
  }
  sub_23A73C108();
LABEL_6:
  v1 = v0[7];
  if (v1 >> 60 == 15)
  {
    sub_23A73C0FC();
  }
  else
  {
    v2 = v0[6];
    sub_23A73C0FC();
    sub_23A720478(v2, v1);
    sub_23A73BC10();
    sub_23A729B18(v2, v1);
  }
  return sub_23A73C0FC();
}

uint64_t ApprovalSettingsStateEntry.hashValue.getter()
{
  sub_23A73C0F0();
  ApprovalSettingsStateEntry.hash(into:)();
  return sub_23A73C114();
}

uint64_t sub_23A7277C4()
{
  sub_23A73C0F0();
  ApprovalSettingsStateEntry.hash(into:)();
  return sub_23A73C114();
}

uint64_t sub_23A727804()
{
  sub_23A73C0F0();
  ApprovalSettingsStateEntry.hash(into:)();
  return sub_23A73C114();
}

uint64_t sub_23A72783C()
{
  return ApprovalSettingsStateEntry.debugDescription.getter();
}

uint64_t ApprovalStateUpdateRequest.__allocating_init(entry:callback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;

  v6 = swift_allocObject();
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 32) = v7;
  *(_BYTE *)(v6 + 48) = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(v6 + 56) = a2;
  *(_QWORD *)(v6 + 64) = a3;
  sub_23A73BC28();
  return v6;
}

uint64_t ApprovalStateUpdateRequest.init(entry:callback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v13;

  v7 = sub_23A73BC34();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v11;
  *(_BYTE *)(v3 + 48) = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  sub_23A73BC28();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v3 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp, v10, v7);
  return v3;
}

uint64_t ApprovalStateUpdateRequest.deinit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  sub_23A729B18(v1, v2);
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;
  v4 = sub_23A73BC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ApprovalStateUpdateRequest.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  sub_23A729B18(v1, v2);
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp;
  v4 = sub_23A73BC34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

unint64_t ApprovalStateUpdateRequest.description.getter()
{
  uint64_t v0;
  __int128 v1;
  _OWORD v3[2];
  char v4;

  *(_QWORD *)&v3[0] = 0;
  *((_QWORD *)&v3[0] + 1) = 0xE000000000000000;
  sub_23A73BF1C();
  swift_bridgeObjectRelease();
  sub_23A73BC34();
  sub_23A72B5A4();
  sub_23A73C09C();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A73BDA8();
  v1 = *(_OWORD *)(v0 + 32);
  v3[0] = *(_OWORD *)(v0 + 16);
  v3[1] = v1;
  v4 = *(_BYTE *)(v0 + 48);
  sub_23A72B5EC((uint64_t)v3);
  ApprovalDBEntry.description.getter();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  sub_23A72B62C((uint64_t)v3);
  return 0xD000000000000014;
}

unint64_t sub_23A727B6C()
{
  return ApprovalStateUpdateRequest.description.getter();
}

uint64_t sub_23A727B8C(uint64_t *a1, uint64_t *a2)
{
  return _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_23A727B98(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_23A73BDE4();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_23A727CF0(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_23A727CF0((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_23A73BFAC();
  __break(1u);
  return result;
}

_QWORD *sub_23A727CF0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F38);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A72AE70(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_23A727DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23A727E5C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x23A728040);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_23A728064(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A7280C0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_23A727DFC((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_23A7205E4(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_23A728288(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A7282C0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A7282A4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A728428(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23A7282C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F30);
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
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

uint64_t sub_23A728428(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F28);
  v10 = *(_QWORD *)(type metadata accessor for DriverKitDriver() - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for DriverKitDriver() - 8);
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
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

uint64_t sub_23A728608(uint64_t a1, uint64_t a2)
{
  return sub_23A728630(a1, a2, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A7286A8);
}

uint64_t sub_23A72861C(uint64_t a1, uint64_t a2)
{
  return sub_23A728630(a1, a2, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BDCDCF8], sub_23A728788);
}

uint64_t sub_23A728630(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  _BYTE v10[72];

  sub_23A73C0F0();
  a3(v10, a1, a2);
  v7 = sub_23A73C114();
  return a4(a1, a2, v7);
}

unint64_t sub_23A7286A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A73C0A8() & 1) == 0)
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
      while (!v14 && (sub_23A73C0A8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A728788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X8 }
  return a3 & ~v4;
}

uint64_t sub_23A729118(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F00);
  result = sub_23A73BFE8();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_BYTE *)(*(_QWORD *)(v4 + 56) + v13);
    sub_23A73C0F0();
    swift_bridgeObjectRetain();
    sub_23A73BD90();
    result = sub_23A73C114();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23A7293BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_23A73BB68();
  v11 = result;
  if (result)
  {
    result = sub_23A73BB80();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_23A73BB74();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_23A727DFC(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

uint64_t _s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    if (a4 >> 60 == 15)
      return 1;
  }
  else if (a4 >> 60 != 15)
  {
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t _s16DriverManagement26ApprovalStateUpdateRequestC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  BOOL v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(unsigned __int8 *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if ((v8 || (sub_23A73C0A8() & 1) != 0)
    && (_s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(v2, v3, v5, v6) & 1) != 0
    && v4 == v7)
  {
    return sub_23A73BC1C();
  }
  else
  {
    return 0;
  }
}

BOOL sub_23A7296D0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;

  return *(unsigned __int8 *)(v3 + 16) == a3;
}

uint64_t sub_23A7296E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v22 = (unint64_t *)result;
  v6 = 0;
  v24 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v6 << 6);
      goto LABEL_5;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v10)
      return sub_23A729118(v22, a2, v23, a3);
    v18 = *(_QWORD *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v10)
        return sub_23A729118(v22, a2, v23, a3);
      v18 = *(_QWORD *)(v24 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v10)
          return sub_23A729118(v22, a2, v23, a3);
        v18 = *(_QWORD *)(v24 + 8 * v6);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v9 = (v18 - 1) & v18;
    v12 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a3 + 56) + v12);
    swift_bridgeObjectRetain();
    LOBYTE(v16) = a4(v14, v15, v16);
    result = swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
    {
      *(unint64_t *)((char *)v22 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
        return sub_23A729118(v22, a2, v23, a3);
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v10)
    return sub_23A729118(v22, a2, v23, a3);
  v18 = *(_QWORD *)(v24 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v10)
      return sub_23A729118(v22, a2, v23, a3);
    v18 = *(_QWORD *)(v24 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23A7298B8(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_23A7296E0((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_23A7296E0((uint64_t)v11, v8, v6, a2);
    MEMORY[0x23B855E28](v11, -1, -1);
  }
  return a3;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23A729A4C()
{
  unint64_t result;

  result = qword_2542D2E80;
  if (!qword_2542D2E80)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D870, &type metadata for ApprovalDBEntrySource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2E80);
  }
  return result;
}

unint64_t sub_23A729A90()
{
  unint64_t result;

  result = qword_2569B4678;
  if (!qword_2569B4678)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D820, &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4678);
  }
  return result;
}

unint64_t sub_23A729AD4()
{
  unint64_t result;

  result = qword_2569B4680;
  if (!qword_2569B4680)
  {
    result = MEMORY[0x23B855DA4](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569B4680);
  }
  return result;
}

uint64_t sub_23A729B18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A7205E4(a1, a2);
  return a1;
}

unint64_t sub_23A729B2C()
{
  unint64_t result;

  result = qword_2542D2E98;
  if (!qword_2542D2E98)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D7D0, &type metadata for ApprovalDBEntrySource.FirstPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2E98);
  }
  return result;
}

uint64_t _s16DriverManagement10ApprovalDBV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 *i;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3 == *(_QWORD *)(a3 + 16))
  {
    if (!v3)
      return 1;
    for (i = (unsigned __int8 *)(swift_bridgeObjectRetain() + 64); ; i += 40)
    {
      v6 = *((_QWORD *)i - 2);
      v7 = *((_QWORD *)i - 1);
      v8 = *i;
      v9 = *((_QWORD *)i - 4);
      v10 = *((_QWORD *)i - 3);
      swift_bridgeObjectRetain();
      sub_23A72A29C(v6, v7);
      v11 = sub_23A7243E4(v9, v10, v6, v7, a3);
      swift_bridgeObjectRelease();
      if (v11 == 3)
      {
        swift_bridgeObjectRelease();
        sub_23A729B18(v6, v7);
        return 0;
      }
      sub_23A729B18(v6, v7);
      if (v8 != v11)
        break;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL _s16DriverManagement26ApprovalSettingsStateEntryV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
  {
    v5 = sub_23A73C0A8();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a2 + 24);
  if (!v7)
  {
    if (v8)
      return 0;
    goto LABEL_15;
  }
  if (!v8)
    return 0;
  v9 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && v7 == v8;
  if (v9 || (v10 = sub_23A73C0A8(), result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a2 + 40);
    if (v11)
    {
      if (v12)
      {
        if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v11 != v12)
        {
          v13 = sub_23A73C0A8();
          result = 0;
          if ((v13 & 1) == 0)
            return result;
        }
        goto LABEL_22;
      }
    }
    else if (!v12)
    {
LABEL_22:
      if ((_s16DriverManagement21ApprovalDBEntrySourceO21__derived_enum_equalsySbAC_ACtFZ_0(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 56)) & 1) != 0)return *(unsigned __int8 *)(a1 + 64) == *(unsigned __int8 *)(a2 + 64);
    }
    return 0;
  }
  return result;
}

uint64_t sub_23A729D68(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7261507473726966 && a2 == 0xEA00000000007974;
  if (v2 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261506472696874 && a2 == 0xEA00000000007974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A73C0A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A729E70(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD00000000000001BLL && a2 == 0x800000023A73F710)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23A73C0A8();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

_QWORD *sub_23A729EF4(_QWORD *a1)
{
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
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F18);
  v3 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  v26 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F08);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v28 = a1;
  v14 = __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23A729A4C();
  v15 = v30;
  sub_23A73C120();
  if (!v15)
  {
    v24 = v5;
    v16 = v27;
    v30 = v10;
    v17 = sub_23A73C048();
    if (*(_QWORD *)(v17 + 16) == 1)
    {
      if ((*(_BYTE *)(v17 + 32) & 1) != 0)
      {
        LOBYTE(v29) = 1;
        sub_23A729A90();
        sub_23A73C000();
        sub_23A72D178();
        v18 = v25;
        sub_23A73C03C();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v9);
        v14 = v29;
      }
      else
      {
        LOBYTE(v29) = 0;
        sub_23A729B2C();
        sub_23A73C000();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v24);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v9);
        v14 = 0;
      }
    }
    else
    {
      v19 = sub_23A73BF58();
      swift_allocError();
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569B47C8);
      v14 = v12;
      *v21 = &type metadata for ApprovalDBEntrySource;
      sub_23A73C00C();
      sub_23A73BF4C();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26D0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v9);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v14;
}

uint64_t sub_23A72A274(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A72A29C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A720478(a1, a2);
  return a1;
}

unint64_t sub_23A72A2B0()
{
  unint64_t result;

  result = qword_2569B4690;
  if (!qword_2569B4690)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D780, &type metadata for ApprovalDBEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4690);
  }
  return result;
}

_OWORD *sub_23A72A2F4(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  return a2;
}

unint64_t sub_23A72A304()
{
  unint64_t result;

  result = qword_2569B4698;
  if (!qword_2569B4698)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalDBEntrySource, &type metadata for ApprovalDBEntrySource);
    atomic_store(result, (unint64_t *)&qword_2569B4698);
  }
  return result;
}

unint64_t sub_23A72A348()
{
  unint64_t result;

  result = qword_2569B46A0;
  if (!qword_2569B46A0)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalState, &type metadata for ApprovalState);
    atomic_store(result, (unint64_t *)&qword_2569B46A0);
  }
  return result;
}

uint64_t sub_23A72A38C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023A73F730 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61766F72707061 && a2 == 0xED00006574617453)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23A73C0A8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A72A4F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B47C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72A2B0();
  sub_23A73C120();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v20) = 0;
  v9 = sub_23A73C024();
  v11 = v10;
  v19 = v9;
  v22 = 1;
  sub_23A72CEB8();
  swift_bridgeObjectRetain();
  sub_23A73C03C();
  v22 = 2;
  v17 = v21;
  v18 = v20;
  sub_23A72A29C(v20, v21);
  sub_23A72CEFC();
  sub_23A73C03C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v20;
  swift_bridgeObjectRetain();
  v14 = v17;
  v13 = v18;
  sub_23A72A29C(v18, v17);
  sub_23A729B18(v13, v14);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = sub_23A729B18(v13, v14);
  *(_QWORD *)a2 = v19;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v12;
  return result;
}

unint64_t sub_23A72A774()
{
  unint64_t result;

  result = qword_2569B46B0;
  if (!qword_2569B46B0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D730, &type metadata for ApprovalDB.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B46B0);
  }
  return result;
}

unint64_t sub_23A72A7B8()
{
  unint64_t result;

  result = qword_2569B46B8;
  if (!qword_2569B46B8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D708, &type metadata for ApprovalDB.V0);
    atomic_store(result, (unint64_t *)&qword_2569B46B8);
  }
  return result;
}

_QWORD *sub_23A72A7FC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4798);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72CD84();
  sub_23A73C120();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4780);
    sub_23A72D08C(&qword_2569B47A0, &qword_2569B4780, (uint64_t (*)(void))sub_23A72CE2C, MEMORY[0x24BEE12D0]);
    sub_23A73C03C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_23A72A948(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12406 && a2 == 0xE200000000000000;
  if (v2 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A73C0A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A72AA20(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[8];
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B47B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_23A72A774();
  sub_23A73C120();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[7] = 0;
    sub_23A72D134();
    sub_23A73C03C();
    v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_23A73C030();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_23A72ABB0()
{
  unint64_t result;

  result = qword_2542D2FE0;
  if (!qword_2542D2FE0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D6B8, &type metadata for ApprovalSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2FE0);
  }
  return result;
}

unint64_t sub_23A72ABF4()
{
  unint64_t result;

  result = qword_2569B46D0;
  if (!qword_2569B46D0)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalSettingsStateEntry, &type metadata for ApprovalSettingsStateEntry);
    atomic_store(result, (unint64_t *)&qword_2569B46D0);
  }
  return result;
}

_QWORD *sub_23A72AC38(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D30A8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72ABB0();
  sub_23A73C120();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3078);
    sub_23A72D08C(&qword_2542D3080, &qword_2542D3078, (uint64_t (*)(void))sub_23A72D0F0, MEMORY[0x24BEE1720]);
    sub_23A73C03C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_23A72AD84()
{
  return swift_release();
}

uint64_t sub_23A72AD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_23A729B18(a8, a9);
  }
  return result;
}

uint64_t sub_23A72ADE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2EE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A72AE2C()
{
  unint64_t result;

  result = qword_2542D2EC8;
  if (!qword_2542D2EC8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D668, &type metadata for ApprovalSettingsStateEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2EC8);
  }
  return result;
}

uint64_t sub_23A72AE70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

uint64_t sub_23A72AF60(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x800000023A73F730 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7865546567617375 && a2 == 0xE900000000000074 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_23A73C0A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C61766F72707061 && a2 == 0xED00006574617453)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_23A73C0A8();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23A72B1B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A72AE2C();
  sub_23A73C120();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v31) = 0;
  v9 = sub_23A73C024();
  v11 = v10;
  v29 = v9;
  LOBYTE(v31) = 1;
  swift_bridgeObjectRetain();
  v12 = sub_23A73C018();
  v30 = v13;
  v26 = v12;
  LOBYTE(v31) = 2;
  swift_bridgeObjectRetain();
  v28 = 0;
  v25 = sub_23A73C018();
  v33 = 3;
  v15 = v14;
  sub_23A72CEB8();
  swift_bridgeObjectRetain();
  sub_23A73C03C();
  v27 = v15;
  v16 = v31;
  v33 = 4;
  v24 = v32;
  sub_23A72A29C(v31, v32);
  sub_23A72CEFC();
  sub_23A73C03C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v31;
  swift_bridgeObjectRetain();
  v18 = v16;
  v19 = v30;
  swift_bridgeObjectRetain();
  v20 = v27;
  swift_bridgeObjectRetain();
  v21 = v24;
  sub_23A72A29C(v18, v24);
  sub_23A729B18(v18, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = sub_23A729B18(v18, v21);
  *(_QWORD *)a2 = v29;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = v25;
  *(_QWORD *)(a2 + 40) = v20;
  *(_QWORD *)(a2 + 48) = v18;
  *(_QWORD *)(a2 + 56) = v21;
  *(_BYTE *)(a2 + 64) = v17;
  return result;
}

unint64_t sub_23A72B5A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B46E0;
  if (!qword_2569B46E0)
  {
    v1 = sub_23A73BC34();
    result = MEMORY[0x23B855DA4](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_2569B46E0);
  }
  return result;
}

uint64_t sub_23A72B5EC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain();
  sub_23A72A29C(v2, v3);
  return a1;
}

uint64_t sub_23A72B62C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRelease();
  sub_23A729B18(v2, v3);
  return a1;
}

unint64_t sub_23A72B670()
{
  unint64_t result;

  result = qword_2569B46E8;
  if (!qword_2569B46E8)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalState, &type metadata for ApprovalState);
    atomic_store(result, (unint64_t *)&qword_2569B46E8);
  }
  return result;
}

uint64_t sub_23A72B6B4()
{
  return sub_23A72B6E0(&qword_2569B46F0, &qword_2569B46F8, MEMORY[0x24BEE12E0]);
}

uint64_t sub_23A72B6E0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B855DA4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A72B724()
{
  unint64_t result;

  result = qword_2569B4700;
  if (!qword_2569B4700)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalDBEntrySource, &type metadata for ApprovalDBEntrySource);
    atomic_store(result, (unint64_t *)&qword_2569B4700);
  }
  return result;
}

unint64_t sub_23A72B76C()
{
  unint64_t result;

  result = qword_2542D3018;
  if (!qword_2542D3018)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalSettingsStateEntry, &type metadata for ApprovalSettingsStateEntry);
    atomic_store(result, (unint64_t *)&qword_2542D3018);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_23A72B7C8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A72B7D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalState()
{
  return &type metadata for ApprovalState;
}

uint64_t *destroy for ApprovalDBEntrySource(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
    return (uint64_t *)sub_23A7205E4(*result, v1);
  return result;
}

uint64_t _s16DriverManagement21ApprovalDBEntrySourceOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *a2;
    sub_23A720478(*a2, a2[1]);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for ApprovalDBEntrySource(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a1[1];
  v5 = a2[1];
  v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      v9 = *a2;
      sub_23A720478(v9, v5);
      v10 = *a1;
      v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_23A7205E4(v10, v11);
      return a1;
    }
    sub_23A7205E4(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v7 = *a2;
  sub_23A720478(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for ApprovalDBEntrySource(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_23A7205E4(v7, v4);
      return a1;
    }
    sub_23A7205E4(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDBEntrySource(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 12);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  if (v3 + 1 >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ApprovalDBEntrySource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_23A72B9F8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v1) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v1) & 0xC | (v1 >> 2));
  else
    return 0;
}

_QWORD *sub_23A72BA20(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource()
{
  return &type metadata for ApprovalDBEntrySource;
}

uint64_t initializeBufferWithCopyOfBuffer for ApprovalDBEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ApprovalDBEntry(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >> 60 != 15)
    return sub_23A7205E4(*(_QWORD *)(a1 + 16), v3);
  return result;
}

uint64_t initializeWithCopy for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = (_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    v7 = *(_QWORD *)v5;
    sub_23A720478(v7, v6);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v6;
  }
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t assignWithCopy for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_23A720478(*v4, *(_QWORD *)(a2 + 24));
      v8 = *(_QWORD *)(a1 + 16);
      v9 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v5;
      sub_23A7205E4(v8, v9);
      goto LABEL_8;
    }
    sub_23A72BC24(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  sub_23A720478(*v4, *(_QWORD *)(a2 + 24));
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
LABEL_8:
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t sub_23A72BC24(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4708);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ApprovalDBEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = *v5;
      *(_QWORD *)(a1 + 24) = v7;
      sub_23A7205E4(v8, v6);
      goto LABEL_6;
    }
    sub_23A72BC24(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
LABEL_6:
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDBEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalDBEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDBEntry()
{
  return &type metadata for ApprovalDBEntry;
}

_QWORD *initializeBufferWithCopyOfBuffer for ApprovalDB(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ApprovalDB()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ApprovalDB(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for ApprovalDB(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalDB(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalDB(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB()
{
  return &type metadata for ApprovalDB;
}

ValueMetadata *type metadata accessor for ApprovalSettingsState()
{
  return &type metadata for ApprovalSettingsState;
}

uint64_t destroy for ApprovalSettingsStateEntry(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >> 60 != 15)
    return sub_23A7205E4(*(_QWORD *)(a1 + 48), v3);
  return result;
}

uint64_t initializeWithCopy for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = (uint64_t *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
  }
  else
  {
    v9 = *v7;
    sub_23A720478(*v7, v8);
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = v8;
  }
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 48);
  v5 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_23A720478(*v4, *(_QWORD *)(a2 + 56));
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 48) = v7;
      *(_QWORD *)(a1 + 56) = v5;
      sub_23A7205E4(v8, v9);
      goto LABEL_8;
    }
    sub_23A72BC24(a1 + 48);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  sub_23A720478(*v4, *(_QWORD *)(a2 + 56));
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v5;
LABEL_8:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ApprovalSettingsStateEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 >> 60 != 15)
  {
    v9 = *(_QWORD *)(a2 + 56);
    if (v9 >> 60 != 15)
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(a1 + 48) = *v7;
      *(_QWORD *)(a1 + 56) = v9;
      sub_23A7205E4(v10, v8);
      goto LABEL_6;
    }
    sub_23A72BC24(a1 + 48);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)v7;
LABEL_6:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalSettingsStateEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalSettingsStateEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ApprovalSettingsStateEntry()
{
  return &type metadata for ApprovalSettingsStateEntry;
}

uint64_t sub_23A72C290()
{
  return type metadata accessor for ApprovalStateUpdateRequest();
}

uint64_t type metadata accessor for ApprovalStateUpdateRequest()
{
  uint64_t result;

  result = qword_2569B4710;
  if (!qword_2569B4710)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A72C2D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A73BC34();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ApprovalSettingsStateEntry.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalSettingsStateEntry.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23A72C434 + 4 * byte_23A73CACA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A72C468 + 4 * byte_23A73CAC5[v4]))();
}

uint64_t sub_23A72C468(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C470(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A72C478);
  return result;
}

uint64_t sub_23A72C484(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A72C48CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A72C490(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C498(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalSettingsStateEntry.CodingKeys()
{
  return &type metadata for ApprovalSettingsStateEntry.CodingKeys;
}

uint64_t sub_23A72C4C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for ApprovalSettingsState.CodingKeys()
{
  return &type metadata for ApprovalSettingsState.CodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDB.V0()
{
  return &type metadata for ApprovalDB.V0;
}

_BYTE *sub_23A72C4F0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB.CodingKeys()
{
  return &type metadata for ApprovalDB.CodingKeys;
}

uint64_t _s16DriverManagement13ApprovalStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16DriverManagement13ApprovalStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A72C5E8 + 4 * byte_23A73CAD4[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A72C61C + 4 * byte_23A73CACF[v4]))();
}

uint64_t sub_23A72C61C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C624(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A72C62CLL);
  return result;
}

uint64_t sub_23A72C638(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A72C640);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A72C644(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C64C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDBEntry.CodingKeys()
{
  return &type metadata for ApprovalDBEntry.CodingKeys;
}

uint64_t _s16DriverManagement10ApprovalDBV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16DriverManagement10ApprovalDBV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A72C744 + 4 * byte_23A73CADE[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A72C778 + 4 * byte_23A73CAD9[v4]))();
}

uint64_t sub_23A72C778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A72C788);
  return result;
}

uint64_t sub_23A72C794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A72C79CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A72C7A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A72C7A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.CodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.CodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.FirstPartyCodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.FirstPartyCodingKeys;
}

ValueMetadata *type metadata accessor for ApprovalDBEntrySource.ThirdPartyCodingKeys()
{
  return &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys;
}

unint64_t sub_23A72C7E8()
{
  unint64_t result;

  result = qword_2569B4720;
  if (!qword_2569B4720)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D208, &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4720);
  }
  return result;
}

unint64_t sub_23A72C830()
{
  unint64_t result;

  result = qword_2569B4728;
  if (!qword_2569B4728)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D310, &type metadata for ApprovalDBEntrySource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4728);
  }
  return result;
}

unint64_t sub_23A72C878()
{
  unint64_t result;

  result = qword_2569B4730;
  if (!qword_2569B4730)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D3C8, &type metadata for ApprovalDBEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4730);
  }
  return result;
}

unint64_t sub_23A72C8C0()
{
  unint64_t result;

  result = qword_2569B4738;
  if (!qword_2569B4738)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D480, &type metadata for ApprovalDB.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4738);
  }
  return result;
}

unint64_t sub_23A72C908()
{
  unint64_t result;

  result = qword_2569B4740;
  if (!qword_2569B4740)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D560, &type metadata for ApprovalSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4740);
  }
  return result;
}

unint64_t sub_23A72C950()
{
  unint64_t result;

  result = qword_2569B4748;
  if (!qword_2569B4748)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D618, &type metadata for ApprovalSettingsStateEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4748);
  }
  return result;
}

unint64_t sub_23A72C998()
{
  unint64_t result;

  result = qword_2542D2ED8;
  if (!qword_2542D2ED8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D588, &type metadata for ApprovalSettingsStateEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2ED8);
  }
  return result;
}

unint64_t sub_23A72C9E0()
{
  unint64_t result;

  result = qword_2542D2ED0;
  if (!qword_2542D2ED0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D5B0, &type metadata for ApprovalSettingsStateEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2ED0);
  }
  return result;
}

unint64_t sub_23A72CA28()
{
  unint64_t result;

  result = qword_2542D2FF0;
  if (!qword_2542D2FF0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D4D0, &type metadata for ApprovalSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2FF0);
  }
  return result;
}

unint64_t sub_23A72CA70()
{
  unint64_t result;

  result = qword_2542D2FE8;
  if (!qword_2542D2FE8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D4F8, &type metadata for ApprovalSettingsState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2FE8);
  }
  return result;
}

unint64_t sub_23A72CAB8()
{
  unint64_t result;

  result = qword_2569B4750;
  if (!qword_2569B4750)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D3F0, &type metadata for ApprovalDB.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4750);
  }
  return result;
}

unint64_t sub_23A72CB00()
{
  unint64_t result;

  result = qword_2569B4758;
  if (!qword_2569B4758)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D418, &type metadata for ApprovalDB.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4758);
  }
  return result;
}

unint64_t sub_23A72CB48()
{
  unint64_t result;

  result = qword_2569B4760;
  if (!qword_2569B4760)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D338, &type metadata for ApprovalDBEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4760);
  }
  return result;
}

unint64_t sub_23A72CB90()
{
  unint64_t result;

  result = qword_2569B4768;
  if (!qword_2569B4768)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D360, &type metadata for ApprovalDBEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4768);
  }
  return result;
}

unint64_t sub_23A72CBD8()
{
  unint64_t result;

  result = qword_2542D2EA8;
  if (!qword_2542D2EA8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D230, &type metadata for ApprovalDBEntrySource.FirstPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2EA8);
  }
  return result;
}

unint64_t sub_23A72CC20()
{
  unint64_t result;

  result = qword_2542D2EA0;
  if (!qword_2542D2EA0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D258, &type metadata for ApprovalDBEntrySource.FirstPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2EA0);
  }
  return result;
}

unint64_t sub_23A72CC68()
{
  unint64_t result;

  result = qword_2542D2EB8;
  if (!qword_2542D2EB8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D178, &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2EB8);
  }
  return result;
}

unint64_t sub_23A72CCB0()
{
  unint64_t result;

  result = qword_2542D2EB0;
  if (!qword_2542D2EB0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D1A0, &type metadata for ApprovalDBEntrySource.ThirdPartyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2EB0);
  }
  return result;
}

unint64_t sub_23A72CCF8()
{
  unint64_t result;

  result = qword_2542D2E90;
  if (!qword_2542D2E90)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D280, &type metadata for ApprovalDBEntrySource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2E90);
  }
  return result;
}

unint64_t sub_23A72CD40()
{
  unint64_t result;

  result = qword_2542D2E88;
  if (!qword_2542D2E88)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D2A8, &type metadata for ApprovalDBEntrySource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542D2E88);
  }
  return result;
}

unint64_t sub_23A72CD84()
{
  unint64_t result;

  result = qword_2569B4778;
  if (!qword_2569B4778)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D9C8, &type metadata for ApprovalDB.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B4778);
  }
  return result;
}

unint64_t sub_23A72CDC8()
{
  unint64_t result;

  result = qword_2569B4790;
  if (!qword_2569B4790)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalDBEntry, &type metadata for ApprovalDBEntry);
    atomic_store(result, (unint64_t *)&qword_2569B4790);
  }
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

unint64_t sub_23A72CE2C()
{
  unint64_t result;

  result = qword_2569B47A8;
  if (!qword_2569B47A8)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalDBEntry, &type metadata for ApprovalDBEntry);
    atomic_store(result, (unint64_t *)&qword_2569B47A8);
  }
  return result;
}

unint64_t sub_23A72CE74()
{
  unint64_t result;

  result = qword_2542D2E70;
  if (!qword_2542D2E70)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalState, &type metadata for ApprovalState);
    atomic_store(result, (unint64_t *)&qword_2542D2E70);
  }
  return result;
}

unint64_t sub_23A72CEB8()
{
  unint64_t result;

  result = qword_2542D2EC0;
  if (!qword_2542D2EC0)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalDBEntrySource, &type metadata for ApprovalDBEntrySource);
    atomic_store(result, (unint64_t *)&qword_2542D2EC0);
  }
  return result;
}

unint64_t sub_23A72CEFC()
{
  unint64_t result;

  result = qword_2542D2E78;
  if (!qword_2542D2E78)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalState, &type metadata for ApprovalState);
    atomic_store(result, (unint64_t *)&qword_2542D2E78);
  }
  return result;
}

uint64_t sub_23A72CF40()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A72CF64()
{
  return swift_deallocObject();
}

uint64_t sub_23A72CF74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A72A29C(v2, v3);
  return a1;
}

uint64_t sub_23A72CFD4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A729B18(v2, v3);
  return a1;
}

uint64_t sub_23A72D034(uint64_t a1)
{
  sub_23A72A29C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_23A72D060(uint64_t a1)
{
  sub_23A729B18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_23A72D08C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x23B855DA4](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A72D0F0()
{
  unint64_t result;

  result = qword_2542D3020;
  if (!qword_2542D3020)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalSettingsStateEntry, &type metadata for ApprovalSettingsStateEntry);
    atomic_store(result, (unint64_t *)&qword_2542D3020);
  }
  return result;
}

unint64_t sub_23A72D134()
{
  unint64_t result;

  result = qword_2569B47B8;
  if (!qword_2569B47B8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D4A8, &type metadata for ApprovalDB.V0);
    atomic_store(result, (unint64_t *)&qword_2569B47B8);
  }
  return result;
}

unint64_t sub_23A72D178()
{
  unint64_t result;

  result = qword_2569B47D0;
  if (!qword_2569B47D0)
  {
    result = MEMORY[0x23B855DA4](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569B47D0);
  }
  return result;
}

uint64_t _s16DriverManagement21ApprovalSettingsStateV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s16DriverManagement21ApprovalSettingsStateV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A72D24C + 4 * byte_23A73CAE3[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A72D26C + 4 * byte_23A73CAE8[v4]))();
}

_BYTE *sub_23A72D24C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A72D26C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A72D274(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A72D27C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A72D284(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A72D28C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalDB.V0.CodingKeys()
{
  return &type metadata for ApprovalDB.V0.CodingKeys;
}

uint64_t sub_23A72D2AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ApprovalsError()
{
  return sub_23A72D2C4();
}

uint64_t sub_23A72D2C4()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16DriverManagement14ApprovalsErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23A72D2AC();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ApprovalsError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23A72D2AC();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A72D2C4();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ApprovalsError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A72D2C4();
  return a1;
}

uint64_t getEnumTagSinglePayload for ApprovalsError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ApprovalsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A72D44C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23A72D454(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovalsError()
{
  return &type metadata for ApprovalsError;
}

unint64_t sub_23A72D474()
{
  unint64_t result;

  result = qword_2569B47D8;
  if (!qword_2569B47D8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D9A0, &type metadata for ApprovalDB.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B47D8);
  }
  return result;
}

unint64_t sub_23A72D4BC()
{
  unint64_t result;

  result = qword_2569B47E0;
  if (!qword_2569B47E0)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D910, &type metadata for ApprovalDB.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B47E0);
  }
  return result;
}

unint64_t sub_23A72D504()
{
  unint64_t result;

  result = qword_2569B47E8;
  if (!qword_2569B47E8)
  {
    result = MEMORY[0x23B855DA4](&unk_23A73D938, &type metadata for ApprovalDB.V0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569B47E8);
  }
  return result;
}

uint64_t property wrapper backing initializer of DriverManager.driverApprovalStates()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3050);
  return sub_23A73BCA0();
}

uint64_t sub_23A72D5B4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  return v1;
}

id sub_23A72D624()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DriverManager()), sel_init);
  static DriverManager.shared = (uint64_t)result;
  return result;
}

uint64_t *DriverManager.shared.unsafeMutableAddressor()
{
  if (qword_2542D2F88 != -1)
    swift_once();
  return &static DriverManager.shared;
}

id static DriverManager.shared.getter()
{
  if (qword_2542D2F88 != -1)
    swift_once();
  return (id)static DriverManager.shared;
}

id static DriverManager.sharedManager()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_23A73BC88();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v4 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_2542D2F88 != -1)
    swift_once();
  return (id)static DriverManager.shared;
}

id DriverManager.addObserver(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = sub_23A73BC88();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v8 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_observerLock);
  objc_msgSend(v9, sel_lock);
  v10 = (_QWORD *)(v2 + OBJC_IVAR____SwiftDriverManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v11 = swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_23A735940(v11, a1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if ((v2 & 1) == 0)
  {
    swift_beginAccess();
    v12 = swift_unknownObjectRetain();
    MEMORY[0x23B8556F0](v12);
    if (*(_QWORD *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23A73BE38();
    sub_23A73BE50();
    sub_23A73BE2C();
    swift_endAccess();
  }
  return objc_msgSend(v9, sel_unlock);
}

id DriverManager.removeObserver(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  unint64_t *v10;
  uint64_t v11;
  id result;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = sub_23A73BC88();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v8 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_observerLock);
  objc_msgSend(v9, sel_lock);
  v10 = (unint64_t *)(v2 + OBJC_IVAR____SwiftDriverManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v11 = sub_23A735B30(v10, a1);
  result = (id)swift_unknownObjectRelease();
  if (*v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_23A73BFC4();
    result = (id)swift_bridgeObjectRelease();
    if (v13 >= v11)
      goto LABEL_3;
  }
  else
  {
    v13 = *(_QWORD *)((*v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= v11)
    {
LABEL_3:
      sub_23A735E4C(v11, v13);
      swift_endAccess();
      return objc_msgSend(v9, sel_unlock);
    }
  }
  __break(1u);
  return result;
}

void sub_23A72DC84(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;

  swift_unknownObjectRetain();
  v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();

}

Swift::Int __swiftcall DriverManager.driverCount()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  Swift::Int v8;
  uint64_t v10;
  unint64_t v11;

  v1 = v0;
  v2 = sub_23A73BC88();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v6 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = *(void **)(v1 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v7, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_unlock);
  return v8;
}

Swift::Int __swiftcall DriverManager.thirdPartyDriverCount()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t (*v18)();
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  Swift::Int v23;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A73BC88();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v9 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = *(void **)(v1 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v10, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  v29 = v30;
  v30 = MEMORY[0x24BEE4AF8];
  if (v29 >> 62)
    goto LABEL_16;
  v28 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v28)
  {
    while (1)
    {
      v26 = v10;
      v11 = 0;
      v12 = v29 & 0xC000000000000001;
      v13 = v29 & 0xFFFFFFFFFFFFFF8;
      v14 = type metadata accessor for DriverKitDriverSource;
      v27 = v4;
      while (v12)
      {
        v15 = (id)MEMORY[0x23B85581C](v11, v29);
LABEL_9:
        v16 = v15;
        v17 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_15;
        v18 = v14;
        v19 = OBJC_IVAR____SwiftDriverApprovalState_driver;
        v20 = (uint64_t)v15 + *(int *)(type metadata accessor for DriverKitDriver() + 20) + v19;
        v14 = v18;
        sub_23A72126C(v20, (uint64_t)v4, (uint64_t (*)(_QWORD))v18);
        v21 = type metadata accessor for DriverKitDriverApp();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v4, 1, v21) == 1)
        {

        }
        else
        {
          sub_23A7212B0((uint64_t)v4, (uint64_t (*)(_QWORD))v18);
          sub_23A73BF7C();
          v10 = (void *)v12;
          sub_23A73BF94();
          v4 = v27;
          sub_23A73BFA0();
          sub_23A73BF88();
          v14 = v18;
        }
        ++v11;
        if (v17 == v28)
        {
          v22 = v30;
          v10 = v26;
          goto LABEL_18;
        }
      }
      if (v11 < *(_QWORD *)(v13 + 16))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v28 = sub_23A73BFC4();
      if (!v28)
        goto LABEL_17;
    }
    v15 = *(id *)(v29 + 8 * v11 + 32);
    goto LABEL_9;
  }
LABEL_17:
  v22 = MEMORY[0x24BEE4AF8];
LABEL_18:
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_unlock);
  if ((v22 & 0x8000000000000000) != 0 || (v22 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v23 = sub_23A73BFC4();
    swift_release();
  }
  else
  {
    v23 = *(_QWORD *)(v22 + 16);
  }
  swift_release();
  return v23;
}

uint64_t DriverManager.driverApprovalStates(filter:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  unint64_t v8;

  v5 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v5, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  sub_23A7366B8(a1, a2);
  v6 = sub_23A736150(v8, a1, a2);
  sub_23A7366CC(a1, a2);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_unlock);
  return v6;
}

Swift::Int __swiftcall DriverManager.driverCount(forAppID:)(Swift::String forAppID)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  Swift::Int v12;
  _BYTE v14[16];
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v2 = v1;
  object = forAppID._object;
  countAndFlagsBits = forAppID._countAndFlagsBits;
  v5 = sub_23A73BC88();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v9 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  v10 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v10, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  v15 = countAndFlagsBits;
  v16 = object;
  v11 = sub_23A732ADC((uint64_t (*)(id *))sub_23A7366E0, (uint64_t)v14, v17);
  objc_msgSend(v10, sel_unlock);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v12;
}

Swift::Void __swiftcall DriverManager.refresh()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_23A73BCF4();
  v18 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A73BD0C();
  v5 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A73BC88();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v12 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_23A7366FC(0, &qword_2542D3090);
  v13 = (void *)sub_23A73BE98();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v1;
  aBlock[4] = sub_23A736758;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A72E9BC;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  v16 = v1;
  swift_release();
  sub_23A73BD00();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A736BBC(&qword_2542D3040, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3058);
  sub_23A72B6E0(&qword_2542D3060, &qword_2542D3058, MEMORY[0x24BEE12C8]);
  sub_23A73BF04();
  MEMORY[0x23B85578C](0, v7, v4, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
}

uint64_t sub_23A72E7F4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v1 = v0;
  v2 = sub_23A73BD18();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_23A73BC88();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v10 = sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23A7366FC(0, &qword_2542D3090);
  *v5 = sub_23A73BE98();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5610], v2);
  LOBYTE(v10) = sub_23A73BD24();
  result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v10 & 1) != 0)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v1;
    v13 = v1;
    DriverKitDaemonClient.getApprovalStateForSettings(_:)((uint64_t)sub_23A736C28, v12);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23A72E9F4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *ObjectType;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;

  ObjectType = (objc_class *)swift_getObjectType();
  v1 = sub_23A73BE8C();
  v21 = *(_QWORD *)(v1 - 8);
  v22 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A73BE80();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23A73BD0C();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23A73BC88();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0;
  sub_23A73BEBC();
  sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v11 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for DriverKitDaemonClient();
  v12 = (_QWORD *)swift_allocObject();
  v12[3] = 0;
  v12[4] = 0;
  v12[2] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____SwiftDriverManager_client] = v12;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  *(_QWORD *)&v10[OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock] = v13;
  swift_beginAccess();
  v14 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3050);
  sub_23A73BCA0();
  swift_endAccess();
  sub_23A7366FC(0, &qword_2542D3090);
  sub_23A73BD00();
  v26 = v14;
  sub_23A736BBC(&qword_2542D3088, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3068);
  sub_23A72B6E0(&qword_2542D3070, &qword_2542D3068, MEMORY[0x24BEE12C8]);
  sub_23A73BF04();
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v3, *MEMORY[0x24BEE5750], v22);
  *(_QWORD *)&v10[OBJC_IVAR____SwiftDriverManager_launchServicesQueue] = sub_23A73BEB0();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  *(_QWORD *)&v10[OBJC_IVAR____SwiftDriverManager_observerLock] = v15;
  *(_QWORD *)&v10[OBJC_IVAR____SwiftDriverManager_observers] = v14;

  v24.receiver = v10;
  v24.super_class = ObjectType;
  v16 = objc_msgSendSuper2(&v24, sel_init);
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = v16;
  swift_retain();
  swift_retain();
  DriverKitDaemonClient.registerForApprovalsChangeNotification(_:)((uint64_t)sub_23A736C20, v17);
  swift_release();
  swift_release_n();

  return v18;
}

void sub_23A72EDDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v2 = sub_23A73BCF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A73BD0C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = MEMORY[0x23B855E88](a1 + 16);
  if (v10)
  {
    v11 = (void *)v10;
    sub_23A73BE5C();
    v21 = v3;
    sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
    v12 = (void *)sub_23A73BEC8();
    v20 = v6;
    v13 = MEMORY[0x24BEE4AF8];
    sub_23A73BC64();

    sub_23A7366FC(0, &qword_2542D3090);
    v14 = (void *)sub_23A73BE98();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v11;
    aBlock[4] = sub_23A736E10;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A72E9BC;
    aBlock[3] = &block_descriptor_22;
    v16 = _Block_copy(aBlock);
    v17 = v11;
    swift_release();
    sub_23A73BD00();
    aBlock[0] = v13;
    sub_23A736BBC(&qword_2542D3040, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3058);
    sub_23A72B6E0(&qword_2542D3060, &qword_2542D3058, MEMORY[0x24BEE12C8]);
    sub_23A73BF04();
    MEMORY[0x23B85578C](0, v9, v5, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  }
  else
  {
    sub_23A73BE68();
    sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
    v18 = (void *)sub_23A73BEC8();
    sub_23A73BC64();

  }
}

id DriverManager.__deallocating_deinit()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_retain();
  sub_23A738D80();
  sub_23A73BD78();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  swift_release();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_23A72F2D8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t i;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  objc_class *v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  unsigned __int8 v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unsigned __int8 v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  char v102;
  _BYTE *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void (*v107)(unsigned __int8 *, _QWORD);
  _QWORD *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  void (*v115)(unsigned __int8 *, _QWORD);
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  unint64_t *v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  void *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  id result;
  uint64_t *v136;
  char *v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  int64_t v148;
  uint64_t v149;
  uint64_t v150;
  __int128 v151;
  uint64_t **v152;
  uint64_t v153;
  unint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  unsigned __int8 v159[40];
  objc_super v160;
  uint64_t v161;
  unint64_t v162;

  v145 = a2;
  v153 = type metadata accessor for DriverKitDriver();
  v150 = *(_QWORD *)(v153 - 8);
  v3 = MEMORY[0x24BDAC7A8](v153);
  v136 = (uint64_t *)((char *)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = MEMORY[0x24BDAC7A8](v3);
  v149 = (uint64_t)&v136 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v137 = (char *)&v136 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v152 = (uint64_t **)((char *)&v136 - v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3010);
  MEMORY[0x24BDAC7A8](v10);
  v144 = (uint64_t)&v136 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = type metadata accessor for SettingsApplicationRecord();
  v142 = *(_QWORD *)(v143 - 8);
  MEMORY[0x24BDAC7A8](v143);
  v139 = (uint64_t)&v136 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x24BDAC7A8](v13);
  v146 = (uint64_t **)((char *)&v136 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_23A73BD18();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (uint64_t)&v136 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23A73BC88();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v136 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  v140 = sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v23 = sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  sub_23A7366FC(0, &qword_2542D3090);
  *(_QWORD *)v18 = sub_23A73BE98();
  (*(void (**)(uint64_t, _QWORD, unint64_t))(v16 + 104))(v18, *MEMORY[0x24BEE5610], v15);
  LOBYTE(v23) = sub_23A73BD24();
  (*(void (**)(uint64_t, unint64_t))(v16 + 8))(v18, v15);
  if ((v23 & 1) == 0)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    swift_bridgeObjectRetain();
    v63 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v162 = MEMORY[0x24BEE4AF8];
  v24 = *(_QWORD *)(a1 + 56);
  v147 = a1 + 56;
  v25 = 1 << *(_BYTE *)(a1 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & v24;
  v148 = (unint64_t)(v25 + 63) >> 6;
  swift_bridgeObjectRetain();
  v28 = 0;
  v138 = xmmword_23A73C950;
  *(_QWORD *)&v151 = a1;
  v29 = v146;
  if (!v27)
    goto LABEL_6;
LABEL_5:
  v156 = (v27 - 1) & v27;
  v157 = v28;
  for (i = __clz(__rbit64(v27)) | (v28 << 6); ; i = __clz(__rbit64(v32)) + (v33 << 6))
  {
    v35 = *(_QWORD *)(a1 + 48) + 72 * i;
    v36 = *(_QWORD *)(v35 + 8);
    v158 = *(_QWORD *)v35;
    v38 = *(_QWORD *)(v35 + 16);
    v37 = *(_QWORD *)(v35 + 24);
    v39 = *(_QWORD *)(v35 + 32);
    v20 = *(_QWORD *)(v35 + 40);
    v40 = *(void **)(v35 + 48);
    v15 = *(_QWORD *)(v35 + 56);
    LODWORD(v154) = *(unsigned __int8 *)(v35 + 64);
    v155 = v40;
    if (v15 >> 60 == 15)
    {
      v41 = type metadata accessor for DriverKitDriverApp();
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v29, 1, 1, v41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A72A29C((uint64_t)v40, v15);
    }
    else
    {
      v42 = v38;
      v43 = v145;
      v44 = v143;
      v45 = v142;
      if (*(_QWORD *)(v145 + 16))
      {
        sub_23A72A29C((uint64_t)v40, v15);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A72A29C((uint64_t)v40, v15);
        sub_23A72A29C((uint64_t)v40, v15);
        v46 = sub_23A72861C((uint64_t)v40, v15);
        if ((v47 & 1) != 0)
        {
          v48 = *(_QWORD *)(v43 + 56) + *(_QWORD *)(v45 + 72) * v46;
          v49 = v144;
          sub_23A72126C(v48, v144, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v49, 0, 1, v44);
        }
        else
        {
          v49 = v144;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v144, 1, 1, v44);
        }
        sub_23A729B18((uint64_t)v40, v15);
      }
      else
      {
        v49 = v144;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v142 + 56))(v144, 1, 1, v143);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A72A29C((uint64_t)v40, v15);
        sub_23A72A29C((uint64_t)v40, v15);
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v49, 1, v44) == 1)
      {
        sub_23A736D14(v49);
        sub_23A73BE68();
        __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
        v50 = swift_allocObject();
        *(_OWORD *)(v50 + 16) = v138;
        *(_QWORD *)(v50 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v50 + 64) = sub_23A7367D8();
        *(_QWORD *)(v50 + 32) = v158;
        *(_QWORD *)(v50 + 40) = v36;
        swift_bridgeObjectRetain();
        v51 = (void *)sub_23A73BEC8();
        sub_23A73BC64();
        swift_bridgeObjectRelease();

        v29 = v146;
        *v146 = v40;
        v29[1] = v15;
      }
      else
      {
        sub_23A729B18((uint64_t)v40, v15);
        v53 = v49;
        v54 = v139;
        sub_23A721228(v53, v139, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
        v29 = v146;
        sub_23A721228(v54, (uint64_t)v146, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
      }
      v52 = type metadata accessor for DriverKitDriverApp();
      swift_storeEnumTagMultiPayload();
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v29, 0, 1, v52);
      v38 = v42;
    }
    v18 = (uint64_t)v152;
    v55 = v153;
    sub_23A72126C((uint64_t)v29, (uint64_t)v152 + *(int *)(v153 + 20), (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
    *(_QWORD *)v18 = v158;
    *(_QWORD *)(v18 + 8) = v36;
    v56 = (_QWORD *)(v18 + *(int *)(v55 + 24));
    *v56 = v38;
    v56[1] = v37;
    v57 = (_QWORD *)(v18 + *(int *)(v55 + 28));
    *v57 = v39;
    v57[1] = v20;
    v58 = (objc_class *)type metadata accessor for DriverApprovalState();
    v59 = (uint64_t)v29;
    v60 = objc_allocWithZone(v58);
    sub_23A72126C(v18, (uint64_t)v60 + OBJC_IVAR____SwiftDriverApprovalState_driver, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    swift_beginAccess();
    LOBYTE(v161) = v154;
    swift_bridgeObjectRetain();
    v61 = v60;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23A73BCA0();
    swift_endAccess();
    swift_beginAccess();
    v161 = 0;
    sub_23A73BCA0();
    swift_endAccess();

    v160.receiver = v61;
    v160.super_class = v58;
    objc_msgSendSuper2(&v160, sel_init);
    v62 = sub_23A7212B0(v18, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    MEMORY[0x23B8556F0](v62);
    if (*(_QWORD *)((v162 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v162 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23A73BE38();
    sub_23A73BE50();
    sub_23A73BE2C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A729B18((uint64_t)v155, v15);
    sub_23A7212B0(v59, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
    a1 = v151;
    v29 = (_QWORD *)v59;
    v27 = v156;
    v28 = v157;
    if (v156)
      goto LABEL_5;
LABEL_6:
    v31 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if (v31 >= v148)
      goto LABEL_36;
    v32 = *(_QWORD *)(v147 + 8 * v31);
    v33 = v28 + 1;
    if (!v32)
    {
      v33 = v28 + 2;
      if (v28 + 2 >= v148)
        goto LABEL_36;
      v32 = *(_QWORD *)(v147 + 8 * v33);
      if (!v32)
      {
        v33 = v28 + 3;
        if (v28 + 3 >= v148)
          goto LABEL_36;
        v32 = *(_QWORD *)(v147 + 8 * v33);
        if (!v32)
          break;
      }
    }
LABEL_19:
    v156 = (v32 - 1) & v32;
    v157 = v33;
  }
  v34 = v28 + 4;
  if (v28 + 4 < v148)
  {
    v32 = *(_QWORD *)(v147 + 8 * v34);
    if (!v32)
    {
      while (1)
      {
        v33 = v34 + 1;
        if (__OFADD__(v34, 1))
          goto LABEL_61;
        if (v33 >= v148)
          goto LABEL_36;
        v32 = *(_QWORD *)(v147 + 8 * v33);
        ++v34;
        if (v32)
          goto LABEL_19;
      }
    }
    v33 = v28 + 4;
    goto LABEL_19;
  }
LABEL_36:
  swift_release();
  v15 = 0;
  sub_23A7309A0(&v162);
  v155 = *(id *)(v141 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v155, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  v18 = *(_QWORD *)v159;
  if (*(_QWORD *)v159 >> 62)
    goto LABEL_63;
  v63 = *(_QWORD *)((*(_QWORD *)v159 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_38:
  v64 = (uint64_t)v137;
  v154 = v15;
  if (!v63)
  {
    swift_bridgeObjectRelease();
    v66 = MEMORY[0x24BEE4AF8];
    goto LABEL_49;
  }
  *(_QWORD *)v159 = MEMORY[0x24BEE4AF8];
  sub_23A7282A4(0, v63 & ~(v63 >> 63), 0);
  if (v63 < 0)
  {
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  v65 = 0;
  v66 = *(_QWORD *)v159;
  do
  {
    if ((v18 & 0xC000000000000001) != 0)
    {
      v67 = MEMORY[0x23B85581C](v65, v18);
      sub_23A72126C(v67 + OBJC_IVAR____SwiftDriverApprovalState_driver, v64, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      swift_unknownObjectRelease();
    }
    else
    {
      sub_23A72126C(*(_QWORD *)(v18 + 8 * v65 + 32) + OBJC_IVAR____SwiftDriverApprovalState_driver, v64, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
    }
    *(_QWORD *)v159 = v66;
    v69 = *(_QWORD *)(v66 + 16);
    v68 = *(_QWORD *)(v66 + 24);
    if (v69 >= v68 >> 1)
    {
      sub_23A7282A4(v68 > 1, v69 + 1, 1);
      v66 = *(_QWORD *)v159;
    }
    ++v65;
    *(_QWORD *)(v66 + 16) = v69 + 1;
    sub_23A721228(v64, v66+ ((*(unsigned __int8 *)(v150 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v150 + 80))+ *(_QWORD *)(v150 + 72) * v69, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
  }
  while (v63 != v65);
  swift_bridgeObjectRelease();
LABEL_49:
  v20 = v162;
  if (v162 >> 62)
  {
    swift_bridgeObjectRetain();
    v70 = sub_23A73BFC4();
    if (!v70)
      goto LABEL_65;
LABEL_51:
    *(_QWORD *)v159 = MEMORY[0x24BEE4AF8];
    sub_23A7282A4(0, v70 & ~(v70 >> 63), 0);
    if ((v70 & 0x8000000000000000) == 0)
    {
      v71 = 0;
      v72 = *(_QWORD *)v159;
      do
      {
        if ((v20 & 0xC000000000000001) != 0)
        {
          v73 = MEMORY[0x23B85581C](v71, v20);
          sub_23A72126C(v73 + OBJC_IVAR____SwiftDriverApprovalState_driver, v149, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
          swift_unknownObjectRelease();
        }
        else
        {
          sub_23A72126C(*(_QWORD *)(v20 + 8 * v71 + 32) + OBJC_IVAR____SwiftDriverApprovalState_driver, v149, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
        }
        *(_QWORD *)v159 = v72;
        v75 = *(_QWORD *)(v72 + 16);
        v74 = *(_QWORD *)(v72 + 24);
        if (v75 >= v74 >> 1)
        {
          sub_23A7282A4(v74 > 1, v75 + 1, 1);
          v72 = *(_QWORD *)v159;
        }
        ++v71;
        *(_QWORD *)(v72 + 16) = v75 + 1;
        sub_23A721228(v149, v72+ ((*(unsigned __int8 *)(v150 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v150 + 80))+ *(_QWORD *)(v150 + 72) * v75, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      }
      while (v70 != v71);
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
    goto LABEL_115;
  }
  v70 = *(_QWORD *)((v162 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v70)
    goto LABEL_51;
LABEL_65:
  swift_bridgeObjectRelease();
  v72 = MEMORY[0x24BEE4AF8];
LABEL_66:
  v76 = sub_23A730A24(v66, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LODWORD(v153) = v76;
  if ((v76 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v107 = (void (*)(_QWORD, _QWORD))sub_23A73BCC4();
    *v108 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v107(v159, 0);
    swift_release();
    swift_release();
    v109 = v162;
    if (v162 >> 62)
    {
      swift_bridgeObjectRetain();
      v110 = sub_23A73BFC4();
      swift_bridgeObjectRelease();
      if (!v110)
        goto LABEL_119;
    }
    else
    {
      v110 = *(_QWORD *)((v162 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v110)
        goto LABEL_119;
    }
    if (v110 < 1)
      goto LABEL_142;
    v111 = 0;
    do
    {
      if ((v109 & 0xC000000000000001) != 0)
        v112 = (id)MEMORY[0x23B85581C](v111, v109);
      else
        v112 = *(id *)(v109 + 8 * v111 + 32);
      v113 = v112;
      swift_getKeyPath();
      swift_getKeyPath();
      v114 = v113;
      v115 = (void (*)(_QWORD, _QWORD))sub_23A73BCC4();
      v117 = v116;
      MEMORY[0x23B8556F0]();
      if (*(_QWORD *)((*v117 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v117 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23A73BE38();
      ++v111;
      sub_23A73BE50();
      sub_23A73BE2C();
      v115(v159, 0);

      swift_release();
      swift_release();
    }
    while (v110 != v111);
LABEL_119:
    swift_bridgeObjectRelease();
LABEL_120:
    v118 = v141;
    v119 = *(void **)(v141 + OBJC_IVAR____SwiftDriverManager_observerLock);
    objc_msgSend(v119, sel_lock);
    sub_23A73BE5C();
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
    v120 = swift_allocObject();
    *(_OWORD *)(v120 + 16) = xmmword_23A73DA30;
    v121 = (unint64_t *)(v118 + OBJC_IVAR____SwiftDriverManager_observers);
    swift_beginAccess();
    v122 = *v121;
    if (*v121 >> 62)
    {
      swift_bridgeObjectRetain();
      v123 = sub_23A73BFC4();
      swift_bridgeObjectRelease();
      v122 = *v121;
    }
    else
    {
      v123 = *(_QWORD *)((v122 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v124 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v120 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v120 + 64) = v124;
    *(_QWORD *)(v120 + 32) = v123;
    if (v122 >> 62)
    {
      swift_bridgeObjectRetain();
      v125 = sub_23A73BFC4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v125 = *(_QWORD *)((v122 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v126 = sub_23A7367D8();
    v127 = 115;
    if (v125 <= 1)
      v127 = 0;
    v128 = 0xE000000000000000;
    *(_QWORD *)(v120 + 96) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v120 + 104) = v126;
    if (v125 > 1)
      v128 = 0xE100000000000000;
    *(_QWORD *)(v120 + 72) = v127;
    *(_QWORD *)(v120 + 80) = v128;
    v129 = (void *)sub_23A73BEC8();
    sub_23A73BC64();
    swift_bridgeObjectRelease();

    v130 = *v121;
    if (*v121 >> 62)
    {
      swift_bridgeObjectRetain();
      v131 = sub_23A73BFC4();
      if (v131)
        goto LABEL_130;
    }
    else
    {
      v131 = *(_QWORD *)((v130 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v131)
      {
LABEL_130:
        if (v131 >= 1)
        {
          v132 = 0;
          v133 = v153 & 1;
          do
          {
            if ((v130 & 0xC000000000000001) != 0)
            {
              v134 = (void *)MEMORY[0x23B85581C](v132, v130);
            }
            else
            {
              v134 = *(void **)(v130 + 8 * v132 + 32);
              swift_unknownObjectRetain();
            }
            ++v132;
            objc_msgSend(v134, sel_approvalStateDidChange_, v133);
            swift_unknownObjectRelease();
          }
          while (v131 != v132);
          goto LABEL_139;
        }
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
        result = (id)swift_release();
        __break(1u);
        return result;
      }
    }
LABEL_139:
    swift_bridgeObjectRelease();
    objc_msgSend(v119, sel_unlock);
    return objc_msgSend(v155, sel_unlock);
  }
  if (v20 >> 62)
  {
LABEL_116:
    swift_bridgeObjectRetain();
    v77 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
    if (!v77)
      goto LABEL_117;
LABEL_69:
    v78 = 0;
    v79 = 0;
    v158 = v20 & 0xC000000000000001;
    v156 = v20 & 0xFFFFFFFFFFFFFF8;
    v151 = xmmword_23A73DA30;
    v157 = v77;
    while (2)
    {
      LODWORD(v152) = v78;
      v80 = v79 + 4;
      while (1)
      {
        v81 = v80 - 4;
        if (v158)
        {
          v82 = (id)MEMORY[0x23B85581C](v80 - 4, v20);
        }
        else
        {
          if (v81 >= *(_QWORD *)(v156 + 16))
            goto LABEL_113;
          v82 = *(id *)(v20 + 8 * v80);
        }
        v83 = v82;
        v79 = v80 - 3;
        if (__OFADD__(v81, 1))
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
          goto LABEL_114;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_23A73BCD0();
        swift_release();
        swift_release();
        if ((*(_QWORD *)v159 & 0xC000000000000001) != 0)
        {
          v84 = (id)MEMORY[0x23B85581C](v80 - 4, *(_QWORD *)v159);
        }
        else
        {
          if (v81 >= *(_QWORD *)((*(_QWORD *)v159 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_112;
          v84 = *(id *)(*(_QWORD *)v159 + 8 * v80);
        }
        v85 = v84;
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_23A73BCD0();

        swift_release();
        swift_release();
        LODWORD(v85) = v159[0];
        swift_getKeyPath();
        swift_getKeyPath();
        sub_23A73BCD0();
        swift_release();
        swift_release();
        if ((_DWORD)v85 != v159[0])
          break;

        ++v80;
        if (v79 == v157)
        {
          swift_bridgeObjectRelease();
          if ((v152 & 1) != 0)
            goto LABEL_120;
          return objc_msgSend(v155, sel_unlock);
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A73BCD0();
      swift_release();
      swift_release();
      if ((*(_QWORD *)v159 & 0xC000000000000001) != 0)
      {
        MEMORY[0x23B85581C](v80 - 4, *(_QWORD *)v159);
      }
      else
      {
        if (v81 >= *(_QWORD *)((*(_QWORD *)v159 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_143;
        v86 = *(id *)(*(_QWORD *)v159 + 8 * v80);
      }
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A73BCD0();
      swift_release();
      swift_release();
      v87 = v159[0];
      swift_getKeyPath();
      swift_getKeyPath();
      v159[0] = v87;
      sub_23A73BCDC();
      sub_23A73BE5C();
      __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
      v88 = swift_allocObject();
      *(_OWORD *)(v88 + 16) = v151;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A73BCD0();
      swift_release();
      swift_release();
      if ((*(_QWORD *)v159 & 0xC000000000000001) != 0)
      {
        v89 = (id)MEMORY[0x23B85581C](v80 - 4, *(_QWORD *)v159);
      }
      else
      {
        if (v81 >= *(_QWORD *)((*(_QWORD *)v159 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_144;
        v89 = *(id *)(*(_QWORD *)v159 + 8 * v80);
      }
      v90 = v89;
      swift_bridgeObjectRelease();
      v91 = v136;
      sub_23A72126C((uint64_t)v90 + OBJC_IVAR____SwiftDriverApprovalState_driver, (uint64_t)v136, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);

      v92 = *v91;
      v93 = v91[1];
      swift_bridgeObjectRetain();
      sub_23A7212B0((uint64_t)v91, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
      *(_QWORD *)(v88 + 56) = MEMORY[0x24BEE0D00];
      v94 = sub_23A7367D8();
      *(_QWORD *)(v88 + 64) = v94;
      *(_QWORD *)(v88 + 32) = v92;
      *(_QWORD *)(v88 + 40) = v93;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A73BCD0();
      swift_release();
      v95 = swift_release();
      v96 = v159[0];
      if (qword_2542D2E68 != -1)
        v95 = swift_once();
      v152 = &v136;
      MEMORY[0x24BDAC7A8](v95);
      *((_BYTE *)&v136 - 16) = v96;
      v97 = swift_bridgeObjectRetain();
      v98 = v154;
      v99 = sub_23A7298B8(v97, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A736DA0, (uint64_t)(&v136 - 4));
      v154 = v98;
      swift_bridgeObjectRelease();
      v100 = sub_23A7357CC(v99);
      if ((v102 & 1) != 0)
        goto LABEL_146;
      if (*(_DWORD *)(v99 + 36) != v101)
        goto LABEL_145;
      if (v100 != 1 << *(_BYTE *)(v99 + 32))
      {
        v103 = sub_23A735854(v159, v100, v101, 0, v99);
        v105 = v104;
        swift_release();
        *(_QWORD *)(v88 + 96) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v88 + 104) = v94;
        *(_QWORD *)(v88 + 72) = v103;
        *(_QWORD *)(v88 + 80) = v105;
        v106 = (void *)sub_23A73BEC8();
        sub_23A73BC64();
        swift_bridgeObjectRelease();

        v78 = 1;
        if (v79 != v157)
          continue;
        goto LABEL_119;
      }
      goto LABEL_147;
    }
  }
  v77 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v77)
    goto LABEL_69;
LABEL_117:
  swift_bridgeObjectRelease();
  return objc_msgSend(v155, sel_unlock);
}

uint64_t sub_23A7309A0(unint64_t *a1)
{
  unint64_t v2;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_23A7358D8(v2);
  }
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_23A7338DC(v6);
  return sub_23A73BE2C();
}

uint64_t sub_23A730A24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for DriverKitDriver();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v10 = (uint64_t *)((char *)&v19 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_23A72126C(a1 + v12, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
        sub_23A72126C(a2 + v12, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
        v15 = _s16DriverManagement0a3KitA0V2eeoiySbAC_ACtFZ_0(v10, v7);
        sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
        sub_23A7212B0((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriver);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

void sub_23A730B60(void *a1, char a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  char *v35;
  void *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t aBlock[6];

  v6 = sub_23A73BCF4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A73BD0C();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v25 = a1;
    sub_23A73BE68();
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_23A73C950;
    aBlock[0] = (uint64_t)a1;
    v27 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4810);
    v28 = sub_23A73BD6C();
    v30 = v29;
    *(_QWORD *)(v26 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v26 + 64) = sub_23A7367D8();
    *(_QWORD *)(v26 + 32) = v28;
    *(_QWORD *)(v26 + 40) = v30;
    sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
    v31 = (void *)sub_23A73BEC8();
    sub_23A73BC64();
    swift_bridgeObjectRelease();

    sub_23A736C34(a1, 1);
  }
  else
  {
    v38 = v14;
    v39 = v12;
    v40 = v11;
    swift_bridgeObjectRetain();
    sub_23A73BE5C();
    sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
    v15 = (void *)sub_23A73BEC8();
    v16 = MEMORY[0x24BEE4AF8];
    sub_23A73BC64();

    v17 = sub_23A73BE5C();
    swift_bridgeObjectRetain_n();
    v18 = sub_23A73BEC8();
    v19 = v17;
    if (os_log_type_enabled(v18, v17))
    {
      v36 = a3;
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      aBlock[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v37 = v9;
      v22 = ApprovalSettingsState.debugDescription.getter((uint64_t)a1);
      v41 = sub_23A732F78(v22, v23, aBlock);
      v9 = v37;
      sub_23A73BED4();
      a3 = v36;
      swift_bridgeObjectRelease();
      sub_23A736C34(a1, 0);
      sub_23A736C34(a1, 0);
      _os_log_impl(&dword_23A71D000, v18, v19, "%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B855E28](v21, -1, -1);
      v24 = v20;
      v16 = MEMORY[0x24BEE4AF8];
      MEMORY[0x23B855E28](v24, -1, -1);

    }
    else
    {

      sub_23A736C34(a1, 0);
      sub_23A736C34(a1, 0);
    }
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = a3;
    *(_QWORD *)(v32 + 24) = a1;
    aBlock[4] = (uint64_t)sub_23A736C6C;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23A72E9BC;
    aBlock[3] = (uint64_t)&block_descriptor_31;
    v33 = _Block_copy(aBlock);
    v34 = a3;
    v35 = v38;
    sub_23A73BD00();
    v41 = v16;
    sub_23A736BBC(&qword_2542D3040, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3058);
    sub_23A72B6E0(&qword_2542D3060, &qword_2542D3058, MEMORY[0x24BEE12C8]);
    sub_23A73BF04();
    MEMORY[0x23B85578C](0, v35, v9, v33);
    _Block_release(v33);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v40);
    swift_release();
  }
}

uint64_t sub_23A731000(void *a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  _QWORD *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  unint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD aBlock[7];

  v71 = a2;
  v70 = a1;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v77 = sub_23A73BCF4();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_23A73BD0C();
  v73 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v72 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_23A73BBEC();
  v84 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v90 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = type metadata accessor for SettingsApplicationRecord();
  v5 = *(_QWORD *)(v91 - 8);
  v6 = MEMORY[0x24BDAC7A8](v91);
  v83 = (uint64_t)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v82 = (uint64_t *)((char *)&v69 - v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3010);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23A738330(MEMORY[0x24BEE4AF8]);
  v89 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 0);
  v13 = objc_msgSend(v89, sel_nextObject);
  if (v13)
  {
    v14 = v13;
    v78 = xmmword_23A73DA30;
    v94 = xmmword_23A73C950;
    v87 = v12;
    v88 = v5;
    v86 = v11;
    while (1)
    {
      v31 = objc_msgSend(v14, sel_installSessionIdentifier);
      if (!v31)
        break;
      v32 = v31;
      v33 = sub_23A73BC04();
      v35 = v34;

      v36 = *(_QWORD *)(v12 + 16);
      if (*(_QWORD *)(v36 + 16))
      {
        sub_23A720478(v33, v35);
        v37 = sub_23A72861C(v33, v35);
        if ((v38 & 1) != 0)
        {
          sub_23A72126C(*(_QWORD *)(v36 + 56) + *(_QWORD *)(v5 + 72) * v37, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v39 = 0;
        }
        else
        {
          v39 = 1;
        }
        v40 = v91;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, v39, 1, v91);
        sub_23A7205E4(v33, v35);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v40) != 1)
        {
          v93 = v35 >> 62;
          sub_23A736D14((uint64_t)v11);
          v81 = sub_23A73BE68();
          v96 = __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
          v45 = swift_allocObject();
          *(_OWORD *)(v45 + 16) = v78;
          v46 = v14;
          v47 = objc_msgSend(v46, sel_description);
          v48 = sub_23A73BD54();
          v50 = v49;

          *(_QWORD *)(v45 + 56) = MEMORY[0x24BEE0D00];
          v79 = sub_23A7367D8();
          *(_QWORD *)(v45 + 64) = v79;
          *(_QWORD *)(v45 + 32) = v48;
          *(_QWORD *)(v45 + 40) = v50;
          v80 = v45;
          v51 = (char *)&loc_23A7315B8 + *((int *)qword_23A731C18 + v93);
          v92 = v35;
          __asm { BR              X9 }
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v91);
      }
      sub_23A736D14((uint64_t)v11);
      v41 = objc_msgSend(v14, sel_bundleIdentifier);
      if (v41)
      {
        v42 = v41;
        v43 = sub_23A73BD54();
        v95 = v44;
        v96 = v43;

      }
      else
      {
        v95 = 0;
        v96 = 0;
      }
      v52 = objc_msgSend(v14, sel_URL);
      sub_23A73BBE0();

      v53 = objc_msgSend(v14, sel_uniqueInstallIdentifier);
      if (v53)
      {
        v54 = v53;
        v55 = sub_23A73BC04();
        v57 = v56;

      }
      else
      {
        v55 = 0;
        v57 = 0xF000000000000000;
      }
      v58 = objc_msgSend(v14, sel_driverExtensionPaths);
      if (v58)
      {
        v15 = v58;
        v16 = sub_23A73BE20();

      }
      else
      {
        v16 = 0;
      }
      sub_23A720478(v33, v35);
      v17 = objc_msgSend(v14, sel_localizedName);
      v18 = sub_23A73BD54();
      v20 = v19;

      v21 = v35;
      v22 = (uint64_t)v82;
      v23 = v95;
      *v82 = v96;
      *(_QWORD *)(v22 + 8) = v23;
      v24 = (int *)v91;
      (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v22 + *(int *)(v91 + 20), v90, v85);
      v25 = (uint64_t *)(v22 + v24[6]);
      *v25 = v55;
      v25[1] = v57;
      *(_QWORD *)(v22 + v24[7]) = v16;
      v26 = (uint64_t *)(v22 + v24[8]);
      *v26 = v33;
      v26[1] = v21;
      v27 = (uint64_t *)(v22 + v24[9]);
      *v27 = v18;
      v27[1] = v20;
      v28 = v83;
      sub_23A721228(v22, v83, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
      sub_23A720478(v33, v21);
      v12 = v87;
      v29 = *(_QWORD *)(v87 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      aBlock[0] = v29;
      *(_QWORD *)(v12 + 16) = 0x8000000000000000;
      sub_23A7353BC(v28, v33, v21, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v12 + 16) = aBlock[0];
      swift_bridgeObjectRelease();
      sub_23A7205E4(v33, v21);

      sub_23A7205E4(v33, v21);
      v5 = v88;
      v11 = v86;
      v14 = objc_msgSend(v89, sel_nextObject);
      if (!v14)
        goto LABEL_22;
    }

  }
LABEL_22:
  sub_23A7366FC(0, &qword_2542D3090);
  v59 = (void *)sub_23A73BE98();
  v60 = (_QWORD *)swift_allocObject();
  v61 = v70;
  v62 = v71;
  v60[2] = v70;
  v60[3] = v62;
  v60[4] = v12;
  aBlock[4] = sub_23A736D08;
  aBlock[5] = v60;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A72E9BC;
  aBlock[3] = &block_descriptor_40;
  v63 = _Block_copy(aBlock);
  v64 = v61;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  v65 = v72;
  sub_23A73BD00();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A736BBC(&qword_2542D3040, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3058);
  sub_23A72B6E0(&qword_2542D3060, &qword_2542D3058, MEMORY[0x24BEE12C8]);
  v66 = v75;
  v67 = v77;
  sub_23A73BF04();
  MEMORY[0x23B85578C](0, v65, v66, v63);
  _Block_release(v63);

  (*(void (**)(char *, uint64_t))(v76 + 8))(v66, v67);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v65, v74);
  return swift_release();
}

uint64_t sub_23A731C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(a3 + 16);
  swift_bridgeObjectRetain();
  sub_23A72F2D8(a2, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A731C94(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t DriverManager.setDriverState(_:approved:)(char *a1, char a2)
{
  int v2;

  if ((a2 & 1) != 0)
    v2 = 1;
  else
    v2 = 2;
  return DriverManager.setDriverState(driverApprovalState:state:)(a1, v2);
}

uint64_t DriverManager.setDriverState(driverApprovalState:state:)(char *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  _QWORD v27[2];
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28 = a2;
  v3 = sub_23A73BC34();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A73BD18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (_QWORD *)((char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_23A73BC88();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A73BEBC();
  v27[1] = sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
  v14 = (void *)sub_23A73BEC8();
  sub_23A73BC7C();
  sub_23A73BC70();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_23A7366FC(0, &qword_2542D3090);
  *v9 = sub_23A73BE98();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
  LOBYTE(v13) = sub_23A73BD24();
  result = (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v13 & 1) != 0)
  {
    v17 = *(_QWORD *)&a1[OBJC_IVAR____SwiftDriverApprovalState_driver];
    v16 = *(_QWORD *)&a1[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
    type metadata accessor for DriverKitDriver();
    swift_bridgeObjectRetain();
    v18 = sub_23A736EC8();
    v20 = v19;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a1;
    v22 = v28;
    *(_BYTE *)(v21 + 24) = v28;
    v23 = v29;
    *(_QWORD *)(v21 + 32) = v29;
    type metadata accessor for ApprovalStateUpdateRequest();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v17;
    *(_QWORD *)(v24 + 24) = v16;
    *(_QWORD *)(v24 + 32) = v18;
    *(_QWORD *)(v24 + 40) = v20;
    *(_BYTE *)(v24 + 48) = v22;
    *(_QWORD *)(v24 + 56) = sub_23A7367BC;
    *(_QWORD *)(v24 + 64) = v21;
    v25 = a1;
    v23;
    sub_23A73BC28();
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v24 + OBJC_IVAR____TtC16DriverManagement26ApprovalStateUpdateRequest_timestamp, v5, v31);
    swift_getKeyPath();
    swift_getKeyPath();
    v32 = v24;
    v26 = v25;
    swift_retain();
    sub_23A73BCDC();
    DriverKitDaemonClient.enqueueApprovalStateUpdate(request:)(v24);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A732124(void *a1, char a2, void *a3, char a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v10 = sub_23A73BCF4();
  v25 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A73BD0C();
  v23 = *(_QWORD *)(v13 - 8);
  v24 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7366FC(0, &qword_2542D3090);
  v16 = (void *)sub_23A73BE98();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a1;
  *(_BYTE *)(v17 + 32) = a2 & 1;
  *(_BYTE *)(v17 + 33) = a4;
  *(_QWORD *)(v17 + 40) = a5;
  aBlock[4] = sub_23A736DEC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A72E9BC;
  aBlock[3] = &block_descriptor_52;
  v18 = _Block_copy(aBlock);
  v19 = a3;
  sub_23A736E00(a1, a2 & 1);
  v20 = a5;
  swift_release();
  sub_23A73BD00();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A736BBC(&qword_2542D3040, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3058);
  sub_23A72B6E0(&qword_2542D3060, &qword_2542D3058, MEMORY[0x24BEE12C8]);
  sub_23A73BF04();
  MEMORY[0x23B85578C](0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v15, v24);
}

uint64_t sub_23A732364(void *a1, uint64_t a2, char a3, char a4)
{
  id v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[40];
  uint64_t v25;

  swift_getKeyPath();
  swift_getKeyPath();
  v25 = 0;
  v7 = a1;
  result = sub_23A73BCDC();
  if ((a3 & 1) != 0)
  {
    sub_23A73BE68();
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_23A73DA30;
    v10 = v7;
    v11 = objc_msgSend(v10, sel_description);
    v12 = sub_23A73BD54();
    v14 = v13;

    v15 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
    v16 = sub_23A7367D8();
    v17 = v16;
    *(_QWORD *)(v9 + 64) = v16;
    *(_QWORD *)(v9 + 32) = v12;
    *(_QWORD *)(v9 + 40) = v14;
    if (qword_2542D2E68 != -1)
      v16 = swift_once();
    MEMORY[0x24BDAC7A8](v16);
    v24[16] = a4;
    v18 = swift_bridgeObjectRetain();
    v19 = sub_23A7298B8(v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_23A736E50, (uint64_t)v24);
    swift_bridgeObjectRelease();
    v20 = sub_23A722A64(v19);
    v22 = v21;
    result = swift_release();
    if (v22)
    {
      *(_QWORD *)(v9 + 96) = v15;
      *(_QWORD *)(v9 + 104) = v17;
      *(_QWORD *)(v9 + 72) = v20;
      *(_QWORD *)(v9 + 80) = v22;
      sub_23A7366FC(0, (unint64_t *)&qword_2542D3098);
      v23 = (void *)sub_23A73BEC8();
      sub_23A73BC64();
      swift_bridgeObjectRelease();

      return sub_23A72E7F4();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t DriverManager.driverApprovalStatesForThirdPartyApp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];

  v5 = *(void **)(v2 + OBJC_IVAR____SwiftDriverManager_driverApprovalStatesLock);
  objc_msgSend(v5, sel_lock);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  v8[2] = a1;
  v8[3] = a2;
  v6 = sub_23A732ADC((uint64_t (*)(id *))sub_23A736E38, (uint64_t)v8, v8[5]);
  objc_msgSend(v5, sel_unlock);
  return v6;
}

unint64_t sub_23A732758(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v34;
  _QWORD *v35;

  v34 = a2;
  v5 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x24BDAC7A8](v5);
  v35 = (uint64_t *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for DriverKitDriverApp();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - v12;
  v14 = type metadata accessor for DriverKitDriverSource();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v34 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v34 - v21;
  v23 = *a1;
  if (!a3)
  {
    v26 = OBJC_IVAR____SwiftDriverApprovalState_driver;
    v27 = type metadata accessor for DriverKitDriver();
    sub_23A72126C(v23 + *(int *)(v27 + 20) + v26, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v22, 1, v7) != 1)
    {
      sub_23A7212B0((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      LOBYTE(a3) = 1;
      return a3 & 1;
    }
    goto LABEL_17;
  }
  if (a3 == 1)
  {
    v24 = OBJC_IVAR____SwiftDriverApprovalState_driver;
    v25 = type metadata accessor for DriverKitDriver();
    sub_23A72126C(v23 + *(int *)(v25 + 20) + v24, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v17, 1, v7) != 1)
    {
      sub_23A7212B0((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      LOBYTE(a3) = 0;
    }
    return a3 & 1;
  }
  v28 = OBJC_IVAR____SwiftDriverApprovalState_driver;
  v29 = type metadata accessor for DriverKitDriver();
  sub_23A72126C(v23 + *(int *)(v29 + 20) + v28, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v20, 1, v7) == 1)
  {
LABEL_17:
    LOBYTE(a3) = 0;
    return a3 & 1;
  }
  sub_23A721228((uint64_t)v20, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  sub_23A72126C((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    sub_23A7212B0((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    goto LABEL_17;
  }
  v30 = v35;
  sub_23A721228((uint64_t)v11, (uint64_t)v35, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  v31 = v30[1];
  if (!v31)
  {
    swift_bridgeObjectRetain();
    sub_23A7212B0((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
    sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    sub_23A7366CC(v34, a3);
    goto LABEL_17;
  }
  if (*v30 == v34 && v31 == a3)
    LOBYTE(a3) = 1;
  else
    LOBYTE(a3) = sub_23A73C0A8();
  swift_bridgeObjectRetain();
  sub_23A7212B0((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  swift_bridgeObjectRelease();
  return a3 & 1;
}

uint64_t sub_23A732ADC(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x23B85581C](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_23A73BF7C();
          sub_23A73BF94();
          v4 = v15;
          sub_23A73BFA0();
          sub_23A73BF88();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_23A73BFC4();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_23A732C80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_23A73BC94();
  *a1 = result;
  return result;
}

uint64_t sub_23A732CBC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23A732D38(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v3 = v2;
  return sub_23A73BCDC();
}

uint64_t sub_23A732DAC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23A732E28(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_23A73BCDC();
}

_QWORD *sub_23A732E9C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4820);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A732F00(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_23A73BDCC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B8556A8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_23A732F78(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A733048(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A736C74((uint64_t)v12, *a3);
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
      sub_23A736C74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A733048(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A73BEE0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A733200(a5, a6);
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
  v8 = sub_23A73BF64();
  if (!v8)
  {
    sub_23A73BFAC();
    __break(1u);
LABEL_17:
    result = sub_23A73BFF4();
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

uint64_t sub_23A733200(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A733294(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A733408(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A733408(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A733294(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A732E9C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A73BF28();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A73BFAC();
      __break(1u);
LABEL_10:
      v2 = sub_23A73BDB4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A73BFF4();
    __break(1u);
LABEL_14:
    result = sub_23A73BFAC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_23A733408(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4820);
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
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

uint64_t sub_23A733554(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  int v42;
  __int128 v43;

  v3 = v2;
  v5 = type metadata accessor for SettingsApplicationRecord();
  v41 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D30A0);
  v42 = a2;
  v9 = sub_23A73BFDC();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v38 = v2;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v40 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v39)
              goto LABEL_34;
            v24 = v40[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v41 + 72);
    v27 = *(_QWORD *)(v8 + 56) + v26 * v21;
    v28 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v21 + 8);
    v43 = *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    if ((v42 & 1) != 0)
    {
      sub_23A721228(v27, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
    }
    else
    {
      sub_23A72126C(v27, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
      sub_23A720478(v43, v28);
    }
    sub_23A73C0F0();
    sub_23A73BC10();
    result = sub_23A73C114();
    v29 = -1 << *(_BYTE *)(v10 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v15 + 8 * (v30 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      v19 = v43;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      v19 = v43;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v15 + 8 * v31);
      }
      while (v35 == -1);
      v18 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_OWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18) = v19;
    result = sub_23A721228((uint64_t)v7, *(_QWORD *)(v10 + 56) + v26 * v18, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v8 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

void sub_23A7338DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t *v45;
  uint64_t *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void **v50;
  int v51;
  id v52;
  void *v53;
  char *v54;
  uint64_t *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int EnumCaseMultiPayload;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void *v95;
  char *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t, uint64_t);
  int v106;
  id v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  BOOL v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  BOOL v150;
  uint64_t v151;
  char v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  unint64_t v174;
  char *v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void **v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  char *v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  char *v213;
  id v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;

  v2 = v1;
  v201 = type metadata accessor for SettingsApplicationRecord();
  v4 = MEMORY[0x24BDAC7A8](v201);
  v200 = (uint64_t)&v182 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v199 = (uint64_t)&v182 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v189 = (uint64_t)&v182 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v182 - v10;
  v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FC0);
  v12 = MEMORY[0x24BDAC7A8](v202);
  v207 = (uint64_t)&v182 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v182 - v14;
  v16 = type metadata accessor for DriverKitDriverApp();
  v209 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v182 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v182 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v182 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v192 = (uint64_t)&v182 - v26;
  v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FD8);
  v27 = MEMORY[0x24BDAC7A8](v208);
  v203 = (char *)&v182 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v195 = (uint64_t)&v182 - v29;
  v30 = a1[1];
  v31 = sub_23A73C090();
  if (v31 >= v30)
  {
    if (v30 < 0)
      goto LABEL_174;
    if (v30)
      sub_23A7349B0(0, v30, 1, a1);
    return;
  }
  v188 = v31;
  if (v30 >= 0)
    v32 = v30;
  else
    v32 = v30 + 1;
  if (v30 < -1)
    goto LABEL_182;
  v190 = v25;
  v210 = v16;
  v191 = v15;
  v186 = v11;
  v194 = v30;
  v183 = a1;
  if (v30 < 2)
  {
    v35 = (char *)MEMORY[0x24BEE4AF8];
    v219 = MEMORY[0x24BEE4AF8];
    v198 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v30 != 1)
    {
      v40 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_140:
      if (v40 >= 2)
      {
        v176 = *v183;
        do
        {
          v177 = v40 - 2;
          if (v40 < 2)
            goto LABEL_169;
          if (!v176)
            goto LABEL_181;
          v178 = *(_QWORD *)&v35[16 * v177 + 32];
          v179 = *(_QWORD *)&v35[16 * v40 + 24];
          sub_23A734F00((void **)(v176 + 8 * v178), (id *)(v176 + 8 * *(_QWORD *)&v35[16 * v40 + 16]), v176 + 8 * v179, v198);
          if (v2)
            break;
          if (v179 < v178)
            goto LABEL_170;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v35 = sub_23A7353A8((uint64_t)v35);
          if (v177 >= *((_QWORD *)v35 + 2))
            goto LABEL_171;
          v180 = &v35[16 * v177 + 32];
          *(_QWORD *)v180 = v178;
          *((_QWORD *)v180 + 1) = v179;
          v181 = *((_QWORD *)v35 + 2);
          if (v40 > v181)
            goto LABEL_172;
          memmove(&v35[16 * v40 + 16], &v35[16 * v40 + 32], 16 * (v181 - v40));
          *((_QWORD *)v35 + 2) = v181 - 1;
          v40 = v181 - 1;
        }
        while (v181 > 2);
      }
LABEL_151:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v219 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23A73BE2C();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v33 = v32 >> 1;
    type metadata accessor for DriverApprovalState();
    v34 = sub_23A73BE44();
    *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) = v33;
    v198 = (void **)((v34 & 0xFFFFFFFFFFFFFF8) + 32);
    v219 = v34;
  }
  v36 = 0;
  v37 = *a1;
  v185 = *a1 + 16;
  v184 = v37 - 8;
  v35 = (char *)MEMORY[0x24BEE4AF8];
  v204 = v22;
  v205 = v19;
  v38 = v194;
  v39 = (uint64_t)v203;
  v211 = v37;
LABEL_15:
  v41 = v36;
  v42 = v36 + 1;
  v196 = v36;
  if (v36 + 1 >= v38)
    goto LABEL_53;
  v43 = *(char **)(v37 + 8 * v42);
  v44 = *(char **)(v37 + 8 * v36);
  v45 = (uint64_t *)&v43[OBJC_IVAR____SwiftDriverApprovalState_driver];
  v46 = (uint64_t *)&v44[OBJC_IVAR____SwiftDriverApprovalState_driver];
  v47 = v43;
  v48 = v44;
  LODWORD(v197) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v45, v46);

  v41 = v196;
  v42 = v196 + 2;
  if (v196 + 2 < v38)
  {
    v187 = v35;
    v49 = v196;
    v212 = sub_23A7211E4();
    v50 = (void **)(v185 + 8 * v49);
    v39 = (uint64_t)v203;
    v51 = v197;
    while (1)
    {
      v206 = v42;
      v54 = (char *)*(v50 - 1);
      v53 = *v50;
      v55 = (uint64_t *)((char *)*v50 + OBJC_IVAR____SwiftDriverApprovalState_driver);
      v56 = &v54[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v57 = v55[1];
      v217 = *v55;
      v218 = v57;
      v58 = *(_QWORD *)&v54[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
      v215 = *(_QWORD *)&v54[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v216 = v58;
      v214 = v53;
      v59 = v54;
      v213 = (char *)sub_23A73BEEC();
      v60 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
      v61 = (uint64_t)v55 + v60;
      v62 = (uint64_t)&v56[v60];
      v63 = v195;
      v64 = v195 + *(int *)(v208 + 48);
      sub_23A72126C(v61, v195, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      sub_23A72126C(v62, v64, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      v65 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v209 + 48);
      v66 = v63;
      v67 = v210;
      LODWORD(v62) = v65(v66, 1, v210);
      v68 = v65(v64, 1, v67);
      if ((_DWORD)v62 == 1)
      {
        v52 = v214;
        if (v68 != 1)
        {
          sub_23A7212B0(v64, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);

          if ((v51 & 1) == 0)
            goto LABEL_51;
          goto LABEL_21;
        }
      }
      else
      {
        v69 = v192;
        if (v68 == 1)
        {
          sub_23A7212B0(v195, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);

          v39 = (uint64_t)v203;
          if ((v51 & 1) != 0)
            goto LABEL_136;
          goto LABEL_21;
        }
        sub_23A721228(v195, v192, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v70 = (uint64_t)v190;
        sub_23A721228(v64, (uint64_t)v190, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v71 = (uint64_t)v191;
        v72 = (uint64_t)&v191[*(int *)(v202 + 48)];
        sub_23A72126C(v69, (uint64_t)v191, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A72126C(v70, v72, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_23A7212B0(v70, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0(v69, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7205E4(*(_QWORD *)v71, *(_QWORD *)(v71 + 8));
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            sub_23A7212B0(v72, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);

            v39 = (uint64_t)v203;
            v51 = v197;
            if ((v197 & 1) == 0)
            {
LABEL_51:
              v35 = v187;
              v42 = v206;
LABEL_52:
              v41 = v196;
              goto LABEL_53;
            }
            goto LABEL_21;
          }
          sub_23A7205E4(*(_QWORD *)v72, *(_QWORD *)(v72 + 8));
          v39 = (uint64_t)v203;
        }
        else
        {
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          v39 = (uint64_t)v203;
          if (EnumCaseMultiPayload == 1)
          {
            sub_23A7212B0((uint64_t)v190, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7212B0(v192, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7205E4(*(_QWORD *)v72, *(_QWORD *)(v72 + 8));
            sub_23A7212B0((uint64_t)v191, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);

            v51 = v197;
            if ((v197 & 1) != 0)
            {
LABEL_136:
              v35 = v187;
              v83 = v211;
              v42 = v206;
              v41 = v196;
              if (v206 < v196)
                goto LABEL_175;
              goto LABEL_45;
            }
            goto LABEL_21;
          }
          v74 = (uint64_t)v186;
          sub_23A721228((uint64_t)v191, (uint64_t)v186, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v75 = v189;
          sub_23A721228(v72, v189, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v76 = *(int *)(v201 + 36);
          v77 = *(_QWORD *)(v74 + v76 + 8);
          v217 = *(_QWORD *)(v74 + v76);
          v218 = v77;
          v78 = (uint64_t *)(v75 + v76);
          v80 = *v78;
          v79 = v78[1];
          v215 = v80;
          v216 = v79;
          v81 = sub_23A73BEEC();
          sub_23A7212B0(v75, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v74, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0((uint64_t)v190, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0(v192, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          v82 = v213;
          if (v81)
            v82 = (char *)v81;
          v213 = v82;
        }
        v51 = v197;
        v52 = v214;
      }

      if (((v51 ^ (v213 == (char *)-1)) & 1) != 0)
      {
        v35 = v187;
        v83 = v211;
        v42 = v206;
        goto LABEL_42;
      }
LABEL_21:
      v42 = v206 + 1;
      ++v50;
      if (v194 == v206 + 1)
      {
        v42 = v194;
        v35 = v187;
        v83 = v211;
LABEL_42:
        v41 = v196;
        goto LABEL_43;
      }
    }
  }
  v39 = (uint64_t)v203;
  v83 = v211;
LABEL_43:
  if ((v197 & 1) != 0)
  {
    if (v42 < v41)
      goto LABEL_175;
LABEL_45:
    if (v41 < v42)
    {
      v84 = (uint64_t *)(v184 + 8 * v42);
      v85 = v42;
      v86 = v41;
      v87 = (uint64_t *)(v83 + 8 * v41);
      while (1)
      {
        if (v86 != --v85)
        {
          if (!v83)
            goto LABEL_180;
          v88 = *v87;
          *v87 = *v84;
          *v84 = v88;
        }
        ++v86;
        --v84;
        ++v87;
        if (v86 >= v85)
          goto LABEL_52;
      }
    }
  }
LABEL_53:
  if (v42 >= v194)
    goto LABEL_89;
  if (__OFSUB__(v42, v41))
    goto LABEL_173;
  if (v42 - v41 >= v188)
    goto LABEL_89;
  if (__OFADD__(v41, v188))
    goto LABEL_176;
  if (v41 + v188 >= v194)
    v89 = v194;
  else
    v89 = v41 + v188;
  if (v89 >= v41)
  {
    if (v42 == v89)
      goto LABEL_89;
    v187 = v35;
    v182 = v2;
    v90 = sub_23A7211E4();
    v91 = v211;
    v212 = v90;
    v92 = v184 + 8 * v42;
    v193 = v89;
LABEL_67:
    v93 = *(char **)(v91 + 8 * v42);
    v94 = v196;
    v197 = v92;
    v206 = v42;
    while (1)
    {
      v95 = *(void **)v92;
      v96 = &v93[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v97 = (uint64_t *)(*(_QWORD *)v92 + OBJC_IVAR____SwiftDriverApprovalState_driver);
      v98 = *(_QWORD *)&v93[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
      v217 = *(_QWORD *)&v93[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v218 = v98;
      v99 = v97[1];
      v215 = *v97;
      v216 = v99;
      v213 = v93;
      v214 = v95;
      v100 = sub_23A73BEEC();
      v101 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
      v102 = (uint64_t)v97 + v101;
      v103 = v39 + *(int *)(v208 + 48);
      sub_23A72126C((uint64_t)&v96[v101], v39, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      sub_23A72126C(v102, v103, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      v104 = v210;
      v105 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v209 + 48);
      LODWORD(v102) = v105(v39, 1, v210);
      v106 = v105(v103, 1, v104);
      if ((_DWORD)v102 == 1)
      {
        v108 = v213;
        v107 = v214;
        if (v106 != 1)
        {
          sub_23A7212B0(v103, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
          goto LABEL_84;
        }
      }
      else
      {
        if (v106 == 1)
        {
          sub_23A7212B0(v39, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          goto LABEL_64;
        }
        v109 = v39;
        v110 = (uint64_t)v204;
        sub_23A721228(v109, (uint64_t)v204, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v111 = (uint64_t)v205;
        sub_23A721228(v103, (uint64_t)v205, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v112 = v207;
        v113 = v207 + *(int *)(v202 + 48);
        sub_23A72126C(v110, v207, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A72126C(v111, v113, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_23A7212B0(v111, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0(v110, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7205E4(*(_QWORD *)v112, *(_QWORD *)(v112 + 8));
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            sub_23A7212B0(v113, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            v39 = (uint64_t)v203;
            v42 = v206;
            v108 = v213;
            v107 = v214;
LABEL_84:

            v91 = v211;
            if (!v211)
              goto LABEL_178;
            goto LABEL_85;
          }
          sub_23A7205E4(*(_QWORD *)v113, *(_QWORD *)(v113 + 8));
          v39 = (uint64_t)v203;
          v42 = v206;
        }
        else
        {
          v114 = swift_getEnumCaseMultiPayload();
          v42 = v206;
          if (v114 == 1)
          {
            sub_23A7212B0((uint64_t)v205, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7212B0((uint64_t)v204, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7205E4(*(_QWORD *)v113, *(_QWORD *)(v113 + 8));
            sub_23A7212B0(v207, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
            v39 = (uint64_t)v203;
LABEL_64:

LABEL_65:
            v91 = v211;
LABEL_66:
            ++v42;
            v92 = v197 + 8;
            if (v42 != v193)
              goto LABEL_67;
            v42 = v193;
            v2 = v182;
            v35 = v187;
            v41 = v196;
LABEL_89:
            if (v42 < v41)
              goto LABEL_168;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v35 = sub_23A735208(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
            v125 = *((_QWORD *)v35 + 2);
            v124 = *((_QWORD *)v35 + 3);
            v40 = v125 + 1;
            v37 = v211;
            v126 = v196;
            if (v125 >= v124 >> 1)
            {
              v175 = sub_23A735208((char *)(v124 > 1), v125 + 1, 1, v35);
              v126 = v196;
              v37 = v211;
              v35 = v175;
            }
            *((_QWORD *)v35 + 2) = v40;
            v127 = v35 + 32;
            v128 = &v35[16 * v125 + 32];
            *(_QWORD *)v128 = v126;
            *((_QWORD *)v128 + 1) = v42;
            v206 = v42;
            if (v125)
            {
LABEL_95:
              v129 = v40 - 1;
              if (v40 >= 4)
              {
                v134 = &v127[16 * v40];
                v135 = *((_QWORD *)v134 - 8);
                v136 = *((_QWORD *)v134 - 7);
                v140 = __OFSUB__(v136, v135);
                v137 = v136 - v135;
                if (v140)
                  goto LABEL_157;
                v139 = *((_QWORD *)v134 - 6);
                v138 = *((_QWORD *)v134 - 5);
                v140 = __OFSUB__(v138, v139);
                v132 = v138 - v139;
                v133 = v140;
                if (v140)
                  goto LABEL_158;
                v141 = v40 - 2;
                v142 = &v127[16 * v40 - 32];
                v144 = *(_QWORD *)v142;
                v143 = *((_QWORD *)v142 + 1);
                v140 = __OFSUB__(v143, v144);
                v145 = v143 - v144;
                if (v140)
                  goto LABEL_160;
                v140 = __OFADD__(v132, v145);
                v146 = v132 + v145;
                if (v140)
                  goto LABEL_163;
                if (v146 >= v137)
                {
                  v164 = &v127[16 * v129];
                  v166 = *(_QWORD *)v164;
                  v165 = *((_QWORD *)v164 + 1);
                  v140 = __OFSUB__(v165, v166);
                  v167 = v165 - v166;
                  if (v140)
                    goto LABEL_167;
                  v157 = v132 < v167;
                }
                else
                {
LABEL_108:
                  if ((v133 & 1) != 0)
                    goto LABEL_159;
                  v141 = v40 - 2;
                  v147 = &v127[16 * v40 - 32];
                  v149 = *(_QWORD *)v147;
                  v148 = *((_QWORD *)v147 + 1);
                  v150 = __OFSUB__(v148, v149);
                  v151 = v148 - v149;
                  v152 = v150;
                  if (v150)
                    goto LABEL_162;
                  v153 = &v127[16 * v129];
                  v155 = *(_QWORD *)v153;
                  v154 = *((_QWORD *)v153 + 1);
                  v140 = __OFSUB__(v154, v155);
                  v156 = v154 - v155;
                  if (v140)
                    goto LABEL_165;
                  if (__OFADD__(v151, v156))
                    goto LABEL_166;
                  if (v151 + v156 < v132)
                    goto LABEL_120;
                  v157 = v132 < v156;
                }
                if (v157)
                  v129 = v141;
              }
              else
              {
                if (v40 == 3)
                {
                  v131 = *((_QWORD *)v35 + 4);
                  v130 = *((_QWORD *)v35 + 5);
                  v140 = __OFSUB__(v130, v131);
                  v132 = v130 - v131;
                  v133 = v140;
                  goto LABEL_108;
                }
                v158 = *((_QWORD *)v35 + 4);
                v159 = *((_QWORD *)v35 + 5);
                v140 = __OFSUB__(v159, v158);
                v151 = v159 - v158;
                v152 = v140;
LABEL_120:
                if ((v152 & 1) != 0)
                  goto LABEL_161;
                v160 = &v127[16 * v129];
                v162 = *(_QWORD *)v160;
                v161 = *((_QWORD *)v160 + 1);
                v140 = __OFSUB__(v161, v162);
                v163 = v161 - v162;
                if (v140)
                  goto LABEL_164;
                if (v163 < v151)
                  goto LABEL_14;
              }
              v168 = v129 - 1;
              if (v129 - 1 >= v40)
              {
                __break(1u);
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
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_166:
                __break(1u);
LABEL_167:
                __break(1u);
LABEL_168:
                __break(1u);
LABEL_169:
                __break(1u);
LABEL_170:
                __break(1u);
LABEL_171:
                __break(1u);
LABEL_172:
                __break(1u);
LABEL_173:
                __break(1u);
LABEL_174:
                __break(1u);
LABEL_175:
                __break(1u);
LABEL_176:
                __break(1u);
                break;
              }
              if (!v37)
                goto LABEL_179;
              v169 = v35;
              v170 = &v127[16 * v168];
              v171 = *(_QWORD *)v170;
              v172 = &v127[16 * v129];
              v173 = *((_QWORD *)v172 + 1);
              sub_23A734F00((void **)(v37 + 8 * *(_QWORD *)v170), (id *)(v37 + 8 * *(_QWORD *)v172), v37 + 8 * v173, v198);
              if (v2)
                goto LABEL_151;
              if (v173 < v171)
                goto LABEL_154;
              if (v129 > *((_QWORD *)v169 + 2))
                goto LABEL_155;
              *(_QWORD *)v170 = v171;
              *(_QWORD *)&v127[16 * v168 + 8] = v173;
              v174 = *((_QWORD *)v169 + 2);
              if (v129 >= v174)
                goto LABEL_156;
              v35 = v169;
              v40 = v174 - 1;
              memmove(&v127[16 * v129], v172 + 16, 16 * (v174 - 1 - v129));
              *((_QWORD *)v169 + 2) = v174 - 1;
              v157 = v174 > 2;
              v39 = (uint64_t)v203;
              v37 = v211;
              if (!v157)
                goto LABEL_14;
              goto LABEL_95;
            }
            v40 = 1;
LABEL_14:
            v38 = v194;
            v36 = v206;
            if (v206 >= v194)
              goto LABEL_140;
            goto LABEL_15;
          }
          v115 = v199;
          sub_23A721228(v207, v199, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v116 = v200;
          sub_23A721228(v113, v200, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v117 = *(int *)(v201 + 36);
          v118 = *(_QWORD *)(v115 + v117 + 8);
          v217 = *(_QWORD *)(v115 + v117);
          v218 = v118;
          v119 = (uint64_t *)(v116 + v117);
          v121 = *v119;
          v120 = v119[1];
          v215 = v121;
          v216 = v120;
          v122 = sub_23A73BEEC();
          sub_23A7212B0(v116, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v115, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0((uint64_t)v205, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0((uint64_t)v204, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          if (v122)
            v100 = v122;
          v39 = (uint64_t)v203;
        }
        v108 = v213;
        v107 = v214;
      }

      if (v100 != -1)
        goto LABEL_65;
      v91 = v211;
      if (!v211)
        goto LABEL_178;
LABEL_85:
      v123 = *(void **)v92;
      v93 = *(char **)(v92 + 8);
      *(_QWORD *)v92 = v93;
      *(_QWORD *)(v92 + 8) = v123;
      v92 -= 8;
      if (v42 == ++v94)
        goto LABEL_66;
    }
  }
  __break(1u);
LABEL_178:
  __break(1u);
LABEL_179:
  __break(1u);
LABEL_180:
  __break(1u);
LABEL_181:
  __break(1u);
LABEL_182:
  sub_23A73BFAC();
  __break(1u);
}

void sub_23A7349B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  int v37;
  id v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int EnumCaseMultiPayload;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v56 = a1;
  v61 = type metadata accessor for SettingsApplicationRecord();
  v7 = MEMORY[0x24BDAC7A8](v61);
  v60 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v59 = (uint64_t)&v54 - v9;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FC0);
  MEMORY[0x24BDAC7A8](v62);
  v63 = (uint64_t)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for DriverKitDriverApp();
  v65 = *(_QWORD *)(v69 - 8);
  v11 = MEMORY[0x24BDAC7A8](v69);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v54 - v14;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FD8);
  MEMORY[0x24BDAC7A8](v64);
  v70 = (uint64_t)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = a2;
  if (a3 != a2)
  {
    v17 = *a4;
    v68 = sub_23A7211E4();
    v66 = v17;
    v18 = v17 + 8 * a3 - 8;
    v58 = v15;
LABEL_7:
    v20 = *(char **)(v66 + 8 * a3);
    v21 = v56;
    v57 = v18;
    v67 = a3;
    while (1)
    {
      v22 = (uint64_t)v15;
      v23 = v13;
      v24 = *(void **)v18;
      v25 = &v20[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v26 = (uint64_t *)(*(_QWORD *)v18 + OBJC_IVAR____SwiftDriverApprovalState_driver);
      v27 = *(_QWORD *)&v20[OBJC_IVAR____SwiftDriverApprovalState_driver + 8];
      v75 = *(_QWORD *)&v20[OBJC_IVAR____SwiftDriverApprovalState_driver];
      v76 = v27;
      v28 = v26[1];
      v73 = *v26;
      v74 = v28;
      v71 = v20;
      v72 = v24;
      v77 = sub_23A73BEEC();
      v29 = *(int *)(type metadata accessor for DriverKitDriver() + 20);
      v30 = (uint64_t)&v25[v29];
      v31 = (uint64_t)v26 + v29;
      v32 = v70;
      v33 = v70 + *(int *)(v64 + 48);
      sub_23A72126C(v30, v70, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      sub_23A72126C(v31, v33, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
      v35 = v32;
      v36 = v69;
      LODWORD(v31) = v34(v35, 1, v69);
      v37 = v34(v33, 1, v36);
      if ((_DWORD)v31 == 1)
      {
        v19 = v67;
        v13 = v23;
        v15 = (char *)v22;
        v39 = v71;
        v38 = v72;
        if (v37 == 1)
          goto LABEL_20;
        sub_23A7212B0(v33, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      }
      else
      {
        v13 = v23;
        if (v37 == 1)
        {
          sub_23A7212B0(v70, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          v19 = v67;
          v15 = (char *)v22;
LABEL_5:

LABEL_6:
          a3 = v19 + 1;
          v18 = v57 + 8;
          if (a3 == v55)
            return;
          goto LABEL_7;
        }
        v15 = (char *)v22;
        sub_23A721228(v70, v22, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A721228(v33, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v40 = v63;
        v41 = v63 + *(int *)(v62 + 48);
        sub_23A72126C(v22, v63, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A72126C((uint64_t)v13, v41, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          v19 = v67;
          if (EnumCaseMultiPayload == 1)
          {
            sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7212B0(v22, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7205E4(*(_QWORD *)v41, *(_QWORD *)(v41 + 8));
            sub_23A7212B0(v63, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
            goto LABEL_5;
          }
          v44 = v59;
          sub_23A721228(v63, v59, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v45 = v60;
          sub_23A721228(v41, v60, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v46 = *(int *)(v61 + 36);
          v47 = *(_QWORD *)(v44 + v46 + 8);
          v75 = *(_QWORD *)(v44 + v46);
          v76 = v47;
          v48 = (uint64_t *)(v45 + v46);
          v50 = *v48;
          v49 = v48[1];
          v73 = v50;
          v74 = v49;
          v51 = sub_23A73BEEC();
          v15 = v58;
          sub_23A7212B0(v45, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0(v44, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          sub_23A7212B0((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          v52 = v77;
          if (v51)
            v52 = v51;
          v77 = v52;
          goto LABEL_19;
        }
        sub_23A7212B0((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A7212B0(v22, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        sub_23A7205E4(*(_QWORD *)v40, *(_QWORD *)(v40 + 8));
        v42 = swift_getEnumCaseMultiPayload();
        v19 = v67;
        if (v42 == 1)
        {
          sub_23A7205E4(*(_QWORD *)v41, *(_QWORD *)(v41 + 8));
LABEL_19:
          v39 = v71;
          v38 = v72;
LABEL_20:

          if (v77 != -1)
            goto LABEL_6;
          if (!v66)
            goto LABEL_28;
          goto LABEL_25;
        }
        sub_23A7212B0(v41, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
        v39 = v71;
        v38 = v72;
      }

      if (!v66)
      {
LABEL_28:
        __break(1u);
        return;
      }
LABEL_25:
      v53 = *(void **)v18;
      v20 = *(char **)(v18 + 8);
      *(_QWORD *)v18 = v20;
      *(_QWORD *)(v18 + 8) = v53;
      v18 -= 8;
      if (v19 == ++v21)
        goto LABEL_6;
    }
  }
}

uint64_t sub_23A734F00(void **__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  void **v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  id v18;
  id *v19;
  char *v20;
  id *v21;
  void **v22;
  char *v23;
  id *v24;
  char *v25;
  uint64_t *v26;
  uint64_t *v27;
  char *v28;
  char *v29;
  uint64_t result;
  void **v31;
  id *v34;
  char *v35;
  void **v36;
  id *v37;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v37 = __src;
  v36 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v20 = (char *)&a4[v11];
      v35 = v20;
      v37 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v21 = (id *)(a3 - 8);
        v22 = v4;
        v31 = v5;
        do
        {
          v34 = v4;
          v23 = (char *)*((_QWORD *)v20 - 1);
          v24 = v21 + 1;
          v25 = (char *)*--v22;
          v26 = (uint64_t *)&v23[OBJC_IVAR____SwiftDriverApprovalState_driver];
          v27 = (uint64_t *)&v25[OBJC_IVAR____SwiftDriverApprovalState_driver];
          v28 = v23;
          v29 = v25;
          LOBYTE(v26) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v26, v27);

          if ((v26 & 1) != 0)
          {
            if (v24 != v34 || v21 >= v34)
              *v21 = *v22;
            v37 = v22;
          }
          else
          {
            v35 = v20 - 8;
            if (v24 < (id *)v20 || v21 >= (id *)v20 || v24 != (id *)v20)
              *v21 = (id)*((_QWORD *)v20 - 1);
            v22 = v34;
            v20 -= 8;
          }
          if (v22 <= v31)
            break;
          --v21;
          v4 = v22;
        }
        while (v20 > (char *)a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v12 = &a4[v8];
    v35 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v13 = a4;
      do
      {
        v14 = *v13;
        v15 = (uint64_t *)((char *)*v4 + OBJC_IVAR____SwiftDriverApprovalState_driver);
        v16 = (uint64_t *)((char *)*v13 + OBJC_IVAR____SwiftDriverApprovalState_driver);
        v17 = *v4;
        v18 = v14;
        LOBYTE(v15) = _s16DriverManagement0a3KitA0V1loiySbAC_ACtFZ_0(v15, v16);

        if ((v15 & 1) != 0)
        {
          v19 = v4 + 1;
          if (v5 < v4 || v5 >= v19 || v5 != v4)
            *v5 = *v4;
        }
        else
        {
          if (v5 != v13)
            *v5 = *v13;
          v36 = ++v13;
          v19 = v4;
        }
        ++v5;
        if (v13 >= v12)
          break;
        v4 = v19;
      }
      while ((unint64_t)v19 < a3);
      v37 = v5;
    }
LABEL_43:
    sub_23A735300((void **)&v37, (const void **)&v36, &v35);
    return 1;
  }
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

char *sub_23A735208(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4828);
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

char *sub_23A735300(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_23A73BFF4();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_23A7353A8(uint64_t a1)
{
  return sub_23A735208(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A7353BC(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
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
  v12 = sub_23A72861C(a2, a3);
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
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for SettingsApplicationRecord() - 8) + 72) * v12;
        return sub_23A736D54(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23A735584();
      goto LABEL_7;
    }
    sub_23A733554(v15, a4 & 1);
    v22 = sub_23A72861C(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A7354F4(v12, a2, a3, a1, v18);
      return sub_23A720478(a2, a3);
    }
  }
  result = sub_23A73C0B4();
  __break(1u);
  return result;
}

uint64_t sub_23A7354F4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for SettingsApplicationRecord();
  result = sub_23A721228(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_23A735584()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for SettingsApplicationRecord();
  v29 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D30A0);
  v5 = *v0;
  v6 = sub_23A73BFD0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v26 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v27 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v28 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v23 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v28)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v23);
    ++v11;
    if (!v24)
    {
      v11 = v23 + 1;
      if (v23 + 1 >= v28)
        goto LABEL_26;
      v24 = *(_QWORD *)(v27 + 8 * v11);
      if (!v24)
        break;
    }
LABEL_25:
    v14 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v11 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v16);
    v19 = *v18;
    v20 = v18[1];
    v21 = *(_QWORD *)(v29 + 72) * v16;
    sub_23A72126C(*(_QWORD *)(v5 + 56) + v21, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
    v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + v17);
    *v22 = v19;
    v22[1] = v20;
    sub_23A721228((uint64_t)v4, *(_QWORD *)(v7 + 56) + v21, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
    result = (void *)sub_23A720478(v19, v20);
  }
  v25 = v23 + 2;
  if (v25 >= v28)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_28;
  }
  v24 = *(_QWORD *)(v27 + 8 * v25);
  if (v24)
  {
    v11 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v11 >= v28)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v11);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A7357CC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_BYTE *sub_23A735854(_BYTE *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    *result = *(_BYTE *)(*(_QWORD *)(a5 + 56) + a2);
    swift_bridgeObjectRetain();
    return (_BYTE *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_23A7358D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A73BFC4();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B855828);
}

BOOL sub_23A735940(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;

  if (a1 >> 62)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_23A73BFC4();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v5 = 4;
      while (1)
      {
        v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v7 = MEMORY[0x23B85581C](v5 - 4, a1);
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
            goto LABEL_12;
        }
        else
        {
          v7 = *(_QWORD *)(a1 + 8 * v5);
          swift_unknownObjectRetain();
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_12:
            __break(1u);
            goto LABEL_13;
          }
        }
        swift_unknownObjectRelease();
        v9 = v7 == a2;
        if (v7 != a2)
        {
          ++v5;
          if (v8 != v4)
            continue;
        }
        goto LABEL_15;
      }
    }
  }
  v9 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_23A735A40(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = 0;
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x23B85581C](v5, a1);
      }
      else
      {
        v6 = *(_QWORD *)(a1 + 8 * v5 + 32);
        swift_unknownObjectRetain();
      }
      swift_unknownObjectRelease();
      if (v6 == a2)
        break;
      v7 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_11:
        swift_bridgeObjectRetain();
        v4 = sub_23A73BFC4();
        swift_bridgeObjectRelease();
        v5 = 0;
        if (!v4)
          return v5;
      }
      else
      {
        ++v5;
        if (v7 == v4)
          return 0;
      }
    }
  }
  return v5;
}

uint64_t sub_23A735B30(unint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t i;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int isUniquelyReferenced_nonNull_bridgeObject;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v5 = swift_bridgeObjectRetain();
  v6 = sub_23A735A40(v5, a2);
  v8 = v7;
  swift_bridgeObjectRelease();
  if (v2)
    return v6;
  if ((v8 & 1) == 0)
  {
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_54;
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      v22 = sub_23A73BFC4();
      swift_bridgeObjectRelease();
      if (v9 != v22)
        goto LABEL_6;
    }
    else if (v9 != *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v6 + 5; ; ++i)
      {
        v11 = i - 4;
        v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v13 = MEMORY[0x23B85581C](i - 4);
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v11 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_45;
          v13 = *(_QWORD *)(v12 + 8 * i);
          swift_unknownObjectRetain();
        }
        swift_unknownObjectRelease();
        if (v13 != a2)
          break;
LABEL_32:
        v9 = i - 3;
        if (__OFADD__(v11, 1))
          goto LABEL_46;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v19 = sub_23A73BFC4();
          swift_bridgeObjectRelease();
        }
        else
        {
          v19 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v19)
          return v6;
      }
      if (v11 == v6)
      {
LABEL_31:
        if (__OFADD__(v6++, 1))
          goto LABEL_47;
        goto LABEL_32;
      }
      v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v14 = MEMORY[0x23B85581C](v6, *a1);
        v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v11 & 0x8000000000000000) != 0)
            goto LABEL_50;
          if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v15 = *(_QWORD *)(v9 + 8 * i);
          swift_unknownObjectRetain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0)
          goto LABEL_48;
        if (v6 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_49;
        v14 = *(_QWORD *)(v9 + 8 * v6 + 32);
        swift_unknownObjectRetain();
        if ((v9 & 0xC000000000000001) == 0)
          goto LABEL_17;
      }
      v15 = MEMORY[0x23B85581C](i - 4, v9);
      v9 = *a1;
LABEL_20:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_23A7358D8(v9);
      }
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v15;
      swift_unknownObjectRelease();
      sub_23A73BE2C();
      v9 = *a1;
      v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v17 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
        sub_23A7358D8(v9);
      if ((v11 & 0x8000000000000000) != 0)
        goto LABEL_52;
      if (v11 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_53;
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v14;
      swift_unknownObjectRelease();
      sub_23A73BE2C();
      goto LABEL_31;
    }
    return v6;
  }
  v20 = *a1;
  if (!(v20 >> 62))
    return *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v23 = sub_23A73BFC4();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_23A735E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_23A73BFC4();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B855828](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F70);
  swift_arrayDestroy();
  if (!v5)
    return sub_23A73BE2C();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_23A73BFC4();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_23A73BE2C();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_23A73BFC4();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_23A73BFF4();
  __break(1u);
  return result;
}

uint64_t sub_23A736150(unint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)();
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  _QWORD *v39;
  uint64_t v40;
  _BYTE v42[4];
  int v43;
  void *v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t (*v47)();
  _BYTE *v48;
  _BYTE *v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;

  v4 = v3;
  v46 = a2;
  v7 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x24BDAC7A8](v7);
  v45 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for DriverKitDriverApp();
  v55 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t (*)())&v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v42[-v13];
  v15 = type metadata accessor for DriverKitDriverSource();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v51 = &v42[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = &v42[-v19];
  MEMORY[0x24BDAC7A8](v18);
  v50 = &v42[-v21];
  v57 = MEMORY[0x24BEE4AF8];
  v56 = a1;
  if (a1 >> 62)
    goto LABEL_34;
  v52 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v52)
  {
    while (1)
    {
      v48 = v14;
      v49 = v20;
      v47 = v12;
      v44 = v4;
      v22 = 0;
      v53 = v56 & 0xFFFFFFFFFFFFFF8;
      v54 = v56 & 0xC000000000000001;
      v12 = type metadata accessor for DriverKitDriverSource;
      v20 = v51;
      v23 = (_BYTE *)v52;
      while (v54)
      {
        v24 = (id)MEMORY[0x23B85581C](v22, v56);
LABEL_12:
        v4 = v24;
        v14 = (_BYTE *)(v22 + 1);
        if (__OFADD__(v22, 1))
          goto LABEL_33;
        if (a3)
        {
          if (a3 == 1)
          {
            v25 = OBJC_IVAR____SwiftDriverApprovalState_driver;
            v26 = (uint64_t)v24 + *(int *)(type metadata accessor for DriverKitDriver() + 20) + v25;
            v12 = type metadata accessor for DriverKitDriverSource;
            sub_23A72126C(v26, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
            if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v55 + 48))(v20, 1, v9) != 1)
            {
              sub_23A7212B0((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);

              goto LABEL_8;
            }
            goto LABEL_6;
          }
          v31 = OBJC_IVAR____SwiftDriverApprovalState_driver;
          v32 = (uint64_t)v24 + *(int *)(type metadata accessor for DriverKitDriver() + 20) + v31;
          v33 = (uint64_t)v49;
          sub_23A72126C(v32, (uint64_t)v49, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v33, 1, v9) == 1)
          {

            goto LABEL_7;
          }
          v34 = a3;
          v35 = (uint64_t)v48;
          sub_23A721228(v33, (uint64_t)v48, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          v36 = (uint64_t)v47;
          sub_23A72126C(v35, (uint64_t)v47, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            sub_23A7212B0(v35, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7212B0(v36, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);

            a3 = v34;
            v20 = v51;
            v23 = (_BYTE *)v52;
            goto LABEL_7;
          }
          v37 = v36;
          v38 = v45;
          sub_23A721228(v37, (uint64_t)v45, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          v39 = v38;
          v40 = *((_QWORD *)v38 + 1);
          if (!v40)
          {
            a3 = v34;
            swift_bridgeObjectRetain();
            sub_23A7212B0((uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
            sub_23A7212B0((uint64_t)v48, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            sub_23A7366CC(v46, v34);
            v20 = v51;
            v23 = (_BYTE *)v52;
            v12 = type metadata accessor for DriverKitDriverSource;
LABEL_29:

            goto LABEL_8;
          }
          a3 = v34;
          if (*v39 != v46 || v40 != v34)
          {
            v43 = sub_23A73C0A8();
            swift_bridgeObjectRetain();
            sub_23A7212B0((uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
            sub_23A7212B0((uint64_t)v48, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
            swift_bridgeObjectRelease();
            v20 = v51;
            v23 = (_BYTE *)v52;
            v12 = type metadata accessor for DriverKitDriverSource;
            if ((v43 & 1) == 0)
              goto LABEL_29;
            goto LABEL_6;
          }
          swift_bridgeObjectRetain();
          sub_23A7212B0((uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
          sub_23A7212B0((uint64_t)v48, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
          swift_bridgeObjectRelease();
        }
        else
        {
          v27 = v12;
          v28 = OBJC_IVAR____SwiftDriverApprovalState_driver;
          v29 = (uint64_t)v24 + *(int *)(type metadata accessor for DriverKitDriver() + 20) + v28;
          v30 = v50;
          sub_23A72126C(v29, (uint64_t)v50, (uint64_t (*)(_QWORD))v27);
          if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v55 + 48))(v30, 1, v9) == 1)
          {

            v12 = v27;
            a3 = 0;
            v20 = v51;
            v23 = (_BYTE *)v52;
            goto LABEL_8;
          }
          sub_23A7212B0((uint64_t)v30, (uint64_t (*)(_QWORD))v27);
          a3 = 0;
        }
        v20 = v51;
LABEL_6:
        sub_23A73BF7C();
        sub_23A73BF94();
        v23 = (_BYTE *)v52;
        sub_23A73BFA0();
        sub_23A73BF88();
LABEL_7:
        v12 = type metadata accessor for DriverKitDriverSource;
LABEL_8:
        ++v22;
        if (v14 == v23)
          return v57;
      }
      if (v22 < *(_QWORD *)(v53 + 16))
        break;
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      v52 = sub_23A73BFC4();
      if (!v52)
        return MEMORY[0x24BEE4AF8];
    }
    v24 = *(id *)(v56 + 8 * v22 + 32);
    goto LABEL_12;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23A7366B8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23A7366CC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23A7366E0(uint64_t *a1)
{
  uint64_t v1;

  return sub_23A732758(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t sub_23A7366FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A736734()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A736758()
{
  return sub_23A72E7F4();
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

uint64_t sub_23A736790()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A7367BC(void *a1, char a2)
{
  uint64_t v2;

  return sub_23A732124(a1, a2 & 1, *(void **)(v2 + 16), *(_BYTE *)(v2 + 24), *(void **)(v2 + 32));
}

unint64_t sub_23A7367D8()
{
  unint64_t result;

  result = qword_2542D3048;
  if (!qword_2542D3048)
  {
    result = MEMORY[0x23B855DA4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2542D3048);
  }
  return result;
}

uint64_t sub_23A73681C()
{
  return MEMORY[0x24BDB9D70];
}

unint64_t destroy for DriverKitSettingsFilter(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16DriverManagement23DriverKitSettingsFilterOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for DriverKitSettingsFilter(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DriverKitSettingsFilter(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitSettingsFilter(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DriverKitSettingsFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_23A736A3C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A736A54(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DriverKitSettingsFilter()
{
  return &type metadata for DriverKitSettingsFilter;
}

uint64_t sub_23A736A84()
{
  return type metadata accessor for DriverManager();
}

uint64_t type metadata accessor for DriverManager()
{
  uint64_t result;

  result = qword_2542D2F90;
  if (!qword_2542D2F90)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A736AC8()
{
  unint64_t v0;

  sub_23A736B64();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23A736B64()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542D3038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542D3050);
    v0 = sub_23A73BCE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542D3038);
  }
}

uint64_t sub_23A736BBC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B855DA4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A736BFC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A736C20()
{
  uint64_t v0;

  sub_23A72EDDC(v0);
}

void sub_23A736C28(void *a1, char a2)
{
  uint64_t v2;

  sub_23A730B60(a1, a2 & 1, *(void **)(v2 + 16));
}

void sub_23A736C34(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_23A736C40()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A736C6C()
{
  uint64_t v0;

  return sub_23A731000(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A736C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A736CB0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A736CD4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A736D08()
{
  uint64_t *v0;

  return sub_23A731C28(v0[2], v0[3], v0[4]);
}

uint64_t sub_23A736D14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D3010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A736D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SettingsApplicationRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_23A736DA0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return sub_23A722A54(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_23A736DA8()
{
  uint64_t v0;

  sub_23A736DE0(*(id *)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject();
}

void sub_23A736DE0(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_23A736DEC()
{
  uint64_t v0;

  return sub_23A732364(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_BYTE *)(v0 + 33));
}

id sub_23A736E00(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

unint64_t sub_23A736E38(uint64_t *a1)
{
  return sub_23A7366E0(a1) & 1;
}

void *DriverKitDaemonXPC.serverName.unsafeMutableAddressor()
{
  return &static DriverKitDaemonXPC.serverName;
}

unint64_t static DriverKitDaemonXPC.serverName.getter()
{
  return 0xD000000000000022;
}

void *DriverKitDaemonXPC.NotificationType.approvalsChanged.unsafeMutableAddressor()
{
  return &static DriverKitDaemonXPC.NotificationType.approvalsChanged;
}

unint64_t static DriverKitDaemonXPC.NotificationType.approvalsChanged.getter()
{
  return 0xD00000000000002BLL;
}

ValueMetadata *type metadata accessor for DriverKitDaemonXPC()
{
  return &type metadata for DriverKitDaemonXPC;
}

ValueMetadata *type metadata accessor for DriverKitDaemonXPC.NotificationType()
{
  return &type metadata for DriverKitDaemonXPC.NotificationType;
}

uint64_t sub_23A736EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for SettingsApplicationRecord();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DriverKitDriverApp();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7373E0(v1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
    return 0;
  sub_23A721228((uint64_t)v11, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  if (swift_getEnumCaseMultiPayload() == 1)
    return *(_QWORD *)v8;
  sub_23A721228((uint64_t)v8, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  v13 = &v4[*(int *)(v2 + 32)];
  v12 = *(_QWORD *)v13;
  sub_23A720478(*(_QWORD *)v13, *((_QWORD *)v13 + 1));
  sub_23A7212B0((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for SettingsApplicationRecord);
  return v12;
}

uint64_t DriverKitDriverSource.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  v1 = v0;
  v2 = type metadata accessor for DriverKitDriverApp();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7373E0(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
    return 0x6150207473726946;
  sub_23A721228((uint64_t)v8, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_23A73BF1C();
  swift_bridgeObjectRelease();
  v11 = 0xD000000000000014;
  v12 = 0x800000023A7400B0;
  DriverKitDriverApp.description.getter();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  v9 = v11;
  sub_23A7212B0((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
  return v9;
}

uint64_t _s16DriverManagement0a3KitA6SourceO21__derived_enum_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
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
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  char v17;
  uint64_t v19;

  v4 = type metadata accessor for DriverKitDriverApp();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DriverKitDriverSource();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FD8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_23A7373E0(a1, (uint64_t)v14);
  sub_23A7373E0(a2, v15);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_23A7373E0((uint64_t)v14, (uint64_t)v10);
    if (v16(v15, 1, v4) != 1)
    {
      sub_23A721228(v15, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      v17 = _s16DriverManagement0a3KitA3AppO2eeoiySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v7);
      sub_23A7212B0((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A7212B0((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
      return v17 & 1;
    }
    sub_23A7212B0((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_23A7380C0((uint64_t)v14);
    v17 = 0;
    return v17 & 1;
  }
  sub_23A7212B0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverSource);
  v17 = 1;
  return v17 & 1;
}

uint64_t type metadata accessor for DriverKitDriverSource()
{
  uint64_t result;

  result = qword_2542D2FC8;
  if (!qword_2542D2FC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A7373E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DriverKitDriverSource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for DriverKitDriverApp();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v11 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        v12 = a2[1];
        sub_23A720478(v11, v12);
        *a1 = v11;
        a1[1] = v12;
      }
      else
      {
        v13 = a2[1];
        *a1 = v11;
        a1[1] = v13;
        v14 = (int *)type metadata accessor for SettingsApplicationRecord();
        v15 = v14[5];
        v16 = (char *)a1 + v15;
        v17 = (char *)a2 + v15;
        v18 = sub_23A73BBEC();
        v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        v19(v16, v17, v18);
        v20 = v14[6];
        v21 = (char *)a1 + v20;
        v22 = (char *)a2 + v20;
        v23 = *((_QWORD *)v22 + 1);
        if (v23 >> 60 == 15)
        {
          *(_OWORD *)v21 = *(_OWORD *)v22;
        }
        else
        {
          v24 = *(_QWORD *)v22;
          sub_23A720478(*(_QWORD *)v22, *((_QWORD *)v22 + 1));
          *(_QWORD *)v21 = v24;
          *((_QWORD *)v21 + 1) = v23;
        }
        *(uint64_t *)((char *)a1 + v14[7]) = *(uint64_t *)((char *)a2 + v14[7]);
        v25 = v14[8];
        v26 = (uint64_t *)((char *)a1 + v25);
        v27 = (uint64_t *)((char *)a2 + v25);
        v28 = *v27;
        v29 = v27[1];
        swift_bridgeObjectRetain();
        sub_23A720478(v28, v29);
        *v26 = v28;
        v26[1] = v29;
        v30 = v14[9];
        v31 = (uint64_t *)((char *)a1 + v30);
        v32 = (uint64_t *)((char *)a2 + v30);
        v33 = v32[1];
        *v31 = *v32;
        v31[1] = v33;
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DriverKitDriverSource(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;

  v2 = type metadata accessor for DriverKitDriverApp();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      return sub_23A7205E4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      swift_bridgeObjectRelease();
      v4 = (int *)type metadata accessor for SettingsApplicationRecord();
      v5 = a1 + v4[5];
      v6 = sub_23A73BBEC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
      v7 = (uint64_t *)(a1 + v4[6]);
      v8 = v7[1];
      if (v8 >> 60 != 15)
        sub_23A7205E4(*v7, v8);
      swift_bridgeObjectRelease();
      sub_23A7205E4(*(_QWORD *)(a1 + v4[8]), *(_QWORD *)(a1 + v4[8] + 8));
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t *initializeWithCopy for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;

  v6 = type metadata accessor for DriverKitDriverApp();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v9 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      v10 = a2[1];
      sub_23A720478(v9, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    else
    {
      v11 = a2[1];
      *a1 = v9;
      a1[1] = v11;
      v12 = (int *)type metadata accessor for SettingsApplicationRecord();
      v13 = v12[5];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      v16 = sub_23A73BBEC();
      v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      swift_bridgeObjectRetain();
      v17(v14, v15, v16);
      v18 = v12[6];
      v19 = (char *)a1 + v18;
      v20 = (char *)a2 + v18;
      v21 = *((_QWORD *)v20 + 1);
      if (v21 >> 60 == 15)
      {
        *(_OWORD *)v19 = *(_OWORD *)v20;
      }
      else
      {
        v22 = *(_QWORD *)v20;
        sub_23A720478(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
        *(_QWORD *)v19 = v22;
        *((_QWORD *)v19 + 1) = v21;
      }
      *(uint64_t *)((char *)a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
      v23 = v12[8];
      v24 = (uint64_t *)((char *)a1 + v23);
      v25 = (uint64_t *)((char *)a2 + v23);
      v26 = *v25;
      v27 = v25[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v26, v27);
      *v24 = v26;
      v24[1] = v27;
      v28 = v12[9];
      v29 = (uint64_t *)((char *)a1 + v28);
      v30 = (uint64_t *)((char *)a2 + v28);
      v31 = v30[1];
      *v29 = *v30;
      v29[1] = v31;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t *assignWithCopy for DriverKitDriverSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t *, uint64_t, uint64_t);
  int v9;
  int v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  int *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;

  v6 = type metadata accessor for DriverKitDriverApp();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v12 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        v13 = a2[1];
        sub_23A720478(v12, v13);
        *a1 = v12;
        a1[1] = v13;
      }
      else
      {
        *a1 = v12;
        a1[1] = a2[1];
        v17 = (int *)type metadata accessor for SettingsApplicationRecord();
        v18 = v17[5];
        v19 = (char *)a1 + v18;
        v20 = (char *)a2 + v18;
        v21 = sub_23A73BBEC();
        v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
        swift_bridgeObjectRetain();
        v22(v19, v20, v21);
        v23 = v17[6];
        v24 = (char *)a1 + v23;
        v25 = (char *)a2 + v23;
        v26 = *((_QWORD *)v25 + 1);
        if (v26 >> 60 == 15)
        {
          *(_OWORD *)v24 = *(_OWORD *)v25;
        }
        else
        {
          v27 = *(_QWORD *)v25;
          sub_23A720478(*(_QWORD *)v25, *((_QWORD *)v25 + 1));
          *(_QWORD *)v24 = v27;
          *((_QWORD *)v24 + 1) = v26;
        }
        *(uint64_t *)((char *)a1 + v17[7]) = *(uint64_t *)((char *)a2 + v17[7]);
        v28 = v17[8];
        v29 = (uint64_t *)((char *)a1 + v28);
        v30 = (uint64_t *)((char *)a2 + v28);
        v31 = *v30;
        v32 = v30[1];
        swift_bridgeObjectRetain();
        sub_23A720478(v31, v32);
        *v29 = v31;
        v29[1] = v32;
        v33 = v17[9];
        v34 = (uint64_t *)((char *)a1 + v33);
        v35 = (uint64_t *)((char *)a2 + v33);
        *v34 = *v35;
        v34[1] = v35[1];
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
    v14 = swift_getEnumCaseMultiPayload();
    v15 = *a2;
    if (v14 == 1)
    {
      v16 = a2[1];
      sub_23A720478(v15, v16);
      *a1 = v15;
      a1[1] = v16;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *a1 = v15;
      a1[1] = a2[1];
      v37 = (int *)type metadata accessor for SettingsApplicationRecord();
      v38 = v37[5];
      v39 = (char *)a1 + v38;
      v40 = (char *)a2 + v38;
      v41 = sub_23A73BBEC();
      v42 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
      swift_bridgeObjectRetain();
      v42(v39, v40, v41);
      v43 = v37[6];
      v44 = (char *)a1 + v43;
      v45 = (char *)a2 + v43;
      v46 = *((_QWORD *)v45 + 1);
      if (v46 >> 60 == 15)
      {
        *(_OWORD *)v44 = *(_OWORD *)v45;
      }
      else
      {
        v47 = *(_QWORD *)v45;
        sub_23A720478(*(_QWORD *)v45, *((_QWORD *)v45 + 1));
        *(_QWORD *)v44 = v47;
        *((_QWORD *)v44 + 1) = v46;
      }
      *(uint64_t *)((char *)a1 + v37[7]) = *(uint64_t *)((char *)a2 + v37[7]);
      v48 = v37[8];
      v49 = (uint64_t *)((char *)a1 + v48);
      v50 = (uint64_t *)((char *)a2 + v48);
      v51 = *v50;
      v52 = v50[1];
      swift_bridgeObjectRetain();
      sub_23A720478(v51, v52);
      *v49 = v51;
      v49[1] = v52;
      v53 = v37[9];
      v54 = (uint64_t *)((char *)a1 + v53);
      v55 = (uint64_t *)((char *)a2 + v53);
      *v54 = *v55;
      v54[1] = v55[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *initializeWithTake for DriverKitDriverSource(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for DriverKitDriverApp();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      *a1 = *a2;
      v8 = (int *)type metadata accessor for SettingsApplicationRecord();
      v9 = v8[5];
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_23A73BBEC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
      *(_QWORD *)((char *)a1 + v8[7]) = *(_QWORD *)((char *)a2 + v8[7]);
      *(_OWORD *)((char *)a1 + v8[8]) = *(_OWORD *)((char *)a2 + v8[8]);
      *(_OWORD *)((char *)a1 + v8[9]) = *(_OWORD *)((char *)a2 + v8[9]);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_OWORD *assignWithTake for DriverKitDriverSource(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_OWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  size_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v6 = type metadata accessor for DriverKitDriverApp();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      if (a1 == a2)
        return a1;
      sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
      if (!swift_getEnumCaseMultiPayload())
      {
        *a1 = *a2;
        v18 = (int *)type metadata accessor for SettingsApplicationRecord();
        v19 = v18[5];
        v20 = (char *)a1 + v19;
        v21 = (char *)a2 + v19;
        v22 = sub_23A73BBEC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
        *(_OWORD *)((char *)a1 + v18[6]) = *(_OWORD *)((char *)a2 + v18[6]);
        *(_QWORD *)((char *)a1 + v18[7]) = *(_QWORD *)((char *)a2 + v18[7]);
        *(_OWORD *)((char *)a1 + v18[8]) = *(_OWORD *)((char *)a2 + v18[8]);
        *(_OWORD *)((char *)a1 + v18[9]) = *(_OWORD *)((char *)a2 + v18[9]);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v11 = *(_QWORD *)(v7 + 64);
      goto LABEL_8;
    }
    sub_23A7212B0((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for DriverKitDriverApp);
LABEL_7:
    v11 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v11);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    v12 = (int *)type metadata accessor for SettingsApplicationRecord();
    v13 = v12[5];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_23A73BBEC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    *(_OWORD *)((char *)a1 + v12[6]) = *(_OWORD *)((char *)a2 + v12[6]);
    *(_QWORD *)((char *)a1 + v12[7]) = *(_QWORD *)((char *)a2 + v12[7]);
    *(_OWORD *)((char *)a1 + v12[8]) = *(_OWORD *)((char *)a2 + v12[8]);
    *(_OWORD *)((char *)a1 + v12[9]) = *(_OWORD *)((char *)a2 + v12[9]);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DriverKitDriverSource()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A737F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for DriverKitDriverApp();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DriverKitDriverSource()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A737FA4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for DriverKitDriverApp();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_23A737FF4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DriverKitDriverApp();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_23A73802C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DriverKitDriverApp();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_23A73806C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DriverKitDriverApp();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A7380C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2FD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A738100(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F00);
  v2 = (_QWORD *)sub_23A73BFE8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_23A728608(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_23A738210(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4838);
  v2 = (_QWORD *)sub_23A73BFE8();
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
    result = sub_23A728608(v5, v6);
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

unint64_t sub_23A738330(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F40);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D30A0);
  v6 = sub_23A73BFE8();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23A739F18(v12, (uint64_t)v5);
    v14 = *v5;
    v15 = v5[1];
    result = sub_23A72861C(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = type metadata accessor for SettingsApplicationRecord();
    result = sub_23A721A54(v9, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18);
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

_QWORD *DriverKitDaemonClient.__allocating_init()()
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

uint64_t DriverKitDaemonClient.registerForApprovalsChangeNotification(_:)(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  sub_23A738210(MEMORY[0x24BEE4AF8]);
  v4 = (void *)sub_23A73BD30();
  swift_bridgeObjectRelease();
  _CFXPCCreateXPCObjectFromCFObject();

  sub_23A738D80();
  sub_23A73BD78();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v8[4] = sub_23A739D74;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23A739D7C;
  v8[3] = &block_descriptor_0;
  v6 = _Block_copy(v8);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.driverkitd.DriverApprovalsChanged", 0, v6);
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall DriverKitDaemonClient.unregisterForApprovalsChangeNotification()()
{
  sub_23A738D80();
  sub_23A73BD78();
  swift_bridgeObjectRelease();
  xpc_set_event();
  swift_release();
}

uint64_t DriverKitDaemonClient.getApprovalStateForSettings(_:)(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t aBlock;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = (void *)sub_23A738A8C();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v17 = sub_23A739DDC;
  v18 = v5;
  v6 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v14 = 1107296256;
  v15 = sub_23A7391B4;
  v16 = &block_descriptor_6;
  v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v8 = objc_msgSend(v4, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);

  sub_23A73BEF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F78);
  swift_dynamicCast();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v17 = sub_23A739DE4;
  v18 = v9;
  aBlock = v6;
  v14 = 1107296256;
  v15 = sub_23A7399E4;
  v16 = &block_descriptor_12;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_getApprovalStateForSettingsWithReplyBlock_, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

uint64_t DriverKitDaemonClient.enqueueApprovalStateUpdate(request:)(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  void (*v21)(void *);
  uint64_t v22;

  v3 = (void *)sub_23A738A8C();
  v21 = sub_23A739DEC;
  v22 = a1;
  aBlock = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_23A7391B4;
  v20 = &block_descriptor_15;
  v4 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v5 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_23A73BEF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F78);
  swift_dynamicCast();
  sub_23A73BBC8();
  swift_allocObject();
  sub_23A73BBBC();
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  aBlock = *(_QWORD *)(a1 + 16);
  v18 = v6;
  v19 = (void (*)(uint64_t, void *))v7;
  v20 = (void *)v8;
  LOBYTE(v21) = v9;
  swift_bridgeObjectRetain();
  sub_23A72A29C(v7, v8);
  sub_23A72CDC8();
  v10 = sub_23A73BBB0();
  v12 = v11;
  swift_bridgeObjectRelease();
  sub_23A729B18(v7, v8);
  if (v1)
  {
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    swift_release();
    v14 = (void *)sub_23A73BBF8();
    v21 = sub_23A739DF4;
    v22 = a1;
    aBlock = MEMORY[0x24BDAC760];
    v18 = 1107296256;
    v19 = sub_23A739BD0;
    v20 = &block_descriptor_18;
    v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_enqueueApprovalStateUpdateWithEntry_replyBlock_, v14, v15);
    _Block_release(v15);

    sub_23A7205E4(v10, v12);
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_23A738A8C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t result;
  uint64_t aBlock;
  uint64_t v15;
  uint64_t (*v16)();
  void *v17;
  uint64_t (*v18)();
  uint64_t v19;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
LABEL_5:
    v12 = v1;
    return (uint64_t)v2;
  }
  v3 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v4 = (void *)sub_23A73BD48();
  v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 4096);

  v18 = sub_23A738CB8;
  v19 = 0;
  v6 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_23A72E9BC;
  v17 = &block_descriptor_47;
  v7 = _Block_copy(&aBlock);
  objc_msgSend(v5, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  v18 = sub_23A738CB8;
  v19 = 0;
  aBlock = v6;
  v15 = 1107296256;
  v16 = sub_23A72E9BC;
  v17 = &block_descriptor_50;
  v8 = _Block_copy(&aBlock);
  objc_msgSend(v5, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  v9 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569B8760);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v9);

  v10 = objc_msgSend(v5, sel_remoteObjectInterface);
  if (v10)
  {
    objc_msgSend(v5, sel_resume);
    v11 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v5;
    v2 = v5;

    v1 = 0;
    goto LABEL_5;
  }
  result = sub_23A73BFB8();
  __break(1u);
  return result;
}

void sub_23A738CBC()
{
  uint64_t v0;
  id v1;

  __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A73C950;
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 64) = sub_23A7367D8();
  *(_QWORD *)(v0 + 32) = 0xD000000000000022;
  *(_QWORD *)(v0 + 40) = 0x800000023A740080;
  sub_23A739F60();
  v1 = (id)sub_23A73BEC8();
  sub_23A73BE74();
  sub_23A73BC58();
  swift_bridgeObjectRelease();

}

unint64_t sub_23A738D80()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 32))
  {
    v1 = *(_QWORD *)(v0 + 24);
  }
  else
  {
    v1 = sub_23A738DE8();
    *(_QWORD *)(v0 + 24) = v1;
    *(_QWORD *)(v0 + 32) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_23A738DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_23A73BC4C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_23A73BF1C();
  swift_bridgeObjectRelease();
  v5 = 0xD00000000000002BLL;
  v6 = 0x800000023A7402D0;
  sub_23A73BC40();
  sub_23A739FE0();
  sub_23A73C09C();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

_QWORD *DriverKitDaemonClient.init()()
{
  _QWORD *v0;
  _QWORD *result;

  result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DriverKitDaemonClient.dumpState()()
{
  uint64_t v0;
  void **v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void **v11;
  Swift::String_optional result;
  void *v13;
  uint64_t aBlock;
  uint64_t v15;
  void *v16;
  void *v17;
  void (*v18)(void *);
  uint64_t v19;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  v1 = (void **)(v0 + 16);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  v3 = (void *)sub_23A738A8C();
  v18 = sub_23A739E44;
  v19 = v0;
  v4 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_23A7391B4;
  v17 = &block_descriptor_27;
  v5 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v6 = objc_msgSend(v3, sel_synchronousRemoteObjectProxyWithErrorHandler_, v5);
  _Block_release(v5);

  sub_23A73BEF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F78);
  if (swift_dynamicCast())
  {
    v7 = v13;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v0;
    *(_QWORD *)(v8 + 24) = v2;
    v18 = (void (*)(void *))sub_23A73A058;
    v19 = v8;
    aBlock = v4;
    v15 = 1107296256;
    v16 = sub_23A739204;
    v17 = &block_descriptor_33;
    v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_dumpStateWithReplyBlock_, v9);
    _Block_release(v9);
    swift_beginAccess();
    v1 = *(void ***)(v0 + 16);
    if (v1)
    {
      v1;
      swift_willThrow();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_beginAccess();
      v7 = *(void **)(v2 + 16);
      v1 = *(void ***)(v2 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_beginAccess();
    v7 = *v1;
    if (*v1)
      v7;
    else
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1540]), sel_init);
    swift_willThrow();
    swift_release();
    swift_release();
  }
  v10 = (uint64_t)v7;
  v11 = v1;
  result.value._object = v11;
  result.value._countAndFlagsBits = v10;
  return result;
}

void sub_23A7391B4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23A739204(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v5 = sub_23A73BD54();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DriverKitDaemonClient.launchDriver(bundleID:userServerName:tag:)(Swift::String bundleID, Swift::String userServerName, Swift::String_optional tag)
{
  void *object;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Swift::String_optional result;
  void *v18;
  uint64_t aBlock;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  object = tag.value._object;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = (void **)(v4 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  v7 = (void *)sub_23A738A8C();
  v23 = sub_23A739E44;
  v24 = v4;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_23A7391B4;
  v22 = &block_descriptor_38;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v7, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_23A73BEF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F78);
  if (swift_dynamicCast())
  {
    v7 = v18;
    v10 = (void *)sub_23A73BD48();
    v11 = (void *)sub_23A73BD48();
    if (object)
      object = (void *)sub_23A73BD48();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v4;
    *(_QWORD *)(v12 + 24) = v6;
    v23 = sub_23A739E90;
    v24 = v12;
    aBlock = MEMORY[0x24BDAC760];
    v20 = 1107296256;
    v21 = sub_23A739204;
    v22 = &block_descriptor_44;
    v13 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v18, sel_launchDriverWithBundleID_userServerName_tag_replyBlock_, v10, v11, object, v13);
    _Block_release(v13);

    swift_beginAccess();
    v14 = *(void **)(v4 + 16);
    if (v14)
    {
      v14;
      swift_willThrow();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_beginAccess();
      v14 = *(void **)(v6 + 16);
      v7 = *(void **)(v6 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_beginAccess();
    v14 = *v5;
    if (*v5)
      v14;
    else
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1540]), sel_init);
    swift_willThrow();
    swift_release();
    swift_release();
  }
  v15 = (uint64_t)v14;
  v16 = v7;
  result.value._object = v16;
  result.value._countAndFlagsBits = v15;
  return result;
}

void sub_23A7395C0(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  sub_23A73BE68();
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23A73C950;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4810);
  v6 = sub_23A73BD6C();
  v8 = v7;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_23A7367D8();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v8;
  sub_23A739F60();
  v9 = (void *)sub_23A73BEC8();
  sub_23A73BC64();
  swift_bridgeObjectRelease();

  v10 = sub_23A73BBD4();
  swift_beginAccess();
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v10;

}

uint64_t sub_23A7396EC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  id v11;

  swift_beginAccess();
  v10 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a3;
  v11 = a3;

  swift_beginAccess();
  *(_QWORD *)(a5 + 16) = a1;
  *(_QWORD *)(a5 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A73978C(void *a1, uint64_t (*a2)(void *, uint64_t))
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  sub_23A73BE68();
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23A73C950;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4810);
  v6 = sub_23A73BD6C();
  v8 = v7;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_23A7367D8();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v8;
  sub_23A739F60();
  v9 = (void *)sub_23A73BEC8();
  sub_23A73BC64();
  swift_bridgeObjectRelease();

  return a2(a1, 1);
}

void sub_23A73989C(uint64_t a1, unint64_t a2, void *a3, void (*a4)(id, uint64_t))
{
  id v8;
  id v9;
  void *v10;

  if (a2 >> 60 == 15)
  {
    if (a3)
      v9 = a3;
    else
      v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1540]), sel_init);
    v8 = a3;
    a4(v9, 1);

  }
  else
  {
    sub_23A73BBA4();
    swift_allocObject();
    sub_23A720478(a1, a2);
    sub_23A73BB98();
    sub_23A739F9C();
    sub_23A73BB8C();
    swift_release();
    a4(v10, 0);
    sub_23A729B18(a1, a2);
    sub_23A736C34(v10, 0);
  }
}

uint64_t sub_23A7399E4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_23A73BC04();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_23A729B18((uint64_t)v4, v8);
  return swift_release();
}

void sub_23A739A78(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void *, uint64_t);
  void *v11;

  sub_23A73BE68();
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23A73C950;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4810);
  v6 = sub_23A73BD6C();
  v8 = v7;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_23A7367D8();
  *(_QWORD *)(v4 + 32) = v6;
  *(_QWORD *)(v4 + 40) = v8;
  sub_23A739F60();
  v9 = (void *)sub_23A73BEC8();
  sub_23A73BC64();
  swift_bridgeObjectRelease();

  v10 = *(void (**)(void *, uint64_t))(a2 + 56);
  v11 = (void *)sub_23A73BBD4();
  v10(v11, 1);

}

void sub_23A739B88(void *a1, uint64_t a2)
{
  _BOOL8 v3;
  void (*v4)(void *, _BOOL8);
  id v5;

  v3 = a1 != 0;
  v4 = *(void (**)(void *, _BOOL8))(a2 + 56);
  v5 = a1;
  v4(a1, v3);
  sub_23A736DE0(a1, v3);
}

void sub_23A739BD0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_23A739C24(void *a1, void (*a2)(void))
{
  uint64_t v4;
  id v5;

  if (xpc_dictionary_get_BOOL(a1, "com.apple.driverkitd.DriverApprovalsChanged"))
  {
    a2();
  }
  else if (xpc_dictionary_create_reply(a1))
  {
    xpc_dictionary_send_reply();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_23A73BE68();
    __swift_instantiateConcreteTypeFromMangledName(qword_2542D30B0);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23A73C950;
    *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v4 + 64) = sub_23A7367D8();
    *(_QWORD *)(v4 + 32) = 0xD00000000000002BLL;
    *(_QWORD *)(v4 + 40) = 0x800000023A73F990;
    sub_23A739F60();
    v5 = (id)sub_23A73BEC8();
    sub_23A73BC64();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_23A739D50()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23A739D74(void *a1)
{
  uint64_t v1;

  sub_23A739C24(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_23A739D7C(uint64_t a1)
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

uint64_t sub_23A739DDC(void *a1)
{
  uint64_t v1;

  return sub_23A73978C(a1, *(uint64_t (**)(void *, uint64_t))(v1 + 16));
}

void sub_23A739DE4(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_23A73989C(a1, a2, a3, *(void (**)(id, uint64_t))(v3 + 16));
}

void sub_23A739DEC(void *a1)
{
  uint64_t v1;

  sub_23A739A78(a1, v1);
}

void sub_23A739DF4(void *a1)
{
  uint64_t v1;

  sub_23A739B88(a1, v1);
}

uint64_t sub_23A739DFC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A739E20()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23A739E44(void *a1)
{
  uint64_t v1;

  sub_23A7395C0(a1, v1);
}

uint64_t objectdestroy_29Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A739E90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_23A7396EC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t DriverKitDaemonClient.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DriverKitDaemonClient.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DriverKitDaemonClient()
{
  return objc_opt_self();
}

uint64_t sub_23A739F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D2F40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A739F60()
{
  unint64_t result;

  result = qword_2542D3098;
  if (!qword_2542D3098)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D3098);
  }
  return result;
}

unint64_t sub_23A739F9C()
{
  unint64_t result;

  result = qword_2542D2FF8;
  if (!qword_2542D2FF8)
  {
    result = MEMORY[0x23B855DA4](&protocol conformance descriptor for ApprovalSettingsState, &type metadata for ApprovalSettingsState);
    atomic_store(result, (unint64_t *)&qword_2542D2FF8);
  }
  return result;
}

unint64_t sub_23A739FE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D2F48;
  if (!qword_2542D2F48)
  {
    v1 = sub_23A73BC4C();
    result = MEMORY[0x23B855DA4](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2542D2F48);
  }
  return result;
}

uint64_t DriverApprovalState.approvalState.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t DriverApprovalState.approvalState.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_23A73BCDC();
}

uint64_t DriverApprovalState.updateStatus.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_23A73BCDC();
}

uint64_t DriverApprovalState.driver.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23A73A510(v1 + OBJC_IVAR____SwiftDriverApprovalState_driver, a1);
}

uint64_t property wrapper backing initializer of DriverApprovalState.approvalState()
{
  return sub_23A73BCA0();
}

uint64_t sub_23A73A204@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23A73A284(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_23A73BCDC();
}

uint64_t (*DriverApprovalState.approvalState.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23A73BCC4();
  return sub_23A73A36C;
}

uint64_t DriverApprovalState.$approvalState.getter()
{
  return sub_23A73A62C((uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__approvalState, &qword_2569B4840);
}

uint64_t DriverApprovalState.$approvalState.setter(uint64_t a1)
{
  return sub_23A73A6AC(a1, &qword_2569B4848, (uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__approvalState, &qword_2569B4840);
}

uint64_t (*DriverApprovalState.$approvalState.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4848);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SwiftDriverApprovalState__approvalState;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4840);
  sub_23A73BCAC();
  swift_endAccess();
  return sub_23A73A468;
}

uint64_t property wrapper backing initializer of DriverApprovalState.updateStatus()
{
  return sub_23A73BCA0();
}

uint64_t DriverApprovalState.updateStatus.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23A73A510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DriverKitDriver();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t (*DriverApprovalState.updateStatus.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23A73BCC4();
  return sub_23A73A36C;
}

void sub_23A73A5CC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t DriverApprovalState.$updateStatus.getter()
{
  return sub_23A73A62C((uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__updateStatus, &qword_2569B4850);
}

uint64_t sub_23A73A62C(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_23A73BCAC();
  return swift_endAccess();
}

uint64_t DriverApprovalState.$updateStatus.setter(uint64_t a1)
{
  return sub_23A73A6AC(a1, &qword_2569B4858, (uint64_t)&OBJC_IVAR____SwiftDriverApprovalState__updateStatus, &qword_2569B4850);
}

uint64_t sub_23A73A6AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_23A73BCB8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*DriverApprovalState.$updateStatus.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4858);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____SwiftDriverApprovalState__updateStatus;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4850);
  sub_23A73BCAC();
  swift_endAccess();
  return sub_23A73A468;
}

void sub_23A73A84C(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_23A73BCB8();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_23A73BCB8();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t DriverApprovalState.displayName.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  v2 = (uint64_t *)((char *)v1 + *(int *)(type metadata accessor for DriverKitDriver() + 24));
  if (v2[1])
  {
    v3 = *v2;
  }
  else
  {
    v3 = *v1;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t DriverApprovalState.usageText.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____SwiftDriverApprovalState_driver;
  v2 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for DriverKitDriver() + 28));
  swift_bridgeObjectRetain();
  return v2;
}

Swift::Bool __swiftcall DriverApprovalState.updatePending()()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  if (v1)
    swift_release();
  return v1 != 0;
}

Swift::Bool __swiftcall DriverApprovalState.driverIsApproved()()
{
  int v0;
  unsigned __int8 v2;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A73BCD0();
  swift_release();
  swift_release();
  if (v3)
  {
    v0 = *(unsigned __int8 *)(v3 + 48);
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23A73BCD0();
    swift_release();
    swift_release();
    v0 = v2;
  }
  return v0 == 1;
}

Swift::String __swiftcall DriverApprovalState.bundleIdentifier()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  v2 = *(void **)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver + 8);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

id DriverApprovalState.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DriverApprovalState.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DriverApprovalState.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DriverApprovalState.id.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  swift_bridgeObjectRetain();
  sub_23A73BDA8();
  type metadata accessor for DriverKitDriver();
  DriverKitDriverSource.description.getter();
  sub_23A73BDA8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23A73AF30()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_23A73AF3C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(*v1 + OBJC_IVAR____SwiftDriverApprovalState_driver);
  v5 = *v3;
  v6 = v3[1];
  swift_bridgeObjectRetain();
  sub_23A73BDA8();
  type metadata accessor for DriverKitDriver();
  DriverKitDriverSource.description.getter();
  sub_23A73BDA8();
  result = swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v6;
  return result;
}

uint64_t sub_23A73AFC8()
{
  return type metadata accessor for DriverApprovalState();
}

uint64_t type metadata accessor for DriverApprovalState()
{
  uint64_t result;

  result = qword_2542D2F60;
  if (!qword_2542D2F60)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A73B00C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for DriverKitDriver();
  if (v0 <= 0x3F)
  {
    sub_23A73B0CC(319, &qword_2542D3028);
    if (v1 <= 0x3F)
    {
      sub_23A73B0CC(319, &qword_2542D3030);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_23A73B0CC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23A73BCE8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_23A73B110(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DriverKitDriver();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SettingsApplicationRecord.init(bundleIdentifier:url:uniqueInstallIdentifier:driverExtensionPaths:installSessionIdentifier:localizedName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  int *v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;

  *a9 = a1;
  a9[1] = a2;
  v17 = (int *)type metadata accessor for SettingsApplicationRecord();
  v18 = (char *)a9 + v17[5];
  v19 = sub_23A73BBEC();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18, a3, v19);
  v21 = (_QWORD *)((char *)a9 + v17[6]);
  *v21 = a4;
  v21[1] = a5;
  *(_QWORD *)((char *)a9 + v17[7]) = a6;
  v22 = (_QWORD *)((char *)a9 + v17[8]);
  *v22 = a7;
  v22[1] = a8;
  v23 = (_QWORD *)((char *)a9 + v17[9]);
  *v23 = a10;
  v23[1] = a11;
  return result;
}

uint64_t type metadata accessor for SettingsApplicationRecord()
{
  uint64_t result;

  result = qword_2542D3000;
  if (!qword_2542D3000)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SettingsApplicationRecord.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingsApplicationRecord.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 20);
  v4 = sub_23A73BBEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SettingsApplicationRecord.uniqueInstallIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 24);
  v2 = *(_QWORD *)v1;
  sub_23A72A29C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t SettingsApplicationRecord.driverExtensionPaths.getter()
{
  type metadata accessor for SettingsApplicationRecord();
  return swift_bridgeObjectRetain();
}

uint64_t SettingsApplicationRecord.installSessionIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 32);
  v2 = *(_QWORD *)v1;
  sub_23A720478(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t SettingsApplicationRecord.localizedName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SettingsApplicationRecord() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t *initializeBufferWithCopyOfBuffer for SettingsApplicationRecord(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23A73BBEC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = *((_QWORD *)v15 + 1);
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
    else
    {
      v18 = *(_QWORD *)v15;
      sub_23A720478(*(_QWORD *)v15, *((_QWORD *)v15 + 1));
      *(_QWORD *)v14 = v18;
      *((_QWORD *)v14 + 1) = v16;
    }
    v19 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v20 = (uint64_t *)((char *)v4 + v19);
    v21 = *(uint64_t *)((char *)a2 + v19);
    v22 = *(uint64_t *)((char *)a2 + v19 + 8);
    swift_bridgeObjectRetain();
    sub_23A720478(v21, v22);
    *v20 = v21;
    v20[1] = v22;
    v23 = a3[9];
    v24 = (uint64_t *)((char *)v4 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for SettingsApplicationRecord(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_23A73BBEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (uint64_t *)(a1 + a2[6]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_23A7205E4(*v6, v7);
  swift_bridgeObjectRelease();
  sub_23A7205E4(*(_QWORD *)(a1 + a2[8]), *(_QWORD *)(a1 + a2[8] + 8));
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SettingsApplicationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A73BBEC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *((_QWORD *)v14 + 1);
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v16 = *(_QWORD *)v14;
    sub_23A720478(*(_QWORD *)v14, *((_QWORD *)v14 + 1));
    *(_QWORD *)v13 = v16;
    *((_QWORD *)v13 + 1) = v15;
  }
  v17 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = *(_QWORD *)((char *)a2 + v17);
  v20 = *(_QWORD *)((char *)a2 + v17 + 8);
  swift_bridgeObjectRetain();
  sub_23A720478(v19, v20);
  *v18 = v19;
  v18[1] = v20;
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SettingsApplicationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A73BBEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *(_QWORD *)((char *)a2 + v10 + 8);
  if (*(_QWORD *)((char *)a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      v15 = *v12;
      sub_23A720478(v15, v13);
      v16 = *v11;
      v17 = v11[1];
      *v11 = v15;
      v11[1] = v13;
      sub_23A7205E4(v16, v17);
      goto LABEL_8;
    }
    sub_23A73B7DC((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  v14 = *v12;
  sub_23A720478(v14, v13);
  *v11 = v14;
  v11[1] = v13;
LABEL_8:
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v21 = *v20;
  v22 = v20[1];
  sub_23A720478(*v20, v22);
  v23 = *v19;
  v24 = v19[1];
  *v19 = v21;
  v19[1] = v22;
  sub_23A7205E4(v23, v24);
  v25 = a3[9];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A73B7DC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

_OWORD *initializeWithTake for SettingsApplicationRecord(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A73BBEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

_QWORD *assignWithTake for SettingsApplicationRecord(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23A73BBEC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = *(_QWORD *)((char *)a1 + v11 + 8);
  if (v14 >> 60 != 15)
  {
    v15 = v13[1];
    if (v15 >> 60 != 15)
    {
      v16 = *v12;
      *v12 = *v13;
      v12[1] = v15;
      sub_23A7205E4(v16, v14);
      goto LABEL_6;
    }
    sub_23A73B7DC((uint64_t)v12);
  }
  *(_OWORD *)v12 = *(_OWORD *)v13;
LABEL_6:
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  v17 = a3[8];
  v18 = *(_QWORD *)((char *)a1 + v17);
  v19 = *(_QWORD *)((char *)a1 + v17 + 8);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  sub_23A7205E4(v18, v19);
  v20 = a3[9];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsApplicationRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A73B9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A73BBEC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsApplicationRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A73BA4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A73BBEC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A73BACC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A73BBEC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A73BB68()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A73BB74()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A73BB80()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A73BB8C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23A73BB98()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23A73BBA4()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23A73BBB0()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23A73BBBC()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23A73BBC8()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23A73BBD4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A73BBE0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A73BBEC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A73BBF8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A73BC04()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A73BC10()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23A73BC1C()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23A73BC28()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23A73BC34()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A73BC40()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A73BC4C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A73BC58()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_23A73BC64()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23A73BC70()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_23A73BC7C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_23A73BC88()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23A73BC94()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23A73BCA0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23A73BCAC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23A73BCB8()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_23A73BCC4()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_23A73BCD0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23A73BCDC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23A73BCE8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23A73BCF4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A73BD00()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A73BD0C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A73BD18()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_23A73BD24()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_23A73BD30()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A73BD3C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A73BD48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A73BD54()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A73BD60()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23A73BD6C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A73BD78()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A73BD84()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23A73BD90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A73BD9C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23A73BDA8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A73BDB4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A73BDC0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23A73BDCC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23A73BDD8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23A73BDE4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23A73BDF0()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23A73BDFC()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23A73BE08()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A73BE14()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A73BE20()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A73BE2C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A73BE38()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A73BE44()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A73BE50()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A73BE5C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A73BE68()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A73BE74()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A73BE80()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23A73BE8C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23A73BE98()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23A73BEA4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A73BEB0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23A73BEBC()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_23A73BEC8()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_23A73BED4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A73BEE0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A73BEEC()
{
  return MEMORY[0x24BDD0510]();
}

uint64_t sub_23A73BEF8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A73BF04()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A73BF10()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_23A73BF1C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A73BF28()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A73BF34()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A73BF40()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A73BF4C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A73BF58()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A73BF64()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A73BF70()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_23A73BF7C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A73BF88()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A73BF94()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A73BFA0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A73BFAC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A73BFB8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A73BFC4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A73BFD0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A73BFDC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A73BFE8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A73BFF4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A73C000()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A73C00C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A73C018()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23A73C024()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A73C030()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23A73C03C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A73C048()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A73C054()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A73C060()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23A73C06C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A73C078()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23A73C084()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A73C090()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A73C09C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A73C0A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A73C0B4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A73C0C0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A73C0CC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A73C0D8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A73C0E4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A73C0F0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A73C0FC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A73C108()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23A73C114()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A73C120()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A73C12C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A73C138()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A73C144()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}


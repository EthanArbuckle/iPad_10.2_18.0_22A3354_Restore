uint64_t DMCApp.bundleID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.bundleID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DMCApp.bundleID.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.originator.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.originator.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DMCApp.originator.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.sourceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.sourceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*DMCApp.sourceID.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DMCApp.attributes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*DMCApp.attributes.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.installSource.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for DMCApp() + 32);
  return sub_23A1BCBAC(v3, a1);
}

uint64_t type metadata accessor for DMCApp()
{
  uint64_t result;

  result = qword_25694F770;
  if (!qword_25694F770)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A1BCBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8439A4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t DMCApp.installSource.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for DMCApp() + 32);
  return sub_23A1BCC64(a1, v3);
}

uint64_t sub_23A1BCC64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*DMCApp.installSource.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t DMCApp.installBehavior.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DMCApp();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t DMCApp.installBehavior.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for DMCApp();
  *(_BYTE *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*DMCApp.installBehavior.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t DMCApp.updateBehavior.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DMCApp();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t DMCApp.updateBehavior.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for DMCApp();
  *(_BYTE *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

uint64_t (*DMCApp.updateBehavior.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t DMCApp.backupBehavior.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DMCApp();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t DMCApp.backupBehavior.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for DMCApp();
  *(_BYTE *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*DMCApp.backupBehavior.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t DMCApp.removeBehavior.getter@<X0>(_WORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DMCApp();
  *a1 = *(_WORD *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t DMCApp.removeBehavior.setter(__int16 *a1)
{
  uint64_t v1;
  __int16 v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for DMCApp();
  *(_WORD *)(v1 + *(int *)(result + 48)) = v2;
  return result;
}

uint64_t (*DMCApp.removeBehavior.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t DMCApp.documentSyncBehavior.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DMCApp();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 52));
  return result;
}

uint64_t DMCApp.documentSyncBehavior.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for DMCApp();
  *(_BYTE *)(v1 + *(int *)(result + 52)) = v2;
  return result;
}

uint64_t (*DMCApp.documentSyncBehavior.modify())()
{
  type metadata accessor for DMCApp();
  return nullsub_1;
}

uint64_t sub_23A1BCF68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, char *a10, char *a11, char *a12, __int16 *a13, char *a14)
{
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char v27;
  __int16 v28;
  char v29;
  char v30;
  char v31;

  v30 = *a11;
  v31 = *a10;
  v28 = *a13;
  v29 = *a12;
  v27 = *a14;
  v18 = (int *)type metadata accessor for DMCApp();
  v19 = (uint64_t)a9 + v18[8];
  v20 = type metadata accessor for InstallSource(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  v21 = v18[9];
  *((_BYTE *)a9 + v21) = 3;
  v22 = v18[10];
  *((_BYTE *)a9 + v22) = 2;
  v23 = v18[11];
  *((_BYTE *)a9 + v23) = 2;
  v24 = v18[12];
  *(_WORD *)((char *)a9 + v24) = 2;
  v25 = v18[13];
  *((_BYTE *)a9 + v25) = 2;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  result = sub_23A1BCC64(a8, v19);
  *((_BYTE *)a9 + v21) = v31;
  *((_BYTE *)a9 + v22) = v30;
  *((_BYTE *)a9 + v23) = v29;
  *(_WORD *)((char *)a9 + v24) = v28;
  *((_BYTE *)a9 + v25) = v27;
  return result;
}

uint64_t DMCApp.init(bundleID:originator:sourceID:attributes:backupBehavior:removeBehavior:documentSyncBehavior:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _BYTE *a8@<X7>, _QWORD *a9@<X8>, __int16 *a10, char *a11)
{
  uint64_t v18;
  char *v19;
  __int16 v20;
  char v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int16 v28;
  char v29;
  char v30;
  char v31;

  v25 = a6;
  v26 = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a8) = *a8;
  v20 = *a10;
  v21 = *a11;
  v22 = type metadata accessor for InstallSource(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 1, 1, v22);
  v31 = 3;
  v30 = 2;
  v29 = (char)a8;
  v28 = v20;
  v27 = v21;
  return sub_23A1BCF68(a1, a2, a3, a4, a5, v25, v26, (uint64_t)v19, a9, &v31, &v30, &v29, &v28, &v27);
}

uint64_t sub_23A1BD1DC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A1BD208(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_23A1BD23C())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD24C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A1BD278(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_23A1BD2AC())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD2BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A1BD2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_23A1BD31C())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD32C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A1BD334(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_23A1BD35C())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD36C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23A1BCBAC(v2 + *(int *)(a1 + 32), a2);
}

uint64_t sub_23A1BD37C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A1BCC64(a1, v2 + *(int *)(a2 + 32));
}

uint64_t (*sub_23A1BD388())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD39C@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 36));
  return result;
}

_BYTE *sub_23A1BD3AC(_BYTE *result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 36)) = *result;
  return result;
}

uint64_t (*sub_23A1BD3BC())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD3D0@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 40));
  return result;
}

_BYTE *sub_23A1BD3E0(_BYTE *result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 40)) = *result;
  return result;
}

uint64_t (*sub_23A1BD3F0())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD404@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 44));
  return result;
}

_BYTE *sub_23A1BD414(_BYTE *result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 44)) = *result;
  return result;
}

uint64_t (*sub_23A1BD424())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD438@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_WORD *)(v2 + *(int *)(result + 48));
  return result;
}

_WORD *sub_23A1BD448(_WORD *result, uint64_t a2)
{
  uint64_t v2;

  *(_WORD *)(v2 + *(int *)(a2 + 48)) = *result;
  return result;
}

uint64_t (*sub_23A1BD458())()
{
  return nullsub_1;
}

uint64_t sub_23A1BD46C@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 52));
  return result;
}

_BYTE *sub_23A1BD47C(_BYTE *result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + *(int *)(a2 + 52)) = *result;
  return result;
}

uint64_t (*sub_23A1BD48C())()
{
  return nullsub_1;
}

_QWORD *initializeBufferWithCopyOfBuffer for DMCApp(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a3[8];
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[6] = a2[6];
    v12 = type metadata accessor for InstallSource(0);
    v21 = *(_QWORD *)(v12 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v17 = sub_23A1CD11C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(__dst, v11, v17);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      __dst[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v12);
    }
    v18 = a3[10];
    *((_BYTE *)v4 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *((_BYTE *)v4 + v18) = *((_BYTE *)a2 + v18);
    v19 = a3[12];
    *((_BYTE *)v4 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    *(_WORD *)((char *)v4 + v19) = *(_WORD *)((char *)a2 + v19);
    *((_BYTE *)v4 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  }
  return v4;
}

uint64_t destroy for DMCApp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for InstallSource(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if (!(_DWORD)result)
  {
    type metadata accessor for StoreSource(0);
    result = swift_getEnumCaseMultiPayload();
    if ((_DWORD)result == 2)
    {
      v7 = sub_23A1CD11C();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
    }
  }
  return result;
}

_QWORD *initializeWithCopy for DMCApp(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char *__dst;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a3[8];
  __dst = (char *)a1 + v9;
  v10 = (char *)a2 + v9;
  a1[6] = a2[6];
  v11 = type metadata accessor for InstallSource(0);
  v19 = *(_QWORD *)(v11 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v15 = sub_23A1CD11C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(__dst, v10, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    __dst[*(int *)(v11 + 20)] = v10[*(int *)(v11 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v11);
  }
  v16 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
  v17 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + v17) = *(_WORD *)((char *)a2 + v17);
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  return a1;
}

_QWORD *assignWithCopy for DMCApp(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for InstallSource(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      v14 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v15 = sub_23A1CD11C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v7, v8, v15);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      v7[*(int *)(v9 + 20)] = v8[*(int *)(v9 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_15;
    }
LABEL_7:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_15;
  }
  if (v13)
  {
    sub_23A1BDB84((uint64_t)v7, type metadata accessor for InstallSource);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23A1BDB84((uint64_t)v7, type metadata accessor for StoreSource);
    v17 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v18 = sub_23A1CD11C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v7, v8, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
  }
  v7[*(int *)(v9 + 20)] = v8[*(int *)(v9 + 20)];
LABEL_15:
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + a3[12]) = *(_WORD *)((char *)a2 + a3[12]);
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  return a1;
}

uint64_t sub_23A1BDB84(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for DMCApp(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[8];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for InstallSource(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v14 = sub_23A1CD11C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v8, v9, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    *((_BYTE *)v8 + *(int *)(v10 + 20)) = *((_BYTE *)v9 + *(int *)(v10 + 20));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v15 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_WORD *)(a1 + v16) = *(_WORD *)(a2 + v16);
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  return a1;
}

_QWORD *assignWithTake for DMCApp(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

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
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  v9 = a3[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for InstallSource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      v17 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v18 = sub_23A1CD11C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v10, v11, v18);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_15;
    }
LABEL_7:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_15;
  }
  if (v16)
  {
    sub_23A1BDB84((uint64_t)v10, type metadata accessor for InstallSource);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_23A1BDB84((uint64_t)v10, type metadata accessor for StoreSource);
    v20 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v21 = sub_23A1CD11C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v10, v11, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
  }
  v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
LABEL_15:
  v22 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
  v23 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + v23) = *(_WORD *)((char *)a2 + v23);
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCApp()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1BDF98(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DMCApp()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1BE024(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_23A1BE09C()
{
  unint64_t v0;

  sub_23A1BE144();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23A1BE144()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25694F780)
  {
    type metadata accessor for InstallSource(255);
    v0 = sub_23A1CD1C4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25694F780);
  }
}

BOOL static InstallWhen.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t InstallWhen.hash(into:)()
{
  return sub_23A1CD2CC();
}

BOOL sub_23A1BE1D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A1BE1F0()
{
  return sub_23A1CD2CC();
}

uint64_t _s7DMCApps11InstallWhenO9hashValueSivg_0()
{
  sub_23A1CD2C0();
  sub_23A1CD2CC();
  return sub_23A1CD2D8();
}

uint64_t sub_23A1BE264()
{
  sub_23A1CD2C0();
  sub_23A1CD2CC();
  return sub_23A1CD2D8();
}

uint64_t InstallSource.init(storeSource:vppType:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t result;

  v5 = *a2;
  v6 = *(int *)(type metadata accessor for InstallSource(0) + 20);
  result = sub_23A1BE300(a1, a3);
  *(_BYTE *)(a3 + v6) = v5;
  return result;
}

uint64_t type metadata accessor for InstallSource(uint64_t a1)
{
  return sub_23A1BE358(a1, qword_25694F8E0);
}

uint64_t sub_23A1BE300(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StoreSource(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for StoreSource(uint64_t a1)
{
  return sub_23A1BE358(a1, qword_25694F850);
}

uint64_t sub_23A1BE358(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

DMCApps::InstallBehavior __swiftcall InstallBehavior.init(installWhen:)(DMCApps::InstallBehavior installWhen)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)installWhen.installWhen;
  return installWhen;
}

DMCApps::BackupBehavior __swiftcall BackupBehavior.init(backupAppData:)(DMCApps::BackupBehavior backupAppData)
{
  DMCApps::BackupBehavior *v1;

  v1->backupAppData = backupAppData.backupAppData;
  return backupAppData;
}

DMCApps::RemoveBehavior __swiftcall RemoveBehavior.init(removable:removeKeychainGroupWhenUninstall:)(Swift::Bool removable, Swift::Bool_optional removeKeychainGroupWhenUninstall)
{
  Swift::Bool_optional *v2;
  DMCApps::RemoveBehavior result;

  v2->value = removable;
  v2[1].value = removeKeychainGroupWhenUninstall.value;
  result.removable = removable;
  return result;
}

unint64_t sub_23A1BE3B0()
{
  unint64_t result;

  result = qword_25694F7D0;
  if (!qword_25694F7D0)
  {
    result = MEMORY[0x23B8439B0](&protocol conformance descriptor for InstallWhen, &type metadata for InstallWhen);
    atomic_store(result, (unint64_t *)&qword_25694F7D0);
  }
  return result;
}

unint64_t sub_23A1BE3F8()
{
  unint64_t result;

  result = qword_25694F7D8;
  if (!qword_25694F7D8)
  {
    result = MEMORY[0x23B8439B0](&protocol conformance descriptor for VPPLicenseType, &type metadata for VPPLicenseType);
    atomic_store(result, (unint64_t *)&qword_25694F7D8);
  }
  return result;
}

uint64_t dispatch thunk of DMCAppBase.bundleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppBase.bundleID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DMCAppBase.bundleID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppBase.originator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DMCAppBase.originator.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DMCAppBase.originator.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of DMCAppBackupControl.backupBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppBackupControl.backupBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppRemovalControl.removeBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppRemovalControl.removeBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installSource.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.updateBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.updateBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_23A1BE504(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A1BE50C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InstallWhen()
{
  return &type metadata for InstallWhen;
}

uint64_t *initializeBufferWithCopyOfBuffer for StoreSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else if (swift_getEnumCaseMultiPayload() == 2)
  {
    v7 = sub_23A1CD11C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for StoreSource(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = sub_23A1CD11C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_23A1CD11C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A1BE74C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_23A1CD11C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23A1BE74C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StoreSource(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_23A1CD11C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A1BE74C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_23A1CD11C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for StoreSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for StoreSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A1BE8CC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A1BE8DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A1CD11C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VPPLicenseType()
{
  return &type metadata for VPPLicenseType;
}

uint64_t *initializeBufferWithCopyOfBuffer for InstallSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    v7 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v8 = sub_23A1CD11C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for InstallSource(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for StoreSource(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = sub_23A1CD11C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for StoreSource(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v7 = sub_23A1CD11C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithCopy for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A1BE74C((uint64_t)a1);
    v6 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v7 = sub_23A1CD11C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *initializeWithTake for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for StoreSource(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v7 = sub_23A1CD11C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A1BE74C((uint64_t)a1);
    v6 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v7 = sub_23A1CD11C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallSource()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1BED48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v9;
  unsigned int v10;

  v6 = type metadata accessor for StoreSource(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) <= 3u)
    v9 = 3;
  else
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  v10 = v9 - 3;
  if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) >= 3u)
    return v10;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InstallSource()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1BEDD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for StoreSource(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 3;
  return result;
}

uint64_t sub_23A1BEE50()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for StoreSource(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s7DMCApps14VPPLicenseTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s7DMCApps14VPPLicenseTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1BEF9C + 4 * byte_23A1CD7C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A1BEFD0 + 4 * byte_23A1CD7C0[v4]))();
}

uint64_t sub_23A1BEFD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1BEFD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1BEFE0);
  return result;
}

uint64_t sub_23A1BEFEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1BEFF4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A1BEFF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1BF000(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InstallBehavior()
{
  return &type metadata for InstallBehavior;
}

ValueMetadata *type metadata accessor for BackupBehavior()
{
  return &type metadata for BackupBehavior;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RemoveBehavior(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoveBehavior(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23A1BF130 + 4 * byte_23A1CD7CF[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_23A1BF164 + 4 * byte_23A1CD7CA[v4]))();
}

uint64_t sub_23A1BF164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23A1BF16C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23A1BF174);
  return result;
}

uint64_t sub_23A1BF180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23A1BF188);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A1BF18C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23A1BF194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoveBehavior()
{
  return &type metadata for RemoveBehavior;
}

ValueMetadata *type metadata accessor for UpdateBehavior()
{
  return &type metadata for UpdateBehavior;
}

uint64_t _s7DMCApps14UpdateBehaviorVwet_0(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7DMCApps14UpdateBehaviorVwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1BF2AC + 4 * byte_23A1CD7D9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A1BF2E0 + 4 * byte_23A1CD7D4[v4]))();
}

uint64_t sub_23A1BF2E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1BF2E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1BF2F0);
  return result;
}

uint64_t sub_23A1BF2FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1BF304);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A1BF308(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1BF310(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DocumentSyncBehavior()
{
  return &type metadata for DocumentSyncBehavior;
}

BOOL static DMCAppsScope.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DMCAppsScope.hash(into:)()
{
  return sub_23A1CD2CC();
}

uint64_t DMCAppsScope.hashValue.getter()
{
  sub_23A1CD2C0();
  sub_23A1CD2CC();
  return sub_23A1CD2D8();
}

BOOL sub_23A1BF400(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static DMCAppsClient.makeAppInfo(bundleID:originator:sourceID:attributes:installSource:installBehavior:updateBehavior:backupBehavior:removeBehavior:documentSyncBehavior:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, char *a10, char *a11, char *a12, __int16 *a13, char *a14)
{
  uint64_t v18;
  char *v19;
  char v20;
  char v21;
  char v22;
  __int16 v23;
  char v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int16 v33;
  char v34;
  char v35;
  char v36;

  v27 = a7;
  v28 = a9;
  v30 = a3;
  v31 = a5;
  v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694F710);
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *a10;
  v21 = *a11;
  v22 = *a12;
  v23 = *a13;
  v24 = *a14;
  sub_23A1BCBAC(a8, (uint64_t)v19);
  v36 = v20;
  v35 = v21;
  v34 = v22;
  v33 = v23;
  v32 = v24;
  v25 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23A1BCF68(v29, a2, v30, a4, v31, a6, v25, (uint64_t)v19, v28, &v36, &v35, &v34, &v33, &v32);
}

id DMCAppsClient.init()@<X0>(uint64_t a1@<X8>)
{
  id result;
  id v3;
  uint64_t v4;

  result = objc_msgSend((id)objc_opt_self(), sel_systemConnection);
  if (result)
  {
    v3 = result;
    type metadata accessor for DMCAppsManager();
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    type metadata accessor for DMCAppsManagementStateEvaluator();
    result = (id)swift_allocObject();
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = result;
    *(_BYTE *)(a1 + 16) = 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id DMCAppsClient.init(scope:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  id v4;
  id v5;
  id result;
  uint64_t v7;

  v3 = *a1;
  v4 = (id)objc_opt_self();
  if ((v3 & 1) != 0)
  {
    v4 = objc_msgSend(v4, sel_systemConnection);
    v5 = v4;
    if (v4)
    {
LABEL_5:
      type metadata accessor for DMCAppsManager();
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = v5;
      type metadata accessor for DMCAppsManagementStateEvaluator();
      result = (id)swift_allocObject();
      *(_QWORD *)a2 = v7;
      *(_QWORD *)(a2 + 8) = result;
      *(_BYTE *)(a2 + 16) = v3;
      return result;
    }
    __break(1u);
  }
  result = objc_msgSend(v4, sel_currentUserConnection);
  v5 = result;
  if (result)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t DMCAppsClient.isManaged(bundleID:persona:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A1BF6F4;
  return sub_23A1C30B4(a1, a2);
}

uint64_t sub_23A1BF6F4(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(_BOOL8);
  _BOOL8 v6;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    v5 = *(uint64_t (**)(_BOOL8))(v4 + 8);
    v6 = 0;
  }
  else
  {
    v6 = a1 != 0;
    v5 = *(uint64_t (**)(_BOOL8))(v4 + 8);
  }
  return v5(v6);
}

uint64_t DMCAppsClient.willInstallApplication(_:options:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F928 + dword_25694F928);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1C2B60;
  return v5(a1);
}

uint64_t DMCAppsClient.didInstallApplication(_:options:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F938 + dword_25694F938);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1BF820;
  return v5(a1);
}

uint64_t sub_23A1BF820(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    v5 = 0;
  else
    v5 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t DMCAppsClient.updateApp(_:options:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F948 + dword_25694F948);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1C2B60;
  return v5(a1);
}

uint64_t DMCAppsClient.getUnhideableApps()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A1BF928;
  return sub_23A1C3E10();
}

uint64_t sub_23A1BF928(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t DMCAppsClient.getUnlockableApps()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A1C2B64;
  return sub_23A1C40EC();
}

uint64_t DMCAppsClient.getUnhideableAndUnlockableApps()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A1C2B64;
  return sub_23A1C43C8();
}

uint64_t DMCAppsClient.getUnhideableOrUnlockableApps()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A1C2B64;
  return sub_23A1C4710();
}

uint64_t DMCAppsClient.configurationApplied(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;

  *(_BYTE *)(v4 + 185) = a3;
  *(_QWORD *)(v4 + 80) = a1;
  *(_QWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 96) = *v3;
  return swift_task_switch();
}

uint64_t sub_23A1BFA78()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[11];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[13] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[14] = v5;
  *v5 = v0;
  v5[1] = sub_23A1BFAF8;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1BFAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1BFB60()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((*(_BYTE *)(v0 + 120) & 1) != 0)
  {
    v3 = *(_QWORD **)(v0 + 88);
    v4 = v3[3];
    v5 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    v8 = v7;
    *(_QWORD *)(v0 + 144) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_23A1BFC50;
    return sub_23A1C30B4(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v1 = xmmword_23A1CDA20;
    *(_BYTE *)(v1 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1BFC50(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_BYTE *)(v4 + 186) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_23A1BFCCC()
{
  uint64_t v0;
  int v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v14;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v1 = *(unsigned __int8 *)(v0 + 186);
  v2 = *(_QWORD **)(v0 + 88);
  v3 = v2[3];
  v4 = v2[7];
  __swift_project_boxed_opaque_existential_5Tm(v2, v3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 32))(&v21, v3, v4);
  v5 = v21;
  if (v21 == 3)
  {
    if (*(_BYTE *)(v0 + 185))
    {
      if (!v1)
        goto LABEL_13;
    }
    else if (v1 != 2)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
LABEL_15:
    v8 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v9 + 64);
    v19 = *(_OWORD *)(v9 + 24);
    v11 = *(_QWORD *)(v9 + 24);
    v20 = *(_OWORD *)(v9 + 40);
    v12 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v9, v11);
    *(_OWORD *)(v0 + 40) = v19;
    *(_OWORD *)(v0 + 56) = v20;
    *(_QWORD *)(v0 + 72) = v10;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_4, v12, v11);
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v14;
    *v14 = v0;
    v14[1] = sub_23A1BFEA0;
    return sub_23A1C381C(v0 + 16, v8 & 0x101010100 | 1, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  }
  if ((*(_BYTE *)(v0 + 185) & 1) == 0)
  {
    if (v1 != 2)
    {
      swift_bridgeObjectRelease();
      if (!v5)
      {
        v17 = *(_QWORD **)(v0 + 80);
        v18 = 1;
        if ((*(_QWORD *)(v0 + 120) & 0x100) == 0)
          v18 = 2;
        *v17 = 0;
        v17[1] = v18;
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v1)
    goto LABEL_15;
  swift_bridgeObjectRelease();
  if (!v5)
  {
    v6 = *(_QWORD *)(v0 + 80);
    if ((*(_QWORD *)(v0 + 120) & 0x100000000) != 0)
    {
      *(_OWORD *)v6 = xmmword_23A1CDA30;
    }
    else
    {
      v7 = 3;
      if ((*(_QWORD *)(v0 + 120) & 0x100) != 0)
        v7 = 1;
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(v6 + 8) = v7;
    }
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_17:
  v16 = *(_QWORD **)(v0 + 80);
  *v16 = 0;
  v16[1] = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1BFEA0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_23A1BFF20()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 80) = xmmword_23A1CDA40;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1BFF3C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1BFF78()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.configurationRemoved(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A1BFFC4()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.optionalAppRequested(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;

  *(_BYTE *)(v4 + 97) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = *v3;
  return swift_task_switch();
}

uint64_t sub_23A1BFFFC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[5] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[6] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C007C;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C007C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 56) = a1;
  *(_QWORD *)(v4 + 64) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C00E0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    v3 = *(_QWORD **)(v0 + 24);
    v4 = v3[3];
    v5 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v4);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    v8 = v7;
    *(_QWORD *)(v0 + 72) = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v9;
    *v9 = v0;
    v9[1] = sub_23A1C01D0;
    return sub_23A1C30B4(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v1 = xmmword_23A1CDA20;
    *(_BYTE *)(v1 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1C01D0(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_BYTE *)(v4 + 98) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_23A1C024C()
{
  uint64_t v0;
  int v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;

  v1 = *(unsigned __int8 *)(v0 + 98);
  v2 = *(unsigned __int8 *)(v0 + 97);
  v3 = *(_QWORD **)(v0 + 16);
  v4 = HIDWORD(*(_QWORD *)(v0 + 56)) & 1;
  swift_bridgeObjectRelease();
  if (v1)
    v5 = 0;
  else
    v5 = v2;
  *v3 = 0;
  v3[1] = v5 & v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C02A8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.willInstall(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C0300()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[14];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[16] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[17] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C0380;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C0380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[10] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v4[13] = a3;
  v4[18] = a1;
  v4[19] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C03EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;

  v1 = *(_QWORD *)(v0 + 144);
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v5 + 64);
    v11 = *(_OWORD *)(v5 + 24);
    v7 = *(_QWORD *)(v5 + 24);
    v12 = *(_OWORD *)(v5 + 40);
    v8 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v5, v7);
    *(_OWORD *)(v0 + 40) = v11;
    *(_OWORD *)(v0 + 56) = v12;
    *(_QWORD *)(v0 + 72) = v6;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_4, v8, v7);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v10;
    *v10 = v0;
    v10[1] = sub_23A1C0534;
    return sub_23A1C32FC(v0 + 16, v1 & 0x101010100 | 1, v4, *(_QWORD *)(v0 + 152));
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v2 = xmmword_23A1CDA20;
    *(_BYTE *)(v2 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1C0534()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A1C05C0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.didInstall(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C0610()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[10];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C0690;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C0690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 112) = a1;
  *(_QWORD *)(v4 + 120) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C06F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;

  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v3 + 64);
    v9 = *(_OWORD *)(v3 + 24);
    v5 = *(_QWORD *)(v3 + 24);
    v10 = *(_OWORD *)(v3 + 40);
    v6 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v3, v5);
    *(_OWORD *)(v0 + 40) = v9;
    *(_OWORD *)(v0 + 56) = v10;
    *(_QWORD *)(v0 + 72) = v4;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_4, v6, v5);
    *(_QWORD *)&v10 = (char *)&dword_25694FE20 + dword_25694FE20;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v8;
    *v8 = v0;
    v8[1] = sub_23A1C0828;
    return ((uint64_t (*)(uint64_t))v10)(v0 + 16);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v1 = xmmword_23A1CDA20;
    *(_BYTE *)(v1 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1C0828()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A1C08B4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.willUpdate(_:)()
{
  uint64_t v0;

  return sub_23A1C2568(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DMCAppsClient.didUpdate(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C0914()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[14];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[16] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[17] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C0994;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C0994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[10] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v4[13] = a3;
  v4[18] = a1;
  v4[19] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C0A00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;

  v1 = *(_QWORD *)(v0 + 144);
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v5 + 64);
    v11 = *(_OWORD *)(v5 + 24);
    v7 = *(_QWORD *)(v5 + 24);
    v12 = *(_OWORD *)(v5 + 40);
    v8 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v5, v7);
    *(_OWORD *)(v0 + 40) = v11;
    *(_OWORD *)(v0 + 56) = v12;
    *(_QWORD *)(v0 + 72) = v6;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_4, v8, v7);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v10;
    *v10 = v0;
    v10[1] = sub_23A1C0B48;
    return sub_23A1C381C(v0 + 16, v1 & 0x101010100 | 1, v4, *(_QWORD *)(v0 + 152));
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v2 = xmmword_23A1CDA20;
    *(_BYTE *)(v2 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1C0B48()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t DMCAppsClient.installFailed(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C0BF0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[10];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C0C70;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C0C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)v3 + 112) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C0CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v6;
  __int128 v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 64);
  v8 = *(_OWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 24);
  v9 = *(_OWORD *)(v1 + 40);
  v4 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v1, v3);
  *(_OWORD *)(v0 + 40) = v8;
  *(_OWORD *)(v0 + 56) = v9;
  *(_QWORD *)(v0 + 72) = v2;
  boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_4, v4, v3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v6;
  *v6 = v0;
  v6[1] = sub_23A1C0D84;
  return sub_23A1C6B28(v0 + 16);
}

uint64_t sub_23A1C0D84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t DMCAppsClient.didUninstall(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C0E28()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[10];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C0EA8;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C0EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)v3 + 112) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C0F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_4;
  _QWORD *v6;
  __int128 v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 64);
  v8 = *(_OWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 24);
  v9 = *(_OWORD *)(v1 + 40);
  v4 = __swift_project_boxed_opaque_existential_5Tm((_QWORD *)v1, v3);
  *(_OWORD *)(v0 + 40) = v8;
  *(_OWORD *)(v0 + 56) = v9;
  *(_QWORD *)(v0 + 72) = v2;
  boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_4, v4, v3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v6;
  *v6 = v0;
  v6[1] = sub_23A1C0FBC;
  return sub_23A1C6B28(v0 + 16);
}

uint64_t sub_23A1C0FBC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  __swift_destroy_boxed_opaque_existential_4(v2 + 16);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A1C1044()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.didRemoveConfiguration(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v3;
  return swift_task_switch();
}

uint64_t DMCAppsClient.shouldPromptForInstallConsent(for:)(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A1C10B0()
{
  uint64_t v0;
  id v1;
  unsigned __int8 v2;
  _BOOL4 v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  v2 = objc_msgSend(v1, sel_isSupervised);

  if ((v2 & 1) != 0)
    LOBYTE(v3) = 0;
  else
    v3 = !sub_23A1C1140(*(_QWORD **)(v0 + 16), *(_BYTE *)(v0 + 24) & 1);
  return (*(uint64_t (**)(_BOOL4))(v0 + 8))(v3);
}

BOOL sub_23A1C1140(_QWORD *a1, char a2)
{
  _QWORD *v3;
  char v4;

  if ((a2 & 1) != 0)
    return 0;
  v3 = sub_23A1C14E8();
  return (v4 & 1) == 0 && v3 == a1;
}

_QWORD *sub_23A1C14E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *result;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_23A1CD11C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (id)MDMFilePath();
  if (result)
  {
    v6 = result;
    v7 = (_QWORD *)sub_23A1CD164();

    sub_23A1CD104();
    swift_bridgeObjectRelease();
    v8 = sub_23A1CCD94();
    if (!v0)
    {
      v7 = v8;
      v9 = sub_23A1CD164();
      if (v7[2] && (sub_23A1C1D3C(v9, v10), (v11 & 1) != 0))
      {
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_opt_self();
        v12 = (void *)swift_dynamicCastObjCClass();
        if (v12)
        {
          v7 = objc_msgSend(v12, sel_unsignedLongLongValue);
        }
        else
        {
          sub_23A1C24C8();
          swift_allocError();
          *(_QWORD *)v13 = 0;
          *(_QWORD *)(v13 + 8) = 0;
          *(_BYTE *)(v13 + 16) = 2;
          swift_willThrow();
        }
        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v7 = 0;
      }
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void DMCAppsClient.organizationName.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (!v0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v1 = v0;
  v2 = objc_msgSend(v0, sel_managingOrganizationInformation);

  if (!v2)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v3 = sub_23A1CD14C();

  v4 = sub_23A1CD164();
  if (*(_QWORD *)(v3 + 16))
  {
    sub_23A1C1D3C(v4, v5);
    if ((v6 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_23A1C17C0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;

  v8 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *(_QWORD *)v8 = v4;
  *(_QWORD *)(v8 + 8) = sub_23A1C2B50;
  *(_BYTE *)(v8 + 185) = a3;
  *(_QWORD *)(v8 + 80) = a1;
  *(_QWORD *)(v8 + 88) = a2;
  *(_QWORD *)(v8 + 96) = *v3;
  return swift_task_switch();
}

uint64_t sub_23A1C183C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A1C1854(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v8;

  v8 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *(_QWORD *)v8 = v4;
  *(_QWORD *)(v8 + 8) = sub_23A1C2B50;
  *(_BYTE *)(v8 + 97) = a3;
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = *v3;
  return swift_task_switch();
}

uint64_t sub_23A1C18D0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C2B50;
  v5 = *v1;
  v4[14] = a1;
  v4[15] = v5;
  return swift_task_switch();
}

uint64_t sub_23A1C1934(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C1998;
  v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return swift_task_switch();
}

uint64_t sub_23A1C1998()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A1C19E0()
{
  uint64_t v0;

  return sub_23A1C2568(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A1C19F0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C2B50;
  v5 = *v1;
  v4[14] = a1;
  v4[15] = v5;
  return swift_task_switch();
}

uint64_t sub_23A1C1A54(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C2B50;
  v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return swift_task_switch();
}

uint64_t sub_23A1C1AB8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C2B50;
  v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return swift_task_switch();
}

uint64_t sub_23A1C1B1C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A1C2B50;
  v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return swift_task_switch();
}

void sub_23A1C1B80()
{
  DMCAppsClient.organizationName.getter();
}

uint64_t sub_23A1C1B94(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 24) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A1C1BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A1C2B4C;
  return sub_23A1C30B4(a1, a2);
}

uint64_t sub_23A1C1C10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F928 + dword_25694F928);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1C2B60;
  return v5(a1);
}

uint64_t sub_23A1C1C74(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F938 + dword_25694F938);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1C2B60;
  return v5(a1);
}

uint64_t sub_23A1C1CD8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25694F948 + dword_25694F948);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A1C2B60;
  return v5(a1);
}

unint64_t sub_23A1C1D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A1CD2C0();
  sub_23A1CD170();
  v4 = sub_23A1CD2D8();
  return sub_23A1C1DA0(a1, a2, v4);
}

unint64_t sub_23A1C1DA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A1CD26C() & 1) == 0)
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
      while (!v14 && (sub_23A1CD26C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A1C1E80(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C1E9C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[6];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[8] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C1F1C;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C1F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[10] = a1;
  v4[11] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C1F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 80);
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    *v5 = v0;
    v5[1] = sub_23A1C2060;
    return sub_23A1C32FC(*(_QWORD *)(v0 + 48), v1 & 0x101010100 | 1, v4, *(_QWORD *)(v0 + 88));
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v2 = xmmword_23A1CDA20;
    *(_BYTE *)(v2 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A1C2060()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(BOOL))(v3 + 8))(v0 == 0);
}

uint64_t sub_23A1C20BC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C20D8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[2];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[4] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[5] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C2158;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C2158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 48) = a1;
  *(_QWORD *)(v4 + 56) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C21BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v4)(uint64_t);

  if ((*(_BYTE *)(v0 + 48) & 1) != 0)
  {
    v4 = (uint64_t (*)(uint64_t))((char *)&dword_25694FE20 + dword_25694FE20);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v3;
    *v3 = v0;
    v3[1] = sub_23A1C228C;
    return v4(*(_QWORD *)(v0 + 16));
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v1 = xmmword_23A1CDA20;
    *(_BYTE *)(v1 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A1C228C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(BOOL))(v3 + 8))(v0 == 0);
}

uint64_t sub_23A1C22E8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v3;
  return swift_task_switch();
}

uint64_t sub_23A1C2304()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[6];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[8] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C2384;
  return sub_23A1C2EDC();
}

uint64_t sub_23A1C2384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[10] = a1;
  v4[11] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C23F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 80);
  if ((v1 & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    *v5 = v0;
    v5[1] = sub_23A1C2B48;
    return sub_23A1C381C(*(_QWORD *)(v0 + 48), v1 & 0x101010100 | 1, v4, *(_QWORD *)(v0 + 88));
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_OWORD *)v2 = xmmword_23A1CDA20;
    *(_BYTE *)(v2 + 16) = 2;
    swift_willThrow();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

unint64_t sub_23A1C24C8()
{
  unint64_t result;

  result = qword_25694F978;
  if (!qword_25694F978)
  {
    result = MEMORY[0x23B8439B0](&unk_23A1CDB68, &type metadata for DMCAppsInternalError);
    atomic_store(result, (unint64_t *)&qword_25694F978);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_4(uint64_t *a1)
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

uint64_t __swift_destroy_boxed_opaque_existential_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23A1C2568(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_23A1C2578()
{
  unint64_t result;

  result = qword_25694F9D8;
  if (!qword_25694F9D8)
  {
    result = MEMORY[0x23B8439B0](&protocol conformance descriptor for DMCAppsScope, &type metadata for DMCAppsScope);
    atomic_store(result, (unint64_t *)&qword_25694F9D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DMCAppsScope(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DMCAppsScope(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1C2698 + 4 * byte_23A1CDA55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A1C26CC + 4 * byte_23A1CDA50[v4]))();
}

uint64_t sub_23A1C26CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1C26D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1C26DCLL);
  return result;
}

uint64_t sub_23A1C26E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1C26F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A1C26F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1C26FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A1C2708(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsScope()
{
  return &type metadata for DMCAppsScope;
}

uint64_t destroy for DMCAppsClient()
{
  swift_release();
  return swift_release();
}

uint64_t _s7DMCApps13DMCAppsClientVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DMCAppsClient(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for DMCAppsClient(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppsClient(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DMCAppsClient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsClient()
{
  return &type metadata for DMCAppsClient;
}

_UNKNOWN **sub_23A1C28E0()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_23A1C28EC()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_23A1C28F8()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_23A1C2904()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_23A1C2910()
{
  return &protocol witness table for DMCApp;
}

uint64_t sub_23A1C2920(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for DMCAppsInternalError(uint64_t a1)
{
  return sub_23A1C2948(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23A1C2948(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s7DMCApps20DMCAppsInternalErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A1C2920(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DMCAppsInternalError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A1C2920(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A1C2948(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DMCAppsInternalError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A1C2948(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppsInternalError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DMCAppsInternalError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A1C2ACC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A1C2AE4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsInternalError()
{
  return &type metadata for DMCAppsInternalError;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_5Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23A1C2B74(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 == 2)
    return swift_bridgeObjectRetain();
  if (a3 <= 1u)
    JUMPOUT(0x23B84395CLL);
  return result;
}

uint64_t destroy for DMCAppError(uint64_t a1)
{
  return sub_23A1C2BAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23A1C2BAC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 == 2)
    return swift_bridgeObjectRelease();
  if (a3 <= 1u)
    JUMPOUT(0x23B843950);
  return result;
}

uint64_t _s7DMCApps11DMCAppErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A1C2B74(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DMCAppError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A1C2B74(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A1C2BAC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DMCAppError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A1C2BAC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DMCAppError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A1C2D40(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23A1C2D58(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppError()
{
  return &type metadata for DMCAppError;
}

void sub_23A1C2D80()
{
  qword_256950650 = 1936748609;
  *(_QWORD *)algn_256950658 = 0xE400000000000000;
}

uint64_t sub_23A1C2D9C()
{
  uint64_t v0;

  v0 = sub_23A1CD140();
  __swift_allocate_value_buffer(v0, qword_256950660);
  __swift_project_value_buffer(v0, (uint64_t)qword_256950660);
  if (qword_25694F6F0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A1CD134();
}

uint64_t sub_23A1C2E4C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DMCAppsLog()
{
  return objc_opt_self();
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

uint64_t type metadata accessor for DMCAppsManagementStateEvaluator()
{
  return objc_opt_self();
}

uint64_t sub_23A1C2EDC()
{
  return swift_task_switch();
}

uint64_t sub_23A1C2EF0()
{
  uint64_t v0;
  id v1;
  id v2;
  unsigned int v3;
  unsigned int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  objc_msgSend(v1, sel_refreshDetailsFromDisk);
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  objc_msgSend(v2, sel_refreshDetailsFromDisk);
  v3 = objc_msgSend(v1, sel_isSupervised);
  v4 = objc_msgSend(v2, sel_isUserEnrollment);
  v5 = objc_msgSend(v2, sel_personaID);
  v6 = v5;
  if (v5)

  v7 = objc_msgSend(v2, sel_personaID);
  if (v7)
  {
    v8 = v7;
    v9 = sub_23A1CD164();
    v11 = v10;

  }
  else
  {

    v9 = 0;
    v11 = 0;
  }
  v12 = 0x10000;
  if (!v4)
    v12 = 0;
  v13 = 16777217;
  if (v3)
    v13 = 16777473;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v0 + 8))(v12 | v13 | ((unint64_t)(v6 != 0) << 32), v9, v11);
}

void sub_23A1C3054()
{
  qword_256950678 = 0x657355776F6C6C61;
  qword_256950680 = 0xEF656469486F5472;
}

void sub_23A1C3084()
{
  qword_256950688 = 0x657355776F6C6C61;
  qword_256950690 = 0xEF6B636F4C6F5472;
}

uint64_t sub_23A1C30B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A1C312C;
  v6[18] = &unk_250B2AF78;
  v6[19] = v2;
  v6[16] = a1;
  v6[17] = a2;
  return swift_task_switch();
}

uint64_t sub_23A1C312C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23A1C31A0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 24);
  if (!v1)
  {
LABEL_12:
    v13 = 0;
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
  }
  v2 = v1;
  v3 = objc_msgSend(v2, sel_managementInformation);
  if (v3)
  {
    v4 = v3;
    v5 = (unint64_t)objc_msgSend(v3, sel_state);

    if (v5 <= 0x10)
      v6 = (0x17DF5u >> v5) & 1;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v2, sel_sourceIdentifier);
  if (!v7)
  {

    if ((v6 & 1) != 0)
    {
LABEL_19:
      v13 = 1;
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
    }
    goto LABEL_12;
  }
  v8 = v7;
  v9 = sub_23A1CD164();
  v11 = v10;

  if (v9 == 0xD00000000000001DLL && v11 == 0x800000023A1CE0D0)
    v12 = 1;
  else
    v12 = sub_23A1CD26C();

  swift_bridgeObjectRelease();
  if (v6)
    v13 = 2;
  else
    v13 = 0;
  if (v6 && (v12 & 1) == 0)
    goto LABEL_19;
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

uint64_t sub_23A1C32FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[4] = a4;
  v5[5] = v4;
  v5[2] = a1;
  v5[3] = a3;
  return swift_task_switch();
}

uint64_t sub_23A1C3318()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = (_QWORD *)v0[2];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v6 = v5;
  v0[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF8);
  v7 = swift_allocObject();
  v0[7] = v7;
  *(_OWORD *)(v7 + 16) = xmmword_23A1CDC50;
  *(_QWORD *)(v7 + 32) = 0xD000000000000010;
  *(_QWORD *)(v7 + 40) = 0x800000023A1CDFA0;
  *(_QWORD *)(v7 + 48) = 1701869940;
  *(_QWORD *)(v7 + 56) = 0xE400000000000000;
  *(_QWORD *)(v7 + 64) = 0xD000000000000011;
  *(_QWORD *)(v7 + 72) = 0x800000023A1CDFE0;
  *(_QWORD *)(v7 + 80) = 0x696C437070417369;
  *(_QWORD *)(v7 + 88) = 0xE900000000000070;
  *(_QWORD *)(v7 + 96) = 0xD000000000000015;
  *(_QWORD *)(v7 + 104) = 0x800000023A1CE000;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = v8;
  *v8 = v0;
  v8[1] = sub_23A1C3460;
  v9 = v0[5];
  v8[18] = v7;
  v8[19] = v9;
  v8[16] = v4;
  v8[17] = v6;
  return swift_task_switch();
}

uint64_t sub_23A1C3460(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_23A1C34DC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v1 = *(void **)(v0 + 72);
  if (!v1)
    goto LABEL_20;
  v2 = v1;
  v3 = objc_msgSend(v2, sel_installationState);
  v4 = objc_msgSend(v2, sel_type);
  if (v3)
    v5 = v3 == (id)3;
  else
    v5 = 1;
  if (v5
    || (v6 = v4, (objc_msgSend(v2, sel_isAppClip) & 1) != 0)
    || (v7 = objc_msgSend(v2, sel_managementInformation)) != 0
    && ((v8 = v7, v9 = (unint64_t)objc_msgSend(v7, sel_state), v8, v9 <= 0x10)
      ? (v10 = ((1 << v9) & 0x17DF5) == 0)
      : (v10 = 1),
        !v10)
    || v6 != (id)1)
  {

LABEL_20:
    v17 = swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v17;
    *(_QWORD *)v17 = v0;
    *(_QWORD *)(v17 + 8) = sub_23A1C3714;
    v18 = *(_QWORD *)(v0 + 16);
    v19 = *(_OWORD *)(v0 + 24);
    *(_QWORD *)(v17 + 176) = *(_QWORD *)(v0 + 40);
    *(_OWORD *)(v17 + 160) = v19;
    *(_QWORD *)(v17 + 152) = v18;
    return swift_task_switch();
  }
  if (qword_25694F6F8 != -1)
    swift_once();
  v11 = sub_23A1CD140();
  __swift_project_value_buffer(v11, (uint64_t)qword_256950660);
  v12 = sub_23A1CD128();
  v13 = sub_23A1CD1AC();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_23A1BB000, v12, v13, "Trying to install an existing system app...", v14, 2u);
    MEMORY[0x23B843A28](v14, -1, -1);
  }

  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v15 = 0;
  *(_QWORD *)(v15 + 8) = 0;
  *(_BYTE *)(v15 + 16) = 3;
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C3714()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A1C3778()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C37AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C37E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C381C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v9;

  v5[6] = a1;
  v5[7] = v4;
  v9 = (_QWORD *)swift_task_alloc();
  v5[8] = v9;
  *v9 = v5;
  v9[1] = sub_23A1C3894;
  v9[21] = a4;
  v9[22] = v4;
  v9[19] = a1;
  v9[20] = a3;
  return swift_task_switch();
}

uint64_t sub_23A1C3894()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = swift_task_alloc();
    *(_QWORD *)(v2 + 80) = v3;
    *(_QWORD *)v3 = v2;
    *(_QWORD *)(v3 + 8) = sub_23A1C3924;
    *(_OWORD *)(v3 + 160) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C3924()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 128) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 88) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1C39B4;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C39B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 128) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 96) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1C3A44;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C3A44()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 128) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 104) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1C3AD4;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C3AD4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 128) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 112) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1C3B64;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C3B64()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 128) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 120) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1C3BF4;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1C3BF4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  *(_QWORD *)(v2 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C3C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 40) = v1;
  MEMORY[0x23B84395C](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FA60);
  if (swift_dynamicCast())
  {
    v3 = *(_QWORD *)(v0 + 16);
    v2 = *(_QWORD *)(v0 + 24);
    v4 = *(unsigned __int8 *)(v0 + 32);
    if (v4 == 1)
    {
      MEMORY[0x23B843950](v1);
      sub_23A1C9274();
      swift_allocError();
      *(_QWORD *)v5 = v3;
      *(_QWORD *)(v5 + 8) = v2;
      *(_BYTE *)(v5 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_23A1C2948(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v4);
    }
  }
  MEMORY[0x23B843950](*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C3D38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = v1;
  MEMORY[0x23B84395C](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FA60);
  if (swift_dynamicCast())
  {
    v3 = *(_QWORD *)(v0 + 16);
    v2 = *(_QWORD *)(v0 + 24);
    v4 = *(unsigned __int8 *)(v0 + 32);
    if (v4 == 1)
    {
      MEMORY[0x23B843950](v1);
      sub_23A1C9274();
      swift_allocError();
      *(_QWORD *)v5 = v3;
      *(_QWORD *)(v5 + 8) = v2;
      *(_BYTE *)(v5 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_23A1C2948(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v4);
    }
  }
  MEMORY[0x23B843950](*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C3E10()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A1C3E6C;
  v2[12] = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C3E6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23A1C3EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  const char *v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
  {
    if (qword_25694F6F8 != -1)
      swift_once();
    v7 = sub_23A1CD140();
    __swift_project_value_buffer(v7, (uint64_t)qword_256950660);
    v8 = sub_23A1CD128();
    v9 = sub_23A1CD1AC();
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_16;
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = "Failed to fetch any bundleIDs for protected apps.";
    goto LABEL_15;
  }
  if (qword_25694F700 == -1)
  {
    if (!*(_QWORD *)(v1 + 16))
    {
LABEL_11:
      swift_bridgeObjectRelease();
      if (qword_25694F6F8 != -1)
        swift_once();
      v12 = sub_23A1CD140();
      __swift_project_value_buffer(v12, (uint64_t)qword_256950660);
      v8 = sub_23A1CD128();
      v9 = sub_23A1CD1AC();
      if (!os_log_type_enabled(v8, v9))
        goto LABEL_16;
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      v11 = "No unhideable apps found!";
LABEL_15:
      _os_log_impl(&dword_23A1BB000, v8, v9, v11, v10, 2u);
      MEMORY[0x23B843A28](v10, -1, -1);
LABEL_16:

      v6 = 0;
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
    }
  }
  else
  {
    swift_once();
    if (!*(_QWORD *)(v1 + 16))
      goto LABEL_11;
  }
  v2 = qword_256950680;
  v3 = qword_256950678;
  swift_bridgeObjectRetain();
  v4 = sub_23A1C1D3C(v3, v2);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_23A1C40EC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A1C4148;
  v2[12] = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C4148(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23A1C41BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  const char *v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
  {
    if (qword_25694F6F8 != -1)
      swift_once();
    v7 = sub_23A1CD140();
    __swift_project_value_buffer(v7, (uint64_t)qword_256950660);
    v8 = sub_23A1CD128();
    v9 = sub_23A1CD1AC();
    if (!os_log_type_enabled(v8, v9))
      goto LABEL_16;
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = "Failed to fetch any bundleIDs for protected apps.";
    goto LABEL_15;
  }
  if (qword_25694F708 == -1)
  {
    if (!*(_QWORD *)(v1 + 16))
    {
LABEL_11:
      swift_bridgeObjectRelease();
      if (qword_25694F6F8 != -1)
        swift_once();
      v12 = sub_23A1CD140();
      __swift_project_value_buffer(v12, (uint64_t)qword_256950660);
      v8 = sub_23A1CD128();
      v9 = sub_23A1CD1AC();
      if (!os_log_type_enabled(v8, v9))
        goto LABEL_16;
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      v11 = "No unlockable apps found!";
LABEL_15:
      _os_log_impl(&dword_23A1BB000, v8, v9, v11, v10, 2u);
      MEMORY[0x23B843A28](v10, -1, -1);
LABEL_16:

      v6 = 0;
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
    }
  }
  else
  {
    swift_once();
    if (!*(_QWORD *)(v1 + 16))
      goto LABEL_11;
  }
  v2 = qword_256950690;
  v3 = qword_256950688;
  swift_bridgeObjectRetain();
  v4 = sub_23A1C1D3C(v3, v2);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_23A1C43C8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A1C4424;
  v2[12] = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C4424(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23A1C4498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    if (qword_25694F700 == -1)
    {
      if (*(_QWORD *)(v1 + 16))
      {
LABEL_4:
        v2 = qword_256950680;
        v3 = qword_256950678;
        swift_bridgeObjectRetain();
        v4 = sub_23A1C1D3C(v3, v2);
        if ((v5 & 1) != 0)
        {
          v6 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v7 = sub_23A1CBCBC(v6);
        }
        else
        {
          v7 = MEMORY[0x24BEE4B08];
        }
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_25694F708 == -1)
        {
          if (!*(_QWORD *)(v1 + 16))
            goto LABEL_21;
        }
        else
        {
          swift_once();
          if (!*(_QWORD *)(v1 + 16))
            goto LABEL_21;
        }
        v13 = qword_256950690;
        v14 = qword_256950688;
        swift_bridgeObjectRetain();
        v15 = sub_23A1C1D3C(v14, v13);
        if ((v16 & 1) != 0)
        {
          v17 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v18 = sub_23A1CBCBC(v17);
          swift_bridgeObjectRelease();
LABEL_22:
          v19 = sub_23A1C9F8C(v18, v7);
          swift_bridgeObjectRelease();
          v12 = sub_23A1CB398(v19);
          swift_release();
          return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v12);
        }
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        v18 = MEMORY[0x24BEE4B08];
        goto LABEL_22;
      }
    }
    else
    {
      swift_once();
      if (*(_QWORD *)(v1 + 16))
        goto LABEL_4;
    }
    v7 = MEMORY[0x24BEE4B08];
    goto LABEL_15;
  }
  if (qword_25694F6F8 != -1)
    swift_once();
  v8 = sub_23A1CD140();
  __swift_project_value_buffer(v8, (uint64_t)qword_256950660);
  v9 = sub_23A1CD128();
  v10 = sub_23A1CD1AC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A1BB000, v9, v10, "Failed to fetch any bundleIDs for protected apps.", v11, 2u);
    MEMORY[0x23B843A28](v11, -1, -1);
  }

  v12 = 0;
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v12);
}

uint64_t sub_23A1C4710()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A1C476C;
  v2[12] = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C476C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23A1C47E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    if (qword_25694F700 == -1)
    {
      if (*(_QWORD *)(v1 + 16))
      {
LABEL_4:
        v2 = qword_256950680;
        v3 = qword_256950678;
        swift_bridgeObjectRetain();
        v4 = sub_23A1C1D3C(v3, v2);
        if ((v5 & 1) != 0)
        {
          v6 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v7 = sub_23A1CBCBC(v6);
        }
        else
        {
          v7 = MEMORY[0x24BEE4B08];
        }
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_25694F708 == -1)
        {
          if (!*(_QWORD *)(v1 + 16))
            goto LABEL_21;
        }
        else
        {
          swift_once();
          if (!*(_QWORD *)(v1 + 16))
            goto LABEL_21;
        }
        v13 = qword_256950690;
        v14 = qword_256950688;
        swift_bridgeObjectRetain();
        v15 = sub_23A1C1D3C(v14, v13);
        if ((v16 & 1) != 0)
        {
          v17 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v18 = sub_23A1CBCBC(v17);
          swift_bridgeObjectRelease();
LABEL_22:
          v19 = sub_23A1C4A4C(v18, v7);
          v12 = sub_23A1CB398(v19);
          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v12);
        }
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        v18 = MEMORY[0x24BEE4B08];
        goto LABEL_22;
      }
    }
    else
    {
      swift_once();
      if (*(_QWORD *)(v1 + 16))
        goto LABEL_4;
    }
    v7 = MEMORY[0x24BEE4B08];
    goto LABEL_15;
  }
  if (qword_25694F6F8 != -1)
    swift_once();
  v8 = sub_23A1CD140();
  __swift_project_value_buffer(v8, (uint64_t)qword_256950660);
  v9 = sub_23A1CD128();
  v10 = sub_23A1CD1AC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A1BB000, v9, v10, "No unlockable or unhideable apps found!", v11, 2u);
    MEMORY[0x23B843A28](v11, -1, -1);
  }

  v12 = 0;
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v12);
}

uint64_t sub_23A1C4A4C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_23A1C9B04(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A1C4BC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  return swift_task_switch();
}

uint64_t sub_23A1C4BE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF8);
  v1 = swift_allocObject();
  v0[13] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_23A1CDC60;
  if (qword_25694F700 != -1)
    swift_once();
  v2 = qword_256950680;
  *(_QWORD *)(v1 + 32) = qword_256950678;
  *(_QWORD *)(v1 + 40) = v2;
  v3 = qword_25694F708;
  swift_bridgeObjectRetain();
  if (v3 != -1)
    swift_once();
  v4 = qword_256950690;
  *(_QWORD *)(v1 + 48) = qword_256950688;
  *(_QWORD *)(v1 + 56) = v4;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[14] = v5;
  *v5 = v0;
  v5[1] = sub_23A1C4CE8;
  v6 = v0[12];
  v5[16] = v1;
  v5[17] = v6;
  return swift_task_switch();
}

uint64_t sub_23A1C4CE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 120) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

id sub_23A1C4D64()
{
  int64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char **v11;
  char **v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id result;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  char v29;
  unint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  id v41;
  void *v42;
  unsigned __int8 v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  char v54;
  _QWORD *v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  _QWORD *v68;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE08);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A1CDC60;
    v3 = qword_256950680;
    *(_QWORD *)(inited + 32) = qword_256950678;
    *(_QWORD *)(inited + 40) = v3;
    v4 = MEMORY[0x24BEE4AF8];
    v5 = qword_256950688;
    v6 = qword_256950690;
    *(_QWORD *)(inited + 48) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(inited + 56) = v5;
    *(_QWORD *)(inited + 64) = v6;
    *(_QWORD *)(inited + 72) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)sub_23A1C53DC(inited);
    v0 = 0;
    v64 = v1;
    v65 = v1 + 64;
    v8 = -1;
    v9 = -1 << *(_BYTE *)(v1 + 32);
    if (-v9 < 64)
      v8 = ~(-1 << -(char)v9);
    v10 = v8 & *(_QWORD *)(v1 + 64);
    v66 = (unint64_t)(63 - v9) >> 6;
    v11 = &selRef_setManagementOptions_;
    v12 = &selRef_setManagementOptions_;
    while (1)
    {
      if (v10)
      {
        v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v14 = v13 | (v0 << 6);
      }
      else
      {
        v15 = v0 + 1;
        if (__OFADD__(v0, 1))
        {
          __break(1u);
LABEL_64:
          __break(1u);
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (v15 >= v66)
          goto LABEL_56;
        v16 = *(_QWORD *)(v65 + 8 * v15);
        ++v0;
        if (!v16)
        {
          v0 = v15 + 1;
          if (v15 + 1 >= v66)
            goto LABEL_56;
          v16 = *(_QWORD *)(v65 + 8 * v0);
          if (!v16)
          {
            v0 = v15 + 2;
            if (v15 + 2 >= v66)
              goto LABEL_56;
            v16 = *(_QWORD *)(v65 + 8 * v0);
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v66)
                goto LABEL_56;
              v16 = *(_QWORD *)(v65 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  v0 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_67;
                  if (v0 >= v66)
                    goto LABEL_56;
                  v16 = *(_QWORD *)(v65 + 8 * v0);
                  ++v17;
                  if (v16)
                    goto LABEL_21;
                }
              }
              v0 = v17;
            }
          }
        }
LABEL_21:
        v10 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v0 << 6);
      }
      v18 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v14);
      v19 = v18[1];
      v67 = *v18;
      v20 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v14);
      swift_bridgeObjectRetain();
      v21 = v20;
      v22 = objc_msgSend(v21, v11[6]);

      if (v22)
      {
        result = objc_msgSend(v21, v11[6]);
        if (!result)
        {
          __break(1u);
LABEL_70:
          __break(1u);
          return result;
        }
        v24 = result;
        v25 = objc_msgSend(result, sel_BOOLValue);

        if ((v25 & 1) == 0)
        {
          v27 = qword_256950678;
          v26 = qword_256950680;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v68 = v7;
          swift_bridgeObjectRetain();
          v30 = sub_23A1C1D3C(v27, v26);
          v31 = v7[2];
          v32 = (v29 & 1) == 0;
          v33 = v31 + v32;
          if (__OFADD__(v31, v32))
            goto LABEL_64;
          v34 = v29;
          if (v7[3] >= v33)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v12 = &selRef_setManagementOptions_;
              if ((v29 & 1) == 0)
                goto LABEL_66;
            }
            else
            {
              sub_23A1CB1E4();
              v12 = &selRef_setManagementOptions_;
              if ((v34 & 1) == 0)
                goto LABEL_66;
            }
          }
          else
          {
            sub_23A1CAED0(v33, isUniquelyReferenced_nonNull_native);
            v35 = sub_23A1C1D3C(v27, v26);
            if ((v34 & 1) != (v36 & 1))
              return (id)sub_23A1CD284();
            v30 = v35;
            v12 = &selRef_setManagementOptions_;
            if ((v34 & 1) == 0)
              goto LABEL_66;
          }
          v37 = *(_QWORD **)(v68[7] + 8 * v30);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v37 = sub_23A1C92B8(0, v37[2] + 1, 1, v37);
          v39 = v37[2];
          v38 = v37[3];
          if (v39 >= v38 >> 1)
            v37 = sub_23A1C92B8((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
          v37[2] = v39 + 1;
          v40 = &v37[2 * v39];
          v40[4] = v67;
          v40[5] = v19;
          v7 = v68;
          *(_QWORD *)(v68[7] + 8 * v30) = v37;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v1 = v64;
          v11 = &selRef_setManagementOptions_;
        }
      }
      v41 = objc_msgSend(v21, v12[7]);

      if (v41)
      {
        result = objc_msgSend(v21, v12[7]);
        if (!result)
          goto LABEL_70;
        v42 = result;
        v43 = objc_msgSend(result, sel_BOOLValue);

        if ((v43 & 1) == 0)
        {
          v45 = qword_256950688;
          v44 = qword_256950690;
          swift_bridgeObjectRetain();
          v46 = swift_isUniquelyReferenced_nonNull_native();
          v68 = v7;
          swift_bridgeObjectRetain();
          v48 = sub_23A1C1D3C(v45, v44);
          v49 = v7[2];
          v50 = (v47 & 1) == 0;
          v51 = v49 + v50;
          if (__OFADD__(v49, v50))
            goto LABEL_65;
          v52 = v47;
          if (v7[3] >= v51)
          {
            if ((v46 & 1) != 0)
            {
              v12 = &selRef_setManagementOptions_;
              if ((v47 & 1) == 0)
                goto LABEL_55;
            }
            else
            {
              v7 = &v68;
              sub_23A1CB1E4();
              v12 = &selRef_setManagementOptions_;
              if ((v52 & 1) == 0)
              {
LABEL_55:
                __break(1u);
LABEL_56:
                swift_release();
                v0 = v63;
                return (id)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v7);
              }
            }
          }
          else
          {
            sub_23A1CAED0(v51, v46);
            v7 = v68;
            v53 = sub_23A1C1D3C(v45, v44);
            if ((v52 & 1) != (v54 & 1))
              return (id)sub_23A1CD284();
            v48 = v53;
            v12 = &selRef_setManagementOptions_;
            if ((v52 & 1) == 0)
              goto LABEL_55;
          }
          v55 = *(_QWORD **)(v68[7] + 8 * v48);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v55 = sub_23A1C92B8(0, v55[2] + 1, 1, v55);
          v57 = v55[2];
          v56 = v55[3];
          if (v57 >= v56 >> 1)
            v55 = sub_23A1C92B8((_QWORD *)(v56 > 1), v57 + 1, 1, v55);
          v55[2] = v57 + 1;
          v58 = &v55[2 * v57];
          v58[4] = v67;
          v58[5] = v19;
          v7 = v68;
          *(_QWORD *)(v68[7] + 8 * v48) = v55;
          swift_bridgeObjectRelease();
          v1 = v64;
          v11 = &selRef_setManagementOptions_;
        }
      }

      swift_bridgeObjectRelease();
    }
  }
  if (qword_25694F6F8 != -1)
LABEL_68:
    swift_once();
  v59 = sub_23A1CD140();
  __swift_project_value_buffer(v59, (uint64_t)qword_256950660);
  v60 = sub_23A1CD128();
  v61 = sub_23A1CD1AC();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v62 = 0;
    _os_log_impl(&dword_23A1BB000, v60, v61, "DMF Fetch Apps request returned nil without error!", v62, 2u);
    MEMORY[0x23B843A28](v62, -1, -1);
  }

  v7 = 0;
  return (id)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v7);
}

unint64_t sub_23A1C53DC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE10);
  v2 = (_QWORD *)sub_23A1CD254();
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
    swift_bridgeObjectRetain();
    result = sub_23A1C1D3C(v5, v6);
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

unint64_t sub_23A1C54F4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE18);
  v2 = (_QWORD *)sub_23A1CD254();
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
    swift_unknownObjectRetain();
    result = sub_23A1C1D3C(v5, v6);
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

uint64_t sub_23A1C560C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C5624()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C810]), sel_init);
  *(_QWORD *)(v0 + 144) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 136);
    objc_msgSend(v1, sel_setType_, 3);
    objc_msgSend(v2, sel_setManagedAppsOnly_, 1);
    v4 = (void *)sub_23A1CD188();
    objc_msgSend(v2, sel_setPropertyKeys_, v4);

    v5 = *(void **)(v3 + 16);
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_23A1C5818;
    v6 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v7 = (_QWORD *)(v0 + 80);
    v7[1] = 0x40000000;
    v7[2] = sub_23A1C5C30;
    v7[3] = &block_descriptor_18;
    v7[4] = v6;
    objc_msgSend(v5, sel_performRequest_completion_, v2, v7);
    return swift_continuation_await();
  }
  else
  {
    if (qword_25694F6F8 != -1)
      swift_once();
    v9 = sub_23A1CD140();
    __swift_project_value_buffer(v9, (uint64_t)qword_256950660);
    v10 = sub_23A1CD128();
    v11 = sub_23A1CD1AC();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23A1BB000, v10, v11, "Failed to create DMF Fetch Apps Request", v12, 2u);
      MEMORY[0x23B843A28](v12, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A1C5818()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C5878()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;

  v1 = *(void **)(v0 + 144);
  v2 = *(void **)(v0 + 120);
  v3 = v2;

  if (v2)
  {
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
    {
      v5 = *(void **)(v0 + 144);
      v6 = objc_msgSend(v4, sel_appsByBundleIdentifier);
      sub_23A1C9ACC(0, &qword_25694FE00);
      v7 = sub_23A1CD14C();

      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
    }

  }
  if (qword_25694F6F8 != -1)
    swift_once();
  v8 = sub_23A1CD140();
  __swift_project_value_buffer(v8, (uint64_t)qword_256950660);
  v9 = sub_23A1CD128();
  v10 = sub_23A1CD1AC();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 144);
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_23A1BB000, v9, v10, "Failed to cast DMFFetchAppsRequest result object as DMFFetchAppsResultObject object. Fatal error", v13, 2u);
    MEMORY[0x23B843A28](v13, -1, -1);

  }
  else
  {

  }
  v7 = 0;
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_23A1C5A24()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 144);
  swift_willThrow();

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 152);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  MEMORY[0x23B84395C](v2);
  MEMORY[0x23B84395C](v2);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1AC();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 152);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23B84395C](v7);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v10;
    sub_23A1CD1D0();
    *v9 = v10;
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
    _os_log_impl(&dword_23A1BB000, v4, v5, "Fetch Apps request to DMFConnection failed with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v9, -1, -1);
    MEMORY[0x23B843A28](v8, -1, -1);
  }
  else
  {
    MEMORY[0x23B843950](*(_QWORD *)(v0 + 152));
    MEMORY[0x23B843950](v7);
  }
  v12 = *(void **)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 152);

  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v13 = v11;
  *(_QWORD *)(v13 + 8) = 0;
  *(_BYTE *)(v13 + 16) = 0;
  MEMORY[0x23B84395C](v11);
  swift_willThrow();

  MEMORY[0x23B843950](v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C5C30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FA60);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_23A1C9A44((uint64_t)&v10, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23A1C5CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  return swift_task_switch();
}

uint64_t sub_23A1C5CEC()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C810]), sel_init);
  *(_QWORD *)(v0 + 160) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 128);
    v4 = *(_QWORD *)(v0 + 136);
    objc_msgSend(v1, sel_setType_, 3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF8);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_23A1CDC70;
    *(_QWORD *)(v6 + 32) = v5;
    *(_QWORD *)(v6 + 40) = v4;
    swift_bridgeObjectRetain();
    v7 = (void *)sub_23A1CD188();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setBundleIdentifiers_, v7);

    v8 = (void *)sub_23A1CD188();
    objc_msgSend(v2, sel_setPropertyKeys_, v8);

    v9 = *(void **)(v3 + 16);
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_23A1C5F54;
    v10 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v11 = (_QWORD *)(v0 + 80);
    v11[1] = 0x40000000;
    v11[2] = sub_23A1C5C30;
    v11[3] = &block_descriptor_16;
    v11[4] = v10;
    objc_msgSend(v9, sel_performRequest_completion_, v2, v11);
    return swift_continuation_await();
  }
  else
  {
    if (qword_25694F6F8 != -1)
      swift_once();
    v13 = sub_23A1CD140();
    __swift_project_value_buffer(v13, (uint64_t)qword_256950660);
    v14 = sub_23A1CD128();
    v15 = sub_23A1CD1AC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23A1BB000, v14, v15, "Failed to create fetch request", v16, 2u);
      MEMORY[0x23B843A28](v16, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A1C5F54()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C5FB4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 120);
  v3 = v2;

  if (!v2)
  {

LABEL_6:
    v8 = 0;
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }
  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClass();
  v5 = *(void **)(v0 + 160);
  if (!v4)
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, sel_appsByBundleIdentifier);
  sub_23A1C9ACC(0, &qword_25694FE00);
  v7 = sub_23A1CD14C();

  v8 = sub_23A1C62C4(v7);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_23A1C60B8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 160);
  swift_willThrow();

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 168);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  MEMORY[0x23B84395C](v2);
  MEMORY[0x23B84395C](v2);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1AC();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 168);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23B84395C](v7);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v10;
    sub_23A1CD1D0();
    *v9 = v10;
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
    _os_log_impl(&dword_23A1BB000, v4, v5, "Failed to fetch apps with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v9, -1, -1);
    MEMORY[0x23B843A28](v8, -1, -1);
  }
  else
  {
    MEMORY[0x23B843950](*(_QWORD *)(v0 + 168));
    MEMORY[0x23B843950](v7);
  }
  v12 = *(void **)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 168);

  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v13 = v11;
  *(_QWORD *)(v13 + 8) = 0;
  *(_BYTE *)(v13 + 16) = 0;
  MEMORY[0x23B84395C](v11);
  swift_willThrow();

  MEMORY[0x23B843950](v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C62C4(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  void *v5;
  id v6;

  result = sub_23A1CB47C(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = (void *)sub_23A1CB700(result, v3, 0, a1);
  v6 = v5;
  return (uint64_t)v5;
}

uint64_t sub_23A1C6330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  return swift_task_switch();
}

uint64_t sub_23A1C634C()
{
  uint64_t v0;
  id v1;
  void *v2;
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[2];

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C878]), sel_init);
  *(_QWORD *)(v0 + 184) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD **)(v0 + 152);
    sub_23A1C9ACC(0, &qword_25694FDE8);
    v4 = v2;
    v5 = (void *)sub_23A1CD1B8();
    objc_msgSend(v4, sel_setInternal_, v5);

    v6 = v3[3];
    v7 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v6);
    v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v9 = v4;
    v8(v6, v7);
    v10 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setBundleIdentifier_, v10);

    v11 = (void *)sub_23A1CD158();
    objc_msgSend(v9, sel_setSourceIdentifier_, v11);

    v12 = v3[3];
    v13 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13);
    if (v14)
    {
      v15 = (void *)sub_23A1CD158();
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = 0;
    }
    v25 = *(_QWORD *)(v0 + 168);
    objc_msgSend(v9, sel_setOriginator_, v15);

    v26 = v9;
    if (v25)
      v27 = (void *)sub_23A1CD158();
    else
      v27 = 0;
    v28 = *(_QWORD **)(v0 + 152);
    objc_msgSend(v9, sel_setPersonaIdentifier_, v27);

    v29 = v3[3];
    v30 = v3[7];
    __swift_project_boxed_opaque_existential_5Tm(v28, v29);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v30 + 8))(v40, v29, v30);
    v31 = (void *)sub_23A1CD1B8();
    objc_msgSend(v9, sel_setRemovable_, v31);

    v33 = v3[3];
    v32 = v3[4];
    __swift_project_boxed_opaque_existential_5Tm(v28, v33);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v32 + 8))(v40, v33, v32);
    if (LOBYTE(v40[0]) == 2)
    {
      v34 = 1;
    }
    else if ((v40[0] & 1) != 0)
    {
      v34 = 1;
    }
    else
    {
      v34 = 5;
    }
    v35 = *(_QWORD *)(v0 + 176);
    objc_msgSend(v9, sel_setManagementOptions_, v34);
    v36 = *(void **)(v35 + 16);
    *(_QWORD *)(v0 + 56) = v0 + 144;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_23A1C6870;
    *(_QWORD *)(v0 + 112) = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 0x40000000;
    *(_QWORD *)(v0 + 96) = sub_23A1C5C30;
    *(_QWORD *)(v0 + 104) = &block_descriptor_14;
    objc_msgSend(v36, sel_performRequest_completion_, v9, v0 + 80);
    return swift_continuation_await();
  }
  else
  {
    if (qword_25694F6F8 != -1)
      swift_once();
    v16 = *(_QWORD *)(v0 + 152);
    v17 = sub_23A1CD140();
    __swift_project_value_buffer(v17, (uint64_t)qword_256950660);
    sub_23A1C9230(v16, v0 + 80);
    v18 = sub_23A1CD128();
    v19 = sub_23A1CD1AC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      v40[0] = v39;
      v21 = *(_QWORD *)(v0 + 104);
      v22 = *(_QWORD *)(v0 + 120);
      __swift_project_boxed_opaque_existential_5Tm((_QWORD *)(v0 + 80), v21);
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
      *(_QWORD *)(v0 + 144) = sub_23A1C93C4(v23, v24, v40);
      sub_23A1CD1D0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_4(v0 + 80);
      _os_log_impl(&dword_23A1BB000, v18, v19, "Unable to create DMFMDMv1StartManagingAppRequest for %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B843A28](v39, -1, -1);
      MEMORY[0x23B843A28](v20, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    }

    sub_23A1C9274();
    swift_allocError();
    *(_QWORD *)v38 = 0;
    *(_QWORD *)(v38 + 8) = 0;
    *(_BYTE *)(v38 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A1C6870()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 192) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C68D0()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 184);

  v2 = *(void **)(v0 + 144);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C6914()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 184);
  swift_willThrow();

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 192);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  MEMORY[0x23B84395C](v2);
  MEMORY[0x23B84395C](v2);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1AC();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 192);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23B84395C](v7);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v10;
    sub_23A1CD1D0();
    *v9 = v10;
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
    _os_log_impl(&dword_23A1BB000, v4, v5, "Failed to perform start managing request with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v9, -1, -1);
    MEMORY[0x23B843A28](v8, -1, -1);
  }
  else
  {
    MEMORY[0x23B843950](*(_QWORD *)(v0 + 192));
    MEMORY[0x23B843950](v7);
  }
  v12 = *(void **)(v0 + 184);
  v11 = *(_QWORD *)(v0 + 192);

  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v13 = v11;
  *(_QWORD *)(v13 + 8) = 0;
  *(_BYTE *)(v13 + 16) = 1;
  MEMORY[0x23B84395C](v11);
  swift_willThrow();

  MEMORY[0x23B843950](v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C6B28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 208) = a1;
  *(_QWORD *)(v2 + 216) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C6B40()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = (_QWORD *)v0[26];
  v2 = v1[3];
  v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v6 = v5;
  v0[28] = v5;
  v7 = (_QWORD *)swift_task_alloc();
  v0[29] = v7;
  *v7 = v0;
  v7[1] = sub_23A1C6BCC;
  return sub_23A1C30B4(v4, v6);
}

uint64_t sub_23A1C6BCC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 240) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_BYTE *)(v4 + 272) = a1;
  }
  return swift_task_switch();
}

id sub_23A1C6C48()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  id v6;
  void *v7;
  id v8;
  void *v9;
  id result;
  void *v11;
  uint64_t v12;
  _QWORD *v13;

  if (*(_BYTE *)(v0 + 272) != 2)
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C948]), sel_init);
  *(_QWORD *)(v0 + 248) = v1;
  if (v1)
  {
    v2 = *(_QWORD **)(v0 + 208);
    v3 = v2[3];
    v4 = v2[5];
    __swift_project_boxed_opaque_existential_5Tm(v2, v3);
    v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v6 = v1;
    v5(v3, v4);
    v7 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setBundleIdentifier_, v7);

    v8 = v6;
    v9 = (void *)sub_23A1CD158();
    objc_msgSend(v8, sel_setSourceIdentifier_, v9);

  }
  result = objc_msgSend((id)objc_opt_self(), sel_currentUserConnection);
  *(_QWORD *)(v0 + 256) = result;
  if (result)
  {
    v11 = result;
    *(_QWORD *)(v0 + 56) = v0 + 184;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_23A1C6E14;
    v12 = swift_continuation_init();
    *(_QWORD *)(v0 + 144) = MEMORY[0x24BDAC760];
    v13 = (_QWORD *)(v0 + 144);
    v13[1] = 0x40000000;
    v13[2] = sub_23A1C5C30;
    v13[3] = &block_descriptor_24;
    v13[4] = v12;
    objc_msgSend(v11, sel_performRequest_completion_, v1, v13);
    return (id)swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A1C6E14()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 264) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C6E74()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v1 = *(void **)(v0 + 184);

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 208);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  sub_23A1C9230(v2, v0 + 80);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1A0();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 256);
  if (v6)
  {
    v15 = *(void **)(v0 + 248);
    v8 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v16 = v14;
    *(_DWORD *)v8 = 136446210;
    v9 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 120);
    __swift_project_boxed_opaque_existential_5Tm((_QWORD *)(v0 + 80), v9);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    *(_QWORD *)(v0 + 200) = sub_23A1C93C4(v11, v12, &v16);
    sub_23A1CD1D0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    _os_log_impl(&dword_23A1BB000, v4, v5, "Removed DMF app data for: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v14, -1, -1);
    MEMORY[0x23B843A28](v8, -1, -1);

  }
  else
  {

    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C7080()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C70B4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v1 = *(void **)(v0 + 248);
  swift_willThrow();

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 264);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  MEMORY[0x23B84395C](v2);
  MEMORY[0x23B84395C](v2);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1AC();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 264);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    MEMORY[0x23B84395C](v7);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 192) = v10;
    sub_23A1CD1D0();
    *v9 = v10;
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
    _os_log_impl(&dword_23A1BB000, v4, v5, "Failed to remove DMF app data: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v9, -1, -1);
    MEMORY[0x23B843A28](v8, -1, -1);
  }
  else
  {
    MEMORY[0x23B843950](*(_QWORD *)(v0 + 264));
    MEMORY[0x23B843950](v7);
  }
  v11 = *(void **)(v0 + 256);
  v12 = *(void **)(v0 + 248);

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C7294(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 160) = a1;
  *(_QWORD *)(v2 + 168) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C72AC()
{
  uint64_t v0;
  id v1;
  void *v2;
  _OWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  id v63;
  void *v64;
  void *v65;
  void *v66;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C8F8]), sel_init);
  *(_QWORD *)(v0 + 176) = v1;
  if (!v1)
  {
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v16 = 0xD00000000000001ELL;
    *(_QWORD *)(v16 + 8) = 0x800000023A1CE450;
    *(_BYTE *)(v16 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = v1;
  v3 = (_OWORD *)(v0 + 80);
  v4 = *(_QWORD **)(v0 + 160);
  v5 = v4[3];
  v6 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v4, v5);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
  v8 = v2;
  v9 = v7(v5, v6);
  if (!v9)
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    goto LABEL_11;
  }
  v10 = v9;
  v11 = sub_23A1CD164();
  if (!*(_QWORD *)(v10 + 16) || (v13 = sub_23A1C1D3C(v11, v12), (v14 & 1) == 0))
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_23A1C964C(*(_QWORD *)(v10 + 56) + 32 * v13, v0 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 104))
  {
LABEL_11:
    sub_23A1C9A8C(v0 + 80);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v15 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_12:
  v15 = 0;
LABEL_13:
  v18 = *(_QWORD **)(v0 + 160);
  objc_msgSend(v8, sel_setVPNUUIDString_, v15);

  v19 = v4[3];
  v20 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v18, v19);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 80))(v19, v20);
  if (!v21)
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
LABEL_22:
    sub_23A1C9A8C(v0 + 80);
    goto LABEL_23;
  }
  v22 = v21;
  v23 = sub_23A1CD164();
  if (*(_QWORD *)(v22 + 16) && (v25 = sub_23A1C1D3C(v23, v24), (v26 & 1) != 0))
  {
    sub_23A1C964C(*(_QWORD *)(v22 + 56) + 32 * v25, v0 + 80);
  }
  else
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 104))
    goto LABEL_22;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v27 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
LABEL_23:
  v27 = 0;
LABEL_24:
  v28 = *(_QWORD **)(v0 + 160);
  objc_msgSend(v8, sel_setCellularSliceUUIDString_, v27);

  v29 = v4[3];
  v30 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v28, v29);
  v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 80))(v29, v30);
  if (!v31)
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
LABEL_33:
    sub_23A1C9A8C(v0 + 80);
    goto LABEL_34;
  }
  v32 = v31;
  v33 = sub_23A1CD164();
  if (*(_QWORD *)(v32 + 16) && (v35 = sub_23A1C1D3C(v33, v34), (v36 & 1) != 0))
  {
    sub_23A1C964C(*(_QWORD *)(v32 + 56) + 32 * v35, v0 + 80);
  }
  else
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 104))
    goto LABEL_33;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v37 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
LABEL_34:
  v37 = 0;
LABEL_35:
  v38 = *(_QWORD **)(v0 + 160);
  objc_msgSend(v8, sel_setContentFilterUUIDString_, v37);

  v39 = v4[3];
  v40 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v38, v39);
  v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 80))(v39, v40);
  if (!v41)
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
LABEL_44:
    sub_23A1C9A8C(v0 + 80);
    goto LABEL_45;
  }
  v42 = v41;
  v43 = sub_23A1CD164();
  if (*(_QWORD *)(v42 + 16) && (v45 = sub_23A1C1D3C(v43, v44), (v46 & 1) != 0))
  {
    sub_23A1C964C(*(_QWORD *)(v42 + 56) + 32 * v45, v0 + 80);
  }
  else
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 104))
    goto LABEL_44;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v47 = (void *)sub_23A1CD158();
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
LABEL_45:
  v47 = 0;
LABEL_46:
  v48 = *(_QWORD **)(v0 + 160);
  objc_msgSend(v8, sel_setDNSProxyUUIDString_, v47);

  v49 = v4[3];
  v50 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v48, v49);
  v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 80))(v49, v50);
  if (!v51)
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
LABEL_55:
    sub_23A1C9A8C(v0 + 80);
    goto LABEL_56;
  }
  v52 = v51;
  v53 = sub_23A1CD164();
  if (*(_QWORD *)(v52 + 16) && (v55 = sub_23A1C1D3C(v53, v54), (v56 & 1) != 0))
  {
    sub_23A1C964C(*(_QWORD *)(v52 + 56) + 32 * v55, v0 + 80);
  }
  else
  {
    *v3 = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 104))
    goto LABEL_55;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_56:
    v57 = 0;
    goto LABEL_57;
  }
  v57 = (void *)sub_23A1CD158();
  swift_bridgeObjectRelease();
LABEL_57:
  v59 = *(_QWORD **)(v0 + 160);
  v58 = *(_QWORD *)(v0 + 168);
  objc_msgSend(v8, sel_setRelayUUIDString_, v57);

  v60 = v4[3];
  v61 = v4[5];
  __swift_project_boxed_opaque_existential_5Tm(v59, v60);
  v62 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v63 = v8;
  v62(v60, v61);
  v64 = (void *)sub_23A1CD158();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_setBundleIdentifier_, v64);

  v65 = (void *)sub_23A1CD158();
  objc_msgSend(v63, sel_setSourceIdentifier_, v65);

  v66 = *(void **)(v58 + 16);
  *(_QWORD *)(v0 + 56) = v0 + 144;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A1C79C4;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_23A1C5C30;
  *(_QWORD *)(v0 + 104) = &block_descriptor_12;
  objc_msgSend(v66, sel_performRequest_completion_, v63, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_23A1C79C4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C7A24()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 176);

  v2 = *(void **)(v0 + 144);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C7A68()
{
  uint64_t v0;
  void *v1;
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(void **)(v0 + 176);
  swift_willThrow();

  if (qword_25694F6F8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = sub_23A1CD140();
  __swift_project_value_buffer(v4, (uint64_t)qword_256950660);
  sub_23A1C9230(v3, v0 + 80);
  MEMORY[0x23B84395C](v2);
  MEMORY[0x23B84395C](v2);
  v5 = sub_23A1CD128();
  v6 = sub_23A1CD1AC();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 184);
  if (v7)
  {
    v9 = swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v9 = 136315394;
    v10 = *(_QWORD *)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 120);
    __swift_project_boxed_opaque_existential_5Tm((_QWORD *)(v0 + 80), v10);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
    *(_QWORD *)(v0 + 144) = sub_23A1C93C4(v12, v13, &v21);
    sub_23A1CD1D0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    *(_WORD *)(v9 + 12) = 2112;
    MEMORY[0x23B84395C](v8);
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v14;
    sub_23A1CD1D0();
    *v19 = v14;
    MEMORY[0x23B843950](v8);
    MEMORY[0x23B843950](v8);
    _os_log_impl(&dword_23A1BB000, v5, v6, "Failed to set UUID app attributes on app %s, error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v20, -1, -1);
    MEMORY[0x23B843A28](v9, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    MEMORY[0x23B843950](v8);
    MEMORY[0x23B843950](v8);
  }

  v16 = *(void **)(v0 + 176);
  v15 = *(_QWORD *)(v0 + 184);
  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v17 = 0xD000000000000013;
  *(_QWORD *)(v17 + 8) = 0x800000023A1CE470;
  *(_BYTE *)(v17 + 16) = 2;
  swift_willThrow();
  MEMORY[0x23B843950](v15);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C7D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C7D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = sub_23A1CD164();
  v3 = v2;
  *(_QWORD *)(v0 + 72) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C8E8]), sel_init);
  *(_QWORD *)(v0 + 80) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v17 = 0xD000000000000021;
    *(_QWORD *)(v17 + 8) = 0x800000023A1CE420;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v4;
  v6 = (_OWORD *)(v0 + 16);
  v7 = *(_QWORD **)(v0 + 56);
  v8 = v7[3];
  v9 = v7[5];
  __swift_project_boxed_opaque_existential_5Tm(v7, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
  v11 = v5;
  v12 = v10(v8, v9);
  if (!v12)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_13;
  }
  v13 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A1C1D3C(v1, v3);
  if ((v15 & 1) == 0)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_23A1C964C(*(_QWORD *)(v13 + 56) + 32 * v14, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_23A1C9A8C(v0 + 16);
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v16 = (void *)sub_23A1CD188();
  swift_bridgeObjectRelease();
LABEL_15:
  objc_msgSend(v11, sel_setAssociatedDomains_, v16);

  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v19;
  *(_QWORD *)v19 = v0;
  *(_QWORD *)(v19 + 8) = sub_23A1C7FE8;
  *(_OWORD *)(v19 + 176) = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v19 + 160) = v1;
  *(_QWORD *)(v19 + 168) = v3;
  *(_QWORD *)(v19 + 152) = v11;
  return swift_task_switch();
}

uint64_t sub_23A1C7FE8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C8054()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C808C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C80C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C80DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = sub_23A1CD164();
  v3 = v2;
  *(_QWORD *)(v0 + 64) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C8E0]), sel_init);
  *(_QWORD *)(v0 + 72) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v17 = 0xD000000000000036;
    *(_QWORD *)(v17 + 8) = 0x800000023A1CE3E0;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v4;
  v6 = (_OWORD *)(v0 + 16);
  v7 = *(_QWORD **)(v0 + 48);
  v8 = v7[3];
  v9 = v7[5];
  __swift_project_boxed_opaque_existential_5Tm(v7, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
  v11 = v5;
  v12 = v10(v8, v9);
  if (!v12)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_13;
  }
  v13 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A1C1D3C(v1, v3);
  if ((v15 & 1) == 0)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_23A1C964C(*(_QWORD *)(v13 + 56) + 32 * v14, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_23A1C9A8C(v0 + 16);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    objc_msgSend(v11, sel_setAssociatedDomainsEnableDirectDownloads_, 0);
    goto LABEL_15;
  }
  sub_23A1C9ACC(0, &qword_25694FDE8);
  v16 = (void *)sub_23A1CD1B8();
  objc_msgSend(v11, sel_setAssociatedDomainsEnableDirectDownloads_, v16);

LABEL_15:
  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v19;
  *(_QWORD *)v19 = v0;
  *(_QWORD *)(v19 + 8) = sub_23A1C836C;
  *(_OWORD *)(v19 + 176) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v19 + 160) = v1;
  *(_QWORD *)(v19 + 168) = v3;
  *(_QWORD *)(v19 + 152) = v11;
  return swift_task_switch();
}

uint64_t sub_23A1C836C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C83D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C83F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = sub_23A1CD164();
  v3 = v2;
  *(_QWORD *)(v0 + 64) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C908]), sel_init);
  *(_QWORD *)(v0 + 72) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v17 = 0xD000000000000022;
    *(_QWORD *)(v17 + 8) = 0x800000023A1CE3B0;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v4;
  v6 = (_OWORD *)(v0 + 16);
  v7 = *(_QWORD **)(v0 + 48);
  v8 = v7[3];
  v9 = v7[5];
  __swift_project_boxed_opaque_existential_5Tm(v7, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
  v11 = v5;
  v12 = v10(v8, v9);
  if (!v12)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_13;
  }
  v13 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A1C1D3C(v1, v3);
  if ((v15 & 1) == 0)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_23A1C964C(*(_QWORD *)(v13 + 56) + 32 * v14, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_23A1C9A8C(v0 + 16);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    objc_msgSend(v11, sel_setTapToPayScreenLock_, 0);
    goto LABEL_15;
  }
  sub_23A1C9ACC(0, &qword_25694FDE8);
  v16 = (void *)sub_23A1CD1B8();
  objc_msgSend(v11, sel_setTapToPayScreenLock_, v16);

LABEL_15:
  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v19;
  *(_QWORD *)v19 = v0;
  *(_QWORD *)(v19 + 8) = sub_23A1C8680;
  *(_OWORD *)(v19 + 176) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v19 + 160) = v1;
  *(_QWORD *)(v19 + 168) = v3;
  *(_QWORD *)(v19 + 152) = v11;
  return swift_task_switch();
}

uint64_t sub_23A1C8680()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A1C86EC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C8724()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C875C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C8774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = sub_23A1CD164();
  v3 = v2;
  *(_QWORD *)(v0 + 64) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C8C8]), sel_init);
  *(_QWORD *)(v0 + 72) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v17 = 0xD00000000000001FLL;
    *(_QWORD *)(v17 + 8) = 0x800000023A1CE390;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v4;
  v6 = (_OWORD *)(v0 + 16);
  v7 = *(_QWORD **)(v0 + 48);
  v8 = v7[3];
  v9 = v7[5];
  __swift_project_boxed_opaque_existential_5Tm(v7, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
  v11 = v5;
  v12 = v10(v8, v9);
  if (!v12)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_13;
  }
  v13 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A1C1D3C(v1, v3);
  if ((v15 & 1) == 0)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_23A1C964C(*(_QWORD *)(v13 + 56) + 32 * v14, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_23A1C9A8C(v0 + 16);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    objc_msgSend(v11, sel_setAllowUserToHide_, 0);
    goto LABEL_15;
  }
  sub_23A1C9ACC(0, &qword_25694FDE8);
  v16 = (void *)sub_23A1CD1B8();
  objc_msgSend(v11, sel_setAllowUserToHide_, v16);

LABEL_15:
  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v19;
  *(_QWORD *)v19 = v0;
  *(_QWORD *)(v19 + 8) = sub_23A1C836C;
  *(_OWORD *)(v19 + 176) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v19 + 160) = v1;
  *(_QWORD *)(v19 + 168) = v3;
  *(_QWORD *)(v19 + 152) = v11;
  return swift_task_switch();
}

uint64_t sub_23A1C8A04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_23A1C8A1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = sub_23A1CD164();
  v3 = v2;
  *(_QWORD *)(v0 + 64) = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C8D0]), sel_init);
  *(_QWORD *)(v0 + 72) = v4;
  if (!v4)
  {
    swift_bridgeObjectRelease();
    sub_23A1C24C8();
    swift_allocError();
    *(_QWORD *)v17 = 0xD00000000000001FLL;
    *(_QWORD *)(v17 + 8) = 0x800000023A1CE370;
    *(_BYTE *)(v17 + 16) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v4;
  v6 = (_OWORD *)(v0 + 16);
  v7 = *(_QWORD **)(v0 + 48);
  v8 = v7[3];
  v9 = v7[5];
  __swift_project_boxed_opaque_existential_5Tm(v7, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
  v11 = v5;
  v12 = v10(v8, v9);
  if (!v12)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_13;
  }
  v13 = v12;
  if (!*(_QWORD *)(v12 + 16))
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A1C1D3C(v1, v3);
  if ((v15 & 1) == 0)
  {
    *v6 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_23A1C964C(*(_QWORD *)(v13 + 56) + 32 * v14, v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
LABEL_13:
    sub_23A1C9A8C(v0 + 16);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    objc_msgSend(v11, sel_setAllowUserToLock_, 0);
    goto LABEL_15;
  }
  sub_23A1C9ACC(0, &qword_25694FDE8);
  v16 = (void *)sub_23A1CD1B8();
  objc_msgSend(v11, sel_setAllowUserToLock_, v16);

LABEL_15:
  v19 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v19;
  *(_QWORD *)v19 = v0;
  *(_QWORD *)(v19 + 8) = sub_23A1C836C;
  *(_OWORD *)(v19 + 176) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v19 + 160) = v1;
  *(_QWORD *)(v19 + 168) = v3;
  *(_QWORD *)(v19 + 152) = v11;
  return swift_task_switch();
}

uint64_t sub_23A1C8CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[22] = a4;
  v5[23] = v4;
  v5[20] = a2;
  v5[21] = a3;
  v5[19] = a1;
  return swift_task_switch();
}

uint64_t sub_23A1C8CCC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = (_QWORD *)v0[22];
  v2 = v0[23];
  v3 = (void *)v0[19];
  v4 = v1[3];
  v5 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v6 = (void *)sub_23A1CD158();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setBundleIdentifier_, v6);

  v7 = (void *)sub_23A1CD158();
  objc_msgSend(v3, sel_setSourceIdentifier_, v7);

  v8 = *(void **)(v2 + 16);
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A1C8E10;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A1C5C30;
  v0[13] = &block_descriptor;
  v0[14] = v9;
  objc_msgSend(v8, sel_performRequest_completion_, v3, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A1C8E10()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 192) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A1C8E70()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C8EA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *log;
  os_log_type_t type;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25[2];

  swift_willThrow();
  if (qword_25694F6F8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = sub_23A1CD140();
  __swift_project_value_buffer(v3, (uint64_t)qword_256950660);
  sub_23A1C9230(v2, v0 + 80);
  swift_bridgeObjectRetain();
  MEMORY[0x23B84395C](v1);
  swift_bridgeObjectRetain();
  MEMORY[0x23B84395C](v1);
  v4 = sub_23A1CD128();
  v5 = sub_23A1CD1AC();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 192);
  v8 = *(_QWORD *)(v0 + 168);
  if (v6)
  {
    v9 = *(_QWORD *)(v0 + 160);
    type = v5;
    v10 = swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v25[0] = v24;
    *(_DWORD *)v10 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 144) = sub_23A1C93C4(v9, v8, v25);
    sub_23A1CD1D0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    log = v4;
    v11 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 120);
    __swift_project_boxed_opaque_existential_5Tm((_QWORD *)(v0 + 80), v11);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    *(_QWORD *)(v0 + 144) = sub_23A1C93C4(v13, v14, v25);
    sub_23A1CD1D0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    *(_WORD *)(v10 + 22) = 2112;
    MEMORY[0x23B84395C](v7);
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v15;
    sub_23A1CD1D0();
    *v23 = v15;
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
    v4 = log;
    _os_log_impl(&dword_23A1BB000, log, type, "Failed to set app attribute %s on app %s, error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDC8);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v23, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B843A28](v24, -1, -1);
    MEMORY[0x23B843A28](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    MEMORY[0x23B843950](v7);
    MEMORY[0x23B843950](v7);
  }

  v16 = *(_QWORD *)(v0 + 192);
  v18 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 168);
  sub_23A1C9274();
  swift_allocError();
  *(_QWORD *)v19 = v18;
  *(_QWORD *)(v19 + 8) = v17;
  *(_BYTE *)(v19 + 16) = 2;
  swift_bridgeObjectRetain();
  swift_willThrow();
  MEMORY[0x23B843950](v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1C91EC()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DMCAppsManager()
{
  return objc_opt_self();
}

uint64_t sub_23A1C9230(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23A1C9274()
{
  unint64_t result;

  result = qword_25694FDC0;
  if (!qword_25694FDC0)
  {
    result = MEMORY[0x23B8439B0](&protocol conformance descriptor for DMCAppError, &type metadata for DMCAppError);
    atomic_store(result, (unint64_t *)&qword_25694FDC0);
  }
  return result;
}

_QWORD *sub_23A1C92B8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF8);
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
    sub_23A1CBBCC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A1C93C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A1C9494(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A1C964C((uint64_t)v12, *a3);
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
      sub_23A1C964C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_4((uint64_t)v12);
  return v7;
}

uint64_t sub_23A1C9494(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A1CD1DC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A1C9688(a5, a6);
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
  v8 = sub_23A1CD224();
  if (!v8)
  {
    sub_23A1CD230();
    __break(1u);
LABEL_17:
    result = sub_23A1CD260();
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

uint64_t sub_23A1C964C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A1C9688(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A1C971C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A1C98F4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A1C98F4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A1C971C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A1C9890(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A1CD218();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A1CD230();
      __break(1u);
LABEL_10:
      v2 = sub_23A1CD17C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A1CD260();
    __break(1u);
LABEL_14:
    result = sub_23A1CD230();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A1C9890(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDD0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A1C98F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDD0);
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
  result = sub_23A1CD260();
  __break(1u);
  return result;
}

uint64_t sub_23A1C9A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1C9A8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A1C9ACC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A1C9B04(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A1CD2C0();
  swift_bridgeObjectRetain();
  sub_23A1CD170();
  v8 = sub_23A1CD2D8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A1CD26C() & 1) != 0)
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
      if (v19 || (sub_23A1CD26C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A1CA8DC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A1C9CB0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE28);
  v3 = sub_23A1CD200();
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
      sub_23A1CD2C0();
      sub_23A1CD170();
      result = sub_23A1CD2D8();
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

uint64_t sub_23A1C9F8C(uint64_t a1, uint64_t a2)
{
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x24BDAC7A8]();
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_23A1CA10C((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, a1);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_23A1CA10C((uint64_t)v8, v5, a2, a1);
    swift_release();
    MEMORY[0x23B843A28](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_23A1CA10C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_23A1CD2C0();
        swift_bridgeObjectRetain();
        sub_23A1CD170();
        v20 = sub_23A1CD2D8();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_23A1CD26C() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_23A1CD26C() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_23A1CD2C0();
    swift_bridgeObjectRetain();
    sub_23A1CD170();
    v47 = sub_23A1CD2D8();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_23A1CD26C() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_23A1CA648(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_23A1CD26C() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_23A1CA648(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE28);
  result = sub_23A1CD20C();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_23A1CD2C0();
    swift_bridgeObjectRetain();
    sub_23A1CD170();
    result = sub_23A1CD2D8();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23A1CA8DC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A1C9CB0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A1CAA74();
      goto LABEL_22;
    }
    sub_23A1CAC24();
  }
  v11 = *v4;
  sub_23A1CD2C0();
  sub_23A1CD170();
  result = sub_23A1CD2D8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A1CD26C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A1CD278();
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
          result = sub_23A1CD26C();
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

void *sub_23A1CAA74()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE28);
  v2 = *v0;
  v3 = sub_23A1CD1F4();
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

uint64_t sub_23A1CAC24()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE28);
  v3 = sub_23A1CD200();
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
    sub_23A1CD2C0();
    swift_bridgeObjectRetain();
    sub_23A1CD170();
    result = sub_23A1CD2D8();
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

uint64_t sub_23A1CAED0(uint64_t a1, char a2)
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
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE10);
  v36 = a2;
  v6 = sub_23A1CD248();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23A1CD2C0();
    sub_23A1CD170();
    result = sub_23A1CD2D8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_23A1CB1E4()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FE10);
  v2 = *v0;
  v3 = sub_23A1CD23C();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_23A1CB398(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FDF8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_23A1CB504((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23A1CBD50();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23A1CB47C(uint64_t a1)
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

uint64_t sub_23A1CB504(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
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

uint64_t sub_23A1CB700(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_23A1CB754(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v2[6] = a1;
  v2[7] = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v2[8] = v4;
  *v4 = v2;
  v4[1] = sub_23A1CB7B8;
  v4[20] = a1;
  v4[21] = v1;
  return swift_task_switch();
}

uint64_t sub_23A1CB7B8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 112) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 72) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1CB848;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1CB848()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 112) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 80) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1CB8D8;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1CB8D8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 112) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 88) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1CB968;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1CB968()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 112) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 96) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1CB9F8;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1CB9F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 112) = v0;
  }
  else
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v2 + 104) = v4;
    *(_QWORD *)v4 = v3;
    *(_QWORD *)(v4 + 8) = sub_23A1CBA88;
    *(_OWORD *)(v4 + 48) = *(_OWORD *)(v2 + 48);
  }
  return swift_task_switch();
}

uint64_t sub_23A1CBA88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  *(_QWORD *)(v2 + 112) = v0;
  return swift_task_switch();
}

uint64_t sub_23A1CBAF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 112);
  MEMORY[0x23B84395C]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25694FA60);
  if (swift_dynamicCast())
  {
    v1 = *(_QWORD *)(v0 + 16);
    v2 = *(_QWORD *)(v0 + 24);
    v3 = *(unsigned __int8 *)(v0 + 32);
    if (v3 == 1)
    {
      MEMORY[0x23B843950](*(_QWORD *)(v0 + 112));
      sub_23A1C9274();
      swift_allocError();
      *(_QWORD *)v4 = v1;
      *(_QWORD *)(v4 + 8) = v2;
      *(_BYTE *)(v4 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_23A1C2948(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v3);
    }
  }
  MEMORY[0x23B843950](*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A1CBBCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23A1CD260();
  __break(1u);
  return result;
}

uint64_t sub_23A1CBCBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23A1CD194();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23A1C9B04(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23A1CBD50()
{
  return swift_release();
}

uint64_t DMCAppsRemoveAction.hash(into:)()
{
  return sub_23A1CD2CC();
}

BOOL static DMCAppsRemoveAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DMCAppsRemoveAction.hashValue.getter()
{
  sub_23A1CD2C0();
  sub_23A1CD2CC();
  return sub_23A1CD2D8();
}

uint64_t _s7DMCApps0A13InstallActionO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_22;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_22;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_22;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_22;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_22;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_22;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_22;
      v6 = 1;
      v3 = 6;
      break;
    default:
      if (v5 < 7)
      {
LABEL_22:
        v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        v6 = 1;
      }
      else
      {
        v6 = sub_23A1CD26C();
      }
      sub_23A1CCD5C(v4, v5);
      sub_23A1CCD5C(v2, v3);
      break;
  }
  sub_23A1CCD70(v2, v3);
  sub_23A1CCD70(v4, v5);
  return v6 & 1;
}

uint64_t _s7DMCApps0A21OptionalInstallActionO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      v3 = 1;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_23A1CD26C();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:
    sub_23A1CCD34(v4, v5);
    sub_23A1CCD34(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2)
    goto LABEL_11;
  v6 = 1;
  v3 = 2;
LABEL_13:
  sub_23A1CCD48(v2, v3);
  sub_23A1CCD48(v4, v5);
  return v6 & 1;
}

unint64_t sub_23A1CC038()
{
  unint64_t result;

  result = qword_25694FE30;
  if (!qword_25694FE30)
  {
    result = MEMORY[0x23B8439B0](&protocol conformance descriptor for DMCAppsRemoveAction, &type metadata for DMCAppsRemoveAction);
    atomic_store(result, (unint64_t *)&qword_25694FE30);
  }
  return result;
}

uint64_t dispatch thunk of DMCAppStateReporting.willInstallApplication(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A1CCD90;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting.didInstallApplication(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A1CC184;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23A1CC184(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of DMCAppStateReporting.updateApp(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A1CCD90;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting2.isManaged(bundleID:persona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16)
                                                                                     + *(_QWORD *)(a6 + 16));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23A1CCD90;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of DMCAppStateReporting3.shouldPromptForInstallConsent(for:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v8 = a2 & 1;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A1CC378;
  return v11(a1, v8, a3, a4);
}

uint64_t sub_23A1CC378(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of DMCAppStateReporting4.organizationName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t destroy for DMCAppsInstallAction(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DMCAppsInstallAction(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF9 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483641);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 6;
  if (v4 >= 8)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DMCAppsInstallAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF9)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 6;
  }
  return result;
}

uint64_t sub_23A1CC4AC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A1CC4C4(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for DMCAppsInstallAction()
{
  return &type metadata for DMCAppsInstallAction;
}

uint64_t _s7DMCApps20DMCAppsInstallActionOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *_s7DMCApps20DMCAppsInstallActionOwca_0(_QWORD *a1, _QWORD *a2)
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

uint64_t _s7DMCApps20DMCAppsInstallActionOwta_0(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for DMCAppsOptionalInstallAction(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DMCAppsOptionalInstallAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsOptionalInstallAction()
{
  return &type metadata for DMCAppsOptionalInstallAction;
}

uint64_t storeEnumTagSinglePayload for DMCAppsRemoveAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1CC744 + 4 * byte_23A1CDD0C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A1CC778 + 4 * byte_23A1CDD07[v4]))();
}

uint64_t sub_23A1CC778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1CC780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1CC788);
  return result;
}

uint64_t sub_23A1CC794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1CC79CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A1CC7A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1CC7A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsRemoveAction()
{
  return &type metadata for DMCAppsRemoveAction;
}

uint64_t dispatch thunk of DMCAppStateReporting5.configurationApplied(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23A1C2B50;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of DMCAppStateReporting5.configurationRemoved(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23A1C2B50;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting5.optionalAppRequested(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23A1C2B50;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willDownload(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 40) + *(_QWORD *)(a3 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willInstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 48) + *(_QWORD *)(a3 + 48));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didInstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 56) + *(_QWORD *)(a3 + 56));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C1998;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 64) + *(_QWORD *)(a3 + 64));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 72) + *(_QWORD *)(a3 + 72));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.installFailed(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 80) + *(_QWORD *)(a3 + 80));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didUninstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 88) + *(_QWORD *)(a3 + 88));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didRemoveConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 96) + *(_QWORD *)(a3 + 96));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23A1C2B50;
  return v9(a1, a2, a3);
}

uint64_t sub_23A1CCD34(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23A1CCD48(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23A1CCD5C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 7)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23A1CCD70(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 7)
    return swift_bridgeObjectRelease();
  return result;
}

id sub_23A1CCD94()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  _BYTE *v5;
  id v6;
  _BYTE *v7;
  void *v9;
  id v10[5];

  v10[4] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_allocWithZone(MEMORY[0x24BDBCE90]);
  v1 = (void *)sub_23A1CD110();
  v2 = objc_msgSend(v0, sel_initWithURL_, v1);

  if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, sel_open);
    v10[0] = 0;
    if (objc_msgSend((id)objc_opt_self(), sel_propertyListWithStream_options_format_error_, v3, 0, 0, v10))
    {
      v4 = v10[0];
      sub_23A1CD1E8();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25694FEC0);
      if (swift_dynamicCast())
        v0 = v9;
      else
        v0 = (id)sub_23A1C54F4(MEMORY[0x24BEE4AF8]);
      objc_msgSend(v3, sel_close);

    }
    else
    {
      v6 = v10[0];
      v0 = (id)sub_23A1CD0F8();

      swift_willThrow();
      sub_23A1CCFA0();
      swift_allocError();
      *v7 = 1;
      swift_willThrow();
      MEMORY[0x23B843950](v0);
      objc_msgSend(v3, sel_close);

    }
  }
  else
  {
    sub_23A1CCFA0();
    swift_allocError();
    *v5 = 0;
    swift_willThrow();
  }
  return v0;
}

unint64_t sub_23A1CCFA0()
{
  unint64_t result;

  result = qword_25694FEB8;
  if (!qword_25694FEB8)
  {
    result = MEMORY[0x23B8439B0](&unk_23A1CDF78, &type metadata for PlistError);
    atomic_store(result, (unint64_t *)&qword_25694FEB8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PlistError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1CD030 + 4 * byte_23A1CDEFD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A1CD064 + 4 * asc_23A1CDEF8[v4]))();
}

uint64_t sub_23A1CD064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1CD06C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1CD074);
  return result;
}

uint64_t sub_23A1CD080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1CD088);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A1CD08C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1CD094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlistError()
{
  return &type metadata for PlistError;
}

unint64_t sub_23A1CD0B4()
{
  unint64_t result;

  result = qword_25694FEC8;
  if (!qword_25694FEC8)
  {
    result = MEMORY[0x23B8439B0](&unk_23A1CDF50, &type metadata for PlistError);
    atomic_store(result, (unint64_t *)&qword_25694FEC8);
  }
  return result;
}

uint64_t sub_23A1CD0F8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A1CD104()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23A1CD110()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A1CD11C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A1CD128()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A1CD134()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A1CD140()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A1CD14C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A1CD158()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A1CD164()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A1CD170()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A1CD17C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A1CD188()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A1CD194()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A1CD1A0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A1CD1AC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A1CD1B8()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_23A1CD1C4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A1CD1D0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A1CD1DC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A1CD1E8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A1CD1F4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A1CD200()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A1CD20C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A1CD218()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A1CD224()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A1CD230()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A1CD23C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A1CD248()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A1CD254()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A1CD260()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A1CD26C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A1CD278()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A1CD284()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A1CD290()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A1CD29C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A1CD2A8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A1CD2B4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A1CD2C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A1CD2CC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A1CD2D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x24BE2A738]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}


double RecognizedItem.Bounds.topLeft.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void RecognizedItem.Bounds.topLeft.setter(double a1, double a2)
{
  double *v2;

  *v2 = a1;
  v2[1] = a2;
}

uint64_t (*RecognizedItem.Bounds.topLeft.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.topRight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void RecognizedItem.Bounds.topRight.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
}

uint64_t (*RecognizedItem.Bounds.topRight.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.bottomRight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void RecognizedItem.Bounds.bottomRight.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 32) = a1;
  *(double *)(v2 + 40) = a2;
}

uint64_t (*RecognizedItem.Bounds.bottomRight.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.bottomLeft.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

void RecognizedItem.Bounds.bottomLeft.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 48) = a1;
  *(double *)(v2 + 56) = a2;
}

uint64_t (*RecognizedItem.Bounds.bottomLeft.modify())()
{
  return nullsub_1;
}

id RecognizedItem.Text.bounds.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CF61724(type metadata accessor for RecognizedItem.Text, a1);
}

uint64_t type metadata accessor for RecognizedItem.Text(uint64_t a1)
{
  return sub_20CF6196C(a1, (uint64_t *)&unk_25499BDA0);
}

uint64_t RecognizedItem.Text.transcript.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Text(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

id RecognizedItem.Text.observation.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Text(0) + 28));
}

uint64_t _s9VisionKit14RecognizedItemO4TextV2id10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20CF78934();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id RecognizedItem.Barcode.bounds.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CF61724(type metadata accessor for RecognizedItem.Barcode, a1);
}

id sub_20CF61724@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = *(void **)(v4 + 64);
  v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v4;
  *(_OWORD *)(a2 + 16) = v6;
  v7 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(a2 + 48) = v7;
  *(_QWORD *)(a2 + 64) = v5;
  return v5;
}

uint64_t type metadata accessor for RecognizedItem.Barcode(uint64_t a1)
{
  return sub_20CF6196C(a1, (uint64_t *)&unk_25499BDB0);
}

uint64_t RecognizedItem.Barcode.payloadStringValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Barcode(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

id RecognizedItem.Barcode.observation.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Barcode(0) + 28));
}

uint64_t RecognizedItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v15;

  v2 = v1;
  type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF619A0(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CF619E4((uint64_t)v9, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    v10 = sub_20CF78934();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, v5, v10);
    v11 = (uint64_t)v5;
    v12 = type metadata accessor for RecognizedItem.Barcode;
  }
  else
  {
    sub_20CF619E4((uint64_t)v9, (uint64_t)v7, type metadata accessor for RecognizedItem.Text);
    v13 = sub_20CF78934();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, v7, v13);
    v11 = (uint64_t)v7;
    v12 = type metadata accessor for RecognizedItem.Text;
  }
  return sub_20CF61A28(v11, v12);
}

uint64_t type metadata accessor for RecognizedItem(uint64_t a1)
{
  return sub_20CF6196C(a1, (uint64_t *)&unk_25499BD90);
}

uint64_t sub_20CF6196C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CF619A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecognizedItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CF619E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CF61A28(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t RecognizedItem.bounds.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  char *v24;
  uint64_t result;
  uint64_t v26;

  v2 = v1;
  v4 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem(0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF619A0(v2, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CF619E4((uint64_t)v11, (uint64_t)v6, type metadata accessor for RecognizedItem.Barcode);
    v12 = &v6[*(int *)(v4 + 20)];
    v13 = *(_QWORD *)v12;
    v14 = *((_QWORD *)v12 + 1);
    v15 = *((_QWORD *)v12 + 2);
    v16 = *((_QWORD *)v12 + 3);
    v17 = *((_QWORD *)v12 + 4);
    v18 = *((_QWORD *)v12 + 5);
    v19 = *((_QWORD *)v12 + 6);
    v20 = *((_QWORD *)v12 + 7);
    v21 = *((id *)v12 + 8);
    v22 = (uint64_t)v6;
    v23 = type metadata accessor for RecognizedItem.Barcode;
  }
  else
  {
    sub_20CF619E4((uint64_t)v11, (uint64_t)v9, type metadata accessor for RecognizedItem.Text);
    v24 = &v9[*(int *)(v7 + 20)];
    v13 = *(_QWORD *)v24;
    v14 = *((_QWORD *)v24 + 1);
    v15 = *((_QWORD *)v24 + 2);
    v16 = *((_QWORD *)v24 + 3);
    v17 = *((_QWORD *)v24 + 4);
    v18 = *((_QWORD *)v24 + 5);
    v19 = *((_QWORD *)v24 + 6);
    v20 = *((_QWORD *)v24 + 7);
    v21 = *((id *)v24 + 8);
    v22 = (uint64_t)v9;
    v23 = type metadata accessor for RecognizedItem.Text;
  }
  result = sub_20CF61A28(v22, v23);
  *a1 = v13;
  a1[1] = v14;
  a1[2] = v15;
  a1[3] = v16;
  a1[4] = v17;
  a1[5] = v18;
  a1[6] = v19;
  a1[7] = v20;
  a1[8] = v21;
  return result;
}

uint64_t sub_20CF61C2C()
{
  return sub_20CF62FC4(&qword_25499BD88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_20CF61C58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  type metadata accessor for RecognizedItem.Barcode(0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem.Text(0);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF619A0(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CF619E4((uint64_t)v10, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    v11 = sub_20CF78934();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, v5, v11);
    v12 = (uint64_t)v5;
    v13 = type metadata accessor for RecognizedItem.Barcode;
  }
  else
  {
    sub_20CF619E4((uint64_t)v10, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    v14 = sub_20CF78934();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, v8, v14);
    v12 = (uint64_t)v8;
    v13 = type metadata accessor for RecognizedItem.Text;
  }
  return sub_20CF61A28(v12, v13);
}

uint64_t *initializeBufferWithCopyOfBuffer for RecognizedItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = sub_20CF78934();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
      v8 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    else
      v8 = (int *)type metadata accessor for RecognizedItem.Text(0);
    v9 = v8[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    v13 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v13;
    v14 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v10 + 8) = v14;
    v15 = v8[6];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = v8[7];
    v20 = *(void **)((char *)a2 + v19);
    *(uint64_t *)((char *)a1 + v19) = (uint64_t)v20;
    v21 = v14;
    swift_bridgeObjectRetain();
    v22 = v20;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for RecognizedItem(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v3 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  if (EnumCaseMultiPayload == 1)
    v4 = type metadata accessor for RecognizedItem.Barcode(0);
  else
    v4 = type metadata accessor for RecognizedItem.Text(0);
  v5 = v4;

  swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
    v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
  else
    v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
  v7 = v6[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  v11 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  v12 = *(void **)(v9 + 64);
  *(_QWORD *)(v8 + 64) = v12;
  v13 = v6[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = v6[7];
  v18 = *(void **)(a2 + v17);
  *(_QWORD *)(a1 + v17) = v18;
  v19 = v12;
  swift_bridgeObjectRetain();
  v20 = v18;
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  if (a1 != a2)
  {
    sub_20CF61A28(a1, type metadata accessor for RecognizedItem);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = sub_20CF78934();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
      v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    else
      v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
    v7 = v6[5];
    v8 = a1 + v7;
    v9 = a2 + v7;
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = *(_OWORD *)(v9 + 48);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v8 + 64) = v10;
    v11 = v6[6];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    *v12 = *v13;
    v12[1] = v13[1];
    v14 = v6[7];
    v15 = *(void **)(a2 + v14);
    *(_QWORD *)(a1 + v14) = v15;
    v16 = v10;
    swift_bridgeObjectRetain();
    v17 = v15;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
    v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
  else
    v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
  v7 = v6[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
  v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
  *(_QWORD *)(a1 + v6[7]) = *(_QWORD *)(a2 + v6[7]);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  if (a1 != a2)
  {
    sub_20CF61A28(a1, type metadata accessor for RecognizedItem);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = sub_20CF78934();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
      v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    else
      v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
    v7 = v6[5];
    v8 = a1 + v7;
    v9 = a2 + v7;
    v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v10;
    *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
    v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
    *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
    *(_QWORD *)(a1 + v6[7]) = *(_QWORD *)(a2 + v6[7]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for RecognizedItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_20CF62394()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_20CF623A4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for RecognizedItem.Text(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for RecognizedItem.Barcode(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RecognizedItem.Bounds(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for RecognizedItem.Bounds(uint64_t a1)
{

}

uint64_t initializeWithCopy for RecognizedItem.Bounds(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;
  id v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = v5;
  return a1;
}

_QWORD *assignWithCopy for RecognizedItem.Bounds(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  v3 = (void *)a2[8];
  v4 = (void *)a1[8];
  a1[8] = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for RecognizedItem.Bounds(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Bounds(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Bounds(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RecognizedItem.Bounds()
{
  return &type metadata for RecognizedItem.Bounds;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Text()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Text()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CF62650()
{
  return sub_20CF62B7C();
}

uint64_t *_s9VisionKit14RecognizedItemO4TextVwCP_0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20CF78934();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    v13 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v13;
    v14 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v10 + 8) = v14;
    v15 = (uint64_t *)((char *)a1 + v9);
    v16 = (uint64_t *)((char *)a2 + v9);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = a3[7];
    v19 = *(void **)((char *)a2 + v18);
    *(uint64_t *)((char *)a1 + v18) = (uint64_t)v19;
    v20 = v14;
    swift_bridgeObjectRetain();
    v21 = v19;
  }
  return a1;
}

void _s9VisionKit14RecognizedItemO4TextVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwcp_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v6 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  v12 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v12;
  v13 = *(void **)(v10 + 64);
  *(_QWORD *)(v9 + 64) = v13;
  v14 = (_QWORD *)(a1 + v8);
  v15 = (_QWORD *)(a2 + v8);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a3[7];
  v18 = *(void **)(a2 + v17);
  *(_QWORD *)(a1 + v17) = v18;
  v19 = v13;
  swift_bridgeObjectRetain();
  v20 = v18;
  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwca_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  v8[6] = v9[6];
  v8[7] = v9[7];
  v10 = (void *)v9[8];
  v11 = (void *)v8[8];
  v8[8] = v10;
  v12 = v10;

  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[7];
  v17 = *(void **)(a2 + v16);
  v18 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = v17;
  v19 = v17;

  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwtk_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v6 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)(v9 + 64) = *(_QWORD *)(v10 + 64);
  v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwta_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v6 = sub_20CF78934();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  v11 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  v12 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);

  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[7];
  v19 = *(void **)(a1 + v18);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);

  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Barcode()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20CF78934();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 64);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Barcode()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20CF78934();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 64) = (a2 - 1);
  return result;
}

uint64_t sub_20CF62B70()
{
  return sub_20CF62B7C();
}

uint64_t sub_20CF62B7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CF78934();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for VNBarcodeSymbology(uint64_t a1)
{
  sub_20CF6324C(a1, &qword_25499BDC0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_20CF6324C(a1, &qword_25499BDC8);
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

uint64_t sub_20CF62C44(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CF62C64(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_20CF6324C(a1, &qword_25499BDD0);
}

void sub_20CF62CA4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_20CF62CAC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_20CF62CC0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

_QWORD *sub_20CF62CD4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_20CF62CE0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

uint64_t sub_20CF62CF4(uint64_t a1, uint64_t a2)
{
  return sub_20CF6303C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20CF62D00(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20CF78A18();
  *a2 = 0;
  return result;
}

uint64_t sub_20CF62D74(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20CF78A24();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20CF62DF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20CF78A30();
  v2 = sub_20CF78A0C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_20CF62E30@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_20CF62E44(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_20CF62E74(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

void sub_20CF62E88(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_20CF62E94(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20CF62EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20CF78A0C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20CF62EEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20CF78A30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CF62F14()
{
  sub_20CF62FC4(&qword_25499BDF0, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_20CF79618);
  sub_20CF62FC4(&qword_25499BDF8, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_20CF795B8);
  return sub_20CF78C28();
}

uint64_t sub_20CF62F98()
{
  return sub_20CF62FC4(&qword_25499BDD8, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_20CF7957C);
}

uint64_t sub_20CF62FC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212B99268](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20CF63004()
{
  return sub_20CF62FC4(&qword_25499BDE0, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_20CF79550);
}

uint64_t sub_20CF63030(uint64_t a1, uint64_t a2)
{
  return sub_20CF6303C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20CF6303C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20CF78A30();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20CF63078()
{
  sub_20CF78A30();
  sub_20CF78A3C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CF630B8()
{
  uint64_t v0;

  sub_20CF78A30();
  sub_20CF78C94();
  sub_20CF78A3C();
  v0 = sub_20CF78CAC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20CF63128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20CF78A30();
  v2 = v1;
  if (v0 == sub_20CF78A30() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20CF78C34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_20CF631B0()
{
  return sub_20CF62FC4(&qword_25499BDE8, (uint64_t (*)(uint64_t))type metadata accessor for VNBarcodeSymbology, (uint64_t)&unk_20CF795EC);
}

void type metadata accessor for VKSceneStabilityState(uint64_t a1)
{
  sub_20CF6324C(a1, &qword_25499BE00);
}

uint64_t sub_20CF631F0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CF63210(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_20CF6324C(a1, &qword_25499BE08);
}

void sub_20CF6324C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20CF632B0()
{
  return 1;
}

uint64_t ImageAnalysisInteractionDelegate.interaction(_:shouldBeginAt:for:)()
{
  return 1;
}

double sub_20CF632C0()
{
  return 0.0;
}

double ImageAnalysisInteractionDelegate.contentsRect(for:)()
{
  return 0.0;
}

id sub_20CF632E8(uint64_t a1)
{
  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                               + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
}

id ImageAnalysisInteractionDelegate.contentView(for:)(uint64_t a1)
{
  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                               + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
}

id sub_20CF63340(uint64_t a1)
{
  id v1;
  id v2;
  id v3;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
  v2 = objc_msgSend(v1, sel_window);

  v3 = objc_msgSend(v2, sel_rootViewController);
  return v3;
}

id ImageAnalysisInteractionDelegate.presentingViewController(for:)(uint64_t a1)
{
  id v1;
  id v2;
  id v3;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
  v2 = objc_msgSend(v1, sel_window);

  v3 = objc_msgSend(v2, sel_rootViewController);
  return v3;
}

id ImageAnalysisInteraction.view.getter()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
}

uint64_t ImageAnalysisInteraction.InteractionTypes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ImageAnalysisInteraction.InteractionTypes.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ImageAnalysisInteraction.InteractionTypes.rawValue.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalysisInteraction::InteractionTypes __swiftcall ImageAnalysisInteraction.InteractionTypes.init(rawValue:)(VisionKit::ImageAnalysisInteraction::InteractionTypes rawValue)
{
  VisionKit::ImageAnalysisInteraction::InteractionTypes *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ImageAnalysisInteraction.InteractionTypes.automatic.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ImageAnalysisInteraction.InteractionTypes.automaticTextOnly.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static ImageAnalysisInteraction.InteractionTypes.textSelection.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ImageAnalysisInteraction.InteractionTypes.dataDetectors.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ImageAnalysisInteraction.InteractionTypes.imageSubject.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static ImageAnalysisInteraction.InteractionTypes.visualLookUp.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

_QWORD *sub_20CF63510@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_20CF63524@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_20CF63538@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_20CF63564@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_20CF63588(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_20CF6359C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_20CF635B0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_20CF635C4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_20CF635D4()
{
  return sub_20CF78B8C();
}

_QWORD *sub_20CF635EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_20CF63600@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

id ImageAnalysisInteraction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *ImageAnalysisInteraction.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  char *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction;
  v3 = objc_allocWithZone(MEMORY[0x24BEBFF28]);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, sel_init);
  v5 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_proxy;
  *(_QWORD *)&v4[v5] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy()), sel_init);
  *(_QWORD *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes] = 0;

  v10.receiver = v4;
  v10.super_class = ObjectType;
  v6 = (char *)objc_msgSendSuper2(&v10, sel_init);
  v7 = *(void **)&v6[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  v8 = v6;
  objc_msgSend(v7, sel_setActionInfoViewHidden_, 0);
  objc_msgSend(v7, sel_set_isPublicAPI_, 1);
  objc_msgSend(v7, sel_setDelegate_, *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_proxy]);
  objc_msgSend(v7, sel_setAnalysisButtonRequiresVisibleContentGating_, 0);
  swift_unknownObjectWeakAssign();

  return v8;
}

uint64_t type metadata accessor for ImageAnalysisInteractionDelegateProxy()
{
  return objc_opt_self();
}

id ImageAnalysisInteraction._internalInteraction.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
}

uint64_t ImageAnalysisInteraction.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  return MEMORY[0x212B99358](v1);
}

uint64_t sub_20CF6382C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  v4 = *a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = v2;
  v5 = swift_unknownObjectWeakAssign();
  v6 = *(void **)(v3 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v7 = MEMORY[0x212B99358](v5);
  swift_unknownObjectRetain();
  if (v7)
    swift_unknownObjectRelease();
  objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  return swift_unknownObjectRelease();
}

uint64_t ImageAnalysisInteraction.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  v5 = swift_unknownObjectWeakAssign();
  v6 = *(void **)(v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v7 = MEMORY[0x212B99358](v5);
  if (v7)
    swift_unknownObjectRelease();
  objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  return swift_unknownObjectRelease();
}

void (*ImageAnalysisInteraction.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x212B99358](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_20CF639E8;
}

void sub_20CF639E8(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = *(_QWORD **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    v4 = v3[5];
    v5 = v4 + v3[6];
    swift_endAccess();
    swift_unknownObjectRelease();
    v6 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v7 = MEMORY[0x212B99358](v5);
    if (v7)
      swift_unknownObjectRelease();
    objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  }
  free(v3);
}

char *ImageAnalysisInteraction.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v4;
  char *v5;

  v4 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v5 = &v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate];
  swift_beginAccess();
  *((_QWORD *)v5 + 1) = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t ImageAnalysisInteraction.analysis.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t ImageAnalysisInteraction.analysis.setter(uint64_t a1)
{
  sub_20CF678A8(a1);
  return swift_release();
}

void (*ImageAnalysisInteraction.analysis.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_20CF63BE8;
}

void sub_20CF63BE8(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v6 = *(_QWORD *)(v4 + v3[4]);
    if (v6)
      v7 = *(id *)(v6 + 16);
    else
      v7 = 0;
    objc_msgSend(v5, sel_setAnalysis_, v7);

  }
  free(v3);
}

Swift::Void __swiftcall ImageAnalysisInteraction.willMove(to:)(UIView_optional *to)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  if (!to)
  {
    v2 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v3 = objc_msgSend(v2, sel_view);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_removeInteraction_, v2);

    }
  }
}

Swift::Void __swiftcall ImageAnalysisInteraction.didMove(to:)(UIView_optional *to)
{
  uint64_t v1;
  void *v2;
  UIView_optional *v3;

  if (to)
  {
    v2 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v3 = to;
    -[UIView_optional addInteraction:](v3, sel_addInteraction_, v2);
    sub_20CF67D50(0, &qword_25499BE40);
    objc_msgSend(v2, sel_setWantsAutomaticContentsRectCalculation_, -[UIView_optional isKindOfClass:](v3, sel_isKindOfClass_, swift_getObjCClassFromMetadata()));

  }
}

uint64_t ImageAnalysisInteraction.preferredInteractionTypes.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

void ImageAnalysisInteraction.preferredInteractionTypes.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  *v3 = v2;
  sub_20CF63F3C();
}

void sub_20CF63F3C()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v3 = *v1;
  objc_msgSend(v2, sel_set_isInPublicAutomaticMode_, (*v1 & 0x21) != 0);
  if ((v3 & 1) != 0)
  {
    if (objc_msgSend(v2, sel_highlightSelectableItems))
      v5 = 11;
    else
      v5 = 9;
  }
  else
  {
    if ((v3 & 0x20) == 0)
    {
      v4 = *v1;
      if ((*v1 & 1) != 0)
      {
        if ((v4 & 0x20) == 0)
        {
          v5 = 9;
          if ((v4 & 2) == 0)
          {
            if ((v4 & 4) == 0)
              goto LABEL_23;
            goto LABEL_17;
          }
          goto LABEL_22;
        }
      }
      else if ((v4 & 0x20) == 0)
      {
        if ((v4 & 2) == 0)
        {
          v5 = 0;
          if ((v4 & 4) == 0)
          {
LABEL_23:
            if ((v4 & 8) == 0)
            {
LABEL_24:
              if ((v4 & 0x10) == 0)
                goto LABEL_26;
              goto LABEL_25;
            }
LABEL_18:
            v5 |= 8uLL;
            if ((v4 & 0x10) == 0)
              goto LABEL_26;
LABEL_25:
            v5 |= 4uLL;
            goto LABEL_26;
          }
LABEL_17:
          v5 |= 2uLL;
          if ((v4 & 8) == 0)
            goto LABEL_24;
          goto LABEL_18;
        }
        v5 = 1;
LABEL_22:
        if ((v4 & 4) == 0)
          goto LABEL_23;
        goto LABEL_17;
      }
      v5 = 1;
      goto LABEL_26;
    }
    if (objc_msgSend(v2, sel_highlightSelectableItems))
      v5 = 3;
    else
      v5 = 1;
  }
LABEL_26:
  objc_msgSend(v2, sel_setActiveInteractionTypes_, v5);
  if (*v1)
  {
    v6 = objc_msgSend(v2, sel_view);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_setUserInteractionEnabled_, 1);

    }
  }
}

id ImageAnalysisInteraction.selectableItemsHighlighted.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_highlightSelectableItems);
}

void (*ImageAnalysisInteraction.preferredInteractionTypes.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_20CF64114;
}

void sub_20CF64114(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_20CF63F3C();
}

unint64_t ImageAnalysisInteraction.activeInteractionTypes.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t result;

  result = (unint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_activeInteractionTypes);
  *a1 = result & 8 | (2 * (result & 3)) & 0xEF | (16 * ((result >> 2) & 1));
  return result;
}

id ImageAnalysisInteraction.selectableItemsHighlighted.setter(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setHighlightSelectableItems_, a1 & 1);
}

id (*ImageAnalysisInteraction.selectableItemsHighlighted.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_highlightSelectableItems);
  return sub_20CF641F4;
}

id sub_20CF641F4(uint64_t a1, uint64_t a2)
{
  return sub_20CF6429C(a1, a2, (SEL *)&selRef_setHighlightSelectableItems_);
}

id ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_allowLongPressForDataDetectorsInTextMode);
}

id ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.setter(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setAllowLongPressForDataDetectorsInTextMode_, a1 & 1);
}

id (*ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_allowLongPressForDataDetectorsInTextMode);
  return sub_20CF64290;
}

id sub_20CF64290(uint64_t a1, uint64_t a2)
{
  return sub_20CF6429C(a1, a2, (SEL *)&selRef_setAllowLongPressForDataDetectorsInTextMode_);
}

id sub_20CF6429C(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend(*(id *)a1, *a3, *(unsigned __int8 *)(a1 + 8));
}

id ImageAnalysisInteraction.hasActiveTextSelection.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_hasActiveTextSelection);
}

Swift::Void __swiftcall ImageAnalysisInteraction.resetTextSelection()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_resetSelection);
}

uint64_t ImageAnalysisInteraction.text.getter()
{
  return sub_20CF6430C((SEL *)&selRef_text);
}

uint64_t ImageAnalysisInteraction.selectedText.getter()
{
  return sub_20CF6430C((SEL *)&selRef_selectedText);
}

uint64_t sub_20CF6430C(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a1));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20CF78A30();

  return v4;
}

uint64_t ImageAnalysisInteraction.selectedAttributedText.getter()
{
  uint64_t v0;
  id v1;
  void *v2;

  if (!objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_selectedAttributedText))
  {
    v1 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v2 = (void *)sub_20CF78A0C();
    objc_msgSend(v1, sel_initWithString_, v2);

  }
  return sub_20CF788EC();
}

_QWORD *ImageAnalysisInteraction.selectedRanges.getter()
{
  char *v0;
  id v1;
  unint64_t v2;
  char *v3;
  _QWORD *v4;

  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction], sel_selectedRanges);
  sub_20CF67D50(0, &qword_25499BE48);
  v2 = sub_20CF78A60();

  v3 = v0;
  v4 = sub_20CF6794C(v2, (uint64_t)v3);
  swift_bridgeObjectRelease();

  return v4;
}

void sub_20CF644AC(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  id v4;
  unint64_t v5;
  id v6;
  _QWORD *v7;

  v3 = *a1;
  v4 = objc_msgSend(*(id *)((char *)*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_selectedRanges);
  sub_20CF67D50(0, &qword_25499BE48);
  v5 = sub_20CF78A60();

  v6 = v3;
  v7 = sub_20CF6794C(v5, (uint64_t)v6);
  swift_bridgeObjectRelease();

  *a2 = v7;
}

void sub_20CF64558(uint64_t a1, id *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)((char *)*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v3 = *a2;
  v4 = swift_bridgeObjectRetain();
  sub_20CF67B60(v4, (uint64_t)v3);
  swift_bridgeObjectRelease();

  sub_20CF67D50(0, &qword_25499BE48);
  v5 = (id)sub_20CF78A54();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSelectedRanges_, v5);

}

void ImageAnalysisInteraction.selectedRanges.setter(uint64_t a1)
{
  char *v1;
  void *v3;
  char *v4;
  id v5;

  v3 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  v4 = v1;
  sub_20CF67B60(a1, (uint64_t)v4);
  swift_bridgeObjectRelease();

  sub_20CF67D50(0, &qword_25499BE48);
  v5 = (id)sub_20CF78A54();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setSelectedRanges_, v5);

}

void (*ImageAnalysisInteraction.selectedRanges.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  char *v1;
  _QWORD *v3;
  void *v4;
  id v5;
  unint64_t v6;
  char *v7;
  _QWORD *v8;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  v3[1] = v1;
  v3[2] = v4;
  v5 = objc_msgSend(v4, sel_selectedRanges);
  v3[3] = sub_20CF67D50(0, &qword_25499BE48);
  v6 = sub_20CF78A60();

  v7 = v1;
  v8 = sub_20CF6794C(v6, (uint64_t)v7);
  v3[4] = 0;

  swift_bridgeObjectRelease();
  *v3 = v8;
  return sub_20CF64788;
}

void sub_20CF64788(uint64_t **a1, char a2)
{
  uint64_t *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = *a1;
  v4 = **a1;
  v5 = (id)(*a1)[1];
  v6 = (void *)v3[2];
  if ((a2 & 1) != 0)
  {
    v7 = swift_bridgeObjectRetain();
    sub_20CF67B60(v7, (uint64_t)v5);

    swift_bridgeObjectRelease();
    v8 = (void *)sub_20CF78A54();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setSelectedRanges_, v8);

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20CF67B60(v4, (uint64_t)v5);

    swift_bridgeObjectRelease();
    v9 = (void *)sub_20CF78A54();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setSelectedRanges_, v9);

  }
  free(v3);
}

Swift::Void __swiftcall ImageAnalysisInteraction.setContentsRectNeedsUpdate()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_updateContentsRect);
}

id ImageAnalysisInteraction.contentsRect.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_contentsRect);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasInteractiveItem(at:)(CGPoint at)
{
  return sub_20CF648F4((SEL *)&selRef_interactableItemExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasText(at:)(CGPoint at)
{
  return sub_20CF648F4((SEL *)&selRef_textExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasDataDetector(at:)(CGPoint at)
{
  return sub_20CF648F4((SEL *)&selRef_dataDetectorExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasSupplementaryInterface(at:)(CGPoint at)
{
  return sub_20CF648F4((SEL *)&selRef_actionInfoItemExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.analysisHasText(at:)(CGPoint at)
{
  return sub_20CF648F4((SEL *)&selRef_analysisContainsTextAtPoint_);
}

id sub_20CF648F4(SEL *a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a1);
}

id ImageAnalysisInteraction.liveTextButtonVisible.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_liveTextButtonVisible);
}

id ImageAnalysisInteraction.isSupplementaryInterfaceHidden.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoViewHidden);
}

id ImageAnalysisInteraction.isSupplementaryInterfaceHidden.setter(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, a1 & 1, 1);
}

id (*ImageAnalysisInteraction.isSupplementaryInterfaceHidden.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_actionInfoViewHidden);
  return sub_20CF649D8;
}

id sub_20CF649D8(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setActionInfoViewHidden_animated_, *(unsigned __int8 *)(a1 + 8), 1);
}

Swift::Void __swiftcall ImageAnalysisInteraction.setSupplementaryInterfaceHidden(_:animated:)(Swift::Bool _, Swift::Bool animated)
{
  uint64_t v2;

  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, _, animated);
}

id ImageAnalysisInteraction.supplementaryInterfaceContentInsets.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoEdgeInsets);
}

id ImageAnalysisInteraction.supplementaryInterfaceContentInsets.setter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoEdgeInsets_);
}

void (*ImageAnalysisInteraction.supplementaryInterfaceContentInsets.modify(_QWORD *a1))(double **a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v3[4] = v4;
  objc_msgSend(v4, sel_actionInfoEdgeInsets);
  *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  return sub_20CF64AB0;
}

void sub_20CF64AB0(double **a1)
{
  double *v1;

  v1 = *a1;
  objc_msgSend(*((id *)*a1 + 4), sel_setActionInfoEdgeInsets_, *v1, v1[1], v1[2], v1[3]);
  free(v1);
}

id ImageAnalysisInteraction.supplementaryInterfaceFont.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoCustomFont);
}

void ImageAnalysisInteraction.supplementaryInterfaceFont.setter(void *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoCustomFont_, a1);

}

void (*ImageAnalysisInteraction.supplementaryInterfaceFont.modify(_QWORD *a1))(id *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_actionInfoCustomFont);
  return sub_20CF64BA0;
}

void sub_20CF64BA0(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setActionInfoCustomFont_);

}

uint64_t static ImageAnalysisInteraction.SubjectUnavailable.== infix(_:_:)()
{
  return 1;
}

uint64_t ImageAnalysisInteraction.SubjectUnavailable.hash(into:)()
{
  return sub_20CF78CA0();
}

uint64_t ImageAnalysisInteraction.SubjectUnavailable.hashValue.getter()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF64C40()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF64C80()
{
  return sub_20CF78CA0();
}

uint64_t sub_20CF64CA4()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

double ImageAnalysisInteraction.Subject.bounds.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;

  v1 = sub_20CF78994();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + 8);
  sub_20CF7897C();
  v6 = (void *)sub_20CF78958();
  objc_msgSend(v5, sel_imageSubjectBoundsWithIndexes_, v6);
  v8 = v7;

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v8;
}

uint64_t ImageAnalysisInteraction.Subject.image.getter()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_20CF78994();
  v1[16] = v2;
  v1[17] = *(_QWORD *)(v2 - 8);
  v3 = swift_task_alloc();
  v4 = *v0;
  v5 = v0[1];
  v1[18] = v3;
  v1[19] = v4;
  v1[20] = v5;
  return swift_task_switch();
}

uint64_t sub_20CF64E28()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[20];
  sub_20CF7897C();
  v2 = sub_20CF78958();
  v0[21] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20CF64EE0;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_20CF65004;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(v1, sel_loadImageSubjectWithIndexes_completion_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20CF64EE0()
{
  return swift_task_switch();
}

uint64_t sub_20CF64F2C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 128);
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));

    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {

    sub_20CF67D0C();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20CF65004(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_20CF68900((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t ImageAnalysisInteraction.Subject.hash(into:)()
{
  return sub_20CF78CA0();
}

uint64_t static ImageAnalysisInteraction.Subject.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != *a2)
    return 0;
  sub_20CF67D50(0, &qword_25499BE60);
  return sub_20CF78B5C() & 1;
}

uint64_t ImageAnalysisInteraction.Subject.hashValue.getter()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF65120()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF65164()
{
  return sub_20CF78CA0();
}

uint64_t sub_20CF6518C()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF651CC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != *a2)
    return 0;
  sub_20CF67D50(0, &qword_25499BE60);
  return sub_20CF78B5C() & 1;
}

uint64_t ImageAnalysisInteraction.subjects.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[19] = v0;
  v2 = sub_20CF78940();
  v1[20] = v2;
  v1[21] = *(_QWORD *)(v2 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v3 = sub_20CF78994();
  v1[24] = v3;
  v1[25] = *(_QWORD *)(v3 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = __swift_instantiateConcreteTypeFromMangledName(&qword_25499BE70);
  v1[28] = swift_task_alloc();
  sub_20CF78AC0();
  v1[29] = sub_20CF78AB4();
  v1[30] = sub_20CF78A90();
  v1[31] = v4;
  return swift_task_switch();
}

uint64_t sub_20CF65328()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[19] + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v0[32] = v1;
  v0[2] = v0;
  v0[3] = sub_20CF653C4;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20CF65650;
  v3[3] = &block_descriptor_2;
  v3[4] = v2;
  objc_msgSend(v1, sel_beginImageSubjectAnalysisIfNecessaryWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_20CF653C4()
{
  return swift_task_switch();
}

uint64_t sub_20CF65408()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD);
  uint64_t *v21;
  uint64_t v22;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[2];

  v1 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 168);
  swift_release();
  v27 = MEMORY[0x24BEE4B08];
  v8 = objc_msgSend(v1, sel_allSubjectIndexes);
  sub_20CF78964();

  sub_20CF7894C();
  v24 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v25 = v6;
  v24(v3, v5);
  v9 = v2 + *(int *)(v4 + 36);
  v26 = v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  while (1)
  {
    v11 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 160);
    v10(v11, v9, v13);
    sub_20CF62FC4(&qword_25499BE78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF428], MEMORY[0x24BDCF460]);
    sub_20CF78AFC();
    sub_20CF62FC4(&qword_25499BE80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF320], MEMORY[0x24BDCF330]);
    v14 = sub_20CF78A00();
    v15 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v15(v12, v13);
    v15(v11, v13);
    if ((v14 & 1) != 0)
      break;
    v16 = *(void **)(v0 + 256);
    v17 = *(_QWORD *)(v0 + 224);
    v18 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 192);
    v20 = (void (*)(uint64_t, _QWORD))sub_20CF78B14();
    v22 = *v21;
    v20(v0 + 120, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v18, v17, v19);
    sub_20CF78B08();
    v24(v18, v19);
    sub_20CF66934(v28, v22, v16);

  }
  sub_20CF67DC8(*(_QWORD *)(v0 + 224));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v27);
}

uint64_t sub_20CF65650()
{
  return swift_continuation_resume();
}

uint64_t ImageAnalysisInteraction.highlightedSubjects.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  char *v16;
  char v17;
  void (*v18)(char *, uint64_t);
  void (*v19)(uint64_t *, _QWORD);
  uint64_t *v20;
  uint64_t v21;
  void (*v23)(char *, uint64_t);
  id v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28[4];
  uint64_t v29;

  v1 = sub_20CF78940();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - v6;
  v8 = sub_20CF78994();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499BE70);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BEE4B08];
  v24 = *(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v15 = objc_msgSend(v24, sel_selectedSubjectIndexes);
  sub_20CF78964();

  sub_20CF7894C();
  v25 = v9;
  v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23(v11, v8);
  v16 = &v14[*(int *)(v12 + 36)];
  v26 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v27 = v2;
  while (1)
  {
    v26(v7, v16, v1);
    sub_20CF62FC4(&qword_25499BE78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF428], MEMORY[0x24BDCF460]);
    sub_20CF78AFC();
    sub_20CF62FC4(&qword_25499BE80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF320], MEMORY[0x24BDCF330]);
    v17 = sub_20CF78A00();
    v18 = *(void (**)(char *, uint64_t))(v27 + 8);
    v18(v5, v1);
    v18(v7, v1);
    if ((v17 & 1) != 0)
      break;
    v19 = (void (*)(uint64_t *, _QWORD))sub_20CF78B14();
    v21 = *v20;
    v19(v28, 0);
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v11, v14, v8);
    sub_20CF78B08();
    v23(v11, v8);
    sub_20CF66934(v28, v21, v24);

  }
  sub_20CF67DC8((uint64_t)v14);
  return v29;
}

id ImageAnalysisInteraction.highlightedSubjects.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  id result;
  int64_t v12;
  int v13;
  int v14;
  char v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;

  v3 = sub_20CF78994();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    v32 = v8;
    v33 = (char *)&v31 - v6;
    v34 = v1;
    v35 = v7;
    v36 = v5;
    v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_20CF673AC(0, v9, 0);
    v10 = v38;
    result = (id)sub_20CF67724(a1);
    v12 = (int64_t)result;
    v14 = v13;
    v16 = v15 & 1;
    do
    {
      if (v12 < 0 || v12 >= 1 << *(_BYTE *)(a1 + 32))
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
        return result;
      }
      if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_16;
      if (*(_DWORD *)(a1 + 36) != v14)
        goto LABEL_17;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
      v38 = v10;
      v19 = v10[2];
      v18 = v10[3];
      if (v19 >= v18 >> 1)
      {
        sub_20CF673AC(v18 > 1, v19 + 1, 1);
        v10 = v38;
      }
      v10[2] = v19 + 1;
      v10[v19 + 4] = v17;
      result = (id)sub_20CF677C4(v12, v14, v16 & 1, a1);
      v12 = (int64_t)result;
      v14 = v20;
      v16 = v21 & 1;
      --v9;
    }
    while (v9);
    sub_20CF67E08((uint64_t)result, v20, v21 & 1);
    swift_bridgeObjectRelease();
    sub_20CF62FC4(&qword_25499BE88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF428], MEMORY[0x24BDCF468]);
    v22 = v32;
    v23 = v36;
    sub_20CF78B98();
    v24 = v10[2];
    if (v24)
    {
      v25 = v10 + 4;
      do
      {
        v26 = *v25++;
        v37 = v26;
        sub_20CF78B80();
        --v24;
      }
      while (v24);
    }
    swift_release();
    v27 = v35;
    v28 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v33, v22, v23);
    v29 = *(void **)(v34 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v30 = (void *)sub_20CF78958();
    objc_msgSend(v29, sel_highlightSubjectAtIndexSet_showCallout_showBurst_burstPoint_animated_, v30, 0, 0, 1, 0.0, 0.0);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v28, v23);
  }
  else
  {
    swift_bridgeObjectRelease();
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_highlightSubjectAtIndexSet_showCallout_showBurst_burstPoint_animated_, 0, 0, 0, 1, 0.0, 0.0);
  }
}

id (*ImageAnalysisInteraction.highlightedSubjects.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = ImageAnalysisInteraction.highlightedSubjects.getter();
  return sub_20CF65C48;
}

id sub_20CF65C48(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
    return ImageAnalysisInteraction.highlightedSubjects.setter(*a1);
  v2 = swift_bridgeObjectRetain();
  ImageAnalysisInteraction.highlightedSubjects.setter(v2);
  return (id)swift_bridgeObjectRelease();
}

uint64_t ImageAnalysisInteraction.subject(at:)(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 144) = v3;
  *(double *)(v4 + 128) = a2;
  *(double *)(v4 + 136) = a3;
  *(_QWORD *)(v4 + 120) = a1;
  sub_20CF78AC0();
  *(_QWORD *)(v4 + 152) = sub_20CF78AB4();
  *(_QWORD *)(v4 + 160) = sub_20CF78A90();
  *(_QWORD *)(v4 + 168) = v5;
  return swift_task_switch();
}

uint64_t sub_20CF65D00()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[18] + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v0[22] = v1;
  v0[2] = v0;
  v0[3] = sub_20CF65D9C;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20CF65650;
  v3[3] = &block_descriptor_3;
  v3[4] = v2;
  objc_msgSend(v1, sel_beginImageSubjectAnalysisIfNecessaryWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_20CF65D9C()
{
  return swift_task_switch();
}

uint64_t sub_20CF65DE0()
{
  uint64_t v0;
  id v1;
  void *v2;
  _QWORD *v3;
  _QWORD *v5;

  v1 = objc_msgSend(*(id *)(v0 + 176), sel_subjectIndexAtPoint_, *(double *)(v0 + 128), *(double *)(v0 + 136));
  if (v1)
  {
    v2 = v1;
    *(_QWORD *)(v0 + 184) = objc_msgSend(v1, sel_integerValue);

    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v3;
    *v3 = v0;
    v3[1] = sub_20CF65E84;
    return ImageAnalysisInteraction.subjects.getter();
  }
  else
  {
    v5 = *(_QWORD **)(v0 + 120);
    swift_release();
    *v5 = 0;
    v5[1] = 0;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20CF65E84(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CF65EDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  _QWORD *v16;
  id v17;
  _QWORD *v18;

  v1 = *(_QWORD *)(v0 + 200);
  result = swift_release();
  v3 = 0;
  v4 = v1 + 56;
  v5 = -1 << *(_BYTE *)(v1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v1 + 56);
  v8 = (unint64_t)(63 - v5) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_6;
    }
    v13 = v3 + 1;
    if (__OFADD__(v3, 1))
      break;
    if (v13 >= v8)
      goto LABEL_27;
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v13 + 1;
      if (v13 + 1 >= v8)
        goto LABEL_27;
      v14 = *(_QWORD *)(v4 + 8 * v3);
      if (!v14)
      {
        v3 = v13 + 2;
        if (v13 + 2 >= v8)
          goto LABEL_27;
        v14 = *(_QWORD *)(v4 + 8 * v3);
        if (!v14)
        {
          v3 = v13 + 3;
          if (v13 + 3 >= v8)
            goto LABEL_27;
          v14 = *(_QWORD *)(v4 + 8 * v3);
          if (!v14)
          {
            v3 = v13 + 4;
            if (v13 + 4 >= v8)
              goto LABEL_27;
            v14 = *(_QWORD *)(v4 + 8 * v3);
            if (!v14)
            {
              v15 = v13 + 5;
              if (v15 >= v8)
              {
LABEL_27:
                v18 = *(_QWORD **)(v0 + 120);
                swift_release();
                *v18 = 0;
                v18[1] = 0;
                return (*(uint64_t (**)(void))(v0 + 8))();
              }
              v14 = *(_QWORD *)(v4 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v3 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_30;
                  if (v3 >= v8)
                    goto LABEL_27;
                  v14 = *(_QWORD *)(v4 + 8 * v3);
                  ++v15;
                  if (v14)
                    goto LABEL_25;
                }
              }
              v3 = v15;
            }
          }
        }
      }
    }
LABEL_25:
    v7 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v3 << 6);
LABEL_6:
    v11 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v1 + 48);
    if (*(_QWORD *)(v12 + 16 * v10) == v11)
    {
      v16 = *(_QWORD **)(v0 + 120);
      v17 = *(id *)(v12 + 16 * v10 + 8);
      swift_release();
      *v16 = v11;
      v16[1] = v17;
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t ImageAnalysisInteraction.image(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[16] = a1;
  v2[17] = v1;
  v3 = sub_20CF78994();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = swift_task_alloc();
  sub_20CF78AC0();
  v2[21] = sub_20CF78AB4();
  v2[22] = sub_20CF78A90();
  v2[23] = v4;
  return swift_task_switch();
}

uint64_t sub_20CF66114()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = v0[16];
  sub_20CF78988();
  v2 = v1 + 56;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 56);
  v6 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_5;
    }
    v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v9 >= v6)
      goto LABEL_21;
    v10 = *(_QWORD *)(v2 + 8 * v9);
    ++v8;
    if (!v10)
    {
      v8 = v9 + 1;
      if (v9 + 1 >= v6)
        goto LABEL_21;
      v10 = *(_QWORD *)(v2 + 8 * v8);
      if (!v10)
      {
        v8 = v9 + 2;
        if (v9 + 2 >= v6)
          goto LABEL_21;
        v10 = *(_QWORD *)(v2 + 8 * v8);
        if (!v10)
          break;
      }
    }
LABEL_20:
    v5 = (v10 - 1) & v10;
LABEL_5:
    result = sub_20CF78970();
  }
  v11 = v9 + 3;
  if (v11 >= v6)
  {
LABEL_21:
    v12 = v0[17];
    swift_release();
    v13 = *(void **)(v12 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v14 = sub_20CF78958();
    v0[24] = v14;
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_20CF662F4;
    v15 = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v16 = v0 + 10;
    v16[1] = 0x40000000;
    v16[2] = sub_20CF65004;
    v16[3] = &block_descriptor_5;
    v16[4] = v15;
    objc_msgSend(v13, sel_loadImageSubjectWithIndexes_completion_, v14, v16);
    return swift_continuation_await();
  }
  v10 = *(_QWORD *)(v2 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v6)
      goto LABEL_21;
    v10 = *(_QWORD *)(v2 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_20CF662F4()
{
  return swift_task_switch();
}

uint64_t sub_20CF66338()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 144);
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));

    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {

    sub_20CF67D0C();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

id ImageAnalysisInteraction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20CF668F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20CF66934(uint64_t *a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  id v20;
  char isUniquelyReferenced_nonNull_native;
  id v23;
  uint64_t *v24;
  uint64_t v25;

  v4 = v3;
  v8 = *v3;
  sub_20CF78C94();
  sub_20CF78CA0();
  v9 = sub_20CF78CAC();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v24 = a1;
    v12 = ~v10;
    swift_bridgeObjectRetain();
    do
    {
      v13 = *(_QWORD *)(v8 + 48);
      if (*(_QWORD *)(v13 + 16 * v11) == a2)
      {
        v14 = *(void **)(v13 + 16 * v11 + 8);
        sub_20CF67D50(0, &qword_25499BE60);
        v15 = v14;
        v16 = sub_20CF78B5C();

        if ((v16 & 1) != 0)
        {

          swift_bridgeObjectRelease();
          v17 = (uint64_t *)(*(_QWORD *)(*v4 + 48) + 16 * v11);
          v19 = *v17;
          v18 = (void *)v17[1];
          *v24 = v19;
          v24[1] = (uint64_t)v18;
          v20 = v18;
          return 0;
        }
      }
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    swift_bridgeObjectRelease();
    a1 = v24;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v25 = *v4;
  *v4 = 0x8000000000000000;
  v23 = a3;
  sub_20CF66DB8(a2, (uint64_t)v23, v11, isUniquelyReferenced_nonNull_native);
  *v4 = v25;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = (uint64_t)v23;
  return 1;
}

uint64_t sub_20CF66AEC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFB0);
  result = sub_20CF78BC8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      sub_20CF78C94();
      sub_20CF78CA0();
      result = sub_20CF78CAC();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
      *v12 = v20;
      v12[1] = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

void sub_20CF66DB8(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;

  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0)
    goto LABEL_14;
  if ((a4 & 1) != 0)
  {
    sub_20CF66AEC();
  }
  else
  {
    if (v9 > v8)
    {
      sub_20CF66F60();
      goto LABEL_14;
    }
    sub_20CF67110();
  }
  v10 = *v4;
  sub_20CF78C94();
  sub_20CF78CA0();
  v11 = sub_20CF78CAC();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a3 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v13 = ~v12;
    while (1)
    {
      v14 = *(_QWORD *)(v10 + 48);
      if (*(_QWORD *)(v14 + 16 * a3) == a1)
      {
        v15 = *(void **)(v14 + 16 * a3 + 8);
        sub_20CF67D50(0, &qword_25499BE60);
        v16 = v15;
        v17 = sub_20CF78B5C();

        if ((v17 & 1) != 0)
          break;
      }
      a3 = (a3 + 1) & v13;
      if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
        goto LABEL_14;
    }
    sub_20CF78C4C();
    __break(1u);
  }
LABEL_14:
  v18 = *v23;
  *(_QWORD *)(*v23 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v19 = (_QWORD *)(*(_QWORD *)(v18 + 48) + 16 * a3);
  *v19 = a1;
  v19[1] = a2;
  v20 = *(_QWORD *)(v18 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v18 + 16) = v22;
}

id sub_20CF66F60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFB0);
  v2 = *v0;
  v3 = sub_20CF78BBC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_28;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
      {
        v9 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_28;
        v22 = *(_QWORD *)(v6 + 8 * v9);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = (void *)v17[1];
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    result = v18;
  }
  v23 = v21 + 3;
  if (v23 >= v13)
    goto LABEL_28;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20CF67110()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFB0);
  result = sub_20CF78BC8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
    v19 = *v18;
    v20 = (void *)v18[1];
    sub_20CF78C94();
    sub_20CF78CA0();
    result = sub_20CF78CAC();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
    *v12 = v19;
    v12[1] = v20;
    ++*(_QWORD *)(v4 + 16);
    result = v20;
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20CF673AC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_20CF673E4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_20CF673C8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_20CF67540(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_20CF673E4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFA8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

uint64_t sub_20CF67540(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFA0);
  v10 = *(_QWORD *)(type metadata accessor for RecognizedItem(0) - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for RecognizedItem(0) - 8);
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
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

uint64_t sub_20CF67724(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_20CF677C4(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_20CF678A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;

  v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis;
  swift_beginAccess();
  *(_QWORD *)v3 = a1;
  swift_retain();
  swift_release();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  if (*(_QWORD *)v3)
    v5 = *(id *)(*(_QWORD *)v3 + 16);
  else
    v5 = 0;
  objc_msgSend(v4, sel_setAnalysis_, v5);

}

_QWORD *sub_20CF6794C(unint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  id v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_18;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_20CF78BF8())
  {
    v20 = *(id *)(a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v22 = v3 & 0xC000000000000001;
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v5 = 4;
    v21 = v3;
    while (1)
    {
      v7 = v22 ? (id)MEMORY[0x212B98DE8](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      v8 = v7;
      v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      a2 = v4;
      objc_msgSend(v7, sel_rangeValue);
      v10 = objc_msgSend(v20, sel_text);
      if (v10)
      {
        v11 = v10;
        sub_20CF78A30();

      }
      v12 = sub_20CF78B20();
      v14 = v13;
      v16 = v15;

      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v23 = sub_20CF74C48(0, v23[2] + 1, 1, v23);
        v18 = v23[2];
        v17 = v23[3];
        if (v18 >= v17 >> 1)
          v23 = sub_20CF74C48((_QWORD *)(v17 > 1), v18 + 1, 1, v23);
        v23[2] = v18 + 1;
        v6 = &v23[2 * v18];
        v6[4] = v12;
        v6[5] = v14;
      }
      ++v5;
      v4 = a2;
      v3 = v21;
      if (v9 == a2)
        goto LABEL_20;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_20CF67B60(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = MEMORY[0x24BEE4AF8];
  v13 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v6 = (void *)objc_opt_self();
    v7 = 0;
    v8 = *(void **)(a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    do
    {
      v9 = objc_msgSend(v8, sel_text);
      if (v9)
      {
        v10 = v9;
        sub_20CF78A30();

      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFC0);
      sub_20CF68948();
      sub_20CF689D8();
      v11 = sub_20CF78B68();
      if (objc_msgSend(v6, sel_valueWithRange_, v11, v12))
      {
        MEMORY[0x212B98C5C]();
        if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_20CF78A78();
        sub_20CF78A84();
        sub_20CF78A6C();
      }
      ++v7;
    }
    while (v4 != v7);
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

unint64_t sub_20CF67D0C()
{
  unint64_t result;

  result = qword_25499BE58;
  if (!qword_25499BE58)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.SubjectUnavailable, &type metadata for ImageAnalysisInteraction.SubjectUnavailable);
    atomic_store(result, (unint64_t *)&qword_25499BE58);
  }
  return result;
}

uint64_t sub_20CF67D50(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B99250]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20CF67DC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499BE70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CF67E08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_20CF67E18()
{
  unint64_t result;

  result = qword_25499BEA0;
  if (!qword_25499BEA0)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.InteractionTypes, &type metadata for ImageAnalysisInteraction.InteractionTypes);
    atomic_store(result, (unint64_t *)&qword_25499BEA0);
  }
  return result;
}

unint64_t sub_20CF67E60()
{
  unint64_t result;

  result = qword_25499BEA8;
  if (!qword_25499BEA8)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.InteractionTypes, &type metadata for ImageAnalysisInteraction.InteractionTypes);
    atomic_store(result, (unint64_t *)&qword_25499BEA8);
  }
  return result;
}

unint64_t sub_20CF67EA8()
{
  unint64_t result;

  result = qword_25499BEB0;
  if (!qword_25499BEB0)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.InteractionTypes, &type metadata for ImageAnalysisInteraction.InteractionTypes);
    atomic_store(result, (unint64_t *)&qword_25499BEB0);
  }
  return result;
}

unint64_t sub_20CF67EF0()
{
  unint64_t result;

  result = qword_25499BEB8;
  if (!qword_25499BEB8)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.InteractionTypes, &type metadata for ImageAnalysisInteraction.InteractionTypes);
    atomic_store(result, (unint64_t *)&qword_25499BEB8);
  }
  return result;
}

unint64_t sub_20CF67F38()
{
  unint64_t result;

  result = qword_25499BEC0;
  if (!qword_25499BEC0)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.SubjectUnavailable, &type metadata for ImageAnalysisInteraction.SubjectUnavailable);
    atomic_store(result, (unint64_t *)&qword_25499BEC0);
  }
  return result;
}

unint64_t sub_20CF67F80()
{
  unint64_t result;

  result = qword_25499BEC8;
  if (!qword_25499BEC8)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalysisInteraction.Subject, &type metadata for ImageAnalysisInteraction.Subject);
    atomic_store(result, (unint64_t *)&qword_25499BEC8);
  }
  return result;
}

uint64_t sub_20CF67FC4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  result = MEMORY[0x212B99358](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_20CF68020@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_20CF68074()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_20CF678A8(v0);
  return swift_release();
}

uint64_t sub_20CF680A4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_20CF680F4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  *v3 = v2;
  sub_20CF63F3C();
}

id sub_20CF6814C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, (SEL *)&selRef_highlightSelectableItems, a2);
}

id sub_20CF68158(unsigned __int8 *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, (SEL *)&selRef_setHighlightSelectableItems_);
}

id sub_20CF68164@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, (SEL *)&selRef_allowLongPressForDataDetectorsInTextMode, a2);
}

id sub_20CF68170(unsigned __int8 *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, (SEL *)&selRef_setAllowLongPressForDataDetectorsInTextMode_);
}

id keypath_set_12Tm(unsigned __int8 *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a5, *a1);
}

id sub_20CF681A0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_11Tm(a1, (SEL *)&selRef_actionInfoViewHidden, a2);
}

id keypath_get_11Tm@<X0>(_QWORD *a1@<X0>, SEL *a2@<X3>, _BYTE *a3@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a2);
  *a3 = (_BYTE)result;
  return result;
}

id sub_20CF681E4(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, *a1, 1);
}

id sub_20CF68208@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoEdgeInsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_20CF68248(double *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoEdgeInsets_, *a1, a1[1], a1[2], a1[3]);
}

id sub_20CF6826C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoCustomFont);
  *a2 = result;
  return result;
}

id sub_20CF682B0(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoCustomFont_, *a1);
}

uint64_t sub_20CF682D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ImageAnalysisInteraction.highlightedSubjects.getter();
  *a1 = result;
  return result;
}

id sub_20CF682FC()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return ImageAnalysisInteraction.highlightedSubjects.setter(v0);
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:shouldBeginAt:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.contentsRect(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.contentView(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.presentingViewController(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:liveTextButtonDidChangeToVisible:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:highlightSelectedItemsDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.textSelectionDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t type metadata accessor for ImageAnalysisInteraction()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.InteractionTypes()
{
  return &type metadata for ImageAnalysisInteraction.InteractionTypes;
}

uint64_t getEnumTagSinglePayload for ImageAnalysisInteraction.SubjectUnavailable(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ImageAnalysisInteraction.SubjectUnavailable(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_20CF68420 + 4 * byte_20CF796E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20CF68440 + 4 * byte_20CF796E5[v4]))();
}

_BYTE *sub_20CF68420(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20CF68440(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20CF68448(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20CF68450(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20CF68458(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20CF68460(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_20CF6846C()
{
  return 0;
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.SubjectUnavailable()
{
  return &type metadata for ImageAnalysisInteraction.SubjectUnavailable;
}

_QWORD *initializeBufferWithCopyOfBuffer for ImageAnalysisInteraction.Subject(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for ImageAnalysisInteraction.Subject(uint64_t a1)
{

}

_QWORD *assignWithCopy for ImageAnalysisInteraction.Subject(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for ImageAnalysisInteraction.Subject(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ImageAnalysisInteraction.Subject(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageAnalysisInteraction.Subject(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.Subject()
{
  return &type metadata for ImageAnalysisInteraction.Subject;
}

uint64_t sub_20CF685BC(unint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  char v12;
  uint64_t v14;

  v7 = MEMORY[0x212B99358](v3 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x212B99358](v9))
  {

LABEL_5:
    v12 = 1;
    return v12 & 1;
  }
  v10 = *(_QWORD *)(v9 + 8);
  ObjectType = swift_getObjectType();
  v14 = a1 & 8 | (2 * (a1 & 3)) & 0xEF | (16 * ((a1 >> 2) & 1));
  v12 = (*(uint64_t (**)(void *, uint64_t *, uint64_t, uint64_t, double, double))(v10 + 8))(v8, &v14, ObjectType, v10, a2, a3);

  swift_unknownObjectRelease();
  return v12 & 1;
}

double sub_20CF686A4()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;

  v1 = MEMORY[0x212B99358](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  v2 = 0.0;
  if (v1)
  {
    v3 = (void *)v1;
    v4 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x212B99358](v4))
    {
      v5 = *(_QWORD *)(v4 + 8);
      ObjectType = swift_getObjectType();
      v2 = (*(double (**)(void *, uint64_t, uint64_t))(v5 + 16))(v3, ObjectType, v5);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
  return v2;
}

uint64_t sub_20CF68784()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;

  v1 = MEMORY[0x212B99358](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x212B99358](v3))
  {

    return 0;
  }
  v4 = *(_QWORD *)(v3 + 8);
  ObjectType = swift_getObjectType();
  v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 24))(v2, ObjectType, v4);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_20CF68830()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;

  v1 = MEMORY[0x212B99358](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x212B99358](v3))
  {

    return 0;
  }
  v4 = *(_QWORD *)(v3 + 8);
  ObjectType = swift_getObjectType();
  v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 32))(v2, ObjectType, v4);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_20CF688DC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_20CF68900(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_20CF68948()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499BFC8;
  if (!qword_25499BFC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499BFC0);
    result = MEMORY[0x212B99268](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_25499BFC8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9925C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20CF689D8()
{
  unint64_t result;

  result = qword_25499BFD0;
  if (!qword_25499BFD0)
  {
    result = MEMORY[0x212B99268](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25499BFD0);
  }
  return result;
}

uint64_t ImageAnalysis.transcript.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_transcript);
  v2 = sub_20CF78A30();

  return v2;
}

Swift::Bool __swiftcall ImageAnalysis.hasResults(for:)(VisionKit::ImageAnalyzer::AnalysisTypes a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)a1.rawValue;
  if ((*(_QWORD *)a1.rawValue & 1) == 0)
  {
    if ((v2 & 2) != 0)
    {
      v3 = 4;
      if ((v2 & 4) == 0)
        return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
    }
    else
    {
      v3 = 0;
      if ((v2 & 4) == 0)
        return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
    }
    goto LABEL_11;
  }
  if ((v2 & 2) == 0)
  {
    v3 = 1;
    if ((v2 & 4) == 0)
      return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
    goto LABEL_11;
  }
  v3 = 5;
  if ((v2 & 4) != 0)
LABEL_11:
    v3 |= 0x10uLL;
  return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
}

uint64_t ImageAnalysis.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ImageAnalysis.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ImageAnalysis()
{
  return objc_opt_self();
}

uint64_t method lookup function for ImageAnalysis()
{
  return swift_lookUpClassMethod();
}

void ImageAnalyzer.Configuration.analysisTypes.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t ImageAnalyzer.Configuration.locales.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ImageAnalyzer.Configuration.locales.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ImageAnalyzer.Configuration.locales.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalyzer::Configuration __swiftcall ImageAnalyzer.Configuration.init(_:)(VisionKit::ImageAnalyzer::AnalysisTypes a1)
{
  _QWORD *v1;
  uint64_t v2;
  VisionKit::ImageAnalyzer::Configuration result;

  v2 = MEMORY[0x24BEE4AF8];
  *v1 = *(_QWORD *)a1.rawValue;
  v1[1] = v2;
  result.analysisTypes = a1;
  return result;
}

uint64_t ImageAnalyzer.AnalysisTypes.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ImageAnalyzer.AnalysisTypes.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ImageAnalyzer.AnalysisTypes.rawValue.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalyzer::AnalysisTypes __swiftcall ImageAnalyzer.AnalysisTypes.init(rawValue:)(VisionKit::ImageAnalyzer::AnalysisTypes rawValue)
{
  VisionKit::ImageAnalyzer::AnalysisTypes *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ImageAnalyzer.AnalysisTypes.text.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ImageAnalyzer.AnalysisTypes.machineReadableCode.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ImageAnalyzer.AnalysisTypes.visualLookUp.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

uint64_t ImageAnalyzer.__allocating_init()()
{
  uint64_t v0;
  id v1;

  v0 = swift_allocObject();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF30]), sel_init);
  *(_QWORD *)(v0 + 16) = v1;
  objc_msgSend(v1, sel_set_isPublicAPI_, 1);
  return v0;
}

uint64_t ImageAnalyzer.init()()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF30]), sel_init);
  *(_QWORD *)(v0 + 16) = v1;
  objc_msgSend(v1, sel_set_isPublicAPI_, 1);
  return v0;
}

id static ImageAnalyzer.isSupported.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_deviceSupportsImageAnalysis);
}

uint64_t static ImageAnalyzer.supportedTextRecognitionLanguages.getter()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_supportedRecognitionLanguages);
  v1 = sub_20CF78A60();

  return v1;
}

uint64_t ImageAnalyzer.analyze(_:configuration:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a1;
  v3[4] = v2;
  v4 = a2[1];
  v3[5] = *a2;
  v3[6] = v4;
  return swift_task_switch();
}

uint64_t sub_20CF68D28()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_imageOrientation);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v3 = 4;
      if ((*(_BYTE *)(v0 + 40) & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v3 = 0;
      if ((*(_BYTE *)(v0 + 40) & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v3 = 1;
    if ((*(_BYTE *)(v0 + 40) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v3 = 5;
  if ((*(_BYTE *)(v0 + 40) & 4) != 0)
LABEL_11:
    v3 |= 0x10uLL;
LABEL_12:
  v4 = *(void **)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF38]), sel_initWithImage_orientation_requestType_, v4, v2, v3);
  *(_QWORD *)(v0 + 56) = v6;

  v7 = (void *)sub_20CF78A54();
  objc_msgSend(v6, sel_setLocales_, v7);

  v8 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v8;
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v9;
  type metadata accessor for ImageAnalysis();
  *v9 = v0;
  v9[1] = sub_20CF68EA4;
  return sub_20CF78C40();
}

uint64_t sub_20CF68EA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t ImageAnalyzer.analyze(_:orientation:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[3] = a1;
  v4[4] = a2;
  v5 = *a3;
  v6 = a3[1];
  v4[5] = v3;
  v4[6] = v5;
  v4[7] = v6;
  return swift_task_switch();
}

uint64_t sub_20CF68F34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[6];
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v2 = 4;
      if ((v1 & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v2 = 0;
      if ((v1 & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v2 = 1;
    if ((v1 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v2 = 5;
  if ((v1 & 4) != 0)
LABEL_11:
    v2 |= 0x10uLL;
LABEL_12:
  v3 = v0[5];
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF38]), sel_initWithImage_orientation_requestType_, v0[3], v0[4], v2);
  v0[8] = v4;
  v5 = (void *)sub_20CF78A54();
  objc_msgSend(v4, sel_setLocales_, v5);

  v6 = swift_task_alloc();
  v0[9] = v6;
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = (_QWORD *)swift_task_alloc();
  v0[10] = v7;
  type metadata accessor for ImageAnalysis();
  *v7 = v0;
  v7[1] = sub_20CF69088;
  return sub_20CF78C40();
}

uint64_t sub_20CF69088()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CF690F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20CF69130()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ImageAnalyzer.analyze(_:orientation:configuration:)(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = a3[1];
  *(_QWORD *)(v4 + 40) = *a3;
  *(_QWORD *)(v4 + 48) = v5;
  return swift_task_switch();
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = a3[1];
  *(_QWORD *)(v4 + 40) = *a3;
  *(_QWORD *)(v4 + 48) = v5;
  return swift_task_switch();
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = a3[1];
  *(_QWORD *)(v4 + 40) = *a3;
  *(_QWORD *)(v4 + 48) = v5;
  return swift_task_switch();
}

uint64_t sub_20CF6918C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[5];
  v2 = vk_orientationFromCGImagePropertyOrientation();
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v3 = 4;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v3 = 0;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v3 = 1;
    if ((v0[5] & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v3 = 5;
  if ((v0[5] & 4) != 0)
LABEL_11:
    v3 |= 0x10uLL;
LABEL_12:
  v4 = v0[4];
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF38]), sel_initWithCGImage_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  v6 = (void *)sub_20CF78A54();
  objc_msgSend(v5, sel_setLocales_, v6);

  v7 = swift_task_alloc();
  v0[8] = v7;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v0[9] = v8;
  type metadata accessor for ImageAnalysis();
  *v8 = v0;
  v8[1] = sub_20CF692F8;
  return sub_20CF78C40();
}

uint64_t sub_20CF692F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CF69364()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20CF693A0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CF693FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[5];
  v2 = vk_orientationFromCGImagePropertyOrientation();
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v3 = 4;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v3 = 0;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v3 = 1;
    if ((v0[5] & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v3 = 5;
  if ((v0[5] & 4) != 0)
LABEL_11:
    v3 |= 0x10uLL;
LABEL_12:
  v4 = v0[4];
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF38]), sel_initWithCIImage_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  v6 = (void *)sub_20CF78A54();
  objc_msgSend(v5, sel_setLocales_, v6);

  v7 = swift_task_alloc();
  v0[8] = v7;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v0[9] = v8;
  type metadata accessor for ImageAnalysis();
  *v8 = v0;
  v8[1] = sub_20CF68EA4;
  return sub_20CF78C40();
}

uint64_t sub_20CF6958C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[5];
  v2 = vk_orientationFromCGImagePropertyOrientation();
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v3 = 4;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v3 = 0;
      if ((v0[5] & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v3 = 1;
    if ((v0[5] & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v3 = 5;
  if ((v0[5] & 4) != 0)
LABEL_11:
    v3 |= 0x10uLL;
LABEL_12:
  v4 = v0[4];
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF38]), sel_initWithCVPixelBuffer_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  v6 = (void *)sub_20CF78A54();
  objc_msgSend(v5, sel_setLocales_, v6);

  v7 = swift_task_alloc();
  v0[8] = v7;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v0[9] = v8;
  type metadata accessor for ImageAnalysis();
  *v8 = v0;
  v8[1] = sub_20CF68EA4;
  return sub_20CF78C40();
}

uint64_t ImageAnalyzer.analyze(imageAt:orientation:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[3] = a1;
  v4[4] = v3;
  v6 = sub_20CF78910();
  v4[5] = v6;
  v4[6] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v8 = *a3;
  v9 = a3[1];
  v4[7] = v7;
  v4[8] = v8;
  v4[9] = v9;
  return swift_task_switch();
}

uint64_t sub_20CF69764()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = v0[8];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[6] + 16))(v0[7], v0[3], v0[5]);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 2) != 0)
    {
      v2 = 4;
      if ((v0[8] & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v2 = 0;
      if ((v0[8] & 4) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((v1 & 2) == 0)
  {
    v2 = 1;
    if ((v0[8] & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v2 = 5;
  if ((v0[8] & 4) != 0)
LABEL_11:
    v2 |= 0x10uLL;
LABEL_12:
  v4 = v0[6];
  v3 = v0[7];
  v6 = v0[4];
  v5 = v0[5];
  v7 = objc_allocWithZone(MEMORY[0x24BEBFF38]);
  v8 = (void *)sub_20CF78904();
  v9 = objc_msgSend(v7, sel_initWithImageURL_requestType_, v8, v2);
  v0[10] = v9;

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v10 = (void *)sub_20CF78A54();
  objc_msgSend(v9, sel_setLocales_, v10);

  v11 = swift_task_alloc();
  v0[11] = v11;
  *(_QWORD *)(v11 + 16) = v6;
  *(_QWORD *)(v11 + 24) = v9;
  v12 = (_QWORD *)swift_task_alloc();
  v0[12] = v12;
  type metadata accessor for ImageAnalysis();
  *v12 = v0;
  v12[1] = sub_20CF69908;
  return sub_20CF78C40();
}

uint64_t sub_20CF69908()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CF69974()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20CF699BC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_task_dealloc();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_20CF69A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C090);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_20CF69F08;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF69BD0;
  aBlock[3] = &block_descriptor_0;
  v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_processRequest_progressHandler_completionHandler_, a3, 0, v12);
  _Block_release(v12);
}

void *sub_20CF69B40(void *result, id a2)
{
  void *v2;
  id v3;
  id v4;

  if (result)
  {
    v2 = result;
    type metadata accessor for ImageAnalysis();
    *(_QWORD *)(swift_allocObject() + 16) = v2;
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C090);
    return (void *)sub_20CF78AA8();
  }
  else if (a2)
  {
    v4 = a2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C090);
    return (void *)sub_20CF78A9C();
  }
  return result;
}

void sub_20CF69BD0(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t ImageAnalyzer.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ImageAnalyzer.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

void sub_20CF69C84(uint64_t a1)
{
  uint64_t v1;

  sub_20CF69A00(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_20CF69C90()
{
  unint64_t result;

  result = qword_25499C070;
  if (!qword_25499C070)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalyzer.AnalysisTypes, &type metadata for ImageAnalyzer.AnalysisTypes);
    atomic_store(result, (unint64_t *)&qword_25499C070);
  }
  return result;
}

unint64_t sub_20CF69CD8()
{
  unint64_t result;

  result = qword_25499C078;
  if (!qword_25499C078)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalyzer.AnalysisTypes, &type metadata for ImageAnalyzer.AnalysisTypes);
    atomic_store(result, (unint64_t *)&qword_25499C078);
  }
  return result;
}

unint64_t sub_20CF69D20()
{
  unint64_t result;

  result = qword_25499C080;
  if (!qword_25499C080)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalyzer.AnalysisTypes, &type metadata for ImageAnalyzer.AnalysisTypes);
    atomic_store(result, (unint64_t *)&qword_25499C080);
  }
  return result;
}

unint64_t sub_20CF69D68()
{
  unint64_t result;

  result = qword_25499C088;
  if (!qword_25499C088)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for ImageAnalyzer.AnalysisTypes, &type metadata for ImageAnalyzer.AnalysisTypes);
    atomic_store(result, (unint64_t *)&qword_25499C088);
  }
  return result;
}

uint64_t type metadata accessor for ImageAnalyzer()
{
  return objc_opt_self();
}

uint64_t method lookup function for ImageAnalyzer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ImageAnalyzer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ImageAnalyzer.Configuration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImageAnalyzer.Configuration()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ImageAnalyzer.Configuration(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ImageAnalyzer.Configuration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ImageAnalyzer.Configuration()
{
  return &type metadata for ImageAnalyzer.Configuration;
}

ValueMetadata *type metadata accessor for ImageAnalyzer.AnalysisTypes()
{
  return &type metadata for ImageAnalyzer.AnalysisTypes;
}

uint64_t sub_20CF69EA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C090);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void *sub_20CF69F08(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C090);
  return sub_20CF69B40(a1, a2);
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

uint64_t sub_20CF69F84@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_20CF69FD8()
{
  uint64_t v0;

  v0 = sub_20CF789B8();
  __swift_allocate_value_buffer(v0, qword_25499C0A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25499C0A0);
  return sub_20CF789AC();
}

BOOL sub_20CF6A078(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20CF6A094()
{
  return sub_20CF78CA0();
}

uint64_t static DataScannerViewController.RecognizedDataType.text(languages:textContentType:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = *a2;
  *(_BYTE *)a3 = 0;
  *(_QWORD *)(a3 + 8) = a1;
  *(_BYTE *)(a3 + 16) = v3;
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRetain();
}

uint64_t static DataScannerViewController.RecognizedDataType.barcode(symbologies:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)a2 = 1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_BYTE *)(a2 + 16) = 8;
  *(_QWORD *)(a2 + 24) = a1;
  return swift_bridgeObjectRetain();
}

BOOL static DataScannerViewController.RecognizedDataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DataScannerViewController.RecognizedDataType.hash(into:)()
{
  return sub_20CF78CA0();
}

uint64_t DataScannerViewController.RecognizedDataType.hashValue.getter()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t _s9VisionKit25DataScannerViewControllerC12QualityLevelO9hashValueSivg_0()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF6A1CC()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

BOOL static DataScannerViewController.QualityLevel.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataScannerViewController.QualityLevel.hash(into:)()
{
  return sub_20CF78CA0();
}

BOOL sub_20CF6A24C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL static DataScannerViewController.ScanningUnavailable.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DataScannerViewController.ScanningUnavailable.hash(into:)()
{
  return sub_20CF78CA0();
}

uint64_t DataScannerViewController.ScanningUnavailable.hashValue.getter()
{
  sub_20CF78C94();
  sub_20CF78CA0();
  return sub_20CF78CAC();
}

uint64_t sub_20CF6A2EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_20CF75D74(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_20CF6A328(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v4 = sub_20CF789C4();
  v18 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_20CF789DC();
  v7 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v10 = (void *)sub_20CF78B44();
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_20CF784B4;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = &block_descriptor_67;
  v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = a1;
  sub_20CF789D0();
  v19 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  swift_release();
  return swift_release();
}

void sub_20CF6A578(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x212B99358](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x212B99358](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      sub_20CF75E94(a3);

    }
  }
}

uint64_t sub_20CF6A654(void *a1, double a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v4 = sub_20CF789C4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_20CF789DC();
  v8 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v11 = (void *)sub_20CF78B44();
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = a1;
  *(double *)(v13 + 32) = a2;
  aBlock[4] = sub_20CF78468;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = &block_descriptor_60;
  v14 = _Block_copy(aBlock);
  swift_retain();
  v15 = a1;
  sub_20CF789D0();
  v20 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v10, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  swift_release();
  return swift_release();
}

void sub_20CF6A8B0(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x212B99358](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (char *)MEMORY[0x212B99358](v4 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v6)
    {
      v7 = &v6[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate];
      swift_beginAccess();
      if (MEMORY[0x212B99358](v7))
      {
        v8 = *((_QWORD *)v7 + 1);
        ObjectType = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 24))(v6, ObjectType, v8, a2);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
  }
}

uint64_t sub_20CF6A9F0(void *a1, char a2)
{
  return sub_20CF6B568(a1, a2, (uint64_t)&unk_24C5D9E20, (uint64_t)sub_20CF78454, (uint64_t)&block_descriptor_53);
}

void sub_20CF6AA0C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x212B99358](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (char *)MEMORY[0x212B99358](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      if ((a3 & 1) != 0)
        objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_beginSessionForText_barcodes_, *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] & 1, (*(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] >> 1) & 1);
      else
        objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_endSession);

    }
  }
}

uint64_t sub_20CF6AB28(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  char *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD aBlock[7];

  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v6 = sub_20CF789C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CF789DC();
  v37 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25499BD80 != -1)
    swift_once();
  v11 = sub_20CF789B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_25499C0A0);
  v12 = a2;
  v13 = a3;
  v14 = v12;
  v15 = a3;
  v16 = sub_20CF789A0();
  v17 = sub_20CF78B38();
  if (os_log_type_enabled(v16, v17))
  {
    v33 = a1;
    v34 = v7;
    v35 = v6;
    v18 = swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v18 = 138412546;
    aBlock[0] = v14;
    v20 = v14;
    sub_20CF78B74();
    *v19 = v14;

    *(_WORD *)(v18 + 12) = 2112;
    if (a3)
    {
      v21 = a3;
      v22 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v22;
      sub_20CF78B74();
    }
    else
    {
      aBlock[0] = 0;
      sub_20CF78B74();
      v22 = 0;
    }
    v6 = v35;
    v19[1] = v22;

    _os_log_impl(&dword_20CF5F000, v16, v17, "DataScannerViewController impl received didCapturePhoto with photo: %@, error: %@", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499C388);
    swift_arrayDestroy();
    MEMORY[0x212B992D4](v19, -1, -1);
    MEMORY[0x212B992D4](v18, -1, -1);

    a1 = v33;
    v7 = v34;
  }
  else
  {

  }
  sub_20CF67D50(0, &qword_25499C368);
  v23 = (void *)sub_20CF78B44();
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = v24;
  v25[3] = a1;
  v25[4] = v14;
  v25[5] = a3;
  aBlock[4] = sub_20CF78440;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = &block_descriptor_46;
  v26 = _Block_copy(aBlock);
  v27 = v14;
  v28 = a3;
  swift_retain();
  v29 = a1;
  v30 = v36;
  sub_20CF789D0();
  v40 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  v31 = v39;
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v30, v31, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v31, v6);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v38);
  swift_release();
  return swift_release();
}

void sub_20CF6AFAC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;

  v6 = a1 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x212B99358](v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = MEMORY[0x212B99358](v7 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);
    if (v9)
    {
      v10 = v9;
      sub_20CF76224(a3, a4);

      goto LABEL_9;
    }

  }
  if (qword_25499BD80 != -1)
    swift_once();
  v11 = sub_20CF789B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_25499C0A0);
  v10 = sub_20CF789A0();
  v12 = sub_20CF78B2C();
  if (os_log_type_enabled(v10, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_20CF5F000, v10, v12, "Unexpected error before calling didCapturePhoto on DataScannerViewController. Missing self or owner.", v13, 2u);
    MEMORY[0x212B992D4](v13, -1, -1);
  }
LABEL_9:

}

uint64_t sub_20CF6B15C(void *a1)
{
  return sub_20CF6B1E8(a1, (uint64_t)&unk_24C5D9D80, (uint64_t)sub_20CF783E4, (uint64_t)&block_descriptor_39);
}

uint64_t sub_20CF6B1CC(void *a1)
{
  return sub_20CF6B1E8(a1, (uint64_t)&unk_24C5D9D30, (uint64_t)sub_20CF783BC, (uint64_t)&block_descriptor_32);
}

uint64_t sub_20CF6B1E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v19 = a4;
  v6 = sub_20CF789C4();
  v22 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CF789DC();
  v20 = *(_QWORD *)(v9 - 8);
  v21 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v12 = (void *)sub_20CF78B44();
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = v19;
  v15 = _Block_copy(aBlock);
  swift_retain();
  v16 = a1;
  sub_20CF789D0();
  v23 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v11, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v21);
  swift_release();
  return swift_release();
}

void sub_20CF6B42C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x212B99358](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (char *)MEMORY[0x212B99358](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      v8 = &v7[*a3];
      swift_beginAccess();
      if (MEMORY[0x212B99358](v8))
      {
        v9 = *((_QWORD *)v8 + 1);
        ObjectType = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 8))(v7, ObjectType, v9);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
  }
}

uint64_t sub_20CF6B54C(void *a1, char a2)
{
  return sub_20CF6B568(a1, a2, (uint64_t)&unk_24C5D9D08, (uint64_t)sub_20CF78390, (uint64_t)&block_descriptor_1);
}

uint64_t sub_20CF6B568(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v19 = a4;
  v20 = a5;
  v7 = sub_20CF789C4();
  v23 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CF789DC();
  v21 = *(_QWORD *)(v10 - 8);
  v22 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v13 = (void *)sub_20CF78B44();
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = a1;
  *(_BYTE *)(v15 + 32) = a2;
  aBlock[4] = v19;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = v20;
  v16 = _Block_copy(aBlock);
  swift_retain();
  v17 = a1;
  sub_20CF789D0();
  v24 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v12, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v22);
  swift_release();
  return swift_release();
}

void sub_20CF6B7B4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  char v11;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x212B99358](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (char *)MEMORY[0x212B99358](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      if ((a3 & 1) != 0
        || (v8 = &v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate],
            swift_beginAccess(),
            !MEMORY[0x212B99358](v8)))
      {

      }
      else
      {
        v9 = *((_QWORD *)v8 + 1);
        ObjectType = swift_getObjectType();
        v11 = 1;
        (*(void (**)(char *, char *, uint64_t, uint64_t))(v9 + 48))(v7, &v11, ObjectType, v9);

        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_20CF6B8F0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  char v8;

  if (objc_msgSend((id)objc_opt_self(), sel_isCameraRestricted))
  {
    swift_beginAccess();
    v2 = MEMORY[0x212B99358](a1 + 16);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = (char *)MEMORY[0x212B99358](v2 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

      if (v4)
      {
        v5 = &v4[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
        swift_beginAccess();
        if (MEMORY[0x212B99358](v5))
        {
          v6 = *((_QWORD *)v5 + 1);
          ObjectType = swift_getObjectType();
          v8 = 1;
          (*(void (**)(char *, char *, uint64_t, uint64_t))(v6 + 48))(v4, &v8, ObjectType, v6);

          swift_unknownObjectRelease();
        }
        else
        {

        }
      }
    }
  }
}

id sub_20CF6BA84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataScannerViewController.Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20CF6BAC4()
{
  return objc_msgSend((id)objc_opt_self(), sel_isSupported);
}

uint64_t sub_20CF6BAEC()
{
  return objc_msgSend((id)objc_opt_self(), sel_isCameraRestricted) ^ 1;
}

uint64_t sub_20CF6BB18()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_supportedRecognitionLanguages);
  v1 = sub_20CF78A60();

  return v1;
}

uint64_t sub_20CF6BB6C()
{
  return sub_20CF6C288(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

uint64_t sub_20CF6BB78(uint64_t a1, uint64_t a2)
{
  return sub_20CF6C2DC(a1, a2, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

uint64_t (*sub_20CF6BB84(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x212B99358](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_20CF6BBF8;
}

void sub_20CF6BBFC(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id sub_20CF6BC5C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  return *v1;
}

uint64_t DataScannerViewController.recognizedDataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void DataScannerViewController.qualityLevel.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel);
}

uint64_t DataScannerViewController.recognizesMultipleItems.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems);
}

uint64_t DataScannerViewController.isHighFrameRateTrackingEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled);
}

uint64_t DataScannerViewController.isPinchToZoomEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled);
}

uint64_t DataScannerViewController.isGuidanceEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled);
}

uint64_t DataScannerViewController.isHighlightingEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled);
}

id sub_20CF6BD14(uint64_t a1, uint64_t *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v2 = *(double *)a1;
  v3 = *(double *)(a1 + 8);
  v4 = *(double *)(a1 + 16);
  v5 = *(double *)(a1 + 24);
  v6 = *(_BYTE *)(a1 + 32);
  v7 = *a2;
  v8 = *a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  result = (id)swift_beginAccess();
  *(double *)v8 = v2;
  *(double *)(v8 + 8) = v3;
  *(double *)(v8 + 16) = v4;
  *(double *)(v8 + 24) = v5;
  *(_BYTE *)(v8 + 32) = v6;
  if ((v6 & 1) == 0)
    return objc_msgSend(*(id *)(v7 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, v2, v3, v4, v5);
  return result;
}

__n128 sub_20CF6BDB4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

id sub_20CF6BE08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id result;
  double v5[4];
  char v6;

  v3 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  sub_20CF785D4(a1, v3, &qword_25499C108);
  result = (id)sub_20CF785D4(a1, (uint64_t)v5, &qword_25499C108);
  if ((v6 & 1) == 0)
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, v5[0], v5[1], v5[2], v5[3]);
  return result;
}

void (*sub_20CF6BEA4(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_20CF6BEFC;
}

void sub_20CF6BEFC(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = v4 + v3[4];
    if ((*(_BYTE *)(v5 + 32) & 1) == 0)
      objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, *(double *)v5, *(double *)(v5 + 8), *(double *)(v5 + 16), *(double *)(v5 + 24));
  }
  free(v3);
}

id sub_20CF6BF5C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isProcessing);
}

uint64_t sub_20CF6BF84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C118);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C120);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  return sub_20CF78AE4();
}

uint64_t sub_20CF6C044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t *v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C230);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (unint64_t *)(a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
  swift_beginAccess();
  v9 = *v8;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v8 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_20CF74D54(0, *(_QWORD *)(v9 + 16) + 1, 1, v9, &qword_25499C420, &qword_25499C230);
    *v8 = v9;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    v9 = sub_20CF74D54(v11 > 1, v12 + 1, 1, v9, &qword_25499C420, &qword_25499C230);
    *v8 = v9;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t sub_20CF6C1B4(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF6C044(a1, *(_QWORD *)(v1 + 16));
}

id sub_20CF6C1BC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_minZoomFactor);
}

id sub_20CF6C1D4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_maxZoomFactor);
}

id sub_20CF6C1EC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
}

id sub_20CF6C204()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setZoomFactor_);
}

id (*sub_20CF6C21C(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  a1[1] = v3;
  objc_msgSend(v3, sel_zoomFactor);
  *a1 = v4;
  return sub_20CF6C264;
}

id sub_20CF6C264(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setZoomFactor_, *(double *)a1);
}

uint64_t sub_20CF6C27C()
{
  return sub_20CF6C288(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t sub_20CF6C288(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x212B99358](v2);
}

uint64_t sub_20CF6C2D0(uint64_t a1, uint64_t a2)
{
  return sub_20CF6C2DC(a1, a2, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t sub_20CF6C2DC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v5;

  v5 = v3 + *a3;
  swift_beginAccess();
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_20CF6C340(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x212B99358](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_20CF6BBF8;
}

void sub_20CF6C3B4(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

double sub_20CF6C428()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_20CF6C46C(double a1)
{
  return sub_20CF6C550(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval, (SEL *)&selRef_setProcessingInterval_, a1);
}

void (*sub_20CF6C480(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_20CF6C4EC;
}

void sub_20CF6C4EC(uint64_t a1, uint64_t a2)
{
  sub_20CF6C664(a1, a2, (SEL *)&selRef_setProcessingInterval_);
}

double sub_20CF6C4F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_20CF6C53C(double a1)
{
  return sub_20CF6C550(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval, (SEL *)&selRef_setInfrequentProcessingInterval_, a1);
}

id sub_20CF6C550(_QWORD *a1, SEL *a2, double a3)
{
  uint64_t v3;
  double *v6;
  id result;
  double v8;
  void *v9;

  v6 = (double *)(v3 + *a1);
  result = (id)swift_beginAccess();
  v8 = *v6;
  *v6 = a3;
  if (v8 != a3)
  {
    v9 = *(void **)(v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v9)
      objc_msgSend(v9, *a2, a3);
    result = *(id *)(v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
    if (result)
      return objc_msgSend(result, *a2, *v6);
  }
  return result;
}

void (*sub_20CF6C5EC(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_20CF6C658;
}

void sub_20CF6C658(uint64_t a1, uint64_t a2)
{
  sub_20CF6C664(a1, a2, (SEL *)&selRef_setInfrequentProcessingInterval_);
}

void sub_20CF6C664(uint64_t a1, uint64_t a2, SEL *a3)
{
  _QWORD *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD **)a1;
  v5 = *(double *)(*(_QWORD *)a1 + 24);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v8 = *(double *)(v7 + v6);
  *(double *)(v7 + v6) = v5;
  if (v5 != v8)
  {
    v9 = v4[4];
    v10 = *(void **)(v9 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v10)
    {
      objc_msgSend(v10, *a3);
      v9 = v4[4];
    }
    v11 = *(void **)(v9 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
    if (v11)
      objc_msgSend(v11, *a3, *(double *)(v9 + v4[5]));
  }
  free(v4);
}

id sub_20CF6C6E4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_hasTorch);
}

id sub_20CF6C70C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isTorchOn);
}

id sub_20CF6C734(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setTorchOn_, a1 & 1);
}

id (*sub_20CF6C754(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v3, sel_isTorchOn);
  return sub_20CF6C79C;
}

id sub_20CF6C79C(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setTorchOn_, *(unsigned __int8 *)(a1 + 8));
}

void sub_20CF6C7B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_20CF6C820();
}

void sub_20CF6C820()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v2, sel_configuration);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v4 = (void *)sub_20CF78A54();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setCustomWords_, v4);

    objc_msgSend(v2, sel_setConfiguration_, v3);
  }
  v5 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v6, sel_configuration);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v8 = (void *)sub_20CF78A54();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setCustomWords_, v8);

    objc_msgSend(v6, sel_setConfiguration_, v7);
  }
}

uint64_t sub_20CF6C9A0()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void sub_20CF6C9E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  sub_20CF6C820();
}

void (*sub_20CF6CA44(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_20CF6CA8C;
}

void sub_20CF6CA8C(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_20CF6C820();
}

uint64_t sub_20CF6CABC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  swift_beginAccess();
  return *v1;
}

void sub_20CF6CB00(unsigned __int8 a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  swift_beginAccess();
  *v3 = a1;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, sel_configuration);
    objc_msgSend(v6, sel_setUsesLanguageDetection_, *v3);
    objc_msgSend(v5, sel_setConfiguration_, v6);

  }
  v7 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v8, sel_configuration);
    objc_msgSend(v9, sel_setUsesLanguageDetection_, *v3);
    objc_msgSend(v8, sel_setConfiguration_, v9);

  }
}

void (*sub_20CF6CC0C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_20CF6CC64;
}

void sub_20CF6CC64(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v5)
    {
      v6 = v3[4];
      v7 = v5;
      v8 = objc_msgSend(v7, sel_configuration);
      objc_msgSend(v8, sel_setUsesLanguageDetection_, *(unsigned __int8 *)(v4 + v6));
      objc_msgSend(v7, sel_setConfiguration_, v8);

      v4 = v3[3];
    }
    v9 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
    if (v9)
    {
      v10 = v3[4];
      v11 = v9;
      v12 = objc_msgSend(v11, sel_configuration);
      objc_msgSend(v12, sel_setUsesLanguageDetection_, *(unsigned __int8 *)(v4 + v10));
      objc_msgSend(v11, sel_setConfiguration_, v12);

    }
  }
  free(v3);
}

id DataScannerViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void DataScannerViewController.init(coder:)()
{
  sub_20CF76BC4();
}

id DataScannerViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_20CF78A0C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DataScannerViewController.init(nibName:bundle:)()
{
  sub_20CF76BC4();
}

uint64_t DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7)
{
  _BYTE *v7;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _BOOL8 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  int v28;
  char v29;
  char v30;
  uint64_t v31;
  int v32;
  char v33;
  int v34;
  id v35;
  id v36;
  objc_class *v37;
  id v38;
  _BYTE v42[24];
  objc_super v43;

  v11 = *a2;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  v12 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  v13 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v14 = v7;
  *(_QWORD *)&v7[v12] = objc_msgSend(v13, sel_init);
  v15 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(_QWORD *)&v14[v15] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  v16 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(_QWORD *)&v14[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF50]), sel_init);
  v17 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v18 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  *(_QWORD *)&v14[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v19 = &v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)v19 = 0u;
  *((_OWORD *)v19 + 1) = 0u;
  v20 = 1;
  v19[32] = 1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v21 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  v22 = (void *)objc_opt_self();
  objc_msgSend(v22, sel_defaultProcessingInterval);
  *(_QWORD *)&v14[v21] = v23;
  v24 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v22, sel_defaultInfrequentProcessingInterval);
  *(_QWORD *)&v14[v24] = v25;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v17;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;
  v26 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes;
  *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes] = a1;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel] = v11;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] = a3;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] = a4;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] = a5;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] = a6;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] = a7;
  if ((a4 & 1) == 0
    || !objc_msgSend((id)objc_opt_self(), sel_isOpticalFlowForTextEnabled)
    || *(_QWORD *)(a1 + 16) != 1)
  {
    goto LABEL_12;
  }
  result = sub_20CF67720(a1);
  if ((v29 & 1) != 0)
    goto LABEL_17;
  if (*(_DWORD *)(a1 + 36) != v28)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_20CF75CE4(result, v28, a1, (uint64_t)v42);
  v30 = v42[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
LABEL_12:
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF60]), sel_init);
    objc_msgSend(v35, sel_setResolutionPreset_, qword_20CF7A2B0[v11]);
    objc_msgSend(v35, sel_setFrameRatePreset_, 1);
    objc_msgSend(v35, sel_setCameraPreset_, 2);
    objc_msgSend(v35, sel_setPreferBinning_, v20);
    v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF10]), sel_initWithConfiguration_, v35);

    *(_QWORD *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider] = v36;
    v37 = (objc_class *)type metadata accessor for DataScannerViewController();
    v43.receiver = v14;
    v43.super_class = v37;
    v38 = objc_msgSendSuper2(&v43, sel_initWithNibName_bundle_, 0, 0);
    sub_20CF6DB24();

    return (uint64_t)v38;
  }
  v31 = *(_QWORD *)&v14[v26];
  result = sub_20CF67720(v31);
  if ((v33 & 1) == 0)
  {
    if (*(_DWORD *)(v31 + 36) == v32)
    {
      if (result != 1 << *(_BYTE *)(v31 + 32))
      {
        sub_20CF75CE4(result, v32, v31, (uint64_t)v42);
        v34 = v42[16];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = v34 != 8;
        goto LABEL_12;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  return DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  _BYTE *v8;
  char v12;
  uint64_t v13;
  id v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char *v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  int v30;
  char v31;
  char v32;
  uint64_t v33;
  int v34;
  char v35;
  int v36;
  objc_class *v37;
  id v38;
  char v43[24];
  objc_super v44;

  v12 = *a2;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  v13 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  v14 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v15 = v8;
  *(_QWORD *)&v8[v13] = objc_msgSend(v14, sel_init);
  v16 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(_QWORD *)&v15[v16] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  v17 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(_QWORD *)&v15[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF50]), sel_init);
  v18 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v18;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v18;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v18;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v18;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v19 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  v20 = v12;
  *(_QWORD *)&v15[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v21 = &v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  v22 = 1;
  v21[32] = 1;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v23 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  v24 = (void *)objc_opt_self();
  objc_msgSend(v24, sel_defaultProcessingInterval);
  *(_QWORD *)&v15[v23] = v25;
  v26 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v24, sel_defaultInfrequentProcessingInterval);
  *(_QWORD *)&v15[v26] = v27;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v18;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;
  v28 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes;
  *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes] = a1;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel] = v12;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] = a3;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] = a4;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] = a5;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] = a6;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] = a7;
  if ((a4 & 1) == 0
    || !objc_msgSend((id)objc_opt_self(), sel_isOpticalFlowForTextEnabled)
    || *(_QWORD *)(a1 + 16) != 1)
  {
    goto LABEL_12;
  }
  result = sub_20CF67720(a1);
  if ((v31 & 1) != 0)
    goto LABEL_17;
  if (*(_DWORD *)(a1 + 36) != v30)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_20CF75CE4(result, v30, a1, (uint64_t)v43);
  v32 = v43[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
  {
LABEL_12:
    v43[0] = v20;
    *(_QWORD *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider] = sub_20CF76E88(v43, a8 & 1, a5 & 1, v22);

    v37 = (objc_class *)type metadata accessor for DataScannerViewController();
    v44.receiver = v15;
    v44.super_class = v37;
    v38 = objc_msgSendSuper2(&v44, sel_initWithNibName_bundle_, 0, 0);
    sub_20CF6DB24();

    return (uint64_t)v38;
  }
  v33 = *(_QWORD *)&v15[v28];
  result = sub_20CF67720(v33);
  if ((v35 & 1) == 0)
  {
    if (*(_DWORD *)(v33 + 36) == v34)
    {
      if (result != 1 << *(_BYTE *)(v33 + 32))
      {
        sub_20CF75CE4(result, v34, v33, (uint64_t)v43);
        v36 = v43[16];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v22 = v36 != 8;
        goto LABEL_12;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

id DataScannerViewController.__deallocating_deinit()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for DataScannerViewController();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_20CF6DB24()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  uint64_t v26;
  int v27;
  char v28;
  int v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  int v33;
  char v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int64_t v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  int64_t v59;
  unint64_t v60;
  int64_t v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t aBlock;
  uint64_t v81;
  uint64_t (*v82)();
  void *v83;
  void *v84;
  uint64_t v85;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView];
  v3 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.01);

  objc_msgSend(v2, sel_setBackgroundColor_, v4);
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl];
  swift_unknownObjectWeakAssign();
  v6 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider];
  sub_20CF67D50(0, &qword_25499C368);
  v7 = (void *)sub_20CF78B44();
  v77 = v6;
  objc_msgSend(v6, sel_setDelegate_queue_, v5, v7);

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_setDelegate_, v5);
  if (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] == 1)
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD808]), sel_initWithTarget_action_, v1, sel_onPinch_);
    v9 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer;
    v10 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer];
    *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = v8;

    v11 = objc_msgSend(v1, sel_view);
    if (!v11)
    {
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    if (!*(_QWORD *)&v1[v9])
    {
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
    v12 = v11;
    objc_msgSend(v11, sel_addGestureRecognizer_);

  }
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v1, sel_onTap_);
  v14 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer;
  v15 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer];
  *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = v13;

  v16 = objc_msgSend(v1, sel_view);
  if (!v16)
    goto LABEL_62;
  if (!*(_QWORD *)&v1[v14])
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v17 = v16;
  objc_msgSend(v16, sel_addGestureRecognizer_);

  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_defaultCenter);
  objc_msgSend(v19, sel_addObserver_selector_name_object_, v1, sel_didEnterBackground, *MEMORY[0x24BEBDF98], 0);

  v20 = objc_msgSend(v18, sel_defaultCenter);
  objc_msgSend(v20, sel_addObserver_selector_name_object_, v1, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  if (objc_msgSend((id)objc_opt_self(), sel_isOpticalFlowForTextEnabled))
  {
    v21 = *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
    if (*(_QWORD *)(v21 + 16) == 1)
    {
      v22 = sub_20CF67720(*(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes]);
      if ((v24 & 1) != 0)
      {
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      if (*(_DWORD *)(v21 + 36) != v23)
        goto LABEL_56;
      if (v22 == 1 << *(_BYTE *)(v21 + 32))
      {
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
      sub_20CF75CE4(v22, v23, v21, (uint64_t)&aBlock);
      v25 = aBlock;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        v26 = sub_20CF67720(v21);
        if ((v28 & 1) != 0)
        {
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (*(_DWORD *)(v21 + 36) == v27)
        {
          if (v26 != 1 << *(_BYTE *)(v21 + 32))
          {
            sub_20CF75CE4(v26, v27, v21, (uint64_t)&aBlock);
            v29 = v82;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v29 == 8
              && v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] == 1)
            {
              v30 = *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType];
              if ((v30 & 1) == 0)
                *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = v30 | 1;
              v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFFA8]), sel_init);
              objc_msgSend(v31, sel_setIsForSingleItem_, (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] & 1) == 0);
              v32 = sub_20CF67720(v21);
              if ((v34 & 1) != 0)
              {
LABEL_68:
                __break(1u);
                JUMPOUT(0x20CF6E6FCLL);
              }
              if (*(_DWORD *)(v21 + 36) == v33)
              {
                if (v32 != 1 << *(_BYTE *)(v21 + 32))
                {
                  sub_20CF75CE4(v32, v33, v21, (uint64_t)&aBlock);
                  swift_bridgeObjectRelease();
                  v35 = (void *)sub_20CF78A54();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v31, sel_setRecognitionLanguages_, v35);

                  v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFFB0]), sel_init);
                  objc_msgSend(v36, sel_setConfiguration_, v31);
                  v37 = v36;
                  v38 = (void *)sub_20CF78B44();
                  objc_msgSend(v37, sel_setResultHandlerQueue_, v38);

                  v39 = swift_allocObject();
                  swift_unknownObjectWeakInit();
                  v84 = sub_20CF78820;
                  v85 = v39;
                  aBlock = MEMORY[0x24BDAC760];
                  v81 = 1107296256;
                  v82 = sub_20CF6E720;
                  v83 = &block_descriptor_109;
                  v40 = _Block_copy(&aBlock);
                  swift_release();
                  objc_msgSend(v37, sel_setResultHandler_, v40);
                  _Block_release(v40);
                  objc_msgSend(v6, sel_registerProcessor_, v37);
                  v41 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor];
                  *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = v37;

                  goto LABEL_52;
                }
                goto LABEL_61;
              }
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
              goto LABEL_63;
            }
            goto LABEL_24;
          }
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
    }
  }
LABEL_24:
  v42 = *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
  v43 = *(_QWORD *)(v42 + 56);
  v74 = v42 + 56;
  v44 = 1 << *(_BYTE *)(v42 + 32);
  v45 = -1;
  if (v44 < 64)
    v45 = ~(-1 << v44);
  v46 = v45 & v43;
  v78 = *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
  v79 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType;
  v72 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor;
  v73 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor;
  v75 = (unint64_t)(v44 + 63) >> 6;
  v76 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems;
  swift_bridgeObjectRetain();
  v47 = 0;
  while (1)
  {
    if (v46)
    {
      v57 = __clz(__rbit64(v46));
      v46 &= v46 - 1;
      v58 = v57 | (v47 << 6);
      goto LABEL_44;
    }
    v59 = v47 + 1;
    if (__OFADD__(v47, 1))
    {
      __break(1u);
      goto LABEL_55;
    }
    if (v59 >= v75)
      goto LABEL_50;
    v60 = *(_QWORD *)(v74 + 8 * v59);
    ++v47;
    if (!v60)
    {
      v47 = v59 + 1;
      if (v59 + 1 >= v75)
        goto LABEL_50;
      v60 = *(_QWORD *)(v74 + 8 * v47);
      if (!v60)
      {
        v47 = v59 + 2;
        if (v59 + 2 >= v75)
          goto LABEL_50;
        v60 = *(_QWORD *)(v74 + 8 * v47);
        if (!v60)
          break;
      }
    }
LABEL_43:
    v46 = (v60 - 1) & v60;
    v58 = __clz(__rbit64(v60)) + (v47 << 6);
LABEL_44:
    v62 = (_BYTE *)(*(_QWORD *)(v78 + 48) + 32 * v58);
    v63 = *(_QWORD *)&v1[v79];
    if ((*v62 & 1) == 0)
    {
      v64 = v62[16];
      if ((v63 & 1) == 0)
        *(_QWORD *)&v1[v79] = v63 | 1;
      v65 = objc_allocWithZone(MEMORY[0x24BEBFFA8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v66 = objc_msgSend(v65, sel_init, v72);
      objc_msgSend(v66, sel_setIsForSingleItem_, (v1[v76] & 1) == 0);
      v67 = (void *)sub_20CF78A54();
      objc_msgSend(v66, sel_setRecognitionLanguages_, v67);

      __asm { BR              X8 }
    }
    if ((v63 & 2) == 0)
      *(_QWORD *)&v1[v79] = v63 | 2;
    v48 = objc_allocWithZone(MEMORY[0x24BEBFF20]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v49 = objc_msgSend(v48, sel_init, v72);
    objc_msgSend(v49, sel_setIsForSingleItem_, (v1[v76] & 1) == 0);
    type metadata accessor for VNBarcodeSymbology(0);
    v50 = (void *)sub_20CF78A54();
    objc_msgSend(v49, sel_setSymbologies_, v50);

    v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF18]), sel_init);
    objc_msgSend(v51, sel_setConfiguration_, v49);
    v52 = v51;
    v53 = (void *)sub_20CF78B44();
    objc_msgSend(v52, sel_setResultHandlerQueue_, v53);

    v54 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v84 = sub_20CF78800;
    v85 = v54;
    aBlock = MEMORY[0x24BDAC760];
    v81 = 1107296256;
    v82 = sub_20CF6E720;
    v83 = &block_descriptor_97;
    v55 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v52, sel_setResultHandler_, v55);
    _Block_release(v55);
    objc_msgSend(v77, sel_registerProcessor_, v52);
    v56 = *(void **)&v1[v73];
    *(_QWORD *)&v1[v73] = v52;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v61 = v59 + 3;
  if (v61 < v75)
  {
    v60 = *(_QWORD *)(v74 + 8 * v61);
    if (!v60)
    {
      while (1)
      {
        v47 = v61 + 1;
        if (__OFADD__(v61, 1))
          break;
        if (v47 >= v75)
          goto LABEL_50;
        v60 = *(_QWORD *)(v74 + 8 * v47);
        ++v61;
        if (v60)
          goto LABEL_43;
      }
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    v47 = v61;
    goto LABEL_43;
  }
LABEL_50:
  swift_release();
  if (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] == 1)
  {
    v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF68]), sel_init, v72);
    v69 = (void *)sub_20CF78B44();
    objc_msgSend(v68, sel_setResultHandlerQueue_, v69);

    v70 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v84 = sub_20CF78840;
    v85 = v70;
    aBlock = MEMORY[0x24BDAC760];
    v81 = 1107296256;
    v82 = sub_20CF6E720;
    v83 = &block_descriptor_105;
    v71 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v68, sel_setResultHandler_, v71);
    _Block_release(v71);
    objc_msgSend(v77, sel_registerProcessor_, v68);
    v41 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor];
    *(_QWORD *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = v68;
LABEL_52:

  }
}

void sub_20CF6E724(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x212B99358](v5);
  if (v6)
  {
    v7 = (void *)v6;
    a3(a1);

  }
}

void sub_20CF6E78C(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x212B99358](v3);
  if (v4)
  {
    v5 = (char *)v4;
    objc_msgSend(a1, sel_warpTransform);
    v11 = v7;
    v12 = v6;
    v10 = v8;
    objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor], sel_applyHomographyWarpTransform_);
    v9 = *(id *)&v5[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor];
    objc_msgSend(v9, sel_applyWarpTransform_, v12, v11, v10);

  }
}

void sub_20CF6E910(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  char *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  id v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int *v121;
  _QWORD *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  id v128;
  unint64_t v129;
  unint64_t v130;
  id v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  id v139;
  id v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int *v158;
  _QWORD *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  id v166;
  unint64_t v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD *v173;
  uint64_t v174;
  uint64_t ObjectType;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void (*v183)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v184;
  uint64_t v185;
  void (*v186)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  char **v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  void (*v192)(char *, char *, unint64_t);
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  id v209;
  char *v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v210 = (char *)&v201 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C230);
  v202 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v201 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RecognizedItem(0);
  v215 = *(_QWORD *)(v8 - 8);
  v216 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v207 = (uint64_t)&v201 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v206 = (char *)&v201 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v201 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v201 - v16;
  v209 = a1;
  v18 = objc_msgSend(a1, sel_allItems);
  v208 = sub_20CF67D50(0, &qword_25499C418);
  v19 = sub_20CF78A60();

  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_20CF78BF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v204 = v3;
  v203 = v5;
  v214 = v7;
  v205 = v2;
  if (v20)
  {
    v218 = MEMORY[0x24BEE4AF8];
    sub_20CF673C8(0, v20 & ~(v20 >> 63), 0);
    if (v20 < 0)
    {
      __break(1u);
      goto LABEL_42;
    }
    v21 = 0;
    v22 = v218;
    v212 = v19 & 0xC000000000000001;
    v213 = v19;
    do
    {
      if (v212)
        v23 = (id)MEMORY[0x212B98DE8](v21, v19);
      else
        v23 = *(id *)(v19 + 8 * v21 + 32);
      v24 = v23;
      v25 = objc_msgSend(v24, sel_uuid);
      sub_20CF78928();

      v26 = objc_msgSend(v24, sel_layerQuad);
      objc_msgSend(v26, sel_topLeft);
      v28 = v27;
      v30 = v29;
      objc_msgSend(v26, sel_topRight);
      v32 = v31;
      v34 = v33;
      objc_msgSend(v26, sel_bottomRight);
      v36 = v35;
      v38 = v37;
      objc_msgSend(v26, sel_bottomLeft);
      v40 = v39;
      v42 = v41;
      v43 = (int *)type metadata accessor for RecognizedItem.Text(0);
      v44 = &v17[v43[5]];
      *(_QWORD *)v44 = v28;
      *((_QWORD *)v44 + 1) = v30;
      *((_QWORD *)v44 + 2) = v32;
      *((_QWORD *)v44 + 3) = v34;
      *((_QWORD *)v44 + 4) = v36;
      *((_QWORD *)v44 + 5) = v38;
      *((_QWORD *)v44 + 6) = v40;
      *((_QWORD *)v44 + 7) = v42;
      *((_QWORD *)v44 + 8) = v26;
      v45 = objc_msgSend(v24, sel_transcript);
      v46 = sub_20CF78A30();
      v48 = v47;

      v49 = (uint64_t *)&v17[v43[6]];
      *v49 = v46;
      v49[1] = v48;
      v50 = objc_msgSend(v24, sel_observation);

      *(_QWORD *)&v17[v43[7]] = v50;
      swift_storeEnumTagMultiPayload();

      v218 = v22;
      v52 = *(_QWORD *)(v22 + 16);
      v51 = *(_QWORD *)(v22 + 24);
      if (v52 >= v51 >> 1)
      {
        sub_20CF673C8(v51 > 1, v52 + 1, 1);
        v22 = v218;
      }
      ++v21;
      *(_QWORD *)(v22 + 16) = v52 + 1;
      sub_20CF619E4((uint64_t)v17, v22+ ((*(unsigned __int8 *)(v215 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v215 + 80))+ *(_QWORD *)(v215 + 72) * v52, type metadata accessor for RecognizedItem);
      v19 = v213;
      v7 = v214;
    }
    while (v20 != v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4AF8];
  }
  v53 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems;
  v54 = v211;
  *(_QWORD *)(v211 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems) = v22;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems) & 1) != 0)
  {
    v218 = *(_QWORD *)(v54 + v53);
    swift_bridgeObjectRetain();
    v55 = swift_bridgeObjectRetain();
    sub_20CF75168(v55);
    v201 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
    *(_QWORD *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) = v218;
    swift_bridgeObjectRelease();
    v56 = objc_msgSend(v209, sel_addedItems);
    v5 = sub_20CF78A60();

    if (!(v5 >> 62))
    {
      v57 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_17;
    }
LABEL_42:
    swift_bridgeObjectRetain();
    v57 = sub_20CF78BF8();
    swift_bridgeObjectRelease();
LABEL_17:
    v58 = v207;
    if (v57)
    {
      v218 = MEMORY[0x24BEE4AF8];
      sub_20CF673C8(0, v57 & ~(v57 >> 63), 0);
      if (v57 < 0)
      {
        __break(1u);
        goto LABEL_77;
      }
      v59 = 0;
      v213 = v218;
      v60 = v5 & 0xC000000000000001;
      v61 = v5;
      do
      {
        if (v60)
          v62 = (id)MEMORY[0x212B98DE8](v59, v5);
        else
          v62 = *(id *)(v5 + 8 * v59 + 32);
        v63 = v62;
        v64 = objc_msgSend(v63, sel_uuid);
        sub_20CF78928();

        v65 = objc_msgSend(v63, sel_layerQuad);
        objc_msgSend(v65, sel_topLeft);
        v67 = v66;
        v69 = v68;
        objc_msgSend(v65, sel_topRight);
        v71 = v70;
        v73 = v72;
        objc_msgSend(v65, sel_bottomRight);
        v75 = v74;
        v77 = v76;
        objc_msgSend(v65, sel_bottomLeft);
        v79 = v78;
        v81 = v80;
        v82 = (int *)type metadata accessor for RecognizedItem.Text(0);
        v83 = &v15[v82[5]];
        *(_QWORD *)v83 = v67;
        *((_QWORD *)v83 + 1) = v69;
        *((_QWORD *)v83 + 2) = v71;
        *((_QWORD *)v83 + 3) = v73;
        *((_QWORD *)v83 + 4) = v75;
        *((_QWORD *)v83 + 5) = v77;
        *((_QWORD *)v83 + 6) = v79;
        *((_QWORD *)v83 + 7) = v81;
        *((_QWORD *)v83 + 8) = v65;
        v84 = objc_msgSend(v63, sel_transcript);
        v85 = sub_20CF78A30();
        v87 = v86;

        v88 = (uint64_t *)&v15[v82[6]];
        *v88 = v85;
        v88[1] = v87;
        v89 = objc_msgSend(v63, sel_observation);

        *(_QWORD *)&v15[v82[7]] = v89;
        swift_storeEnumTagMultiPayload();

        v90 = v213;
        v218 = v213;
        v92 = *(_QWORD *)(v213 + 16);
        v91 = *(_QWORD *)(v213 + 24);
        if (v92 >= v91 >> 1)
        {
          sub_20CF673C8(v91 > 1, v92 + 1, 1);
          v90 = v218;
        }
        ++v59;
        *(_QWORD *)(v90 + 16) = v92 + 1;
        v93 = (*(unsigned __int8 *)(v215 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v215 + 80);
        v213 = v90;
        sub_20CF619E4((uint64_t)v15, v90 + v93 + *(_QWORD *)(v215 + 72) * v92, type metadata accessor for RecognizedItem);
        v7 = v214;
        v5 = v61;
      }
      while (v57 != v59);
      swift_bridgeObjectRelease();
      v58 = v207;
    }
    else
    {
      swift_bridgeObjectRelease();
      v213 = MEMORY[0x24BEE4AF8];
    }
    v94 = objc_msgSend(v209, sel_updatedItems);
    v95 = sub_20CF78A60();

    v96 = (uint64_t)v206;
    if (v95 >> 62)
    {
      swift_bridgeObjectRetain();
      v97 = sub_20CF78BF8();
      swift_bridgeObjectRelease();
      if (v97)
      {
LABEL_31:
        v218 = MEMORY[0x24BEE4AF8];
        sub_20CF673C8(0, v97 & ~(v97 >> 63), 0);
        if ((v97 & 0x8000000000000000) == 0)
        {
          v98 = 0;
          v99 = v218;
          v212 = v95 & 0xC000000000000001;
          v100 = v95;
          do
          {
            if (v212)
              v101 = (id)MEMORY[0x212B98DE8](v98, v95);
            else
              v101 = *(id *)(v95 + 8 * v98 + 32);
            v102 = v101;
            v103 = objc_msgSend(v102, sel_uuid);
            sub_20CF78928();

            v104 = objc_msgSend(v102, sel_layerQuad);
            objc_msgSend(v104, sel_topLeft);
            v106 = v105;
            v108 = v107;
            objc_msgSend(v104, sel_topRight);
            v110 = v109;
            v112 = v111;
            objc_msgSend(v104, sel_bottomRight);
            v114 = v113;
            v116 = v115;
            objc_msgSend(v104, sel_bottomLeft);
            v118 = v117;
            v120 = v119;
            v121 = (int *)type metadata accessor for RecognizedItem.Text(0);
            v122 = (_QWORD *)(v96 + v121[5]);
            *v122 = v106;
            v122[1] = v108;
            v122[2] = v110;
            v122[3] = v112;
            v122[4] = v114;
            v122[5] = v116;
            v122[6] = v118;
            v122[7] = v120;
            v122[8] = v104;
            v123 = objc_msgSend(v102, sel_transcript);
            v124 = sub_20CF78A30();
            v126 = v125;

            v127 = (uint64_t *)(v96 + v121[6]);
            *v127 = v124;
            v127[1] = v126;
            v128 = objc_msgSend(v102, sel_observation);

            *(_QWORD *)(v96 + v121[7]) = v128;
            swift_storeEnumTagMultiPayload();

            v218 = v99;
            v130 = *(_QWORD *)(v99 + 16);
            v129 = *(_QWORD *)(v99 + 24);
            if (v130 >= v129 >> 1)
            {
              sub_20CF673C8(v129 > 1, v130 + 1, 1);
              v99 = v218;
            }
            ++v98;
            *(_QWORD *)(v99 + 16) = v130 + 1;
            sub_20CF619E4(v96, v99+ ((*(unsigned __int8 *)(v215 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v215 + 80))+ *(_QWORD *)(v215 + 72) * v130, type metadata accessor for RecognizedItem);
            v7 = v214;
            v95 = v100;
          }
          while (v97 != v98);
          swift_bridgeObjectRelease();
          v58 = v207;
LABEL_45:
          v131 = objc_msgSend(v209, sel_removedItems);
          v132 = sub_20CF78A60();

          v207 = v99;
          if (v132 >> 62)
          {
            swift_bridgeObjectRetain();
            v133 = sub_20CF78BF8();
            swift_bridgeObjectRelease();
            if (v133)
            {
LABEL_47:
              v218 = MEMORY[0x24BEE4AF8];
              sub_20CF673C8(0, v133 & ~(v133 >> 63), 0);
              if ((v133 & 0x8000000000000000) == 0)
              {
                v134 = 0;
                v135 = v218;
                v212 = v132 & 0xC000000000000001;
                v214 = (char *)v132;
                do
                {
                  v136 = v133;
                  v137 = v135;
                  if (v212)
                    v138 = (id)MEMORY[0x212B98DE8](v134, v132);
                  else
                    v138 = *(id *)(v132 + 8 * v134 + 32);
                  v139 = v138;
                  v140 = objc_msgSend(v139, sel_uuid);
                  sub_20CF78928();

                  v141 = objc_msgSend(v139, sel_layerQuad);
                  objc_msgSend(v141, sel_topLeft);
                  v143 = v142;
                  v145 = v144;
                  objc_msgSend(v141, sel_topRight);
                  v147 = v146;
                  v149 = v148;
                  objc_msgSend(v141, sel_bottomRight);
                  v151 = v150;
                  v153 = v152;
                  objc_msgSend(v141, sel_bottomLeft);
                  v155 = v154;
                  v157 = v156;
                  v158 = (int *)type metadata accessor for RecognizedItem.Text(0);
                  v159 = (_QWORD *)(v58 + v158[5]);
                  *v159 = v143;
                  v159[1] = v145;
                  v159[2] = v147;
                  v159[3] = v149;
                  v159[4] = v151;
                  v159[5] = v153;
                  v159[6] = v155;
                  v159[7] = v157;
                  v159[8] = v141;
                  v160 = objc_msgSend(v139, sel_transcript);
                  v161 = sub_20CF78A30();
                  v162 = v58;
                  v164 = v163;

                  v165 = (uint64_t *)(v162 + v158[6]);
                  *v165 = v161;
                  v165[1] = v164;
                  v166 = objc_msgSend(v139, sel_observation);

                  *(_QWORD *)(v162 + v158[7]) = v166;
                  swift_storeEnumTagMultiPayload();

                  v135 = v137;
                  v218 = v137;
                  v168 = *(_QWORD *)(v137 + 16);
                  v167 = *(_QWORD *)(v137 + 24);
                  if (v168 >= v167 >> 1)
                  {
                    sub_20CF673C8(v167 > 1, v168 + 1, 1);
                    v135 = v218;
                  }
                  ++v134;
                  *(_QWORD *)(v135 + 16) = v168 + 1;
                  sub_20CF619E4(v162, v135+ ((*(unsigned __int8 *)(v215 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v215 + 80))+ *(_QWORD *)(v215 + 72) * v168, type metadata accessor for RecognizedItem);
                  v133 = v136;
                  v58 = v162;
                  v132 = (unint64_t)v214;
                }
                while (v136 != v134);
                swift_bridgeObjectRelease();
                goto LABEL_58;
              }
LABEL_78:
              __break(1u);
              return;
            }
          }
          else
          {
            v133 = *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v133)
              goto LABEL_47;
          }
          swift_bridgeObjectRelease();
          v135 = MEMORY[0x24BEE4AF8];
LABEL_58:
          v54 = v211;
          v169 = v211 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
          swift_beginAccess();
          v170 = MEMORY[0x212B99358](v169);
          v171 = v201;
          if (v170)
          {
            v172 = v135;
            v173 = *(_QWORD **)(v169 + 8);
            v174 = v213;
            if (*(_QWORD *)(v213 + 16))
            {
              ObjectType = swift_getObjectType();
              v176 = v211;
              v177 = *(_QWORD *)(v211 + v171);
              v178 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))v173[3];
              swift_bridgeObjectRetain();
              v178(v176, v174, v177, ObjectType, v173);
              swift_bridgeObjectRelease();
            }
            v179 = v207;
            if (*(_QWORD *)(v207 + 16))
            {
              v180 = swift_getObjectType();
              v181 = v211;
              v182 = *(_QWORD *)(v211 + v171);
              v183 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))v173[4];
              swift_bridgeObjectRetain();
              v183(v181, v179, v182, v180, v173);
              swift_bridgeObjectRelease();
            }
            v135 = v172;
            if (*(_QWORD *)(v172 + 16))
            {
              v184 = swift_getObjectType();
              v54 = v211;
              v185 = *(_QWORD *)(v211 + v171);
              v186 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))v173[5];
              swift_bridgeObjectRetain();
              v186(v54, v172, v185, v184, v173);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_unknownObjectRelease();
              v54 = v211;
            }
          }
          v187 = (char **)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
          swift_beginAccess();
          v188 = *v187;
          v189 = *((_QWORD *)*v187 + 2);
          if (v189)
          {
            v215 = v135;
            v190 = v202;
            v191 = &v188[(*(unsigned __int8 *)(v202 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80)];
            v216 = *(_QWORD *)(v202 + 72);
            v192 = *(void (**)(char *, char *, unint64_t))(v202 + 16);
            v214 = v188;
            swift_bridgeObjectRetain();
            v193 = v205;
            v194 = v171;
            v195 = v204;
            v196 = v7;
            v197 = v190;
            v198 = v203;
            do
            {
              v192(v196, v191, v198);
              v217 = *(_QWORD *)(v211 + v194);
              swift_bridgeObjectRetain();
              sub_20CF78ACC();
              (*(void (**)(char *, uint64_t))(v195 + 8))(v210, v193);
              (*(void (**)(char *, unint64_t))(v197 + 8))(v196, v198);
              v191 += v216;
              --v189;
            }
            while (v189);
            swift_bridgeObjectRelease();
            v54 = v211;
            v135 = v215;
          }
          if (*(_BYTE *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1)
            sub_20CF722A0(v213, v207, v135);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    else
    {
      v97 = *(_QWORD *)((v95 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v97)
        goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    v99 = MEMORY[0x24BEE4AF8];
    goto LABEL_45;
  }
  sub_20CF70DC4();
LABEL_73:
  if (*(_QWORD *)(*(_QWORD *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) + 16))
  {
    objc_msgSend(*(id *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    v199 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
    objc_msgSend(*(id *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer), sel_invalidate);
    v200 = *(void **)(v54 + v199);
    *(_QWORD *)(v54 + v199) = 0;

  }
  else
  {
    sub_20CF73944();
  }
}

void sub_20CF6F954(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  char *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  id v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  id v123;
  id v124;
  id v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  id v156;
  unint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  char *v161;
  id v162;
  unint64_t v163;
  id v164;
  id v165;
  char *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  _QWORD *v201;
  unint64_t v202;
  uint64_t ObjectType;
  uint64_t v204;
  void (*v205)(uint64_t, unint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void (*v209)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v210;
  uint64_t v211;
  void (*v212)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  unint64_t *v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void (*v219)(char *, unint64_t, uint64_t);
  char *v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  char *v226;
  uint64_t v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  uint64_t v238;
  char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t v246;
  char *v247;
  unint64_t v248;
  char *v249;
  unint64_t v250;
  unint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;

  v229 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3C8);
  v230 = *(_QWORD *)(v229 - 8);
  MEMORY[0x24BDAC7A8](v229);
  v3 = (char *)&v225 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C230);
  v243 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v225 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v252 = type metadata accessor for RecognizedItem.Barcode(0);
  v7 = MEMORY[0x24BDAC7A8](v252);
  v247 = (char *)&v225 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v248 = (unint64_t)&v225 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v249 = (char *)&v225 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (unint64_t)&v225 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3E8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v237 = (char *)&v225 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v225 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v241 = (uint64_t)&v225 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v225 - v23;
  v25 = type metadata accessor for RecognizedItem(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v236 = (uint64_t)&v225 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v233 = (uint64_t)&v225 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v238 = (uint64_t)&v225 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v234 = (uint64_t)&v225 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v240 = (uint64_t)&v225 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v235 = (uint64_t)&v225 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v250 = (unint64_t)&v225 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v242 = (uint64_t)&v225 - v41;
  v232 = a1;
  v42 = objc_msgSend(a1, sel_allItems);
  v231 = sub_20CF67D50(0, &qword_25499C410);
  v43 = sub_20CF78A60();

  v44 = v43;
  v251 = v43;
  if (v43 >> 62)
  {
    swift_bridgeObjectRetain();
    v44 = v251;
    v45 = sub_20CF78BF8();
  }
  else
  {
    v45 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v239 = v20;
  v228 = v3;
  v227 = v4;
  v226 = v6;
  if (v45)
  {
    if (v45 < 1)
    {
      __break(1u);
      goto LABEL_44;
    }
    v246 = v45;
    v46 = 0;
    v245 = v44 & 0xC000000000000001;
    v47 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v245)
        v48 = (id)MEMORY[0x212B98DE8](v46, v44);
      else
        v48 = *(id *)(v44 + 8 * v46 + 32);
      v49 = v48;
      v50 = objc_msgSend(v49, sel_uuid);
      sub_20CF78928();

      v51 = objc_msgSend(v49, sel_layerQuad);
      objc_msgSend(v51, sel_topLeft);
      v53 = v52;
      v55 = v54;
      objc_msgSend(v51, sel_topRight);
      v57 = v56;
      v59 = v58;
      objc_msgSend(v51, sel_bottomRight);
      v61 = v60;
      v63 = v62;
      objc_msgSend(v51, sel_bottomLeft);
      v64 = v252;
      v65 = (_QWORD *)(v14 + *(int *)(v252 + 20));
      *v65 = v53;
      v65[1] = v55;
      v65[2] = v57;
      v65[3] = v59;
      v65[4] = v61;
      v65[5] = v63;
      v65[6] = v66;
      v65[7] = v67;
      v65[8] = v51;
      *(_QWORD *)(v14 + *(int *)(v64 + 28)) = objc_msgSend(v49, sel_observation);
      v68 = objc_msgSend(v49, sel_payloadStringValue);
      if (v68)
      {
        v69 = v68;
        v70 = sub_20CF78A30();
        v72 = v71;

      }
      else
      {

        v70 = 0;
        v72 = 0;
      }
      v73 = (uint64_t *)(v14 + *(int *)(v252 + 24));
      *v73 = v70;
      v73[1] = v72;
      sub_20CF619E4(v14, (uint64_t)v24, type metadata accessor for RecognizedItem.Barcode);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
      {
        sub_20CF78618((uint64_t)v24, &qword_25499C3E8);
      }
      else
      {
        v74 = v242;
        sub_20CF619E4((uint64_t)v24, v242, type metadata accessor for RecognizedItem);
        sub_20CF619E4(v74, v250, type metadata accessor for RecognizedItem);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v47 = sub_20CF74F60(0, *(_QWORD *)(v47 + 16) + 1, 1, v47);
        v76 = *(_QWORD *)(v47 + 16);
        v75 = *(_QWORD *)(v47 + 24);
        if (v76 >= v75 >> 1)
          v47 = sub_20CF74F60(v75 > 1, v76 + 1, 1, v47);
        *(_QWORD *)(v47 + 16) = v76 + 1;
        sub_20CF619E4(v250, v47+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * v76, type metadata accessor for RecognizedItem);
      }
      ++v46;
      v44 = v251;
    }
    while (v246 != v46);
  }
  else
  {
    v47 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease_n();
  v77 = v244;
  *(_QWORD *)(v244 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems) = v47;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v77 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems) & 1) != 0)
  {
    v254 = *(_QWORD *)(v77 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems);
    swift_bridgeObjectRetain();
    v78 = swift_bridgeObjectRetain();
    sub_20CF75168(v78);
    v246 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
    *(_QWORD *)(v77 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) = v254;
    swift_bridgeObjectRelease();
    v79 = objc_msgSend(v232, sel_addedItems);
    v14 = sub_20CF78A60();

    if (!(v14 >> 62))
    {
      v80 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v80)
      {
LABEL_24:
        if (v80 < 1)
        {
          __break(1u);
          goto LABEL_105;
        }
        v81 = 0;
        v251 = MEMORY[0x24BEE4AF8];
        do
        {
          if ((v14 & 0xC000000000000001) != 0)
            v82 = (id)MEMORY[0x212B98DE8](v81, v14);
          else
            v82 = *(id *)(v14 + 8 * v81 + 32);
          v83 = v82;
          v84 = objc_msgSend(v83, sel_uuid);
          v85 = v249;
          sub_20CF78928();

          v86 = objc_msgSend(v83, sel_layerQuad);
          objc_msgSend(v86, sel_topLeft);
          v88 = v87;
          v90 = v89;
          objc_msgSend(v86, sel_topRight);
          v92 = v91;
          v94 = v93;
          objc_msgSend(v86, sel_bottomRight);
          v96 = v95;
          v98 = v97;
          objc_msgSend(v86, sel_bottomLeft);
          v99 = v252;
          v100 = &v85[*(int *)(v252 + 20)];
          *(_QWORD *)v100 = v88;
          *((_QWORD *)v100 + 1) = v90;
          *((_QWORD *)v100 + 2) = v92;
          *((_QWORD *)v100 + 3) = v94;
          *((_QWORD *)v100 + 4) = v96;
          *((_QWORD *)v100 + 5) = v98;
          *((_QWORD *)v100 + 6) = v101;
          *((_QWORD *)v100 + 7) = v102;
          *((_QWORD *)v100 + 8) = v86;
          *(_QWORD *)&v85[*(int *)(v99 + 28)] = objc_msgSend(v83, sel_observation);
          v103 = objc_msgSend(v83, sel_payloadStringValue);
          if (v103)
          {
            v104 = v103;
            v105 = sub_20CF78A30();
            v107 = v106;

          }
          else
          {

            v105 = 0;
            v107 = 0;
          }
          v108 = (uint64_t)v249;
          v109 = (uint64_t *)&v249[*(int *)(v252 + 24)];
          *v109 = v105;
          v109[1] = v107;
          v110 = v241;
          sub_20CF619E4(v108, v241, type metadata accessor for RecognizedItem.Barcode);
          swift_storeEnumTagMultiPayload();
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v110, 0, 1, v25);

          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v110, 1, v25) == 1)
          {
            sub_20CF78618(v110, &qword_25499C3E8);
          }
          else
          {
            v111 = v110;
            v112 = v235;
            sub_20CF619E4(v111, v235, type metadata accessor for RecognizedItem);
            sub_20CF619E4(v112, v240, type metadata accessor for RecognizedItem);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
              v113 = v251;
            else
              v113 = sub_20CF74F60(0, *(_QWORD *)(v251 + 16) + 1, 1, v251);
            v115 = *(_QWORD *)(v113 + 16);
            v114 = *(_QWORD *)(v113 + 24);
            if (v115 >= v114 >> 1)
              v113 = sub_20CF74F60(v114 > 1, v115 + 1, 1, v113);
            *(_QWORD *)(v113 + 16) = v115 + 1;
            v116 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
            v251 = v113;
            sub_20CF619E4(v240, v113 + v116 + *(_QWORD *)(v26 + 72) * v115, type metadata accessor for RecognizedItem);
          }
          ++v81;
        }
        while (v80 != v81);
LABEL_46:
        swift_bridgeObjectRelease_n();
        v118 = objc_msgSend(v232, sel_updatedItems);
        v119 = sub_20CF78A60();

        if (v119 >> 62)
        {
          swift_bridgeObjectRetain();
          v120 = sub_20CF78BF8();
          if (v120)
          {
LABEL_48:
            if (v120 >= 1)
            {
              v121 = 0;
              v250 = v119 & 0xC000000000000001;
              v122 = MEMORY[0x24BEE4AF8];
              do
              {
                if (v250)
                  v123 = (id)MEMORY[0x212B98DE8](v121, v119);
                else
                  v123 = *(id *)(v119 + 8 * v121 + 32);
                v124 = v123;
                v125 = objc_msgSend(v124, sel_uuid);
                v126 = v248;
                sub_20CF78928();

                v127 = objc_msgSend(v124, sel_layerQuad);
                objc_msgSend(v127, sel_topLeft);
                v129 = v128;
                v131 = v130;
                objc_msgSend(v127, sel_topRight);
                v133 = v132;
                v135 = v134;
                objc_msgSend(v127, sel_bottomRight);
                v137 = v136;
                v139 = v138;
                objc_msgSend(v127, sel_bottomLeft);
                v140 = v252;
                v141 = (_QWORD *)(v126 + *(int *)(v252 + 20));
                *v141 = v129;
                v141[1] = v131;
                v141[2] = v133;
                v141[3] = v135;
                v141[4] = v137;
                v141[5] = v139;
                v141[6] = v142;
                v141[7] = v143;
                v141[8] = v127;
                *(_QWORD *)(v126 + *(int *)(v140 + 28)) = objc_msgSend(v124, sel_observation);
                v144 = objc_msgSend(v124, sel_payloadStringValue);
                if (v144)
                {
                  v145 = v144;
                  v146 = sub_20CF78A30();
                  v148 = v147;

                }
                else
                {

                  v146 = 0;
                  v148 = 0;
                }
                v149 = v248;
                v150 = (uint64_t *)(v248 + *(int *)(v252 + 24));
                *v150 = v146;
                v150[1] = v148;
                v151 = (uint64_t)v239;
                sub_20CF619E4(v149, (uint64_t)v239, type metadata accessor for RecognizedItem.Barcode);
                swift_storeEnumTagMultiPayload();
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v151, 0, 1, v25);

                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v151, 1, v25) == 1)
                {
                  sub_20CF78618(v151, &qword_25499C3E8);
                }
                else
                {
                  v152 = v151;
                  v153 = v234;
                  sub_20CF619E4(v152, v234, type metadata accessor for RecognizedItem);
                  sub_20CF619E4(v153, v238, type metadata accessor for RecognizedItem);
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v122 = sub_20CF74F60(0, *(_QWORD *)(v122 + 16) + 1, 1, v122);
                  v155 = *(_QWORD *)(v122 + 16);
                  v154 = *(_QWORD *)(v122 + 24);
                  if (v155 >= v154 >> 1)
                    v122 = sub_20CF74F60(v154 > 1, v155 + 1, 1, v122);
                  *(_QWORD *)(v122 + 16) = v155 + 1;
                  sub_20CF619E4(v238, v122+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * v155, type metadata accessor for RecognizedItem);
                }
                ++v121;
              }
              while (v120 != v121);
LABEL_66:
              swift_bridgeObjectRelease_n();
              v156 = objc_msgSend(v232, sel_removedItems);
              v157 = sub_20CF78A60();

              if (v157 >> 62)
              {
                swift_bridgeObjectRetain();
                v158 = sub_20CF78BF8();
                v248 = v122;
                if (v158)
                {
LABEL_68:
                  if (v158 >= 1)
                  {
                    v159 = 0;
                    v250 = v157 & 0xC000000000000001;
                    v160 = MEMORY[0x24BEE4AF8];
                    v249 = (char *)v158;
                    do
                    {
                      if (v250)
                        v162 = (id)MEMORY[0x212B98DE8](v159, v157);
                      else
                        v162 = *(id *)(v157 + 8 * (_QWORD)v159 + 32);
                      v163 = v160;
                      v164 = v162;
                      v165 = objc_msgSend(v164, sel_uuid);
                      v166 = v247;
                      sub_20CF78928();

                      v167 = objc_msgSend(v164, sel_layerQuad);
                      objc_msgSend(v167, sel_topLeft);
                      v169 = v168;
                      v171 = v170;
                      objc_msgSend(v167, sel_topRight);
                      v173 = v172;
                      v175 = v174;
                      objc_msgSend(v167, sel_bottomRight);
                      v177 = v176;
                      v179 = v178;
                      objc_msgSend(v167, sel_bottomLeft);
                      v180 = v252;
                      v181 = &v166[*(int *)(v252 + 20)];
                      *(_QWORD *)v181 = v169;
                      *((_QWORD *)v181 + 1) = v171;
                      *((_QWORD *)v181 + 2) = v173;
                      *((_QWORD *)v181 + 3) = v175;
                      *((_QWORD *)v181 + 4) = v177;
                      *((_QWORD *)v181 + 5) = v179;
                      *((_QWORD *)v181 + 6) = v182;
                      *((_QWORD *)v181 + 7) = v183;
                      *((_QWORD *)v181 + 8) = v167;
                      *(_QWORD *)&v166[*(int *)(v180 + 28)] = objc_msgSend(v164, sel_observation);
                      v184 = objc_msgSend(v164, sel_payloadStringValue);
                      if (v184)
                      {
                        v185 = v184;
                        v186 = sub_20CF78A30();
                        v188 = v187;

                      }
                      else
                      {

                        v186 = 0;
                        v188 = 0;
                      }
                      v189 = (uint64_t)v237;
                      v190 = (uint64_t)v247;
                      v191 = (uint64_t *)&v247[*(int *)(v252 + 24)];
                      *v191 = v186;
                      v191[1] = v188;
                      sub_20CF619E4(v190, v189, type metadata accessor for RecognizedItem.Barcode);
                      swift_storeEnumTagMultiPayload();
                      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v189, 0, 1, v25);

                      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v189, 1, v25) == 1)
                      {
                        sub_20CF78618(v189, &qword_25499C3E8);
                        v160 = v163;
                        v161 = v249;
                      }
                      else
                      {
                        v192 = v189;
                        v193 = v233;
                        sub_20CF619E4(v192, v233, type metadata accessor for RecognizedItem);
                        sub_20CF619E4(v193, v236, type metadata accessor for RecognizedItem);
                        v160 = v163;
                        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                          v160 = sub_20CF74F60(0, *(_QWORD *)(v163 + 16) + 1, 1, v163);
                        v161 = v249;
                        v195 = *(_QWORD *)(v160 + 16);
                        v194 = *(_QWORD *)(v160 + 24);
                        if (v195 >= v194 >> 1)
                          v160 = sub_20CF74F60(v194 > 1, v195 + 1, 1, v160);
                        *(_QWORD *)(v160 + 16) = v195 + 1;
                        sub_20CF619E4(v236, v160+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * v195, type metadata accessor for RecognizedItem);
                      }
                      ++v159;
                    }
                    while (v161 != v159);
                    goto LABEL_86;
                  }
LABEL_106:
                  __break(1u);
                  return;
                }
              }
              else
              {
                v158 = *(_QWORD *)((v157 & 0xFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                v248 = v122;
                if (v158)
                  goto LABEL_68;
              }
              v160 = MEMORY[0x24BEE4AF8];
LABEL_86:
              swift_bridgeObjectRelease_n();
              v117 = v244;
              v196 = v244 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
              swift_beginAccess();
              v197 = MEMORY[0x212B99358](v196);
              v198 = v229;
              v199 = v230;
              if (v197)
              {
                v200 = v117;
                v201 = *(_QWORD **)(v196 + 8);
                v202 = v251;
                if (*(_QWORD *)(v251 + 16))
                {
                  ObjectType = swift_getObjectType();
                  v204 = *(_QWORD *)(v200 + v246);
                  v205 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t, _QWORD *))v201[3];
                  swift_bridgeObjectRetain();
                  v205(v200, v202, v204, ObjectType, v201);
                  swift_bridgeObjectRelease();
                }
                v206 = v248;
                if (*(_QWORD *)(v248 + 16))
                {
                  v207 = swift_getObjectType();
                  v208 = *(_QWORD *)(v200 + v246);
                  v209 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))v201[4];
                  swift_bridgeObjectRetain();
                  v209(v200, v206, v208, v207, v201);
                  swift_bridgeObjectRelease();
                }
                if (*(_QWORD *)(v160 + 16))
                {
                  v210 = swift_getObjectType();
                  v117 = v200;
                  v211 = *(_QWORD *)(v200 + v246);
                  v212 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))v201[5];
                  swift_bridgeObjectRetain();
                  v212(v200, v160, v211, v210, v201);
                  swift_unknownObjectRelease();
                  swift_bridgeObjectRelease();
                  v199 = v230;
                }
                else
                {
                  swift_unknownObjectRelease();
                  v199 = v230;
                  v117 = v200;
                }
              }
              v213 = (unint64_t *)(v117
                                        + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
              swift_beginAccess();
              v214 = *v213;
              v215 = *(_QWORD *)(*v213 + 16);
              if (v215)
              {
                v252 = v160;
                v216 = v214
                     + ((*(unsigned __int8 *)(v243 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v243 + 80));
                v217 = *(_QWORD *)(v243 + 72);
                v218 = v246;
                v219 = *(void (**)(char *, unint64_t, uint64_t))(v243 + 16);
                v250 = v214;
                swift_bridgeObjectRetain();
                v220 = v228;
                v221 = v227;
                v222 = v226;
                do
                {
                  v219(v222, v216, v221);
                  v253 = *(_QWORD *)(v244 + v218);
                  swift_bridgeObjectRetain();
                  sub_20CF78ACC();
                  (*(void (**)(char *, uint64_t))(v199 + 8))(v220, v198);
                  (*(void (**)(char *, uint64_t))(v243 + 8))(v222, v221);
                  v216 += v217;
                  --v215;
                }
                while (v215);
                swift_bridgeObjectRelease();
                v160 = v252;
                v117 = v244;
              }
              if (*(_BYTE *)(v117 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1)
                sub_20CF722A0(v251, v248, v160);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_101;
            }
LABEL_105:
            __break(1u);
            goto LABEL_106;
          }
        }
        else
        {
          v120 = *(_QWORD *)((v119 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v120)
            goto LABEL_48;
        }
        v122 = MEMORY[0x24BEE4AF8];
        goto LABEL_66;
      }
LABEL_45:
      v251 = MEMORY[0x24BEE4AF8];
      goto LABEL_46;
    }
LABEL_44:
    swift_bridgeObjectRetain();
    v80 = sub_20CF78BF8();
    if (v80)
      goto LABEL_24;
    goto LABEL_45;
  }
  sub_20CF70DC4();
  v117 = v77;
LABEL_101:
  if (*(_QWORD *)(*(_QWORD *)(v117 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems)
                 + 16))
  {
    objc_msgSend(*(id *)(v117 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    v223 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
    objc_msgSend(*(id *)(v117 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer), sel_invalidate);
    v224 = *(void **)(v117 + v223);
    *(_QWORD *)(v117 + v223) = 0;

  }
  else
  {
    sub_20CF73944();
  }
}

void *sub_20CF70DC4()
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void *result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  void (*v54)(_QWORD, _QWORD, _QWORD);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t, uint64_t);
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ObjectType;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t *, _QWORD);
  uint64_t v83;
  uint64_t v84;
  char *v85;
  int EnumCaseMultiPayload;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  void (*v101)(char *, unint64_t, uint64_t);
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t);
  uint64_t v113;
  uint64_t *v114;
  unint64_t v115;
  uint32_t *p_align;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t);
  uint64_t v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t);
  uint64_t v132;
  void (*v133)(_QWORD, _QWORD, _QWORD);
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  uint64_t v139;
  void *v140;
  id v141;
  void *v142;
  id v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  _QWORD *v156;
  void *v157;
  id v158;
  _QWORD v159[2];
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  __int128 v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(_QWORD, _QWORD, _QWORD);
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  uint64_t aBlock;
  uint64_t v193;
  uint64_t (*v194)();
  void *v195;
  id (*v196)();
  _QWORD *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v159 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C230);
  v189 = *(_QWORD *)(v168 - 8);
  MEMORY[0x24BDAC7A8](v168);
  v191 = (char *)v159 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3D0);
  v7 = MEMORY[0x24BDAC7A8](v165);
  v164 = (char *)v159 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v174 = (uint64_t)v159 - v9;
  v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3D8);
  v10 = MEMORY[0x24BDAC7A8](v163);
  v162 = (char *)v159 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v175 = (uint64_t)v159 - v12;
  v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3E0);
  v176 = *(_QWORD *)(v177 - 8);
  v13 = MEMORY[0x24BDAC7A8](v177);
  v173 = (char *)v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v170 = (char *)v159 - v15;
  v182 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8](v182);
  v184 = (uint64_t)v159 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8](v181);
  v183 = (uint64_t)v159 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for RecognizedItem(0);
  v188 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v160 = (uint64_t)v159 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v161 = (uint64_t)v159 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v187 = (uint64_t)v159 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)v159 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)v159 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)v159 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)v159 - v34;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C3E8);
  v37 = MEMORY[0x24BDAC7A8](v36);
  result = (void *)MEMORY[0x24BDAC7A8](v37);
  v171 = (uint64_t)v159 - v40;
  v41 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor;
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor)
    && !*(_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor)
    && !*(_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor))
  {
    return result;
  }
  *(_QWORD *)&v172 = v39;
  v166 = v3;
  v167 = v2;
  aBlock = *(_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems);
  swift_bridgeObjectRetain();
  v42 = swift_bridgeObjectRetain();
  sub_20CF75168(v42);
  v186 = aBlock;
  v43 = *(void **)(v1 + v41);
  v190 = v1;
  if (v43)
  {
    v44 = v43;
    v45 = objc_msgSend(v44, sel_configuration);
    objc_msgSend(v45, sel_comparisonPoint);
    v47 = v46;
    v49 = v48;

    v50 = v18;
  }
  else
  {
    result = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    v50 = v18;
    if (!result)
    {
      result = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
      if (!result)
        goto LABEL_57;
    }
    v45 = objc_msgSend(result, sel_configuration);
    objc_msgSend(v45, sel_comparisonPoint);
    v47 = v51;
    v49 = v52;
  }

  v53 = v186;
  v54 = *(void (**)(_QWORD, _QWORD, _QWORD))(v186 + 16);
  v169 = v5;
  if (v54)
  {
    v185 = v186 + ((*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80));
    sub_20CF619A0(v185, (uint64_t)v35);
    result = (void *)swift_bridgeObjectRetain();
    if (v54 != (void (*)(_QWORD, _QWORD, _QWORD))1)
    {
      v180 = v183 + 64;
      v179 = v184 + 64;
      v115 = 1;
      p_align = (_DWORD *)(&stru_24C5DAFE8 + 24);
      v178 = v54;
      while (v115 < *(_QWORD *)(v53 + 16))
      {
        sub_20CF619A0(v185 + *(_QWORD *)(v188 + 72) * v115, (uint64_t)v33);
        sub_20CF619A0((uint64_t)v33, (uint64_t)v30);
        v117 = v50;
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v118 = v184;
          sub_20CF619E4((uint64_t)v30, v184, type metadata accessor for RecognizedItem.Barcode);
          v119 = *(id *)(v179 + *(int *)(v182 + 20));
          v120 = v118;
          v121 = type metadata accessor for RecognizedItem.Barcode;
          p_align = &stru_24C5DAFE8.align;
        }
        else
        {
          v122 = v183;
          sub_20CF619E4((uint64_t)v30, v183, type metadata accessor for RecognizedItem.Text);
          v119 = *(id *)(v180 + *(int *)(v181 + 20));
          v120 = v122;
          v121 = type metadata accessor for RecognizedItem.Text;
        }
        sub_20CF61A28(v120, v121);
        objc_msgSend(v119, *((SEL *)p_align + 390));
        v124 = v123;
        v126 = v125;

        v127 = MEMORY[0x212B98ECC](v47, v49, v124, v126);
        sub_20CF619A0((uint64_t)v35, (uint64_t)v27);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v128 = v184;
          sub_20CF619E4((uint64_t)v27, v184, type metadata accessor for RecognizedItem.Barcode);
          v129 = *(id *)(v179 + *(int *)(v182 + 20));
          v130 = v128;
          v131 = type metadata accessor for RecognizedItem.Barcode;
          p_align = (_DWORD *)(&stru_24C5DAFE8 + 24);
        }
        else
        {
          v132 = v183;
          sub_20CF619E4((uint64_t)v27, v183, type metadata accessor for RecognizedItem.Text);
          v129 = *(id *)(v180 + *(int *)(v181 + 20));
          v130 = v132;
          v131 = type metadata accessor for RecognizedItem.Text;
        }
        sub_20CF61A28(v130, v131);
        v133 = v178;
        objc_msgSend(v129, *((SEL *)p_align + 390));
        v135 = v134;
        v137 = v136;

        if (v127 >= MEMORY[0x212B98ECC](v47, v49, v135, v137))
        {
          result = (void *)sub_20CF61A28((uint64_t)v33, type metadata accessor for RecognizedItem);
        }
        else
        {
          sub_20CF61A28((uint64_t)v35, type metadata accessor for RecognizedItem);
          result = (void *)sub_20CF619E4((uint64_t)v33, (uint64_t)v35, type metadata accessor for RecognizedItem);
        }
        v50 = v117;
        ++v115;
        v53 = v186;
        if (v133 == (void (*)(_QWORD, _QWORD, _QWORD))v115)
          goto LABEL_11;
      }
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
      return result;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    v55 = v171;
    sub_20CF619E4((uint64_t)v35, v171, type metadata accessor for RecognizedItem);
    v56 = v188;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v188 + 56))(v55, 0, 1, v50);
    v5 = v169;
  }
  else
  {
    v56 = v188;
    v55 = v171;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 56))(v171, 1, 1, v50);
  }
  swift_bridgeObjectRelease();
  v57 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
  v58 = v190;
  v59 = *(_QWORD *)(v190 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems);
  v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
  v61 = v60(v55, 1, v50);
  v62 = v177;
  v159[1] = v50;
  v180 = v57;
  if (v61 != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFA0);
    v64 = v50;
    v65 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = xmmword_20CF79CC0;
    v66 = v172;
    sub_20CF78654(v55, v172, &qword_25499C3E8);
    result = (void *)v60(v66, 1, v64);
    if ((_DWORD)result != 1)
    {
      sub_20CF619E4(v66, v63 + v65, type metadata accessor for RecognizedItem);
      v57 = v180;
      v5 = v169;
      goto LABEL_17;
    }
    goto LABEL_56;
  }
  v63 = MEMORY[0x24BEE4AF8];
LABEL_17:
  *(_QWORD *)(v58 + v57) = v63;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v58 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
  swift_beginAccess();
  v68 = MEMORY[0x212B99358](v67);
  if (v68)
  {
    v179 = v68;
    v186 = *(_QWORD *)(v67 + 8);
    aBlock = *(_QWORD *)(v58 + v57);
    v198 = v59;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499C120);
    sub_20CF78594(&qword_25499C3F0, &qword_25499C120, MEMORY[0x24BEE12B0]);
    sub_20CF789F4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20CF78594(&qword_25499C3F8, &qword_25499C3E0, MEMORY[0x24BEE3150]);
    sub_20CF78AF0();
    sub_20CF78AFC();
    if (aBlock == v198 && (v69 = *(_QWORD *)(v190 + v57), *(_QWORD *)(v69 + 16)))
    {
      ObjectType = swift_getObjectType();
      v71 = v186;
      v72 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v186 + 32);
      swift_bridgeObjectRetain();
      v73 = v190;
      v72(v190, v69, v69, ObjectType, v71);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v176 + 8))(v170, v62);
      v58 = v73;
    }
    else
    {
      v74 = v176;
      v75 = (uint64_t)v162;
      v178 = *(void (**)(_QWORD, _QWORD, _QWORD))(v176 + 16);
      v178(v162, v170, v62);
      sub_20CF78AF0();
      v76 = v163;
      *(_QWORD *)(v75 + *(int *)(v163 + 36)) = aBlock;
      v77 = v175;
      sub_20CF785D4(v75, v175, &qword_25499C3D8);
      v78 = (uint64_t *)(v77 + *(int *)(v76 + 36));
      v79 = *v78;
      sub_20CF78AFC();
      v80 = (uint64_t)v164;
      v81 = v187;
      if (v79 != aBlock)
      {
        v172 = xmmword_20CF79CC0;
        do
        {
          v82 = (void (*)(uint64_t *, _QWORD))sub_20CF78B14();
          v83 = v174;
          sub_20CF78654(v84, v174, &qword_25499C3D0);
          v82(&aBlock, 0);
          v85 = v173;
          v178(v173, v77, v62);
          sub_20CF78B08();
          (*(void (**)(char *, uint64_t))(v74 + 8))(v85, v62);
          sub_20CF785D4(v83, v80, &qword_25499C3D0);
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          v87 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C400);
          sub_20CF619E4(v80 + *(int *)(v87 + 48), v81, type metadata accessor for RecognizedItem);
          v185 = swift_getObjectType();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFA0);
          v88 = (*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80);
          v89 = swift_allocObject();
          *(_OWORD *)(v89 + 16) = v172;
          sub_20CF619A0(v187, v89 + v88);
          v90 = v190;
          v91 = *(_QWORD *)(v190 + v180);
          v92 = 24;
          if (EnumCaseMultiPayload == 1)
            v92 = 40;
          v93 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v186 + v92);
          swift_bridgeObjectRetain();
          v93(v90, v89, v91, v185, v186);
          v81 = v187;
          v77 = v175;
          swift_bridgeObjectRelease();
          v62 = v177;
          swift_bridgeObjectRelease();
          sub_20CF61A28(v81, type metadata accessor for RecognizedItem);
          v94 = *v78;
          sub_20CF78AFC();
          v95 = v94 == aBlock;
          v74 = v176;
        }
        while (!v95);
      }
      swift_unknownObjectRelease();
      sub_20CF78618(v77, &qword_25499C3D8);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v170, v62);
      v55 = v171;
      v58 = v190;
      v5 = v169;
      v57 = v180;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v96 = v58 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations;
  swift_beginAccess();
  v97 = *(_QWORD *)(*(_QWORD *)v96 + 16);
  v98 = v191;
  if (v97)
  {
    v99 = *(_QWORD *)v96
        + ((*(unsigned __int8 *)(v189 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v189 + 80));
    v100 = *(_QWORD *)(v189 + 72);
    v101 = *(void (**)(char *, unint64_t, uint64_t))(v189 + 16);
    v187 = *(_QWORD *)v96;
    swift_bridgeObjectRetain();
    v102 = v167;
    v103 = v5;
    v104 = v168;
    v105 = v57;
    v106 = v166;
    do
    {
      v101(v98, v99, v104);
      aBlock = *(_QWORD *)(v190 + v105);
      swift_bridgeObjectRetain();
      sub_20CF78ACC();
      v98 = v191;
      (*(void (**)(char *, uint64_t))(v106 + 8))(v103, v102);
      (*(void (**)(char *, uint64_t))(v189 + 8))(v98, v104);
      v99 += v100;
      --v97;
    }
    while (v97);
    swift_bridgeObjectRelease();
    v58 = v190;
    v55 = v171;
    v57 = v105;
  }
  if (*(_BYTE *)(v58 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1)
  {
    v107 = v58;
    v108 = *(void **)(v58 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView);
    if (v108)
    {
      v109 = *(_QWORD *)(v107 + v57);
      if (*(_QWORD *)(v109 + 16))
      {
        v110 = v161;
        sub_20CF619A0(v109 + ((*(unsigned __int8 *)(v188 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80)), v161);
        v111 = v160;
        sub_20CF619A0(v110, v160);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v112 = type metadata accessor for RecognizedItem.Barcode;
          v113 = v184;
          sub_20CF619E4(v111, v184, type metadata accessor for RecognizedItem.Barcode);
          v114 = &v200;
        }
        else
        {
          v112 = type metadata accessor for RecognizedItem.Text;
          v113 = v183;
          sub_20CF619E4(v111, v183, type metadata accessor for RecognizedItem.Text);
          v114 = &v199;
        }
        v142 = *(void **)(v113 + *(int *)(*(v114 - 32) + 20) + 64);
        v143 = v108;
        v144 = v142;
        sub_20CF61A28(v113, v112);
        objc_msgSend(v144, sel_minimumBoundingRectWithoutRotation);
        v146 = v145;
        v148 = v147;
        v150 = v149;
        v152 = v151;
        objc_msgSend(v144, sel_averagedAngleFromBottomAndTopEdges);
        v154 = v153;
        v155 = (void *)objc_opt_self();
        v156 = (_QWORD *)swift_allocObject();
        v156[2] = v108;
        v156[3] = v146;
        v156[4] = v148;
        v156[5] = v150;
        v156[6] = v152;
        v156[7] = v154;
        v196 = sub_20CF784EC;
        v197 = v156;
        aBlock = MEMORY[0x24BDAC760];
        v193 = 1107296256;
        v194 = sub_20CF6A5F4;
        v195 = &block_descriptor_77;
        v157 = _Block_copy(&aBlock);
        v158 = v108;
        swift_release();
        objc_msgSend(v155, sel_animate_, v157);
        _Block_release(v157);

        sub_20CF61A28(v110, type metadata accessor for RecognizedItem);
      }
      else
      {
        v138 = (void *)objc_opt_self();
        v139 = swift_allocObject();
        *(_QWORD *)(v139 + 16) = v108;
        v196 = sub_20CF78558;
        v197 = (_QWORD *)v139;
        aBlock = MEMORY[0x24BDAC760];
        v193 = 1107296256;
        v194 = sub_20CF6A5F4;
        v195 = &block_descriptor_83;
        v140 = _Block_copy(&aBlock);
        v141 = v108;
        swift_release();
        objc_msgSend(v138, sel_animate_, v140);

        _Block_release(v140);
      }
    }
  }
  return (void *)sub_20CF78618(v55, &qword_25499C3E8);
}

uint64_t sub_20CF71FD8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;

  v31 = a2;
  v3 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RecognizedItem(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v15 = sub_20CF78934();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v30 - v20;
  sub_20CF619A0(a1, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v22 = type metadata accessor for RecognizedItem.Barcode;
    sub_20CF619E4((uint64_t)v14, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    v23 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v23(v21, v5, v15);
    v24 = (uint64_t)v5;
  }
  else
  {
    v22 = type metadata accessor for RecognizedItem.Text;
    sub_20CF619E4((uint64_t)v14, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    v23 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v23(v21, v8, v15);
    v24 = (uint64_t)v8;
  }
  sub_20CF61A28(v24, v22);
  sub_20CF619A0(v31, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CF619E4((uint64_t)v12, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    v23(v19, v5, v15);
    v25 = (uint64_t)v5;
    v26 = type metadata accessor for RecognizedItem.Barcode;
  }
  else
  {
    sub_20CF619E4((uint64_t)v12, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    v23(v19, v8, v15);
    v25 = (uint64_t)v8;
    v26 = type metadata accessor for RecognizedItem.Text;
  }
  sub_20CF61A28(v25, v26);
  v27 = sub_20CF7891C();
  v28 = *(void (**)(char *, uint64_t))(v16 + 8);
  v28(v19, v15);
  v28(v21, v15);
  return v27 & 1;
}

uint64_t sub_20CF72274(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_20CF722A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);
  void (*v71)(uint64_t, uint64_t, uint64_t);
  id v72;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v74;
  char v75;
  unint64_t v76;
  uint64_t v77;
  _BOOL8 v78;
  uint64_t v79;
  char v80;
  unint64_t v81;
  char v82;
  _QWORD *v83;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t);
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t);
  void (*v116)(uint64_t, uint64_t, uint64_t);
  _QWORD *v117;
  unint64_t v118;
  char v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t);
  unint64_t v129;
  char v130;
  char v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  _QWORD v137[2];
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id *v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  char v166;
  uint64_t v167;

  v139 = a3;
  v6 = sub_20CF78934();
  v164 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v149 = (uint64_t)v137 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v142 = (char *)v137 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v137 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v161 = (uint64_t)v137 - v14;
  v148 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8](v148);
  v160 = (uint64_t)v137 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8](v147);
  v159 = (uint64_t)v137 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = type metadata accessor for RecognizedItem(0);
  v140 = *(_QWORD *)(v162 - 8);
  v17 = MEMORY[0x24BDAC7A8](v162);
  v19 = (char *)v137 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v137 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v156 = (uint64_t)v137 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v141 = (uint64_t)v137 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v137 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v158 = (uint64_t)v137 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v153 = (uint64_t)v137 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v152 = (uint64_t)v137 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)v137 - v36;
  v154 = v3;
  v38 = (uint64_t *)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID];
  result = swift_beginAccess();
  if (!*v38)
    return result;
  v146 = v29;
  v157 = v13;
  v138 = a2;
  v40 = *(_QWORD *)(a1 + 16);
  v163 = v6;
  v145 = v19;
  v155 = v22;
  v41 = v158;
  if (!v40)
    goto LABEL_26;
  v42 = a1;
  v43 = (id *)&v154[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView];
  v44 = v140;
  v45 = v42 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
  v137[1] = v42;
  swift_bridgeObjectRetain();
  v151 = v43;
  swift_beginAccess();
  v144 = v159 + 64;
  v143 = v160 + 64;
  v150 = *(_QWORD *)(v44 + 72);
  do
  {
    sub_20CF619A0(v45, (uint64_t)v37);
    v47 = objc_msgSend(v154, sel_view);
    if (!v47)
      goto LABEL_69;
    v48 = v47;
    objc_msgSend(v47, sel_bounds);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;

    v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF88]), sel_initWithFrame_, v50, v52, v54, v56);
    v58 = v152;
    sub_20CF619A0((uint64_t)v37, v152);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v59 = v58;
      v60 = v160;
      v61 = type metadata accessor for RecognizedItem.Barcode;
      sub_20CF619E4(v59, v160, type metadata accessor for RecognizedItem.Barcode);
      v62 = *(int *)(v148 + 20);
      v63 = (uint64_t *)&v166;
    }
    else
    {
      v64 = v58;
      v60 = v159;
      v61 = type metadata accessor for RecognizedItem.Text;
      sub_20CF619E4(v64, v159, type metadata accessor for RecognizedItem.Text);
      v62 = *(int *)(v147 + 20);
      v63 = &v167;
    }
    v65 = *(id *)(*(v63 - 32) + v62);
    sub_20CF61A28(v60, v61);
    objc_msgSend(v57, sel_setQuad_, v65);

    v66 = v153;
    sub_20CF619A0((uint64_t)v37, v153);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v67 = v66;
      v68 = v160;
      v69 = v160;
      v70 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      v67 = v66;
      v68 = v159;
      v69 = v159;
      v70 = type metadata accessor for RecognizedItem.Text;
    }
    sub_20CF619E4(v67, v69, v70);
    v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 16);
    v71(v161, v68, v163);
    sub_20CF61A28(v68, v70);
    swift_beginAccess();
    if (!*v38)
      goto LABEL_70;
    v72 = v57;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v165 = (_QWORD *)*v38;
    v74 = (uint64_t)v165;
    *v38 = 0x8000000000000000;
    v76 = sub_20CF752DC(v161);
    v77 = *(_QWORD *)(v74 + 16);
    v78 = (v75 & 1) == 0;
    v79 = v77 + v78;
    if (__OFADD__(v77, v78))
    {
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      result = sub_20CF78C58();
      __break(1u);
      return result;
    }
    v80 = v75;
    if (*(_QWORD *)(v74 + 24) >= v79)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v83 = v165;
        if ((v75 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_20CF75ABC();
        v83 = v165;
        if ((v80 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_20CF75488(v79, isUniquelyReferenced_nonNull_native);
      v81 = sub_20CF752DC(v161);
      if ((v80 & 1) != (v82 & 1))
        goto LABEL_72;
      v76 = v81;
      v83 = v165;
      if ((v80 & 1) != 0)
      {
LABEL_4:
        v46 = v83[7];

        *(_QWORD *)(v46 + 8 * v76) = v72;
        goto LABEL_5;
      }
    }
    v83[(v76 >> 6) + 8] |= 1 << v76;
    v71(v83[6] + *(_QWORD *)(v164 + 72) * v76, v161, v163);
    *(_QWORD *)(v83[7] + 8 * v76) = v72;
    v84 = v83[2];
    v85 = __OFADD__(v84, 1);
    v86 = v84 + 1;
    if (v85)
      goto LABEL_66;
    v83[2] = v86;
LABEL_5:
    *v38 = (uint64_t)v83;
    swift_bridgeObjectRelease();
    v6 = v163;
    (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v161, v163);
    swift_endAccess();
    objc_msgSend(*v151, sel_addSubview_, v72);

    sub_20CF61A28((uint64_t)v37, type metadata accessor for RecognizedItem);
    v45 += v150;
    --v40;
    v41 = v158;
  }
  while (v40);
  swift_bridgeObjectRelease();
  v19 = v145;
LABEL_26:
  v87 = *(_QWORD *)(v138 + 16);
  if (!v87)
    goto LABEL_42;
  v88 = v138 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
  v161 = v159 + 64;
  v154 = (char *)(v160 + 64);
  v89 = *(_QWORD *)(v140 + 72);
  swift_bridgeObjectRetain();
  v90 = (uint64_t)v146;
  while (2)
  {
    sub_20CF619A0(v88, v41);
    sub_20CF619A0(v41, v90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v91 = v160;
      sub_20CF619E4(v90, v160, type metadata accessor for RecognizedItem.Barcode);
      (*(void (**)(char *, uint64_t, uint64_t))(v164 + 16))(v157, v91, v6);
      v92 = v91;
      v93 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      v94 = v159;
      sub_20CF619E4(v90, v159, type metadata accessor for RecognizedItem.Text);
      (*(void (**)(char *, uint64_t, uint64_t))(v164 + 16))(v157, v94, v6);
      v92 = v94;
      v93 = type metadata accessor for RecognizedItem.Text;
    }
    sub_20CF61A28(v92, v93);
    v95 = (_QWORD *)*v38;
    if (!*v38)
      goto LABEL_67;
    if (!v95[2])
      goto LABEL_29;
    swift_bridgeObjectRetain();
    v96 = (uint64_t)v157;
    v97 = sub_20CF752DC((uint64_t)v157);
    if ((v98 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v6 = v163;
      v90 = (uint64_t)v146;
LABEL_29:
      (*(void (**)(char *, uint64_t))(v164 + 8))(v157, v6);
      goto LABEL_30;
    }
    v99 = *(id *)(v95[7] + 8 * v97);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v96, v163);
    v100 = v141;
    sub_20CF619A0(v158, v141);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v101 = v160;
      sub_20CF619E4(v100, v160, type metadata accessor for RecognizedItem.Barcode);
      v102 = *(id *)&v154[*(int *)(v148 + 20)];
      v103 = v101;
      v104 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      v105 = v159;
      sub_20CF619E4(v100, v159, type metadata accessor for RecognizedItem.Text);
      v102 = *(id *)(v161 + *(int *)(v147 + 20));
      v103 = v105;
      v104 = type metadata accessor for RecognizedItem.Text;
    }
    sub_20CF61A28(v103, v104);
    v90 = (uint64_t)v146;
    objc_msgSend(v99, sel_animateToQuad_, v102);

    v6 = v163;
    v19 = v145;
LABEL_30:
    v41 = v158;
    sub_20CF61A28(v158, type metadata accessor for RecognizedItem);
    v88 += v89;
    if (--v87)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
LABEL_42:
  result = v139;
  v106 = *(_QWORD *)(v139 + 16);
  v107 = (uint64_t)v155;
  if (v106)
  {
    v108 = v139 + ((*(unsigned __int8 *)(v140 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v140 + 80));
    v109 = *(_QWORD *)(v140 + 72);
    swift_bridgeObjectRetain();
    v110 = (uint64_t)v142;
    v111 = v156;
    while (1)
    {
      sub_20CF619A0(v108, v111);
      sub_20CF619A0(v111, v107);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v112 = v107;
        v113 = v160;
        v114 = v160;
        v115 = type metadata accessor for RecognizedItem.Barcode;
      }
      else
      {
        v112 = v107;
        v113 = v159;
        v114 = v159;
        v115 = type metadata accessor for RecognizedItem.Text;
      }
      sub_20CF619E4(v112, v114, v115);
      v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 16);
      v116(v110, v113, v6);
      sub_20CF61A28(v113, v115);
      v117 = (_QWORD *)*v38;
      if (!*v38)
        goto LABEL_68;
      v107 = (uint64_t)v155;
      if (v117[2])
      {
        swift_bridgeObjectRetain();
        v118 = sub_20CF752DC(v110);
        if ((v119 & 1) != 0)
        {
          v120 = (uint64_t)v19;
          v121 = *(id *)(v117[7] + 8 * v118);
          swift_bridgeObjectRelease();
          v122 = v163;
          v123 = v110;
          v124 = *(void (**)(uint64_t, uint64_t))(v164 + 8);
          v124(v123, v163);
          objc_msgSend(v121, sel_removeFromSuperview);
          sub_20CF619A0(v156, v120);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v125 = v120;
            v126 = v160;
            v127 = v160;
            v128 = type metadata accessor for RecognizedItem.Barcode;
          }
          else
          {
            v125 = v120;
            v126 = v159;
            v127 = v159;
            v128 = type metadata accessor for RecognizedItem.Text;
          }
          sub_20CF619E4(v125, v127, v128);
          v116(v149, v126, v122);
          sub_20CF61A28(v126, v128);
          swift_beginAccess();
          if (!*v38)
            goto LABEL_71;
          swift_bridgeObjectRetain();
          v129 = sub_20CF752DC(v149);
          v131 = v130;
          swift_bridgeObjectRelease();
          if ((v131 & 1) != 0)
          {
            v132 = swift_isUniquelyReferenced_nonNull_native();
            v133 = *v38;
            v165 = (_QWORD *)*v38;
            *v38 = 0x8000000000000000;
            v134 = v163;
            if (!v132)
            {
              sub_20CF75ABC();
              v134 = v163;
              v133 = (uint64_t)v165;
            }
            v124(*(_QWORD *)(v133 + 48) + *(_QWORD *)(v164 + 72) * v129, v134);
            v135 = (uint64_t)v165;
            v136 = *(void **)(v165[7] + 8 * v129);
            sub_20CF7581C(v129, (uint64_t)v165);
            *v38 = v135;
            v6 = v163;
            swift_bridgeObjectRelease();
          }
          else
          {
            v136 = 0;
            v6 = v163;
          }
          v124(v149, v6);
          swift_endAccess();

          v110 = (uint64_t)v142;
          v19 = v145;
          v107 = (uint64_t)v155;
          goto LABEL_46;
        }
        swift_bridgeObjectRelease();
      }
      v6 = v163;
      (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v110, v163);
LABEL_46:
      v111 = v156;
      sub_20CF61A28(v156, type metadata accessor for RecognizedItem);
      v108 += v109;
      if (!--v106)
        return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_20CF72F78()
{
  char *v0;
  id v1;
  id *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;

  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_previewView);
  objc_msgSend(v0, sel_setView_, v1);

  v2 = (id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView];
  swift_beginAccess();
  v3 = *v2;
  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  v5 = v4;
  objc_msgSend(v4, sel_bounds);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(*v2, sel_setAutoresizingMask_, 18);
  v14 = objc_msgSend(v0, sel_view);
  if (!v14)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v15 = v14;
  objc_msgSend(v14, sel_addSubview_, *v2);

  v16 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView];
  v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18 = v17;
  objc_msgSend(v17, sel_bounds);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v16, sel_setFrame_, v20, v22, v24, v26);
  objc_msgSend(v16, sel_setAutoresizingMask_, 18);
  v27 = objc_msgSend(v0, sel_view);
  if (!v27)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v28 = v27;
  objc_msgSend(v27, sel_addSubview_, v16);

  if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] == 1)
  {
    v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF70]), sel_init);
    v30 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView;
    v31 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
    *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = v29;

    v32 = *(void **)&v0[v30];
    if (v32)
    {
      v33 = v32;
      objc_msgSend(v33, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v34 = objc_msgSend(v0, sel_view);
      if (v34)
      {
        v35 = v34;
        objc_msgSend(v34, sel_addSubview_, v33);

        goto LABEL_9;
      }
LABEL_18:
      __break(1u);
      return;
    }
  }
LABEL_9:
  if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] == 1)
  {
    if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] == 1)
    {
      v36 = &v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID];
      swift_beginAccess();
      *(_QWORD *)v36 = MEMORY[0x24BEE4B00];
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_msgSend(*v2, sel_bounds);
      v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF78]), sel_initWithFrame_, v37, v38, v39, v40);
      objc_msgSend(v41, sel_setAutoresizingMask_, 18);
      objc_msgSend(*v2, sel_addSubview_, v41);
      objc_msgSend(v41, sel_setSpotlightBlurRadius_, 20.0);
      objc_msgSend(v41, sel_setInvertedShadowAlpha_, 0.25);
      v42 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView];
      *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = v41;

    }
  }
}

void sub_20CF7334C()
{
  char *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  objc_super v23;

  v1 = v0;
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v23, sel_viewDidLoad);
  v2 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499C208);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_20CF79CD0;
    v4 = v2;
    v5 = objc_msgSend(v4, sel_widthAnchor);
    v6 = objc_msgSend(v1, sel_view);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, sel_widthAnchor);

      v9 = objc_msgSend(v5, sel_constraintLessThanOrEqualToAnchor_multiplier_, v8, 0.666666667);
      *(_QWORD *)(v3 + 32) = v9;
      v10 = objc_msgSend(v4, sel_centerXAnchor);
      v11 = objc_msgSend(v1, sel_view);
      if (v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v11, sel_centerXAnchor);

        v14 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v13);
        *(_QWORD *)(v3 + 40) = v14;
        v15 = objc_msgSend(v4, sel_topAnchor);
        v16 = objc_msgSend(v1, sel_view);
        if (v16)
        {
          v17 = v16;
          v18 = (void *)objc_opt_self();
          v19 = objc_msgSend(v17, sel_safeAreaLayoutGuide);

          v20 = objc_msgSend(v19, sel_topAnchor);
          v21 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v20, 20.0);

          *(_QWORD *)(v3 + 48) = v21;
          sub_20CF78A6C();
          sub_20CF67D50(0, (unint64_t *)&unk_25499C210);
          v22 = (void *)sub_20CF78A54();
          swift_bridgeObjectRelease();
          objc_msgSend(v18, sel_activateConstraints_, v22);

          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

id sub_20CF73634(char a1)
{
  char *v1;
  void *v3;
  char *v4;
  id result;
  uint64_t v6;
  uint64_t ObjectType;
  char *v8;
  char v9;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1 & 1);
  v3 = (void *)objc_opt_self();
  if (objc_msgSend(v3, sel_isCameraRestricted))
  {
    v4 = &v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
    swift_beginAccess();
    result = (id)MEMORY[0x212B99358](v4);
    if (!result)
      return result;
    v6 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType();
    v9 = 1;
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, sel_isSupported) & 1) != 0)
    return objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_startRunning);
  v8 = &v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
  swift_beginAccess();
  result = (id)MEMORY[0x212B99358](v8);
  if (result)
  {
    v6 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v9 = 0;
LABEL_8:
    (*(void (**)(char *, char *, uint64_t, uint64_t))(v6 + 48))(v1, &v9, ObjectType, v6);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_20CF737B4(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v5, sel_viewDidDisappear_, a1 & 1);
  sub_20CF74AE0();
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning);
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView], sel_hideGuidance);
  v3 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer], sel_invalidate);
  v4 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = 0;

}

id sub_20CF7388C()
{
  char *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v2, sel_removeFromParentViewController);
  sub_20CF74AE0();
  return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning);
}

void sub_20CF73944()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[6];

  v1 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer))
  {
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView))
    {
      v2 = (void *)objc_opt_self();
      v3 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v7[4] = sub_20CF787B0;
      v7[5] = v3;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 1107296256;
      v7[2] = sub_20CF6E720;
      v7[3] = &block_descriptor_89;
      v4 = _Block_copy(v7);
      swift_release();
      v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v4, 3.0);
      _Block_release(v4);
      v6 = *(void **)(v0 + v1);
      *(_QWORD *)(v0 + v1) = v5;

    }
  }
}

uint64_t sub_20CF73A48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v3 = sub_20CF789C4();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_20CF789DC();
  v7 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v10 = (void *)sub_20CF78B44();
  v11 = swift_allocObject();
  swift_beginAccess();
  v12 = (void *)MEMORY[0x212B99358](a2 + 16);
  swift_unknownObjectWeakInit();

  aBlock[4] = sub_20CF787B8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = &block_descriptor_93;
  v13 = _Block_copy(aBlock);
  swift_retain();
  sub_20CF789D0();
  v17 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v15);
  swift_release();
  return swift_release();
}

void sub_20CF73CA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x212B99358](v1);
  if (v2)
  {
    v3 = (char *)v2;
    sub_20CF67D50(0, &qword_25499C3A8);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_20CF788F8();
    swift_bridgeObjectRelease();

    v6 = *(void **)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
    if (v6)
    {
      v7 = v6;
      v8 = (void *)sub_20CF78A0C();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_showGuidanceWithText_, v8, 0x800000020CF7CDC0);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v9 = *(void **)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer];
    *(_QWORD *)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;

  }
}

void sub_20CF73E78(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_20CF73EC8(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  unsigned int v27;
  uint64_t v28;
  uint64_t ObjectType;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;

  v2 = v1;
  v59 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x24BDAC7A8](v59);
  v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x24BDAC7A8](v58);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = type metadata accessor for RecognizedItem(0);
  v8 = *(_QWORD *)(v62 - 8);
  v9 = MEMORY[0x24BDAC7A8](v62);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v53 - v12;
  v14 = objc_msgSend(v1, sel_view);
  objc_msgSend(a1, sel_locationInView_, v14);
  v16 = v15;
  v18 = v17;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_setInterestPoint_, v16, v18);
  v19 = *(_QWORD *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems];
  v20 = *(_QWORD *)(v19 + 16);
  if (v20)
  {
    v53 = *(_QWORD *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems];
    v54 = v2;
    v21 = &v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
    v22 = v19 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    swift_bridgeObjectRetain();
    v60 = v21;
    swift_beginAccess();
    v23 = *(_QWORD *)(v8 + 72);
    v56 = v5 + 64;
    v57 = v7 + 64;
    v61 = v5;
    v55 = v13;
    do
    {
      sub_20CF619A0(v22, (uint64_t)v13);
      sub_20CF619A0((uint64_t)v13, (uint64_t)v11);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_20CF619E4((uint64_t)v11, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
        v24 = *(id *)&v56[*(int *)(v59 + 20)];
        v25 = (uint64_t)v5;
        v26 = type metadata accessor for RecognizedItem.Barcode;
        v13 = v55;
      }
      else
      {
        sub_20CF619E4((uint64_t)v11, (uint64_t)v7, type metadata accessor for RecognizedItem.Text);
        v24 = *(id *)&v57[*(int *)(v58 + 20)];
        v25 = (uint64_t)v7;
        v26 = type metadata accessor for RecognizedItem.Text;
      }
      sub_20CF61A28(v25, v26);
      v27 = objc_msgSend(v24, sel_containsPoint_, v16, v18);

      if (v27 && MEMORY[0x212B99358](v60))
      {
        v28 = *((_QWORD *)v60 + 1);
        ObjectType = swift_getObjectType();
        (*(void (**)(char *, char *, uint64_t, uint64_t))(v28 + 16))(v54, v13, ObjectType, v28);
        swift_unknownObjectRelease();
      }
      sub_20CF61A28((uint64_t)v13, type metadata accessor for RecognizedItem);
      v22 += v23;
      --v20;
      v5 = v61;
    }
    while (v20);
    swift_bridgeObjectRelease();
    v2 = v54;
  }
  if ((v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] & 1) == 0)
  {
    v30 = objc_msgSend(v2, sel_view);
    if (v30)
    {
      v31 = v30;
      objc_msgSend(v30, sel_bounds);
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;

      v40 = MEMORY[0x212B98ED8](v16, v18, v33, v35, v37, v39);
      v41 = MEMORY[0x212B98EE4](v40);
      v43 = v42;
      v44 = *(void **)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor];
      if (v44)
      {
        v45 = v44;
        v46 = objc_msgSend(v45, sel_configuration);
        objc_msgSend(v46, sel_setComparisonPoint_, v41, v43);
        objc_msgSend(v45, sel_setConfiguration_, v46);

      }
      v47 = *(void **)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor];
      if (v47)
      {
        v48 = v47;
        v49 = objc_msgSend(v48, sel_configuration);
        objc_msgSend(v49, sel_setComparisonPoint_, v41, v43);
        objc_msgSend(v48, sel_setConfiguration_, v49);

      }
      v50 = *(void **)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor];
      if (v50)
      {
        v51 = v50;
        v52 = objc_msgSend(v51, sel_configuration);
        objc_msgSend(v52, sel_setComparisonPoint_, v41, v43);
        objc_msgSend(v51, sel_setConfiguration_, v52);

      }
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_20CF743FC(void *a1)
{
  uint64_t v1;
  id result;
  uint64_t v4;
  double v5;
  double v6;

  result = objc_msgSend(a1, sel_state);
  if (result == (id)2)
  {
    v5 = *(double *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom);
    objc_msgSend(a1, sel_scale);
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setZoomFactor_, v5 * v6);
  }
  else if (result == (id)1)
  {
    result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom) = v4;
  }
  return result;
}

uint64_t sub_20CF744F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v1[4] = sub_20CF78AC0();
  v1[5] = sub_20CF78AB4();
  v1[6] = sub_20CF78A90();
  v1[7] = v2;
  return swift_task_switch();
}

uint64_t sub_20CF74568()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_25499BD80 != -1)
    swift_once();
  v1 = sub_20CF789B8();
  __swift_project_value_buffer(v1, (uint64_t)qword_25499C0A0);
  v2 = sub_20CF789A0();
  v3 = sub_20CF78B38();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CF5F000, v2, v3, "Starting capturePhoto()", v4, 2u);
    MEMORY[0x212B992D4](v4, -1, -1);
  }
  v5 = v0[3];

  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_capturePhoto);
  v0[8] = sub_20CF78AB4();
  v6 = swift_task_alloc();
  v0[9] = v6;
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (_QWORD *)swift_task_alloc();
  v0[10] = v7;
  sub_20CF67D50(0, &qword_25499C220);
  *v7 = v0;
  v7[1] = sub_20CF74708;
  return sub_20CF78C40();
}

uint64_t sub_20CF74708()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_20CF7477C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20CF747B0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CF747F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  unint64_t *v12;
  unint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C398);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25499BD80 != -1)
    swift_once();
  v8 = sub_20CF789B8();
  __swift_project_value_buffer(v8, (uint64_t)qword_25499C0A0);
  v9 = sub_20CF789A0();
  v10 = sub_20CF78B38();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_20CF5F000, v9, v10, "Appending continuation for capturePhoto()", v11, 2u);
    MEMORY[0x212B992D4](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v12 = (unint64_t *)(a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions);
  swift_beginAccess();
  v13 = *v12;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v12 = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v13 = sub_20CF74D54(0, *(_QWORD *)(v13 + 16) + 1, 1, v13, &qword_25499C3A0, &qword_25499C398);
    *v12 = v13;
  }
  v16 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 24);
  if (v16 >= v15 >> 1)
  {
    v13 = sub_20CF74D54(v15 > 1, v16 + 1, 1, v13, &qword_25499C3A0, &qword_25499C398);
    *v12 = v13;
  }
  *(_QWORD *)(v13 + 16) = v16 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v16, v7, v4);
  return swift_endAccess();
}

void sub_20CF74A14()
{
  uint64_t v0;
  void *v1;
  char v2;
  char *v3;
  void *v4;

  v1 = (void *)objc_opt_self();
  if (!objc_msgSend(v1, sel_isSupported))
  {
    v2 = 0;
    goto LABEL_5;
  }
  if ((objc_msgSend(v1, sel_isCameraRestricted) & 1) != 0)
  {
    v2 = 1;
LABEL_5:
    sub_20CF76F88();
    swift_allocError();
    *v3 = v2;
    swift_willThrow();
    return;
  }
  v4 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  if ((objc_msgSend(v4, sel_isProcessing) & 1) == 0)
  {
    objc_msgSend(v4, sel_startProcessing);
    sub_20CF73944();
  }
}

uint64_t sub_20CF74AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(char *, unint64_t, uint64_t);
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C230);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_stopProcessing);
  v5 = v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations;
  swift_beginAccess();
  v6 = *(_QWORD *)(*(_QWORD *)v5 + 16);
  if (v6)
  {
    v7 = *(_QWORD *)v5 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v8 = *(_QWORD *)(v2 + 72);
    v9 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v9(v4, v7, v1);
      sub_20CF78AD8();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v7 += v8;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)v5 = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

id sub_20CF74C18()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_startRunning);
}

id sub_20CF74C30()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_stopRunning);
}

_QWORD *sub_20CF74C48(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25499C428);
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
    sub_20CF75DAC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_20CF74D54(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_20CF78BE0();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_20CF76AAC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_20CF74F60(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499BFA0);
  v10 = *(_QWORD *)(type metadata accessor for RecognizedItem(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_20CF78BE0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for RecognizedItem(0) - 8);
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
    sub_20CF78698(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_20CF75168(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_20CF74F60(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for RecognizedItem(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

unint64_t sub_20CF752DC(uint64_t a1)
{
  uint64_t v2;

  sub_20CF78934();
  sub_20CF62FC4(&qword_25499BD88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_20CF789E8();
  return sub_20CF75348(a1, v2);
}

unint64_t sub_20CF75348(uint64_t a1, uint64_t a2)
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
  v5 = sub_20CF78934();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      sub_20CF62FC4(&qword_25499C3C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_20CF78A00();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_20CF75488(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
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
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_20CF78934();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C3B0);
  v42 = a2;
  v10 = sub_20CF78C10();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
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
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
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
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_20CF62FC4(&qword_25499BD88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_20CF789E8();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
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
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

unint64_t sub_20CF7581C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_20CF78934();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_20CF78BB0();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_20CF62FC4(&qword_25499BD88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_20CF789E8();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_20CF75ABC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_20CF78934();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499C3B0);
  v24 = v0;
  v5 = *v0;
  v6 = sub_20CF78C04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_20CF75CE4@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (result < 0 || 1 << *(_BYTE *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a3 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    v4 = *(_QWORD *)(a3 + 48) + 32 * result;
    v5 = *(_QWORD *)(v4 + 8);
    v6 = *(_BYTE *)(v4 + 16);
    v7 = *(_QWORD *)(v4 + 24);
    *(_BYTE *)a4 = *(_BYTE *)v4;
    *(_QWORD *)(a4 + 8) = v5;
    *(_BYTE *)(a4 + 16) = v6;
    *(_QWORD *)(a4 + 24) = v7;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_20CF75D74(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

char *sub_20CF75DAC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_20CF78C1C();
  __break(1u);
  return result;
}

uint64_t sub_20CF75E94(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t ObjectType;
  char v13;

  v2 = a1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView);
  if (v3)
  {
    if (a1 - 2 < 2 || a1 > 1)
    {
      objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    }
    else
    {
      sub_20CF67D50(0, &qword_25499C3A8);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v5 = (void *)objc_opt_self();
      v6 = v3;
      v7 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_20CF788F8();

      v8 = (void *)sub_20CF78A0C();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_showGuidanceWithText_, v8, 0x800000020CF7CD40);

    }
  }
  v9 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate;
  swift_beginAccess();
  result = MEMORY[0x212B99358](v9);
  if (result)
  {
    v11 = *(_QWORD *)(v9 + 8);
    if (v2 >= 4)
      LOBYTE(v2) = 0;
    ObjectType = swift_getObjectType();
    v13 = v2;
    (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v11 + 16))(v1, &v13, ObjectType, v11);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_20CF76068(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_20CF74D54(isUniquelyReferenced_nonNull_native, v11, 1, v4, &qword_25499C3A0, &qword_25499C398);
  }
  v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25499C398) - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

void sub_20CF76224(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint8_t *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void (*v50)(char *, unint64_t, uint64_t);
  uint8_t *v51;
  uint8_t *v52;
  id v53;
  uint64_t v54;
  id v55;
  char *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, unint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v3 = v2;
  v63 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C390);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499C398);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25499BD80 != -1)
    swift_once();
  v13 = sub_20CF789B8();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_25499C0A0);
  v15 = a1;
  v16 = a2;
  v17 = v15;
  v18 = a2;
  v60 = (void (*)(char *, unint64_t, uint64_t))v14;
  v19 = sub_20CF789A0();
  v20 = sub_20CF78B38();
  if (os_log_type_enabled(v19, v20))
  {
    v54 = v3;
    v56 = v8;
    v57 = v9;
    v58 = v12;
    v59 = v10;
    v21 = swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412546;
    v62 = (uint64_t)v17;
    v23 = v17;
    sub_20CF78B74();
    v55 = v17;
    *v22 = v17;

    *(_WORD *)(v21 + 12) = 2112;
    if (a2)
    {
      v24 = a2;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v62 = v25;
      sub_20CF78B74();
    }
    else
    {
      v62 = 0;
      sub_20CF78B74();
      v25 = 0;
    }
    v22[1] = v25;

    _os_log_impl(&dword_20CF5F000, v19, v20, "Received callback for capturePhoto() with image:%@ error:%@", (uint8_t *)v21, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499C388);
    swift_arrayDestroy();
    MEMORY[0x212B992D4](v22, -1, -1);
    MEMORY[0x212B992D4](v21, -1, -1);

    v9 = v57;
    v12 = v58;
    v10 = v59;
    v17 = v55;
    v8 = v56;
    v3 = v54;
  }
  else
  {

  }
  v26 = v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v26 + 16))
  {
    v27 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v28 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    v28(v12, *(_QWORD *)v26 + v27, v9);
    if (a2)
    {
      v57 = v27;
      v29 = a2;
      v30 = a2;
      v31 = a2;
      v32 = sub_20CF789A0();
      v33 = sub_20CF78B2C();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = swift_slowAlloc();
        v59 = v10;
        v35 = (uint8_t *)v34;
        v36 = swift_slowAlloc();
        v58 = v12;
        v56 = (char *)v36;
        v60 = v28;
        *(_DWORD *)v35 = 138412290;
        v37 = a2;
        v38 = v8;
        v39 = v9;
        v40 = _swift_stdlib_bridgeErrorToNSError();
        v61 = v40;
        v28 = v60;
        sub_20CF78B74();
        v41 = v56;
        *(_QWORD *)v56 = v40;
        v9 = v39;
        v8 = v38;

        _os_log_impl(&dword_20CF5F000, v32, v33, "capturePhoto() error %@", v35, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499C388);
        swift_arrayDestroy();
        v12 = v58;
        MEMORY[0x212B992D4](v41, -1, -1);
        v42 = v35;
        v10 = v59;
        MEMORY[0x212B992D4](v42, -1, -1);
      }
      else
      {

      }
      v61 = (uint64_t)a2;
      sub_20CF78A9C();
      v27 = v57;
    }
    else
    {
      v46 = v17;
      v47 = sub_20CF789A0();
      v48 = sub_20CF78B38();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v57 = v27;
        v50 = v28;
        v51 = v49;
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_20CF5F000, v47, v48, "capturePhoto() success. Calling continuation.", v49, 2u);
        v52 = v51;
        v28 = v50;
        v27 = v57;
        MEMORY[0x212B992D4](v52, -1, -1);
      }

      v61 = (uint64_t)v46;
      v53 = v46;
      sub_20CF78AA8();
    }
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v26 + 16))
    {
      v28(v8, *(_QWORD *)v26 + v27, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
      sub_20CF78618((uint64_t)v8, &qword_25499C390);
      if (*(_QWORD *)(*(_QWORD *)v26 + 16))
      {
        sub_20CF76068(0, 1);
        swift_endAccess();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  v43 = sub_20CF789A0();
  v44 = sub_20CF78B2C();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_20CF5F000, v43, v44, "Unexpected error. Missing continuation for capturePhoto()", v45, 2u);
    MEMORY[0x212B992D4](v45, -1, -1);
  }

}

uint64_t sub_20CF76880()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD aBlock[6];

  v0 = sub_20CF789C4();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v13 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20CF789DC();
  v4 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF67D50(0, &qword_25499C368);
  v7 = (void *)sub_20CF78B44();
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_20CF784C0;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF6A5F4;
  aBlock[3] = &block_descriptor_71;
  v9 = _Block_copy(aBlock);
  swift_retain();
  sub_20CF789D0();
  v14 = MEMORY[0x24BEE4AF8];
  sub_20CF62FC4(&qword_25499C370, v1, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499C378);
  sub_20CF78594(&qword_25499C380, &qword_25499C378, MEMORY[0x24BEE12C8]);
  sub_20CF78BA4();
  MEMORY[0x212B98D64](0, v6, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_20CF76AAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

void sub_20CF76BC4()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  v1 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v2 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  v3 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF50]), sel_init);
  v4 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v6 = &v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v7 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  v8 = (void *)objc_opt_self();
  objc_msgSend(v8, sel_defaultProcessingInterval);
  *(_QWORD *)&v0[v7] = v9;
  v10 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v8, sel_defaultInfrequentProcessingInterval);
  *(_QWORD *)&v0[v10] = v11;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v4;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;

  sub_20CF78BEC();
  __break(1u);
}

uint64_t type metadata accessor for DataScannerViewController.Impl()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DataScannerViewController()
{
  return objc_opt_self();
}

id sub_20CF76E88(char *a1, char a2, char a3, char a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = *a1;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF60]), sel_init);
  objc_msgSend(v8, sel_setResolutionPreset_, qword_20CF7A2B0[v7]);
  objc_msgSend(v8, sel_setFrameRatePreset_, 1);
  if ((a2 & 1) != 0 || (a3 & 1) == 0)
  {
    if ((a2 & 1) != 0)
      v9 = 1;
    else
      v9 = 2;
    objc_msgSend(v8, sel_setCameraPreset_, v9);
  }
  objc_msgSend(v8, sel_setPreferBinning_, a4 & 1);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBFF10]), sel_initWithConfiguration_, v8);

  return v10;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20CF76F80(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF747F8(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_20CF76F88()
{
  unint64_t result;

  result = qword_25499C228;
  if (!qword_25499C228)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.ScanningUnavailable, &type metadata for DataScannerViewController.ScanningUnavailable);
    atomic_store(result, (unint64_t *)&qword_25499C228);
  }
  return result;
}

unint64_t sub_20CF76FD0()
{
  unint64_t result;

  result = qword_25499C238;
  if (!qword_25499C238)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.RecognizedDataType, &type metadata for DataScannerViewController.RecognizedDataType);
    atomic_store(result, (unint64_t *)&qword_25499C238);
  }
  return result;
}

unint64_t sub_20CF77018()
{
  unint64_t result;

  result = qword_25499C240;
  if (!qword_25499C240)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.QualityLevel, &type metadata for DataScannerViewController.QualityLevel);
    atomic_store(result, (unint64_t *)&qword_25499C240);
  }
  return result;
}

unint64_t sub_20CF77060()
{
  unint64_t result;

  result = qword_25499C248;
  if (!qword_25499C248)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.TextContentType, &type metadata for DataScannerViewController.TextContentType);
    atomic_store(result, (unint64_t *)&qword_25499C248);
  }
  return result;
}

unint64_t sub_20CF770A8()
{
  unint64_t result;

  result = qword_25499C250;
  if (!qword_25499C250)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.ScanningUnavailable, &type metadata for DataScannerViewController.ScanningUnavailable);
    atomic_store(result, (unint64_t *)&qword_25499C250);
  }
  return result;
}

unint64_t sub_20CF770F0()
{
  unint64_t result;

  result = qword_25499C258;
  if (!qword_25499C258)
  {
    result = MEMORY[0x212B99268](&protocol conformance descriptor for DataScannerViewController.SceneStabilityState, &type metadata for DataScannerViewController.SceneStabilityState);
    atomic_store(result, (unint64_t *)&qword_25499C258);
  }
  return result;
}

uint64_t sub_20CF77134@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate, a2);
}

uint64_t sub_20CF77140(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

id sub_20CF7714C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

__n128 sub_20CF771A0@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = *a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 32) = v4;
  return result;
}

id sub_20CF771FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
  *a2 = v4;
  return result;
}

id sub_20CF77238(double *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setZoomFactor_, *a1);
}

uint64_t sub_20CF7725C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x212B99358](v4);
  v6 = *(_QWORD *)(v4 + 8);
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_20CF772BC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t keypath_setTm(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = *a2 + *a5;
  swift_beginAccess();
  *(_QWORD *)(v6 + 8) = v5;
  return swift_unknownObjectWeakAssign();
}

double sub_20CF77324@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm_0(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval, a2);
}

id sub_20CF77330(double *a1)
{
  return sub_20CF6C46C(*a1);
}

double sub_20CF77354@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm_0(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval, a2);
}

double keypath_get_11Tm_0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

id sub_20CF773AC(double *a1)
{
  return sub_20CF6C53C(*a1);
}

id sub_20CF773D0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isTorchOn);
  *a2 = (_BYTE)result;
  return result;
}

id sub_20CF7740C(unsigned __int8 *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setTorchOn_, *a1);
}

uint64_t sub_20CF77430@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CF77488@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_20CF774D8(unsigned __int8 *a1)
{
  sub_20CF6CB00(*a1);
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScannerDidZoom(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didTapOn:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didAdd:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didUpdate:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didRemove:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:becameUnavailableWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneStabilityState(_:newState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneLuminosity(_:newLuminosity:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for DataScannerViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static DataScannerViewController.isSupported.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of static DataScannerViewController.isAvailable.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 448))();
}

uint64_t dispatch thunk of static DataScannerViewController.supportedTextRecognitionLanguages.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 456))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of DataScannerViewController.overlayContainerView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.setter(uint64_t a1)
{
  _QWORD *v1;
  char v2;
  uint64_t (*v3)(_OWORD *);
  __int128 v4;
  _OWORD v6[2];
  char v7;

  v2 = *(_BYTE *)(a1 + 32);
  v3 = *(uint64_t (**)(_OWORD *))((*MEMORY[0x24BEE4EA0] & *v1) + 0x3B8);
  v4 = *(_OWORD *)(a1 + 16);
  v6[0] = *(_OWORD *)a1;
  v6[1] = v4;
  v7 = v2;
  return v3(v6);
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of DataScannerViewController.isScanning.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of DataScannerViewController.recognizedItems.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of DataScannerViewController.minZoomFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of DataScannerViewController.maxZoomFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x440))();
}

uint64_t dispatch thunk of DataScannerViewController.hasTorch.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x448))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x458))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x460))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x468))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1184))();
}

uint64_t dispatch thunk of DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1192))();
}

uint64_t dispatch thunk of DataScannerViewController.capturePhoto()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x560);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20CF779A0;
  return v5();
}

uint64_t sub_20CF779A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of DataScannerViewController.startScanning()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x568))();
}

uint64_t dispatch thunk of DataScannerViewController.stopScanning()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x570))();
}

uint64_t dispatch thunk of DataScannerViewController.startCamera()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x578))();
}

uint64_t dispatch thunk of DataScannerViewController.stopCamera()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x580))();
}

uint64_t destroy for DataScannerViewController.RecognizedDataType()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.RecognizedDataType(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataScannerViewController.RecognizedDataType(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.RecognizedDataType()
{
  return &type metadata for DataScannerViewController.RecognizedDataType;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.QualityLevel(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DataScannerViewController.QualityLevel(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CF77D24 + 4 * byte_20CF79CE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CF77D58 + 4 * byte_20CF79CE0[v4]))();
}

uint64_t sub_20CF77D58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF77D60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CF77D68);
  return result;
}

uint64_t sub_20CF77D74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CF77D7CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CF77D80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF77D88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF77D94(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20CF77D9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.QualityLevel()
{
  return &type metadata for DataScannerViewController.QualityLevel;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.TextContentType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DataScannerViewController.TextContentType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_20CF77E90 + 4 * byte_20CF79CEF[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_20CF77EC4 + 4 * byte_20CF79CEA[v4]))();
}

uint64_t sub_20CF77EC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF77ECC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CF77ED4);
  return result;
}

uint64_t sub_20CF77EE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CF77EE8);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_20CF77EEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF77EF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.TextContentType()
{
  return &type metadata for DataScannerViewController.TextContentType;
}

ValueMetadata *type metadata accessor for DataScannerViewController.ScanningUnavailable()
{
  return &type metadata for DataScannerViewController.ScanningUnavailable;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.SceneStabilityState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DataScannerViewController.SceneStabilityState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CF78004 + 4 * byte_20CF79CF9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_20CF78038 + 4 * byte_20CF79CF4[v4]))();
}

uint64_t sub_20CF78038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF78040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CF78048);
  return result;
}

uint64_t sub_20CF78054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CF7805CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_20CF78060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF78068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.SceneStabilityState()
{
  return &type metadata for DataScannerViewController.SceneStabilityState;
}

uint64_t _s9VisionKit25DataScannerViewControllerC18RecognizedDataTypeV11RawDataTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s9VisionKit25DataScannerViewControllerC18RecognizedDataTypeV11RawDataTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CF78160 + 4 * byte_20CF79D03[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20CF78194 + 4 * byte_20CF79CFE[v4]))();
}

uint64_t sub_20CF78194(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF7819C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CF781A4);
  return result;
}

uint64_t sub_20CF781B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CF781B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20CF781BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF781C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20CF781D0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.RecognizedDataType.RawDataType()
{
  return &type metadata for DataScannerViewController.RecognizedDataType.RawDataType;
}

ValueMetadata *type metadata accessor for DataScannerViewController.DataType()
{
  return &type metadata for DataScannerViewController.DataType;
}

unint64_t sub_20CF78200()
{
  unint64_t result;

  result = qword_25499C340;
  if (!qword_25499C340)
  {
    result = MEMORY[0x212B99268](&unk_20CF7A0E0, &type metadata for DataScannerViewController.DataType);
    atomic_store(result, (unint64_t *)&qword_25499C340);
  }
  return result;
}

unint64_t sub_20CF78248()
{
  unint64_t result;

  result = qword_25499C348;
  if (!qword_25499C348)
  {
    result = MEMORY[0x212B99268](&unk_20CF7A0B0, &type metadata for DataScannerViewController.DataType);
    atomic_store(result, (unint64_t *)&qword_25499C348);
  }
  return result;
}

unint64_t sub_20CF78290()
{
  unint64_t result;

  result = qword_25499C350;
  if (!qword_25499C350)
  {
    result = MEMORY[0x212B99268](&unk_20CF7A108, &type metadata for DataScannerViewController.DataType);
    atomic_store(result, (unint64_t *)&qword_25499C350);
  }
  return result;
}

unint64_t sub_20CF782D8()
{
  unint64_t result;

  result = qword_25499C358;
  if (!qword_25499C358)
  {
    result = MEMORY[0x212B99268](&unk_20CF7A140, &type metadata for DataScannerViewController.DataType);
    atomic_store(result, (unint64_t *)&qword_25499C358);
  }
  return result;
}

unint64_t sub_20CF78320()
{
  unint64_t result;

  result = qword_25499C360;
  if (!qword_25499C360)
  {
    result = MEMORY[0x212B99268](&unk_20CF7A280, &type metadata for DataScannerViewController.RecognizedDataType.RawDataType);
    atomic_store(result, (unint64_t *)&qword_25499C360);
  }
  return result;
}

uint64_t sub_20CF78364()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20CF78388()
{
  return objectdestroy_24Tm();
}

void sub_20CF78390()
{
  uint64_t v0;

  sub_20CF6B7B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
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

uint64_t sub_20CF783B4()
{
  return objectdestroy_24Tm();
}

void sub_20CF783BC()
{
  uint64_t v0;

  sub_20CF6B42C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t sub_20CF783DC()
{
  return objectdestroy_24Tm();
}

void sub_20CF783E4()
{
  uint64_t v0;

  sub_20CF6B42C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

uint64_t sub_20CF78404()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

void sub_20CF78440()
{
  uint64_t v0;

  sub_20CF6AFAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_20CF7844C()
{
  return objectdestroy_24Tm();
}

void sub_20CF78454()
{
  uint64_t v0;

  sub_20CF6AA0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_20CF78460()
{
  return objectdestroy_24Tm();
}

void sub_20CF78468()
{
  uint64_t v0;

  sub_20CF6A8B0(*(_QWORD *)(v0 + 16), *(double *)(v0 + 32));
}

uint64_t sub_20CF78474()
{
  return objectdestroy_24Tm();
}

uint64_t objectdestroy_24Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_20CF784B4()
{
  uint64_t v0;

  sub_20CF6A578(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_20CF784C0()
{
  uint64_t v0;

  sub_20CF6B8F0(v0);
}

uint64_t sub_20CF784C8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_20CF784EC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_setReticleRect_angle_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56));
  return objc_msgSend(v1, sel_setReticleAlpha_, 1.0);
}

uint64_t sub_20CF78534()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_20CF78558()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_collapseReticleRect);
  return objc_msgSend(v1, sel_setReticleAlpha_, 0.0);
}

uint64_t sub_20CF78594(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212B99268](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20CF785D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CF78618(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20CF78654(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CF78698(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for RecognizedItem(0) - 8);
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
  result = sub_20CF78C1C();
  __break(1u);
  return result;
}

uint64_t sub_20CF787B0(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF73A48(a1, v1);
}

void sub_20CF787B8()
{
  uint64_t v0;

  sub_20CF73CA0(v0);
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

void sub_20CF78800(uint64_t a1)
{
  uint64_t v1;

  sub_20CF6E724(a1, v1, (void (*)(uint64_t))sub_20CF6F954);
}

void sub_20CF78820(uint64_t a1)
{
  uint64_t v1;

  sub_20CF6E724(a1, v1, (void (*)(uint64_t))sub_20CF6E910);
}

void sub_20CF78840(void *a1)
{
  uint64_t v1;

  sub_20CF6E78C(a1, v1);
}

uint64_t sub_20CF788EC()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_20CF788F8()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_20CF78904()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20CF78910()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20CF7891C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_20CF78928()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_20CF78934()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20CF78940()
{
  return MEMORY[0x24BDCF320]();
}

uint64_t sub_20CF7894C()
{
  return MEMORY[0x24BDCF358]();
}

uint64_t sub_20CF78958()
{
  return MEMORY[0x24BDCF368]();
}

uint64_t sub_20CF78964()
{
  return MEMORY[0x24BDCF378]();
}

uint64_t sub_20CF78970()
{
  return MEMORY[0x24BDCF3B0]();
}

uint64_t sub_20CF7897C()
{
  return MEMORY[0x24BDCF3C8]();
}

uint64_t sub_20CF78988()
{
  return MEMORY[0x24BDCF420]();
}

uint64_t sub_20CF78994()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_20CF789A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20CF789AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20CF789B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20CF789C4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20CF789D0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20CF789DC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20CF789E8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_20CF789F4()
{
  return MEMORY[0x24BEE0770]();
}

uint64_t sub_20CF78A00()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20CF78A0C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20CF78A18()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20CF78A24()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20CF78A30()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20CF78A3C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20CF78A48()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20CF78A54()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20CF78A60()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20CF78A6C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20CF78A78()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20CF78A84()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20CF78A90()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20CF78A9C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_20CF78AA8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20CF78AB4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20CF78AC0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20CF78ACC()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_20CF78AD8()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_20CF78AE4()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_20CF78AF0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_20CF78AFC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_20CF78B08()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_20CF78B14()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_20CF78B20()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_20CF78B2C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20CF78B38()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20CF78B44()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20CF78B50()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_20CF78B5C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20CF78B68()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_20CF78B74()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20CF78B80()
{
  return MEMORY[0x24BEE2238]();
}

uint64_t sub_20CF78B8C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_20CF78B98()
{
  return MEMORY[0x24BEE22B8]();
}

uint64_t sub_20CF78BA4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20CF78BB0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20CF78BBC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_20CF78BC8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_20CF78BD4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20CF78BE0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20CF78BEC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20CF78BF8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20CF78C04()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20CF78C10()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20CF78C1C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20CF78C28()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20CF78C34()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20CF78C40()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_20CF78C4C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_20CF78C58()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20CF78C64()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20CF78C70()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20CF78C7C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20CF78C88()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20CF78C94()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20CF78CA0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20CF78CAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t VKCDistanceSquared()
{
  return MEMORY[0x24BEBFFB8]();
}

uint64_t VKCFlipPoint()
{
  return MEMORY[0x24BEBFFC0]();
}

uint64_t VKCNormalizedPointInRect()
{
  return MEMORY[0x24BEBFFC8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

